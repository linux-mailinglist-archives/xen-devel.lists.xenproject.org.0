Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F5A05FDC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867485.1279067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpv-0001Rj-8q; Wed, 08 Jan 2025 15:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867485.1279067; Wed, 08 Jan 2025 15:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpv-0001Nk-1D; Wed, 08 Jan 2025 15:19:11 +0000
Received: by outflank-mailman (input) for mailman id 867485;
 Wed, 08 Jan 2025 15:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXps-0008Lg-GL
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:08 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e78e75fd-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:08 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so2455543566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:07 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:06 -0800 (PST)
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
X-Inumbo-ID: e78e75fd-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349547; x=1736954347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjMmCnPvYhGWKY9jq+47lrrCTBXbD9mgdkXdbRy6L+U=;
        b=T93PYqB+WYv9aZXqGBBSHyzcJ12AJYpjmKiI8tLy0XIN3Ff2sBCULlOJTRnpg+kt3t
         EayJEpoioR6l92BSCOdvF1KA/fkfVAiL6eP1mxr5BLGxA7A5c+hMlDo3VYnRRrB2I3WH
         q24QD4WPuoJTFlv//KWTU25yySKyhYeOHa4OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349547; x=1736954347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjMmCnPvYhGWKY9jq+47lrrCTBXbD9mgdkXdbRy6L+U=;
        b=Pb5k16uYU5fPwzxXi/yiEaPQRN5YPbFEgnkYAo86jLLTdodT8nJxSV6imgF+v4ujsf
         e9DFptFEV5q6w5udN7tjhmJTDcIYGVQp7nkpbxlf8jkJw3lw3TwE3IDm8bAQyUP0MoH2
         EQ8dPz1yNAd7rC3cWf70z/IQhM4aNGuPAafaBhfue0k1RDDMkeqZJo+eG1/5vUjCWyIc
         AIsfia7SYRlDy9Zr3nvJGrOCy0fLaWZjFcHxVPs/wHhDDZpoiMU5RPLDAT+Ie9FCcg60
         LWEwly3PJzUz0NUN9u6yMa/BRepARL6h3WCnvl+OHb0bqMX3EpIE8khrne71bqyGjXti
         XKvw==
X-Gm-Message-State: AOJu0Yw9W6tB21VJ634nXKI2jDk1kvQRJ4UKl+O5D4wKMXNguKCt2u+h
	WGOcgan975qlVowuCRoIjrb8cIpsXNJuhvZsIp5415zQZX0BHDm8yl8UJ0L5ThswC3PyLsLK7wC
	Idmigrg==
X-Gm-Gg: ASbGncsEG3s6loO5wSrzJw13jMdmIIT+mtqAqF2Fn9UezBX6HXpkW4PF6h7xNddHoI7
	tf9yBiLTmZfu8depvCGLlGNk+Wpk08KacXfUevGZYP4KrH4E6DrysLGvZTHnSiZpXdIXgRftUsw
	YgLewGqjmbxa/+0qVLMP+XglF02+LJaNN9b1I9VIlNakM/y6yWK2cZ6uZjTvaoVqbqFvFjOby5E
	n8w6sFVAuQfHalya8rrpXNV+/P2LgqljnfopNaQIgkIwmOdG526ZH9hLJrFH7n9Cper5KhF0Wyp
	2a4=
X-Google-Smtp-Source: AGHT+IHm+GlwZHnqvLphieP9LH0FVfXA/XTlt6gMtPQsfzpf8oMG9ZAYuETNdwTvWKs+ujchLnpC2w==
X-Received: by 2002:a17:907:94c8:b0:aaf:7321:f05a with SMTP id a640c23a62f3a-ab2abc6e773mr279314766b.46.1736349547208;
        Wed, 08 Jan 2025 07:19:07 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 06/15] xen/x86: Add support for the PMAP
Date: Wed,  8 Jan 2025 15:18:13 +0000
Message-ID: <20250108151822.16030-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

PMAP will be used in a follow-up patch to bootstrap map domain
page infrastructure -- we need some way to map pages to setup the
mapcache without a direct map.

The functions pmap_{map, unmap} open code {set, clear}_fixmap to break
the loop.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * No changes.

v3->v4:
  * Select PMAP KConfig option iff ONDEMAND_DIRECTMAP is used

v2->v3:
  * No changes.

v1->v2:
  * Declare PMAP entries earlier in fixed_addresses
  * Reword the commit message

    The PMAP infrastructure was upstream separately for Arm since
    Hongyan sent the secret-free hypervisor series. So this is a new
    patch to plumb the feature on x86.
---
 xen/arch/x86/include/asm/fixmap.h |  6 ++++++
 xen/arch/x86/include/asm/pmap.h   | 35 +++++++++++++++++++++++++++++++
 xen/common/Kconfig                |  1 +
 3 files changed, 42 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/pmap.h

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c95..80b7b74fd816 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -21,6 +21,8 @@
 
 #include <xen/acpi.h>
 #include <xen/pfn.h>
+#include <xen/pmap.h>
+
 #include <asm/apicdef.h>
 #include <asm/msi.h>
 #include <acpi/apei.h>
@@ -53,6 +55,10 @@ enum fixed_addresses {
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
 #endif /* CONFIG_XEN_GUEST */
+#ifdef CONFIG_HAS_PMAP
+    FIX_PMAP_BEGIN,
+    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
+#endif
     /* Everything else should go further down. */
     FIX_APIC_BASE,
     FIX_IO_APIC_BASE_0,
diff --git a/xen/arch/x86/include/asm/pmap.h b/xen/arch/x86/include/asm/pmap.h
new file mode 100644
index 000000000000..1b3b729b90b2
--- /dev/null
+++ b/xen/arch/x86/include/asm/pmap.h
@@ -0,0 +1,35 @@
+#ifndef __ASM_PMAP_H__
+#define __ASM_PMAP_H__
+
+#include <asm/fixmap.h>
+
+static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    unsigned long linear = (unsigned long)fix_to_virt(slot);
+    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
+
+    BUILD_BUG_ON(FIX_APIC_BASE - 1 > L1_PAGETABLE_ENTRIES - 1);
+    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
+
+    l1e_write(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    unsigned long linear = (unsigned long)fix_to_virt(slot);
+    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
+
+    l1e_write(pl1e, l1e_empty());
+    flush_tlb_one_local(linear);
+}
+
+#endif /* __ASM_PMAP_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 1ee498a3e9a7..5b22b09a4fbc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -220,6 +220,7 @@ config SPECULATIVE_HARDEN_LOCK
 config ONDEMAND_DIRECTMAP
 	bool "On-Demand Directmap"
 	depends on HAS_ONDEMAND_DIRECTMAP
+	select HAS_PMAP
 	help
 	  Contemporary processors may use speculative execution as a
 	  performance optimisation, but this can potentially be abused by an
-- 
2.47.1


