Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0072AA3C7BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 19:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893388.1302282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoxG-0006Yj-Sc; Wed, 19 Feb 2025 18:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893388.1302282; Wed, 19 Feb 2025 18:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoxG-0006Vi-Or; Wed, 19 Feb 2025 18:37:54 +0000
Received: by outflank-mailman (input) for mailman id 893388;
 Wed, 19 Feb 2025 18:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KbSk=VK=cert.pl=pawelsr@srs-se1.protection.inumbo.net>)
 id 1tkoxF-0006Vc-6E
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 18:37:53 +0000
Received: from mx.nask.net.pl (mx.nask.net.pl [195.187.55.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f66eecf-eef0-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 19:37:51 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9f66eecf-eef0-11ef-9aa8-95dc52dad729
Date: Wed, 19 Feb 2025 19:37:47 +0100 (CET)
From: =?utf-8?Q?Pawe=C5=82?= Srokosz <pawel.srokosz@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, jgross@suse.com, 
	andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Message-ID: <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
In-Reply-To: <Z7RWdPpUde9ZoaZu@macbook.local>
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl> <Z7RWdPpUde9ZoaZu@macbook.local>
Subject: Re: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID
 card
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Thread-Topic: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
Thread-Index: 5SlVgIgzFhJBf4Y06k8mVmOTAeQAJA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=cert.pl; s=cert.pl; c=relaxed/relaxed;
 h=date:from:to:cc:message-id:references:subject:mime-version:content-type;
 bh=b8U2++DHFvhdO7OfcTueKFMA3mzytmrq0qbRzVHTMVM=;
 b=G2OYj/bJMSXQk2dsTsZENDDktAaXPneR2JtLbO3e8LqM1hMLFE311vBdfxf+xNyIOeK6BzxUBRT8
	+jkd5dhrAgKhK8c/uyrqymVSu+tj8Yt1wiTklIJ6s4y3h0JpjERrj1rdtZKWLGc6fsbBRvkR4F9W
	dtdqgBKlbDzinTPC2b5KI6YtDc2YqsuRp4hhQpSrSi+iFWMI9w9vEs1yQ6mIgg4CYnbET9cY7BWJ
	n0qWI+yIgz4XoHzDWQThFCiUOxkJguI8U2LAH2wxtU3tO4/uYZOTw1soo9zMOMnxkkw2XlUeYKx7
	GRDNeC3p74uo8FUYLFj3ISxb+NzKTsnI7YqIjg==

Hello,

> So the issue doesn't happen on debug=3Dy builds? That's unexpected.  I wo=
uld
> expect the opposite, that some code in Linux assumes that pfn + 1 =3D=3D =
mfn +
> 1, and hence breaks when the relation is reversed.

It was also surprising for me but I think the key thing is that debug=3Dy
causes whole mapping to be reversed so each PFN lands on completely differe=
nt
MFN e.g. MFN=3D0x1300000 is mapped to PFN=3D0x20e50c in ndebug, but in debu=
g
it's mapped to PFN=3D0x5FFFFF. I guess that's why I can't reproduce the
problem.

> Can you see if you can reproduce with dom0-iommu=3Dstrict in the Xen comm=
and
> line?

Unfortunately, it doesn't help. But I have few more observations.

Firstly, I checked the "xen-mfndump dump-m2p" output and found that misread
blocks are mapped to suspiciously round MFNs. I have different versions of
Xen and Linux kernel on each machine and I see some coincidence.

I'm writing few huge files without Xen to ensure that they have been writte=
n
correctly (because under Xen both read and writeback is affected). Then I'm
booting to Xen, memory-mapping the files and reading each page. I see that =
when=20
block is corrupted, it is mapped on round MFN e.g. pfn=3D0x5095d9/mfn=3D0x1=
600000,=20
another on pfn=3D0x4095d9/mfn=3D0x1500000 etc.

On another machine with different Linux/Xen version these faults appear on
pfn=3D0x20e50c/mfn=3D0x1300000, pfn=3D0x30e50c/mfn=3D0x1400000 etc.

I also noticed that during read of page that is mapped to
pfn=3D0x20e50c/mfn=3D0x1300000, I'm getting these faults from DMAR:

```
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
00000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
01000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
06000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
08000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
09000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
0a000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:65:00.0] fault addr 12000=
0c000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
```

and every time I'm dropping the cache and reading this region, I'm getting
DMAR faults on few random addresses from 1200000000-120000f000 range (I gue=
ss=20
MFNs 0x1200000-120000f). MFNs 0x1200000-0x12000ff are not mapped to any PFN=
 in
Dom0 (based on xen-mfndump output.).=20

On the other hand, I'm not getting these DMAR faults while reading other re=
gions.
Also I can't trigger the bug with reversed Dom0 mapping, even if I fill the=
 page
cache with reads.

Thank you,
Pawe=C5=82

