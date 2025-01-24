Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5EA1B512
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876704.1287075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINI-00087F-90; Fri, 24 Jan 2025 12:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876704.1287075; Fri, 24 Jan 2025 12:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINI-00084Y-5M; Fri, 24 Jan 2025 12:01:24 +0000
Received: by outflank-mailman (input) for mailman id 876704;
 Fri, 24 Jan 2025 12:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbING-0007hy-Qr
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:22 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed9c120f-da4a-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 13:01:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab65fca99b6so392579566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e67814sm118162466b.74.2025.01.24.04.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:20 -0800 (PST)
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
X-Inumbo-ID: ed9c120f-da4a-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720081; x=1738324881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNc8xqr1uTUQn8IFfYe+22YL6fG0Xco7Sp/pdjdKu1o=;
        b=BOgD76sXrIjdPlAVicXZKECEDeobRT174WkCZNqU3w3O7+wlzTlhrl2hr2Q3wHCQ+q
         ksTdXdK43RNc3lsJLTRcqlxlF2S67j+fc81S6ocGwXQiRGeXYC1kShbxzEhv1I3/QUzS
         EYu61ElByuQo9KxVDwmw1UKazAjUcMhz9v8D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720081; x=1738324881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNc8xqr1uTUQn8IFfYe+22YL6fG0Xco7Sp/pdjdKu1o=;
        b=N4b4sSuDzrQaTBho+Drp19mebo1X0IwIIz2Lkh7pbdKfyS9dfntMYXHQLNBvvPB3ir
         F8CgS67J49vRdTaXTWIhWDz39+Af9ydeMG4PSba2sVcT+sCJNVt5rVOrDLxd7wRDH0e4
         E+HkW9OJt66CqrQmlQ2I35v4yVzI7aBa7dY/FKQbLY6uIozPmEzGy3zfBAM2bEBgruIm
         fhTcGt0+UDBvlL5n0iCzshoWY+Heb4jx99zinZR8bCG2neRbwk1gxhDXiD0cXb8ol/dQ
         AuwGcBzglBa1GQ+zKLt9IQY6D9eiN2phKyjWZ3bnNZekA+EpB/saXCsmIs45LThSbYWr
         K7bg==
X-Gm-Message-State: AOJu0YwtXRn3Xc4O78JdHwVEHfahgVhF3eIYAJSSOG0aOQ1fsUBD8QaK
	1SlBBKi7LHHrlPZXwlLTwJAW7Br2Fqqygv1PkxAdbeKvGsyTD/YM9ASE///f8lePSYR+iVptgAh
	J
X-Gm-Gg: ASbGncsSRaxuxtgpPEiIFKQQ5prBU4/bQHVaqhNpZ+iuNga1Z4ls7OSVaR+Tc71iber
	LRSh1KYcR6Zs+jZqsXRLO67c91D50ua+XImLW9Y42NxOUkR7RJImQXFhUWrTCeUrDoInuNj3iOO
	SeO57DDQ5MTFPe0pYoUw3iD64U2Lf68ZSQ9c3H1qze2Ys7rKJZuvDPaDV4c/7m3QKnER9lc/S3r
	/kXC4pC1RHRVUSC2XViVIZ09gB8vXzHBZner162KwVJ+5IU5z9mQfMTFk6epPwu+7K+MWYtaXQM
	MN/9Z6Qe1eRu20k=
X-Google-Smtp-Source: AGHT+IFO3YfpnhWTuhY7pxWYDKGiB6uFLIA/iTPiVnXhamCt+AM7SEGZvi8MUKHqQXMNGwtAo2YyZg==
X-Received: by 2002:a17:907:940b:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-ab38b1e651bmr2558293466b.7.1737720080876;
        Fri, 24 Jan 2025 04:01:20 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/5] iommu/vtd: remove non-CX16 logic from interrupt remapping
Date: Fri, 24 Jan 2025 13:01:08 +0100
Message-ID: <20250124120112.56678-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teddy Astie <teddy.astie@vates.tech>

As CX16 support is mandatory for IOMMU usage, the checks for CX16 in the
interrupt remapping code are stale.  Remove them together with the
associated code introduced in case CX16 was not available.

Note that AMD-Vi support for atomically updating a 128bit IRTE entry is
still not implemented, it will be done by further changes.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/intremap.c | 75 +++++---------------------
 1 file changed, 14 insertions(+), 61 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 233db5cb64de..820616a8de93 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -184,49 +184,26 @@ bool __init cf_check intel_iommu_supports_eim(void)
 
 /*
  * Assume iremap_lock has been acquired. It is to make sure software will not
- * change the same IRTE behind us. With this assumption, if only high qword or
- * low qword in IRTE is to be updated, this function's atomic variant can
- * present an atomic update to VT-d hardware even when cmpxchg16b
- * instruction is not supported.
+ * change the same IRTE behind us.
  */
 static void update_irte(struct vtd_iommu *iommu, struct iremap_entry *entry,
                         const struct iremap_entry *new_ire, bool atomic)
 {
-    ASSERT(spin_is_locked(&iommu->intremap.lock));
+    __uint128_t ret;
+    struct iremap_entry old_ire;
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t ret;
-        struct iremap_entry old_ire;
+    ASSERT(spin_is_locked(&iommu->intremap.lock));
 
-        old_ire = *entry;
-        ret = cmpxchg16b(entry, &old_ire, new_ire);
+    old_ire = *entry;
+    ret = cmpxchg16b(entry, &old_ire, new_ire);
 
-        /*
-         * In the above, we use cmpxchg16 to atomically update the 128-bit
-         * IRTE, and the hardware cannot update the IRTE behind us, so
-         * the return value of cmpxchg16 should be the same as old_ire.
-         * This ASSERT validate it.
-         */
-        ASSERT(ret == old_ire.val);
-    }
-    else
-    {
-        /*
-         * VT-d hardware doesn't update IRTEs behind us, nor the software
-         * since we hold iremap_lock. If the caller wants VT-d hardware to
-         * always see a consistent entry, but we can't meet it, a bug will
-         * be raised.
-         */
-        if ( entry->lo == new_ire->lo )
-            write_atomic(&entry->hi, new_ire->hi);
-        else if ( entry->hi == new_ire->hi )
-            write_atomic(&entry->lo, new_ire->lo);
-        else if ( !atomic )
-            *entry = *new_ire;
-        else
-            BUG();
-    }
+    /*
+     * In the above, we use cmpxchg16 to atomically update the 128-bit
+     * IRTE, and the hardware cannot update the IRTE behind us, so
+     * the return value of cmpxchg16 should be the same as old_ire.
+     * This ASSERT validate it.
+     */
+    ASSERT(ret == old_ire.val);
 }
 
 /* Mark specified intr remap entry as free */
@@ -408,7 +385,6 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     /* Indicate remap format. */
     remap_rte->format = 1;
 
-    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
     update_irte(iommu, iremap_entry, &new_ire, !init && !masked);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
@@ -447,38 +423,15 @@ void cf_check io_apic_write_remap_rte(
 {
     struct IO_xAPIC_route_entry old_rte = {}, new_rte;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-    bool masked = true;
     int rc;
 
-    if ( !cpu_has_cx16 )
-    {
-       /*
-        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
-        * avoid interrupts seeing an inconsistent IRTE entry.
-        */
-        old_rte = __ioapic_read_entry(apic, pin, true);
-        if ( !old_rte.mask )
-        {
-            masked = false;
-            old_rte.mask = 1;
-            __ioapic_write_entry(apic, pin, true, old_rte);
-        }
-    }
-
     /* Not the initializer, for old gcc to cope. */
     new_rte.raw = rte;
 
     rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
     if ( rc )
-    {
-        if ( !masked )
-        {
-            /* Recover the original value of 'mask' bit */
-            old_rte.mask = 0;
-            __ioapic_write_entry(apic, pin, true, old_rte);
-        }
         return;
-    }
+
     /* old_rte will contain the updated IO-APIC RTE on success. */
     __ioapic_write_entry(apic, pin, true, old_rte);
 }
-- 
2.46.0


