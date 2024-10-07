Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F4992FB3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812137.1224844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoxu-00047C-8Z; Mon, 07 Oct 2024 14:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812137.1224844; Mon, 07 Oct 2024 14:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoxu-00044v-5x; Mon, 07 Oct 2024 14:44:02 +0000
Received: by outflank-mailman (input) for mailman id 812137;
 Mon, 07 Oct 2024 14:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITCe=RD=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sxoxs-00042A-8N
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:44:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95b417b6-84ba-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:43:58 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so8814283a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:43:58 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0594944sm3253004a12.20.2024.10.07.07.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:43:57 -0700 (PDT)
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
X-Inumbo-ID: 95b417b6-84ba-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728312237; x=1728917037; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNAC+18oEUnhb5mytedDay7gb4s9baqUanV1IJn4ddk=;
        b=Iao3N16ZYhmyXnB4iiJ8cnKls+Ja74LF117aAu4SneL8cbXfsFp+Z4XQ4h8myZ81f3
         eBoURQPlebj/s5R0swcp15mrUwwDBqEdCmiAgAnqtnk/ptstf2bLJbysIqBWJWxb90fu
         BCbLY8182fPXBzqE/QHGep2E08AdM+PevEzck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312237; x=1728917037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNAC+18oEUnhb5mytedDay7gb4s9baqUanV1IJn4ddk=;
        b=tkLxWVNWG1e1VvdZMUNuqlJw3TAIfsJftJBMVAWa8btXluoLe8Nv4uhKuKAd7FDhwy
         klIJigrzM5G2WeYIY4cororBZgsfxhC6xMeQPy1LuqazVMf+fDS/+93ahR+ZfqC89sBw
         SzChoy374pulXVN863PHhOv8eflcSJFhM5tMQRB+nX4r02tDvvOGdHZkZBb/hoytUWER
         YeZJAEIhDECMmr8QUbzP8fDhziPa+VI2o/7XwIyK3iSFj75LpjZYRRVldNdotfttI3mV
         JXSW+v0TGZaX7+FVmdVZeXv5LPCByB/OEDifnRkONUGf9TkiHyRc/n0EJgoqh0Xg58eJ
         q1tA==
X-Gm-Message-State: AOJu0YzsYwaFOeYSIdY79f7DxB+61FTCVwLl+gUxK1yPM4s4Hz0E+FFK
	9PHhatuU46CZ4Gx8AgJPn5/dtfLu2E+10Vajt90G2qmwqynU0zGj6FqIkVxtMV/SI3YDloxpc34
	R
X-Google-Smtp-Source: AGHT+IHfl/BqmCCe9MxIo313nFBT75bWyhQ42eYn/Vq4XVqWpPa7GUB2WOsV0eiJUkQ4DK1WYnxY+Q==
X-Received: by 2002:a05:6402:354d:b0:5c8:97b9:58a6 with SMTP id 4fb4d7f45d1cf-5c8d2f1d9e1mr12054541a12.1.1728312237360;
        Mon, 07 Oct 2024 07:43:57 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/APIC: Switch flat driver to use phys dst for ext ints
Date: Mon,  7 Oct 2024 15:34:43 +0100
Message-Id: <0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

External interrupts via logical delivery mode in xAPIC do not benefit
from targeting multiple CPUs and instead simply bloat up the vector
space.

However the xAPIC flat driver currently uses logical delivery for
external interrupts.

This patch switches the xAPIC flat driver to use physical destination
mode for external interrupts, instead of logical destination mode.

This patch also applies the following non-functional changes:
- Remove now unused logical flat functions
- Expand GENAPIC_FLAT and GENAPIC_PHYS macros, and delete them.

Resolves: https://gitlab.com/xen-project/xen/-/issues/194
Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Reword commit message
- Expand and delete GENAPIC_* macros
- Bundle patch series into one patch
---
 xen/arch/x86/genapic/bigsmp.c      |  8 +++++++-
 xen/arch/x86/genapic/default.c     |  8 +++++++-
 xen/arch/x86/genapic/delivery.c    | 10 ----------
 xen/arch/x86/include/asm/genapic.h | 20 +-------------------
 4 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
index e97e4453a033..b2e721845275 100644
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -46,5 +46,11 @@ static int __init cf_check probe_bigsmp(void)
 
 const struct genapic __initconst_cf_clobber apic_bigsmp = {
 	APIC_INIT("bigsmp", probe_bigsmp),
-	GENAPIC_PHYS
+	.int_delivery_mode = dest_Fixed,
+	.int_dest_mode = 0, /* physical delivery */
+	.init_apic_ldr = init_apic_ldr_phys,
+	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
+	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+	.send_IPI_mask = send_IPI_mask_phys,
+	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
index a968836a1878..59c79afdb8fa 100644
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -16,5 +16,11 @@
 /* should be called last. */
 const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
-	GENAPIC_FLAT
+	.int_delivery_mode = dest_Fixed,
+	.int_dest_mode = 0, /* physical delivery */
+	.init_apic_ldr = init_apic_ldr_flat,
+	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
+	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+	.send_IPI_mask = send_IPI_mask_flat,
+	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index d1f99bf6834a..3def78f380d3 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -19,16 +19,6 @@ void cf_check init_apic_ldr_flat(void)
 	apic_write(APIC_LDR, val);
 }
 
-const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu)
-{
-	return &cpu_online_map;
-} 
-
-unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask)
-{
-	return cpumask_bits(cpumask)[0]&0xFF;
-}
-
 /*
  * PHYSICAL DELIVERY MODE (unicast to physical APIC IDs).
  */
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index a694371c6d16..2f46f173c1d4 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -44,29 +44,11 @@ extern const struct genapic apic_bigsmp;
 void cf_check send_IPI_self_legacy(uint8_t vector);
 
 void cf_check init_apic_ldr_flat(void);
-unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
+const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
-const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
-#define GENAPIC_FLAT \
-	.int_delivery_mode = dest_LowestPrio, \
-	.int_dest_mode = 1 /* logical delivery */, \
-	.init_apic_ldr = init_apic_ldr_flat, \
-	.vector_allocation_cpumask = vector_allocation_cpumask_flat, \
-	.cpu_mask_to_apicid = cpu_mask_to_apicid_flat, \
-	.send_IPI_mask = send_IPI_mask_flat, \
-	.send_IPI_self = send_IPI_self_legacy
 
 void cf_check init_apic_ldr_phys(void);
 unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
 void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
-const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
-#define GENAPIC_PHYS \
-	.int_delivery_mode = dest_Fixed, \
-	.int_dest_mode = 0 /* physical delivery */, \
-	.init_apic_ldr = init_apic_ldr_phys, \
-	.vector_allocation_cpumask = vector_allocation_cpumask_phys, \
-	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys, \
-	.send_IPI_mask = send_IPI_mask_phys, \
-	.send_IPI_self = send_IPI_self_legacy
 
 #endif
-- 
2.46.0


