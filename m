Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCC1C4E2C
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 08:17:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVqsH-0001up-Pl; Tue, 05 May 2020 06:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVqsG-0001uk-5q
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 06:16:12 +0000
X-Inumbo-ID: ea2236aa-8e97-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2236aa-8e97-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 06:16:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BDCBAC85;
 Tue,  5 May 2020 06:16:12 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/PV: remove unnecessary toggle_guest_pt() overhead
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
Date: Tue, 5 May 2020 08:16:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
expensive (but still needed only for the toggle_guest_mode() path), the
effect of the latter on the exit-to-guest path is not insignificant.
Move the logic into toggle_guest_mode(), on the basis that
toggle_guest_pt() will always be invoked in pairs, yet we can't safely
undo the setting of root_pgt_changed during the second of these
invocations.

While at it, add a comment ahead of toggle_guest_pt() to clarify its
intended usage.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Add comment ahead of toggle_guest_pt().
v2: Extend description.

--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -393,18 +393,10 @@ bool __init xpti_pcid_enabled(void)
 
 static void _toggle_guest_pt(struct vcpu *v)
 {
-    const struct domain *d = v->domain;
-    struct cpu_info *cpu_info = get_cpu_info();
     unsigned long cr3;
 
     v->arch.flags ^= TF_kernel_mode;
     update_cr3(v);
-    if ( d->arch.pv.xpti )
-    {
-        cpu_info->root_pgt_changed = true;
-        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
-                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
-    }
 
     /*
      * Don't flush user global mappings from the TLB. Don't tick TLB clock.
@@ -412,15 +404,11 @@ static void _toggle_guest_pt(struct vcpu
      * In shadow mode, though, update_cr3() may need to be accompanied by a
      * TLB flush (for just the incoming PCID), as the top level page table may
      * have changed behind our backs. To be on the safe side, suppress the
-     * no-flush unconditionally in this case. The XPTI CR3 write, if enabled,
-     * will then need to be a flushing one too.
+     * no-flush unconditionally in this case.
      */
     cr3 = v->arch.cr3;
-    if ( shadow_mode_enabled(d) )
-    {
+    if ( shadow_mode_enabled(v->domain) )
         cr3 &= ~X86_CR3_NOFLUSH;
-        cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
-    }
     write_cr3(cr3);
 
     if ( !(v->arch.flags & TF_kernel_mode) )
@@ -436,6 +424,8 @@ static void _toggle_guest_pt(struct vcpu
 
 void toggle_guest_mode(struct vcpu *v)
 {
+    const struct domain *d = v->domain;
+
     ASSERT(!is_pv_32bit_vcpu(v));
 
     /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
@@ -449,8 +439,27 @@ void toggle_guest_mode(struct vcpu *v)
     asm volatile ( "swapgs" );
 
     _toggle_guest_pt(v);
+
+    if ( d->arch.pv.xpti )
+    {
+        struct cpu_info *cpu_info = get_cpu_info();
+
+        cpu_info->root_pgt_changed = true;
+        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
+                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
+        /*
+         * As in _toggle_guest_pt() the XPTI CR3 write needs to be a TLB-
+         * flushing one too for shadow mode guests.
+         */
+        if ( shadow_mode_enabled(d) )
+            cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
+    }
 }
 
+/*
+ * Must be called in matching pairs without returning to guest context
+ * inbetween.
+ */
 void toggle_guest_pt(struct vcpu *v)
 {
     if ( !is_pv_32bit_vcpu(v) )

