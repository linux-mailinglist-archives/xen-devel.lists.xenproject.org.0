Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D59341C1A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 13:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99213.188491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNE5M-0000QG-3d; Fri, 19 Mar 2021 12:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99213.188491; Fri, 19 Mar 2021 12:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNE5M-0000Pr-0O; Fri, 19 Mar 2021 12:18:36 +0000
Received: by outflank-mailman (input) for mailman id 99213;
 Fri, 19 Mar 2021 12:18:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AwH3=IR=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lNE5K-0000Pm-Vv
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 12:18:35 +0000
Received: from MTA-14-4.privateemail.com (unknown [198.54.118.206])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff5f25ba-72d8-4481-aec8-f405b681282d;
 Fri, 19 Mar 2021 12:18:34 +0000 (UTC)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 278D080068
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 08:18:33 -0400 (EDT)
Received: from mail-wm1-f53.google.com (unknown [10.20.151.218])
 by mta-14.privateemail.com (Postfix) with ESMTPA id E64FF80065
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 08:18:32 -0400 (EDT)
Received: by mail-wm1-f53.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo5111830wmq.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 05:18:32 -0700 (PDT)
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
X-Inumbo-ID: ff5f25ba-72d8-4481-aec8-f405b681282d
X-Gm-Message-State: AOAM532hBKR/t5jsxrS/KUhs9I9S8wIY8aJUFhlI3bcFz5bPu8ewglki
	GTIQWVdRZ9+H8DldgNDWU4u2rWpZ8FF9YK7ib3Y=
X-Google-Smtp-Source: ABdhPJzIwTHUfLYYl3lbtC+wAqnC+sz+GYS9Fir+xR0wF4jObos29xuDy5jBTZAKv9t1F+EMgkossrVgcEcYw9o7Aho=
X-Received: by 2002:a1c:c206:: with SMTP id s6mr3437346wmf.77.1616156311635;
 Fri, 19 Mar 2021 05:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
 <193bfae5-a80a-d02a-377d-c9e11ad038a8@suse.com> <CABfawhmaUXSJkEG3hOQGFHMD=anN5Vs-uGosXP2NDTUDS2HDvA@mail.gmail.com>
 <960d2a7a-7be0-58f8-56cc-26d1fa90b7a0@suse.com>
In-Reply-To: <960d2a7a-7be0-58f8-56cc-26d1fa90b7a0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Mar 2021 08:17:55 -0400
X-Gmail-Original-Message-ID: <CABfawhk1nY1tpoAQmEnOFJ8AgYfXZTxE4z+QCgYWWOR+9Lt5wg@mail.gmail.com>
Message-ID: <CABfawhk1nY1tpoAQmEnOFJ8AgYfXZTxE4z+QCgYWWOR+9Lt5wg@mail.gmail.com>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Mar 19, 2021 at 7:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 19.03.2021 12:06, Tamas K Lengyel wrote:
> > On Fri, Mar 19, 2021, 6:23 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> >> On 18.03.2021 22:36, Tamas K Lengyel wrote:
> >>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>> @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct
> >> domain *d)
> >>>          return rc;
> >>>
> >>>      copy_tsc(cd, d);
> >>> +    p2m_get_hostp2m(cd)->max_mapped_pfn =
> >> p2m_get_hostp2m(d)->max_mapped_pfn;
> >>
> >> Makes sense to me, yes, but then an immediate question is: What
> >> about the somewhat similar {min,max}_remapped_gfn fields? Which
> >> of course implies the more general question of how alternate
> >> p2m-s (are supposed to) get treated in the first place. From my
> >> looking at it, fork() doesn't appear to also fork those, but
> >> also doesn't appear to refuse cloning when altp2m is in use.
> >>
> >
> > It's untested, forking and altp2m is not currently used simultaniously.
> > Don't know if it should be restricted as not working as I haven't tested
> > it. Both forking and altp2m is experimental so there be dragons. At some
> > point I would like to be able to use altp2m in forks but forking a domain
> > that has altp2m enabled will likely be a setup that's too insane to try to
> > get working.
>
> Well, I see only two (consistent) options - either the other two
> fields mentioned get copied as well, or altp2m use results in
> forking getting refused.

Sure, but that's a separate issue from what this patch addresses so at
this point I don't plan on including that work in here.

Tamas

