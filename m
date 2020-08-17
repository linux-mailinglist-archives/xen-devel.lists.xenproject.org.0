Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107F92463C1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bm5-0004NF-Ll; Mon, 17 Aug 2020 09:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bm4-00046j-0a
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:52 +0000
X-Inumbo-ID: 5f272095-182e-4e55-86b1-8e9556abf5a2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f272095-182e-4e55-86b1-8e9556abf5a2;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C313AAEFD;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 11/17] tools/libxc: remove unused headers xc_efi.h and
 xc_elf.h
Date: Mon, 17 Aug 2020 11:49:16 +0200
Message-Id: <20200817094922.15768-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove xc_efi.h and xc_elf.h as they aren't used anywhere.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/xc_efi.h | 158 -------------------------------------------
 tools/libxc/xc_elf.h |  16 -----
 2 files changed, 174 deletions(-)
 delete mode 100644 tools/libxc/xc_efi.h
 delete mode 100644 tools/libxc/xc_elf.h

diff --git a/tools/libxc/xc_efi.h b/tools/libxc/xc_efi.h
deleted file mode 100644
index dbe105be8f..0000000000
--- a/tools/libxc/xc_efi.h
+++ /dev/null
@@ -1,158 +0,0 @@
-/*
- * Extensible Firmware Interface
- * Based on 'Extensible Firmware Interface Specification' version 0.9, April 30, 1999
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation;
- * version 2.1 of the License.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) 1999 VA Linux Systems
- * Copyright (C) 1999 Walt Drummond <drummond@valinux.com>
- * Copyright (C) 1999, 2002-2003 Hewlett-Packard Co.
- *      David Mosberger-Tang <davidm@hpl.hp.com>
- *      Stephane Eranian <eranian@hpl.hp.com>
- */
-
-#ifndef XC_EFI_H
-#define XC_EFI_H
-
-/* definitions from xen/include/asm-ia64/linux-xen/linux/efi.h */
-
-typedef struct {
-        uint8_t b[16];
-} efi_guid_t;
-
-#define EFI_GUID(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7) \
-((efi_guid_t) \
-{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
-  (b) & 0xff, ((b) >> 8) & 0xff, \
-  (c) & 0xff, ((c) >> 8) & 0xff, \
-  (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
-
-/*
- * Generic EFI table header
- */
-typedef struct {
-	uint64_t signature;
-	uint32_t revision;
-	uint32_t headersize;
-	uint32_t crc32;
-	uint32_t reserved;
-} efi_table_hdr_t;
-
-/*
- * Memory map descriptor:
- */
-
-/* Memory types: */
-#define EFI_RESERVED_TYPE                0
-#define EFI_LOADER_CODE                  1
-#define EFI_LOADER_DATA                  2
-#define EFI_BOOT_SERVICES_CODE           3
-#define EFI_BOOT_SERVICES_DATA           4
-#define EFI_RUNTIME_SERVICES_CODE        5
-#define EFI_RUNTIME_SERVICES_DATA        6
-#define EFI_CONVENTIONAL_MEMORY          7
-#define EFI_UNUSABLE_MEMORY              8
-#define EFI_ACPI_RECLAIM_MEMORY          9
-#define EFI_ACPI_MEMORY_NVS             10
-#define EFI_MEMORY_MAPPED_IO            11
-#define EFI_MEMORY_MAPPED_IO_PORT_SPACE 12
-#define EFI_PAL_CODE                    13
-#define EFI_MAX_MEMORY_TYPE             14
-
-/* Attribute values: */
-#define EFI_MEMORY_UC           ((uint64_t)0x0000000000000001ULL)    /* uncached */
-#define EFI_MEMORY_WC           ((uint64_t)0x0000000000000002ULL)    /* write-coalescing */
-#define EFI_MEMORY_WT           ((uint64_t)0x0000000000000004ULL)    /* write-through */
-#define EFI_MEMORY_WB           ((uint64_t)0x0000000000000008ULL)    /* write-back */
-#define EFI_MEMORY_WP           ((uint64_t)0x0000000000001000ULL)    /* write-protect */
-#define EFI_MEMORY_RP           ((uint64_t)0x0000000000002000ULL)    /* read-protect */
-#define EFI_MEMORY_XP           ((uint64_t)0x0000000000004000ULL)    /* execute-protect */
-#define EFI_MEMORY_RUNTIME      ((uint64_t)0x8000000000000000ULL)    /* range requires runtime mapping */
-#define EFI_MEMORY_DESCRIPTOR_VERSION   1
-
-#define EFI_PAGE_SHIFT          12
-
-/*
- * For current x86 implementations of EFI, there is
- * additional padding in the mem descriptors.  This is not
- * the case in ia64.  Need to have this fixed in the f/w.
- */
-typedef struct {
-        uint32_t type;
-        uint32_t pad;
-        uint64_t phys_addr;
-        uint64_t virt_addr;
-        uint64_t num_pages;
-        uint64_t attribute;
-#if defined (__i386__)
-        uint64_t pad1;
-#endif
-} efi_memory_desc_t;
-
-/*
- * EFI Runtime Services table
- */
-#define EFI_RUNTIME_SERVICES_SIGNATURE	((uint64_t)0x5652453544e5552ULL)
-#define EFI_RUNTIME_SERVICES_REVISION	0x00010000
-
-typedef struct {
-	efi_table_hdr_t hdr;
-	unsigned long get_time;
-	unsigned long set_time;
-	unsigned long get_wakeup_time;
-	unsigned long set_wakeup_time;
-	unsigned long set_virtual_address_map;
-	unsigned long convert_pointer;
-	unsigned long get_variable;
-	unsigned long get_next_variable;
-	unsigned long set_variable;
-	unsigned long get_next_high_mono_count;
-	unsigned long reset_system;
-} efi_runtime_services_t;
-
-/*
- *  EFI Configuration Table and GUID definitions
- */
-#define NULL_GUID \
-    EFI_GUID(  0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 )
-#define ACPI_20_TABLE_GUID    \
-    EFI_GUID(  0x8868e871, 0xe4f1, 0x11d3, 0xbc, 0x22, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81 )
-#define SAL_SYSTEM_TABLE_GUID    \
-    EFI_GUID(  0xeb9d2d32, 0x2d88, 0x11d3, 0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d )
-
-typedef struct {
-	efi_guid_t guid;
-	unsigned long table;
-} efi_config_table_t;
-
-#define EFI_SYSTEM_TABLE_SIGNATURE ((uint64_t)0x5453595320494249ULL)
-#define EFI_SYSTEM_TABLE_REVISION  ((1 << 16) | 00)
-
-typedef struct {
-	efi_table_hdr_t hdr;
-	unsigned long fw_vendor;	/* physical addr of CHAR16 vendor string */
-	uint32_t fw_revision;
-	unsigned long con_in_handle;
-	unsigned long con_in;
-	unsigned long con_out_handle;
-	unsigned long con_out;
-	unsigned long stderr_handle;
-	unsigned long stderr;
-	efi_runtime_services_t *runtime;
-	unsigned long boottime;
-	unsigned long nr_tables;
-	unsigned long tables;
-} efi_system_table_t;
-
-#endif /* XC_EFI_H */
diff --git a/tools/libxc/xc_elf.h b/tools/libxc/xc_elf.h
deleted file mode 100644
index acbc0280bd..0000000000
--- a/tools/libxc/xc_elf.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation;
- * version 2.1 of the License.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <xen/libelf/elfstructs.h>
-- 
2.26.2


