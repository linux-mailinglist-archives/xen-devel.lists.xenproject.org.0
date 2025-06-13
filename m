Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CEAD89EB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 13:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014259.1392480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ28y-0000ix-5F; Fri, 13 Jun 2025 11:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014259.1392480; Fri, 13 Jun 2025 11:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ28y-0000hV-2O; Fri, 13 Jun 2025 11:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1014259;
 Fri, 13 Jun 2025 11:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IsI9=Y4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uQ28w-0000hP-Br
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 11:00:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95daf426-4845-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 13:00:15 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d54214adso16469605e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 04:00:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e25fd3asm47791845e9.36.2025.06.13.04.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:00:13 -0700 (PDT)
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
X-Inumbo-ID: 95daf426-4845-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749812414; x=1750417214; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4tZV0lh7pgUMqNSuKskN/40S+WEMGUKoG0+u2XcGqY=;
        b=lCQVXN0tyHoBh8GzqBvezd1i46aeY5aADoyabCPJ3lacg+6enRc+riy3TcxRHXytRm
         /vxF747YzYPDLuKw2CzatF6K6d+BvuWxDUrNp1voaI00PxRWZXxpMSmeMIdPz04We94n
         zjjfrk+yTmygcCxZxowF87qDYp/vS2yx9z/oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749812414; x=1750417214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4tZV0lh7pgUMqNSuKskN/40S+WEMGUKoG0+u2XcGqY=;
        b=qCQSJfk+8mx/T7lplxMj4EtXyq8QiWpP9+pWqSmKYpuAxDJhWJb+1LnGItGgAowd+x
         X6IJlLQD15aAd0Hqhoj+Iby9FHc+yYflmk5qNBGxbYb1/TQVZTcgSxFp82L3NobsGcll
         VnbegGb1nXwOOYage9liMtH8y9jNkPfve+ASJFsNWILj3xSpO8BROPY5W3z014lgkvo5
         Qr6eU9/141sIBGwNxqJzDKyzRjKAxSYHyUpe50D8wK0HLScRBCGCmvjemVRgLqiDhoLd
         2GoyIv/AzzAOd3YA4Bqze0NFEz4MSVrr0+n/rl+gjakxeZMphmDN2dUuD109zhBW+/9q
         mFrg==
X-Gm-Message-State: AOJu0YwRnHOzHlca+v3Xb0Ciix7yZyVWtddWCmF4KJ7qpbiKMh4L3i/Q
	ZZhLxAwcITq1s++Auh1xYTo4lYDs508jIFpgGaLYJGwRnUz9tolShueMR4zMb06V8plwT/8nTKs
	LKg8r
X-Gm-Gg: ASbGncsg5rqoh2xvyc9OrGisw81ONiCNx+5ErYi6HkZUEbC+MN89KPgql9z0mjS4wgS
	dPQkB7o2TA6E2J8cwxBCD0cRfIiOp5+bo9dUJOaGlAwoJiyyjAFuVYYOlaMixdebifmxTCQmuxE
	qcpO4tTjlyjd7bzivBiQ2QP1SyxKrVTnUP2SpJ3yaWHSup1LDHFAgDu07B03TQbauUDyKSOOqVk
	2denJ9lG6xF5nb7al1DFWyGeC7ZdFmpfFpiY3NFvGxs7ZnpS74CQGb3luLFnyyxq3SSOmroyK5r
	X+hW4W85KKPs/qPwVFCwS+LbvC7ctriNZ8rK250DcwZRrzJ8hGZyC+2mJmR2BotBGMvJo4Pnsf/
	nq6VospGuhc7jDGDHFUFeUxLl4iXfeg==
X-Google-Smtp-Source: AGHT+IHPMX61YLxZKKE/Xlqk0QxRaHp+5//u97B3a2A0BYr//MtGg/kY+xvjzey6onIDF5M/pPKj4g==
X-Received: by 2002:a05:600c:1d8b:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-45334b63261mr26018365e9.18.1749812414213;
        Fri, 13 Jun 2025 04:00:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: [PATCH v5] x86/hvmloader: select xen platform pci MMIO BAR UC or WB MTRR cache attribute
Date: Fri, 13 Jun 2025 13:00:09 +0200
Message-ID: <20250613110009.31245-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Xen platform PCI device (vendor ID 0x5853) exposed to x86 HVM guests
doesn't have the functionality of a traditional PCI device.  The exposed
MMIO BAR is used by some guests (including Linux) as a safe place to map
foreign memory, including the grant table itself.

Traditionally BARs from devices have the uncacheable (UC) cache attribute
from the MTRR, to ensure correct functionality of such devices.  hvmloader
mimics this behavior and sets the MTRR attributes of both the low and high
PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.

This however causes performance issues for users of the Xen platform PCI
device BAR, as for the purposes of mapping remote memory there's no need to
use the UC attribute.  On Intel systems this is worked around by using
iPAT, that allows the hypervisor to force the effective cache attribute of
a p2m entry regardless of the guest PAT value.  AMD however doesn't have an
equivalent of iPAT, and guest PAT values are always considered.

Linux commit:

41925b105e34 xen: replace xen_remap() with memremap()

Attempted to mitigate this by forcing mappings of the grant-table to use
the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
into account to calculate which PAT type to use, and seeing the MTRR cache
attribute for the region being UC the PAT also ends up as UC, regardless of
the caller having requested WB.

As a workaround to allow current Linux to map the grant-table as WB using
memremap() introduce an xl.cfg option (xen_platform_pci_bar_uc=0) that can
be used to select whether the Xen platform PCI device BAR will have the UC
attribute in MTRR.  Such workaround in hvmloader should also be paired with
a fix for Linux so it attempts to change the MTRR of the Xen platform PCI
device BAR to WB by itself.

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
Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com> # hvmloader
---
Changes since v4:
 - Rename to Xen platform PCI to avoid confusion.
 - Set hvmloader BAR default to UC.
 - Unconditionally write XS node in libxl.
 - Introduce define for Xen PCI vendor ID.

Changes since v3:
 - Add changelog.
 - Assign BARs normally for xenpci if special casing fails.

Changes since v2:
 - Add default value in xl.cfg.
 - List xenstore path in the pandoc file.
 - Adjust comment in hvmloader.
 - Fix commit message MIO -> MMIO.

Changes since v1:
 - Leave the xenpci BAR as UC by default.
 - Introduce an option to not set it as UC.
---
 CHANGELOG.md                            |  3 ++
 docs/man/xl.cfg.5.pod.in                |  8 ++++
 docs/misc/xenstore-paths.pandoc         |  5 +++
 tools/firmware/hvmloader/config.h       |  2 +-
 tools/firmware/hvmloader/pci.c          | 52 ++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.c         |  2 +-
 tools/include/libxl.h                   |  9 +++++
 tools/libs/light/libxl_create.c         |  1 +
 tools/libs/light/libxl_dom.c            |  9 +++++
 tools/libs/light/libxl_types.idl        |  1 +
 tools/xl/xl_parse.c                     |  2 +
 xen/include/public/hvm/hvm_xs_strings.h |  2 +
 12 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ee2f42e7405..5f31ca08fe3f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
      manipulations and memory type changes.
+   - Allow controlling the MTRR cache attribute of the Xen platform PCI device
+     BAR for HVM guests, to improve performance of guests using it to map the
+     grant table or foreign memory.
 
 ### Added
  - On x86:
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c388899306c2..e6a8e12c99e2 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
 Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
 requires at least QEMU 1.6.
 
+
+=item B<xen_platform_pci_bar_uc=BOOLEAN>
+
+B<x86 only:> Select whether the memory BAR of the Xen platform PCI device
+should have uncacheable (UC) cache attribute set in MTRR.
+
+Default is B<true>.
+
 =item B<viridian=[ "GROUP", "GROUP", ...]> or B<viridian=BOOLEAN>
 
 The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenments
diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 01a340fafcbe..4994194e2bfb 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -234,6 +234,11 @@ These xenstore values are used to override some of the default string
 values in the SMBIOS table constructed in hvmloader. See the SMBIOS
 table specification at http://www.dmtf.org/standards/smbios/ 
 
+#### ~/hvmloader/pci/xen-platform-pci-bar-uc = ("1"|"0") [HVM,INTERNAL]
+
+Select whether the Xen platform PCI device MMIO BAR will have the uncacheable
+cache attribute set in the MTRRs by hvmloader.
+
 #### ~/bios-strings/oem-* = STRING [HVM,INTERNAL]
 
 1 to 99 OEM strings can be set in xenstore using values of the form
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
index cc67b18c0361..c41c8d946ac4 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -29,8 +29,10 @@
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
 
+#define PCI_VENDOR_ID_XEN       0x5853
+
 uint32_t pci_mem_start = HVM_BELOW_4G_MMIO_START;
-const uint32_t pci_mem_end = RESERVED_MEMBASE;
+uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 /*
@@ -116,6 +118,8 @@ void pci_setup(void)
      * experience the memory relocation bug described below.
      */
     bool allow_memory_relocate = 1;
+    /* Select the MTRR cache attribute of the xen platform pci device BAR. */
+    bool xenpci_bar_uc = true;
 
     BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
                  PCI_COMMAND_IO);
@@ -130,6 +134,12 @@ void pci_setup(void)
     printf("Relocating guest memory for lowmem MMIO space %s\n",
            allow_memory_relocate?"enabled":"disabled");
 
+    s = xenstore_read(HVM_XS_XEN_PLATFORM_PCI_BAR_UC, NULL);
+    if ( s )
+        xenpci_bar_uc = strtoll(s, NULL, 0);
+    printf("Xen platform PCI device BAR MTRR cache attribute set to %s\n",
+           xenpci_bar_uc ? "UC" : "WB");
+
     s = xenstore_read("platform/mmio_hole_size", NULL);
     if ( s )
         mmio_hole_size = strtoll(s, NULL, 0);
@@ -271,6 +281,44 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            if ( !xenpci_bar_uc &&
+                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
+                 vendor_id == PCI_VENDOR_ID_XEN &&
+                 (device_id == 0x0001 || device_id == 0x0002) )
+            {
+                if ( is_64bar )
+                {
+                     printf("xen platform pci dev %02x:%x unexpected MMIO 64bit BAR%u\n",
+                            devfn >> 3, devfn & 7, bar);
+                     goto skip_xenpci;
+                }
+
+                if ( bar_sz > pci_mem_end ||
+                     ((pci_mem_end - bar_sz) & ~(bar_sz - 1)) < pci_mem_start )
+                {
+                     printf("xen platform pci dev %02x:%x BAR%u size %llx overflows low PCI hole\n",
+                            devfn >> 3, devfn & 7, bar, bar_sz);
+                     goto skip_xenpci;
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
+ skip_xenpci:
+
             for ( i = 0; i < nr_bars; i++ )
                 if ( bars[i].bar_sz < bar_sz )
                     break;
@@ -310,7 +358,7 @@ void pci_setup(void)
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
index b7ad7735ca4c..a0c4fcfe2a54 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1503,6 +1503,15 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_CREATEINFO_XEND_SUSPEND_EVTCHN_COMPAT
 
+/*
+ * LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
+ *
+ * libxl_domain_build_info contains a boolean 'u.hvm.xen_platform_pci_bar_uc'
+ * field to signal whether the XenPCI device BAR should have UC cache attribute
+ * set in MTRR.
+ */
+#define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8bc768b5156c..433800ef6c19 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
+        libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci_bar_uc, true);
         libxl_defbool_setdefault(&b_info->u.hvm.pirq,               false);
 
         libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 4d67b0d28294..a61085ca3b5f 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
             goto err;
     }
 
+    if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
+        path = GCSPRINTF("/local/domain/%d/" HVM_XS_XEN_PLATFORM_PCI_BAR_UC,
+                         domid);
+        ret = libxl__xs_printf(gc, XBT_NULL, path, "%d",
+            libxl_defbool_val(info->u.hvm.xen_platform_pci_bar_uc));
+        if (ret)
+            goto err;
+    }
+
     return 0;
 
 err:
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 198515383012..0a4a1f0eb747 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -691,6 +691,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("vkb_device",       libxl_defbool),
                                        ("soundhw",          string),
                                        ("xen_platform_pci", libxl_defbool),
+                                       ("xen_platform_pci_bar_uc", libxl_defbool),
                                        ("usbdevice_list",   libxl_string_list),
                                        ("vendor_device",    libxl_vendor_device),
                                        # See libxl_ms_vm_genid_generate()
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 219e924779ff..6d42a4e0f7cb 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2917,6 +2917,8 @@ skip_usbdev:
         xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.soundhw, 0);
         xlu_cfg_get_defbool(config, "xen_platform_pci",
                             &b_info->u.hvm.xen_platform_pci, 0);
+        xlu_cfg_get_defbool(config, "xen_platform_pci_bar_uc",
+                            &b_info->u.hvm.xen_platform_pci_bar_uc, 0);
 
         if(b_info->u.hvm.vnc.listen
            && b_info->u.hvm.vnc.display
diff --git a/xen/include/public/hvm/hvm_xs_strings.h b/xen/include/public/hvm/hvm_xs_strings.h
index e1ed078628a0..e977d5a8b186 100644
--- a/xen/include/public/hvm/hvm_xs_strings.h
+++ b/xen/include/public/hvm/hvm_xs_strings.h
@@ -14,6 +14,8 @@
 #define HVM_XS_BIOS                    "hvmloader/bios"
 #define HVM_XS_GENERATION_ID_ADDRESS   "hvmloader/generation-id-address"
 #define HVM_XS_ALLOW_MEMORY_RELOCATE   "hvmloader/allow-memory-relocate"
+/* Set Xen platform pci device BAR as UC in MTRR */
+#define HVM_XS_XEN_PLATFORM_PCI_BAR_UC "hvmloader/pci/xen-platform-pci-bar-uc"
 
 /* The following values allow additional ACPI tables to be added to the
  * virtual ACPI BIOS that hvmloader constructs. The values specify the guest
-- 
2.49.0


