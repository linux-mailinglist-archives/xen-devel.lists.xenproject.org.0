Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5173ACFE8F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008215.1387453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSok-0000aE-Tm; Fri, 06 Jun 2025 08:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008215.1387453; Fri, 06 Jun 2025 08:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSok-0000Xz-QQ; Fri, 06 Jun 2025 08:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1008215;
 Fri, 06 Jun 2025 08:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNSok-0000Xt-9G
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:52:50 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f93ba39-42b3-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:52:49 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5536b9be5f6so121195e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:52:49 -0700 (PDT)
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
X-Inumbo-ID: 9f93ba39-42b3-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749199969; x=1749804769; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3Nf4nRdpm8xP37eHHBxcbHah62cYVPy+P3J3XUcmyc=;
        b=JyH+5U+rmKl5dwBirfe6u3EACqrvl+x2OjLRstgZvK199kxnHoRdOG1bn4ddtln230
         OWaEtxWoR2yX7k7KSOBGCYqvHXpffiZhlOIm/bWY43tdkxl4fMVp0/gG/TxpotPX+L4c
         sk0gVFWHX5e+KJS1fxXby2mwooauiy/zv8ySpMrDHfQ7dNXEPopgwX+1WMKxl3YbPyo3
         IN8flc0b7CRd9jOowntJscFg3Z0RsGtcD8bu38inTFfZjWFIC+sD+MDRggDXLqI4lPGQ
         8BJn3MxU/fuCjEQDFtviAVk+C8aqRhPta7cRGnekLsSqlrSX5Hgl7UevHDANVueKw77B
         P3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199969; x=1749804769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3Nf4nRdpm8xP37eHHBxcbHah62cYVPy+P3J3XUcmyc=;
        b=clwrfgpG8JTU9B4bf4aEM6ArshtG1gfhITswhLCJLgHZEVGriXzOVucX+ExWqHap8Z
         NW8+DBMAf6nIWWh9iDMm0i9x/Nb0TUGKyCJZOBY7iwUW82ZMcbpZFI6VRP1G77mV2mVK
         LFTc2u9IYFH5GXAHSHEDzvMxJsO4a5aqXyBPK26Qgpi1rc02qEDmz81aVv910eQ6U46Z
         yaAZ55DVYyR4Ok4e1DzTnyEKZ0I8SryULrzodNJGC48sOB1ve7vaiugIJha+UFvyAvTq
         Q8fl8TsN13fd1zdL1qE77rLlT09zvtPcRHC/DRiHA4xaResNyEhyAPPYr8UpLhhJqKqV
         bJxA==
X-Gm-Message-State: AOJu0Yyb6Kqk3gL4G01lqfDxF7LfVcGQ9inG4VyeSfENriNQMFezk8dS
	Y1BOimn7ArsFm1U3LBllvhmSLVNlf6w7DcfF4grPed5FxO+EKJudh+sygWDX5kcRN4TwFkdA5KV
	Ut6KjmHflWAQ1GM4kH4/DGb424rl8g9E=
X-Gm-Gg: ASbGncuwhkfFnJTUeZcWVmL70zn7TXFZrrH4G4i2WTISNkCtF01l19yBhXi6wVzBrIX
	NTIcUVCDD/RtcHK90sVFTLNl5vG457DLhU19TZuYAO/HM2th4rLJ2uDZ/OTMqFzx1RjhuoVZSsY
	vu8fHvX1tHnG3m31rtly3o9atyZStSSaRhdRMsC4tchg==
X-Google-Smtp-Source: AGHT+IG/4FjqOIqTJlSdM9LbyL3BroQn9ZmIQthGyrfyi1Z8DsSBdASAua3/hxY5j36DXQhJwa5M+Lyv7DA2ls/NxT4=
X-Received: by 2002:a05:6512:1152:b0:552:41b:1c79 with SMTP id
 2adb3069b0e04-55366e3392fmr633324e87.49.1749199968385; Fri, 06 Jun 2025
 01:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org> <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
 <CAGeoDV9VTj4e0zKnYGJGrHe797oQrbRifbi7qiz-Uc9zFMgrTw@mail.gmail.com> <aaf8c96f-a862-438b-9e16-a38d9f245bf4@xen.org>
In-Reply-To: <aaf8c96f-a862-438b-9e16-a38d9f245bf4@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 6 Jun 2025 11:52:27 +0300
X-Gm-Features: AX0GCFsYfcnfvTo_OfEkwLkYsRhAayuPBc4W_HWX2GBiN3-wManB95tRLkfvsxg
Message-ID: <CAGeoDV8Tddy+jV5g5vSkg_S29hOjaifGnqJ-Po8zXHzQ-tSBxw@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 11:40=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 06/06/2025 09:26, Mykola Kvach wrote:
> > On Fri, Jun 6, 2025 at 6:52=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail=
.com> wrote:
> >>
> >> Hi, @Julien Grall
> >>
> >> On Wed, Jun 4, 2025 at 2:00=E2=80=AFAM Julien Grall <julien@xen.org> w=
rote:
> >>>
> >>> Hi Mykola,
> >>>
> >>> On 27/05/2025 10:18, Mykola Kvach wrote:
> >>>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>>
> >>>> This patch adds support for the PSCI SYSTEM_SUSPEND function in the =
vPSCI
> >>>> (virtual PSCI) interface, allowing guests to request suspend via the=
 PSCI
> >>>> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> >>>>
> >>>> The implementation:
> >>>> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> >>>> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> >>>> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
> >>>>     hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting=
 the
> >>>>     system in hwdom_shutdown() called from domain_shutdown
> >>>> - Ensures all secondary VCPUs of the calling domain are offline befo=
re
> >>>>     allowing suspend due to PSCI spec
> >>>> - Treats suspend as a "standby" operation: the domain is shut down w=
ith
> >>>>     SHUTDOWN_suspend, and resumes execution at the instruction follo=
wing
> >>>>     the call
> >>>
> >>> Looking at the specification, I am still not convinced you can implem=
ent
> >>> PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
> >>> SYSTEM_SUSPEND", the wording implies the call cannot return when it i=
s
> >>> successul.
> >>>
> >>> I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND=
)
> >>> suggests the caller should apply all the rules from 5.4 ("Caller
> >>> responsabilties" for CPU_SUSPEND), but it is also mentioned that
> >>> SYSTEM_SUSPEND behave as the deepest power down state.
> >>>
> >>> So I don't think standby is an option. I would like an opinion from t=
he
> >>> other maintainers.
> >>
> >> Sure, let's discuss this with the others.
> >>
> >>>
> >>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, regist=
er_t cid)
> >>>   > +{> +    struct vcpu *v;
> >>>> +    struct domain *d =3D current->domain;
> >>>> +
> >>>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware=
 domain */
> >>>> +    if ( is_hardware_domain(d) )
> >>>> +        return PSCI_NOT_SUPPORTED;
> >>>> +
> >>>> +    /* Ensure that all CPUs other than the calling one are offline =
*/
> >>>> +    for_each_vcpu ( d, v )
> >>>> +    {
> >>>> +        if ( v !=3D current && is_vcpu_online(v) )
> >>>
> >>> I think this is racy because you can still turn on a vCPU afterwards
> >>> from a vCPU you haven't checked.
> >>>
> >>
> >> I'll think about how to protect against such cases.
> >> Thank you for pointing that out.
> >
> > Is that actually possible in this context? If suspend is successful, we=
 pause
> > all present vCPUs (including the current one), and control is not retur=
ned to
> > the guest until either resume or an error occurs in this function. Sinc=
e this
> > runs as part of a trap, the current function can't be preempted.
>
> AFAIU, this code is called before suspend is completed. At that point
> you don't know yet the state of the vCPUs. They may be scheduled on a
> different pCPU. At which point, they can issue PSCI_CPU_ON.

Got it, thank you.

>
> >
> > Also, from the use of _VPF_down (via is_vcpu_online) on Arm, it looks l=
ike
> > guest requests are what manipulate this bit, which further limits what =
can
> > happen concurrently.
>
> I don't see how this help. See why above. So you will want to at least
> pause the domain before checking if all the vCPUs are offline.
>
>  > Note: It looks like the same behavior is present for VCPUOP_down as we=
ll.
>
>  From a brief look, I agree the same behavior is present there.
>
> Cheers,
>
> --
> Julien Grall
>

