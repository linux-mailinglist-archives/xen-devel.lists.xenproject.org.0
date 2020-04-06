Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76919FBFF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:47:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVpx-0002Tz-KV; Mon, 06 Apr 2020 17:47:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgVF=5W=amazon.com=prvs=358faf7b1=havanur@srs-us1.protection.inumbo.net>)
 id 1jLVpw-0002Ts-0z
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:47:04 +0000
X-Inumbo-ID: 9f9b5afa-782e-11ea-9e09-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f9b5afa-782e-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586195224; x=1617731224;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=yt7gmqo213JWZVFnM8byFy2ysrSg+zGPA3A8NyH1JJ4=;
 b=gJRhG1RN2VoNFelKhK0Psaa70xp8zvxo8d52ujb8LjLhUSbQO2foOmPQ
 kI+hcWc/0VyIwFtFAZLsprt4GWmnkZfwnqaFpKDiOnMSgPk1s+pIEt7xV
 gaXbDIXnPehqdjjhPh+vGs28HFopfNmI4VlfRCb6GoYwStJQgIdtZvfPJ Q=;
IronPort-SDR: wXaBkS8KeQutAy+Z1aUTCeUfMxYLWhgmOLeT3NaO3yt3fIw9ol26w6vw6ES9ZUUq8MKnEzf+0G
 HJTFgFGT5MDA==
X-IronPort-AV: E=Sophos;i="5.72,351,1580774400"; d="scan'208";a="24338296"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 06 Apr 2020 17:46:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4C188A20B4; Mon,  6 Apr 2020 17:46:44 +0000 (UTC)
Received: from EX13D36EUC002.ant.amazon.com (10.43.164.99) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 6 Apr 2020 17:46:44 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D36EUC002.ant.amazon.com (10.43.164.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 6 Apr 2020 17:46:43 +0000
Received: from dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com
 (172.19.122.179) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Mon, 6 Apr 2020 17:46:42 +0000
Received: by dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com (Postfix,
 from userid 11119479)
 id 8556B83D91; Mon,  6 Apr 2020 17:46:42 +0000 (UTC)
From: Harsha Shamsundara Havanur <havanur@amazon.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Mon, 6 Apr 2020 17:46:36 +0000
Message-ID: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
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
spurious and premature bus transactions as soon as the lower bar of
the 64 bit bar is programmed. It is highly recommended that BARs be
programmed whilst decode bits are cleared to avoid spurious bus
transactions.

This patch address the issue by deferring enablement of memory and
I/O decode in command register until all the resources, like interrupts
I/O and/or MMIO BARs for all the PCI device functions are programmed.
PCI bus memory and I/O space is enabled in command register after
all the resources like interrupts, I/O and/or MMIO BARs are
programmed for all valid device functions. PCI BUS MASTER is kept
disabled in the bootloader as this needs to be enabled by the guest
OS driver once it initializes and takes control of the device.

Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
Ack-by: Paul Durrant <pdurrant@amazon.com>
---
 tools/firmware/hvmloader/pci.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 0b708bf578..0f31866453 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -84,6 +84,7 @@ void pci_setup(void)
     uint32_t vga_devfn = 256;
     uint16_t class, vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
+    uint8_t pci_devfn_decode_type[256] = {};
 
     /* Resources assignable to PCI devices via BARs. */
     struct resource {
@@ -289,9 +290,14 @@ void pci_setup(void)
                    devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
         }
 
-        /* Enable bus mastering. */
+        /*
+         * Disable bus mastering, memory and I/O space, which is typical device
+         * reset state. It is recommended that BAR programming be done whilst
+         * decode bits are cleared to avoid spurious DMAs and bus transactions.
+         * Bus master should be enabled by guest driver when it deems fit.
+         */
         cmd = pci_readw(devfn, PCI_COMMAND);
-        cmd |= PCI_COMMAND_MASTER;
+        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
         pci_writew(devfn, PCI_COMMAND, cmd);
     }
 
@@ -503,10 +509,9 @@ void pci_setup(void)
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
@@ -530,6 +535,15 @@ void pci_setup(void)
         cmd |= PCI_COMMAND_IO;
         pci_writew(vga_devfn, PCI_COMMAND, cmd);
     }
+
+    /* Enable memory and I/O space. */
+    for ( devfn = 0; devfn < 256; devfn++ )
+        if ( pci_devfn_decode_type[devfn] )
+        {
+            cmd = pci_readw(devfn, PCI_COMMAND);
+            cmd |= pci_devfn_decode_type[devfn];
+            pci_writew(devfn, PCI_COMMAND, cmd);
+        }
 }
 
 /*
-- 
2.16.6


