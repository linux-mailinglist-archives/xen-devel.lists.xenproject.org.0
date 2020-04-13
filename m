Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9761A6EFE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 00:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jO6it-000418-2V; Mon, 13 Apr 2020 21:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FM5Z=55=amazon.com=prvs=365775788=havanur@srs-us1.protection.inumbo.net>)
 id 1jO6ir-000413-CF
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 21:34:29 +0000
X-Inumbo-ID: 8deb51a2-7dce-11ea-83d8-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8deb51a2-7dce-11ea-83d8-bc764e2007e4;
 Mon, 13 Apr 2020 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586813669; x=1618349669;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BzyFTp5WLQkEdTo4lXN7rHGYWuK7IsljElBsa+AyKLw=;
 b=XO6LwSzFkYm+oFmlvaeidbvrzfFw1E3kuqu5YkNtaCCMQB7+c86mnKkI
 7H8KqFuipYLbxA14LSsf09ScsCptoxfmbtCcE1dc75rxPTMidy7jQtiqR
 WECNVDPrJ8lA02dmynQ+5rZBx7jQZJXG4eKNyuGQFVN8wu4JJ1C0nTyl4 k=;
IronPort-SDR: LridPP+I3tG8SzS+cneoKwiKuNf4DSkdo1px7IJMhWX3RIfVHjgoUlpvtuq07ROuLOy1yNLGGQ
 YIuvGoc0qDDQ==
X-IronPort-AV: E=Sophos;i="5.72,380,1580774400"; d="scan'208";a="25305926"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 13 Apr 2020 21:34:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id BCB2AA2000; Mon, 13 Apr 2020 21:34:14 +0000 (UTC)
Received: from EX13D36EUC003.ant.amazon.com (10.43.164.158) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 13 Apr 2020 21:34:14 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D36EUC003.ant.amazon.com (10.43.164.158) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 13 Apr 2020 21:34:12 +0000
Received: from dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com
 (172.19.122.179) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Mon, 13 Apr 2020 21:34:12 +0000
Received: by dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com (Postfix,
 from userid 11119479)
 id E6D91839A5; Mon, 13 Apr 2020 21:34:11 +0000 (UTC)
From: Harsha Shamsundara Havanur <havanur@amazon.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Mon, 13 Apr 2020 21:33:42 +0000
Message-ID: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Harsha Shamsundara Havanur <havanur@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It was observed that PCI MMIO and/or IO BARs were programmed with
BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
register) enabled, during PCI setup phase. This resulted in
incorrect memory mapping as soon as the lower half of the 64 bit bar
is programmed, which displaced any RAM mappings under 4G. After the
upper half is programmed PCI memory mapping is restored to its
intended mapping but the RAM displaced is not restored. The OS then
continues to boot and function until it tries to access the displaced
RAM at which point it suffers a page fault and crashes.

This patch address the issue by deferring enablement of memory and
I/O decode in command register until all the resources, like interrupts
I/O and/or MMIO BARs for all the PCI device functions are programmed.

Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
Reviewed-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/firmware/hvmloader/pci.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 0b708bf578..f74471b255 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -84,6 +84,7 @@ void pci_setup(void)
     uint32_t vga_devfn = 256;
     uint16_t class, vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
+    uint8_t pci_devfn_decode_type[256] = {};
 
     /* Resources assignable to PCI devices via BARs. */
     struct resource {
@@ -120,6 +121,9 @@ void pci_setup(void)
      */
     bool allow_memory_relocate = 1;
 
+    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY != PCI_COMMAND_MEMORY);
+    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO != PCI_COMMAND_IO);
+    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO != PCI_COMMAND_MASTER);
     s = xenstore_read(HVM_XS_ALLOW_MEMORY_RELOCATE, NULL);
     if ( s )
         allow_memory_relocate = strtoll(s, NULL, 0);
@@ -289,9 +293,22 @@ void pci_setup(void)
                    devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
         }
 
-        /* Enable bus mastering. */
+        /*
+         * Disable bus mastering, memory and I/O space, which is typical device
+         * reset state. It is recommended that BAR programming be done whilst
+         * decode bits are cleared to avoid incorrect mappings being created,
+         * when 64-bit memory BAR is programmed first by writing the lower half
+         * and then the upper half, which first maps to an address under 4G
+         * replacing any RAM mapped in that address, which is not restored
+         * back after the upper half is written and PCI memory is correctly
+         * mapped to its intended high mem address.
+         *
+         * Capture the state of bus master to restore it back once BAR
+         * programming is completed.
+         */
         cmd = pci_readw(devfn, PCI_COMMAND);
-        cmd |= PCI_COMMAND_MASTER;
+        pci_devfn_decode_type[devfn] = cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
+        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
         pci_writew(devfn, PCI_COMMAND, cmd);
     }
 
@@ -503,10 +520,9 @@ void pci_setup(void)
         if ( (bar_reg == PCI_ROM_ADDRESS) ||
              ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
               PCI_BASE_ADDRESS_SPACE_MEMORY) )
-            cmd |= PCI_COMMAND_MEMORY;
+            pci_devfn_decode_type[devfn] |= PCI_COMMAND_MEMORY;
         else
-            cmd |= PCI_COMMAND_IO;
-        pci_writew(devfn, PCI_COMMAND, cmd);
+            pci_devfn_decode_type[devfn] |= PCI_COMMAND_IO;
     }
 
     if ( pci_hi_mem_start )
@@ -526,10 +542,13 @@ void pci_setup(void)
          * has IO enabled, even if there is no I/O BAR on that
          * particular device.
          */
-        cmd = pci_readw(vga_devfn, PCI_COMMAND);
-        cmd |= PCI_COMMAND_IO;
-        pci_writew(vga_devfn, PCI_COMMAND, cmd);
+        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
     }
+
+    /* Enable memory and I/O space. Restore saved BUS MASTER state */
+    for ( devfn = 0; devfn < 256; devfn++ )
+        if ( pci_devfn_decode_type[devfn] )
+            pci_writew(devfn, PCI_COMMAND, pci_devfn_decode_type[devfn]);
 }
 
 /*
-- 
2.16.6


