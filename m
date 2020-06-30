Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DF20FA2C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 19:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqJlS-00071F-3U; Tue, 30 Jun 2020 17:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJnf=AL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jqJlQ-000718-9N
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 17:09:44 +0000
X-Inumbo-ID: 7d1c26d6-baf4-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d1c26d6-baf4-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 17:09:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uVxal5l+6qY90nygpfB30oTzqbO5tiCQpFNAcwlNWp/lC1QdaD/x4TOO5b12IEipt9G9ObkKuh
 6O0lHAK3GNf4PdcQQTqP+MO7a+z4W3rjv0ApHbppJwntDKo4EGx/Rtns3wpC9WyJFHompHytjM
 qfi2ZxOIqBhyqUqTqmvSpYfgjbYckqdDPiGJ3+DvbbwUgMHXv2puRS1q/78UAKshPBbi/IceH6
 sNNm02BAsrAKU9LEx6ZwQRl3Z2NacZjfpx6r9fp591da3wPqSsCX2AdVgSstTlG7sWXYE/7P8P
 IUI=
X-SBRS: 2.7
X-MesageID: 21309442
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,298,1589256000"; d="scan'208";a="21309442"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] hvmloader: Fix reading ACPI PM1 CNT value
Date: Tue, 30 Jun 2020 18:09:13 +0100
Message-ID: <20200630170913.123646-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to get the CNT value from QEMU, we were supposed to read a
word, according to the implementation in QEMU. But it has been lax and
allowed to read a single byte. This has changed with commit
5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in
memory_region_access_valid"") and result in hvmloader crashing on
the BUG_ON.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---

I'll try to have the QEMU implementation changes to allow reading a
byte, but it would probably by nice to not have to change qemu.
---
 tools/firmware/hvmloader/hvmloader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 598a22627872..bdcbe4a26664 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -256,7 +256,7 @@ static const struct bios_config *detect_bios(void)
 
 static void acpi_enable_sci(void)
 {
-    uint8_t pm1a_cnt_val;
+    uint16_t pm1a_cnt_val;
 
 #define PIIX4_SMI_CMD_IOPORT 0xb2
 #define PIIX4_ACPI_ENABLE    0xf1
@@ -265,11 +265,11 @@ static void acpi_enable_sci(void)
      * PIIX4 emulation in QEMU has SCI_EN=0 by default. We have no legacy
      * SMM implementation, so give ACPI control to the OSPM immediately.
      */
-    pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
+    pm1a_cnt_val = inw(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     if ( !(pm1a_cnt_val & ACPI_PM1C_SCI_EN) )
         outb(PIIX4_SMI_CMD_IOPORT, PIIX4_ACPI_ENABLE);
 
-    pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
+    pm1a_cnt_val = inw(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     BUG_ON(!(pm1a_cnt_val & ACPI_PM1C_SCI_EN));
 }
 
-- 
Anthony PERARD


