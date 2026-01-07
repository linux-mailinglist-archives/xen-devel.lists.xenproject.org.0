Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B1CFEE82
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196987.1514680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWXN-0005RD-Ky; Wed, 07 Jan 2026 16:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196987.1514680; Wed, 07 Jan 2026 16:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWXN-0005Pm-ID; Wed, 07 Jan 2026 16:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1196987;
 Wed, 07 Jan 2026 16:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWUC-00033L-6o
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:34:16 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4632b82-ebe6-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:34:15 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so431929466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:34:15 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4cfd97sm531309766b.36.2026.01.07.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:34:13 -0800 (PST)
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
X-Inumbo-ID: b4632b82-ebe6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803654; x=1768408454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0do4wU9XAoJGGnLPFw9NPAw9NeZhVzIfXdHI5e2mqY=;
        b=XFxE+JWp8F0JxVepRe5zD0WlVuYQYYg8siaFppNMDeMF7IKmBYE3Vw6Ay5KK8MX8bo
         hJ3Wg4QWFIMi9DKmf7+CH3nBWj22A+Q+CvuDfdx4idaGyc8pUumKA3/3agudJP8c5RWV
         Bkhzj9QN+4EbGQbhX3tpisrz0Lx18OmVQRtGb8eCgRs3Qb2SMlbMbrbPXi+SaRz90TzF
         PaRv6tJ7njzNXIYcQPez9Tiw3aipYg8AyFGpbObKIQkO2wmQcJeG6W1ASObTuDzEXFyV
         gIR8L2/Knn+qogYBm1ViNHDvx0PNZlVxi65M0viAEoEUDvUbx7KXV4hqJlm7dc1TdHCb
         9sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803654; x=1768408454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0do4wU9XAoJGGnLPFw9NPAw9NeZhVzIfXdHI5e2mqY=;
        b=N53AJNW0xJ7xUQvFIc3p9j8i+FPqRTEbRqpnnbQPmscB1jGmz8sernu24pYonuWDLl
         qA4eKOP/ZGuLL/sbjDRIp7T+53lzNwmPQBMrxcYugKs2BPFTF73Pq1AoK2mIAKlUbnE6
         4TKkapI/r0o4HkSJv/lI9gzNE8Wb/HEalsDpMkcVAxZOeNYTKm1eJSGGxd8IEMB1OfRi
         ACFBXTXK2Jbj3FSF6X4Z5eoZaAFYdXctyuI0U1oEKVq6ukl9xLTmXam4i6UQdyX3EROB
         0ooYFbv0ZW4tyFgDaw7esBwAN76fSRaBR/gfrfBlF9UBxZTLvqftpidytrugfP8DFWav
         cOEg==
X-Gm-Message-State: AOJu0YxR+5dC1RpE9xMTNcvb6MwoKymAw2irNZ56WeUQ+nipaG6JmbRm
	nG5i+16CvuQlmZGcveSwYCK6/3UQeV4lwQFxqkqNg/NXJZy1dL/Iwixhu4+tyw==
X-Gm-Gg: AY/fxX74eRqTQ5S7QrMFvJ5pVGcIkr5NH5gicXUwWA+xNuJqCLJ0E4nGv78id0qXDm+
	Edbkqyd2ANX1BphjMFHWpIi3uDCa1WQYZ2iwvYa5SRKludsE5GU77T7OwZk9GmpLbccHEQYn4XJ
	RrWhV0ooMiELpHnHQh6luHfiCrt5U75Zw5sCOX+8Oiuf41m6XPvb+zIw8YUm1D7Hg4ZNOOL0vsC
	LYZPmyZ3xD8QEhAPIbcYLCoPB39LhUIZiJzV3WdU/YntURtrETwpt2xJkUQmHAD+niPYbk12I5O
	Ld32h2nXlanFaOfuDQXnvIsLA3C0bvHqysSMxcTaVyN8dqT9g5+9xdRJQGQ7gMmCzRyGJFpUNBt
	YjQBOX48Ha6es6GdUDXhPYzTI98MfnqtbzCadolemvRTLCYHVFErpjRv1MCVrtRMWyZP6NXO5KS
	OEp798l+X/w542wn+8EnndSZuILErYhkO/EjRc7VIRHnc7ulW7nbhmAuPikRMVwQoh
X-Google-Smtp-Source: AGHT+IGTQNpEB2UwZwEuxMVMqHBoasEhnCwPI96dDmnCa/v0k8qb6hQy0agIRqMVqWuLLGrXCJx9dA==
X-Received: by 2002:a17:907:7283:b0:b83:1327:5f88 with SMTP id a640c23a62f3a-b84451da312mr317379666b.16.1767803654204;
        Wed, 07 Jan 2026 08:34:14 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yann Dirson <yann.dirson@vates.tech>,
	Yann Sionneau <yann.sionneau@vates.tech>
Subject: [PATCH v2] acpi/arm: relax MADT GICC entry length check to support newer ACPI revisions
Date: Wed,  7 Jan 2026 17:34:02 +0100
Message-ID: <3850c51d41b1ab67a453ca70c0a44172185274f6.1767694781.git.oleksii.kurochko@gmail.com>
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

[1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

Reported-By: Yann Dirson <yann.dirson@vates.tech>
Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
I ran CI tests where it made sense for this patch, as I don’t see any CI job
that builds Xen with CONFIG_ACPI=y:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2229673951

I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
AmpereOne platform.
---
Changes in v2:
 - Update the commit message:
   - Use more characters for commit ID.
   - Drop 'import from'.
 - Add Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>.
 - Make the local variables host_gicc const in  gic_get_hwdom_madt_size().
   (header variable isn't const as container_of() will discard 'const' qualifier
   and so compilation error will occur).
 - Return 0 instead of panic() in gic_get_hwdom_madt_size().
---
 xen/arch/arm/acpi/domain_build.c |  6 ++++++
 xen/arch/arm/gic-v2.c            |  3 ++-
 xen/arch/arm/gic-v3.c            |  3 ++-
 xen/arch/arm/gic.c               | 12 +++++++++++-
 xen/arch/arm/include/asm/acpi.h  | 21 +++++++++++++++------
 5 files changed, 36 insertions(+), 9 deletions(-)

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
index ee75258fc3c3..e22feb46f5d4 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
 {
     unsigned long madt_size;
 
+    struct acpi_subtable_header *header;
+    const struct acpi_madt_generic_interrupt *host_gicc;
+
+    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
+    if ( !header )
+        return 0;
+
+    host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
+                             header);
+
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


