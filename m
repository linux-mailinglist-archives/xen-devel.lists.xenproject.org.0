Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50927347798
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100938.192635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1ud-0001am-29; Wed, 24 Mar 2021 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100938.192635; Wed, 24 Mar 2021 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1uc-0001aN-Uw; Wed, 24 Mar 2021 11:42:58 +0000
Received: by outflank-mailman (input) for mailman id 100938;
 Wed, 24 Mar 2021 11:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylg3=IW=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lP1ub-0001aI-Q1
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:42:57 +0000
Received: from MTA-05-3.privateemail.com (unknown [68.65.122.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53083611-c958-4e67-851d-c8374f147b20;
 Wed, 24 Mar 2021 11:42:57 +0000 (UTC)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 2D8B86005F
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 07:42:56 -0400 (EDT)
Received: from mail-wr1-f42.google.com (unknown [10.20.151.215])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id ECE9860058
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 07:42:55 -0400 (EDT)
Received: by mail-wr1-f42.google.com with SMTP id j7so24123965wrd.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 04:42:55 -0700 (PDT)
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
X-Inumbo-ID: 53083611-c958-4e67-851d-c8374f147b20
X-Gm-Message-State: AOAM531E3+iYvDIuUPEeApGJYgBTy/mpBSw4zJFKdXvVhrkYXCWPlNOJ
	LxAF5mP/3y1cI+v4c9415jaJnJmhP80RPnHtRfQ=
X-Google-Smtp-Source: ABdhPJwmcjTQ2IItsyJxtG7jbpB33mUpmdoARAhY1lzctN4vFfz7XsQZ+97CkgqdBEWrsIwlf6f5DREvMFYmSebK6ys=
X-Received: by 2002:adf:efc7:: with SMTP id i7mr3004236wrp.182.1616586174664;
 Wed, 24 Mar 2021 04:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
 <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
In-Reply-To: <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 24 Mar 2021 07:42:18 -0400
X-Gmail-Original-Message-ID: <CABfawhnk1Gd-XV4MQdQHky1cX9pKMa4-UsG3cc6jtoKNAGojLA@mail.gmail.com>
Message-ID: <CABfawhnk1Gd-XV4MQdQHky1cX9pKMa4-UsG3cc6jtoKNAGojLA@mail.gmail.com>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Ian Jackson <iwj@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

> > When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
> > toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
> > addressable physical memory in the VM and for forks that have not yet been
> > unpaused that value is not going to reflect the correct max gpfn that's
> > possible to populate into the p2m. This patch fixes the issue.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > index 00ada05c10..98b14f7b0a 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct domain *d)
> >          return rc;
> >
> >      copy_tsc(cd, d);
> > +    p2m_get_hostp2m(cd)->max_mapped_pfn = p2m_get_hostp2m(d)->max_mapped_pfn;
> >
> >      return rc;
> >  }
> > --
> > 2.25.1
> >
>
> CC-ing Ian as 4.15 release manager. This patch is safe to include in
> 4.15 as it's a minor fix in a tech preview feature that's not even
> compiled by default.

Patch ping just to not forget that I would like this included in the
4.15 release.

Thanks,
Tamas

