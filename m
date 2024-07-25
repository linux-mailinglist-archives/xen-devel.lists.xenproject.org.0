Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44B93BD25
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 09:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764734.1175244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxF-00038U-PS; Thu, 25 Jul 2024 07:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764734.1175244; Thu, 25 Jul 2024 07:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxF-00036A-M3; Thu, 25 Jul 2024 07:32:01 +0000
Received: by outflank-mailman (input) for mailman id 764734;
 Thu, 25 Jul 2024 07:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWsxE-0002ro-Rb
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 07:32:00 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa67c81b-4a57-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 09:32:00 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5c791729c36so381097eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 00:32:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8416381sm3660701cf.93.2024.07.25.00.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 00:31:57 -0700 (PDT)
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
X-Inumbo-ID: fa67c81b-4a57-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721892718; x=1722497518; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRJmNl7Bb9/OZ0AorI+0NK/6Qn825Rg5jazvccIBXIg=;
        b=nbrUBmetEX6aCsarMR3l1WDYnziWSDJMD8nRV+aR670489/8dq9tqgvTTU+8z2VdKN
         iR1az+vzCoTomuMXxmr32JUB55uvBiDysQnxzxNzWWcjFuO6x0cx0b/Tisw705kwwnIs
         nTsTyLchextEqBRZJG5t+8LRvvr6GWTTq7cJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721892718; x=1722497518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRJmNl7Bb9/OZ0AorI+0NK/6Qn825Rg5jazvccIBXIg=;
        b=WfKcU5/BBoSeMy/4S8ZtLFkEXNSOJB3vd8xtP8kjmRa93ffqchm6uAFau2wDE5QCTb
         ASjmSHlttMe5Yh1Uda/qv5V07KtMoQjyBknQiPZU81Ra2X18/iNZ/WlCmNW+76ov3rLW
         VC+3plkiCFdQytgjFuz/nzO0WUZi7AvXSBqM1HYabUsHPbI2hPpLcKJcFdvNbcgGMGs5
         kiHXdqh7tVyKoumYAkoexloXXFolE6mNS4Xufs+BHx5TstHae6efPA4rvvpSloYQM4kA
         yxg1MR8HyETowJW8wwhYcqls0u5e2A9QnQjPGpOmW5fCDjSMvzK11GHoFmE1g+dVsC7S
         PcAA==
X-Gm-Message-State: AOJu0YxkKHIYzmJxawJdFc/uVCORP8AwgZF7V86F8FTnMu3YAuz9ACeT
	/cJthgyM7DXoMK/e3ZLZK0go//eSxAlLWY3GNF5QkAzQ8KDW0dNepnRv3c02ws3rH/qPRZb9AfZ
	9
X-Google-Smtp-Source: AGHT+IFCNLG+ST0ZSsb5RJ0EWHwiIT/DnYl4e0Leyodh0YVdE/18MhaBFG2YoCxWCCHPvCxSvB4InQ==
X-Received: by 2002:a05:6358:2829:b0:1ac:ed54:224d with SMTP id e5c5f4694b2df-1acf8878d6fmr282666955d.11.1721892717619;
        Thu, 25 Jul 2024 00:31:57 -0700 (PDT)
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
Subject: [PATCH 1/2] x86/xen: move xen_reserve_extra_memory()
Date: Thu, 25 Jul 2024 09:31:14 +0200
Message-ID: <20240725073116.14626-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725073116.14626-1-roger.pau@citrix.com>
References: <20240725073116.14626-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for making the function static.

No functional change.

Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Since this is a pre-requisite for a bugfix, I've tagged it with "Fixes:", not
sure if that's appropriate or there's some better tag to use.
---
 arch/x86/xen/enlighten_pvh.c | 96 ++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 27a2a02ef8fb..91c6db4ec054 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -27,54 +27,6 @@
 bool __ro_after_init xen_pvh;
 EXPORT_SYMBOL_GPL(xen_pvh);
 
-void __init xen_pvh_init(struct boot_params *boot_params)
-{
-	u32 msr;
-	u64 pfn;
-
-	xen_pvh = 1;
-	xen_domain_type = XEN_HVM_DOMAIN;
-	xen_start_flags = pvh_start_info.flags;
-
-	msr = cpuid_ebx(xen_cpuid_base() + 2);
-	pfn = __pa(hypercall_page);
-	wrmsr_safe(msr, (u32)pfn, (u32)(pfn >> 32));
-
-	if (xen_initial_domain())
-		x86_init.oem.arch_setup = xen_add_preferred_consoles;
-	x86_init.oem.banner = xen_banner;
-
-	xen_efi_init(boot_params);
-
-	if (xen_initial_domain()) {
-		struct xen_platform_op op = {
-			.cmd = XENPF_get_dom0_console,
-		};
-		int ret = HYPERVISOR_platform_op(&op);
-
-		if (ret > 0)
-			xen_init_vga(&op.u.dom0_console,
-				     min(ret * sizeof(char),
-					 sizeof(op.u.dom0_console)),
-				     &boot_params->screen_info);
-	}
-}
-
-void __init mem_map_via_hcall(struct boot_params *boot_params_p)
-{
-	struct xen_memory_map memmap;
-	int rc;
-
-	memmap.nr_entries = ARRAY_SIZE(boot_params_p->e820_table);
-	set_xen_guest_handle(memmap.buffer, boot_params_p->e820_table);
-	rc = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
-	if (rc) {
-		xen_raw_printk("XENMEM_memory_map failed (%d)\n", rc);
-		BUG();
-	}
-	boot_params_p->e820_entries = memmap.nr_entries;
-}
-
 /*
  * Reserve e820 UNUSABLE regions to inflate the memory balloon.
  *
@@ -141,3 +93,51 @@ void __init xen_reserve_extra_memory(struct boot_params *bootp)
 		xen_add_extra_mem(PFN_UP(e->addr), pages);
 	}
 }
+
+void __init xen_pvh_init(struct boot_params *boot_params)
+{
+	u32 msr;
+	u64 pfn;
+
+	xen_pvh = 1;
+	xen_domain_type = XEN_HVM_DOMAIN;
+	xen_start_flags = pvh_start_info.flags;
+
+	msr = cpuid_ebx(xen_cpuid_base() + 2);
+	pfn = __pa(hypercall_page);
+	wrmsr_safe(msr, (u32)pfn, (u32)(pfn >> 32));
+
+	if (xen_initial_domain())
+		x86_init.oem.arch_setup = xen_add_preferred_consoles;
+	x86_init.oem.banner = xen_banner;
+
+	xen_efi_init(boot_params);
+
+	if (xen_initial_domain()) {
+		struct xen_platform_op op = {
+			.cmd = XENPF_get_dom0_console,
+		};
+		int ret = HYPERVISOR_platform_op(&op);
+
+		if (ret > 0)
+			xen_init_vga(&op.u.dom0_console,
+				     min(ret * sizeof(char),
+					 sizeof(op.u.dom0_console)),
+				     &boot_params->screen_info);
+	}
+}
+
+void __init mem_map_via_hcall(struct boot_params *boot_params_p)
+{
+	struct xen_memory_map memmap;
+	int rc;
+
+	memmap.nr_entries = ARRAY_SIZE(boot_params_p->e820_table);
+	set_xen_guest_handle(memmap.buffer, boot_params_p->e820_table);
+	rc = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
+	if (rc) {
+		xen_raw_printk("XENMEM_memory_map failed (%d)\n", rc);
+		BUG();
+	}
+	boot_params_p->e820_entries = memmap.nr_entries;
+}
-- 
2.45.2


