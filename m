Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2C82830A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 10:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664337.1034474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8Jj-0004BO-Aa; Tue, 09 Jan 2024 09:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664337.1034474; Tue, 09 Jan 2024 09:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8Jj-00049K-7X; Tue, 09 Jan 2024 09:22:39 +0000
Received: by outflank-mailman (input) for mailman id 664337;
 Tue, 09 Jan 2024 09:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JJbl=IT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rN8Ji-00049E-2C
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 09:22:38 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a076457e-aed0-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 10:22:36 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so2572453e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 01:22:36 -0800 (PST)
Received: from [192.168.223.212] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a19ca14000000b0050e78f183e1sm255578lfg.82.2024.01.09.01.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 01:22:35 -0800 (PST)
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
X-Inumbo-ID: a076457e-aed0-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704792156; x=1705396956; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XSgUqBjGpY/lm0+yX3OdNlCBhWiQmqTpLFHUjfE1X5E=;
        b=YJqpmMCFm63L/mLJ7qwV/13zuElyU6RaScQ7XTDulCK8dc7U/clfzWqBmli58rh4+y
         eSeh6x35zfMP3af8E7ONVbWpJp/nNt4BPstIsCdzX8n6vqt0NEDqRbHrfJRnu3697YG2
         bAXZccpW0navKsqVqMZFgdlvt8Lbm67PpWqcpY4qjGuaY+fR9JDYe4r93mjXKGw5vx01
         Aur6Jzs30tJzFM4Zc2udL1vqeNbGTxqsPLd3GlDQAUsvlCNM+lSyrem0q4xEME7/NsBr
         y1E92bXLJeedZFhJjqYAkg0cBLGfwPrANucmQgJukMKzQfP+G6yBlJY98Hh2EHitiz5P
         IKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704792156; x=1705396956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XSgUqBjGpY/lm0+yX3OdNlCBhWiQmqTpLFHUjfE1X5E=;
        b=AX9vhxTvf5QrIqrZhe9lX93QPf/mMiuSgFjYYO07chIGG67mqzvi1Air1eeTKp7bAX
         hrPZqL8io3VP7Bv7Y7XpKvinf6IYGubJia1TZZmKfVQfVgwAxGZ+hWDVExJY2LbHtyTg
         WS6bVQ0YLvyyXEUsTGa7vH26OxE8uS2w6hYh9jKL54CUlzJNRlxIzuQoiHwLX0Nq0xpW
         b2PS4oQMxrNbbREx5+BJm8Tjge8dhm9XL9m5R4uxDS1+PvDRjl+0IKda5pcvfFSYMeiS
         V1CQWDPEbE1gXdCSNHhOqZ0EbGsjYpIpVxv2NJ34LYsJjxASQuYU2LWtrkxQWQ4z68Cf
         Xwpw==
X-Gm-Message-State: AOJu0YwEPx2MJBwo0ItvGkZOqmiOvM2R1DHas3q3gI3xs/YDGlhocHUz
	OdJCBbw19fE7U7N8XNkw2Ng=
X-Google-Smtp-Source: AGHT+IGjqTR/A3ykPoWp+178wfN91b80SM8dhtqqI21m9hjRRGk2F/TTDydgokVR6C/K96BY7+lFjw==
X-Received: by 2002:a05:6512:46c:b0:50e:7b03:3b7c with SMTP id x12-20020a056512046c00b0050e7b033b7cmr1473836lfd.3.1704792155601;
        Tue, 09 Jan 2024 01:22:35 -0800 (PST)
Message-ID: <e544f1a4e24f815beb1d843dbfb2ae1b4f98f3b3.camel@gmail.com>
Subject: Re: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>
Date: Tue, 09 Jan 2024 11:22:32 +0200
In-Reply-To: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
References: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Looks good to me.

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Best regards,
 Oleksii

On Mon, 2024-01-08 at 12:30 +0100, Jan Beulich wrote:
> There's no point in every architecture carrying the same stubs for
> the
> case when NUMA isn't enabled (or even supported). Move all of that to
> xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
> inclusion of asm/numa.h dependent upon NUMA=3Dy.
>=20
> Drop the no longer applicable "implement NUMA support" comments - in
> a
> !NUMA section this simply makes no sense.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Split off first_valid_mfn specific change. Re-base.
>=20
> --- a/xen/arch/arm/include/asm/numa.h
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -#ifndef __ARCH_ARM_NUMA_H
> -#define __ARCH_ARM_NUMA_H
> -
> -#include <xen/mm.h>
> -
> -typedef u8 nodeid_t;
> -
> -#ifndef CONFIG_NUMA
> -
> -/* Fake one node for now. See also node_online_map. */
> -#define cpu_to_node(cpu) 0
> -#define node_to_cpumask(node)=C2=A0=C2=A0 (cpu_online_map)
> -
> -/* XXX: implement NUMA support */
> -#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> -#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> -#define __node_distance(a, b) (20)
> -
> -#endif
> -
> -#define arch_want_default_dmazone() (false)
> -
> -#endif /* __ARCH_ARM_NUMA_H */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -42,7 +42,7 @@ integer_param("maxcpus", max_cpus);
> =C2=A0/* CPU logical map: map xen cpuid to an MPIDR */
> =C2=A0register_t __cpu_logical_map[NR_CPUS] =3D { [0 ... NR_CPUS-1] =3D
> MPIDR_INVALID };
> =C2=A0
> -/* Fake one node for now. See also asm/numa.h */
> +/* Fake one node for now. See also xen/numa.h */
> =C2=A0nodemask_t __read_mostly node_online_map =3D { { [0] =3D 1UL } };
> =C2=A0
> =C2=A0/* Xen stack for bringing up the first CPU. */
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#ifndef __ASM_PPC_NUMA_H__
> -#define __ASM_PPC_NUMA_H__
> -
> -#include <xen/types.h>
> -#include <xen/mm.h>
> -
> -typedef uint8_t nodeid_t;
> -
> -/* Fake one node for now. See also node_online_map. */
> -#define cpu_to_node(cpu) 0
> -#define node_to_cpumask(node)=C2=A0=C2=A0 (cpu_online_map)
> -
> -/* XXX: implement NUMA support */
> -#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> -#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> -#define __node_distance(a, b) (20)
> -
> -#define arch_want_default_dmazone() (false)
> -
> -#endif /* __ASM_PPC_NUMA_H__ */
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -138,7 +138,6 @@
> =C2=A0#include <xen/spinlock.h>
> =C2=A0
> =C2=A0#include <asm/flushtlb.h>
> -#include <asm/numa.h>
> =C2=A0#include <asm/page.h>
> =C2=A0
> =C2=A0#include <public/sysctl.h>
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -22,8 +22,8 @@
> =C2=A0#include <asm/current.h>
> =C2=A0#include <xen/hypercall.h>
> =C2=A0#include <public/sysctl.h>
> -#include <asm/numa.h>
> =C2=A0#include <xen/nodemask.h>
> +#include <xen/numa.h>
> =C2=A0#include <xsm/xsm.h>
> =C2=A0#include <xen/pmstat.h>
> =C2=A0#include <xen/livepatch.h>
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -2,6 +2,7 @@
> =C2=A0#ifndef __XEN_DOMAIN_H__
> =C2=A0#define __XEN_DOMAIN_H__
> =C2=A0
> +#include <xen/numa.h>
> =C2=A0#include <xen/types.h>
> =C2=A0
> =C2=A0#include <public/xen.h>
> @@ -12,7 +13,6 @@ struct guest_area {
> =C2=A0};
> =C2=A0
> =C2=A0#include <asm/domain.h>
> -#include <asm/numa.h>
> =C2=A0
> =C2=A0typedef union {
> =C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_guest_context *nat;
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -2,7 +2,13 @@
> =C2=A0#define _XEN_NUMA_H
> =C2=A0
> =C2=A0#include <xen/mm-frame.h>
> +
> +#ifdef CONFIG_NUMA
> +#include <xen/pdx.h>
> =C2=A0#include <asm/numa.h>
> +#else
> +typedef uint8_t nodeid_t;
> +#endif
> =C2=A0
> =C2=A0#define NUMA_NO_NODE=C2=A0=C2=A0=C2=A0=C2=A0 0xFF
> =C2=A0#define NUMA_NO_DISTANCE 0xFF
> @@ -108,8 +114,18 @@ extern void numa_set_processor_nodes_par
> =C2=A0
> =C2=A0#else
> =C2=A0
> +/* Fake one node for now. See also node_online_map. */
> +#define cpu_to_node(cpu) 0
> +#define node_to_cpumask(node)=C2=A0=C2=A0 cpu_online_map
> +
> +#define arch_want_default_dmazone() false
> +
> =C2=A0extern mfn_t first_valid_mfn;
> =C2=A0
> +#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> +#define node_start_pfn(nid) mfn_x(first_valid_mfn)
> +#define __node_distance(a, b) 20
> +
> =C2=A0static inline nodeid_t mfn_to_nid(mfn_t mfn)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -11,10 +11,10 @@
> =C2=A0#include <xen/list.h>
> =C2=A0#include <xen/spinlock.h>
> =C2=A0#include <xen/irq.h>
> +#include <xen/numa.h>
> =C2=A0#include <xen/pci_regs.h>
> =C2=A0#include <xen/pfn.h>
> =C2=A0#include <asm/device.h>
> -#include <asm/numa.h>
> =C2=A0
> =C2=A0/*
> =C2=A0 * The PCI interface treats multi-function devices as independent


