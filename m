Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59848A373C7
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889527.1298628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm9-0006u9-VE; Sun, 16 Feb 2025 10:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889527.1298628; Sun, 16 Feb 2025 10:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm9-0006sM-S3; Sun, 16 Feb 2025 10:21:25 +0000
Received: by outflank-mailman (input) for mailman id 889527;
 Sun, 16 Feb 2025 10:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtIa=VH=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tjbm7-0006NS-Rw
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:21:23 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ebb021-ec4f-11ef-9896-31a8f345e629;
 Sun, 16 Feb 2025 11:21:18 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30227c56b11so36184411fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 02:21:18 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30922dc69bdsm8474771fa.12.2025.02.16.02.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 02:21:16 -0800 (PST)
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
X-Inumbo-ID: c2ebb021-ec4f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739701278; x=1740306078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAZ4zuKPO14qmf9LqdLx3Gu4coiU8fvKJC3JzaF1g0M=;
        b=OgEoBplb5W1zWlCbganWbiu/cGdbn9OHF8GyqpzVzLBt3pb2wlQkoyOvKbb9Gyz7oT
         Ct0xWthhaCOiccQTl2BJUQ00O0Q5CSN80xRd5z7lhjuGdPH8ZR9gjIqgn1yAWo7DFZw3
         VYNcf37VZcMuwupSF2pChaLMJxiU9aSfs14Qv/neLvZVfW/eTI/Q3HgAkQZggFMS7WLk
         dgSc1gCIp6Kh7daegP/+qfVqCyymkZk6zjri+u7dkDwBOLWHcdzDRfFc02NakpUkvbOw
         cawWFCCy/aBqKQTNrAZ4q90cnksG5BofJ3wIFSpTWSbETX1JP5lFGte56r+9nGRyBspF
         m0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739701278; x=1740306078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAZ4zuKPO14qmf9LqdLx3Gu4coiU8fvKJC3JzaF1g0M=;
        b=bdyJCcEbfrlmMdjzf8mhunKYbpSEvBBmZgeMre+WoSyHHDsmGCaUl9vpuR4dso9UBF
         kEr7BAOG/E2xBUNau7KDdAmDoFVPAOTbSNZ7v1duuH9TCkG0Q0NPeT+ETb3CdsH/8gxC
         nmx39Gru2a9v738YV/iT6uWPrvCk2zYISwNzPZG8TmPVCSwZqlNVzuaRzv2+gGLbaMmm
         YdYy4Idgq3PB3/U1zKbX/aCkcD3UnR1Kh07SqGiMp1RYqwMozx28fZVR2rDReBe5Omu5
         k4oCJ/ke8IdNxoW3syzcY6hJxXDE2F4dGhu+g0Qvj2fKsePABRAcD2Fiel+WZN1mDT+2
         stqg==
X-Gm-Message-State: AOJu0Yy3Nu72AIcxSui2N/TtWfAytGRLkTCjgd79CbJm84ZbPiFJ1v1+
	OKHyMCN5e5N6hzdOX3mRuYUrTEmUykKwJ14Z0IE1cPFqKwUy/zANyWrYzA==
X-Gm-Gg: ASbGncu+OqRiSmJ5qR7/1oeNHkHnV2vL7EygGNfZiAIAt17nXfJ2Te0AOgTUHRUPnJ1
	CUb+Gg3WCMJL5yx4WGKoVguaMmGd6KPOxWfs8LcoaU5cOd0SULOiU9avMXHf4hdcH1k0JTR1uP9
	RBV1QijDDjbFV84uehvdQmshYiGpQBnhb8Spu5Ldsue3cDGFseumkgZo8AwiAvXfZtIdcxwKhrM
	KMvTJQ/cCdPiyV5r9aO/Gqq4fc+Z0U4yQYh+CrI+00DaFbBUlN2wmaWKho/Fnw+l/jo526z9mVV
	WPfWT4j0Bpj8YyF/xBJc+LYM
X-Google-Smtp-Source: AGHT+IEhoLNngJRrDq1xByLAApBGbTDGs8D2Fy3hDT43ZbYkhY9902BJQIUJl8ZooXyLRiGif3NY+A==
X-Received: by 2002:a05:651c:2208:b0:308:f01f:1836 with SMTP id 38308e7fff4ca-30927ad678cmr16955701fa.27.1739701277673;
        Sun, 16 Feb 2025 02:21:17 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 2/2] code style: Format ACPI tables
Date: Sun, 16 Feb 2025 12:21:08 +0200
Message-Id: <20250216102108.2665222-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
References: <20250216102108.2665222-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use .clang-format to format ACPI tables.

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 xen/drivers/acpi/tables.c | 809 ++++++++++++++++++++------------------
 1 file changed, 435 insertions(+), 374 deletions(-)

diff --git a/xen/drivers/acpi/tables.c b/xen/drivers/acpi/tables.c
index 20aed8929b86..cf9085ac2fc7 100644
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -38,362 +38,419 @@
 
 bool __initdata opt_acpi_verbose;
 
-static const char *__initdata
-mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
-static const char *__initdata
-mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
+static const char *__initdata mps_inti_flags_polarity[] = { "dfl",
+                                                            "high",
+                                                            "res",
+                                                            "low" };
+static const char *__initdata mps_inti_flags_trigger[] = { "dfl",
+                                                           "edge",
+                                                           "res",
+                                                           "level" };
 
 static int acpi_apic_instance __initdata;
 
 void __init acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 {
-	if (!header)
-		return;
-
-	switch (header->type) {
-
-	case ACPI_MADT_TYPE_LOCAL_APIC:
-		if (opt_acpi_verbose)
-		{
-			const struct acpi_madt_local_apic *p =
-			    container_of(header, const struct acpi_madt_local_apic, header);
-
-			printk(KERN_INFO PREFIX
-			       "LAPIC (acpi_id[0x%02x] lapic_id[0x%02x] %s)\n",
-			       p->processor_id, p->id,
-			       (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
-		}
-		break;
-
-	case ACPI_MADT_TYPE_LOCAL_X2APIC:
-		if (opt_acpi_verbose)
-		{
-			const struct acpi_madt_local_x2apic *p =
-			    container_of(header, const struct acpi_madt_local_x2apic, header);
-
-			printk(KERN_INFO PREFIX
-			       "X2APIC (apic_id[0x%02x] uid[0x%02x] %s)\n",
-			       p->local_apic_id, p->uid,
-			       (p->lapic_flags & ACPI_MADT_ENABLED) ?
-			       "enabled" : "disabled");
-		}
-		break;
-
-	case ACPI_MADT_TYPE_IO_APIC:
-		{
-			const struct acpi_madt_io_apic *p =
-			    container_of(header, const struct acpi_madt_io_apic, header);
-
-			printk(KERN_INFO PREFIX
-			       "IOAPIC (id[0x%02x] address[0x%08x] gsi_base[%d])\n",
-			       p->id, p->address, p->global_irq_base);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_INTERRUPT_OVERRIDE:
-		{
-			const struct acpi_madt_interrupt_override *p =
-			    container_of(header, const struct acpi_madt_interrupt_override, header);
-
-			printk(KERN_INFO PREFIX
-			       "INT_SRC_OVR (bus %d bus_irq %d global_irq %d %s %s)\n",
-			       p->bus, p->source_irq, p->global_irq,
-			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
-			       mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2]);
-			if (p->inti_flags  &
-			    ~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK))
-				printk(KERN_INFO PREFIX
-				       "INT_SRC_OVR unexpected reserved flags: %#x\n",
-				       p->inti_flags  &
-					~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK));
-
-		}
-		break;
-
-	case ACPI_MADT_TYPE_NMI_SOURCE:
-		{
-			const struct acpi_madt_nmi_source *p =
-			    container_of(header, const struct acpi_madt_nmi_source, header);
-
-			printk(KERN_INFO PREFIX
-			       "NMI_SRC (%s %s global_irq %d)\n",
-			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
-			       mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
-			       p->global_irq);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_LOCAL_APIC_NMI:
-		if (opt_acpi_verbose)
-		{
-			const struct acpi_madt_local_apic_nmi *p =
-			    container_of(header, const struct acpi_madt_local_apic_nmi, header);
-
-			printk(KERN_INFO PREFIX
-			       "LAPIC_NMI (acpi_id[0x%02x] %s %s lint[%#x])\n",
-			       p->processor_id,
-			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK	],
-			       mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
-			       p->lint);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_LOCAL_X2APIC_NMI:
-		if (opt_acpi_verbose)
-		{
-			const struct acpi_madt_local_x2apic_nmi *p =
-			    container_of(header, const struct acpi_madt_local_x2apic_nmi, header);
-			unsigned int polarity = MASK_EXTR(p->inti_flags, ACPI_MADT_POLARITY_MASK);
-			unsigned int trigger = MASK_EXTR(p->inti_flags, ACPI_MADT_TRIGGER_MASK);
-
-			printk(KERN_INFO PREFIX
-			       "X2APIC_NMI (uid[0x%02x] %s %s lint[%#x])\n",
-			       p->uid,
-			       mps_inti_flags_polarity[polarity],
-			       mps_inti_flags_trigger[trigger],
-			       p->lint);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_LOCAL_APIC_OVERRIDE:
-		{
-			const struct acpi_madt_local_apic_override *p =
-			    container_of(header, const struct acpi_madt_local_apic_override, header);
-
-			printk(KERN_INFO PREFIX
-			       "LAPIC_ADDR_OVR (address[%p])\n",
-			       (void *)(unsigned long)p->address);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_IO_SAPIC:
-		{
-			const struct acpi_madt_io_sapic *p =
-			    container_of(header, const struct acpi_madt_io_sapic, header);
-
-			printk(KERN_INFO PREFIX
-			       "IOSAPIC (id[%#x] address[%p] gsi_base[%d])\n",
-			       p->id, (void *)(unsigned long)p->address,
-			       p->global_irq_base);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_LOCAL_SAPIC:
-		if (opt_acpi_verbose)
-		{
-			const struct acpi_madt_local_sapic *p =
-			    container_of(header, const struct acpi_madt_local_sapic, header);
-
-			printk(KERN_INFO PREFIX
-			       "LSAPIC (acpi_id[0x%02x] lsapic_id[0x%02x] lsapic_eid[0x%02x] %s)\n",
-			       p->processor_id, p->id, p->eid,
-			       (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
-		}
-		break;
-
-	case ACPI_MADT_TYPE_INTERRUPT_SOURCE:
-		{
-			const struct acpi_madt_interrupt_source *p =
-			    container_of(header, const struct acpi_madt_interrupt_source, header);
-
-			printk(KERN_INFO PREFIX
-			       "PLAT_INT_SRC (%s %s type[%#x] id[0x%04x] eid[%#x] iosapic_vector[%#x] global_irq[%#x]\n",
-			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
-			       mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
-			       p->type, p->id, p->eid, p->io_sapic_vector,
-			       p->global_irq);
-		}
-		break;
-
-	case ACPI_MADT_TYPE_GENERIC_INTERRUPT:
-		{
-			struct acpi_madt_generic_interrupt *p =
-				container_of(header, struct acpi_madt_generic_interrupt, header);
-
-			printk(KERN_DEBUG PREFIX
-			       "GICC (acpi_id[0x%04x] address[0x%"PRIx64"] MPIDR[0x%"PRIx64"] %s)\n",
-			       p->uid, p->base_address,
-			       p->arm_mpidr,
-			       (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
-
-		}
-		break;
-
-	case ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR:
-		{
-			struct acpi_madt_generic_distributor *p =
-				container_of(header, struct acpi_madt_generic_distributor, header);
-
-			printk(KERN_DEBUG PREFIX
-			       "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d])\n",
-			       p->gic_id, p->base_address,
-			       p->global_irq_base);
-		}
-		break;
-
-	default:
-		printk(KERN_WARNING PREFIX
-		       "Found unsupported MADT entry (type = %#x)\n",
-		       header->type);
-		break;
-	}
+    if ( !header )
+        return;
+
+    switch ( header->type )
+    {
+    case ACPI_MADT_TYPE_LOCAL_APIC:
+        if ( opt_acpi_verbose )
+        {
+            const struct acpi_madt_local_apic *p =
+                container_of(header, const struct acpi_madt_local_apic, header);
+
+            printk(KERN_INFO PREFIX
+                   "LAPIC (acpi_id[0x%02x] lapic_id[0x%02x] %s)\n",
+                   p->processor_id,
+                   p->id,
+                   (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled"
+                                                        : "disabled");
+        }
+        break;
+
+    case ACPI_MADT_TYPE_LOCAL_X2APIC:
+        if ( opt_acpi_verbose )
+        {
+            const struct acpi_madt_local_x2apic *p =
+                container_of(header,
+                             const struct acpi_madt_local_x2apic,
+                             header);
+
+            printk(KERN_INFO PREFIX "X2APIC (apic_id[0x%02x] uid[0x%02x] %s)\n",
+                   p->local_apic_id,
+                   p->uid,
+                   (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled"
+                                                        : "disabled");
+        }
+        break;
+
+    case ACPI_MADT_TYPE_IO_APIC:
+    {
+        const struct acpi_madt_io_apic *p =
+            container_of(header, const struct acpi_madt_io_apic, header);
+
+        printk(KERN_INFO PREFIX
+               "IOAPIC (id[0x%02x] address[0x%08x] gsi_base[%d])\n",
+               p->id,
+               p->address,
+               p->global_irq_base);
+    }
+    break;
+
+    case ACPI_MADT_TYPE_INTERRUPT_OVERRIDE:
+    {
+        const struct acpi_madt_interrupt_override *p =
+            container_of(header,
+                         const struct acpi_madt_interrupt_override,
+                         header);
+
+        printk(KERN_INFO PREFIX
+               "INT_SRC_OVR (bus %d bus_irq %d global_irq %d %s %s)\n",
+               p->bus,
+               p->source_irq,
+               p->global_irq,
+               mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
+               mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >>
+                                      2]);
+        if ( p->inti_flags &
+             ~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK) )
+            printk(KERN_INFO PREFIX
+                   "INT_SRC_OVR unexpected reserved flags: %#x\n",
+                   p->inti_flags &
+                       ~(ACPI_MADT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK));
+    }
+    break;
+
+    case ACPI_MADT_TYPE_NMI_SOURCE:
+    {
+        const struct acpi_madt_nmi_source *p =
+            container_of(header, const struct acpi_madt_nmi_source, header);
+
+        printk(KERN_INFO PREFIX "NMI_SRC (%s %s global_irq %d)\n",
+               mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
+               mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >>
+                                      2],
+               p->global_irq);
+    }
+    break;
+
+    case ACPI_MADT_TYPE_LOCAL_APIC_NMI:
+        if ( opt_acpi_verbose )
+        {
+            const struct acpi_madt_local_apic_nmi *p =
+                container_of(header,
+                             const struct acpi_madt_local_apic_nmi,
+                             header);
+
+            printk(
+                KERN_INFO PREFIX
+                "LAPIC_NMI (acpi_id[0x%02x] %s %s lint[%#x])\n",
+                p->processor_id,
+                mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
+                mps_inti_flags_trigger
+                    [(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
+                p->lint);
+        }
+        break;
+
+    case ACPI_MADT_TYPE_LOCAL_X2APIC_NMI:
+        if ( opt_acpi_verbose )
+        {
+            const struct acpi_madt_local_x2apic_nmi *p =
+                container_of(header,
+                             const struct acpi_madt_local_x2apic_nmi,
+                             header);
+            unsigned int polarity = MASK_EXTR(p->inti_flags,
+                                              ACPI_MADT_POLARITY_MASK);
+            unsigned int trigger = MASK_EXTR(p->inti_flags,
+                                             ACPI_MADT_TRIGGER_MASK);
+
+            printk(KERN_INFO PREFIX
+                   "X2APIC_NMI (uid[0x%02x] %s %s lint[%#x])\n",
+                   p->uid,
+                   mps_inti_flags_polarity[polarity],
+                   mps_inti_flags_trigger[trigger],
+                   p->lint);
+        }
+        break;
+
+    case ACPI_MADT_TYPE_LOCAL_APIC_OVERRIDE:
+    {
+        const struct acpi_madt_local_apic_override *p =
+            container_of(header,
+                         const struct acpi_madt_local_apic_override,
+                         header);
+
+        printk(KERN_INFO PREFIX "LAPIC_ADDR_OVR (address[%p])\n",
+               (void *)(unsigned long)p->address);
+    }
+    break;
+
+    case ACPI_MADT_TYPE_IO_SAPIC:
+    {
+        const struct acpi_madt_io_sapic *p =
+            container_of(header, const struct acpi_madt_io_sapic, header);
+
+        printk(KERN_INFO PREFIX "IOSAPIC (id[%#x] address[%p] gsi_base[%d])\n",
+               p->id,
+               (void *)(unsigned long)p->address,
+               p->global_irq_base);
+    }
+    break;
+
+    case ACPI_MADT_TYPE_LOCAL_SAPIC:
+        if ( opt_acpi_verbose )
+        {
+            const struct acpi_madt_local_sapic *p =
+                container_of(header,
+                             const struct acpi_madt_local_sapic,
+                             header);
+
+            printk(
+                KERN_INFO PREFIX
+                "LSAPIC (acpi_id[0x%02x] lsapic_id[0x%02x] lsapic_eid[0x%02x] %s)\n",
+                p->processor_id,
+                p->id,
+                p->eid,
+                (p->lapic_flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+        }
+        break;
+
+    case ACPI_MADT_TYPE_INTERRUPT_SOURCE:
+    {
+        const struct acpi_madt_interrupt_source *p =
+            container_of(header,
+                         const struct acpi_madt_interrupt_source,
+                         header);
+
+        printk(
+            KERN_INFO PREFIX
+            "PLAT_INT_SRC (%s %s type[%#x] id[0x%04x] eid[%#x] iosapic_vector[%#x] global_irq[%#x]\n",
+            mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
+            mps_inti_flags_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >>
+                                   2],
+            p->type,
+            p->id,
+            p->eid,
+            p->io_sapic_vector,
+            p->global_irq);
+    }
+    break;
+
+    case ACPI_MADT_TYPE_GENERIC_INTERRUPT:
+    {
+        struct acpi_madt_generic_interrupt *p =
+            container_of(header, struct acpi_madt_generic_interrupt, header);
+
+        printk(KERN_DEBUG PREFIX "GICC (acpi_id[0x%04x] address[0x%" PRIx64
+                                 "] MPIDR[0x%" PRIx64 "] %s)\n",
+               p->uid,
+               p->base_address,
+               p->arm_mpidr,
+               (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+    }
+    break;
+
+    case ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR:
+    {
+        struct acpi_madt_generic_distributor *p =
+            container_of(header, struct acpi_madt_generic_distributor, header);
+
+        printk(KERN_DEBUG PREFIX
+               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
+               "] gsi_base[%d])\n",
+               p->gic_id,
+               p->base_address,
+               p->global_irq_base);
+    }
+    break;
+
+    default:
+        printk(KERN_WARNING PREFIX
+               "Found unsupported MADT entry (type = %#x)\n",
+               header->type);
+        break;
+    }
 }
 
-static struct acpi_subtable_header * __init
+static struct acpi_subtable_header *__init
 acpi_get_entry(const char *id, unsigned long table_size,
-	       const struct acpi_table_header *table_header,
-	       enum acpi_madt_type entry_id, unsigned int entry_index)
+               const struct acpi_table_header *table_header,
+               enum acpi_madt_type entry_id, unsigned int entry_index)
 {
-	struct acpi_subtable_header *entry;
-	int count = 0;
-	unsigned long table_end;
-
-	if (!table_size)
-		return NULL;
-
-	if (!table_header) {
-		printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
-		return NULL;
-	}
-
-	table_end = (unsigned long)table_header + table_header->length;
-
-	/* Parse all entries looking for a match. */
-	entry = (void *)table_header + table_size;
-
-	while ((unsigned long)(entry + 1) < table_end) {
-		if (entry->length < sizeof(*entry)) {
-			printk(KERN_ERR PREFIX "[%4.4s:%#x] Invalid length\n",
-			       id, entry_id);
-			return NULL;
-		}
-
-		if (entry->type == entry_id) {
-			if (count == entry_index)
-				return entry;
-			count++;
-		}
-
-		entry = (void *)entry + entry->length;
-	}
-
-	return NULL;
+    struct acpi_subtable_header *entry;
+    int count = 0;
+    unsigned long table_end;
+
+    if ( !table_size )
+        return NULL;
+
+    if ( !table_header )
+    {
+        printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
+        return NULL;
+    }
+
+    table_end = (unsigned long)table_header + table_header->length;
+
+    /* Parse all entries looking for a match. */
+    entry = (void *)table_header + table_size;
+
+    while ( (unsigned long)(entry + 1) < table_end )
+    {
+        if ( entry->length < sizeof(*entry) )
+        {
+            printk(KERN_ERR PREFIX "[%4.4s:%#x] Invalid length\n",
+                   id,
+                   entry_id);
+            return NULL;
+        }
+
+        if ( entry->type == entry_id )
+        {
+            if ( count == entry_index )
+                return entry;
+            count++;
+        }
+
+        entry = (void *)entry + entry->length;
+    }
+
+    return NULL;
 }
 
-struct acpi_subtable_header * __init
+struct acpi_subtable_header *__init
 acpi_table_get_entry_madt(enum acpi_madt_type entry_id,
-			  unsigned int entry_index)
+                          unsigned int entry_index)
 {
-	struct acpi_table_header *table_header;
-	acpi_status status;
-
-	status = acpi_get_table(ACPI_SIG_MADT, acpi_apic_instance,
-				&table_header);
-	if (ACPI_FAILURE(status)) {
-		printk(KERN_WARNING PREFIX "%4.4s not present\n",
-		       ACPI_SIG_MADT);
-		return NULL;
-	}
-
-	return acpi_get_entry(ACPI_SIG_MADT, sizeof(struct acpi_table_madt),
-			      table_header, entry_id, entry_index);
+    struct acpi_table_header *table_header;
+    acpi_status status;
+
+    status = acpi_get_table(ACPI_SIG_MADT, acpi_apic_instance, &table_header);
+    if ( ACPI_FAILURE(status) )
+    {
+        printk(KERN_WARNING PREFIX "%4.4s not present\n", ACPI_SIG_MADT);
+        return NULL;
+    }
+
+    return acpi_get_entry(ACPI_SIG_MADT,
+                          sizeof(struct acpi_table_madt),
+                          table_header,
+                          entry_id,
+                          entry_index);
 }
 
-int __init
-acpi_parse_entries(const char *id, unsigned long table_size,
-		   acpi_table_entry_handler handler,
-		   struct acpi_table_header *table_header,
-		   int entry_id, unsigned int max_entries)
+int __init acpi_parse_entries(const char *id, unsigned long table_size,
+                              acpi_table_entry_handler handler,
+                              struct acpi_table_header *table_header,
+                              int entry_id, unsigned int max_entries)
 {
-	struct acpi_subtable_header *entry;
-	int count = 0;
-	unsigned long table_end;
-
-	if (acpi_disabled)
-		return -ENODEV;
-
-	if (!id || !handler)
-		return -EINVAL;
-
-	if (!table_size)
-		return -EINVAL;
-
-	if (!table_header) {
-		printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
-		return -ENODEV;
-	}
-
-	table_end = (unsigned long)table_header + table_header->length;
-
-	/* Parse all entries looking for a match. */
-
-	entry = (struct acpi_subtable_header *)
-	    ((unsigned long)table_header + table_size);
-
-	while (((unsigned long)entry) + sizeof(struct acpi_subtable_header) <
-	       table_end) {
-		if (entry->length < sizeof(*entry)) {
-			printk(KERN_ERR PREFIX "[%4.4s:%#x] Invalid length\n",
-			       id, entry_id);
-			return -ENODATA;
-		}
-
-		if (entry->type == entry_id
-		    && (!max_entries || count < max_entries)) {
-			if (handler(entry, table_end))
-				return -EINVAL;
-
-			count++;
-		}
-
-		entry = (struct acpi_subtable_header *)
-		    ((unsigned long)entry + entry->length);
-	}
-
-	if (max_entries && count > max_entries) {
-		printk(KERN_WARNING PREFIX "[%4.4s:%#x] ignored %i entries of "
-		       "%i found\n", id, entry_id, count - max_entries, count);
-	}
-
-	return count;
+    struct acpi_subtable_header *entry;
+    int count = 0;
+    unsigned long table_end;
+
+    if ( acpi_disabled )
+        return -ENODEV;
+
+    if ( !id || !handler )
+        return -EINVAL;
+
+    if ( !table_size )
+        return -EINVAL;
+
+    if ( !table_header )
+    {
+        printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
+        return -ENODEV;
+    }
+
+    table_end = (unsigned long)table_header + table_header->length;
+
+    /* Parse all entries looking for a match. */
+
+    entry = (struct acpi_subtable_header *)((unsigned long)table_header +
+                                            table_size);
+
+    while ( ((unsigned long)entry) + sizeof(struct acpi_subtable_header) <
+            table_end )
+    {
+        if ( entry->length < sizeof(*entry) )
+        {
+            printk(KERN_ERR PREFIX "[%4.4s:%#x] Invalid length\n",
+                   id,
+                   entry_id);
+            return -ENODATA;
+        }
+
+        if ( entry->type == entry_id && (!max_entries || count < max_entries) )
+        {
+            if ( handler(entry, table_end) )
+                return -EINVAL;
+
+            count++;
+        }
+
+        entry = (struct acpi_subtable_header *)((unsigned long)entry +
+                                                entry->length);
+    }
+
+    if ( max_entries && count > max_entries )
+    {
+        printk(KERN_WARNING PREFIX
+               "[%4.4s:%#x] ignored %i entries of " "%i found\n",
+               id,
+               entry_id,
+               count - max_entries,
+               count);
+    }
+
+    return count;
 }
 
-int __init
-acpi_table_parse_entries(const char *id,
-			 unsigned long table_size,
-			 int entry_id,
-			 acpi_table_entry_handler handler,
-			 unsigned int max_entries)
+int __init acpi_table_parse_entries(const char *id, unsigned long table_size,
+                                    int entry_id,
+                                    acpi_table_entry_handler handler,
+                                    unsigned int max_entries)
 {
-	struct acpi_table_header *table_header = NULL;
-	u32 instance = 0;
-
-	if (acpi_disabled)
-		return -ENODEV;
-
-	if (!id || !handler)
-		return -EINVAL;
-
-	if (!strncmp(id, ACPI_SIG_MADT, 4))
-		instance = acpi_apic_instance;
-
-	acpi_get_table(id, instance, &table_header);
-	if (!table_header) {
-		printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
-		return -ENODEV;
-	}
-
-	return acpi_parse_entries(id, table_size, handler, table_header,
-				  entry_id, max_entries);
+    struct acpi_table_header *table_header = NULL;
+    u32 instance = 0;
+
+    if ( acpi_disabled )
+        return -ENODEV;
+
+    if ( !id || !handler )
+        return -EINVAL;
+
+    if ( !strncmp(id, ACPI_SIG_MADT, 4) )
+        instance = acpi_apic_instance;
+
+    acpi_get_table(id, instance, &table_header);
+    if ( !table_header )
+    {
+        printk(KERN_WARNING PREFIX "%4.4s not present\n", id);
+        return -ENODEV;
+    }
+
+    return acpi_parse_entries(id,
+                              table_size,
+                              handler,
+                              table_header,
+                              entry_id,
+                              max_entries);
 }
 
-int __init
-acpi_table_parse_madt(enum acpi_madt_type id,
-		      acpi_table_entry_handler handler, unsigned int max_entries)
+int __init acpi_table_parse_madt(enum acpi_madt_type id,
+                                 acpi_table_entry_handler handler,
+                                 unsigned int max_entries)
 {
-	return acpi_table_parse_entries(ACPI_SIG_MADT,
-					    sizeof(struct acpi_table_madt), id,
-					    handler, max_entries);
+    return acpi_table_parse_entries(ACPI_SIG_MADT,
+                                    sizeof(struct acpi_table_madt),
+                                    id,
+                                    handler,
+                                    max_entries);
 }
 
 /**
@@ -407,23 +464,25 @@ acpi_table_parse_madt(enum acpi_madt_type id,
  */
 int __init acpi_table_parse(const char *id, acpi_table_handler handler)
 {
-	struct acpi_table_header *table = NULL;
+    struct acpi_table_header *table = NULL;
 
-	if (acpi_disabled)
-		return -ENODEV;
+    if ( acpi_disabled )
+        return -ENODEV;
 
-	if (!handler)
-		return -EINVAL;
+    if ( !handler )
+        return -EINVAL;
 
-	if (strncmp(id, ACPI_SIG_MADT, 4) == 0)
-		acpi_get_table(id, acpi_apic_instance, &table);
-	else
-		acpi_get_table(id, 0, &table);
+    if ( strncmp(id, ACPI_SIG_MADT, 4) == 0 )
+        acpi_get_table(id, acpi_apic_instance, &table);
+    else
+        acpi_get_table(id, 0, &table);
 
-	if (table) {
-		return handler(table);
-	} else
-		return -ENODEV;
+    if ( table )
+    {
+        return handler(table);
+    }
+    else
+        return -ENODEV;
 }
 
 /* 
@@ -433,22 +492,23 @@ int __init acpi_table_parse(const char *id, acpi_table_handler handler)
  */
 static void __init check_multiple_madt(void)
 {
-	struct acpi_table_header *table = NULL;
-
-	acpi_get_table(ACPI_SIG_MADT, 2, &table);
-	if (table) {
-		printk(KERN_WARNING PREFIX
-		       "BIOS bug: multiple APIC/MADT found,"
-		       " using %d\n", acpi_apic_instance);
-		printk(KERN_WARNING PREFIX
-		       "If \"acpi_apic_instance=%d\" works better, "
-		       "notify linux-acpi@vger.kernel.org\n",
-		       acpi_apic_instance ? 0 : 2);
-
-	} else
-		acpi_apic_instance = 0;
-
-	return;
+    struct acpi_table_header *table = NULL;
+
+    acpi_get_table(ACPI_SIG_MADT, 2, &table);
+    if ( table )
+    {
+        printk(KERN_WARNING PREFIX
+               "BIOS bug: multiple APIC/MADT found," " using %d\n",
+               acpi_apic_instance);
+        printk(
+            KERN_WARNING PREFIX
+            "If \"acpi_apic_instance=%d\" works better, " "notify linux-acpi@vger.kernel.org\n",
+            acpi_apic_instance ? 0 : 2);
+    }
+    else
+        acpi_apic_instance = 0;
+
+    return;
 }
 
 /*
@@ -462,25 +522,26 @@ static void __init check_multiple_madt(void)
 
 int __init acpi_table_init(void)
 {
-	acpi_status status;
+    acpi_status status;
 
-	status = acpi_initialize_tables(NULL, ACPI_MAX_TABLES, 0);
-	if (ACPI_FAILURE(status))
-		return -EINVAL;
+    status = acpi_initialize_tables(NULL, ACPI_MAX_TABLES, 0);
+    if ( ACPI_FAILURE(status) )
+        return -EINVAL;
 
-	check_multiple_madt();
-	return 0;
+    check_multiple_madt();
+    return 0;
 }
 
 static int __init cf_check acpi_parse_apic_instance(const char *str)
 {
-	const char *q;
+    const char *q;
 
-	acpi_apic_instance = simple_strtoul(str, &q, 0);
+    acpi_apic_instance = simple_strtoul(str, &q, 0);
 
-	printk(KERN_NOTICE PREFIX "Shall use APIC/MADT table %d\n",
-	       acpi_apic_instance);
+    printk(KERN_NOTICE PREFIX "Shall use APIC/MADT table %d\n",
+           acpi_apic_instance);
 
-	return *q ? -EINVAL : 0;
+    return *q ? -EINVAL : 0;
 }
+
 custom_param("acpi_apic_instance", acpi_parse_apic_instance);
-- 
2.25.1


