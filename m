Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271A8AB273
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709175.1108465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqWv-0008FD-Se; Fri, 19 Apr 2024 15:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709175.1108465; Fri, 19 Apr 2024 15:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqWv-0008CS-PJ; Fri, 19 Apr 2024 15:52:01 +0000
Received: by outflank-mailman (input) for mailman id 709175;
 Fri, 19 Apr 2024 15:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxqWu-0008CM-R1
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:52:00 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c127921f-fe64-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 17:51:59 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-222a9eae9a7so1131641fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:51:59 -0700 (PDT)
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
X-Inumbo-ID: c127921f-fe64-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713541918; x=1714146718; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52XWV8wGCSY1/Gl22iIBfbwOlsfTmnWzIfnJ7ho/Rw8=;
        b=Nu5nSAU8dgnGyskPjMlD3vL8oq0EtvnQct+sS+3U6Ey0WWI1hadlm+F3dmdb5SyYHC
         TD/AxL/9m6GcGzPTrUzcVMVePwF+M+h5XYw0bKSPeOUcb3u/VU5cK3IwxDSwMOGyWUTL
         YFDqrlSrGnITvFWMHL6dfqZCurUS6U0MIbJ3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713541918; x=1714146718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52XWV8wGCSY1/Gl22iIBfbwOlsfTmnWzIfnJ7ho/Rw8=;
        b=jxbC4AHgxYatotbdz4uu9Xdd536xIpqpQPLEZoQNKwhXoIFac15eVHx+AcjBlo8v3i
         RQPOo5QRaiMl1Jg3Xa6eZv1W5SbMnN9iDIdwoX1o/iW+jNiPOdXe95OqwptMMEPuV4Tb
         OYhFtWna50iq2BCOtrcV5C3DARjj0tUlsCfpdKkDKImT8UMcZmkj0OvrIKPBFJCEqTql
         SfqEDI1CZ3kwRC56dWSPYOJNWglNos2jYLM4H19kf74PHTOPj+7bhued9SgyswG84Y2n
         SIkx17QxBZt7Uq83gcjZMq/6woBXIFESMfxqVwkx8GMW1Ls+JmF7YGyCDrjYJlTzHhmL
         nVXw==
X-Forwarded-Encrypted: i=1; AJvYcCVpBTnag6Wu4KAGdAYPVxK+czagIohBntJwYA+/IS8+fLCXOr8Ee2RII/nM9Qfjvam/k/PhD+huZrOnuahpo0kU0WvLI0ZHMc6yKXb9YXs=
X-Gm-Message-State: AOJu0YxQmZg7Hhd/MMlrVWiuXpgYMT82I1ePe5eoicEZIryLj2PXMQnx
	mj4ui+pGl2Df9qpfrKc89zC5kKNq97q0UPvrn/h4+oWRKgzaBU9Uv0g+uv01KR3NlNOMigQvFbK
	KG9k1cr/wevM8+r28/NxA5g/LlVNsO71gZCiV1Q==
X-Google-Smtp-Source: AGHT+IGkhTWytETLEuEomd/TqS1CcCyfnORNeJDUWkd9UdrDlLi7K23yWyHVjvmsiYoAe3jst2pRQdEaGia+jDSSgKE=
X-Received: by 2002:a05:6870:e0c8:b0:239:4:589b with SMTP id
 a8-20020a056870e0c800b002390004589bmr2733365oab.7.1713541918031; Fri, 19 Apr
 2024 08:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
 <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com> <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
 <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com> <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com>
In-Reply-To: <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 19 Apr 2024 16:51:46 +0100
Message-ID: <CA+zSX=Y+SuWyNFCKqKXRhXZCe6SK8ZbBdRQQzyg1FJAatR8rMQ@mail.gmail.com>
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 4:29=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com> wrote:
>
> On Fri, Jul 7, 2023 at 3:56=E2=80=AFPM George Dunlap <george.dunlap@cloud=
.com> wrote:
> >> >>> Xen's public interface offers access to the featuresets known / fo=
und /
> >> >>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessi=
ble
> >> >>> via xc_get_cpu_featureset().
> >> >>>
> >> >>
> >> >> Are any of these exposed in dom0 via sysctl, or hypfs?
> >> >
> >> > sysctl - yes (as the quoted name also says). hypfs no, afaict.
> >> >
> >> >>  SYSCTLs are
> >> >> unfortunately not stable interfaces, correct?  So it wouldn't be pr=
actical
> >> >> for systemd to use them.
> >> >
> >> > Indeed, neither sysctl-s nor the libxc interfaces are stable.
> >>
> >> Thinking of it, xen-cpuid is a wrapper tool around those. They may wan=
t
> >> to look at its output (and, if they want to use it, advise distros to
> >> also package it), which I think we try to keep reasonably stable,
> >> albeit without providing any guarantees.
> >
> >
> > We haven't had any clear guidance yet on what the systemd team want in =
the <xen in a VM, systemd in a dom0> question; I just sort of assumed they =
wanted the L-1 virtualization *if possible*.  It sounds like `vm-other` wou=
ld be acceptable, particularly as a fall-back output if there's no way to g=
et Xen's picture of the cpuid.
> >
> > It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the=
 old Virt SIG CentOS packages; so I'd expect most packages to follow suit. =
 That's a place to start.
> >
> > Just to take the discussion all the way to its conclusion:
> >
> > - Supposing xen-cpuid isn't available, is there any other way to tell i=
f Xen is running in a VM from dom0?
> >
> > - Would it make sense to expose that information somewhere, either in s=
ysfs or in hypfs (or both?), so that eventually even systems which may not =
get the memo about packaging xen-cpuid will get support (or if the systemd =
guys would rather avoid executing another process if possible)?
>
> Resurrecting this thread.
>
> To recap:
>
> Currently, `systemd-detect-virt` has the following  input / output table:
>
> 1. Xen on real hardware, domU: xen
> 2. Xen on real hardware, dom0: vm-other
> 3. Xen in a VM, domU: xen
> 4. Xen in aVM, dom0: vm-other
>
> It's the dom0 lines (2 and 4) which are problematic; we'd ideally like
> those to be `none` and `vm-other` (or the actual value, like `xen` or
> `kvm`).
>
> It looks like ATM, /proc/xen/capabilities will contain `control_d` if
> it's a dom0.  Simply unilaterally returning `none` if
> /proc/xen/capabilities contains `control_d` would correct the vast
> majority of instances (since the number of instances of Xen on real
> hardware is presumably higher than the number running virtualized).
>
> Is /proc/xen/capabilities expected to stay around?  I don't see
> anything equivalent in /dev/xen.
>
> Other than adding a new interface to Xen, is there any way to tell if
> Xen is running in a VM?  If we do need to expose an interface, what
> would be the best way to do that?

Actually, the entire code for detection is here:

https://github.com/systemd/systemd/blob/f5fefec786e35ef7606e2b14e2530878b74=
ca879/src/basic/virt.c

The core issue seems to be this bit:

        /* Detect from CPUID */
        v =3D detect_vm_cpuid();
        if (v < 0)
                return v;
        if (v =3D=3D VIRTUALIZATION_VM_OTHER)
                other =3D true;
        else if (v !=3D VIRTUALIZATION_NONE)
                goto finish;

        /* If we are in Dom0 and have not yet finished, finish with
the result of detect_vm_cpuid */
        if (xen_dom0 > 0)
                goto finish;

Basically, the code expects that dom0 will be able to read the raw
virtualization CPUID leaves, and that the result will be
VIRTUALIZATION_NONE on real hardware.

But in fact, the result appears to be VIRTUALIZATION_VM_OTHER -- which
would mean that 1) the CPUID instruction for reading CPUID leaf 0x1
succeeded, 2) the 'hypervisor' bit was set, but 3) the signature at
the hypervisor information leaf (0x40000000) didn't match any
hypervisor (including XenVMMXenVMM, which it's looking for).

What do we do in regard to these for dom0?

 -George

