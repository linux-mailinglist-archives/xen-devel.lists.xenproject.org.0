Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C259DACC534
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 13:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004240.1383907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPez-0001Yf-7T; Tue, 03 Jun 2025 11:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004240.1383907; Tue, 03 Jun 2025 11:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPez-0001WO-2b; Tue, 03 Jun 2025 11:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1004240;
 Tue, 03 Jun 2025 11:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7Ic=YS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMPex-0001WI-4A
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 11:18:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f39818b-406c-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 13:18:11 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso37203825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 04:18:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d80136ffsm166387755e9.40.2025.06.03.04.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 04:18:10 -0700 (PDT)
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
X-Inumbo-ID: 6f39818b-406c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748949491; x=1749554291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWq37xjSwePxYoSA81gemrxTTNQmdt2lE+wYljjUo3o=;
        b=WVR86XAhlhOo1huE2W4OLQvdO+4vTXhxXVHktOlgRfbhxdH4Fu6wZWHdhq1Xa2X7UJ
         U/qnMXhe+MkqpN9XbV/JyleZK/TRwsfhwGWztt+WJvFN+FpaYys3+3MwJG7DUDA31nJk
         BtFByYki/A4KVWSsI1d1ykP/nBCkFLNTH9KAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748949491; x=1749554291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWq37xjSwePxYoSA81gemrxTTNQmdt2lE+wYljjUo3o=;
        b=vdyITA6YpMBWmT0ZKyP6OPgX7KKC0ANpdUaCqnoxU245Osojy/KXUt9gqRVllCgVU4
         NZ00DRksEJJGIgZ1aWrfW9zaI8UH8z7liR5LmyoBxvqQkuYAA/AN53nYXe6WnJ+qZAdI
         QZ+1SeWSC4sXlP3nBq0lhWPiy0FCyYb1F5aBzWeCWBzlU4pJ4vnnDymU5s5CfoSxGh6N
         h4CPfVfvfDwRah2m8VWwFfXnIgyH10u03yygB+r9vpb/geYmyfitbv4QBdTjOmqve1yX
         1WJ6CzFltvYG5vYScVUPU09kWIa9y+EBgA/yB64tbY2FbmA3OlXFyevTl1U4Lq9UALxq
         54mA==
X-Gm-Message-State: AOJu0YyYC22IrOHOrB35YFdvgpORQofuVRVTVtipA2mtWH98sI/8mzsf
	ZpuuTHsdrgG/wltqs/Lbxs/ndnyMOBEgokAnbAAgcnhOIhiahNZYYNRMQGpgKOgsCRRji+6LaS2
	zx9v0
X-Gm-Gg: ASbGnctwShDxgp3NEfRWtLKEDpqIYUdaI9fJrh7zLhH1783soKnjBeLvuC5YaKv/tj1
	UlsT6IoW/NlUkA7vc3eSe7SprKM7Dl0kTWKMgLFGO9sT6CM762r03HBFud5NNNYUJUmWCnqQLGX
	RkqWpDY+WPXhgx+10xpPGEdnCd3jF/0qHv72cuN3hLCpih4c2kV8ZdvsN59lwBnh3ZO/7bT6P7Z
	Qve9RG7zybsz7XPWYBxj8GnhYO46fFw/Zyml+1CrUJL0tl9dX5xo3XoFsZwmjUcX1IBYy2OMHF+
	zw/vkkc0Oh6aLooE8VabqeBd/eMg+ouA945dsXZhor5T/mK7MOB9rbywyJHBkYuDzP2Y506uWRS
	nborbSGzWoaKEWXiloMD3KH0m
X-Google-Smtp-Source: AGHT+IEXRvJ6Quw6aNHy9QRBSN/QpwsOr6syul//b1qFPBB1qNnBdZzidAE4nUnbfBW/PK+v0Sah7A==
X-Received: by 2002:a05:600c:3593:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-450d887f958mr162799765e9.31.1748949490641;
        Tue, 03 Jun 2025 04:18:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: [PATCH v2] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR cache attribute
Date: Tue,  3 Jun 2025 13:18:06 +0200
Message-ID: <20250603111806.86555-1-roger.pau@citrix.com>
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
mimics this behavior and sets the MTRR attributes of both the low and high
PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.

This however causes performance issues for users of the Xen PCI device BAR,
as for the purposes of mapping remote memory there's no need to use the UC
attribute.  On Intel systems this is worked around by using iPAT, that
allows the hypervisor to force the effective cache attribute of a p2m entry
regardless of the guest PAT value.  AMD however doesn't have an equivalent
of iPAT, and guest PAT values are always considered.

Linux commit:

41925b105e34 xen: replace xen_remap() with memremap()

Attempted to mitigate this by forcing mappings of the grant-table to use
the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
into account to calculate which PAT type to use, and seeing the MTRR cache
attribute for the region being UC the PAT also ends up as UC, regardless of
the caller having requested WB.

As a workaround to allow current Linux to map the grant-table as WB using
memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
select whether the Xen PCI device BAR will have the UC attribute in MTRR.
Such workaround in hvmloader should also be paired with a fix for Linux so
it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.

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
Changes since v1:
 - Leave the xenpci BAR as UC by default.
 - Introduce an option to not set it as UC.
---
 docs/man/xl.cfg.5.pod.in                |  6 +++
 tools/firmware/hvmloader/config.h       |  2 +-
 tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.c         |  2 +-
 tools/include/libxl.h                   |  9 +++++
 tools/libs/light/libxl_create.c         |  1 +
 tools/libs/light/libxl_dom.c            |  9 +++++
 tools/libs/light/libxl_types.idl        |  1 +
 tools/xl/xl_parse.c                     |  2 +
 xen/include/public/hvm/hvm_xs_strings.h |  2 +
 10 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c388899306c2..e540d8169424 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2351,6 +2351,12 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
 Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
 requires at least QEMU 1.6.
 
+
+=item B<xenpci_bar_uc=BOOLEAN>
+
+B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
+uncacheable (UC) cache attribute set in MTRR.
+
 =item B<viridian=[ "GROUP", "GROUP", ...]> or B<viridian=BOOLEAN>
 
 The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenments
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
index cc67b18c0361..97933b44a82b 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -30,7 +30,7 @@
 #include <xen/hvm/e820.h>
 
 uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
-const uint32_t pci_mem_end = RESERVED_MEMBASE;
+uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 /*
@@ -116,6 +116,8 @@ void pci_setup(void)
      * experience the memory relocation bug described below.
      */
     bool allow_memory_relocate = 1;
+    /* Set the MTRR type of the xenpci device BAR as UC. */
+    bool xenpci_bar_uc = false;
 
     BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
                  PCI_COMMAND_IO);
@@ -130,6 +132,12 @@ void pci_setup(void)
     printf("Relocating guest memory for lowmem MMIO space %s\n",
            allow_memory_relocate?"enabled":"disabled");
 
+    s = xenstore_read(HVM_XS_XENPCI_BAR_UC, NULL);
+    if ( s )
+        xenpci_bar_uc = strtoll(s, NULL, 0);
+    printf("XenPCI device BAR MTRR cache attribute set to %s\n",
+           xenpci_bar_uc ? "UC" : "WB");
+
     s = xenstore_read("platform/mmio_hole_size", NULL);
     if ( s )
         mmio_hole_size = strtoll(s, NULL, 0);
@@ -271,6 +279,43 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            if ( !xenpci_bar_uc &&
+                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
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
@@ -310,7 +355,7 @@ void pci_setup(void)
         }
 
         /* Enable bus master for this function later */
-        pci_devfn_decode_type[devfn] = PCI_COMMAND_MASTER;
+        pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
     }
 
     if ( mmio_hole_size )
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 79c0e6bd4ad2..31b4411db7b4 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -867,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->table_flags |= ACPI_HAS_HPET;
 
     config->pci_start = pci_mem_start;
-    config->pci_len = pci_mem_end - pci_mem_start;
+    config->pci_len = RESERVED_MEMBASE - pci_mem_start;
     if ( pci_hi_mem_end > pci_hi_mem_start )
     {
         config->pci_hi_start = pci_hi_mem_start;
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca4c..7ce7678e6836 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1503,6 +1503,15 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_CREATEINFO_XEND_SUSPEND_EVTCHN_COMPAT
 
+/*
+ * LIBXL_HAVE_XENPCI_BAR_UC
+ *
+ * libxl_domain_build_info contains a boolean 'u.hvm.xenpci_bar_uc' field to
+ * signal whether the XenPCI device BAR should have UC cache attribute set in
+ * MTRR.
+ */
+#define LIBXL_HAVE_XENPCI_BAR_UC
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8bc768b5156c..962fa820faec 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
+        libxl_defbool_setdefault(&b_info->u.hvm.xenpci_bar_uc,      true);
         libxl_defbool_setdefault(&b_info->u.hvm.pirq,               false);
 
         libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 4d67b0d28294..60ec0354d19a 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
             goto err;
     }
 
+    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
+        libxl_defbool_val(info->u.hvm.xenpci_bar_uc)) {
+        path = GCSPRINTF("/local/domain/%d/"HVM_XS_XENPCI_BAR_UC, domid);
+        ret = libxl__xs_printf(gc, XBT_NULL, path, "%d",
+                               libxl_defbool_val(info->u.hvm.xenpci_bar_uc));
+        if (ret)
+            goto err;
+    }
+
     return 0;
 
 err:
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 198515383012..6054350b83c7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -691,6 +691,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("vkb_device",       libxl_defbool),
                                        ("soundhw",          string),
                                        ("xen_platform_pci", libxl_defbool),
+                                       ("xenpci_bar_uc",    libxl_defbool),
                                        ("usbdevice_list",   libxl_string_list),
                                        ("vendor_device",    libxl_vendor_device),
                                        # See libxl_ms_vm_genid_generate()
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 219e924779ff..4da3bb9e91ab 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2917,6 +2917,8 @@ skip_usbdev:
         xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.soundhw, 0);
         xlu_cfg_get_defbool(config, "xen_platform_pci",
                             &b_info->u.hvm.xen_platform_pci, 0);
+        xlu_cfg_get_defbool(config, "xenpci_bar_uc",
+                            &b_info->u.hvm.xenpci_bar_uc, 0);
 
         if(b_info->u.hvm.vnc.listen
            && b_info->u.hvm.vnc.display
diff --git a/xen/include/public/hvm/hvm_xs_strings.h b/xen/include/public/hvm/hvm_xs_strings.h
index e1ed078628a0..ebb07b9fba56 100644
--- a/xen/include/public/hvm/hvm_xs_strings.h
+++ b/xen/include/public/hvm/hvm_xs_strings.h
@@ -14,6 +14,8 @@
 #define HVM_XS_BIOS                    "hvmloader/bios"
 #define HVM_XS_GENERATION_ID_ADDRESS   "hvmloader/generation-id-address"
 #define HVM_XS_ALLOW_MEMORY_RELOCATE   "hvmloader/allow-memory-relocate"
+/* Set xenpci device BAR as UC in MTRR */
+#define HVM_XS_XENPCI_BAR_UC           "hvmloader/pci/xenpci-bar-uc"
 
 /* The following values allow additional ACPI tables to be added to the
  * virtual ACPI BIOS that hvmloader constructs. The values specify the guest
-- 
2.49.0


