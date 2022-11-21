Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C2632954
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 17:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446762.702553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9Zp-0001zE-D9; Mon, 21 Nov 2022 16:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446762.702553; Mon, 21 Nov 2022 16:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9Zp-0001wR-9Z; Mon, 21 Nov 2022 16:23:21 +0000
Received: by outflank-mailman (input) for mailman id 446762;
 Mon, 21 Nov 2022 16:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUjL=3V=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1ox9Zo-0001wL-9u
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 16:23:20 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefced53-69b8-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 17:23:18 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id y24so11957338edi.10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 08:23:18 -0800 (PST)
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
X-Inumbo-ID: cefced53-69b8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOC3xpcSeBrhe9xp8UYxSIBZUQ4q9qNE3uC0xGYTuIk=;
        b=STpcBNP/F9DSWXS08DECPjprcKuC7AH7LAGxWPSkl4/pq/Wi4xU0THsqWYL4L8ds9C
         ChNWBFSD9fX/Z0nYPfhK46OE1L6FVc/xCq8/CKtXK+8J5F5dvFZ0bCOiW5ndxktv7Fd6
         dfaGxFO3WQXAeaTRj+4KHsPC4tRbHFQV0of7IHutMP4ihrwC62SrBEUOc8irrqLAdx6J
         sLYYKsPT+QuIY/KvA3vJ8qsBjAsQ9lQJ72cxA9Nuzz/vXIYsJmVLjigNmBoXiZfUhfp7
         C+CbLQYgNjzwtL4zPOAoNGGpaJvSVK7TutXBzz2mHKu7fp9kCLDXVrDRpEcjupWLWKiQ
         03Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOC3xpcSeBrhe9xp8UYxSIBZUQ4q9qNE3uC0xGYTuIk=;
        b=T2K2pSzZ+tECwWwGz9k7x/k89c4wjft2MfOIQIMdoc36Us74CkMjGuBOIfiU5NXuo0
         GntdRKpSmH/7gjnHZ7JWb6jTsNsZA4/N2/KiZQ4Zw6hAdCM0HRbQ8JrBi9AcFo3xLZln
         F3D9snKeHUi+GrPwrNBsgBESA0bIOIqvQ2jyuIClCqv4oGqoPCdjvzjIcLP0bfQvrYTO
         Z7biB+rxvf4VV1Q90s3+XuPPernbXEryiuyCXz1eVZk8i0YN6Xuh8aws6pkL7KRc4ggB
         r7799LBx6muNOy9wjDMwSo3Euf2JslR5VbwK1hnnRmiaHUDzWZckuZpYY09J8W7Rt4O+
         XyDg==
X-Gm-Message-State: ANoB5pmv7TEWNV7NwK+ietisUZSEJ5YspiGFy+LnRA/hzv3b/YFuuhc8
	bB7eQ11MbngFsv64QkMkvjd1YP0VEDsrXMDDwrgoMw==
X-Google-Smtp-Source: AA0mqf5+XjN4gBu5gbLyOjFcHQ/vJLXZsjq4uuQyMhlNEfqGzsoJPLlHEXghmvwENQNB/84KsXGXckMznCAk0HKsTAM=
X-Received: by 2002:aa7:cf12:0:b0:469:a6ce:bb5 with SMTP id
 a18-20020aa7cf12000000b00469a6ce0bb5mr28356edy.368.1669047798320; Mon, 21 Nov
 2022 08:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech> <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
 <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
In-Reply-To: <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 21 Nov 2022 17:23:07 +0100
Message-ID: <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 4:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.11.2022 15:50, Carlo Nonato wrote:
> > Hi x86 devs,
>
> Any reason you didn't include Roger?

Nope. Sorry, forgot to add him.

> > I want to ask you some questions about this patch because in the previous
> > version me and Julien have discussed how cache colors should be passed in
> > domain creation. You should be able to read that discussion, anyway here is
> > a link to it
> >
> > https://marc.info/?l=xen-devel&m=166151802002263
>
> I've looked at the first few entries, without finding an answer to ...
>
> > In short, using struct xen_arch_domainconfig works fine only when domctl
> > hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
> > should point to guest memory and must not be used when creating a domain
> > from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
> > changing the domain_create() signature to require also a color array and its
> > length to be passed in for these latter cases.
> > Are you ok with that? See below for more comments.
>
> ... my immediate question: Does supplying the colors necessarily need to
> done right at domain creation? Wouldn't it suffice to be done before first
> allocating memory to the new domain, i.e. via a separate domctl (and then
> for Xen-created domains via a separate Xen-internal function, which the
> new domctl handling would also call)? Or do colors also affect the
> allocation of struct domain itself (and pointers hanging off of it)?

This would be really good. The only problem I can see is the p2m allocation
which is done during domain creation. With the current set of patches it
results in a "Failed to allocate P2M pages" since we want to have p2m tables
allocated with the same color of the domain and a null page is returned
because we have no colors.

> > Another question is then if xen_arch_domainconfig is the right place where to
> > put the coloring fields for domctl hypercall value passing.
> > See below for more comments.
>
> I think I said so before in other contexts: To me this coloring thing
> isn't Arm-specific, and hence - despite only being implemented for Arm
> right now - would preferably be generic at the interface level.

Ok, I'll try to do that.

> >> @@ -232,6 +233,62 @@ bool __init coloring_init(void)
> >>      return true;
> >>  }
> >>
> >> +int domain_coloring_init(struct domain *d,
> >> +                         const struct xen_arch_domainconfig *config)
> >> +{
> >> +    if ( is_domain_direct_mapped(d) )
> >> +    {
> >> +        printk(XENLOG_ERR
> >> +               "Can't enable coloring and directmap at the same time for %pd\n",
> >> +               d);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    if ( is_hardware_domain(d) )
> >> +    {
> >> +        d->arch.colors = dom0_colors;
> >> +        d->arch.num_colors = dom0_num_colors;
> >> +    }
> >> +    else if ( config->num_colors == 0 )
> >> +    {
> >> +        printk(XENLOG_WARNING
> >> +               "Color config not found for %pd. Using default\n", d);
> >> +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
> >> +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
> >> +    }
> >> +    else
> >> +    {
> >> +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
> >> +        d->arch.num_colors = config->num_colors;
> >> +        if ( config->from_guest )
> >> +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
> >> +        else
> >> +            memcpy(d->arch.colors, config->colors.p,
> >> +                   sizeof(unsigned int) * config->num_colors);
> >> +    }
> >
> > Question 1:
> > Here is the current hacky solution in action: using config->from_guest to
> > decide whether to call copy_from_guest() or memcpy(). This is a no go for
> > Julien (and also for me right now). In my current work, I tried to get rid
> > of this field simply by calling copy_from_guest() only in domctl.c, but this
> > solution still isn't easy to maintain because the config->colors.p field can
> > either be a guest pointer or a Xen one and mixing the two semantics can be
> > problematic.
>
> You simply cannot expect copy_from_guest() to work when the source pointer
> is not a guest one.
>
> >> --- a/xen/include/public/arch-arm.h
> >> +++ b/xen/include/public/arch-arm.h
> >> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> >>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> >>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> >>
> >> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
> >
> > Question 2:
> > This color_t definition is employed because the guest handle for
> > "unsigned int" (uint) is defined later (public/xen.h) and (citing Julien):
> >
> >> Hmmm... And I guess we can't define "unsigned int" earlier because they
> >> rely on macro defined in arch-arm.h?
> >
> > So the solution could be to move everything up a level in
> > xen_domctl_createdomain, where using uint wouldn't be a problem.
> > If this goes to common code then should it be guarded with some #ifdef
> > or not?
>
> As per above I'd say it shouldn't. But then you also shouldn't use
> "unsigned int" in any new additions to the public interface. Only
> fixed width types are suitable to use here.

Got it.

> Jan

Thanks.
- Carlo Nonato

