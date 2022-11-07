Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9761F498
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 14:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439407.693447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os2Qj-0004bL-Ij; Mon, 07 Nov 2022 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439407.693447; Mon, 07 Nov 2022 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os2Qj-0004ZO-Fn; Mon, 07 Nov 2022 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 439407;
 Mon, 07 Nov 2022 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cnsp=3H=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1os2Qi-0004ZI-B5
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 13:44:48 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57bd6610-5ea2-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 14:44:47 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id sc25so30120416ejc.12
 for <xen-devel@lists.xenproject.org>; Mon, 07 Nov 2022 05:44:46 -0800 (PST)
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
X-Inumbo-ID: 57bd6610-5ea2-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vwv0/1mAQWe9fwxt6DEh77b+WOf2i7RVlEyUpQbZEmA=;
        b=As6Mpuy1mN2vrL4BN1Kzopib7iFm/YRqlZ6bfTWiXo5E2LWpDjqZmMZYZzdRllfPe3
         VX5ItbrBkFHmMNKiUfbVKYlNJL3+hywY6lLxjlyINlxGMPFOr3q7vBjKv1cDhQLweqV+
         lod4eBio1Y2Y9wFv3EOvebZvkFXI86XiuFbvsKe5cPYp+mR1Ye3Cwx14JQvkAPTXICW2
         PaaJWLtzLYgzm0NqzrMiuUjbC/P7o13mVDTaRhIZlhTgBCC2pRTEKWHg9LCjP6EaMj36
         43qqyJ0u7d59a0piP9bg7uwS1hMEJwMhiTbQN5Y3aCx0GEDOihdTAuonOOIez3XPQZob
         exvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vwv0/1mAQWe9fwxt6DEh77b+WOf2i7RVlEyUpQbZEmA=;
        b=1eFOVdHVBp+MeM8p6Sybp60R/0qaxPFAo83ZTvVM9BgAneyB5jfbyC54SSq82XJcUT
         P2lOxlxQXisLilW/emWmZvhvA1sbjBN6qlrPb5nkYQfYHQpvqQYarb4/1FOw9+CPWQOc
         Loyi3/tboarZLYE6uo+gK4mPwxcVDabpwBE7vJaIfAvf47nnTIoJmovc6FLaOnNdN+Eg
         uvKm1P5Im9zM5oYarXmUqAvFTOKK3LNqTX6dotgawLU654MOePKTwnRoD/BX2Iu83lYF
         CyKrAG//fXJEXWCwfnjzS/VBqz0JHA+JZCFXO+owGZf738VMINlWLrcFjhFlUkRQZTJd
         EjpA==
X-Gm-Message-State: ACrzQf0HweDvFMfNbw2SgY4axsfkMEqib1EGx2+i90jv3q04smo9JBuh
	iQk8uEwJD7fy+MkKCJlLXQ385APtiucab2uYpt7vNw==
X-Google-Smtp-Source: AMsMyM7VWI0qWR65eVGztOVVEkiiFKnMVFdeF+33eO3HF7Tc5bDEcYNxudZ9Vs283ZJozd7fhtZI202Dr/EtGsBLDs0=
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id
 x10-20020a1709060a4a00b00782686da1b6mr48059116ejf.232.1667828686234; Mon, 07
 Nov 2022 05:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech> <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
 <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com> <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
In-Reply-To: <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 7 Nov 2022 14:44:33 +0100
Message-ID: <CAG+AhRVPKDef_PTLEL7ybBd=YWHgxRNfwf87nbMApd6YUp7bgA@mail.gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for domains
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Tue, Oct 25, 2022 at 1:15 PM Julien Grall <julien@xen.org> wrote:
> On 25/10/2022 11:53, Carlo Nonato wrote:
> > Hi Julien,
> >
> > On Fri, Oct 21, 2022 at 8:02 PM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Carlo,
> >>
> >> On 26/08/2022 13:51, Carlo Nonato wrote:
> >>> This commit adds array pointers to domains as well as to the hypercall
> >>> and configuration structure employed in domain creation. The latter is used
> >>> both by the toolstack and by Xen itself to pass configuration data to the
> >>> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
> >>> able to access guest memory in the first case. This implies special care for
> >>> the copy of the configuration data into the domain data, meaning that a
> >>> discrimination variable for the two possible code paths (coming from Xen or
> >>> from the toolstack) is needed.
> >>
> >> So this means that a toolstack could set from_guest. I know the
> >> toolstack is trusted... However, we should try to limit when the trust
> >> when this is possible.
> >>
> >> In this case, I would consider to modify the prototype of
> >> domain_create() to pass internal information.
> >
> > Doing as you said isn't a bit too invasive? I should also change all the call
> > sites of domain_create() and this means x86 too.
>
> Yes there will be a few calls to modify. But this is better than hacking
> the hypercall interface to cater for internal use.
>
> > Isn't there an easier way to spot a guest address? Maybe just looking at the
> > address value...
>
> HVM/Arm guest have a separate address space. So it is not possible to
> differentiate between guest vs hypervisor address.
>
> > Or maybe adding an internal flag to the do_domctl() path.
> IIUC, this flag would indicate whether the XEN_GUEST_HANDLE() is an
> hypervisor or guest address. Is that correct?
>
> If so, I dislike it. I am not sure what the other maintainers think, but
> personally updating domain_create() is my preferred way.

Sorry to bother you again on this topic, but I thought of a way to get rid of
the "from_guest" field which I hope is simple enough to convince you.
I can call copy_from_guest() *only* in domctl.c, overwriting the colors
pointer with a new, Xen allocated, array.
This lets me simplify the logic in domain_coloring_init() since all the arrays
coming to it via the domainconfig struct are allocated in Xen memory only.
It's still a bit of a hack since I'm using the XEN_GUEST_HANDLE as a normal
Xen pointer, but it's by far less hacky than before and doesn't have the trust
problem.

> [...]
>
> >>>    void arch_domain_shutdown(struct domain *d)
> >>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >>> index 3fd1186b53..4d4cb692fc 100644
> >>> --- a/xen/arch/arm/domain_build.c
> >>> +++ b/xen/arch/arm/domain_build.c
> >>> @@ -33,6 +33,12 @@
> >>>    #include <xen/grant_table.h>
> >>>    #include <xen/serial.h>
> >>>
> >>> +#ifdef CONFIG_CACHE_COLORING
> >>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
> >>> +#else
> >>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
> >>> +#endif
> >>
> >> I can't remember if I asked it before and it doesn't seem to written
> >> everywhere. This check suggest that it is not possible to use the same
> >> Xen binary for coloring and non-coloring.
> >
> > If coloring is enabled, all the domains are colored (even if they use
> > zero colors
> > because of the default selection). This means that they are going to use
> > the colored allocator. Since this all-or-nothing design, if coloring is
> > enabled, dom0 is assumed to be colored, which implies removing the directmap
> > flag. So if what you mean with "same Xen binary for coloring and non-coloring"
> > is to have a way to select at runtime if a domain is colored, or if Xen
> > itself is colored, the answer is no, we don't have this right now.
>
> [...]
>
> >
> >> At the moment, we have been able to have all the features in the same
> >> Xen binary. So what are the reasons for this restriction?
> >
> > Not sure about the first sentence (you mean, until this patch?),
>
> Yes.
>
> > but the
> > restriction is just because it's simpler. For example if we have to support
> > colored and non-colored domains at the same time,
>
> I am not asking for supporting a mix of colored and non-colored domains.
> What I am asking is to have a runtime switch (rather than compile time)
> to decide whether the system is colored or not.
>
> IOW, why can't system-wide coloring be selected at runtime?

This is definitely doable. Do you also think the compile time switch is
useless? Should we get rid of that?

> > we probably need to
> > change something in the allocator (at least reserving more memory for the
> > buddy).
>
> This sentence picked my interesting. How do you decide the size of the
> buddy today?

The user can actually choose it arbitrarily and there is no particular
calculation behind the default value (64M): it's just a reasonable sounding
value.

> [...]
>
> >>> +#ifdef CONFIG_CACHE_COLORING
> >>> +    unsigned int *colors;
> >>> +    unsigned int num_colors;
> >>> +#endif >
> >>>        /* Virtual MMU */
> >>>        struct p2m_domain p2m;
> >>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> >>> index c8b6058d3a..adf843a7a1 100644
> >>> --- a/xen/include/public/arch-arm.h
> >>> +++ b/xen/include/public/arch-arm.h
> >>> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> >>>    #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> >>>    #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> >>>
> >>> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
> >>
> >> You don't seem to use "color_t" outside of arch-arm.h and we already
> >> define guest handle for "unsigned int". So can they be used?
> >
> > That's because the guest handle for "unsigned int" is defined later
> > (in public/xen.h).
>
> Hmmm... And I guess we can't define "unsigned int" earlier because they
> rely on macro defined in arch-arm.h?

Exactly.

> > We can also think of moving the coloring fields from this
> > struct to the common one (xen_domctl_createdomain) protecting them with
> > the proper #ifdef (but we are targeting only arm64...).
>
> Your code is targeting arm64 but fundamentally this is an arm64 specific
> feature. IOW, this could be used in the future on other arch. So I think
> it would make sense to define it in common without the #ifdef.
>
> @x86 maintainers, what do you think?
>
> >
> >>> +
> >>>    struct xen_arch_domainconfig {
> >>>        /* IN/OUT */
> >>>        uint8_t gic_version;
> >>> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
> >>>         *
> >>>         */
> >>>        uint32_t clock_frequency;
> >>> +    /* IN */
> >>> +    uint8_t from_guest;
> >>
> >> There is an implicit padding here and ...
> >>> +    /* IN */
> >>> +    uint16_t num_colors;
> >>
> >> ... here. For the ABI, we are trying to have all the padding explicit.
> >> So the layout of the structure is clear.
> >
> > Isn't it true also for other fields like gic_version and tee_type?
>
> Indeed, there is missing explicit padding after gic_version. There is no
> padding necessary after 'tee_type'.
>
> I am not asking you to fix the existing missing padding, however we
> should avoid to introduce new ones.

Understood.

> Cheers,
>
> --
> Julien Grall

Thanks.

- Carlo Nonato

