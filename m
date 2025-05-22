Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4EAC0AFF
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 14:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993815.1376945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4bZ-0007wx-3m; Thu, 22 May 2025 12:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993815.1376945; Thu, 22 May 2025 12:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4bZ-0007uR-0T; Thu, 22 May 2025 12:00:57 +0000
Received: by outflank-mailman (input) for mailman id 993815;
 Thu, 22 May 2025 12:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMjk=YG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uI4bX-0007uJ-HE
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 12:00:55 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68dbdc76-3704-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 14:00:53 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6065251725bso5263313eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 05:00:53 -0700 (PDT)
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
X-Inumbo-ID: 68dbdc76-3704-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747915252; x=1748520052; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0jE1d+dj1aqJlckob85ctjFQf41u4ekM7bLajv9lWg=;
        b=Ol3iWFWvV2Feyli0Wbz3Zgi8t5TbJdSrdrBD5kM5Fn2DqDfC5q8Rm8SqulGv4uI3v2
         S06GiN5gQsMPThuNI0RJ8AZSqd1Izs9TLixHT+IbbxUrEPhuxLPevUhhtDefkLevLvtK
         PbUtcHUhiBzqG+m5NRao5qg2u/oD+0a5GzniWzXDEZmnWWEz7bQgWic2fg5gfL7Gizq/
         +URflzLCRI61+A9iFP+2/glJ5gsn8uaLIvHFsUTu74/2bTr5vS/mTL+GTQpnIH8dkpBZ
         wKc2Jsa1TAGsO3vY24WsprXNH4Nf8mrA3o+q+R3lCo7c9gvy2NIqQH5mkWHO2R9ug6+O
         Mpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915252; x=1748520052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0jE1d+dj1aqJlckob85ctjFQf41u4ekM7bLajv9lWg=;
        b=WxxdG6/BmdLjkurTH+xt85TNGQdbk+v3Ju2GgN9Hd2JxyGfK0c9LkvqDDUGyw0AvMH
         qlgjlXACb4RKn0J9ml7s6vyPKIgZ2pRcFiOYBGPgMLwP6YVfH0oC+3NnKXunQqao+f4P
         GZeRG/ViMo9vh8pun2GQkVYyNNCmKpSubjlCD3NHYDUMaxYePiErA+OtHsGejj6iry+7
         gMxyFykuhxe6u99laWGIvYsmf5dj0MquEgEGk3WI9r2r/cztZPrV91WKVqF+evSOrw2I
         MQnTM5+DemAb0vD/2OPjqshGEVC1/fEGATEmIA7xHboE+dUq+YMxDxCvhXwwM0wvpxv9
         m/6w==
X-Gm-Message-State: AOJu0Yw9fzx5GKPVNlqhXbeaBUvRoUrHuZVKoNnvKAUWWatVg2IasALA
	9yeTo8EXsXb0T8BmehyyhzEEsvo+Y+mjh6kXU4vJAp9q1QQWVQevQ92is3Ot2KbAYrnyZjeNnvm
	3QnoSqKJHuIxxL4ciJlSkMiIaZgzOaWpZvGu1mVYIxw==
X-Gm-Gg: ASbGncsgZwLV69NYeXjBcLUvlONlJsmztVlKRiTyu+9U+7n8RHS9tOfy88iOmg13YXD
	96HbT8BliPjuyap6HCbhrzrffZnxU6BNOyeNJm2V5DyKny5nIFGCp53OCWfvM0S0tAXuvhOiyfl
	HFNDObnYer693DjrQwubxxkNAPJ21u16ybsg==
X-Google-Smtp-Source: AGHT+IEs9ijzmYMadIx8/CsvSaL2OprLQIPbSRo1y19l4Q/MMeIk57HgwvmgGGPUvtrre0Zy5nh4BfVIfhODPgQhMOg=
X-Received: by 2002:a4a:c38d:0:b0:609:f8f1:ce72 with SMTP id
 006d021491bc7-609f8f1d126mr9942167eaf.1.1747915251774; Thu, 22 May 2025
 05:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com>
 <D2791D4F-C357-43D3-A5ED-6719E5650F02@arm.com> <CAHUa44Gu2axg0UhXXt8U-W5kh=GejYJvCmcFOL0oiOa=iYKkfg@mail.gmail.com>
 <54AE155E-5D83-4C45-B21C-7BB264ADB7E9@arm.com>
In-Reply-To: <54AE155E-5D83-4C45-B21C-7BB264ADB7E9@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 14:00:40 +0200
X-Gm-Features: AX0GCFvYwc_Rsismc8yTv_iyWWWmXuSYMwTEKrcgTBNoVNQjmQh_lCdebJgEjDY
Message-ID: <CAHUa44ER4Mqe2DMFhajH5BM15oH+4-BOn6xtzQ4o+P7He8E_pQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, May 22, 2025 at 11:11=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 May 2025, at 10:30, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi,
> >
> > On Thu, May 22, 2025 at 10:18=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 May 2025, at 10:00, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Hi Bertrand,
> >>>
> >>> On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
> >>> <bertrand.marquis@arm.com> wrote:
> >>>>
> >>>> When VM to VM support is activated and there is no suitable FF-A sup=
port
> >>>> in the firmware, enable FF-A support for VMs to allow using it for V=
M to
> >>>> VM communications.
> >>>> If there is OP-TEE running in the secure world and using the non FF-=
A
> >>>> communication system, having CONFIG_FFA_VM_TO_VM could be non functi=
onal
> >>>> (if optee is probed first) or OP-TEE could be non functional (if FF-=
A is
> >>>> probed first) so it is not recommended to activate the configuration
> >>>> option for such systems.
> >>>>
> >>>> To make buffer full notification work between VMs when there is no
> >>>> firmware, rework the notification handling and modify the global fla=
g to
> >>>> only be used as check for firmware notification support instead.
> >>>>
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> Changes in v5:
> >>>> - init ctx list when there is no firmware
> >>>> - rework init a bit to prevent duplicates
> >>>> - Remove Jens R-b due to changes done
> >>>> Changes in v4:
> >>>> - Fix Optee to OP-TEE in commit message
> >>>> - Add Jens R-b
> >>>> Changes in v3:
> >>>> - fix typos in commit message
> >>>> - add spaces around <<
> >>>> - move notification id fix back into buffer full patch
> >>>> - fix | position in if
> >>>> Changes in v2:
> >>>> - replace ifdef with IS_ENABLED when possible
> >>>> ---
> >>>> xen/arch/arm/tee/ffa.c       |  24 ++++++--
> >>>> xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-----------------=
--
> >>>> 2 files changed, 67 insertions(+), 61 deletions(-)
> >>>>
> >>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>>> index c1c4c0957091..b86c88cefa8c 100644
> >>>> --- a/xen/arch/arm/tee/ffa.c
> >>>> +++ b/xen/arch/arm/tee/ffa.c
> >>>> @@ -342,8 +342,9 @@ static int ffa_domain_init(struct domain *d)
> >>>>    struct ffa_ctx *ctx;
> >>>>    int ret;
> >>>>
> >>>> -    if ( !ffa_fw_version )
> >>>> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
> >>>>        return -ENODEV;
> >>>> +
> >>>>    /*
> >>>>     * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A =
ID 0 is
> >>>>     * reserved for the hypervisor and we only support secure endpoin=
ts using
> >>>> @@ -579,11 +580,8 @@ static bool ffa_probe(void)
> >>>>        goto err_rxtx_destroy;
> >>>>
> >>>>    ffa_notif_init();
> >>>> -    INIT_LIST_HEAD(&ffa_teardown_head);
> >>>> -    INIT_LIST_HEAD(&ffa_ctx_head);
> >>>> -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NU=
LL, 0);
> >>>>
> >>>> -    return true;
> >>>> +    goto exit;
> >>>>
> >>>> err_rxtx_destroy:
> >>>>    ffa_rxtx_destroy();
> >>>> @@ -592,6 +590,22 @@ err_no_fw:
> >>>>    bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >>>>    printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >>>>
> >>>> +exit:
> >>>> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) || ffa_fw_version )
> >>>> +    {
> >>>> +        INIT_LIST_HEAD(&ffa_teardown_head);
> >>>> +        INIT_LIST_HEAD(&ffa_ctx_head);
> >>>> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback=
, NULL, 0);
> >>>> +    }
> >>>> +
> >>>> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>>> +    {
> >>>> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n")=
;
> >>>
> >>> This should only be printed if ffa_fw_version =3D=3D 0
> >>
> >> Right i will fix but ...
> >>
> >>>
> >>>> +        return true;
> >>>> +    }
> >>>> +    else if ( ffa_fw_version )
> >>>
> >>> The else isn't needed.
> >>
> >> the else is needed so that we return true and not false.
> >
> > I meant the "else" isn't needed, the "if" is still needed, as you expla=
in.
> >
> >>
> >> We have 3 cases:
> >> - firmware is there: return true
> >> - firmware not there but vm to vm enable: return true
> >> - otherwise: return false
> >>
> >> I will modify it like this to make it clearer:
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 57b648a22840..768b4e9ec968 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -601,13 +601,13 @@ exit:
> >>         init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, N=
ULL, 0);
> >>     }
> >>
> >> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    if ( ffa_fw_version )
> >> +        return true;
> >> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>     {
> >>         printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> >>         return true;
> >>     }
> >> -    else if ( ffa_fw_version )
> >> -        return true;
> >>
> >>     return false;
> >> }
> >>
> >> Tell me if you agree.
> >
> > Yes, this is an improvement. A return at the end of an if block makes
> > the eventual following "else" redundant. I suppose there are coding
> > styles where it's still preferred. I'm not sure if that applies in
> > Xen, though.
>
> I now get what you mean and you would like the return false to be in a el=
se.
>
> Relooking at the code, i actually do not like the fact that we do so much=
 in
> exit and i think i can move a bit the code to be clearer:
> - put the fw init in a sub function
> - create a vm_to_vm init function
> - in probe call both functions and do the common init part if at least on=
e succeded

I was starting to think along those lines, too. :-)

>
> Something like this:
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 57b648a22840..42dfc71a12d7 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -478,38 +478,12 @@ static void ffa_init_secondary(void)
>      ffa_notif_init_interrupt();
>  }
>
> -static bool ffa_probe(void)
> +static bool ffa_probe_fw(void)
>  {
>      uint32_t vers;
>      unsigned int major_vers;
>      unsigned int minor_vers;
>
> -    /*
> -     * FF-A often works in units of 4K pages and currently it's assumed
> -     * that we can map memory using that granularity. See also the comme=
nt
> -     * above the FFA_PAGE_SIZE define.
> -     *
> -     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> -     * until that is fully handled in this code make sure that we only u=
se
> -     * 4K page sizes.
> -     */
> -    BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> -
> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> -
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> -    {
> -        /*
> -         * When FFA VM to VM is enabled, the current implementation does=
 not
> -         * offer any way to limit which VM can communicate with which VM=
 using
> -         * FF-A.
> -         * Signal this in the xen console and taint the system as insecu=
re.
> -         * TODO: Introduce a solution to limit what a VM can do through =
FFA.
> -         */
> -        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure =
!!\n");
> -        add_taint(TAINT_MACHINE_INSECURE);
> -    }
>      /*
>       * psci_init_smccc() updates this value with what's reported by EL-3
>       * or secure world.
> @@ -528,11 +502,6 @@ static bool ffa_probe(void)
>          goto err_no_fw;
>      }
>
> -    /* Some sanity check in case we update the version we support */
> -    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
> -    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=3D
> -                                   FFA_MY_VERSION_MAJOR);
> -
>      major_vers =3D FFA_VERSION_MAJOR(vers);
>      minor_vers =3D FFA_VERSION_MINOR(vers);
>
> @@ -584,7 +553,7 @@ static bool ffa_probe(void)
>
>      ffa_notif_init();
>
> -    goto exit;
> +    return true;
>
>  err_rxtx_destroy:
>      ffa_rxtx_destroy();
> @@ -593,23 +562,59 @@ err_no_fw:
>      bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
> -exit:
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) || ffa_fw_version )
> -    {
> -        INIT_LIST_HEAD(&ffa_teardown_head);
> -        INIT_LIST_HEAD(&ffa_ctx_head);
> -        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NUL=
L, 0);
> -    }
> +    return false;
> +}
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> -    {
> +static bool ffa_probe_vm_to_vm(void)
> +{
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        return false;
> +
> +    /*
> +     * When FFA VM to VM is enabled, the current implementation does not
> +     * offer any way to limit which VM can communicate with which VM usi=
ng
> +     * FF-A.
> +     * Signal this in the xen console and taint the system as insecure.
> +     * TODO: Introduce a solution to limit what a VM can do through FFA.
> +     */
> +    printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure !!\n=
");
> +    add_taint(TAINT_MACHINE_INSECURE);
> +
> +    return true;
> +}
> +
> +static bool ffa_probe(void)
> +{
> +    /*
> +     * FF-A often works in units of 4K pages and currently it's assumed
> +     * that we can map memory using that granularity. See also the comme=
nt
> +     * above the FFA_PAGE_SIZE define.
> +     *
> +     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> +     * until that is fully handled in this code make sure that we only u=
se
> +     * 4K page sizes.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> +
> +    /* Some sanity check in case we update the version we support */
> +    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
> +    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=3D
> +                                   FFA_MY_VERSION_MAJOR);
> +
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> +
> +    if ( !ffa_probe_fw() && !ffa_probe_vm_to_vm() )
> +        return false;
> +
> +    if ( !ffa_fw_version )
>          printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> -        return true;
> -    }
> -    else if ( ffa_fw_version )
> -        return true;
>
> -    return false;
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    INIT_LIST_HEAD(&ffa_ctx_head);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
> +    return true;
>  }
>
>  static const struct tee_mediator_ops ffa_ops =3D
>
> I think this makes the code cleaner as we also get the proper error handl=
ing with goto
> inside the fw probe instead of the previous one which was trying to handl=
e both cases.
>
> What do you think ?

This is good. It's much easier to follow.

Cheers,
Jens

