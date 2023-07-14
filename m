Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CF753BA8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563637.880965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIjC-0003dg-Rn; Fri, 14 Jul 2023 13:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563637.880965; Fri, 14 Jul 2023 13:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIjC-0003bo-P6; Fri, 14 Jul 2023 13:20:58 +0000
Received: by outflank-mailman (input) for mailman id 563637;
 Fri, 14 Jul 2023 13:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKIjB-0003bi-Pn
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:20:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43029106-2249-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 15:20:56 +0200 (CEST)
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
X-Inumbo-ID: 43029106-2249-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689340856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4J+jV04Ao7kvosuULBR3hVbNd7EwavyjMazSdj6BgAo=;
  b=GD34DJyh6bP1XnAgx3Y1ivSdwdseFQt2Vn6JFOfafdTSfEBekpKIMiG5
   OnNui01rs8tgoWQBtDTvYkZNhnFG8iOzYO5jJHd0VNUPvjhO//l/mEZCe
   4Kmr5ZWwY5evDZmDxYKPS9GQDslY23XXfzm/545vf8PiQPkutD65rfPsQ
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114942402
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Grt0/q94QQiGhm7rz8UTDrUDqH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zEWXDqFPv+MNmf3ftp2bo2wp0gE6pbUm9Q1QVM9qSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklf2
 OcjFwwIRCmPpOyP/o6Qe+gvjJ48eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxxrJ+
 jiapz6R7hcyEp/c7DeFyVSQn6zujzjEU6NVLoKez6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/7SW5mv4vzeGn5TqQDcL2i7mXyGvtBwsMeZJeLeUBUjnAedoddjJHwLb5
 ChcxKBy/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5b9VylBUfs7kmfmLwv47VPN7nplrY80bcmrpylLLJLEPCLFIVv7GAbmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcFkwej3SKceVTih7IKQOqHYKuTZEkTZUQEVWtEEVB4OO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:gHZjPagXMUYfrgbDprMpcwtFJXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3ARAJsY2u9ulqnC707+f5vJTx/6Is0X2bm80vVCXa?=
 =?us-ascii?q?0KmhQdoG+eF7T8vl7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A71uz5g/CiiuJN+JqmElteJqQf+EroIGjCHsrrYx?=
 =?us-ascii?q?FmtufCidRfA2iqg3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="114942402"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] xen/ACPI: Remove acpi_get_pxm() entirely
Date: Fri, 14 Jul 2023 14:20:24 +0100
Message-ID: <20230714132024.3091309-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There are no callers, and the non-stub implementation is #if 0'd out, with the
internal trying to perform an AML invocation.

There's no plausible way that code is getting un-#if 0'd, so drop it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/drivers/acpi/numa.c | 21 ---------------------
 xen/include/xen/acpi.h  |  9 ---------
 2 files changed, 30 deletions(-)

diff --git a/xen/drivers/acpi/numa.c b/xen/drivers/acpi/numa.c
index bc6e888234e4..77945f874454 100644
--- a/xen/drivers/acpi/numa.c
+++ b/xen/drivers/acpi/numa.c
@@ -212,24 +212,3 @@ int __init acpi_numa_init(void)
 	acpi_numa_arch_fixup();
 	return 0;
 }
-
-#if 0
-int acpi_get_pxm(acpi_handle h)
-{
-	unsigned long pxm;
-	acpi_status status;
-	acpi_handle handle;
-	acpi_handle phandle = h;
-
-	do {
-		handle = phandle;
-		status = acpi_evaluate_integer(handle, "_PXM", NULL, &pxm);
-		if (ACPI_SUCCESS(status))
-			return (int)pxm;
-		status = acpi_get_parent(handle, &phandle);
-	} while (ACPI_SUCCESS(status));
-	return -1;
-}
-
-EXPORT_SYMBOL(acpi_get_pxm);
-#endif
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 8ec95791726e..6a2f5983fdd3 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -195,15 +195,6 @@ int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32));
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 
-#ifdef CONFIG_ACPI_NUMA
-int acpi_get_pxm(acpi_handle handle);
-#else
-static inline int acpi_get_pxm(acpi_handle handle)
-{
-	return 0;
-}
-#endif
-
 void acpi_reboot(void);
 
 #ifdef CONFIG_INTEL_IOMMU
-- 
2.30.2


