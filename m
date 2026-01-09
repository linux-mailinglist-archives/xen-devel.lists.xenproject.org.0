Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325EED082F6
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 10:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198468.1515407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8mC-00035U-Hp; Fri, 09 Jan 2026 09:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198468.1515407; Fri, 09 Jan 2026 09:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8mC-00032s-EZ; Fri, 09 Jan 2026 09:27:24 +0000
Received: by outflank-mailman (input) for mailman id 1198468;
 Fri, 09 Jan 2026 09:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ve8mA-00031V-S0
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 09:27:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66349633-ed3d-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 10:27:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64b58553449so6088748a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 01:27:21 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4479sm9845938a12.1.2026.01.09.01.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 01:27:19 -0800 (PST)
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
X-Inumbo-ID: 66349633-ed3d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950840; x=1768555640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/a3jE5WcEeVvQVUAGeNvAnv9PSN8A+YCeqq6+pydKg=;
        b=PYIshAuFwnUcBY8cdWkeI661/ch4psA0Vdpe4PmB+0F0qwCcINL1v2eVDhhmu2vpVV
         TeQlMNXGQJGu8B8E5QuzTYUUToIQw0dYx3QpbbkI7FA8olP/DVcfnRe2qn9dkntzycRW
         KnpdR9tfOxrUFqdq/gtOe0FV9GRAflf02na0l1Hy4hkiB1vdxNOZRQF7gakpIa3VXGMi
         ixbmNDFwIJ2Ha3ypGrUxnz/47rF4WBhGOyiPHkbYQbF+BAEbKDg8XV1As9TbvowUAGeR
         bZXcrbejSC7nR6oLcsTyf6eIXN4NEN2mlMz16N3x85CqUXGg6fg4fVo5o8fEZedmsVgC
         NKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950840; x=1768555640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/a3jE5WcEeVvQVUAGeNvAnv9PSN8A+YCeqq6+pydKg=;
        b=np68O6qT/wcoyFVMgfI1vNMqNrkDSGericEFXYDBVFIHXe5Q540JrPVm0RcRnM2uJa
         v78ndASa+cj3604DCaJ8WT388cLexsr3rG2itBOA4ILv4acojIu/L7SJPDy+oKtvoMhc
         d4qaj6xioNhJ9lVg3CDrIT1rw6fYji07lAyNwgMw5YO3Hg0aeOXNghNg9V81s7cdKHuS
         t1eUmZwBHlO+iwo/E4zxYy3qtj0CvrB0GYSifkSRqoEhLyqHpsHef0LvPc8ghe5SWnA1
         2HkUZ8jGVb5ojbcZC84OMOXV0dCf8vexSZWmQYQ3rdhsJN7ZwMlkumKHRrhNn5ixbriN
         SfSA==
X-Gm-Message-State: AOJu0Yy/FWeqJhB/NDVrLY1nJXK72WtgEMYA46R31H/8uTY/IuISfb33
	fZ81Fl1RD+WbMl+QYSnN4l4GqDKPjw447hLYZTIm3Sa0hQd54c5iL+P4/sS7iw==
X-Gm-Gg: AY/fxX6YcSToXTeOWKl9yQvVYLISUu0OPEjtN/c1Ul7l+pGV0qz/n/KGdlywUglC+bO
	RzqFSNBsYul/3PkZV6FPO05MpgqCUioNzs5EvJzwPB3hz2tHy9rDu5cQSWxXxnlGRgY5ZqEwTp0
	CXh+l9WsLq6+eVt1fqMjX25PUm6Nz5Z6cthpFiE44E3o2pZqf7612vEdIBks2HmS7dVYIghxUhW
	NYmlg6dSetIzy8KCEDHhZvRfp0ykWCGklybSlhBI5U5jMr/KfXD+7J0PEAvZvLNHGMSLImBWR9j
	JCIhfgpP6hBXdj50NTcAq8wm4XEeMpJPuTw4clNuqTVRM0U8SIOhhXQT7caCKHdchsrBvxqIAik
	V0TlSsmTyHxZS3Xiid8WQ8THZ3eU69Tmn3XCpYTMu5Y7VaUCoVHPkowVJ0aYQNmDjh7P6qFWIYQ
	/rfk90fozlmk6/NzPywSe88NFggoUiPRUxU/N8hM7xVYslM9DqHebzhw==
X-Google-Smtp-Source: AGHT+IHlluaofB620PGYiX8OrfaU3u30jCNoW8j+u2b28C08R4OK87MAkSPubfws1tprjgHLz1PSAA==
X-Received: by 2002:a05:6402:2803:b0:64b:6330:2fee with SMTP id 4fb4d7f45d1cf-65097df5b92mr8576939a12.11.1767950840278;
        Fri, 09 Jan 2026 01:27:20 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Yann Dirson <yann.dirson@vates.tech>,
	Yann Sionneau <yann.sionneau@vates.tech>
Subject: [PATCH v3] acpi/arm: relax MADT GICC entry length check to support newer ACPI revisions
Date: Fri,  9 Jan 2026 10:27:11 +0100
Message-ID: <a2234959527a420f8736b2789118326b2d3ee35e.1767950420.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
match the known values, which leads to:
  GICv3: No valid GICC entries exist.
as observed on the AmpereOne platform.

To fix this, import the logic from Linux commit 9eb1c92b47c7:
  The BAD_MADT_GICC_ENTRY check is a little too strict because
  it rejects MADT entries that don't match the currently known
  lengths. We should remove this restriction to avoid problems
  if the table length changes. Future code which might depend on
  additional fields should be written to validate those fields
  before using them, rather than trying to globally check
  known MADT version lengths.

  Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
  Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
  [lorenzo.pieralisi@arm.com: added MADT macro comments]
  Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Acked-by: Sudeep Holla <sudeep.holla@arm.com>
  Cc: Will Deacon <will.deacon@arm.com>
  Cc: Catalin Marinas <catalin.marinas@arm.com>
  Cc: Al Stone <ahs3@redhat.com>
  Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
  Signed-off-by: Will Deacon <will.deacon@arm.com>

As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
used. As we rewrite the MADT for hwdom, reuse the host GICC header length
instead of ACPI_MADT_GICC_LENGTH.

Mark gic_get_hwdom_madt_size() as __init since its only caller is also
__init.

[1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

Reported-By: Yann Dirson <yann.dirson@vates.tech>
Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
I ran CI tests where it made sense for this patch, as I don’t see any CI job
that builds Xen with CONFIG_ACPI=y:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2252409762

I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
AmpereOne platform.
---
 xen/arch/arm/acpi/domain_build.c |  6 ++++++
 xen/arch/arm/gic-v2.c            |  3 ++-
 xen/arch/arm/gic-v3.c            |  3 ++-
 xen/arch/arm/gic.c               | 13 +++++++++++--
 xen/arch/arm/include/asm/acpi.h  | 21 +++++++++++++++------
 5 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 1c3555d814cc..959698d13ac3 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -458,6 +458,12 @@ static int __init estimate_acpi_efi_size(struct domain *d,
     acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
 
     madt_size = gic_get_hwdom_madt_size(d);
+    if ( !madt_size )
+    {
+        printk("Unable to get hwdom MADT size\n");
+        return -EINVAL;
+    }
+
     acpi_size += ROUNDUP(madt_size, 8);
 
     addr = acpi_os_get_root_pointer();
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d05d..aae6a7bf3076 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
                              header);
 
-    size = ACPI_MADT_GICC_LENGTH;
+    size = host_gicc->header.length;
+
     /* Add Generic Interrupt */
     for ( i = 0; i < d->max_vcpus; i++ )
     {
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16ab..75b89efad462 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
 
     host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
                              header);
-    size = ACPI_MADT_GICC_LENGTH;
+    size = host_gicc->header.length;
+
     for ( i = 0; i < d->max_vcpus; i++ )
     {
         gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3c3..e4fcfd60205d 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -414,12 +414,21 @@ int gic_make_hwdom_madt(const struct domain *d, u32 offset)
     return gic_hw_ops->make_hwdom_madt(d, offset);
 }
 
-unsigned long gic_get_hwdom_madt_size(const struct domain *d)
+unsigned long __init gic_get_hwdom_madt_size(const struct domain *d)
 {
     unsigned long madt_size;
+    const struct acpi_subtable_header *header;
+    const struct acpi_madt_generic_interrupt *host_gicc;
+
+    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
+    if ( !header )
+        return 0;
+
+    host_gicc = container_of(header, const struct acpi_madt_generic_interrupt,
+                             header);
 
     madt_size = sizeof(struct acpi_table_madt)
-                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
+                + host_gicc->header.length * d->max_vcpus
                 + sizeof(struct acpi_madt_generic_distributor)
                 + gic_hw_ops->get_hwdom_extra_madt_size(d);
 
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index 13756dd341b4..30bc446d1f75 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
  */
 paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
 
-/* Macros for consistency checks of the GICC subtable of MADT */
-#define ACPI_MADT_GICC_LENGTH	\
-    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
+/*
+ * MADT GICC minimum length refers to the MADT GICC structure table length as
+ * defined in the earliest ACPI version supported on arm64, ie ACPI 5.1.
+ *
+ * The efficiency_class member was added to the
+ * struct acpi_madt_generic_interrupt to represent the MADT GICC structure
+ * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose offset
+ * is therefore used to delimit the MADT GICC structure minimum length
+ * appropriately.
+ */
+#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
+    struct acpi_madt_generic_interrupt, efficiency_class)
 
-#define BAD_MADT_GICC_ENTRY(entry, end)						\
-    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
-     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
+#define BAD_MADT_GICC_ENTRY(entry, end) \
+    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH || \
+    (unsigned long)(entry) + (entry)->header.length > (end))
 
 #ifdef CONFIG_ACPI
 extern bool acpi_disabled;
-- 
2.52.0


