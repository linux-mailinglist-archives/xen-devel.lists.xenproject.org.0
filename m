Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA8989CDF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807134.1218396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBth-00064o-MP; Mon, 30 Sep 2024 08:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807134.1218396; Mon, 30 Sep 2024 08:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBth-00061d-J2; Mon, 30 Sep 2024 08:36:49 +0000
Received: by outflank-mailman (input) for mailman id 807134;
 Mon, 30 Sep 2024 08:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svBtf-0005Yw-Om
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:36:47 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2164eb7d-7f07-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 10:36:47 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso1438831e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:36:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd5dfc8sm1181049e87.77.2024.09.30.01.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 01:36:46 -0700 (PDT)
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
X-Inumbo-ID: 2164eb7d-7f07-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727685406; x=1728290206; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDVdPkTc0aMcW/Zgk6W55pJY35CIsXFOOI/fkvQNJgQ=;
        b=l32euJ+3sUkkr+ckHdi+uLCbq9n+IwHJkWYquqs78siqJj/qEIuEbhBJDeCZIjA7i4
         DJd0F13vFQBYaKy6S42yFIm6W65r2WHFA/Rb1VbbdcpsywDwRCNDXhCR/2eTe1rWZbuN
         dj3cPXsK/S/Z3JAxow7i+b4/T7SuTeT/IT8e05CXYlpJRKK4dssTy9l+2PhhHjG5qoLp
         QleW0gl7b1zYtFpWjkb3gvpRgnMeIWVqK8GpnwV5UH4taPhumUCteyvgxKrjFVRLd4un
         WJCceL9v0IpTNR6y6mtQczZxps78N1/P38AGYsTUr0M8Ndk83hW/F1rYeLfA3xIkDDiL
         1GVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685406; x=1728290206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDVdPkTc0aMcW/Zgk6W55pJY35CIsXFOOI/fkvQNJgQ=;
        b=Uyviw2ILdq+D3k1TSa6LFKk77umt0EbBS5JMhYI7LWehti+WjyX0nkSJwLgmkrZsr1
         OZSMFnxsMYiz+QauN9jhQwDpCbJUcm+Xgn5UFqc5S40EjiROWxeZLrEmRJMz9C1JeUbE
         D5WKMlnn68ozl/+1TM4AUY7XqNKwEwb9COZhDrWGWfvBARctCcw7kO260DzkbnyJfjWi
         ZbfqONa3gXzb1FiyywoFUTwHMxmoeYnmaq9tmhb54q8ocSjrh553lwJ2dKbG63feCHGl
         gxniYNlVXViWgbq7oDIY2XcdyAX443EB3Js/RJL6LnLZisLMlZvkYVmwHNNeJv2v0WbW
         lzGA==
X-Gm-Message-State: AOJu0YwrwcxmzQjVws4p5OZg3Nt8xH93BS+ANf/8tjeasCycTlmRMMI/
	KIhx/PWOttCz9Qn9lRzJ/h4r3D02FlWsaLQd+dvdgPnWC259k+1IMGLaow==
X-Google-Smtp-Source: AGHT+IELX/iHOYIJrQasMm/LAHTl0jgmQJK2ZO7gCx3Gs8GGz2f5HOsfBNmXHr9IEf3QMvRNPvVZoQ==
X-Received: by 2002:a05:6512:68e:b0:539:948a:aadb with SMTP id 2adb3069b0e04-539948aac84mr1398741e87.42.1727685406331;
        Mon, 30 Sep 2024 01:36:46 -0700 (PDT)
Message-ID: <206e4696b1cd4bc45489da39e73311dfa2a44a8a.camel@gmail.com>
Subject: Re: [PATCH v8 7/7] xen/riscv: introduce early_fdt_map()
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 30 Sep 2024 10:36:45 +0200
In-Reply-To: <65c49e7aa25249cd94be3ce9b850d023c9dff731.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
	 <65c49e7aa25249cd94be3ce9b850d023c9dff731.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Add missing revision log:

---
Changes in V6-V8:
 - Nothing changed. Only rebase.
---
Changes in V5:
 - drop usage of PTE_BLOCK for flag argument of map_pages_to_xen() in
early_fdt_map()
   as block mapping is now default behaviour. Also PTE_BLOCK was
dropped in the patch
   "xen/riscv: page table handling".
---
Changes in V4:
 - s/_PAGE_BLOCK/PTE_BLOCK
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
 - unwarap two lines in panic() in case when device_tree_flattened is
NULL
   so  grep-ing for any part of the message line will always produce a
hit.
 - slightly update the commit message.
---
Changes in V3:
 - Code style fixes
 - s/SZ_2M/MB(2)
 - fix condition to check if early_fdt_map() in setup.c return NULL or
not.
---
Changes in V2:
 - rework early_fdt_map to use map_pages_to_xen()
 - move call early_fdt_map() to C code after MMU is enabled.
---

~ Oleksii

On Fri, 2024-09-27 at 18:33 +0200, Oleksii Kurochko wrote:
> Introduce function which allows to map FDT to Xen.
>=20
> Also, initialization of device_tree_flattened happens using
> early_fdt_map().
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> =C2=A0xen/arch/riscv/include/asm/mm.h |=C2=A0 2 ++
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 55
> +++++++++++++++++++++++++++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 +++++
> =C2=A03 files changed, 64 insertions(+)
>=20
> diff --git a/xen/arch/riscv/include/asm/mm.h
> b/xen/arch/riscv/include/asm/mm.h
> index ce1557bb27..4b7b00b850 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -259,4 +259,6 @@ static inline unsigned int
> arch_get_dma_bitsize(void)
> =C2=A0
> =C2=A0void setup_fixmap_mappings(void);
> =C2=A0
> +void *early_fdt_map(paddr_t fdt_paddr);
> +
> =C2=A0#endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index e8430def14..4a628aef83 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,13 +1,16 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> +#include <xen/bootfdt.h>
> =C2=A0#include <xen/bug.h>
> =C2=A0#include <xen/compiler.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/kernel.h>
> +#include <xen/libfdt/libfdt.h>
> =C2=A0#include <xen/macros.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/pfn.h>
> =C2=A0#include <xen/sections.h>
> +#include <xen/sizes.h>
> =C2=A0
> =C2=A0#include <asm/early_printk.h>
> =C2=A0#include <asm/csr.h>
> @@ -369,3 +372,55 @@ int destroy_xen_mappings(unsigned long s,
> unsigned long e)
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> =C2=A0}
> +
> +void * __init early_fdt_map(paddr_t fdt_paddr)
> +{
> +=C2=A0=C2=A0=C2=A0 /* We are using 2MB superpage for mapping the FDT */
> +=C2=A0=C2=A0=C2=A0 paddr_t base_paddr =3D fdt_paddr & XEN_PT_LEVEL_MAP_M=
ASK(1);
> +=C2=A0=C2=A0=C2=A0 paddr_t offset;
> +=C2=A0=C2=A0=C2=A0 void *fdt_virt;
> +=C2=A0=C2=A0=C2=A0 uint32_t size;
> +=C2=A0=C2=A0=C2=A0 int rc;
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Check whether the physical FDT address is set=
 and meets the
> minimum
> +=C2=A0=C2=A0=C2=A0=C2=A0 * alignment requirement. Since we are relying o=
n MIN_FDT_ALIGN
> to be at
> +=C2=A0=C2=A0=C2=A0=C2=A0 * least 8 bytes so that we always access the ma=
gic and size
> fields
> +=C2=A0=C2=A0=C2=A0=C2=A0 * of the FDT header after mapping the first chu=
nk, double check
> if
> +=C2=A0=C2=A0=C2=A0=C2=A0 * that is indeed the case.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +=C2=A0=C2=A0=C2=A0 if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> +
> +=C2=A0=C2=A0=C2=A0 /* The FDT is mapped using 2MB superpage */
> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(BOOT_FDT_VIRT_START % MB(2));
> +
> +=C2=A0=C2=A0=C2=A0 rc =3D map_pages_to_xen(BOOT_FDT_VIRT_START,
> maddr_to_mfn(base_paddr),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 MB(2) >> PAGE_SHIFT,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 PAGE_HYPERVISOR_RO);
> +=C2=A0=C2=A0=C2=A0 if ( rc )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to map the devi=
ce-tree.\n");
> +
> +=C2=A0=C2=A0=C2=A0 offset =3D fdt_paddr % XEN_PT_LEVEL_SIZE(1);
> +=C2=A0=C2=A0=C2=A0 fdt_virt =3D (void *)BOOT_FDT_VIRT_START + offset;
> +
> +=C2=A0=C2=A0=C2=A0 if ( fdt_magic(fdt_virt) !=3D FDT_MAGIC )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> +
> +=C2=A0=C2=A0=C2=A0 size =3D fdt_totalsize(fdt_virt);
> +=C2=A0=C2=A0=C2=A0 if ( size > BOOT_FDT_VIRT_SIZE )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> +
> +=C2=A0=C2=A0=C2=A0 if ( (offset + size) > MB(2) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D map_pages_to_xen(BOOT_=
FDT_VIRT_START + MB(2),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 maddr_to_mfn(base_paddr + MB(2)),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2) >> PAGE_SHIFT,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_HYPERVISOR_RO);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic=
("Unable to map the device-tree\n");
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return fdt_virt;
> +}
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index c4fadd36c6..a316901fd4 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -2,6 +2,7 @@
> =C2=A0
> =C2=A0#include <xen/bug.h>
> =C2=A0#include <xen/compile.h>
> +#include <xen/device_tree.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/shutdown.h>
> @@ -57,6 +58,12 @@ void __init noreturn start_xen(unsigned long
> bootcpu_id,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 setup_fixmap_mappings();
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 device_tree_flattened =3D early_fdt_map(dtb_addr);
> +=C2=A0=C2=A0=C2=A0 if ( !device_tree_flattened )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Invalid device tree bl=
ob at physical address %#lx.
> The DTB must be 8-byte aligned and must not exceed %lld bytes in
> size.\n\n"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "Please check your bootloader.\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dtb_addr, BOOT_FDT_VIRT_SIZE);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 machine_halt();


