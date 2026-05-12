Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLTMC/deA2qE5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0CB5257BB
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307276.1579009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc7-0006Hi-S0; Tue, 12 May 2026 17:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307276.1579009; Tue, 12 May 2026 17:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc7-0006Fj-OK; Tue, 12 May 2026 17:09:47 +0000
Received: by outflank-mailman (input) for mailman id 1307276;
 Tue, 12 May 2026 17:09:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc6-0005xD-1w
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc5-00AZDT-F1
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035eca-e002-0a2a0a5209dd-0a2a45078240-26
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:45 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ed9-229c-0a2a45070019-d1558036e1eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:45 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso53136715e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:45 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605784; x=1779210584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXX7LiIDl3A+pjPnWv0DkG9B7a9KxTjMmrGlAN2uPmo=;
        b=VWCqtQu9XJmjbzceO96JPfwoRYiZGQOusmT5/rBDrzxvI6P8YORsDVhS5MHneEwMbs
         Xata0uBfRfHfsRSRY84BLfZuwb9fL9kr0JMNAepgjUzHr59qk28T0n/9Id/hIObNaY8J
         XQeeJ9ucIsPJDfl11tO+Lv3tNx3gEeWUwXFr7z8QwrWc9rEWEssYExHscQEJg40TRfK7
         0MSlxY4U30NZgtSYyHCiiqsDbG9gkeMAEKgiHfKe4kPq9UaEheBLIXpRLREKZo46NLTJ
         jHRd2D1wGY5yc7mTAC7L4BXLGV44lIPu+SpmHXCGFMenCzbKxFwIDfXTWEApKkXm3JQd
         8iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605784; x=1779210584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXX7LiIDl3A+pjPnWv0DkG9B7a9KxTjMmrGlAN2uPmo=;
        b=N9f/rUhvTqgC8V0/YhL6XAUhXEVK3531rbu4f7HRy5EEYPwveTp7I4AeUiMD++5aZ5
         HG0AgOgbRpwwH/hnQbfYcCw9IFChv6A6Qo0donoLehRl4TvNKJRcU6X+LyRXkFSB8JW2
         5zayS+3h6gMX52j+FNGX5ZpZs2MpkZZGYC+X47kYJR9YNvzRNIhOuxJCsaijzRFFhlUy
         uNtijB0pfoybVIFNZc6Vly4EPHPZfzRUR6wAtSseR2tFJ3tCECnYgkAdkKKCKml2+3QU
         7PwYZFYJ/oUt9xBZoIpAnmMCrWjjw8x9pcuordZwglm3LdUttMzblAwj8OHweqdKvl0S
         4zdQ==
X-Gm-Message-State: AOJu0Ywsf9hUm62rrHN3faP+nziBm+jqoP+Cqs6Hcn/xPQY3v02IQjyA
	3b4Hvfi8Ayy9IQKcB1K0WykeYcFU1wLdMrHIfOurVHirjMjrSLmA2/xBQluHCA==
X-Gm-Gg: Acq92OEQcSPRBqQNCeTbx4q8ELVYrkiA/e49p9C8JjA5jsmcd7J6x57iCoSM8uv6Goe
	BGkEYNyDVgGvb13ueBzdB3Wg9L/6oqEhu3xgpA5hhOEJFYl1VICDlexQt/ajkaHFi7MuttIsSlw
	/OzJY2z96ORXeDRSzQT6GQoqUXCvJh36x2kC+DENqVo+d+3M4hCqGToHMB+NjpuMSrDZLmlzomx
	i6eMNQIKq46twG6tPQvmyavP5wzVvrp42I2K0j3DyeVuEp/C7gzRaESFC6zBVZlxD6jWStmecm8
	AuQ8Aieax6UxYsDKhw34zqUTD8MemT5zfHOTbkpf9ZHeMQ+/e/wt6Rc1FwHFUmozqgF5LnG4BK8
	hSBqcm5gCeusJkhw3H6bpx2tYh2JV4rtAjaV50XtiA5o+2q2nBGdmIkPEB+iRihUYp+6EQhadbA
	JxXC9OCozH65aOrSt/BaxYfNAs3A==
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-48e7f7de432mr182800855e9.4.1778605784332;
        Tue, 12 May 2026 10:09:44 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 03/13] xen/arm: gic-v3: tolerate retained redistributor LPI state across CPU_OFF
Date: Tue, 12 May 2026 20:07:10 +0300
Message-ID: <ddf37bff562e7e2055ee049ab63111c5a2a2e611.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778605785-2887FC48-52A15AD8/0/0
X-purgate-type: clean
X-purgate-size: 10164
X-Rspamd-Queue-Id: CA0CB5257BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

PSCI does not guarantee that a GICv3 redistributor is powered down across
CPU_OFF -> CPU_ON.

DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
brings the core back with a defined initial CPU state (5.6, 6.4).
However, PSCI leaves interrupt migration and GIC re-initialization to the
supervisory software/firmware stack: the caller must migrate interrupts
away before CPU_OFF (5.5.2), and the execution context that is lost in a
powerdown state must be saved and restored by software (6.8). PSCI also
calls out GIC management explicitly in 6.8, including retargeting SPIs,
preventing PPIs/SGIs from targeting a powered down CPU, and reinitializing
the CPU interface after CPU_ON.

This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the PE
and CPU interface to share a power domain, but explicitly allows the
associated redistributor, distributor, and ITS to remain powered while the
PE and CPU interface are off. All other GIC power-management behavior is
IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
Controller (GIC)", says the GICv3 redistributor may live either in the AP
core power domain or in a relatively always-on parent domain. So after
CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
redistributor with GICR_CTLR.EnableLPIs still set.

Handle that case in the LPI setup path instead of assuming a fully reset
redistributor.

The LPI path needs special care because the GIC spec makes redistributor
LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
GICR_CTLR.EnableLPIs == 1 is UNPREDICTABLE. After clearing EnableLPIs,
software must wait for GICR_CTLR.RWP == 0 before touching the pending
table. The architecture also permits implementations where, once
EnableLPIs has been set, clearing it again is not guaranteed to work.
Where an ITS is present, the spec strongly recommends moving LPIs to
another redistributor before clearing EnableLPIs.

Because of that, treat a retained EnableLPIs state as valid when the
redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
Only try to clear EnableLPIs when the retained configuration does not
match Xen's state, and wait for RWP before reprogramming the tables.

This is also consistent with platform firmware reality: PSCI and the GIC
architecture allow platform-specific redistributor power handling, and not
all platform firmware implementations force a full redistributor power-off
through implementation-defined controls during CPU_OFF. Xen therefore needs
to tolerate retained redistributor state on secondary CPU bring-up.

Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
reuses it on secondary CPU bring-up after init.

Tested using Xen's non-boot CPU disable/enable path on Arm
FVP_Base_RevC-2xAEMvA, both with and without:
-C gic_distributor.allow-LPIEN-clear=1
-C gic_distributor.GICR-clear-enable-supported=1
and on Orange Pi 5.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v9:
- move gicv3_do_wait_for_rwp prototype from its related header to gic.h
- drop __init from gicv3_populate_rdist(), which is reused on secondary
  CPU bring-up after boot
- changed print format for smp_processor_id in gicv3_populate_rdist func
- cosmetic changes
---
 xen/arch/arm/gic-v3-lpi.c      | 77 +++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic-v3.c          | 23 ++++++----
 xen/arch/arm/include/asm/gic.h |  4 ++
 3 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..36bb45738e 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -81,6 +81,13 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
+/*
+ * For retained redistributor state, match the pending table by address only.
+ * Attribute bits such as PTZ may not read back with the programmed value.
+ */
+#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -296,6 +303,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
     return 0;
 }
 
+static uint64_t gicv3_lpi_expected_proptable(void)
+{
+    return virt_to_maddr(lpi_data.lpi_property);
+}
+
+static uint64_t gicv3_lpi_expected_pendtable(void)
+{
+    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
+}
+
+static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
+{
+    uint64_t propbase, pendbase;
+
+    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table )
+        return false;
+
+    propbase = readq_relaxed(rdist_base + GICR_PROPBASER);
+    pendbase = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    return ((propbase & GICR_PROPBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)) &&
+           ((pendbase & GICR_PENDBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK));
+}
+
+static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
+{
+    uint32_t reg = readl_relaxed(rdist_base + GICR_CTLR);
+    int ret;
+
+    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
+        return 0;
+
+    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTLR);
+
+    /*
+     * The spec only guarantees programmability when we have observed the bit
+     * cleared. Where clearing is supported, RWP must reach 0 before touching
+     * PROPBASER/PENDBASER again.
+     */
+    wmb();
+
+    ret = gicv3_do_wait_for_rwp(rdist_base);
+    if ( ret )
+        return ret;
+
+    reg = readl_relaxed(rdist_base + GICR_CTLR);
+    if ( reg & GICR_CTLR_ENABLE_LPIS )
+        return -EBUSY;
+
+    return 0;
+}
+
 /*
  * Tell a redistributor about the (shared) property table, allocating one
  * if not already done.
@@ -374,7 +435,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
     /* Make sure LPIs are disabled before setting up the tables. */
     reg = readl_relaxed(rdist_base + GICR_CTLR);
     if ( reg & GICR_CTLR_ENABLE_LPIS )
-        return -EBUSY;
+    {
+        if ( gicv3_lpi_tables_match(rdist_base) )
+            return -EBUSY;
+
+        ret = gicv3_lpi_disable_lpis(rdist_base);
+        if ( ret == -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "GICv3: CPU%u: LPIs still enabled with unexpected redistributor tables\n",
+                   smp_processor_id());
+            return -EINVAL;
+        }
+        if ( ret )
+            return ret;
+    }
 
     ret = gicv3_lpi_set_pendtable(rdist_base);
     if ( ret )
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9..cc0569a157 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -274,8 +274,8 @@ static void gicv3_enable_sre(void)
     isb();
 }
 
-/* Wait for completion of a distributor change */
-static void gicv3_do_wait_for_rwp(void __iomem *base)
+/* Wait for completion of a distributor/redistributor write-pending change. */
+int gicv3_do_wait_for_rwp(void __iomem *base)
 {
     uint32_t val;
     bool timeout = false;
@@ -295,17 +295,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *base)
     } while ( 1 );
 
     if ( timeout )
+    {
         dprintk(XENLOG_ERR, "RWP timeout\n");
+        return -ETIMEDOUT;
+    }
+
+    return 0;
 }
 
 static void gicv3_dist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD);
+    (void)gicv3_do_wait_for_rwp(GICD);
 }
 
 static void gicv3_redist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD_RDIST_BASE);
+    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE);
 }
 
 static void gicv3_wait_for_rwp(int irq)
@@ -857,7 +862,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -925,15 +930,15 @@ static int __init gicv3_populate_rdist(void)
                     gicv3_set_redist_address(rdist_addr, procnum);
 
                     ret = gicv3_lpi_init_rdist(ptr);
-                    if ( ret && ret != -ENODEV )
+                    if ( ret && ret != -ENODEV && ret != -EBUSY )
                     {
-                        printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
+                        printk("GICv3: CPU%u: Cannot initialize LPIs: %d\n",
                                smp_processor_id(), ret);
                         break;
                     }
                 }
 
-                printk("GICv3: CPU%d: Found redistributor in region %d @%p\n",
+                printk("GICv3: CPU%u: Found redistributor in region %d @%p\n",
                         smp_processor_id(), i, ptr);
                 return 0;
             }
@@ -953,7 +958,7 @@ static int __init gicv3_populate_rdist(void)
         } while ( !(typer & GICR_TYPER_LAST) );
     }
 
-    dprintk(XENLOG_ERR, "GICv3: CPU%d: mpidr 0x%"PRIregister" has no re-distributor!\n",
+    dprintk(XENLOG_ERR, "GICv3: CPU%u: mpidr 0x%"PRIregister" has no re-distributor!\n",
             smp_processor_id(), cpu_logical_map(smp_processor_id()));
 
     return -ENODEV;
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index fbf0d69edd..9293aa56e2 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,10 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_GICV3
+int gicv3_do_wait_for_rwp(void __iomem *base);
+#endif
+
 #ifdef CONFIG_SYSTEM_SUSPEND
 /* Suspend/resume */
 extern int gic_suspend(void);
-- 
2.43.0


