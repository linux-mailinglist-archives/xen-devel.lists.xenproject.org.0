Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C948D528E
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733005.1139098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCli6-00007X-7x; Thu, 30 May 2024 19:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733005.1139098; Thu, 30 May 2024 19:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCli6-000054-4l; Thu, 30 May 2024 19:45:14 +0000
Received: by outflank-mailman (input) for mailman id 733005;
 Thu, 30 May 2024 19:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCli5-0007hJ-Bx
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:45:13 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 209a75a0-1ebd-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 21:45:11 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b87505f01so73458e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 12:45:11 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d89279sm55002e87.244.2024.05.30.12.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 12:45:10 -0700 (PDT)
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
X-Inumbo-ID: 209a75a0-1ebd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717098311; x=1717703111; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9mHYZgWE9lLreAEm31XHRh2mF44QYu4c7ycfIU+9ZIk=;
        b=PAnPFSMenajWMNN6NbRYD+fz1FE+GGZOcJDWBm7QyRDXtVOJ/VoJDJNxOzeBkqzct6
         k4KM++En7bWFDYlMoq3ecZqRO/aRnVLxXPPD85J9HddH3RdTvKNXC7gOBmUEgMgbBHGs
         hehtSJgsLD0Znpkq0gFwrotRLCIUfww6V1j2xFFcnWZn/nM0xj7GZ1MQ1yYF+PJNOm8+
         LGxLyDRqmpan07cj2E3BNkqmrCNkJASj6zijBUHAn5w4SltfI8ijK04rPwkJL1nGYiiw
         Fg66Xs4PtZQsuJEEOb/cfFfKPOyDoVvCLJl7igZKGWCBIHzQJDZep7ITVxzbqe6QYKO7
         F8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717098311; x=1717703111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mHYZgWE9lLreAEm31XHRh2mF44QYu4c7ycfIU+9ZIk=;
        b=iFQpq94jtPrwTm3s5j9ILSBbtLp/sEjrzOOoQup8sRb7bBGIBWi2mJrr4kZ7GtFw2P
         NvZo5FLO4py1yPS5XdwNYhLZm/iS9A/DFwJaHoq91p8c9px64MvNT2O9Fz4/z46geIy1
         QymnNZmXfk6q0RqeqGxh8Une8feKu/h8P8MCBBEUDHhtX9Bqn5e70ezFhdV0+FZNgZE9
         GudJULyg7OV61RD0xEyi7MYCFhSJWg6smUZX8SoyLDuy0GaqhWMoftGzs9f7630dOUmO
         7jgGrCDVCtaQinFqPrE4qkTq75+tEMigd2NTxhCDzISqaii4gqY3nqlggA4uXxeLWbs7
         bBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsmH9R0F2YXHbHUreih2FvMclQjdEbSDWK3SOgZwvhReujgnbFsdzZSJ0/6tcGTev/tKJXRLEp9QI+lfH4KtU4ldMTtxq3Lio5zqJF1lk=
X-Gm-Message-State: AOJu0YxDckSHi4s3Kfg2aOXM47zDA+FhVJZ7qFzvKsWdks2vUqUCivSP
	5u2G1DzgMWUcke9xJFT+lZfh+d0A//Ylredsr+gdhsCfdHEmdZl4
X-Google-Smtp-Source: AGHT+IHBBM3NzlNbOhsvPnamA9T6IP2Gv1nTl6C3lCz3LlkMqYDYfbHqzjNr9bmiEN1PAuSSQ45g9A==
X-Received: by 2002:a05:6512:3a5:b0:52b:7917:9966 with SMTP id 2adb3069b0e04-52b7d418fc2mr1717709e87.8.1717098311121;
        Thu, 30 May 2024 12:45:11 -0700 (PDT)
Message-ID: <67e54efb6c8a4bee1d244df08b6e48b17c79a84d.camel@gmail.com>
Subject: Re: [PATCH 2/2] arch/irq: Centralise no_irq_type
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Thu, 30 May 2024 21:45:10 +0200
In-Reply-To: <20240530184027.44609-3-andrew.cooper3@citrix.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
	 <20240530184027.44609-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 19:40 +0100, Andrew Cooper wrote:
> Having no_irq_type defined per arch, but using common callbacks is a
> mess, and
> particualrly hard to bootstrap a new architecture with.
>=20
> Now that the ack()/end() hooks have been exported suitably, move the
> definition of no_irq_type into common/irq.c, and into .rodata for
> good
> measure.
>=20
> No functional change, but a whole lot less tangled.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
LGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
> Oleksii: For RISC-V, you should only need to provide a irq_ack_none()
> stub now.
Sure, I will update my patch series during rebase.

~ Oleksii
> ---
> =C2=A0xen/arch/arm/irq.c=C2=A0=C2=A0=C2=A0 | 10 ----------
> =C2=A0xen/arch/ppc/stubs.c=C2=A0 |=C2=A0 9 ---------
> =C2=A0xen/arch/x86/irq.c=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ---------
> =C2=A0xen/common/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++++++++
> =C2=A0xen/include/xen/irq.h |=C2=A0 2 +-
> =C2=A05 files changed, 14 insertions(+), 29 deletions(-)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7138f9e7c283..e5fb26a3de2d 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -45,16 +45,6 @@ void irq_end_none(struct irq_desc *irq)
> =C2=A0=C2=A0=C2=A0=C2=A0 gic_hw_ops->gic_host_irq_type->end(irq);
> =C2=A0}
> =C2=A0
> -hw_irq_controller no_irq_type =3D {
> -=C2=A0=C2=A0=C2=A0 .typename =3D "none",
> -=C2=A0=C2=A0=C2=A0 .startup =3D irq_startup_none,
> -=C2=A0=C2=A0=C2=A0 .shutdown =3D irq_shutdown_none,
> -=C2=A0=C2=A0=C2=A0 .enable =3D irq_enable_none,
> -=C2=A0=C2=A0=C2=A0 .disable =3D irq_disable_none,
> -=C2=A0=C2=A0=C2=A0 .ack =3D irq_ack_none,
> -=C2=A0=C2=A0=C2=A0 .end =3D irq_end_none
> -};
> -
> =C2=A0static irq_desc_t irq_desc[NR_IRQS];
> =C2=A0static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
> =C2=A0
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index 4e03428e071a..923f0e7b2095 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -139,15 +139,6 @@ void irq_ack_none(struct irq_desc *desc)
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0}
> =C2=A0
> -hw_irq_controller no_irq_type =3D {
> -=C2=A0=C2=A0=C2=A0 .typename =3D "none",
> -=C2=A0=C2=A0=C2=A0 .startup =3D irq_startup_none,
> -=C2=A0=C2=A0=C2=A0 .shutdown =3D irq_shutdown_none,
> -=C2=A0=C2=A0=C2=A0 .enable =3D irq_enable_none,
> -=C2=A0=C2=A0=C2=A0 .disable =3D irq_disable_none,
> -=C2=A0=C2=A0=C2=A0 .ack =3D irq_ack_none,
> -};
> -
> =C2=A0int arch_init_one_irq_desc(struct irq_desc *desc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index cfd7a08479d2..e36e06deaa68 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -472,15 +472,6 @@ void cf_check irq_ack_none(struct irq_desc
> *desc)
> =C2=A0=C2=A0=C2=A0=C2=A0 ack_bad_irq(desc->irq);
> =C2=A0}
> =C2=A0
> -hw_irq_controller no_irq_type =3D {
> -=C2=A0=C2=A0=C2=A0 "none",
> -=C2=A0=C2=A0=C2=A0 irq_startup_none,
> -=C2=A0=C2=A0=C2=A0 irq_shutdown_none,
> -=C2=A0=C2=A0=C2=A0 irq_enable_none,
> -=C2=A0=C2=A0=C2=A0 irq_disable_none,
> -=C2=A0=C2=A0=C2=A0 irq_ack_none,
> -};
> -
> =C2=A0static vmask_t *irq_get_used_vector_mask(int irq)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 vmask_t *ret =3D NULL;
> diff --git a/xen/common/irq.c b/xen/common/irq.c
> index 7225b4637486..29729349a6f2 100644
> --- a/xen/common/irq.c
> +++ b/xen/common/irq.c
> @@ -3,6 +3,19 @@
> =C2=A0
> =C2=A0DEFINE_PER_CPU(const struct cpu_user_regs *, irq_regs);
> =C2=A0
> +const hw_irq_controller no_irq_type =3D {
> +=C2=A0=C2=A0=C2=A0 .typename=C2=A0 =3D "none",
> +=C2=A0=C2=A0=C2=A0 .startup=C2=A0=C2=A0 =3D irq_startup_none,
> +=C2=A0=C2=A0=C2=A0 .shutdown=C2=A0 =3D irq_shutdown_none,
> +=C2=A0=C2=A0=C2=A0 .enable=C2=A0=C2=A0=C2=A0 =3D irq_enable_none,
> +=C2=A0=C2=A0=C2=A0 .disable=C2=A0=C2=A0 =3D irq_disable_none,
> +=C2=A0=C2=A0=C2=A0 .ack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D irq_ack_=
none,
> +
> +#ifdef irq_end_none /* Hook is optional per arch */
> +=C2=A0=C2=A0=C2=A0 .end=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D irq_end_=
none,
> +#endif
> +};
> +
> =C2=A0int init_one_irq_desc(struct irq_desc *desc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 int err;
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index b71f65db8621..327cd2217c7e 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -122,7 +122,7 @@ extern int request_irq(unsigned int irq, unsigned
> int irqflags,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 void (*handler)(int irq, void *dev_id),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 const char *devname, void *dev_id);
> =C2=A0
> -extern hw_irq_controller no_irq_type;
> +extern const hw_irq_controller no_irq_type;
> =C2=A0void cf_check no_action(int cpl, void *dev_id);
> =C2=A0unsigned int cf_check irq_startup_none(struct irq_desc *desc);
> =C2=A0void cf_check irq_actor_none(struct irq_desc *desc);


