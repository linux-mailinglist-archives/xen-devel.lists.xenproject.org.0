Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFA3B4FD1
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jun 2021 20:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147590.272218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxCsQ-0003Qa-Qm; Sat, 26 Jun 2021 18:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147590.272218; Sat, 26 Jun 2021 18:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxCsQ-0003OE-Ms; Sat, 26 Jun 2021 18:17:58 +0000
Received: by outflank-mailman (input) for mailman id 147590;
 Sat, 26 Jun 2021 18:17:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWd7=LU=kota.moe=nospam@srs-us1.protection.inumbo.net>)
 id 1lxCsN-0003O8-0p
 for xen-devel@lists.xenproject.org; Sat, 26 Jun 2021 18:17:57 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80461327-dc5e-40b9-a2bb-5413d5b94546;
 Sat, 26 Jun 2021 18:17:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so7974027wml.5
 for <xen-devel@lists.xenproject.org>; Sat, 26 Jun 2021 11:17:40 -0700 (PDT)
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
X-Inumbo-ID: 80461327-dc5e-40b9-a2bb-5413d5b94546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kota.moe; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6SbdIom3zgio+kZ6wfwDJH7rKPEfDAGy8TdscQ1Fts=;
        b=c6cU2RJcxB9treX5hi/OxkWRplBi7U9CErc1rc4z3B1uzmoMpEqqGdlY+LWXH7N5DH
         swjMX20G2YEJmG9iZ0b09BNw848w7hUZj3VyKZo8AeSMYihuCF9ZM4RA8CLuF49SbKAB
         HUiQgKLP2q3MpTKaB6Fp+44UVWbd9koTN5U9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6SbdIom3zgio+kZ6wfwDJH7rKPEfDAGy8TdscQ1Fts=;
        b=WlMih2+93c6JkzlvXv/g1/C0O1fPg8ss4Mbb/bHC6ZS777UnVGot7FtCGqik3QQgxe
         wF/7qrO2W6tmWii2o7JvrdCJMPn15zu2AMqi5+7CjAABbL4vw8MJfI+mfLZgNjQgiOe0
         NztSMJd1brfs0r5ze51vwaNVAGBDfAmfGjuk2MK8Fox6uSZKBD8MieB8k2EVWe5o7r+/
         SLk8FQN1N/ACJI//CJgcWGuWAMqW63MwmroQbccVRFyOqdUnY7hJEpJIbGw/Wa+lHXn6
         7DDR58BLvnQhKfiAhP1HOJWLRSbYC9ssp3aaUhRFHVTWsvU10qVEwP3XjbeDXsux9i0o
         q1YQ==
X-Gm-Message-State: AOAM533Hzd9fpc04HQhkOBPDfsgLrdrWnvQyyklyCWZlaQutpXxSwJJi
	+vPByK/EtQ0dUDWK02bWWBv6xO/qI936W5GGjLS0cg==
X-Google-Smtp-Source: ABdhPJxOEjtV4xly2hQKRSYOj/QdYtY37Z1yVHzjvMk45DdusPTcP6PcPe1UsAYNko+U8dIogiNwPfBjWQkq7A0F3CY=
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr17569753wmh.104.1624731459793;
 Sat, 26 Jun 2021 11:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <YMWl4UnFBAVRDnys@eldamar.lan> <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
 <2f7c7d36-b6f4-f8ab-756e-a563fa03b9e4@arm.com> <YNOCXe1cuNDNAB+Z@eldamar.lan>
In-Reply-To: <YNOCXe1cuNDNAB+Z@eldamar.lan>
From: =?UTF-8?B?4oCN5bCP5aSq?= <nospam@kota.moe>
Date: Sun, 27 Jun 2021 04:17:03 +1000
Message-ID: <CACsxjPZEMbxjiRQit7yaykL8LwHFdCg53ObCfTCdRLYV_-_Few@mail.gmail.com>
Subject: Re: Bug#989778: Regression in at least 5.10.y and mainline: Firewire
 audio interface fails to work properly (when booted under Xen)
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 989778-maintonly@bugs.debian.org, 
	Jianxiong Gao <jxgao@google.com>, Christoph Hellwig <hch@lst.de>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, 
	iommu@lists.linux-foundation.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000084412605c5af4556"

--00000000000084412605c5af4556
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jun 2021 at 04:50, Salvatore Bonaccorso <carnil@debian.org>
wrote:

> Hi Robin,
>
> On Mon, Jun 14, 2021 at 02:29:08PM +0100, Robin Murphy wrote:
> > On 2021-06-13 07:29, Salvatore Bonaccorso wrote:
> > > A user in Debian reported the above issue, which was reproducible with
> > > 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a6875ca9
> > > ("swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single") that
> > > introduced the issue.
> >
> > Sounds like it's probably the same thing as being discussed over here:
> >
> >
> https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/
>
> Thanks for the pointer, it seems that now it has been fixed upstream
> with 5f89468e2f06 ("swiotlb: manipulate orig_addr when tlb_addr has
> offset").
>

I've checked out upstream v5.13 b7050b242430f3170e0b57f5f55136e44cb8dc66
(which includes the above commit) and confirmed that my issue is now
resolved.
Now to wait for it to reach Debian :)

--00000000000084412605c5af4556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 24 Jun 2021 at 04:50, Salvatore Bonaccorso &lt;<a href=3D"ma=
ilto:carnil@debian.org">carnil@debian.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Robin,<br>
<br>
On Mon, Jun 14, 2021 at 02:29:08PM +0100, Robin Murphy wrote:<br>
&gt; On 2021-06-13 07:29, Salvatore Bonaccorso wrote:<br>
&gt; &gt; A user in Debian reported the above issue, which was reproducible=
 with<br>
&gt; &gt; 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a687=
5ca9<br>
&gt; &gt; (&quot;swiotlb: don&#39;t modify orig_addr in swiotlb_tbl_sync_si=
ngle&quot;) that<br>
&gt; &gt; introduced the issue.<br>
&gt; <br>
&gt; Sounds like it&#39;s probably the same thing as being discussed over h=
ere:<br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6=
-09fb8949d2fd@nxp.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/</a><br>
<br>
Thanks for the pointer, it seems that now it has been fixed upstream<br>
with 5f89468e2f06 (&quot;swiotlb: manipulate orig_addr when tlb_addr has<br=
>
offset&quot;).<br></blockquote><div><br></div><div>I&#39;ve checked out ups=
tream v5.13 b7050b242430f3170e0b57f5f55136e44cb8dc66 (which includes the ab=
ove commit) and confirmed that my issue is now resolved. <br></div><div>Now=
 to wait for it to reach Debian :)<br></div></div></div>

--00000000000084412605c5af4556--

