Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856069170E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748024.1155583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVo-0000RL-G0; Tue, 25 Jun 2024 19:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748024.1155583; Tue, 25 Jun 2024 19:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVo-0000Oj-Ca; Tue, 25 Jun 2024 19:07:28 +0000
Received: by outflank-mailman (input) for mailman id 748024;
 Tue, 25 Jun 2024 19:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVm-0000O1-RK
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 278146f7-3326-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 21:07:24 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a724b9b34b0so339742966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:21 -0700 (PDT)
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
X-Inumbo-ID: 278146f7-3326-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342442; x=1719947242; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi3l57Ho1pUmbNMNe9NHaEbiwxfjL48pmKM7zQN1k2o=;
        b=lYdTahKGt635gTcgZBqAPehk9FdZXCcADV/lGlyDj9lzHWm+4JTmdGtG2g3F+SKQS9
         nNeDACwd8HGF3HyvYCVqOsSfhYVppa+l/cJdN2BElc+VR2hyQ0g82+kksHFNXnZ6yeYj
         Rf1hpcb/WaXifpwLdnj1H8xfZaO/EHG7P1G+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342442; x=1719947242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi3l57Ho1pUmbNMNe9NHaEbiwxfjL48pmKM7zQN1k2o=;
        b=Cra9gL8fa6xP0muFLvxUyrH7RcCNgKcry8Y6zXbApulnz6zSJQyBLlgncAMLHiCA7f
         SsDpj3TJkOuLUFb3OE8vtFmKlLiUvAzT5OxPgivZUY9jkJqlhkiOfE+YqmYja6TDHkn6
         8xhYSCyQRPjIDE2XVH2peB0PD7QfQwzaNl1RVFVDb/SqZZqreMVgTYCtM+0yxl5ptXLc
         w16lejgz0tV6ZA0bFR2iE4maRgKRlUzDZTC9nu2o+bAYb8FfZ6wkb4IPkKSjR3guwams
         vLIVEQEav4IyS9fgVM1o4F5/LqDnMvLEJGpc9FMQNyGjdOmrln+RuiwnXw3D6nhJmZAy
         eZTA==
X-Gm-Message-State: AOJu0YzbJgjRIZMyY9hzbJKN7ouH/hL12wyELhVHf37RE225xqyacFff
	BYMcpRbpZ2hGU9c+NaMVN2p/5hbEloj39mRv7+BfpP4g3kWtbyu497a7azrmG2lYYoGNzSN4wE4
	4ubU=
X-Google-Smtp-Source: AGHT+IEd3SHDA5f778vCgNNEnjYw+yhpd1jw+f+ZXJu1RKSDoaW7l41vRWxVF3RD3nt1F64w90ZD6Q==
X-Received: by 2002:a17:907:c815:b0:a72:5226:3307 with SMTP id a640c23a62f3a-a7252263ff9mr539077266b.57.1719342442485;
        Tue, 25 Jun 2024 12:07:22 -0700 (PDT)
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
Subject: [PATCH 1/6] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more efficient
Date: Tue, 25 Jun 2024 20:07:14 +0100
Message-Id: <20240625190719.788643-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
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

The main purpose of this is to get rid of for_each_set_bit().

Full side-by-side diff:
  https://termbin.com/5wsb

The first loop ends up being unrolled identically, although there's 64bit movs
to reload 0 for the xchg which is definitely suboptimal.  Opencoding
asm ("xchg") without a memory clobber gets to 32bit movs which is an
improvement but no ideal.  However I didn't fancy going that far.

Also, the entirety of pi_desc is embedded in struct vcpu, which means when
we're executing in Xen, the prefetcher is going to be stealing it back from
the IOMMU all the time.  This is a datastructure which really should *not* be
adjacent to all the other misc data in the vcpu.
---
 xen/arch/x86/hvm/vmx/vmx.c | 61 +++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f16faa6a615c..948ad48a4757 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2321,18 +2321,63 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 
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
+     * The PIR is a contended cacheline which bounces between the CPU and
+     * IOMMU.  The IOMMU updates the entire PIR atomically, but we can't
+     * express the same on the CPU side, so care has to be taken.
+     *
+     * First, do a plain read of ON.  If the PIR hasn't been modified, this
+     * will keep the cacheline Shared and not pull it Excusive on the CPU.
+     */
+    if ( !pi_test_on(desc) )
         return;
 
-    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
-        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
+    /*
+     * Second, if the plain read said that ON was set, we must clear it with
+     * an atomic action.  This will bring the cachline to Exclusive on the
+     * CPU.
+     *
+     * This should always succeed because noone else should be playing with
+     * the PIR behind our back, but assert so just in case.
+     */
+    on = pi_test_and_clear_on(desc);
+    ASSERT(on);
 
-    for_each_set_bit(i, pending_intr, X86_NR_VECTORS)
-        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
+    /*
+     * The cacheline is now Exclusive on the CPU, and the IOMMU has indicated
+     * (via ON being set) thatat least one vector is pending too.  Atomically
+     * read and clear the entire pending bitmap as fast as we, to reduce the
+     * window that the IOMMU may steal the cacheline back from us.
+     *
+     * It is a performance concern, but not a correctness concern.  If the
+     * IOMMU does steal the cacheline back, we'll just wait to get it back
+     * again.
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
+
+        asm ( "lock or %[val], %[irr]"
+              : [irr] "+m" (irr[i * 0x10])
+              : [val] "r" (vec._32[i]) );
+    }
 }
 
 static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
-- 
2.39.2


