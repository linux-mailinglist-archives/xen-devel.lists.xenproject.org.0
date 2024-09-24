Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247AA984824
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803036.1213431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st71t-0005wd-HO; Tue, 24 Sep 2024 15:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803036.1213431; Tue, 24 Sep 2024 15:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st71t-0005ug-En; Tue, 24 Sep 2024 15:00:41 +0000
Received: by outflank-mailman (input) for mailman id 803036;
 Tue, 24 Sep 2024 15:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st71s-0005ua-Gu
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:00:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32baadc-7a85-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 17:00:39 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so8105612a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:00:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf497167sm834970a12.34.2024.09.24.08.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 08:00:37 -0700 (PDT)
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
X-Inumbo-ID: c32baadc-7a85-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727190039; x=1727794839; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ClU+wZACTynJqVkFrw+djP+VCxCJ76SLH1mQOgqwZm8=;
        b=czc/zU7rFJNuNiyQP+IjCyFLbf/EErxW4ileHEeCJbIvLUaBF11LqlUfSOVAMBARzq
         tLOop9/fxs6dsD+JaFSjiHcx3ve9WDWWcb5cp49g42qQQoaHsKMCgv6J4Rp8IWP4rdhw
         GvVn1hiPqaZwjNi/0uMOMG8lVDUAKi8pAoLelq0Tnp0aoe6JXyhBHXolpbroaPaHeiXY
         /fkHr2wltk2J/0mNN3jHVJOpaS2AE5fV9ReStK3iYs5FAcMTXUwdKLEVc4cyuUEE19nf
         IAcQOkZlp2Ka7NF6QG8LZxtRD0i/CNPYihypSpav0Wqo6Y9WXcTEoAGUYB8Xhb6xtfnO
         tpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190039; x=1727794839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClU+wZACTynJqVkFrw+djP+VCxCJ76SLH1mQOgqwZm8=;
        b=jjtQB5VFF+eBRgOEEotGzuY3Y3fFdo7FYIa9lxqVRowmDxk1AQNA5L2n3GHQks7k/g
         Uo5oATuR7E39ThnL+uGDXBGuH8rTURGNWcLmJtuUaj8spHayRKbW7NGcBPr5gnmSJMNV
         pk4TteL5191Pvczx++/hn+ANgL4K6Jrbog5XbxowDW4uJtmHxHctXmE3yJql4HZ7Xvf+
         9Ga7xbVMnLtb7Q/Zn4wSsaMcplHqIxuz30a57HH/2lpTco6C3TkMUrQjMccV9FDIT2M3
         FTMdO63Ilw1fawjwtd86YUy5iZs6bhI5QC+fqK9CtjhgF0Wad0gN2EEi//u8SMXrFsiM
         +MKg==
X-Forwarded-Encrypted: i=1; AJvYcCURFjeuhToTR8TM06I+wvvWANPj0ZGVSbyiJ2iW/Ah7thPjzjYfWyNReGYGkKK+Xk21dqKSlPXU09Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZz+mwAqtw+zJvD5PTkRNkzLHLVXKwngvSCvMfxxhlZ8Fn4o7s
	nPNLfcd50D3lY72npDhpfe+2meArMDBX6RregrSqhhpf8cThNa0h
X-Google-Smtp-Source: AGHT+IEIhfN3kN91K5OPNWwz4rX3qq+7J55kopPFNtFRy3AyrW96jcAJrqUcQLjWMVTUy7YY13ZXsQ==
X-Received: by 2002:a05:6402:5201:b0:5c5:c447:e4c0 with SMTP id 4fb4d7f45d1cf-5c5c447e558mr4925026a12.4.1727190038527;
        Tue, 24 Sep 2024 08:00:38 -0700 (PDT)
Message-ID: <d63c4a4401844f73898a7a0c1431c9067deee468.camel@gmail.com>
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
From: oleksii.kurochko@gmail.com
To: Matthew Barnes <matthew.barnes@cloud.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Tue, 24 Sep 2024 17:00:37 +0200
In-Reply-To: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
References: 
	<e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-23 at 15:35 +0100, Matthew Barnes wrote:
> With the introduction of mixed x2APIC mode (using cluster addressing
> for
> IPIs and physical for external interrupts) the use of pure cluster
> mode
> doesn't have any benefit.
>=20
> Remove the mode itself, leaving only the code required for logical
> addressing when sending IPIs.
>=20
> Implements: https://gitlab.com/xen-project/xen/-/issues/189
>=20
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
> =C2=A0CHANGELOG.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> =C2=A0docs/misc/xen-command-line.pandoc |=C2=A0 4 +--
> =C2=A0xen/arch/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 --------
> =C2=A0xen/arch/x86/genapic/x2apic.c=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++-----=
---------------------
> --
> =C2=A04 files changed, 7 insertions(+), 60 deletions(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 26e7d8dd2ac4..335e98b2e1a7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,7 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0### Changed
> =C2=A0 - On x86:
> =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run time =
service
> call.
> +=C2=A0=C2=A0 - Remove x2APIC cluster mode, leaving only physical and mix=
ed
> modes.
> =C2=A0
> =C2=A0### Added
> =C2=A0
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-
> command-line.pandoc
> index 959cf45b55d9..5ce63044ade8 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2842,10 +2842,10 @@ the watchdog.
> =C2=A0Permit use of x2apic setup for SMP environments.
> =C2=A0
> =C2=A0### x2apic-mode (x86)
> -> `=3D physical | cluster |=C2=A0mixed`
> +> `=3D physical | mixed`
> =C2=A0
> =C2=A0> Default: `physical` if **FADT** mandates physical mode, otherwise
> set at
> ->=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build time by CO=
NFIG_X2APIC_{PHYSICAL,LOGICAL,MIXED}.
> +>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build time by CO=
NFIG_X2APIC_{PHYSICAL,MIXED}.
> =C2=A0
> =C2=A0In the case that x2apic is in use, this option switches between
> modes to
> =C2=A0address APICs in the system as interrupt destinations.
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 62f0b5e0f4c5..ab862b083fce 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -275,18 +275,6 @@ config X2APIC_PHYSICAL
> =C2=A0	=C2=A0 destination inter processor interrupts (IPIs) slightly
> slower than
> =C2=A0	=C2=A0 Logical Destination mode.
> =C2=A0
> -config X2APIC_CLUSTER
> -	bool "Cluster Destination mode"
> -	help
> -	=C2=A0 When using this mode APICs are addressed using the Cluster
> Logical
> -	=C2=A0 Destination mode.
> -
> -	=C2=A0 Cluster Destination has the benefit of sending IPIs faster
> since
> -	=C2=A0 multiple APICs can be targeted as destinations of a single
> IPI.
> -	=C2=A0 However the vector space is shared between all CPUs on the
> cluster,
> -	=C2=A0 and hence using this mode reduces the number of available
> vectors
> -	=C2=A0 when compared to Physical mode.
> -
> =C2=A0config X2APIC_MIXED
> =C2=A0	bool "Mixed Destination mode"
> =C2=A0	help
> diff --git a/xen/arch/x86/genapic/x2apic.c
> b/xen/arch/x86/genapic/x2apic.c
> index d531035fa42c..c277f4f79b0a 100644
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -63,26 +63,6 @@ static void cf_check
> init_apic_ldr_x2apic_cluster(void)
> =C2=A0=C2=A0=C2=A0=C2=A0 cpumask_set_cpu(this_cpu, per_cpu(cluster_cpus, =
this_cpu));
> =C2=A0}
> =C2=A0
> -static const cpumask_t *cf_check
> vector_allocation_cpumask_x2apic_cluster(
> -=C2=A0=C2=A0=C2=A0 int cpu)
> -{
> -=C2=A0=C2=A0=C2=A0 return per_cpu(cluster_cpus, cpu);
> -}
> -
> -static unsigned int cf_check cpu_mask_to_apicid_x2apic_cluster(
> -=C2=A0=C2=A0=C2=A0 const cpumask_t *cpumask)
> -{
> -=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D cpumask_any(cpumask);
> -=C2=A0=C2=A0=C2=A0 unsigned int dest =3D per_cpu(cpu_2_logical_apicid, c=
pu);
> -=C2=A0=C2=A0=C2=A0 const cpumask_t *cluster_cpus =3D per_cpu(cluster_cpu=
s, cpu);
> -
> -=C2=A0=C2=A0=C2=A0 for_each_cpu ( cpu, cluster_cpus )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( cpumask_test_cpu(cpu, cp=
umask) )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =
|=3D per_cpu(cpu_2_logical_apicid, cpu);
> -
> -=C2=A0=C2=A0=C2=A0 return dest;
> -}
> -
> =C2=A0static void cf_check send_IPI_self_x2apic(uint8_t vector)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 apic_wrmsr(APIC_SELF_IPI, vector);
> @@ -169,17 +149,6 @@ static const struct genapic
> __initconst_cf_clobber apic_x2apic_phys =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 .send_IPI_self =3D send_IPI_self_x2apic
> =C2=A0};
> =C2=A0
> -static const struct genapic __initconst_cf_clobber
> apic_x2apic_cluster =3D {
> -=C2=A0=C2=A0=C2=A0 APIC_INIT("x2apic_cluster", NULL),
> -=C2=A0=C2=A0=C2=A0 .int_delivery_mode =3D dest_LowestPrio,
> -=C2=A0=C2=A0=C2=A0 .int_dest_mode =3D 1 /* logical delivery */,
> -=C2=A0=C2=A0=C2=A0 .init_apic_ldr =3D init_apic_ldr_x2apic_cluster,
> -=C2=A0=C2=A0=C2=A0 .vector_allocation_cpumask =3D
> vector_allocation_cpumask_x2apic_cluster,
> -=C2=A0=C2=A0=C2=A0 .cpu_mask_to_apicid =3D cpu_mask_to_apicid_x2apic_clu=
ster,
> -=C2=A0=C2=A0=C2=A0 .send_IPI_mask =3D send_IPI_mask_x2apic_cluster,
> -=C2=A0=C2=A0=C2=A0 .send_IPI_self =3D send_IPI_self_x2apic
> -};
> -
> =C2=A0/*
> =C2=A0 * Mixed x2APIC mode: use physical for external (device) interrupts=
,
> and
> =C2=A0 * cluster for inter processor interrupts.=C2=A0 Such mode has the
> benefits of not
> @@ -252,15 +221,13 @@ static int8_t __initdata x2apic_phys =3D -1;
> =C2=A0boolean_param("x2apic_phys", x2apic_phys);
> =C2=A0
> =C2=A0enum {
> -=C2=A0=C2=A0 unset, physical, cluster, mixed
> +=C2=A0=C2=A0 unset, physical, mixed
> =C2=A0} static __initdata x2apic_mode =3D unset;
> =C2=A0
> =C2=A0static int __init cf_check parse_x2apic_mode(const char *s)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( !cmdline_strcmp(s, "physical") )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D physical=
;
> -=C2=A0=C2=A0=C2=A0 else if ( !cmdline_strcmp(s, "cluster") )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D cluster;
> =C2=A0=C2=A0=C2=A0=C2=A0 else if ( !cmdline_strcmp(s, "mixed") )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D mixed;
> =C2=A0=C2=A0=C2=A0=C2=A0 else
> @@ -274,7 +241,7 @@ const struct genapic *__init
> apic_x2apic_probe(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Honour the legacy cmdline setting if it's the=
 only one
> provided. */
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( x2apic_mode =3D=3D unset && x2apic_phys >=
=3D 0 )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D x2apic_phys ?=
 physical : cluster;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D x2apic_phys ?=
 physical : mixed;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( x2apic_mode =3D=3D unset )
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> @@ -286,21 +253,12 @@ const struct genapic *__init
> apic_x2apic_probe(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
x2apic_mode =3D IS_ENABLED(CONFIG_X2APIC_MIXED) ? mixed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) ?
> physical
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :
> cluster);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :
> mixed);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( x2apic_mode =3D=3D physical )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return &apic_x2apic_phys=
;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 if ( x2apic_mode =3D=3D cluster && iommu_intremap !=
=3D
> iommu_intremap_full )
> -=C2=A0=C2=A0=C2=A0 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("WARNING: x2APIC clust=
er mode is not supported %s
> interrupt remapping -"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 " forcing mixed mode\n",
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 iommu_intremap =3D=3D iommu_intremap_off ? "without"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : "with
> restricted");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x2apic_mode =3D mixed;
> -=C2=A0=C2=A0=C2=A0 }
> -
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( !this_cpu(cluster_cpus) )
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_clusterinfo(NULL,=
 CPU_UP_PREPARE,
> @@ -309,7 +267,7 @@ const struct genapic *__init
> apic_x2apic_probe(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register_cpu_notifier(&x=
2apic_cpu_nfb);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 return x2apic_mode =3D=3D cluster ? &apic_x2apic_clus=
ter :
> &apic_x2apic_mixed;
> +=C2=A0=C2=A0=C2=A0 return &apic_x2apic_mixed;
> =C2=A0}
> =C2=A0
> =C2=A0void __init check_x2apic_preenabled(void)


