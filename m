Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C427DBB5F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625131.974083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSuV-00077f-5o; Mon, 30 Oct 2023 14:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625131.974083; Mon, 30 Oct 2023 14:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSuV-00075N-2b; Mon, 30 Oct 2023 14:06:31 +0000
Received: by outflank-mailman (input) for mailman id 625131;
 Mon, 30 Oct 2023 14:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFdh=GM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxSuT-00075H-FR
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:06:29 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e5621e-772d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 15:06:28 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so6236910e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 07:06:28 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056512238800b00507a0017931sm1446405lfv.167.2023.10.30.07.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 07:06:27 -0700 (PDT)
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
X-Inumbo-ID: 84e5621e-772d-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698674788; x=1699279588; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9zje1WR/5N9X9fh2vGaqxNi9OOUC+5VFuZB22F9QkMQ=;
        b=ZeC3NjQVysIFDR6Eh/HkGFFKIZIFtSFLnykvD3NHFAyjorwu541otDNfPvfbXyah8L
         xfACKmySrY1G7JSo3EmcNIHjRtMVI3Ao9C669juUDGESMFeO8FnIQcpQMADXWQriCUzX
         +Mh1M2RIaoPcJ6eSVkyJeVaOHpxZePOyubFmmo9BK+TFoysuYHJtwVvTqhzXEBRywi7b
         E5NqllDiF0S5IAnhpyTRFkX06192P5m8qh+HUJQL1LEJIGLkSkPQS5mejYJ3fI8D8057
         LUvlYr0/jtxOM/f3YfO7mMnJpmztpXf0gMveUfHBoNv2J4//teKXhkiik+M+Z33p/Ezy
         ZB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674788; x=1699279588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zje1WR/5N9X9fh2vGaqxNi9OOUC+5VFuZB22F9QkMQ=;
        b=eBBKnpkxlt7umrcsRZlCQE/2AWbA6rF30daN+aBemVm+zeapgLZ66F4bCFzcX3R+1E
         BqIJ5Qn8Hfsu7D1iJt/va4HndDERpNO6xR1vd6cy88zbbT+c6VinTze1YLMt7P4mlnPv
         fWF9WTy0Y4Eli2GyAfPTJ0Qzqu19V5eiLwRCDg3Saw9ooMp0+zkNbrO8m9qubHMSASiY
         2O990nOEwKbFefaStUTMATpt5I3bpiTrhn7Jo9RgO83IFlsFl0x9eYF7YEqozavA8DTB
         f/VopjWoPmhUj+NBDCoSn38ZhaGuboxmKgHjGyboVUoepN511rzENNrNfNwGGfLgz0FN
         xoJQ==
X-Gm-Message-State: AOJu0Yy/18rE6OOG97tREwKhFY2GavWYHP1TU0yGClR07ukHQ5VJ8nFu
	GfXCipIBbzekRlIhPHfhZvo=
X-Google-Smtp-Source: AGHT+IFw/xBFIomFyGk0Rg2TqZJfENJhGeKbXCn9R8UAbu6/jn7K+ePfHghzMLCqW5qv0jInmFjB5g==
X-Received: by 2002:ac2:5e2f:0:b0:500:75e5:a2f0 with SMTP id o15-20020ac25e2f000000b0050075e5a2f0mr6739817lfg.51.1698674787788;
        Mon, 30 Oct 2023 07:06:27 -0700 (PDT)
Message-ID: <f59d52b12553b3a0099897f9a0751c9febb3ef43.camel@gmail.com>
Subject: Re: [PATCH] arch: drop get_processor_id()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
  Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Mon, 30 Oct 2023 16:06:26 +0200
In-Reply-To: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
References: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0


Hi Jan,

On Mon, 2023-10-30 at 14:29 +0100, Jan Beulich wrote:
> smp_processor_id() is what we commonly use; there's no need for it to
> have an alias.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/arm/include/asm/current.h
> +++ b/xen/arch/arm/include/asm/current.h
> @@ -53,7 +53,7 @@ static inline struct cpu_info *get_cpu_i
> =C2=A0
> =C2=A0DECLARE_PER_CPU(unsigned int, cpu_id);
> =C2=A0
> -#define get_processor_id()=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu(cpu_id)
> +#define smp_processor_id()=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu(cpu_id)
> =C2=A0#define set_processor_id(id)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 WRITE_SYSREG(__per_cpu_offset[(id)], TPIDR_EL2);=
=C2=A0=C2=A0=C2=A0 \
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -11,8 +11,6 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_
> =C2=A0
> =C2=A0#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> =C2=A0
> -#define smp_processor_id() get_processor_id()
> -
> =C2=A0/*
> =C2=A0 * Do we, for platform reasons, need to actually keep CPUs online
> when we
> =C2=A0 * would otherwise prefer them to be off?
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -401,7 +401,7 @@ void start_secondary(void)
> =C2=A0/* Shut down the current CPU */
> =C2=A0void __cpu_disable(void)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D get_processor_id();
> +=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D smp_processor_id();
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable();
> =C2=A0=C2=A0=C2=A0=C2=A0 gic_disable_cpu();
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -99,7 +99,7 @@ static inline struct cpu_info *get_cpu_i
> =C2=A0#define set_current(vcpu)=C2=A0=C2=A0=C2=A0=C2=A0 (get_cpu_info()->=
current_vcpu =3D
> (vcpu))
> =C2=A0#define current=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (get_current())
> =C2=A0
> -#define get_processor_id()=C2=A0=C2=A0=C2=A0 (get_cpu_info()->processor_=
id)
> +#define smp_processor_id()=C2=A0=C2=A0=C2=A0 (get_cpu_info()->processor_=
id)
> =C2=A0#define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs=
)
> =C2=A0
> =C2=A0/*
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -48,13 +48,6 @@ extern void cpu_exit_clear(unsigned int
> =C2=A0extern void cpu_uninit(unsigned int cpu);
> =C2=A0int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
> =C2=A0
> -/*
> - * This function is needed by all SMP systems. It must _always_ be
> valid
> - * from the initial startup. We map APIC_BASE very early in
> page_setup(),
> - * so this is correct in the x86 case.
> - */
> -#define smp_processor_id() get_processor_id()
> -
> =C2=A0void __stop_this_cpu(void);
> =C2=A0
> =C2=A0long cf_check cpu_up_helper(void *data);
> --- a/xen/arch/x86/mm/mm-locks.h
> +++ b/xen/arch/x86/mm/mm-locks.h
> @@ -122,7 +122,7 @@ static inline void mm_rwlock_init(mm_rwl
> =C2=A0
> =C2=A0static inline int mm_write_locked_by_me(mm_rwlock_t *l)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 return (l->locker =3D=3D get_processor_id());
> +=C2=A0=C2=A0=C2=A0 return (l->locker =3D=3D smp_processor_id());
> =C2=A0}
> =C2=A0
> =C2=A0static inline void _mm_write_lock(const struct domain *d,
> mm_rwlock_t *l,
> @@ -132,7 +132,7 @@ static inline void _mm_write_lock(const
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _check_lock_level(d, lev=
el);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 percpu_write_lock(p2m_pe=
rcpu_rwlock, &l->lock);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l->locker =3D get_processor_i=
d();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l->locker =3D smp_processor_i=
d();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l->locker_function =3D f=
unc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l->unlock_level =3D _get=
_lock_level();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _set_lock_level(_lock_le=
vel(d, level));

Looks good to me.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


