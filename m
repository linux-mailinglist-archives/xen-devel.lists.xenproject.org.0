Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE2411EFF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191095.341031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNC3-0003Ek-2F; Mon, 20 Sep 2021 17:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191095.341031; Mon, 20 Sep 2021 17:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNC2-0003C8-UZ; Mon, 20 Sep 2021 17:35:02 +0000
Received: by outflank-mailman (input) for mailman id 191095;
 Mon, 20 Sep 2021 17:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSNC1-0002pz-NW
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:35:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 119f6c43-1a39-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:34:56 +0000 (UTC)
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
X-Inumbo-ID: 119f6c43-1a39-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632159296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GcABwI8oWHgu530a+/KgqxWauKwNAPSdO5EboEi94Ao=;
  b=Yg74MBquc/o5k5Q+yVrZvcVvjRK6IaWTq3GXWJg/cxo700e/cQfaB535
   qRKIzxVl1FmHmj4j7l+zh5Xz4mEubpEHGRaVggUNvsn53PBBSl4vor6yq
   unpP3XxHiS5qmtJXwUhJCvatk5daTcQ4bJkRxGjhxcjhiO/JNjG5v3ljb
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P7famdpIYSd9Iat7FzhqXhX4HUaZbz0EeCQRaQ6rqyFmwr5Za3YaAPyV85GzKrtJQ9tu5bJl42
 RWVeXfrsmVfZfnTu7+4KmVQ2weBwttctvKGxwvm8JsPlsch+c4pgYAi4Kfj46ORWsLxZT2SWXG
 0XP/YPlEZ+z0Sh/xibisxBH9+J9OS2VSH93KzVr/acBK4a4l6A84U1zZJmLO8lxvCw8aExVx3C
 xI0WocMQ1MB1IhLy/QX/L0zYgZgNJ83cB/CziO4B4k1sDumXMDRtXm4qL8BpP5aZLB9Viore6k
 Wkzi1RxUY9KpossjblwH6mP/
X-SBRS: 5.1
X-MesageID: 52741880
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/bhr6KxIECZE6TC6NVJ6t+cvwSrEfRIJ4+MujC+fZmUNrF6WrkUHz
 GVJX22BPfqJZWChedgna47noBwD7J6Gn9NrHgo+rCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRh2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4tr5
 8sWsKOgdSd3Br/JmuI6QgRpTRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25oRQa+ON
 5JxhTxHZwXcaRsRHnAtVYNjxtmUtmDVI21RkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZHQfVOSOgF+D2tlJLG5gSfIXkZf2B4PYlOWNANedA66
 rOYt4q3XmU/6+zEESj1GqS89mzpaHNMRYMWTWpdF1JUvYO7yG0mpk+XFr5e/LiJYsoZ8N0a6
 wuDqjQ3z54XhNQCv0lQ1QGa22/wznQlowhc2+k2Yo5HxlgiDGJGT9bxgbQ+0RqnBNzCJmRtR
 FBex6CjABkmVPlhbhBhpdnh+5nyvZ643MD02wYzT/HNCRz0oyPLkX9sDMFWex4yb5dslc7BS
 07PowJBjKK/z1PzNvQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDnHFmmTyLGsClkHxKE9O2PRaodFvMC3PWBshR0U9OiFS9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:c5rIWqCFmITTuWvlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="52741880"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 12/12] x86/trace: Clean up trace handling
Date: Mon, 20 Sep 2021 18:25:29 +0100
Message-ID: <20210920172529.24932-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Use more appropriate types.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/irq.c             |   4 +-
 xen/arch/x86/mm/p2m-pt.c       |   6 +-
 xen/arch/x86/mm/shadow/multi.c |   2 +-
 xen/arch/x86/pv/trace.c        | 159 +++++++++++++++++++----------------------
 4 files changed, 78 insertions(+), 93 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a1693f92dd92..67cbf6b979dc 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -130,8 +130,8 @@ static void _trace_irq_mask(uint32_t event, int irq, int vector,
                             const cpumask_t *mask)
 {
     struct {
-        unsigned int irq:16, vec:16;
-        unsigned int mask[6];
+        uint16_t irq, vec;
+        uint32_t mask[6];
     } d = {
        .irq = irq,
        .vec = vector,
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a0c0f5aceff..09c99d78aa40 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -609,9 +609,9 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     if ( tb_init_done )
     {
         struct {
-            u64 gfn, mfn;
-            int p2mt;
-            int d:16,order:16;
+            uint64_t gfn, mfn;
+            uint32_t p2mt;
+            uint16_t d, order;
         } t;
 
         t.gfn = gfn;
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 8bb028c2e2fa..15265fc81dca 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2118,7 +2118,7 @@ static inline void trace_shadow_emulate(guest_l1e_t gl1e, unsigned long va)
                so put it first for alignment sake. */
             guest_l1e_t gl1e, write_val;
             guest_va_t va;
-            unsigned flags:29, emulation_count:3;
+            uint32_t flags:29, emulation_count:3;
         } d;
         u32 event;
 
diff --git a/xen/arch/x86/pv/trace.c b/xen/arch/x86/pv/trace.c
index 550c22765bae..a952fbc1eb0f 100644
--- a/xen/arch/x86/pv/trace.c
+++ b/xen/arch/x86/pv/trace.c
@@ -7,38 +7,35 @@ void __trace_pv_trap(int trapnr, unsigned long eip,
 {
     if ( is_pv_32bit_vcpu(current) )
     {
-        struct __packed {
-            unsigned eip:32,
-                trapnr:15,
-                use_error_code:1,
-                error_code:16;
-        } d;
-
-        d.eip = eip;
-        d.trapnr = trapnr;
-        d.error_code = error_code;
-        d.use_error_code=!!use_error_code;
+        struct {
+            uint32_t eip;
+            uint16_t trapnr:15;
+            bool use_error_code:1;
+            uint16_t error_code;
+        } d = {
+            .eip            = eip,
+            .trapnr         = trapnr,
+            .use_error_code = use_error_code,
+            .error_code     = error_code,
+        };
 
         __trace_var(TRC_PV_TRAP, 1, sizeof(d), &d);
     }
     else
     {
         struct __packed {
-            unsigned long eip;
-            unsigned trapnr:15,
-                use_error_code:1,
-                error_code:16;
-        } d;
-        unsigned event;
-
-        d.eip = eip;
-        d.trapnr = trapnr;
-        d.error_code = error_code;
-        d.use_error_code=!!use_error_code;
-
-        event = TRC_PV_TRAP;
-        event |= TRC_64_FLAG;
-        __trace_var(event, 1, sizeof(d), &d);
+            uint64_t rip;
+            uint16_t trapnr:15;
+            bool use_error_code:1;
+            uint16_t error_code;
+        } d = {
+            .rip            = eip,
+            .trapnr         = trapnr,
+            .use_error_code = use_error_code,
+            .error_code     = error_code,
+        };
+
+        __trace_var(TRC_PV_TRAP | TRC_64_FLAG, 1, sizeof(d), &d);
     }
 }
 
@@ -48,30 +45,28 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
 
     if ( is_pv_32bit_vcpu(current) )
     {
-        struct __packed {
-            u32 eip, addr, error_code;
-        } d;
-
-        d.eip = eip;
-        d.addr = addr;
-        d.error_code = error_code;
+        struct {
+            uint32_t eip, addr, error_code;
+        } d = {
+            .eip = eip,
+            .addr = addr,
+            .error_code = error_code,
+        };
 
         __trace_var(TRC_PV_PAGE_FAULT, 1, sizeof(d), &d);
     }
     else
     {
         struct __packed {
-            unsigned long eip, addr;
-            u32 error_code;
-        } d;
-        unsigned event;
-
-        d.eip = eip;
-        d.addr = addr;
-        d.error_code = error_code;
-        event = TRC_PV_PAGE_FAULT;
-        event |= TRC_64_FLAG;
-        __trace_var(event, 1, sizeof(d), &d);
+            uint64_t eip, addr;
+            uint32_t error_code;
+        } d = {
+            .eip = eip,
+            .addr = addr,
+            .error_code = error_code,
+        };
+
+        __trace_var(TRC_PV_PAGE_FAULT | TRC_64_FLAG, 1, sizeof(d), &d);
     }
 }
 
@@ -83,10 +78,7 @@ void __trace_trap_one_addr(unsigned event, unsigned long va)
         __trace_var(event, 1, sizeof(d), &d);
     }
     else
-    {
-        event |= TRC_64_FLAG;
-        __trace_var(event, 1, sizeof(va), &va);
-    }
+        __trace_var(event | TRC_64_FLAG, 1, sizeof(va), &va);
 }
 
 void __trace_trap_two_addr(unsigned event, unsigned long va1,
@@ -94,22 +86,25 @@ void __trace_trap_two_addr(unsigned event, unsigned long va1,
 {
     if ( is_pv_32bit_vcpu(current) )
     {
-        struct __packed {
-            u32 va1, va2;
-        } d;
-        d.va1=va1;
-        d.va2=va2;
+        struct {
+            uint32_t va1, va2;
+        } d = {
+            .va1 = va1,
+            .va2 = va2,
+        };
+
         __trace_var(event, 1, sizeof(d), &d);
     }
     else
     {
-        struct __packed {
-            unsigned long va1, va2;
-        } d;
-        d.va1=va1;
-        d.va2=va2;
-        event |= TRC_64_FLAG;
-        __trace_var(event, 1, sizeof(d), &d);
+        struct {
+            uint64_t va1, va2;
+        } d = {
+            .va1 = va1,
+            .va2 = va2,
+        };
+
+        __trace_var(event | TRC_64_FLAG, 1, sizeof(d), &d);
     }
 }
 
@@ -117,40 +112,30 @@ void __trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
 {
     unsigned long eip = guest_cpu_user_regs()->rip;
 
-    /* We have a couple of different modes to worry about:
-     * - 32-on-32: 32-bit pte, 32-bit virtual addresses
-     * - pae-on-pae, pae-on-64: 64-bit pte, 32-bit virtual addresses
-     * - 64-on-64: 64-bit pte, 64-bit virtual addresses
-     * pae-on-64 is the only one that requires extra code; in all other
-     * cases, "unsigned long" is the size of a guest virtual address.
-     */
-
     if ( is_pv_32bit_vcpu(current) )
     {
-        struct __packed {
-            l1_pgentry_t pte;
-            u32 addr, eip;
-        } d;
-        d.addr = addr;
-        d.eip = eip;
-        d.pte = npte;
+        struct {
+            uint64_t pte;
+            uint32_t addr, eip;
+        } d = {
+            .pte  = l1e_get_intpte(npte),
+            .addr = addr,
+            .eip  = eip,
+        };
 
         __trace_var(TRC_PV_PTWR_EMULATION_PAE, 1, sizeof(d), &d);
     }
     else
     {
         struct {
-            l1_pgentry_t pte;
-            unsigned long addr, eip;
-        } d;
-        unsigned event;
-
-        d.addr = addr;
-        d.eip = eip;
-        d.pte = npte;
-
-        event = TRC_PV_PTWR_EMULATION;
-        event |= TRC_64_FLAG;
-        __trace_var(event, 1/*tsc*/, sizeof(d), &d);
+            uint64_t pte;
+            uint64_t addr, rip;
+        } d = {
+            .pte  = l1e_get_intpte(npte),
+            .addr = addr,
+            .rip  = eip,
+        };
+
+        __trace_var(TRC_PV_PTWR_EMULATION | TRC_64_FLAG, 1, sizeof(d), &d);
     }
 }
-- 
2.11.0


