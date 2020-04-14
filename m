Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C41A792F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJUK-0001dU-LO; Tue, 14 Apr 2020 11:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kDu3=56=amazon.com=prvs=3660aa63e=havanur@srs-us1.protection.inumbo.net>)
 id 1jOJUJ-0001dP-QY
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:12:19 +0000
X-Inumbo-ID: cdd9b75a-7e40-11ea-83d8-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdd9b75a-7e40-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586862739; x=1618398739;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RJH5Ny7ZuTyqXe89uGmJwGKLv6YkS5CWRBDIFP1xT20=;
 b=Wd8Bd3ouqkPjRzDljSxTREyebWeLWrI+xAAW8LdnOdsm+/125f/GAIHT
 DjT+WzxSbnTp2sgGXZ2/JYu6MkfzL/6pKeRSD2zTwVIn2taObAKP6kkrF
 xmWZNjU6yycukYZkdi8ItQedo0A0OKmY0WvtGZFZj4aU+8cvHEEOORZ2D k=;
IronPort-SDR: CNM23QsO6ZaZY44pACSBoTzQ8rpHOu/VJfs1fAgH6YNDGuqbWnxVNGVtGT4jWKmIp0Eb80gtvd
 wube4KlSqoPA==
X-IronPort-AV: E=Sophos;i="5.72,382,1580774400"; d="scan'208";a="38344909"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Apr 2020 11:12:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4C32EA2101; Tue, 14 Apr 2020 11:12:13 +0000 (UTC)
Received: from EX13D36EUC001.ant.amazon.com (10.43.164.105) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 11:12:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D36EUC001.ant.amazon.com (10.43.164.105) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 11:12:12 +0000
Received: from dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com
 (172.19.122.179) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 14 Apr 2020 11:12:11 +0000
Received: by dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com (Postfix,
 from userid 11119479)
 id 4917E83AC8; Tue, 14 Apr 2020 11:12:11 +0000 (UTC)
From: Harsha Shamsundara Havanur <havanur@amazon.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 14 Apr 2020 11:12:01 +0000
Message-ID: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
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
memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
during PCI setup phase. This resulted in incorrect memory mapping as
soon as the lower half of the 64 bit bar is programmed.
This displaced any RAM mappings under 4G. After the
upper half is programmed PCI memory mapping is restored to its
intended high mem location, but the RAM displaced is not restored.
The OS then continues to boot and function until it tries to access
the displaced RAM at which point it suffers a page fault and crashes.

This patch address the issue by deferring enablement of memory and
I/O decode in command register until all the resources, like interrupts
I/O and/or MMIO BARs for all the PCI device functions are programmed,
in the descending order of memory requested.

Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
Reviewed-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/firmware/hvmloader/pci.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 0b708bf578..b8a0df3286 100644
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
+
     s = xenstore_read(HVM_XS_ALLOW_MEMORY_RELOCATE, NULL);
     if ( s )
         allow_memory_relocate = strtoll(s, NULL, 0);
@@ -288,10 +292,21 @@ void pci_setup(void)
             printf("pci dev %02x:%x INT%c->IRQ%u\n",
                    devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
         }
-
         /* Enable bus mastering. */
         cmd = pci_readw(devfn, PCI_COMMAND);
         cmd |= PCI_COMMAND_MASTER;
+
+        /*
+         * Disable memory and I/O decode,
+         * It is recommended that BAR programming be done whilst
+         * decode bits are cleared to avoid incorrect mappings being created,
+         * when 64-bit memory BAR is programmed first by writing the lower half
+         * and then the upper half, which first maps to an address under 4G
+         * replacing any RAM mapped in that address, which is not restored
+         * back after the upper half is written and PCI memory is correctly
+         * mapped to its intended high mem address.
+         */
+        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
         pci_writew(devfn, PCI_COMMAND, cmd);
     }
 
@@ -497,16 +512,12 @@ void pci_setup(void)
                PRIllx_arg(bar_sz),
                bar_data_upper, bar_data);
 			
-
-        /* Now enable the memory or I/O mapping. */
-        cmd = pci_readw(devfn, PCI_COMMAND);
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
@@ -526,10 +537,16 @@ void pci_setup(void)
          * has IO enabled, even if there is no I/O BAR on that
          * particular device.
          */
-        cmd = pci_readw(vga_devfn, PCI_COMMAND);
-        cmd |= PCI_COMMAND_IO;
-        pci_writew(vga_devfn, PCI_COMMAND, cmd);
+        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
     }
+
+    /* Enable memory and I/O decode. */
+    for ( devfn = 0; devfn < 256; devfn++ )
+        if ( pci_devfn_decode_type[devfn] ) {
+            cmd = pci_readw(devfn, PCI_COMMAND);
+            cmd |= pci_devfn_decode_type[devfn];
+            pci_writew(devfn, PCI_COMMAND, cmd);
+        }
 }
 
 /*
-- 
2.16.6


