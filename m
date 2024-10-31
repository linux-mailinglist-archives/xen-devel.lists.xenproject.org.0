Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC79B76ED
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 09:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828482.1243371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Qzd-0004Gh-20; Thu, 31 Oct 2024 08:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828482.1243371; Thu, 31 Oct 2024 08:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Qzc-0004EK-VR; Thu, 31 Oct 2024 08:57:24 +0000
Received: by outflank-mailman (input) for mailman id 828482;
 Thu, 31 Oct 2024 08:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XIyL=R3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t6Qzb-0004EE-L7
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 08:57:23 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 229626d4-9766-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 09:57:19 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so976856a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 01:57:19 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56645dcbsm43101266b.177.2024.10.31.01.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 01:57:18 -0700 (PDT)
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
X-Inumbo-ID: 229626d4-9766-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyOTYyNmQ0LTk3NjYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY1MDM5LjYyMTIxNSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730365039; x=1730969839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uizCbIY2s+221YKyswHMeA/NQsRqfyL2z9npNMZBLs=;
        b=CyOC8RWGuIHxNX7nYU+rjhkjHQRcB8KpcP4GWokakMhCTm8ZZhsRig6f7Y/FBHJ0yO
         qyCfz+1DjkqmtowKIRDhhtqN/KM2I0LxxNKNg56t2rlnAH+3pRdEqq0+df0pkiVgFb9G
         tcKyiq/EJtVd0Ts5HDCHhrwEAwvFO5e8g6LCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730365039; x=1730969839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uizCbIY2s+221YKyswHMeA/NQsRqfyL2z9npNMZBLs=;
        b=Fh1m0h7D1VMmt1PMzVB6vIwvNRORwEMAIyUI+RrRjBxHy6MoIO2RY4JZxeN8GpwDM8
         CuIjnqEkOown6GAprE7WXyBy3TB4sVRQ2Q9pKYsr4Z2zAb503oroenyIjzg8fisePJK+
         e2dXdWDKpYy2sNA0YD8dzyvtIOvySCmpPn6b4q8mi9NQ2w0VUHM/czZoQKOVPdvuR6eI
         EGcQl0ujwuwadTaaJhfKnktyROKvNlFlXpNXT755hkiXAjYbCE08WBEu8qlKlDjkuQ7w
         0X1UNFlImN9EVB/A80GUq01zqTkH7UCfs3KZ5EJ8G+wO9al1Cab00kdYlvUoKZcJyUya
         SIpw==
X-Gm-Message-State: AOJu0Ywz6+et33T76VnIHmTlIZTYARDXh7/glvtA7pnkGp55K5B6fZY+
	JFRpSfNIqHut5PojVlOS/w0J6K88qivGf+TTR/90GoMqWdKPHk7hs5hnjnkaZoB3znjd4nIwe17
	U
X-Google-Smtp-Source: AGHT+IE5P3Oc9RQt3z9HwuijyhXGCE0M0uw/3AfDk+hylBvDGef/9D3D7SXdf0BNoeM5at29INqNNQ==
X-Received: by 2002:a17:907:970a:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9de5d8690amr1839220466b.26.1730365038748;
        Thu, 31 Oct 2024 01:57:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v4] x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping
Date: Thu, 31 Oct 2024 09:57:13 +0100
Message-ID: <20241031085713.6156-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using AMD-Vi interrupt remapping the vector field in the IO-APIC RTE is
repurposed to contain part of the offset into the remapping table.  Previous to
2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
table would match the vector.  Such logic was mandatory for end of interrupt to
work, since the vector field (even when not containing a vector) is used by the
IO-APIC to find for which pin the EOI must be performed.

A simple solution wold be to read the IO-APIC RTE each time an EOI is to be
performed, so the raw value of the vector field can be obtained.  However
that's likely to perform poorly.  Instead introduce a cache to store the
EOI handles when using interrupt remapping, so that the IO-APIC driver can
translate pins into EOI handles without having to read the IO-APIC RTE entry.
Note that to simplify the logic such cache is used unconditionally when
interrupt remapping is enabled, even if strictly it would only be required
for AMD-Vi.

Reported-by: Willi Junga <xenproject@ymy.be>
Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Remove the usage of a sentinel value (again).
 - Allocate an initialize the cache in enable_IO_APIC().
 - Fix MISRA compliance.
 - Use xvmalloc.

Changes since v2:
 - Restore sentinel value.

Changes since v1:
 - s/apic_pin_eoi/io_apic_pin_eoi/.
 - Expand comment about io_apic_pin_eoi usage and layout.
 - Use uint8_t instead of unsigned int as array type.
 - Do not use a sentinel value.
---
 xen/arch/x86/io_apic.c | 76 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e40d2f7dbd75..4e5ee2b890a0 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -29,6 +29,7 @@
 #include <xen/acpi.h>
 #include <xen/keyhandler.h>
 #include <xen/softirq.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
@@ -71,6 +72,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
 
 static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
 
+/*
+ * Store the EOI handle when using interrupt remapping.
+ *
+ * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
+ * format repurposes the vector field to store the offset into the Interrupt
+ * Remap table.  This breaks directed EOI, as the CPU vector no longer matches
+ * the contents of the RTE vector field.  Add a translation cache so that
+ * directed EOI uses the value in the RTE vector field when interrupt remapping
+ * is enabled.
+ *
+ * Intel VT-d Xen code still stores the CPU vector in the RTE vector field when
+ * using the remapped format, but use the translation cache uniformly in order
+ * to avoid extra logic to differentiate between VT-d and AMD-Vi.
+ *
+ * The matrix is accessed as [#io-apic][#pin].
+ */
+static uint8_t **io_apic_pin_eoi;
+
 static void share_vector_maps(unsigned int src, unsigned int dst)
 {
     unsigned int pin;
@@ -273,6 +292,17 @@ void __ioapic_write_entry(
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        /*
+         * Might be called before io_apic_pin_eoi is allocated.  Entry will be
+         * initialized to the RTE value once the cache is allocated.
+         *
+         * The vector field is only cached for raw RTE writes when using IR.
+         * In that case the vector field might have been repurposed to store
+         * something different than the CPU vector, and hence need to be cached
+         * for performing EOI.
+         */
+        if ( io_apic_pin_eoi )
+            io_apic_pin_eoi[apic][pin] = e.vector;
     }
     else
         iommu_update_ire_from_apic(apic, pin, e.raw);
@@ -288,18 +318,36 @@ static void ioapic_write_entry(
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
 
-/* EOI an IO-APIC entry.  Vector may be -1, indicating that it should be
+/*
+ * EOI an IO-APIC entry.  Vector may be -1, indicating that it should be
  * worked out using the pin.  This function expects that the ioapic_lock is
  * being held, and interrupts are disabled (or there is a good reason not
  * to), and that if both pin and vector are passed, that they refer to the
- * same redirection entry in the IO-APIC. */
+ * same redirection entry in the IO-APIC.
+ *
+ * If using Interrupt Remapping the vector is always ignored because the RTE
+ * remapping format might have repurposed the vector field and a cached value
+ * of the EOI handle to use is obtained based on the provided apic and pin
+ * values.
+ */
 static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int pin)
 {
     /* Prefer the use of the EOI register if available */
     if ( ioapic_has_eoi_reg(apic) )
     {
-        /* If vector is unknown, read it from the IO-APIC */
-        if ( vector == IRQ_VECTOR_UNASSIGNED )
+        if ( io_apic_pin_eoi )
+            /*
+             * If the EOI handle is cached use it. When using AMD-Vi IR the CPU
+             * vector no longer matches the vector field in the RTE, because
+             * the RTE remapping format repurposes the field.
+             *
+             * The value in the RTE vector field must always be used to signal
+             * which RTE to EOI, hence use the cached value which always
+             * mirrors the contents of the raw RTE vector field.
+             */
+            vector = io_apic_pin_eoi[apic][pin];
+        else if ( vector == IRQ_VECTOR_UNASSIGNED )
+             /* If vector is unknown, read it from the IO-APIC */
             vector = __ioapic_read_entry(apic, pin, true).vector;
 
         *(IO_APIC_BASE(apic)+16) = vector;
@@ -1317,12 +1365,30 @@ void __init enable_IO_APIC(void)
             vector_map[apic] = vector_map[0];
     }
 
+    if ( iommu_intremap != iommu_intremap_off )
+    {
+        io_apic_pin_eoi = xvmalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
+        BUG_ON(!io_apic_pin_eoi);
+    }
+
     for(apic = 0; apic < nr_ioapics; apic++) {
         int pin;
-        /* See if any of the pins is in ExtINT mode */
+
+        if ( io_apic_pin_eoi )
+        {
+            io_apic_pin_eoi[apic] = xvmalloc_array(typeof(**io_apic_pin_eoi),
+                                                   nr_ioapic_entries[apic]);
+            BUG_ON(!io_apic_pin_eoi[apic]);
+        }
+
+        /* See if any of the pins is in ExtINT mode and cache EOI handle */
         for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
             struct IO_APIC_route_entry entry = ioapic_read_entry(apic, pin, false);
 
+            if ( io_apic_pin_eoi )
+                io_apic_pin_eoi[apic][pin] =
+                    ioapic_read_entry(apic, pin, true).vector;
+
             /* If the interrupt line is enabled and in ExtInt mode
              * I have found the pin where the i8259 is connected.
              */
-- 
2.46.0


