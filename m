Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3436A4F16C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 00:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901567.1309530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpbcr-0008SB-Pl; Tue, 04 Mar 2025 23:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901567.1309530; Tue, 04 Mar 2025 23:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpbcr-0008Pk-N3; Tue, 04 Mar 2025 23:24:37 +0000
Received: by outflank-mailman (input) for mailman id 901567;
 Tue, 04 Mar 2025 23:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpbcp-0008Pb-HW
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 23:24:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d178a513-f94f-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 00:24:28 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bccfa7b89so9221935e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 15:24:28 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc743f649sm69782295e9.27.2025.03.04.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 15:24:26 -0800 (PST)
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
X-Inumbo-ID: d178a513-f94f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741130668; x=1741735468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJn0EOtoOspWkZsAezbXT11JWUNWguHtx31jBY0thn4=;
        b=mTZtBY75IqtVe5SS1QU1j+wSWfkRD2oVWW3GvQyAEK931EhQWLmDOK21gkzUoyRIBD
         yKXJcrxAnYRbanZfkwWXk4EpaYnXxsf8NgZE2zn+FonGFxbineYI6yYUk8SoslmjXEQC
         SpON7B8cKpXpUSJAAtnGXSnoynO3Pt8HUGFOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741130668; x=1741735468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJn0EOtoOspWkZsAezbXT11JWUNWguHtx31jBY0thn4=;
        b=QenLbGxPaFm6dprdNHfUbbAIS4wGsdMF9BuDL0WnGGLLufjBJKdoAtveKNvBWJkIA6
         8A/aS/ac7Q3KJOz9c19TYXtCM6cRvISFJ2nRcQ8LQIIAAEXvsilGurp5BrOu7j7vYNUD
         iDhssyjIazzpv1txAoveyGcer6VFRc1TsEJlxE/93PGL14VBZcP+6GzcEEXvFBKAeJHS
         iALkBkcjqzWzELUBJZ4vDYXAhbPk6GFyBf+NjywPdWb1yDcckHjTJj8wGeZzGEPGZcrd
         tsKGxNcZr7B/mR9cAzVDsc2W+JFIE2ypTTi98wtxEZ7RRkP+SoIoz7ZUmJLFCP+l2/2L
         6GZQ==
X-Gm-Message-State: AOJu0YxOeroBI0+viA+4vntBnZ/zTQRCC+1mtea9SutLNEauA6399OKt
	ifkE8yCk1rKAp7OM63kJSkiDWiCSdkoEY/HU8e5Mz1bS0t8bFUe6eRmywB+75aRiBFDfLZ9o6RX
	R
X-Gm-Gg: ASbGncu+w7tsTu0wgA3mHTg0IOBfgwQhTqP5Lu/a6DYBaxfLzWdOtqKy3T3ItGCDuEc
	/oFdpVoxE9eYuUkihMr38sWZywEtO4jujMqUYOqIfu6JU2dlnuj1KfKKRIxP3q6M2HHdoJI6ukB
	A+KfNrQsG/kGDiFA3zdfa81nfKJQjlKvHF9JWAluRWcq3TY7UPnh2pqfR09qs8YsTeh44aIQHt0
	zHvt13olcOAKcbi8rR4N2JCva7/lrtQ+lZsiKo4IEhCceZqnP9YGkmTnBvovtqcj2ZaOLDasKEt
	2DjKlSAbTzd1sWc0SM4pQ66tYFps94UwdsbF4IOdEltOLSguRDX9eXad8ry9aNHi4M1aTD05zEF
	32DzpKZmRjrVz29qR0fF+Lqsw
X-Google-Smtp-Source: AGHT+IH6ijEY9Azzf7yI2+Rd59Gh6QiVd2RZ4Z/TpleD+eKUy8kM4RUwHVOHP8f1uuqYh69fH+6r1w==
X-Received: by 2002:a05:600c:510f:b0:439:9537:e96b with SMTP id 5b1f17b1804b1-43bd29bced0mr4272965e9.14.1741130667643;
        Tue, 04 Mar 2025 15:24:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more efficient
Date: Tue,  4 Mar 2025 23:22:18 +0000
Message-Id: <20250304232218.2768344-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
the CPU and dirties it even if there's nothing outstanding, but the final
bitmap_for_each() is O(256) when O(8) would do, and would avoid multiple
atomic updates to the same IRR word.

Rewrite it from scratch, explaining what's going on at each step.

Bloat-o-meter reports 177 -> 145 (net -32), but real improvement is the
removal of calls to __find_{first,next}_bit() hidden behind bitmap_for_each().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1699791518

v3:
 * Fix IRR scatter address calculation
 * Spelling/Grammar improvements
v2:
 * Extend the comments
---
 xen/arch/x86/hvm/vmx/vmx.c | 70 +++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d87da427ade1..ab881d6f8c42 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2314,18 +2314,72 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 
 static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
 {
-    struct vlapic *vlapic = vcpu_vlapic(v);
-    unsigned int group, i;
-    DECLARE_BITMAP(pending_intr, X86_IDT_VECTORS);
+    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
+    union {
+        unsigned long _ul[X86_IDT_VECTORS / BITS_PER_LONG];
+        uint32_t      _32[X86_IDT_VECTORS / (sizeof(uint32_t) * 8)];
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
+     * will keep the cacheline Shared and not pull it Exclusive on the current
+     * CPU.
+     */
+    if ( !pi_test_on(desc) )
         return;
 
-    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
-        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
+    /*
+     * Second, if the plain read said that ON was set, we must clear it with
+     * an atomic action.  This will bring the cacheline to Exclusive on the
+     * current CPU.
+     *
+     * This should always succeed because no-one else should be playing with
+     * the PIR behind our back, but assert so just in case.
+     */
+    on = pi_test_and_clear_on(desc);
+    ASSERT(on);
+
+    /*
+     * The cacheline will have become Exclusive on the current CPU, and
+     * because ON was set, some other entity (an IOMMU, or Xen on another CPU)
+     * has indicated that the PIR needs re-scanning.
+     *
+     * Note: Entities which can't update the entire cacheline atomically
+     *       (i.e. Xen on another CPU) are required to update PIR first, then
+     *       set ON.  Therefore, there is a corner case where we may have
+     *       found and processed the PIR updates "last time around" and only
+     *       found ON this time around.  This is fine; the logic still
+     *       operates correctly.
+     *
+     * Atomically read and clear the entire pending bitmap as fast as we can,
+     * to reduce the window where another entity may steal the cacheline back
+     * from us.  This is a performance concern, not a correctness concern; if
+     * another entity does steal the cacheline, we'll just wait for it to
+     * return.
+     */
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._ul); ++i )
+        vec._ul[i] = xchg(&desc->pir[i], 0);
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
 
-    bitmap_for_each ( i, pending_intr, X86_IDT_VECTORS )
-        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
+        asm ( "lock or %[val], %[irr]"
+              : [irr] "+m" (irr[i * 4])
+              : [val] "r" (vec._32[i]) );
+    }
 }
 
 static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
-- 
2.39.5


