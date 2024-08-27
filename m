Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C10960CC2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784071.1193468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhr-0004wK-Un; Tue, 27 Aug 2024 13:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784071.1193468; Tue, 27 Aug 2024 13:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhr-0004tL-PX; Tue, 27 Aug 2024 13:57:59 +0000
Received: by outflank-mailman (input) for mailman id 784071;
 Tue, 27 Aug 2024 13:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwhq-00047p-4h
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d3fa71f-647c-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:57:57 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso700694466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:57 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm113898966b.173.2024.08.27.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:57:55 -0700 (PDT)
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
X-Inumbo-ID: 5d3fa71f-647c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767076; x=1725371876; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onbkRJjonSldeX+TKHvWoalIHglLaxnF1KDpl/v4wiA=;
        b=uT8enpQLoIrW8DSrhlqvctPlFAqWtGJTBIKzU71f/nDyntq2WNJZ7P/CP9qehyD9aV
         wbljrgpk+YhLg38EVpJrbG0n29+BYGMb4o8YEeNEt+ypHA80jhLu+j1gHNPwantqntOO
         BBrocgVovvIqUgzQ1m0f+QO02ztjRdxUH/HsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767076; x=1725371876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onbkRJjonSldeX+TKHvWoalIHglLaxnF1KDpl/v4wiA=;
        b=TvVdn/g1X/JlsZNnfuuwGzYJh7bBL9ImJsYQxaqAU5XwI9+gJLMl9uNe7d8GqIeTu2
         XYh1C0ru8iP+crKR1wshdIYmmGAq2qbbCj2EZwtrBdp/hve94NG7Btpnvq2bCJtIebLs
         PdsfDl7jqeMzjZF30khSzJqPHY4gAFWtTlVHnqrOiqRK/F3tNIRx4VEAPp2IhFOLZquJ
         1T2bDzrukgsVcJ7JuHEPVoOf1DhK2EIZlbqCJSbErBxPBkK+I7Za1sNlYbIpJmHRbbjP
         3O2yQhAQuqTwkoIlBCV0sycdgxuYiVT94UOLNdFN3JfkqrD+yh+PvIpLWrf/PL7v81C6
         G18Q==
X-Gm-Message-State: AOJu0YzFst2ANLV8wnjMGsnuEa+BL3L6IKsw69Erk4w7j6aL1IUeRGXQ
	LwywPqkW2vr6m7lQG6pooCvbznI7K0PVDhsMBtMTxDsb9+PKFGeQTIIwfi8h+No3EUN3PtWEz6/
	K
X-Google-Smtp-Source: AGHT+IH7hZ1uEw4kAXnd6m6eSnLzFwncr1ABIEpVvj5g0O6NferXHSInSooeNemWXtI/6AQO/5hpRg==
X-Received: by 2002:a17:907:6d0f:b0:a86:7e7f:69ab with SMTP id a640c23a62f3a-a86a52b367emr931155566b.15.1724767076098;
        Tue, 27 Aug 2024 06:57:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 4/4] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more efficient
Date: Tue, 27 Aug 2024 14:57:46 +0100
Message-Id: <20240827135746.1908070-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
the CPU and dirties it even if there's nothing outstanding, but the final
for_each_set_bit() is O(256) when O(8) would do, and would avoid multiple
atomic updates to the same IRR word.

Rewrite it from scratch, explaining what's going on at each step.

Bloat-o-meter reports 177 -> 145 (net -32), but the better aspect is the
removal calls to __find_{first,next}_bit() hidden behind for_each_set_bit().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The main purpose of this is to get rid of bitmap_for_each().

v2:
 * Extend the comments
---
 xen/arch/x86/hvm/vmx/vmx.c | 70 +++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 12f8a66458db..1baed7e816c4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2317,18 +2317,72 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 
 static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
 {
-    struct vlapic *vlapic = vcpu_vlapic(v);
-    unsigned int group, i;
-    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
+    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
+    union {
+        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];
+        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
+    } vec;
+    uint32_t *irr;
+    bool on;
 
-    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
+    /*
+     * The PIR is a contended cacheline which bounces between the CPU(s) and
+     * IOMMU(s).  An IOMMU updates the entire PIR atomically, but we can't
+     * express the same on the CPU side, so care has to be taken.
+     *
+     * First, do a plain read of ON.  If the PIR hasn't been modified, this
+     * will keep the cacheline Shared and not pull it Excusive on the current
+     * CPU.
+     */
+    if ( !pi_test_on(desc) )
         return;
 
-    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
-        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
+    /*
+     * Second, if the plain read said that ON was set, we must clear it with
+     * an atomic action.  This will bring the cachline to Exclusive on the
+     * current CPU.
+     *
+     * This should always succeed because noone else should be playing with
+     * the PIR behind our back, but assert so just in case.
+     */
+    on = pi_test_and_clear_on(desc);
+    ASSERT(on);
+
+    /*
+     * The cacheline is now Exclusive on the current CPU, and because ON was
+     * set, some other entity (an IOMMU, or Xen on another CPU) has indicated
+     * that at PIR needs re-scanning.
+     *
+     * Note: Entities which can't update the entire cacheline atomically
+     *       (i.e. Xen on another CPU) are required to update PIR first, then
+     *       set ON.  Therefore, there is a corner case where we may have
+     *       found and processed the PIR updates "last time around" and only
+     *       found ON this time around.  This is fine; the logic still
+     *       operates correctly.
+     *
+     * Atomically read and clear the entire pending bitmap as fast as we, to
+     * reduce the window where another entity may steal the cacheline back
+     * from us.  This is a performance concern, not a correctness concern.  If
+     * the another entity does steal the cacheline back, we'll just wait to
+     * get it back again.
+     */
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
+        vec._64[i] = xchg(&desc->pir[i], 0);
+
+    /*
+     * Finally, merge the pending vectors into IRR.  The IRR register is
+     * scattered in memory, so we have to do this 32 bits at a time.
+     */
+    irr = (uint32_t *)&vcpu_vlapic(v)->regs->data[APIC_IRR];
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._32); ++i )
+    {
+        if ( !vec._32[i] )
+            continue;
 
-    bitmap_for_each ( i, pending_intr, X86_NR_VECTORS )
-        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
+        asm ( "lock or %[val], %[irr]"
+              : [irr] "+m" (irr[i * 0x10])
+              : [val] "r" (vec._32[i]) );
+    }
 }
 
 static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
-- 
2.39.2


