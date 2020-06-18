Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD31FF82F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwqu-0001xI-DQ; Thu, 18 Jun 2020 15:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTxy=77=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlwqs-0001x9-RU
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:53:18 +0000
X-Inumbo-ID: d3a4d750-b17b-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3a4d750-b17b-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 15:53:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id t194so6202138wmt.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7OemMlugsfNR/zOcIFRBo1G90vX4bXrh9IltK8wewwk=;
 b=BEVBEEOymBbYZSHRwJbW6pZ+M9b8NzIk7qEvgyeHBNkRj3xzaErcbByHVUvBeBVfYO
 lj+2X40Kbf8GcVXNM3JIFupwAeV2zQ5myyz9xYgumoCgIAguGm0dO4+6h+xsimZJZ9Sm
 Nyy+qaCKh5OpAbceWyR7nDGXqON3pRt9IvnAVClQgdsia6IxOKKUP7/gdUYRPCJuA78w
 CjFefFxRQwN7gCB80jAAIIT27MDf3cQuUxQ6k8m8iPENQBKT5VgyfWJMbeUqWry+r20b
 SDa67raTQcFGWyJNXMdWajsYVB0X3fp52B5i4LYJEnSGS8K9DqT13oAbb61i59BrlFpZ
 oWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7OemMlugsfNR/zOcIFRBo1G90vX4bXrh9IltK8wewwk=;
 b=NG2ERQr4ov3VhsTLCISrwcnFaOBj4G8BVLsj/3U2jKwezL7B9mo8kAelH2J/idzmL/
 H4cDt7Stno/n9GibWHVI17a49g2rrYTMWfEiRAiNutXGki8pctD7E3IygGFhDc3hLPm9
 L/j2p7RrfVGRbsNDNzIoIs+r8EFLTmwjDdk6MKIjojJVg5fCBCKF9VBb8yzOS6mMyDTV
 A554rVY/GjliL5JFHLxMj19JpcJPapcY50VjMEb3AOW44Fve+UDk9S/nrgX1afZYlJGK
 fuu6DxuKqwYaE28Hxy9k9J3Y1vl6Go1VnBY5H9F4eLuAJ/4TjbAzE5JUNGs1MSK10MSa
 wXVw==
X-Gm-Message-State: AOAM530M/voMsyeYi5KvblvTRtVmmfAg0w1/rwpkLsOdVUMHqDQ1CpRo
 oS30O+C8WNtjk7DkuU2WtXI=
X-Google-Smtp-Source: ABdhPJyEwRrV2scBIT8jVnXYBE80tA2ka4XPswQoaXNSnqJHKL0EjP1povvUU2RYTeDhzG0l4p/unw==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr4545826wmg.132.1592495597447; 
 Thu, 18 Jun 2020 08:53:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id b18sm3944314wrn.88.2020.06.18.08.53.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 08:53:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Tamas K Lengyel'" <tamas.lengyel@intel.com>
References: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
 <20200618154628.GW735@Air-de-Roger>
In-Reply-To: <20200618154628.GW735@Air-de-Roger>
Subject: RE: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Date: Thu, 18 Jun 2020 16:53:15 +0100
Message-ID: <006801d64588$94d23040$be7690c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHYIgYxVlP9Qzxyln81XR9BR28vqgI/b39iqMjRgGA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 18 June 2020 16:46
> To: Tamas K Lengyel <tamas.lengyel@intel.com>
> Cc: xen-devel@lists.xenproject.org; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>;
> Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in =
vmx_load_pdptrs instead of P2M_UNSHARE
>=20
> On Thu, Jun 18, 2020 at 07:39:04AM -0700, Tamas K Lengyel wrote:
> > While forking VMs running a small RTOS system (Zephyr) a Xen crash =
has been
> > observed due to a mm-lock order violation while copying the HVM CPU =
context
> > from the parent. This issue has been identified to be due to
> > hap_update_paging_modes first getting a lock on the gfn using =
get_gfn. This
> > call also creates a shared entry in the fork's memory map for the =
cr3 gfn. The
> > function later calls hap_update_cr3 while holding the paging_lock, =
which
> > results in the lock-order violation in vmx_load_pdptrs when it tries =
to unshare
> > the above entry when it grabs the page with the P2M_UNSHARE flag =
set.
> >
> > Since vmx_load_pdptrs only reads from the page its usage of =
P2M_UNSHARE was
> > unnecessary to start with. Using P2M_ALLOC is the appropriate flag =
to ensure
> > the p2m is properly populated.
> >
> > Note that the lock order violation is avoided because before the =
paging_lock is
> > taken a lookup is performed with P2M_ALLOC that forks the page, thus =
the second
> > lookup in vmx_load_pdptrs succeeds without having to perform the =
fork. We keep
> > P2M_ALLOC in vmx_load_pdptrs because there are code-paths leading up =
to it
> > which don't take the paging_lock and that have no previous lookup. =
Currently no
> > other code-path exists leading there with the paging_lock taken, =
thus no
> > further adjustments are necessary.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20

Release-acked-by: Paul Durrant <paul@xen.org>

> Thanks!


