Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74A93BD26
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 09:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764735.1175253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxK-0003P3-0N; Thu, 25 Jul 2024 07:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764735.1175253; Thu, 25 Jul 2024 07:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxJ-0003Lz-Tm; Thu, 25 Jul 2024 07:32:05 +0000
Received: by outflank-mailman (input) for mailman id 764735;
 Thu, 25 Jul 2024 07:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWsxJ-0003L9-3Q
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 07:32:05 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb747a71-4a57-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 09:32:02 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6b795574f9dso3913996d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 00:32:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f9143e1sm4321446d6.61.2024.07.25.00.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 00:31:59 -0700 (PDT)
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
X-Inumbo-ID: fb747a71-4a57-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721892720; x=1722497520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GVlNStJvrT8ORCcRB8+CmsmV0FyqBN6Hy+p1P9rZbw=;
        b=MhkYLUdGIF+WYGBg4fh2js3Rf1RqwYqh+25r/WAUupuiw9bkEc5WHOlLBot6Le2QdU
         uOz+aYEmJxz/6NyYJy+ftZoYBaehYYgeZBGYuyDZ47uicqQGh28Jxj1oN+s2JsEISG9A
         t+aiaFryu1x5/WSmj6G9QKZ6ZbMcrQutsLfTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721892720; x=1722497520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GVlNStJvrT8ORCcRB8+CmsmV0FyqBN6Hy+p1P9rZbw=;
        b=BvH7WLEFu5P1QrKsfunQBuaPtX4YQGBHJHfSCtpQf+Z7VKMeKmEgjYbVC+VC3rBpWG
         TenQrpE+WXibNWiLFdeWK8I4F90dNYfuY2EOxXUKFhKyye1Ru2CAqbVeA4lXFn5sdgaZ
         OmT1GyIDL5/NkZCOosrCl5emgTcmOFjT1d0DWuW73dCVx4jkI1GDqytLcaMttf1pY7M/
         JMYy8IxTwnn1VRNULthM5dWYfDdKP8uAhhBM5BF6bJy0Pw5KhuyCweaJfax4RxKwvkhg
         9yMZfOw0VGp5q+qy8pRBndkJ64oAcGxhmF5hG1GyFX6yJ4lKypbX0KrckM0S2SRCPsEk
         FeBg==
X-Gm-Message-State: AOJu0YwTvGk6TV/hPUMXBP7CjZTijki+5vQEi4BgwqFdGyFDpVcQTYZU
	4O6mnLD4earzCGuW1806LoF1AwKLx+a8Mu4RKM+QxFVYTGqU7Gg/W8lue9vb92b9x1KgN8CDXG+
	T
X-Google-Smtp-Source: AGHT+IHfDJbquxK4yoeiAtgbU0j7N/IGyrHV9CdR7h6snx/JBoTzCuXUsX3oxBVqaoEeHvgUuwnjCQ==
X-Received: by 2002:a05:6214:202f:b0:6b0:6dba:c947 with SMTP id 6a1803df08f44-6bb40700306mr13763466d6.18.1721892720336;
        Thu, 25 Jul 2024 00:32:00 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/2] x86/xen: fix memblock_reserve() usage on PVH
Date: Thu, 25 Jul 2024 09:31:15 +0200
Message-ID: <20240725073116.14626-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725073116.14626-1-roger.pau@citrix.com>
References: <20240725073116.14626-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current usage of memblock_reserve() in init_pvh_bootparams() is done before
the .bss is zeroed, and that used to be fine when
memblock_reserved_init_regions implicitly ended up in the .meminit.data
section.  However after commit 73db3abdca58c memblock_reserved_init_regions
ends up in the .bss section, thus breaking it's usage before the .bss is
cleared.

Move and rename the call to xen_reserve_extra_memory() so it's done in the
x86_init.oem.arch_setup hook, which gets executed after the .bss has been
zeroed, but before calling e820__memory_setup().

Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
While the commit that introduced the user-noticeable regression is
73db3abdca58c, I think 38620fc4e893 should have been more careful to not
initialize the memblock ranges ahead of the .bss zeroing.
---
 arch/x86/include/asm/xen/hypervisor.h |  5 -----
 arch/x86/platform/pvh/enlighten.c     |  3 ---
 arch/x86/xen/enlighten_pvh.c          | 15 ++++++++++++---
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 64fbd2dbc5b7..a9088250770f 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -62,11 +62,6 @@ void xen_arch_unregister_cpu(int num);
 #ifdef CONFIG_PVH
 void __init xen_pvh_init(struct boot_params *boot_params);
 void __init mem_map_via_hcall(struct boot_params *boot_params_p);
-#ifdef CONFIG_XEN_PVH
-void __init xen_reserve_extra_memory(struct boot_params *bootp);
-#else
-static inline void xen_reserve_extra_memory(struct boot_params *bootp) { }
-#endif
 #endif
 
 /* Lazy mode for batching updates / context switch */
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 8c2d4b8de25d..944e0290f2c0 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -75,9 +75,6 @@ static void __init init_pvh_bootparams(bool xen_guest)
 	} else
 		xen_raw_printk("Warning: Can fit ISA range into e820\n");
 
-	if (xen_guest)
-		xen_reserve_extra_memory(&pvh_bootparams);
-
 	pvh_bootparams.hdr.cmd_line_ptr =
 		pvh_start_info.cmdline_paddr;
 
diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 91c6db4ec054..728a4366ca85 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -9,6 +9,7 @@
 #include <asm/io_apic.h>
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
+#include <asm/setup.h>
 
 #include <xen/xen.h>
 #include <asm/xen/interface.h>
@@ -41,8 +42,9 @@ EXPORT_SYMBOL_GPL(xen_pvh);
  * hypervisor should notify us which memory ranges are suitable for creating
  * foreign mappings, but that's not yet implemented.
  */
-void __init xen_reserve_extra_memory(struct boot_params *bootp)
+static void __init pvh_reserve_extra_memory(void)
 {
+	struct boot_params *bootp = &boot_params;
 	unsigned int i, ram_pages = 0, extra_pages;
 
 	for (i = 0; i < bootp->e820_entries; i++) {
@@ -94,6 +96,14 @@ void __init xen_reserve_extra_memory(struct boot_params *bootp)
 	}
 }
 
+static void __init pvh_arch_setup(void)
+{
+	pvh_reserve_extra_memory();
+
+	if (xen_initial_domain())
+		xen_add_preferred_consoles();
+}
+
 void __init xen_pvh_init(struct boot_params *boot_params)
 {
 	u32 msr;
@@ -107,8 +117,7 @@ void __init xen_pvh_init(struct boot_params *boot_params)
 	pfn = __pa(hypercall_page);
 	wrmsr_safe(msr, (u32)pfn, (u32)(pfn >> 32));
 
-	if (xen_initial_domain())
-		x86_init.oem.arch_setup = xen_add_preferred_consoles;
+	x86_init.oem.arch_setup = pvh_arch_setup;
 	x86_init.oem.banner = xen_banner;
 
 	xen_efi_init(boot_params);
-- 
2.45.2


