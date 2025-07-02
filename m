Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA346AF6534
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 00:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031591.1405401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX5vL-0002Bw-S7; Wed, 02 Jul 2025 22:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031591.1405401; Wed, 02 Jul 2025 22:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX5vL-0002AV-Pb; Wed, 02 Jul 2025 22:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1031591;
 Wed, 02 Jul 2025 22:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrfD=ZP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uX5vJ-0002AN-Tl
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 22:27:26 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9c812f4-5793-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 00:27:23 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so7265515e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 15:27:23 -0700 (PDT)
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
X-Inumbo-ID: b9c812f4-5793-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751495243; x=1752100043; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwPH686NA+HfXwAR/XOjNyQBhVzDsnqjLu7hPiheaYQ=;
        b=CaW86hiJQx2a6blDIY7enWsgy44h4Fcm6dFOW+wAJgFZ8NmvQ42w8yXQb2dHzFN0w4
         MdnqtolmAIZKnFpnJpcLf/SYVz+hYQITayyEAZVppXgConT1Zu9RyeG4kRtYc2c4Sc7D
         0ZrIYSiwcwQpcUMq6zdSDwIHRlcvorIGPOKRBSEb3jiHj4GUxad3r1y1O7MZ8ekz22cc
         a1gMKYscAgMGewQ9piQ0vysaJxmN+u4TfMgKjldvM2NiCTyrV5P2uKbhNWyDmAlVUD7P
         JgRcF1fM9JjYcB5dOptNR6kr5eukDP9YET86PMkf0Gwx5kxUHhHFgb8VRK+pZ8wgI3TY
         KaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495243; x=1752100043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwPH686NA+HfXwAR/XOjNyQBhVzDsnqjLu7hPiheaYQ=;
        b=VdhV2Sj4CGyp+WFAagZsxfghh7inU79bh1sYNrhqDukY89gQHp+IWAYcdJlr95Rz3S
         O9CMPetNIQdPPMAtRx+egsMP5SD9TvTulslgrZDt2utnrQtZYv/8jmyX/JVEe7VT7ocd
         3rbMR5grvZEY8T8ZlHzpv3OCB9noUxlspahOcvcb1I1j9StoZLfSSrxt1I81/DfkmHv2
         Au4wO3GFtThaUrAE7ffEBVAwaxb8cmfxNgl8db1ILnWgdIuKJOzx8R9ZWOYE7fk32hvM
         W2jiHOttqIphvwKlsmO0aQS8gvRN9Z8cqZGtGyJAxlUCJaaEssMnhX0QNcSOTINSljmc
         rsjw==
X-Gm-Message-State: AOJu0YxkIfrUi73Ou5gk9EIH8RQNliXdN/fJuFPRifORJXcCW4FC5F9G
	78WgE7ywAS45cbh8acXkM2cmYiDDA73snPvLQrkzQ7CkOhGGO9oLHyKuJ4P/rF2UvaqpGY/nruo
	CA5MehEGJ5VTS9o/D45EkJm+rH/2Xtno=
X-Gm-Gg: ASbGncuWCyRxGRnFNamy1iqo58nsmqTXoXTyoeqS4vFXw0139qtTnvjR0TO2sY1VvuD
	R/lE7N4nwOnYcLQhWwM/PPaB5I8yyi38ynkH08rukdhIGeU/btX4ZFI74tR6p46kgslGB3poGbb
	lXKIRGT94ie3nNtnEXyiBnQLyL8s1bU2z/QHe6iTwFvQ==
X-Google-Smtp-Source: AGHT+IFspkZeUbi2eC7Jcx2vH0lyRUWx1RH17As9WWren9W8vcdrkQHI2KNm+/A8b4OnI84aJzxyRUz3it1bpM4TUBM=
X-Received: by 2002:a05:6512:31cf:b0:553:a4cf:2106 with SMTP id
 2adb3069b0e04-55628356060mr1569011e87.57.1751495242846; Wed, 02 Jul 2025
 15:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org> <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
 <3cf697b8-9c23-4e24-980e-3f9696692bb4@xen.org>
In-Reply-To: <3cf697b8-9c23-4e24-980e-3f9696692bb4@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 3 Jul 2025 01:27:10 +0300
X-Gm-Features: Ac12FXzJ-xvaTFnxx2KgbGvP3iVr3FwAbGJxlGeazAyyezRrNel13sJwGLXcrnM
Message-ID: <CAGeoDV8_bB6Yrr0eLmUM562Q1CEsGuHXe7S5f6-yYwwwLdiXkg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:28=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 02/07/2025 11:01, Mykola Kvach wrote:
> > On Sat, Jun 28, 2025 at 9:17=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >> It would be better if we stash the value sand then update the register=
s.
> >> Another possibility would be to entirely skip the save path for CPUs
> >> that are turned off (after all this is a bit useless work...).
> >
> > Do you mean we should avoid calling ctxt_switch_from for a suspended
> > domain?
>
> This would be one way to handle it. I haven't looked in details whether
> there are any other implications.
>
> [...]
>
> >>> +{
> >>> +    struct vcpu *v;
> >>> +
> >>> +    spin_lock(&d->shutdown_lock);
> >>> +
> >>> +    d->is_shutting_down =3D d->is_shut_down =3D 0;
> >>> +    d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >>> +
> >>> +    for_each_vcpu ( d, v )
> >>> +    {
> >>> +        if ( v->paused_for_shutdown )
> >>> +            vcpu_unpause(v);
> >>> +        v->paused_for_shutdown =3D 0;
> >>> +    }
> >>> +
> >>> +    spin_unlock(&d->shutdown_lock);
> >>> +}
> >>> +
> >>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, registe=
r_t cid)
> >>> +{
> >>> +    int ret;
> >>> +    struct vcpu *v;
> >>> +    struct domain *d =3D current->domain;
> >>> +
> >>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware =
domain */
> >>> +    if ( is_hardware_domain(d) )
> >>> +        return PSCI_NOT_SUPPORTED;
> >>> +
> >>> +    domain_shutdown(d, SHUTDOWN_suspend);
> >>
> >> It would be good to add a comment explaining why you need to call
> >> domain_shutdown() first. Otherwise, one could wonder whether we can ge=
t
> >> rid of the complexity when a vCPU is still online.
> >
> > It's done first here because domain_shutdown() handles pausing of the
> > vCPUs internally, and this allows us to securely check whether the vCPU=
s
> > are online or not without interference from the guest.
> >
> > But you're probably right =E2=80=94 a better solution might be to perfo=
rm proper
> > checking of which vCPUs are still online before calling it.
>
> To clarify, I think this is right to call domain_shutdown() first to
> avoid any race when checking which vCPUs are still online (see the
> discussion we had in the previous version). My point is it would be good
> to document it in the code because this is not obvious.

got it

>
>
> >>
> >>> +        if ( v !=3D current && is_vcpu_online(v) )
> >>> +        {
> >>> +            do_resume_on_error(d);
> >>> +            return PSCI_DENIED;
> >>> +        }
> >>> +
> >>> +    ret =3D do_setup_vcpu_ctx(current, epoint, cid);
> >>> +    if ( ret !=3D PSCI_SUCCESS )
> >>> +        do_resume_on_error(d);
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>>    static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >>>    {
> >>>        /* /!\ Ordered by function ID and not name */
> >>> @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci=
_func_id)
> >>>        case PSCI_0_2_FN32_SYSTEM_OFF:
> >>>        case PSCI_0_2_FN32_SYSTEM_RESET:
> >>>        case PSCI_1_0_FN32_PSCI_FEATURES:
> >>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>        case ARM_SMCCC_VERSION_FID:
> >>>            return 0;
> >>>        default:
> >>> @@ -344,6 +403,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *reg=
s, uint32_t fid)
> >>>            return true;
> >>>        }
> >>>
> >>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>> +    {
> >>> +        register_t epoint =3D PSCI_ARG(regs,1);
> >>> +        register_t cid =3D PSCI_ARG(regs,2);
> >>
> >> Coding style: For the two lines above, there is a missing space after =
",".
> >
> > Sure, will fix =E2=80=94 thanks for pointing that out.
> >
> >>
> >> Also, if a 64-bit domain is calling the 32-bit version, then we also
> >> need to ignore the top 32-bits. AFAICT CPU_ON also have the same issue=
.
> >> I am not going to ask fixing CPU_ON (it would be good though), but I
> >> will at least ask we don't spread the mistake further.
> >
> > Maybe it would be better to return an error in this case?
>
> Why should we return an error? This is valid for a 64-bit domain to use
> SMC32 convention.

I mean =E2=80=94 in that case, is it possible that the upper 32 bits are se=
t to
non-zero values without it being an explicit error from the guest?

In my code, the macro used to extract 64-bit values (on 64-bit Xen, of
course) just copies values from the Xn registers directly.

According to the SMC Calling Convention specification:
"System Software on ARM Platforms" (ARM DEN 0028A), we must use Wn
for SMC32 parameters in AArch64.

AFAIK, writing to Wn zeroes the top 32 bits of Xn. So, if the guest
is properly using 32-bit values for arguments, the upper bits will already
be zeroed.

If the guest deliberately writes to the full Xn register --
perhaps to simplify handling of both SMC32 and SMC64, it may set
non-zero upper bits. In that case, I believe this is a guest error.


Finally, from the same document, section 3.1 "Register use in AArch64
SMC calls":

    The same architectural registers, R0=E2=80=93R7, are used for the two A=
Arch64
    calling conventions, SMC32 and SMC64.
    The working size of the register is identified by its name:
        Xn: All 64 bits used.
        Wn: Lower 32 bits used, upper 32 bits are zero.

So, I think we should not ignore the upper 32 bits and should instead
treat non-zero values as an error when handling SMC32 calls from AArch64.
Alternatively, we could simply do nothing and expect the guest to follow
the SMC Calling Convention specification and fill the registers
accordingly.


Best regards,
Mykola

>
> > Should I also add checks for the case where the guest OS is 32-bit but
> > tries to call the 64-bit version of SYSTEM_SUSPEND?
>
> We already have this generic check at the beginning of vsmccc_handle_call=
().
>
> Cheers,
>
> --
> Julien Grall
>

