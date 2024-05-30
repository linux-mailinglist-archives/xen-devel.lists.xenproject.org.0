Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D468D5286
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733000.1139077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClhL-0007jm-Nf; Thu, 30 May 2024 19:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733000.1139077; Thu, 30 May 2024 19:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClhL-0007hP-L4; Thu, 30 May 2024 19:44:27 +0000
Received: by outflank-mailman (input) for mailman id 733000;
 Thu, 30 May 2024 19:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sClhJ-0007hJ-D2
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:44:25 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03bcea86-1ebd-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 21:44:23 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso462647e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 12:44:23 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34ac4sm58001e87.46.2024.05.30.12.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 12:44:22 -0700 (PDT)
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
X-Inumbo-ID: 03bcea86-1ebd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717098263; x=1717703063; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sukSV7LXz8sqSpeex4HAzcY4n5xGT54JRUeqy+8Pje0=;
        b=iwq8d7WEfkTNGxhyDBISpNZwN9EpKq7d8RC8KzMUtaGIgscoHr9a0v/XOa/TuOn8bI
         9Cqjx4il16FG/mRAmLpW4X2LXm6UuoheXzDqhyHaebHHNkiYegJCa13AUNWrqBceb4IN
         Cobs1e3uuK8J3jVyoB2V9IX/m0T9wXluUTFaanWaIIAuCsDJDVjjQJ+zROFQPGGk6nzc
         VDoSpd5QN8HekG+bL7X7VeL9y/PeQVDNG4NIbX9tS1F6QsYHfxAJtH17HBupNb+bVJRB
         4EEvMM8qKm4zQ12ZnVXSilHSzxkDhC1dYjHSDVhITobi3K7cHCE8+K3678Vge0xtcFTa
         Cgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717098263; x=1717703063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sukSV7LXz8sqSpeex4HAzcY4n5xGT54JRUeqy+8Pje0=;
        b=lnR6HtWBt1moIpjpkVUi8RXabJFIoa4MFlSt7Pki6kkiXrkawlQA6/cgrLIiwvMBNa
         R9F7WTfHAbLNAoQc6BY8/RPZl7wA4CP15+E9munkbTWcpcycjctVMMj5beEw+lSf7MNR
         3P4d5z6eNcFif2uxRSmwZkE/GDSbCjVjLNoWvIS420WjwYQOtE8hkmvKe3N7I2C2DpVq
         yozqguettpUk7JfrFTvhbUmzkEN9Vuq3iMMwhOYrYtlCTXT8+/o2xukP6nYl51rwD0eL
         E1WUrJsMyzy7sH2taz7z+tgE/V25ueNkYZyrOf/EN/UDAKkijeNRbPU2Me1XM0OHSbxI
         ADoA==
X-Forwarded-Encrypted: i=1; AJvYcCV/cpL85S+ytBkueUIIMhSZpBos0iO+3s8Lj8z34Y9+UEllJvCnlI0wacDYhgLX59hJ71RjoJ2hC/21kEyVBpAPZ8YX6h6E9cLm9eBXG+M=
X-Gm-Message-State: AOJu0Yzn5xdt9C12NLaUX+X0/mvY8A8MHOkrpQ7AnG+1aCbKLB8Tc/m6
	k0Mq3/uAx9frmVAt+k/5CK4pDkZ6uVs7QJx49Klu/649BNVcj4VU
X-Google-Smtp-Source: AGHT+IGjNszMiSTTc5sW2iEMeJSCX3mRUbzdRx1edzyfxTjKsEzmG7mZXN+ncQUdZ+Bj2Yu7sZBF/A==
X-Received: by 2002:a19:ac08:0:b0:529:593f:3f3c with SMTP id 2adb3069b0e04-52b7d47ac02mr2051476e87.53.1717098262444;
        Thu, 30 May 2024 12:44:22 -0700 (PDT)
Message-ID: <078d34627c96d923e473717f59789489fa199ea4.camel@gmail.com>
Subject: Re: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Thu, 30 May 2024 21:44:21 +0200
In-Reply-To: <20240530184027.44609-2-andrew.cooper3@citrix.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
	 <20240530184027.44609-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 19:40 +0100, Andrew Cooper wrote:
> Any non-stub implementation of these is going to have to do something
> here.
>=20
> irq_end_none() is more complicated and has arch-specific interactions
> with
> irq_ack_none(), so make it optional.
>=20
> For PPC, introduce a stub irq_ack_none().
>=20
> For ARM and x86, export the existing {ack,end}_none() helpers,
> gaining an irq_
> prefix for consisntency with everything else in no_irq_type.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
LGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> =C2=A0xen/arch/arm/include/asm/irq.h | 3 +++
> =C2=A0xen/arch/arm/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++++++
> =C2=A0xen/arch/x86/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0xen/include/xen/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 6 ++++++
> =C2=A05 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/irq.h
> b/xen/arch/arm/include/asm/irq.h
> index 1bae5388878e..ec437add0971 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -98,6 +98,9 @@ void irq_set_affinity(struct irq_desc *desc, const
> cpumask_t *mask);
> =C2=A0 */
> =C2=A0bool irq_type_set_by_domain(const struct domain *d);
> =C2=A0
> +void irq_end_none(struct irq_desc *irq);
> +#define irq_end_none irq_end_none
> +
> =C2=A0#endif /* _ASM_HW_IRQ_H */
> =C2=A0/*
> =C2=A0 * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index bcce80a4d624..7138f9e7c283 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -31,12 +31,12 @@ struct irq_guest
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int virq;
> =C2=A0};
> =C2=A0
> -static void ack_none(struct irq_desc *irq)
> +void irq_ack_none(struct irq_desc *irq)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 printk("unexpected IRQ trap at irq %02x\n", irq-=
>irq);
> =C2=A0}
> =C2=A0
> -static void end_none(struct irq_desc *irq)
> +void irq_end_none(struct irq_desc *irq)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Still allow a CPU to end an interrupt if=
 we receive a
> spurious
> @@ -51,8 +51,8 @@ hw_irq_controller no_irq_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 .shutdown =3D irq_shutdown_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 .enable =3D irq_enable_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 .disable =3D irq_disable_none,
> -=C2=A0=C2=A0=C2=A0 .ack =3D ack_none,
> -=C2=A0=C2=A0=C2=A0 .end =3D end_none
> +=C2=A0=C2=A0=C2=A0 .ack =3D irq_ack_none,
> +=C2=A0=C2=A0=C2=A0 .end =3D irq_end_none
> =C2=A0};
> =C2=A0
> =C2=A0static irq_desc_t irq_desc[NR_IRQS];
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index da193839bd09..4e03428e071a 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -134,12 +134,18 @@ void pirq_set_affinity(struct domain *d, int
> pirq, const cpumask_t *mask)
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0}
> =C2=A0
> +void irq_ack_none(struct irq_desc *desc)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> +}
> +
> =C2=A0hw_irq_controller no_irq_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 .typename =3D "none",
> =C2=A0=C2=A0=C2=A0=C2=A0 .startup =3D irq_startup_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 .shutdown =3D irq_shutdown_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 .enable =3D irq_enable_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 .disable =3D irq_disable_none,
> +=C2=A0=C2=A0=C2=A0 .ack =3D irq_ack_none,
> =C2=A0};
> =C2=A0
> =C2=A0int arch_init_one_irq_desc(struct irq_desc *desc)
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index c16205a9beb6..cfd7a08479d2 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -467,7 +467,7 @@ int __init init_irq_data(void)
> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0}
> =C2=A0
> -static void cf_check ack_none(struct irq_desc *desc)
> +void cf_check irq_ack_none(struct irq_desc *desc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 ack_bad_irq(desc->irq);
> =C2=A0}
> @@ -478,7 +478,7 @@ hw_irq_controller no_irq_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 irq_shutdown_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 irq_enable_none,
> =C2=A0=C2=A0=C2=A0=C2=A0 irq_disable_none,
> -=C2=A0=C2=A0=C2=A0 ack_none,
> +=C2=A0=C2=A0=C2=A0 irq_ack_none,
> =C2=A0};
> =C2=A0
> =C2=A0static vmask_t *irq_get_used_vector_mask(int irq)
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 89f7a8317a87..b71f65db8621 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -130,6 +130,12 @@ void cf_check irq_actor_none(struct irq_desc
> *desc);
> =C2=A0#define irq_disable_none irq_actor_none
> =C2=A0#define irq_enable_none irq_actor_none
> =C2=A0
> +/*
> + * irq_ack_none() must be provided by the architecture.
> + * irq_end_none() is optional, and opted into using a define.
> + */
> +void irq_ack_none(struct irq_desc *irq);
> +
> =C2=A0/*
> =C2=A0 * Per-cpu interrupted context register state - the inner-most
> interrupt frame
> =C2=A0 * on the stack.


