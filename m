Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC0334A6F3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101765.194828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlNC-0005Ia-UT; Fri, 26 Mar 2021 12:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101765.194828; Fri, 26 Mar 2021 12:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlNC-0005Hh-QP; Fri, 26 Mar 2021 12:15:30 +0000
Received: by outflank-mailman (input) for mailman id 101765;
 Fri, 26 Mar 2021 12:15:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbHL=IY=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lPlNB-0005HA-N8
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:15:29 +0000
Received: from MTA-12-4.privateemail.com (unknown [198.54.127.107])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fffa94fa-e358-435d-8aef-551e3cddb43c;
 Fri, 26 Mar 2021 12:15:28 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id A40E78005A
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 08:15:27 -0400 (EDT)
Received: from mail-wr1-f52.google.com (unknown [10.20.151.231])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 6DE9E800AE
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 08:15:27 -0400 (EDT)
Received: by mail-wr1-f52.google.com with SMTP id x7so5409159wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 05:15:27 -0700 (PDT)
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
X-Inumbo-ID: fffa94fa-e358-435d-8aef-551e3cddb43c
X-Gm-Message-State: AOAM5333YLN4phqFgPJjy2bbc0CN18GXn4Kgj6zZe/V3pdDHChDboCIv
	WmYHdTQtrJyL7EOr35AIE0rHZ7mSgbmnMgjZDA8=
X-Google-Smtp-Source: ABdhPJyeZh2OfJlthH8JqGbmtxakhh2aJ40t4HwlSLjvMtH3XQ7kbzbbuqsMaky3GrREd4dzOIv6ETrCiuKvkgbNI/0=
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr14368904wri.301.1616760926206;
 Fri, 26 Mar 2021 05:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
 <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com> <24669.51029.465080.822794@mariner.uk.xensource.com>
In-Reply-To: <24669.51029.465080.822794@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Mar 2021 08:14:50 -0400
X-Gmail-Original-Message-ID: <CABfawh=2rwOe=FCaoaLYOFnmbReonRJrujYjqBy-T+L_-dpfAw@mail.gmail.com>
Message-ID: <CABfawh=2rwOe=FCaoaLYOFnmbReonRJrujYjqBy-T+L_-dpfAw@mail.gmail.com>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Ian Jackson <iwj@xenproject.org>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Mar 26, 2021 at 7:37 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Tamas K Lengyel writes ("Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's max_mapped_pfn during forking"):
> > On Thu, Mar 18, 2021 at 5:36 PM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
> > >
> > > When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
> > > toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
> > > addressable physical memory in the VM and for forks that have not yet been
> > > unpaused that value is not going to reflect the correct max gpfn that's
> > > possible to populate into the p2m. This patch fixes the issue.
> ...
> > CC-ing Ian as 4.15 release manager. This patch is safe to include in
> > 4.15 as it's a minor fix in a tech preview feature that's not even
> > compiled by default.
>
> As far as I can tell this patch is lacking a maintainer review ?
>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>
> *Provided that it is committed today*  I'm not sure how likely that is.

Thanks, as I'm the sole maintainer of the code AFAIU it just needs a
Reviewed-by from someone in the community.

Tamas

