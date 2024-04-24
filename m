Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA28B136A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 21:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711637.1111756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzi8q-00069v-RH; Wed, 24 Apr 2024 19:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711637.1111756; Wed, 24 Apr 2024 19:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzi8q-000670-O6; Wed, 24 Apr 2024 19:18:52 +0000
Received: by outflank-mailman (input) for mailman id 711637;
 Wed, 24 Apr 2024 19:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzi8o-00066u-Io
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 19:18:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c5c62b-026f-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 21:18:47 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713986316503101.01606128243566;
 Wed, 24 Apr 2024 12:18:36 -0700 (PDT)
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
X-Inumbo-ID: 78c5c62b-026f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713986320; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k00y0KNmamhlstad9CkgCB3LCtmgQYbp1rjXav2lqV3elVkfQmdo+QbDXHqIxci5bbzVqkT+KDgpMzZuiEooCPJTu5f29yuoDmuogEnVunmpxnWEzLkRJ46irRNPQKhyreEM3lpAkL00jOvMYCtOpG2P1IdT9C5OXfPPLfLQeVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713986320; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zsHXuWCfw2B6RyFVe1ZZYclnQ2RG44VTa61HMRC0aJQ=; 
	b=MwZukq4pkk/UFH/iew9lVwwXxCu/KguGFjxdpcnDgvvRA/aReUXLBZwBNdeRc1yTndtPpIX3/H40wvyCoQsvQdDJct8DnHRKsxGIjibrsFeQhx9mk+UX7iSLYq5cwqZKds+ECGe04QiW019sVqi3cUMryZNCNB6jabUG+KdUyKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713986320;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=zsHXuWCfw2B6RyFVe1ZZYclnQ2RG44VTa61HMRC0aJQ=;
	b=ot5w+NPKTLNSOUoevnJtUB4yteLFzHI2tms8OpqChx5wyS5CFk3W04loPstw2sal
	Gg4oLYH3cnN33wY05RPD7GUcHDGiZOAxxzaZawS84UeVbNBLMh5l6xtnqGNF5/BAdEL
	W35naNVJxfZATsSGfGC5Uxv3CHNC6WT2hOdwGTt8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Date: Wed, 24 Apr 2024 15:18:26 -0400
Message-Id: <20240424191826.23656-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Stefano Stabellini <stefano.stabellini@amd.com>

Xen always generates as XSDT table even if the firmware provided an RSDT table.
Copy the RSDT header from the firmware table, adjusting the signature, for the
XSDT table when not provided by the firmware.

Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---

This patch is used for development and testing of hyperlaunch using the QEMU
emulator. After dicussiong with Stefano, he was okay with me addressing Jan's
comment regarding the table signature and reposting for acceptance.

Changes in v3:
- ensure the constructed XSDT table always has the correct signature

---
 xen/arch/x86/hvm/dom0_build.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ac71d43a6b3f..781aac00fe72 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1077,7 +1077,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
         rc = -EINVAL;
         goto out;
     }
-    xsdt_paddr = rsdp->xsdt_physical_address;
+    /*
+     * Note the header is the same for both RSDT and XSDT, so it's fine to
+     * copy the native RSDT header to the Xen crafted XSDT if no native
+     * XSDT is available.
+     */
+    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
+        xsdt_paddr = rsdp->xsdt_physical_address;
+    else
+        xsdt_paddr = rsdp->rsdt_physical_address;
+
     acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
     table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
     if ( !table )
@@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     xsdt->header = *table;
     acpi_os_unmap_memory(table, sizeof(*table));
 
+    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
+    xsdt->header.signature[0] = 'X';
+
     /* Add the custom MADT. */
     xsdt->table_offset_entry[0] = madt_addr;
 
-- 
2.30.2


