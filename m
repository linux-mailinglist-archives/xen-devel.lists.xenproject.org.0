Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C743B68A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 18:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216530.376175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfP0Y-0003ef-2f; Tue, 26 Oct 2021 16:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216530.376175; Tue, 26 Oct 2021 16:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfP0X-0003bp-Vj; Tue, 26 Oct 2021 16:09:01 +0000
Received: by outflank-mailman (input) for mailman id 216530;
 Tue, 26 Oct 2021 16:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gydQ=PO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mfP0W-0003bh-LI
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 16:09:00 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67cf74b4-1946-45ed-bd74-b4d35ecfedcc;
 Tue, 26 Oct 2021 16:08:59 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g8so14517461edb.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Oct 2021 09:08:59 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id eu9sm4025195ejc.14.2021.10.26.09.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:05:20 -0700 (PDT)
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
X-Inumbo-ID: 67cf74b4-1946-45ed-bd74-b4d35ecfedcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LFIfrPhDzMtnbpEZVPATV5Kch9wCoKpxpC7Ie87gFbI=;
        b=bs16QmQOkeJH5M96StGB5D0kKi6yFSOn6Bb9Z1JxuWPs8n7m9DKoVvOrnj02v/zFzP
         xDOoHIzz+zeajJzCemByRC4cUhlUVLJVjRbHpcKMUnYABP7tE+tsTgFM1I0SHu8abRc8
         ODiLRcwwLBdfek+yo1znmX1Q9TEwfSC5fNtbn5wv1OaBbxTqRsgloUZ+TK0SbXmiGJc6
         G1GHBYDlnnzrXk8efngJ4GTPAToixurpJzxE7zWSYia37K7y1+/QPLPRYdE4AahOmGMH
         lbGNyaSdDwcEo4G2rc2sREnoAaA4RLoLBKyH/sIz8xNUN6PVFS8Z3UgSMF4X9vhzAjci
         1gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LFIfrPhDzMtnbpEZVPATV5Kch9wCoKpxpC7Ie87gFbI=;
        b=iD7GNzZ9J4CcCOT7uKlTaknL4TGo9QEkv8fHTRCNXlueRUp7b3NYP98zjpcwm8rKqM
         7/OQ6N+U+AcOWmjkYaLQtOimo1Vg0q9yJS+UC/A3YPM+83LHdJ5dhKYOVkan9rJ5GLA3
         q1rbADx/HvaOypkCZ7GZjJl+iHmDZG0aFiW7iP/s6y2hOXv0Tmq+ifLCLLBWBxNy1drC
         Oy/Jf93t+hKpqxzouB2Qc7ilkfs4b/DBm1ABNBoiCOzmgAXHyMMJDTJx7DbDSr01RmtN
         bzIqI3Rq0xuAn6IaJatfea/6/9PZUbAWzm3JW+klCHf4nryFVDhwNUPKdhcETnXC2IYg
         YZ2g==
X-Gm-Message-State: AOAM5324Bq1qG31LYgn8t9hRwJg++0X139thanw3upylCuislM8VHTaS
	ihg3xdyjPHSLBJPz2moDQWOQkuiHnwQ=
X-Google-Smtp-Source: ABdhPJyDWvPDbHKN80B2wI0HUdKZkTQtxYSe3AhrmMT52rr89emWm0qnYTKAFM1mwoDlbefou8hA/Q==
X-Received: by 2002:a05:6402:486:: with SMTP id k6mr11970130edv.315.1635264321080;
        Tue, 26 Oct 2021 09:05:21 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V2 2/4] arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT
Date: Tue, 26 Oct 2021 19:05:10 +0300
Message-Id: <1635264312-3796-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Read the start address of the grant table space from DT
(region 0).

This patch mostly restores behaviour before commit 3cf4095d7446
("arm/xen: Use xen_xlate_map_ballooned_pages to setup grant table")
but trying not to break the ACPI support added after that commit.
So the patch touches DT part only and leaves the ACPI part with
xen_xlate_map_ballooned_pages().

This is a preparation for using Xen extended region feature
where unused regions of guest physical address space (provided
by the hypervisor) will be used to create grant/foreign/whatever
mappings instead of wasting real RAM pages from the domain memory
for establishing these mappings.

The immediate benefit of this change:
- Avoid superpage shattering in Xen P2M when establishing
  stage-2 mapping (GFN <-> MFN) for the grant table space
- Avoid wasting real RAM pages (reducing the amount of memory
  usuable) for mapping grant table space
- The grant table space is always mapped at the exact
  same place (region 0 is reserved for the grant table)

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V2:
   - new patch
---
 arch/arm/xen/enlighten.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 7f1c106b..dea46ec 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -59,6 +59,9 @@ unsigned long xen_released_pages;
 struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
 
 static __read_mostly unsigned int xen_events_irq;
+static phys_addr_t xen_grant_frames;
+
+#define GRANT_TABLE_INDEX   0
 
 uint32_t xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
@@ -303,6 +306,7 @@ static void __init xen_acpi_guest_init(void)
 static void __init xen_dt_guest_init(void)
 {
 	struct device_node *xen_node;
+	struct resource res;
 
 	xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
 	if (!xen_node) {
@@ -310,6 +314,12 @@ static void __init xen_dt_guest_init(void)
 		return;
 	}
 
+	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
+		pr_err("Xen grant table region is not found\n");
+		return;
+	}
+	xen_grant_frames = res.start;
+
 	xen_events_irq = irq_of_parse_and_map(xen_node, 0);
 }
 
@@ -317,16 +327,20 @@ static int __init xen_guest_init(void)
 {
 	struct xen_add_to_physmap xatp;
 	struct shared_info *shared_info_page = NULL;
-	int cpu;
+	int rc, cpu;
 
 	if (!xen_domain())
 		return 0;
 
 	if (!acpi_disabled)
 		xen_acpi_guest_init();
-	else
+	else {
 		xen_dt_guest_init();
 
+		if (!xen_grant_frames)
+			return -ENODEV;
+	}
+
 	if (!xen_events_irq) {
 		pr_err("Xen event channel interrupt not found\n");
 		return -ENODEV;
@@ -370,12 +384,16 @@ static int __init xen_guest_init(void)
 	for_each_possible_cpu(cpu)
 		per_cpu(xen_vcpu_id, cpu) = cpu;
 
-	xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
-	if (xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
-					  &xen_auto_xlat_grant_frames.vaddr,
-					  xen_auto_xlat_grant_frames.count)) {
+	if (!acpi_disabled) {
+		xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
+		rc = xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
+										   &xen_auto_xlat_grant_frames.vaddr,
+										   xen_auto_xlat_grant_frames.count);
+	} else
+		rc = gnttab_setup_auto_xlat_frames(xen_grant_frames);
+	if (rc) {
 		free_percpu(xen_vcpu_info);
-		return -ENOMEM;
+		return rc;
 	}
 	gnttab_init();
 
-- 
2.7.4


