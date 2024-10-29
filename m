Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE399B47B8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 12:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827268.1241842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5k18-0000qo-7G; Tue, 29 Oct 2024 11:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827268.1241842; Tue, 29 Oct 2024 11:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5k18-0000oT-4A; Tue, 29 Oct 2024 11:04:06 +0000
Received: by outflank-mailman (input) for mailman id 827268;
 Tue, 29 Oct 2024 11:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5k16-0000oN-2b
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 11:04:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fd901d8-95e5-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 12:03:59 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so857382166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 04:03:59 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3099df78sm462206966b.158.2024.10.29.04.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 04:03:58 -0700 (PDT)
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
X-Inumbo-ID: 7fd901d8-95e5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdmZDkwMWQ4LTk1ZTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk5ODM5Ljg0NjQzMSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730199838; x=1730804638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehkKqYBk4MDvgwnpI93uQoFn9xEAxJww89i0qH27hW0=;
        b=q6YQyMPZJoiIYnUZTTsJa9dE52e0RJ3NkFk1tD0+yVyFLHhg53ll1J70UsBv2uPNIW
         urbaXe+Jdj9KaWX9zMKoLHi3tZfH+0s7fJi01HVKPgfLvKvpiokUW0tkDxnGOl6z2wVW
         Q6J7t+/upAakuuz0aZYca1uMc6w95iEf6Kqwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199838; x=1730804638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehkKqYBk4MDvgwnpI93uQoFn9xEAxJww89i0qH27hW0=;
        b=ZqgMKX8cNNTGvmKaD3J1E2hx30D6ZjAAkRTDuhecTVckG3gLRcl1c9bzKHxC8gRcxX
         IAL+Yy+tGgq1l6SLOBifCAzaUSW8sDyi4evSJ9p1KtLfDJqF2scW9tkdKwinNB8VeQ82
         T1WLiVnl70GkV3EQB5uglssgwcIENsTf149hF2XoYREp9ky7TnSNB/vDhabR0deG2tYs
         EOa5iCB9Grs1dKC5UgWEPw/OZFvtlKKzkLTapomfZHRL4rivpB0dML2mle8FAeDx4pHk
         B0TjM2ZiBHDwfEUUEcE5me/kUQe/iO47kbOBkyS8uycdhbh3SYFyH6jwzEWjFzQ9rjNv
         zGJA==
X-Gm-Message-State: AOJu0YxqjJP5QZBSfC48VdK0a+Y4PXWo0TNveHzXqsxTW+1vGIKrLH/j
	n5sTCEqBfdK3JPO96wTlG1PGEHApM7XJ2Cm4Xv+qWz/DOy7zOxeXjYaqz3Ya3UfTSsLdRo2YXRj
	P
X-Google-Smtp-Source: AGHT+IGmoevBLiXOgTdNpRm3nv6CVTujK9wbyEQ72ynO4U16KmRzecDh3M7EkUGKRdpYDA7HDLr3tA==
X-Received: by 2002:a17:907:728e:b0:a99:389a:63c2 with SMTP id a640c23a62f3a-a9de61997d9mr1118591466b.62.1730199838328;
        Tue, 29 Oct 2024 04:03:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping
Date: Tue, 29 Oct 2024 12:03:51 +0100
Message-ID: <20241029110351.40531-1-roger.pau@citrix.com>
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

Introduce a table to store the EOI handlers when using interrupt remapping, so
that the IO-APIC driver can translate pins into EOI handlers without having to
read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
unconditionally when interrupt remapping is enabled, even if strictly it would
only be required for AMD-Vi.

Reported-by: Willi Junga <xenproject@ymy.be>
Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Restore sentinel value.

Changes since v1:
 - s/apic_pin_eoi/io_apic_pin_eoi/.
 - Expand comment about io_apic_pin_eoi usage and layout.
 - Use uint8_t instead of unsigned int as array type.
 - Do not use a sentinel value.
---
 xen/arch/x86/io_apic.c | 56 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e40d2f7dbd75..64ba1c8d3da7 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -71,6 +71,26 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
 
 static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
 
+/*
+ * Store the EOI handle when using interrupt remapping.
+ *
+ * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
+ * format repurposes the vector field to store the offset into the Interrupt
+ * Remap table.  This causes directed EOI to longer work, as the CPU vector no
+ * longer matches the contents of the RTE vector field.  Add a translation
+ * table so that directed EOI uses the value in the RTE vector field when
+ * interrupt remapping is enabled.
+ *
+ * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
+ * when using the remapped format, but use the translation table uniformly in
+ * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
+ *
+ * The matrix is accessed as [#io-apic][#pin].  Note the field needs to handle
+ * the range [-1, 255], as -1 (IRQ_VECTOR_UNASSIGNED) is used as a sentinel to
+ * signal there's no cached value.
+ */
+static short **io_apic_pin_eoi;
+
 static void share_vector_maps(unsigned int src, unsigned int dst)
 {
     unsigned int pin;
@@ -273,6 +293,13 @@ void __ioapic_write_entry(
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        /*
+         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
+         * Entry will be updated once the array is allocated and there's a
+         * write against the pin.
+         */
+        if ( io_apic_pin_eoi )
+            io_apic_pin_eoi[apic][pin] = e.vector;
     }
     else
         iommu_update_ire_from_apic(apic, pin, e.raw);
@@ -298,9 +325,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
     /* Prefer the use of the EOI register if available */
     if ( ioapic_has_eoi_reg(apic) )
     {
+        if ( io_apic_pin_eoi )
+            vector = io_apic_pin_eoi[apic][pin];
+
         /* If vector is unknown, read it from the IO-APIC */
         if ( vector == IRQ_VECTOR_UNASSIGNED )
+        {
             vector = __ioapic_read_entry(apic, pin, true).vector;
+            if ( io_apic_pin_eoi )
+                /* Update cached value so further EOI don't need to fetch it. */
+                io_apic_pin_eoi[apic][pin] = vector;
+        }
 
         *(IO_APIC_BASE(apic)+16) = vector;
     }
@@ -1022,8 +1057,27 @@ static void __init setup_IO_APIC_irqs(void)
 
     apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
 
+    if ( iommu_intremap )
+    {
+        io_apic_pin_eoi = xmalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
+        BUG_ON(!io_apic_pin_eoi);
+    }
+
     for (apic = 0; apic < nr_ioapics; apic++) {
-        for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
+        const unsigned int nr_entries = nr_ioapic_entries[apic];
+
+        if ( iommu_intremap )
+        {
+            io_apic_pin_eoi[apic] = xmalloc_array(typeof(**io_apic_pin_eoi),
+                                                  nr_entries);
+            BUG_ON(!io_apic_pin_eoi[apic]);
+
+            for ( pin = 0; pin < nr_entries; pin++ )
+                io_apic_pin_eoi[apic][pin] = IRQ_VECTOR_UNASSIGNED;
+        }
+
+        for ( pin = 0; pin < nr_entries; pin++ )
+        {
             /*
              * add it to the IO-APIC irq-routing table:
              */
-- 
2.46.0


