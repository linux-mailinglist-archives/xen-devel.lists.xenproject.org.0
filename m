Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E278C4E9B3C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295510.502913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrR3-0001QZ-La; Mon, 28 Mar 2022 15:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295510.502913; Mon, 28 Mar 2022 15:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrR3-0001NX-II; Mon, 28 Mar 2022 15:37:37 +0000
Received: by outflank-mailman (input) for mailman id 295510;
 Mon, 28 Mar 2022 15:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgrH=UH=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nYrR2-0001AA-1t
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:37:36 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8a1869-aeac-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 17:37:35 +0200 (CEST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 0EC6C18000B4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 11:37:33 -0400 (EDT)
Received: from mail-oa1-f52.google.com (unknown [10.20.151.165])
 by mta-05.privateemail.com (Postfix) with ESMTPA id DA98F18000BB
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 11:37:32 -0400 (EDT)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-deb9295679so8363317fac.6
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 08:37:32 -0700 (PDT)
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
X-Inumbo-ID: fc8a1869-aeac-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648481853;
	bh=rxHVGE9yKYN13o6xhTm/Fiocdhbl7AVSe/yMgGQDQuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=v2NQaOeSTYkOtAXrBcyuxbMbC/D8hT9bzXmkSRZGBJlW84pGabBVFof0/ztki/rbN
	 JQBQPEXo1QFvaF/y/5t6K/mQTn9FL5lBKRsHq5qSwcHrwYZmAhcbSqf9IzJdbOcJef
	 8Mc4mO5eUB2J3wADtvLcKeJ1lraepljLDV2T6PnI6ZYydmJFK92TPPcCJ/iohMmFlN
	 rGGOreXHed3qdHPiJbYATqmWe5sc+Xfq6gM96Mg+hISi72nRcWBCgVPggpeT3G4Oiv
	 67iQBC186EJ47J36+khfxbEPPH5bQ5FLZCxd/Uu+NLX8nANy3JRgc3bWdA+aU/iGNv
	 66GuCP1/2j6Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648481852;
	bh=rxHVGE9yKYN13o6xhTm/Fiocdhbl7AVSe/yMgGQDQuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hcjcqe6GpCcISGR9zyLwnbSwEd4M7dcRY9teR8gd1Ef0jqlYloNypRv6ZdMS9F/Lu
	 gWDm1NtQDlIOpg72445Vc/o0WNXA6UX5w+tSc3YOnIW7SLQ0cp6+0gPdUN7+u51kw0
	 dgMuE9l9DP9ecnCCkPKiDtXbQjQNid/ArP4Ul9Qj7me0UMZy1/rACVhIPGEorG+xsE
	 sshQMOvo6yax0j85QJ2ezruEbQuS3slUPr1xKJTDbwFO5i2HH6J5VQVvzlKGy1cDLR
	 wisMJwqo4bvsSn3fZHUlxkCwNOzy55eyYw9v5MbSOUlOEeL/MSpNfG4Rr9F2/UkDxn
	 WJuLRk0xF77rw==
X-Gm-Message-State: AOAM5332SygjYXYZmWh0e0FQ6UMXFYi1zQfXZoiXgnLwIg4Igj0++BVp
	NsYpbzbo2GkzXxqWTuwmwbPJj95Ile9jUD9Alt4=
X-Google-Smtp-Source: ABdhPJyZmJjQL0ujPUQCjUxtPEQf4D5zTM+vg0KWjy3CGx4wS69/8WSFrpn+hDQHZHVJ1DNDbpGUisI5ANVI5PCC3II=
X-Received: by 2002:a05:6870:b250:b0:de:afd3:e1c4 with SMTP id
 b16-20020a056870b25000b000deafd3e1c4mr7701668oam.128.1648481852262; Mon, 28
 Mar 2022 08:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <d5d8c7bad025a4ef11bf09ad3a4b23c8b4673ff6.1647970630.git.tamas.lengyel@intel.com>
 <1df7130a-ff59-9672-c77d-14e82339c602@suse.com>
In-Reply-To: <1df7130a-ff59-9672-c77d-14e82339c602@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 28 Mar 2022 11:36:55 -0400
X-Gmail-Original-Message-ID: <CABfawhnQ-fdhrLYwxi-PzMtUYKWA2VxrFPTeRkAJ811W258_Mw@mail.gmail.com>
Message-ID: <CABfawhnQ-fdhrLYwxi-PzMtUYKWA2VxrFPTeRkAJ811W258_Mw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: use dom_cow as placeholder parent
 until fork is complete
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Mar 28, 2022 at 9:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.03.2022 18:41, Tamas K Lengyel wrote:
> > For the duration of the fork memop set dom_cow as a placeholder parent. This
> > gets updated to the real parent when the fork operation completes, or to NULL
> > in case the fork failed.
>
> I am concerned of this, in particular because the state may last across
> perhaps a long series of preemptions. Furthermore ...
>
> > --- a/xen/arch/x86/include/asm/mem_sharing.h
> > +++ b/xen/arch/x86/include/asm/mem_sharing.h
> > @@ -79,7 +79,7 @@ static inline int mem_sharing_unshare_page(struct domain *d,
> >
> >  static inline bool mem_sharing_is_fork(const struct domain *d)
> >  {
> > -    return d->parent;
> > +    return d->parent && d->parent != dom_cow;
> >  }
>
> ... this now makes the function "lie" (the domain is a fork already
> while being constructed). Hence at the very least a comment would want
> to appear here explaining why this is wanted despite not really being
> correct. This "lying" for example means a partly set up fork would be
> skipped by domain_relinquish_resources(), in case the tool stack
> decided to kill the domain instead of waiting for its creation to
> finish.

Hm, yea, domain_relinquish_resources really ought to check if there is
any parent at all, while fork_page needs to check whether there is a
parent and it's not dom_cow. I think I just need two separate
mem_sharing_is_fork functions, one would be the current
mem_sharing_is_fork() and a new one mem_sharing_is_fork_complete(),
that would make it a bit clearer on what they do.

>
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1850,7 +1850,9 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
> >          *cd->arch.cpuid = *d->arch.cpuid;
> >          *cd->arch.msr = *d->arch.msr;
> >          cd->vmtrace_size = d->vmtrace_size;
> > -        cd->parent = d;
> > +
> > +        /* use dom_cow as a placeholder until we are all done */
>
> Nit: As per ./CODING_STYLE you want to at least start the comment with
> a capital letter.

Ack.

Thanks,
Tamas

