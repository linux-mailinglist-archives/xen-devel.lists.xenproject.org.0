Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A09A380B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 10:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821658.1235573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1i25-00013u-ML; Fri, 18 Oct 2024 08:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821658.1235573; Fri, 18 Oct 2024 08:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1i25-00011k-Iy; Fri, 18 Oct 2024 08:08:25 +0000
Received: by outflank-mailman (input) for mailman id 821658;
 Fri, 18 Oct 2024 08:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i1V=RO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t1i24-00011d-GI
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 08:08:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244a80c8-8d28-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 10:08:22 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c9625cfe4dso2210806a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 01:08:22 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68bf7669sm61338066b.171.2024.10.18.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 01:08:20 -0700 (PDT)
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
X-Inumbo-ID: 244a80c8-8d28-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729238901; x=1729843701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWO0FmBLFHJZH9jt972i/jtzdUO5iTIlLeJ7XupzTFg=;
        b=sYwylxeXq1S/z1Xlx0uXQKN+LTUcdtm+jR7eeITAmGEC8Fe6oimTKXJ0IHLOsdJRU6
         5rxEuKmNTmJLgt2sXOMRCjnRoVnITOj9bpbu0BcRDGb+0s4X0i1HyYwDQUORqqBb6Jta
         WiBE58DJUv7WChzvCZpZeM38EnWM6s9eztNvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729238901; x=1729843701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWO0FmBLFHJZH9jt972i/jtzdUO5iTIlLeJ7XupzTFg=;
        b=UE5+6OZ3BMy0osQ3Z6ud37SYB4GZQNt4kj3eOO/n7Xl3emrIXrzGt9Z1URf+FfxXhZ
         mpnkEOL7Av7vjBDW8tpW57F9axvBfDM7ygcIT6wS11JvZY8F34Bv2cx+CaV0xo76eR4N
         fobpv82C49p0iBv1s3L1w0nt9K9hHvjgW4CegJb6SDWbkmmW+TEZjWPr82gjUBZabz4w
         BjH8b42AKiNe3Cb75tHcvXfeCzG5NqtA72Dr35WIz94jNohSUg2oUpQKzNiOip6FWv+l
         UqrZiCd5mgcm64bpqF49qPJL/8rSrc4LNeBHdSYD4F2Jq4e+9AuOwKGbx5pdYrUZk2+m
         Xt4A==
X-Gm-Message-State: AOJu0Yy0Vg0GwDzTDbw5z6lyS367NPP2Wains01cugIymdDs9V7yutTs
	Z97IinLfkN6S/q9utzraiKI1IVpSILJWnc6XASkIeNpjqLdCoceO5Exj6oMNYiW0M4tFTUyUIRm
	B
X-Google-Smtp-Source: AGHT+IF+jgDYwQM9HweZrGlbsiGa6znuoD6fPzkUgdsAhPubJQJ3h9X8ir+y0rKvW08wm/Qc3I6TIQ==
X-Received: by 2002:a17:907:7f87:b0:a9a:41c6:1d34 with SMTP id a640c23a62f3a-a9a69a66b40mr125532466b.21.1729238900579;
        Fri, 18 Oct 2024 01:08:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt remapping
Date: Fri, 18 Oct 2024 10:08:13 +0200
Message-ID: <20241018080813.45759-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
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
 xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e40d2f7dbd75..8856eb29d275 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
 
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
+ */
+static unsigned int **apic_pin_eoi;
+
 static void share_vector_maps(unsigned int src, unsigned int dst)
 {
     unsigned int pin;
@@ -273,6 +289,13 @@ void __ioapic_write_entry(
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        /*
+         * Might be called before apic_pin_eoi is allocated.  Entry will be
+         * updated once the array is allocated and there's an EOI or write
+         * against the pin.
+         */
+        if ( apic_pin_eoi )
+            apic_pin_eoi[apic][pin] = e.vector;
     }
     else
         iommu_update_ire_from_apic(apic, pin, e.raw);
@@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
     /* Prefer the use of the EOI register if available */
     if ( ioapic_has_eoi_reg(apic) )
     {
+        if ( apic_pin_eoi )
+            vector = apic_pin_eoi[apic][pin];
+
         /* If vector is unknown, read it from the IO-APIC */
         if ( vector == IRQ_VECTOR_UNASSIGNED )
+        {
             vector = __ioapic_read_entry(apic, pin, true).vector;
+            if ( apic_pin_eoi )
+                /* Update cached value so further EOI don't need to fetch it. */
+                apic_pin_eoi[apic][pin] = vector;
+        }
 
         *(IO_APIC_BASE(apic)+16) = vector;
     }
@@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
 
     apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
 
+    if ( iommu_intremap )
+    {
+        apic_pin_eoi = xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics);
+        BUG_ON(!apic_pin_eoi);
+    }
+
     for (apic = 0; apic < nr_ioapics; apic++) {
+        if ( iommu_intremap )
+        {
+            apic_pin_eoi[apic] = xmalloc_array(typeof(**apic_pin_eoi),
+                                               nr_ioapic_entries[apic]);
+            BUG_ON(!apic_pin_eoi[apic]);
+
+            for ( pin = 0; pin < nr_ioapic_entries[apic]; pin++ )
+                apic_pin_eoi[apic][pin] = IRQ_VECTOR_UNASSIGNED;
+        }
+
         for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
             /*
              * add it to the IO-APIC irq-routing table:
-- 
2.46.0


