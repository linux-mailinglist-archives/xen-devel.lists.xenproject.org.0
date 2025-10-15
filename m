Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94026BDFDD2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 19:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143843.1477443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95KZ-0004TM-N5; Wed, 15 Oct 2025 17:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143843.1477443; Wed, 15 Oct 2025 17:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95KZ-0004Rz-KM; Wed, 15 Oct 2025 17:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1143843;
 Wed, 15 Oct 2025 17:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wenR=4Y=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1v95KY-0004Rt-2t
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 17:30:30 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4388dae-a9ec-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 19:30:28 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5818de29d15so8540849e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 10:30:28 -0700 (PDT)
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
X-Inumbo-ID: a4388dae-a9ec-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760549427; x=1761154227; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoUQQ4/8tu4aH9GKihsHY7cZFIXUjJL4wPcovrSb3Ro=;
        b=IaYol2iWCWSVwuq399I2PQ1yaSDoZg5vtUvMTL0Sjyo7s95pKW7DlqHqfkSiJYUaNu
         oB58Hze0pg6M924dyCgQCjdnLw08ko7x/J5fQHiPUjin90bvLlganXiR2Z0FL4Z33Z/Y
         Gs25eTL+SxdFop9+xtw+bJ4zqAuvSezXPJFyCd3M0NnDpBUnRlDLvmyEORljJaIbl1kO
         5VlFWQVcQKDAowjchhzSYJh1PcJLuzxXVbN6A91CVVIvmc9DHugHBBaMbFwa6CVebrNq
         a8E4tXDxx8qft02TUyZvDY9MHEyr5AGZ2aQicGadpHD5eW/gfHl0YPEl1TyJczaBARrO
         pqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760549427; x=1761154227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoUQQ4/8tu4aH9GKihsHY7cZFIXUjJL4wPcovrSb3Ro=;
        b=XnNWbD2fdhaaIHaEXRKTy4rM586TBMrGrwT2UdXbaSKBe0P7TFwB7Df0miXMr5XMx5
         zEmVqWBri4lHZvCfWR5tNqRur1T+yYacFMLJKqIOVGVrWlD76Dd2Sfp9Cflm63NTYNqG
         1zg6B1t8O5d4zCsxG5zjf8IRjlCZIroXOe8wie3qsIkomwSWGpUytHZC+YHYxSbIr0NT
         1Qbtr4fnS+kXH/qwUDjvJ4+Ce1pmla5KFQ9itR6b9N/9LDye257IN4yKqO0x/K9Gdc9Q
         Ehv97aJUgn3qmskPpCpvKMh3p1GxfMANb1zOUW/23QJ3RC0TR2cWktHznzYsvUnKFQ6t
         PPMQ==
X-Gm-Message-State: AOJu0Yzl7+YBDLptXZ3JHm1kNSiyLwVd6uPBokOayc1x+J7JSvA5g/68
	FXUtHewcINmOmikaprp0UWPOqifnsqNC8lChcdf7ywX70GcffS9ZuMOFv42vPHaNNuyY5VfZbuR
	+PYQUGYXzxVAfJ4fmqZuIpl3ZvmXUlZs=
X-Gm-Gg: ASbGncudMFEQHsxasoZm36RkrmrTi7gF3AtJMQqNt5eM3eafpUKetVldOMJshQZgRYI
	Bg3Kp1Kzi9wmHCS1NjtuivIXkU2OigLAteFQiEO/vTSd2eLHYiQloRTd+VmR9t3imCQ06VYrIHe
	exOYNNUqfUZTt7BOGsA4DJl/XvzW8JMpFEi6THy7ymOE0e3HznvhvMr32JMIbLSE0O6tETdvXbP
	WPNhE8sZxwYBCPgsKX4MwaW
X-Google-Smtp-Source: AGHT+IHjhQWz1AgIFI9fPVSU+mnBsLw+lDuNf0LiNlK7wcFZNbzfh88olSrKcKRuvHEVMB8gJ/SxsXvd0UYblIGlCMM=
X-Received: by 2002:a05:6512:3a8e:b0:586:883e:b7c6 with SMTP id
 2adb3069b0e04-5906dd6f97amr8544473e87.30.1760549427205; Wed, 15 Oct 2025
 10:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760083684.git.mykyta_poturai@epam.com> <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1760083684.git.mykyta_poturai@epam.com>
In-Reply-To: <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1760083684.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 15 Oct 2025 20:30:00 +0300
X-Gm-Features: AS18NWDmzxoGK2nKKUZNsOnGqO6q13aluJLFomfPZDkHoXtWBgGVZTx5rAKJKfM
Message-ID: <CAGeoDV9WFSXbNmeCw002aNMSscL01dVvYzUYxg-a28QqXi2onA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] arm/time: Use static irqaction
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykyta,

On Fri, Oct 10, 2025 at 12:22=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epa=
m.com> wrote:
>
> When stopping a core deinit_timer_interrupt is called in non-alloc
> context, which causes xfree in release_irq to fail an assert.
>
> To fix this, switch to a statically allocated irqaction that does not
> need to be freed in release_irq.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>
> v2->v3:
> * no changes
>
> v1->v2:
> * Use percpu actions
> ---
>  xen/arch/arm/time.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..59349467de 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -303,9 +303,15 @@ static void check_timer_irq_cfg(unsigned int irq, co=
nst char *which)
>             "WARNING: %s-timer IRQ%u is not level triggered.\n", which, i=
rq);
>  }
>
> +DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
> +DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);

Scope nit (MISRA C:2012 R8.8):
if irq_hyp and irq_virt are only used in this TU, give it internal linkage.

> +
>  /* Set up the timer interrupt on this CPU */
>  void init_timer_interrupt(void)
>  {
> +    struct irqaction *hyp_action =3D &this_cpu(irq_hyp);
> +    struct irqaction *virt_action =3D &this_cpu(irq_virt);
> +
>      /* Sensible defaults */
>      WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
>      /* Do not let the VMs program the physical timer, only read the phys=
ical counter */
> @@ -314,10 +320,17 @@ void init_timer_interrupt(void)
>      WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
>      isb();
>
> -    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> -                "hyptimer", NULL);
> -    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
> -                   "virtimer", NULL);
> +    hyp_action->name =3D "hyptimer";
> +    hyp_action->handler =3D htimer_interrupt;
> +    hyp_action->dev_id =3D NULL;
> +    hyp_action->free_on_release =3D 0;
> +    setup_irq(timer_irq[TIMER_HYP_PPI], 0, hyp_action);
> +
> +    virt_action->name =3D "virtimer";
> +    virt_action->handler =3D vtimer_interrupt;
> +    virt_action->dev_id =3D NULL;
> +    virt_action->free_on_release =3D 0;
> +    setup_irq(timer_irq[TIMER_VIRT_PPI], 0, virt_action);
>
>      check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
>      check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
> --
> 2.34.1
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

