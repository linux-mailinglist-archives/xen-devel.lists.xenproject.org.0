Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C04F9AEB05
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825460.1239689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4055-0007KP-LQ; Thu, 24 Oct 2024 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825460.1239689; Thu, 24 Oct 2024 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4055-0007I7-IH; Thu, 24 Oct 2024 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 825460;
 Thu, 24 Oct 2024 15:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAxk=RU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t4054-0007Hz-2m
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:48:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79cdbc6b-921f-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 17:48:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso131438766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 08:48:56 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91598f11sm632275766b.193.2024.10.24.08.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 08:48:54 -0700 (PDT)
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
X-Inumbo-ID: 79cdbc6b-921f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729784935; x=1730389735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlP7lw2ONsl7bRLNlv3YWePSjv/4K3vFG/1/1cHtx+s=;
        b=fZTdUC9CQ1WVklXGb4NqGvQLVcKl3dU0vdH0pExS2UjyCL0bcD6VsnGLVTjyKhRuHU
         ujbsVBwng4/A6urNzyHcWeX5PetuM3dWoyixk6c0CNE/dOP03sfinZKaRoqq2lllybkU
         amy8SXqxL5yGGiN5emzQ+c+CLLLoqZm5FR388=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784935; x=1730389735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlP7lw2ONsl7bRLNlv3YWePSjv/4K3vFG/1/1cHtx+s=;
        b=BOBSnktFwYZsgTQnrBPFCAThhLpl4/tCtaZk7aRTTqdlG4fr1azBB1zUOUl6EKc8CT
         oObeFiYAZZsDOo5MgP61S6iHOERGp7vWjBEjyPTiSSmoW3pHssRThukY8QKPW1PQ1NWf
         jJ9pdW0INsbCmRzkO01ySjVuB0zo+KyuPdjwGohH45iRecvOJli9dYTPgwBVeK/ctZa6
         gIbrz3Ch/uUyJnSHQwZnaPs8XdlPx/NU5sgcuPAwDkekkRf3Y6cTrPX9UtVKXmJPYPUh
         xZ6z0LpyTPEZJH5euKw2Ny+D5/RINRmYuBiMuKBjwIaCcYcuesEy5gJ3X/0uRvtuSwgY
         f/KQ==
X-Gm-Message-State: AOJu0YwbL2/a7eIaL7X4BK3Pqx67wuJS5h9T+iGGlbE4sCUC6nT5/J+K
	NVYUnZRlyRV0N5wiZDGPwBDPKsZ3FqHYosJSgb4ZfoUeIrOKCFoc253v2sSAQzUyGH1RCwaduWy
	J
X-Google-Smtp-Source: AGHT+IHID7dLKQqhXr2eMpBAMzkmGLcY1ZYpk9S1NupJKVozmgu04MsJiLxgAuJ4E9PhYYc+8zdH0Q==
X-Received: by 2002:a17:906:f592:b0:a9a:a891:b43e with SMTP id a640c23a62f3a-a9ad28158e1mr243753466b.50.1729784934884;
        Thu, 24 Oct 2024 08:48:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi interrupt remapping
Date: Thu, 24 Oct 2024 16:48:44 +0100
Message-ID: <20241024154844.8652-1-roger.pau@citrix.com>
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
Changes since v1:
 - s/apic_pin_eoi/io_apic_pin_eoi/.
 - Expand comment about io_apic_pin_eoi usage and layout.
 - Use uint8_t instead of unsigned int as array type.
 - Do not use a sentinel value.
---
 xen/arch/x86/io_apic.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e40d2f7dbd75..e3cdfab6359a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
 
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
+ * The matrix is accessed as [#io-apic][#pin].
+ */
+static uint8_t **io_apic_pin_eoi;
+
 static void share_vector_maps(unsigned int src, unsigned int dst)
 {
     unsigned int pin;
@@ -273,6 +291,13 @@ void __ioapic_write_entry(
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
@@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
     /* Prefer the use of the EOI register if available */
     if ( ioapic_has_eoi_reg(apic) )
     {
+        if ( io_apic_pin_eoi )
+            vector = io_apic_pin_eoi[apic][pin];
+
         /* If vector is unknown, read it from the IO-APIC */
         if ( vector == IRQ_VECTOR_UNASSIGNED )
             vector = __ioapic_read_entry(apic, pin, true).vector;
@@ -1022,7 +1050,20 @@ static void __init setup_IO_APIC_irqs(void)
 
     apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
 
+    if ( iommu_intremap )
+    {
+        io_apic_pin_eoi = xzalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
+        BUG_ON(!io_apic_pin_eoi);
+    }
+
     for (apic = 0; apic < nr_ioapics; apic++) {
+        if ( iommu_intremap )
+        {
+            io_apic_pin_eoi[apic] = xzalloc_array(typeof(**io_apic_pin_eoi),
+                                                  nr_ioapic_entries[apic]);
+            BUG_ON(!io_apic_pin_eoi[apic]);
+        }
+
         for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
             /*
              * add it to the IO-APIC irq-routing table:
-- 
2.46.0


