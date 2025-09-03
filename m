Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D04B41392
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 06:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107799.1458039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utf9f-0004vg-Og; Wed, 03 Sep 2025 04:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107799.1458039; Wed, 03 Sep 2025 04:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utf9f-0004vB-Ld; Wed, 03 Sep 2025 04:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1107799;
 Wed, 03 Sep 2025 04:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIR0=3O=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utf9e-0004uK-FR
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 04:31:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0960de-887e-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 06:31:29 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f76277413so3640335e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 21:31:28 -0700 (PDT)
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
X-Inumbo-ID: dc0960de-887e-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756873888; x=1757478688; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Rjp4rWjiJ+Q8/JHFJO/pL8imA5SGgCabIA2HZVHGA=;
        b=EoOyWjB33ywdtONVnm8uHK3M2jkFn9J4rVgTC8qlV+Dlu4ETJppJKMZPDsQWhhsqYD
         hC2/h0PL/HKZgevu4ifrrcwJbsIa2bemvNqST5ox0rz+fIrhvW80z0cQUxAoLr2FDaDT
         ibgMF/hoFIff0anVh3zvKDs3YSvTy9Pxd47L60SqXe/y6tG0eG4RtPb2NaWQtoaGHcqY
         716EWJ2DWmrldUXszIOcsiO1UwP3kqQ7dFW1zNcBmxjZ1bGH+XRH4Lxqb/MpaOo33m61
         EwXZz9+HwHBaNZ2mxcwS0GztiQPV49/RIzzhQ/kNkpeRk7ulrcGQZp/GgJwZZHMuk7Fd
         lD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756873888; x=1757478688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+Rjp4rWjiJ+Q8/JHFJO/pL8imA5SGgCabIA2HZVHGA=;
        b=cphnCseHWplZLW/ng3Vuiw1Xsc3sqPZO+uiAICPbg966DIBXy7OegzRNGdthprEFkW
         omA8FXXtwfSDzdrNynV7dde+mOnwhAagmXQ69FXsYzvnhASEMYBdlkPQ1hgW0UIPvgjm
         Mql57PIB5L5cMX7aC5taFHSWLDccvh//XRjppkTx4VegzowiGSV30GvEQP51bulmPcec
         BssatCXH/s/hjVi28U+YnP1+JJ+2wgQMYE3oyY3xxpjjH+1bB5DXoXGb/qc/VdV9jaFj
         LJnpIfiCqPPZAD5yowuSmAZwAJuXuNkzArjhxw632hrs2cjB1+ezYqBeknmu/oacyJDB
         TRdA==
X-Forwarded-Encrypted: i=1; AJvYcCVHRBEJPXOh29LVZWHSU7d6CyFCmCgUjWGq0atGcmjNM3MoIq+yYQ0p/hQXcab2iRvcsjABn2ctN70=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKs+aBui8lANp9YT/V75k0s7DvmVtYac9B8Yh2goRudxThrtCJ
	+PK+AgfQdPU5m69GzH8iosCXdLksQ+gmevbMiGPBJb+bW1D4jRilUpLaGfV3cWPJZbv3EYnViO9
	XetCPrq/SPzl/mfbHcFhSZ8ecorHWH/Q=
X-Gm-Gg: ASbGncsJiAoE1SnH7mDarpi36UESRupneJlXyHDWbpg1MJN83Ajbz6e4UyI2Hy7zgqD
	ltBqIJE55xImA2rx3RdK3ZZjQZb3vPhgWIvexE6itnqLX/A1RMF0QYi/wKV92TTHsmvaDxQxxeH
	CDP8lwh1w4EdqSbfXjPfX6ixaHeU+naziIFr7M2q4/Aap4ihqLy9nixlAAdIMrMQJY0Y75VGKDh
	jtBFA==
X-Google-Smtp-Source: AGHT+IHN97zOfoCsiDh3Day+a7KPX+vUMz/KuF5ILvLwaWX7knBDMp9vLusF2oScPw2vAXr5xjBghQI7dmrC3vkTZtQ=
X-Received: by 2002:a05:6512:6413:b0:55f:6c72:b727 with SMTP id
 2adb3069b0e04-55f708bd284mr4050407e87.24.1756873887841; Tue, 02 Sep 2025
 21:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
In-Reply-To: <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Sep 2025 07:31:16 +0300
X-Gm-Features: Ac12FXxau6q0TYBp03hKV00QoaC7vg2bhz_LEL_NPctGEJV5GPha06RoSYe8lho
Message-ID: <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Sep 2, 2025 at 5:33=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2025 00:10, Mykola Kvach wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reason)
> >          d->shutdown_code =3D reason;
> >      reason =3D d->shutdown_code;
> >
> > +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> > +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> > +#else
> >      if ( is_hardware_domain(d) )
> > +#endif
> >          hwdom_shutdown(reason);
>
> I still don't follow why Arm-specific code needs to live here. If this
> can't be properly abstracted, then at the very least I'd expect some
> code comment here, or at the very, very least something in the descriptio=
n.

Looks like I missed your comment about this in the previous version of
the patch series.

>
> From looking at hwdom_shutdown() I get the impression that it doesn't
> expect to be called with SHUTDOWN_suspend, yet then the question is why w=
e
> make it into domain_shutdown() with that reason code.

Thank you for the question, it is a good one.

Thinking about it, with the current implementation (i.e. when the HW domain
requests system suspend), we don't really need to call domain_shutdown().
It would be enough to pause the last running vCPU (the current one) just to
make sure that we don't return control to the domain after exiting from the
hvc trap on the PSCI SYSTEM_SUSPEND command. We also need to set
shutting_down to ensure that any asynchronous code or timer callbacks
behave properly during suspend (i.e. skip their normal actions).

However, if we consider a setup with two separate domains -- one control an=
d
one HW -- where the control domain makes the final decision about system
suspend, then we would need to call __domain_finalise_shutdown() during the
HW domain suspend in order to notify the control domain that the HW domain
state has changed. The control domain would then check this state and call
system suspend for itself after confirming that all other domains are in a
suspended state.

I already added a TODO about moving this logic to the control domain. So, a=
t
first sight (unless I am missing something), we can avoid extra modificatio=
ns
inside domain_shutdown() and simply avoid calling it in case of HW domain.

>
> Jan

Best regards,
Mykola

