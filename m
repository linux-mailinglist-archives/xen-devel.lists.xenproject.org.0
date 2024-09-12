Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300F975E72
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 03:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796964.1206718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYWg-0007uv-HK; Thu, 12 Sep 2024 01:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796964.1206718; Thu, 12 Sep 2024 01:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYWg-0007sf-Dq; Thu, 12 Sep 2024 01:21:38 +0000
Received: by outflank-mailman (input) for mailman id 796964;
 Thu, 12 Sep 2024 01:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soYWf-0007sZ-9N
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 01:21:37 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f02819-70a5-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 03:21:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33DB4A41694;
 Thu, 12 Sep 2024 01:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF04C4CEC0;
 Thu, 12 Sep 2024 01:21:33 +0000 (UTC)
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
X-Inumbo-ID: 59f02819-70a5-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726104094;
	bh=esQ0Ma+7mrdG47i3xpwx1ZVSmO3p1LWObgosh1TkcIQ=;
	h=Date:From:To:cc:Subject:From;
	b=X3yfu+7zJPqOLwq7r+YuwM8sNWSgobUTUoI/TmQrAXqsyZqZQkbpA4M0prlneVbKZ
	 wzc0sHZShC/Y9irOfEWJKtB0ccEgTmWo2YRNCpN/Tblhr8T2uqeUCPv/afAjQB1Y9S
	 Zs/9h8cwLVaOW6n6lMIviQVQAomenjJUBdPVOMALTHh9QFv0unrUmxStTF1LEsygqU
	 2ZmxV5Jh3dqkyaxmY+9IhEb1jSge6n6mVVeXLs04qidfUO/LBDYBje4Gg/7pbbNw/S
	 7sAskgGXtR+m0yFH6gWpnC38CSwLsWsF8bgxPqR+MplbrJlVyQKlZ5GFM4RpsaITz5
	 8K2ohgRcN+wyw==
Date: Wed, 11 Sep 2024 18:21:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, roger.pau@citrix.com, dpsmith@apertussolutions.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Message-ID: <alpine.DEB.2.22.394.2409111819440.611587@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-711094187-1726104082=:611587"
Content-ID: <alpine.DEB.2.22.394.2409111821270.611587@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-711094187-1726104082=:611587
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409111821271.611587@ubuntu-linux-20-04-desktop>

Xen always generates as XSDT table even if the firmware only provided an
RSDT table.  Copy the RSDT header from the firmware table, adjusting the
signature, for the XSDT table when not provided by the firmware.

This is necessary to run Xen on QEMU.

Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes in v4:
- improve commit message
- improve in-code comment
- add Roger's reviewed-by
---
 xen/arch/x86/hvm/dom0_build.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index f3eddb6846..3dd913bdb0 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1078,7 +1078,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
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
@@ -1090,6 +1099,12 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     xsdt->header = *table;
     acpi_os_unmap_memory(table, sizeof(*table));
 
+    /*
+     * In case the header is an RSDT copy, unconditionally ensure it has
+     * an XSDT sig.
+     */
+    xsdt->header.signature[0] = 'X';
+
     /* Add the custom MADT. */
     xsdt->table_offset_entry[0] = madt_addr;
 
-- 
2.25.1
--8323329-711094187-1726104082=:611587--

