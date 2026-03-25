Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAE+FM67w2kRtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F33232A5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261933.1554685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfj-0006CX-Ke; Wed, 25 Mar 2026 10:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261933.1554685; Wed, 25 Mar 2026 10:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfj-0006A3-Gz; Wed, 25 Mar 2026 10:41:11 +0000
Received: by outflank-mailman (input) for mailman id 1261933;
 Wed, 25 Mar 2026 10:41:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Lfh-0005su-5e
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:41:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lff-00CE42-01
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbb7-5cb7-0a2a0a5109dd-0a2a4501c0c6-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:08 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbc4-6400-0a2a45010019-d155d032e9c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:08 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6694d00e01bso4273583a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 03:41:08 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm798491866b.17.2026.03.25.03.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:41:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774435268; x=1775040068; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwKk50IewHoX8VCImGLVtNk1nwW7tGvQB6wa4lfiyaM=;
        b=mTCLEEm/Y9vnXShW9+VAZwyP8SIN7HM8T+43eVxwQLTqFnbcCk9TNPgkrijtxpM1VT
         9Epkleh+80OwsnLSGAN/cq8pYU2wxg1LbOFEbWLVAddNaRBRBykGAYjOtGUM6jN1qJUo
         OdxpQDaCWjRXBtB9gdV8ltgkcSAcouvqr20jOFa08CWnwr+KrT+QzNcTqblfrRh5JMlT
         hygnd0HUg9JUTSC4XecwH/3Ar/ypEFvcRy1QSASRTw6dL55J5PrDUNhdApfJzNSG5uKl
         WAzfFlZBDipXO85UDOGSgS598/aTAnqHxOaH5n/6bzO2goTJ6o+uX9/LLK1fclgFfsrS
         2OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435268; x=1775040068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwKk50IewHoX8VCImGLVtNk1nwW7tGvQB6wa4lfiyaM=;
        b=FJjtF6cksaRJme40sOCa5O+Gl+IhvkYoCpRh8zCjhDf2X1D/Es+k8uEpFbB0cOn8rI
         cz0YLWdTu0L9D147MGyxm5U1eTOdT/4wcYIckIYNqoaazUqBbEq1jzfboMl2RbFRO6jr
         av1zcHhuIPV/X73N4K0nLTueQfDdtfRmkx9lGq5YEsXHgEpL3KALfxSK2QUBSheq1anQ
         01Yt2MTEqdy2nKRHDajM93qERT3/O15fpyTrFJ9OXZN2m9Wo2LEm+1qIbi1gjBR0eijB
         ewoK6VJMh+gb4DQKEwo6WRWA43G9KWruwzPYYw+1PLfGPOc4My5WrTjb4+ylf3NK6I+5
         ML8A==
X-Gm-Message-State: AOJu0YzDqQ4F4fNkM86bsZODFz1h7/yNpI/wMW+p/tyKrn6sl9mEeB86
	/3A1pWjyNgFj1MozVjs9QEWkiUw/S6owMTGMPoS/NeNzgVaNTOMH8vNyc2nO9w==
X-Gm-Gg: ATEYQzyGBBiW9Ve7AHsISZdoK7OyFaeZbQMbqI+cODv6l66VxyDsguAe9SHOvJxRG9Q
	bC1/tGyDQ5r8ewL3KykMnG17euVX3BCyO1KaYNN/IURMad/Yx61JhCWYUkJXBvV2zxS6EKitZa3
	qtSLK0TUmszReH3IK4S+Ul41/Exn35Gi1KO5YT1YsxPZGhWSTsjEwZ21PNR+K5SsSjUKVbToHbe
	MGCdRGMuU1lKMeDaMm5WFnkwWUMWRFkFN9ZHnB2vyvNpJGjXc4xyQEy5Lfn3wEywVPMLixfBDdf
	rywOpa511OLECI4PePcvtMuwJKy2rfUXP+eYmZ6hDVGdlOxZiwBWbegQ0e+dprKWcYUTI4oo8GS
	g8OURhDlmLnAp5HXYxVaSEODzWA0SBGMnM0T7GhsnLcOd7mxh8dHRRAoEJzMmfqIM/t7hV8WJIe
	e1hrtOD1n+por0/yslGDWd5Vtd7Q==
X-Received: by 2002:a17:906:f59c:b0:b98:1b:5157 with SMTP id a640c23a62f3a-b9a3f1a54d5mr196571266b.23.1774435267531;
        Wed, 25 Mar 2026 03:41:07 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/4] xen/arm: its: pre-initialize ITS quirks before LPI setup
Date: Wed, 25 Mar 2026 12:38:33 +0200
Message-ID: <a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774431310.git.mykola_kvach@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774435268-20CF3DF3-1B90C5EA/0/0
X-purgate-type: clean
X-purgate-size: 5396
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E39F33232A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

In the current initialization flow, gicv3_init() calls gicv3_dist_init()
before gicv3_its_init().

When LPIs are supported, gicv3_dist_init() calls
gicv3_lpi_init_host_lpis(), which initializes host LPI state and allocates
the boot CPU pending table before ITS quirk flags are computed. Non-boot
CPUs allocate their pending tables later from the CPU_UP_PREPARE notifier,
while redistributor LPI programming happens separately in
gicv3_lpi_init_rdist().

This means the boot CPU LPI setup can observe default ITS memory attributes
before dma-noncoherent and other ITS quirks are applied.

Introduce gicv3_its_preinit() and call it before gicv3_dist_init(). This
keeps the actual ITS hardware initialization in gicv3_its_init(), but moves
ITS discovery, quirk validation and quirk flag setup early enough for the
subsequent LPI initialization to use the correct attributes.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
TODO: Think about separating Redistributor/LPI attributes from ITS.
---
 xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++----------
 xen/arch/arm/gic-v3.c                 |  7 ++++++
 xen/arch/arm/include/asm/gic_v3_its.h |  5 ++++
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index ee432088cd..0251d91630 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -63,6 +63,7 @@ struct its_quirk {
     uint32_t flags;
 };
 
+/* TODO: Separate Redistributor/LPI attributes from ITS quirks. */
 static uint32_t __ro_after_init its_quirk_flags;
 
 static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
@@ -148,9 +149,15 @@ static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
     return flags;
 }
 
-static void gicv3_its_enable_quirks(struct host_its *hw_its)
+static void gicv3_its_enable_quirks(void)
 {
     const struct its_quirk *quirk;
+    const struct host_its *hw_its;
+
+    if ( list_empty(&host_its_list) )
+        return;
+
+    hw_its = list_first_entry(&host_its_list, struct host_its, entry);
 
     its_quirk_flags = gicv3_its_collect_quirks(hw_its, &quirk);
 
@@ -603,16 +610,10 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
     uint64_t reg;
     int i, ret;
 
-    hw_its->its_base = ioremap_nocache(hw_its->addr, hw_its->size);
-    if ( !hw_its->its_base )
-        return -ENOMEM;
-
     ret = gicv3_disable_its(hw_its);
     if ( ret )
         return ret;
 
-    gicv3_its_enable_quirks(hw_its);
-
     reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
     hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
@@ -1161,6 +1162,11 @@ static void add_to_host_its_list(paddr_t addr, paddr_t size,
     its_data->size = size;
     its_data->dt_node = node;
 
+    its_data->its_base = ioremap_nocache(its_data->addr, its_data->size);
+    if ( !its_data->its_base )
+        panic("GICv3: Cannot map ITS frame: 0x%lx, 0x%lx\n",
+            its_data->addr, its_data->size);
+
     printk("GICv3: Found ITS @0x%lx\n", addr);
 
     list_add_tail(&its_data->entry, &host_its_list);
@@ -1238,16 +1244,22 @@ static void gicv3_its_acpi_init(void)
 
 #endif
 
-int gicv3_its_init(void)
+void __init gicv3_its_preinit(void)
 {
-    struct host_its *hw_its;
-    int ret;
-
     if ( acpi_disabled )
         gicv3_its_dt_init(dt_interrupt_controller);
     else
         gicv3_its_acpi_init();
 
+    gicv3_its_validate_quirks();
+    gicv3_its_enable_quirks();
+}
+
+int gicv3_its_init(void)
+{
+    struct host_its *hw_its;
+    int ret;
+
     list_for_each_entry(hw_its, &host_its_list, entry)
     {
         ret = gicv3_its_init_single_its(hw_its);
@@ -1255,8 +1267,6 @@ int gicv3_its_init(void)
             return ret;
     }
 
-    gicv3_its_validate_quirks();
-
     return 0;
 }
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16..6e44d23d64 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1974,6 +1974,13 @@ static int __init gicv3_init(void)
 
     spin_lock(&gicv3.lock);
 
+    if ( gic_dist_supports_lpis() )
+        /*
+         * Apply ITS quirks before gicv3_dist_init() sets up host LPIs,
+         * so pending tables use the correct ITS memory attributes.
+         */
+        gicv3_its_preinit();
+
     gicv3_dist_init();
 
     if ( gic_dist_supports_lpis() )
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..e1d7522ea5 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
 
 /* Initialize the host structures for LPIs and the host ITSes. */
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
+void gicv3_its_preinit(void);
 int gicv3_its_init(void);
 
 /* Store the physical address and ID for each redistributor as read from DT. */
@@ -219,6 +220,10 @@ static inline int gicv3_its_deny_access(struct domain *d)
     return 0;
 }
 
+static inline void gicv3_its_preinit(void)
+{
+}
+
 static inline bool gicv3_its_host_has_its(void)
 {
     return false;
-- 
2.43.0


