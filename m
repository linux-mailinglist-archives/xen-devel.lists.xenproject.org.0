Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BE7AC8AA4
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 11:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000624.1380849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvxY-0003Qt-Dk; Fri, 30 May 2025 09:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000624.1380849; Fri, 30 May 2025 09:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvxY-0003Og-A9; Fri, 30 May 2025 09:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1000624;
 Fri, 30 May 2025 09:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJNC=YO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uKvxW-0003Oa-34
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 09:23:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd1a597-3d37-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 11:23:25 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so11948315e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 02:23:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe6cd15sm4345971f8f.39.2025.05.30.02.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 02:23:23 -0700 (PDT)
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
X-Inumbo-ID: bcd1a597-3d37-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748597004; x=1749201804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEyEGMyU1pvXuoFS2NLAkTcr5cnDP17ya1O8uwS+6BM=;
        b=ThIhUO4SPwosRtQt7XizkK4FyTjjz/AtEUQgZLJx6Gr0bKEEsdJTn0CRBDa10kEWQ9
         6BnnI78kqBIB46NLkDKog89Fba7JI99OA/VEMmqtmS5sn9xB6SRijN98ztAyixF3jXSc
         33SS/p49CQP8KGN8fgKCv1rDYPTs9sNgztSm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597004; x=1749201804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEyEGMyU1pvXuoFS2NLAkTcr5cnDP17ya1O8uwS+6BM=;
        b=xErd3IZREKP+D1RfEhWeK7QKNK+0pap/JpEXLu7woY3C7rL6yTeayUe9aTgcubL9Du
         nUsXstEW555ZGiqOtV+luwuRRls00p91twmBLPViTIzQv00e3rg9n4SOucgeP1xNa5rR
         4gn92JlCreXm0N6g0aw4lzrfc7EeMjNyod+eascbhIY86M1zzJQ+MrFW8RXqZXTHZyhf
         LJqdvRdn5p5xp/UxZCKNfDP97dKleYPTZ6U6cIBj4FHYAGagBPWOFSVYMX5xL1YpiMIb
         vxlV5Y63qzCng0tkWKHFgv0lpv1Y8RBn15FFaxHcGoI5iPT+8NZxX/R5B9Nd+Lg3WmM3
         uGaA==
X-Gm-Message-State: AOJu0Yxqka6iOuDX3y7R5DZdBMSMGaLiPMrHmDBUl8Nop+Fg2U+hFKdn
	FL6B+0h5oCIGNs7qhiHIXX3jv2slH4GT/vkZ1B0Ff+hxs4swM9cQXvGIE+FxUjgALC7sggNuoPd
	Ie2Mv
X-Gm-Gg: ASbGncuDJjHY0p7LP2YFlaYB9TForeNOBVyowat3o5Xxq69VUBnL1rUmud5lpijxi6G
	j4XgmAS5u7ayONBulHi1CjHhhLxbLWCVDXVDypqH2T61+ohuIHc1d70LNH/xH4D3oxJd+tZYyK9
	Gb7E9WjzLGqkH5FkbUs9vFGcRj+NRDxm6XUhfQlmAOTsMai+OA9q9kCuIVSSgCGuSbWkrhMQin0
	sHRcWtW52Q5pHYpdVMak56G7sgz+dkRD8kMNmY34IE/pGoA/2ZZSCDQyV+6s+jLIaygdUPu5rZm
	nR8SGqmyiZNHXiUNdt1hZHDOG+D4b9yoPT3q1zLH9WLlEybXwTG9yK79+zFMNhQARO+PSwxxZ4W
	DuWCx2ojji9ktH2fvVXLboFzeCiyYGe533lk8G22qzCCB2A==
X-Google-Smtp-Source: AGHT+IHsEBqNWRBAtMOi32FFf9P3D4/B+kWwKCwn6A0IAy6z9oHMOK8QPwctqWnBVpkTglXHIaRl4A==
X-Received: by 2002:a05:600c:871b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-450d65306dfmr23751465e9.14.1748597004041;
        Fri, 30 May 2025 02:23:24 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: [PATCH] x86/hvmloader: don't set xenpci MMIO BAR as UC in MTRR
Date: Fri, 30 May 2025 11:23:14 +0200
Message-ID: <20250530092314.27306-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
have the functionality of a traditional PCI device.  The exposed MIO BAR is
used by some guests (including Linux) as a safe place to map foreign
memory, including the grant table itself.

Traditionally BARs from devices have the uncacheable (UC) cache attribute
from the MTRR, to ensure correct functionality of such devices.  hvmloader
mimics this behaviour and sets the MTRR attributes of both the low and high
PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.

This however causes performance issues for the users of the Xen PCI device
BAR, as for the purposes of mapping remote memory there's no need to use
the UC attribute.  On Intel systems this is worked around by using iPAT,
that allows the hypervisor to force the effective cache attribute of a p2m
entry regardless of the guest PAT value.  AMD however doesn't have an
equivalent of iPAT, and guest PAT values are always considered.

Linux commit:

41925b105e34 xen: replace xen_remap() with memremap()

Attempted to mitigate this by forcing mappings of the grant-table to use
the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
into account to calculate which PAT type to use, and seeing the MTRR cache
attribute for the region being UC the PAT also ends up as UC, regardless of
the caller having requested WB.

As a workaround to allow current Linux to map the grant-table as WB using
memremap() special case the Xen PCI device BAR in hvmloader and don't set
its cache attribute as UC.  Such workaround in hvmloader should also be
paired with a fix for Linux so it attempts to change the MTRR of the Xen
PCI device BAR to WB by itself.

Overall, the long term solution would be to provide the guest with a safe
range in the guest physical address space where mappings to foreign pages
can be created.

Some vif throughput performance figures provided by Anthoine from a 8
vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:

Without this patch:
vm -> dom0: 1.1Gb/s
vm -> vm:   5.0Gb/s

With the patch:
vm -> dom0: 4.5Gb/s
vm -> vm:   7.0Gb/s

Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I don't think the ACPI tables builder consume the PCI window size
information, I'm not seeing any consumer of the acpi_info->pci_{min,len}
fields, yet I've keep them covering the xenpci device BAR, hence the
adjustment to hvmloader_acpi_build_tables() part of this patch.
---
 tools/firmware/hvmloader/config.h |  2 +-
 tools/firmware/hvmloader/pci.c    | 40 +++++++++++++++++++++++++++++--
 tools/firmware/hvmloader/util.c   |  2 +-
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index 6e1da137d779..c159db30eea9 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -58,7 +58,7 @@ extern uint32_t *cpu_to_apicid;
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
 extern uint32_t pci_mem_start;
-extern const uint32_t pci_mem_end;
+extern uint32_t pci_mem_end;
 extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
 
 extern bool acpi_enabled;
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index c3c61ca060a6..7c339cb8b9f7 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -30,7 +30,7 @@
 #include <xen/hvm/e820.h>
 
 uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
-const uint32_t pci_mem_end = RESERVED_MEMBASE;
+uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 /*
@@ -281,6 +281,42 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
+                 vendor_id == 0x5853 &&
+                 (device_id == 0x0001 || device_id == 0x0002) )
+            {
+                if ( is_64bar )
+                {
+                     printf("xenpci dev %02x:%x unexpected MMIO 64bit BAR%u\n",
+                            devfn >> 3, devfn & 7, bar);
+                     continue;
+                }
+
+                if ( bar_sz > pci_mem_end ||
+                     ((pci_mem_end - bar_sz) & ~(bar_sz - 1)) < pci_mem_start )
+                {
+                     printf("xenpci dev %02x:%x BAR%u size %llx overflows low PCI hole\n",
+                            devfn >> 3, devfn & 7, bar, bar_sz);
+                     continue;
+                }
+
+                /* Put unconditionally at the end of the low PCI MMIO hole. */
+                pci_mem_end -= bar_sz;
+                pci_mem_end &= ~(bar_sz - 1);
+                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
+                bar_data |= pci_mem_end;
+                pci_writel(devfn, bar_reg, bar_data);
+                pci_devfn_decode_type[devfn] |= PCI_COMMAND_MEMORY;
+
+                /* Prefix BAR address with a 0 to match format used below. */
+                printf("pci dev %02x:%x bar %02x size "PRIllx": 0%08x\n",
+                       devfn >> 3, devfn & 7, bar_reg,
+                       PRIllx_arg(bar_sz), bar_data);
+
+                continue;
+            }
+
             for ( i = 0; i < nr_bars; i++ )
                 if ( bars[i].bar_sz < bar_sz )
                     break;
@@ -320,7 +356,7 @@ void pci_setup(void)
         }
 
         /* Enable bus master for this function later */
-        pci_devfn_decode_type[devfn] = PCI_COMMAND_MASTER;
+        pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
     }
 
     if ( mmio_hole_size )
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 2d07ce129013..fd107818da35 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -874,7 +874,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->table_flags |= ACPI_HAS_HPET;
 
     config->pci_start = pci_mem_start;
-    config->pci_len = pci_mem_end - pci_mem_start;
+    config->pci_len = RESERVED_MEMBASE - pci_mem_start;
     if ( pci_hi_mem_end > pci_hi_mem_start )
     {
         config->pci_hi_start = pci_hi_mem_start;
-- 
2.49.0


