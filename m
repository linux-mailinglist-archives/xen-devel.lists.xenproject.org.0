Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2D8119BB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654126.1020837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSJB-0000EE-Fk; Wed, 13 Dec 2023 16:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654126.1020837; Wed, 13 Dec 2023 16:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSJB-0000C8-D5; Wed, 13 Dec 2023 16:42:05 +0000
Received: by outflank-mailman (input) for mailman id 654126;
 Wed, 13 Dec 2023 16:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dgA1=HY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rDSJA-0000By-Bz
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:42:04 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a8da985-99d6-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:42:02 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso9637377e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 08:42:02 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w23-20020ac254b7000000b0050bf5188390sm1648134lfk.167.2023.12.13.08.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:42:01 -0800 (PST)
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
X-Inumbo-ID: 8a8da985-99d6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702485722; x=1703090522; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s8Yp9BV047F1ItBGxIpzDx3xJfHvgD5UCrgrcCfhewQ=;
        b=Tyv46uSlPMra35hWRFLqgimDbBVqIl2ZUw39tyUljxNvultd2IFYte8/PVDhuVG+B3
         IuBocoN4wcjXJhNgE3Mprw64sZ0tsdy0AwQAbcJxrxKPjLwHFSg0/RTa/UIOwLgVPHlQ
         aXKVWqm95nerr3ODSgT24Sxj2bPL0UEw1NtV7LZcbwpsg+ekWu8D0W9svFv7ljMJYUmj
         FSyY0KQPZoV+vfoJ5ONlY9/n64Eiaf77pNxmecGhsgJgVjTmbn35DYA17F2QWgO9oxk0
         TwzgqGQPMoqi3mr3gGD76BCCm1+GDefvZ+K5dHacuUeZ+Iz+VFpxuaMAyg4oEc859i5Z
         YNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485722; x=1703090522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8Yp9BV047F1ItBGxIpzDx3xJfHvgD5UCrgrcCfhewQ=;
        b=PspP075JPK5xcrBdRmLkLjkBN6vrGTsV3GgYtpyU5jaS7+lFz366GQZtjQ0VKfAqyi
         K9M8nLAf85Um94UMkHE0u0pY94iqk11msZk8M/+Jol852wI1LoTdGJvkwQj+AZGwF/GV
         XF+ZQGl7txHNmPGaeonJnWKGlXWmlaOuDJe344MN6Imk/u5atJ37beJ5TZ9YlNzZ54hG
         acl6ffOkXPXtU7Qw0UVxguWkoIenb9NqmMp8YVQ3MCHmN5mj1fFhxqCiCU18X0/MDRS+
         +ypPyAqDzTkEqmtXwNfCWx4KP2ZP/jzWSOai10Zjo69kethGJHANEcy6nOE63/VIdvrE
         QZNg==
X-Gm-Message-State: AOJu0YyBbpDAoIdO6j9VxjZlpz6xYu0b6FnXkchWdXqQoMPtI1jurlWo
	tOK1E8kx1u1hBGxcYbdzM+Q=
X-Google-Smtp-Source: AGHT+IF9MVFDxT6+dt1IhiVkNBIOf6yRsj+JizfzLtvDNVv4ZkEaEXBBF8HsGEl33NkA8k0rovrvWw==
X-Received: by 2002:a05:6512:318b:b0:50b:e4d3:9086 with SMTP id i11-20020a056512318b00b0050be4d39086mr5067021lfe.90.1702485721432;
        Wed, 13 Dec 2023 08:42:01 -0800 (PST)
Message-ID: <24f65706057487078f5d64706d45419e30a31364.camel@gmail.com>
Subject: Re: [PATCH] smp: move cpu_is_offline() definition
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>,  Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <george.dunlap@citrix.com>
Date: Wed, 13 Dec 2023 18:41:59 +0200
In-Reply-To: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
References: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-12-13 at 12:26 +0100, Jan Beulich wrote:
> It's all the same for the 3 arch-es which have it, and RISC-V would
> introduce a 4th instance. Put it in xen/smp.h instead, while still
> permitting asm/smp.h to define a custom variant if need be.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -12,8 +12,6 @@ extern unsigned long smp_up_cpu;
> =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> =C2=A0
> -#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> -
> =C2=A0/*
> =C2=A0 * Do we, for platform reasons, need to actually keep CPUs online
> when we
> =C2=A0 * would otherwise prefer them to be off?
> --- a/xen/arch/ppc/include/asm/smp.h
> +++ b/xen/arch/ppc/include/asm/smp.h
> @@ -7,8 +7,6 @@
> =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> =C2=A0
> -#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> -
> =C2=A0/*
> =C2=A0 * Do we, for platform reasons, need to actually keep CPUs online
> when we
> =C2=A0 * would otherwise prefer them to be off?
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -43,7 +43,6 @@ extern u32 x86_cpu_to_apicid[];
> =C2=A0
> =C2=A0#define cpu_physical_id(cpu)	x86_cpu_to_apicid[cpu]
> =C2=A0
> -#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> =C2=A0extern void cpu_exit_clear(unsigned int cpu);
> =C2=A0extern void cpu_uninit(unsigned int cpu);
> =C2=A0int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
> --- a/xen/include/xen/smp.h
> +++ b/xen/include/xen/smp.h
> @@ -3,6 +3,10 @@
> =C2=A0
> =C2=A0#include <asm/smp.h>
> =C2=A0
> +#ifndef cpu_is_offline
> +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> +#endif
> +
> =C2=A0/*
> =C2=A0 * stops all CPUs but the current one:
> =C2=A0 */

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


