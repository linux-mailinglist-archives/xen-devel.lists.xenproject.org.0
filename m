Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85A411E0D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191047.340905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN2z-0003kA-Gn; Mon, 20 Sep 2021 17:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191047.340905; Mon, 20 Sep 2021 17:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN2z-0003fd-Co; Mon, 20 Sep 2021 17:25:41 +0000
Received: by outflank-mailman (input) for mailman id 191047;
 Mon, 20 Sep 2021 17:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN2y-0003cq-Dt
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5b8efdf-1a37-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:25:39 +0000 (UTC)
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
X-Inumbo-ID: c5b8efdf-1a37-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=B3S41rd9NvRv/dJsqHom9/Nn++paIgMCBBiyWnP7azs=;
  b=HHnSgUOBv1+n+vifGJTe2DMx8CmQv/WEjcJ2Yug2gjvmjG8hSRHYmLVO
   IIIuwCj854TSRWl/8scXkRXtovkCY8u158cv76ZcZCdiDh4PhRptktp2y
   8XGBBSNp46pNlQ6QJaonhF7jtOCdccEdFghda6g2GQeQjKFCt2ChJqOWe
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cQzWNDkh5IkZR9+XiUtaYKn0iozqNVqpiYTOvyeehkAvNB1ho6SRQBju2AtSst2FFLFy6pTKQR
 V8q4pPYNb0gH/IgEglB/HkfNo3/0uG/j/W39KA8YQXKpKAefWH90Cg4XntakCo6uzbT/fCCYCl
 4lAeApubmgR3UQXuaWR+G0YC1IUxJBNDBAls5rhHlreXhFbfl+dX4HqrZyDJnrb+jpjSCGMPzm
 p7EaNLvPoodbgbBRM/pnwtCdv3Rn9sALk9T0QXQcqbMijcDC5z0faf6X8IiDEQBr3FivxySrEB
 TrNgEepkUtGaF4WkEQHoFBSA
X-SBRS: 5.1
X-MesageID: 52741153
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kbRaLKlkvZaovmL7isg4Zh/o5gwHIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXGrTMvyCNmf3KdEjbYu3pxwOu5fWmoQwHQNr/HgwFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M4Ult+ydSgNAu7vpuI0ahNaKhA5JJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKyBO
 5NANGEHgBLoJEMREVYUNaAHpNzvqWbyYiVftUnJjP9ii4TU5FMoi+W8WDbPQfSob8hImkeTp
 krd4n/0RBodMbS3yyeB83+qrv/Cm2X8Qo16PLi18PF6nXWYx3dVFQUbU139rPWk4mayVdtQJ
 E0T/isGtrUp+QqgSdyVdxynolaUsxgEQd1SHuYmrgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRq3/7uKTDIawjmUfVyjxzpzZreUIJWRvA2zAel7EGqJcrWQl
 CFawJHOt7FfVcvleD+lG7pWTerwjxqRGHiF2wc+QcN5n9i40yP7JehtDCdCyFCF2yruUQTgZ
 lPa8ShV7YVaVJdBRf4qO9/tYyjGIK6JKDgEahw2RoEVCnSSXFXelM2LWaJ39zq2+HXAaYllZ
 f+mnT+EVB7285iLKQZaoM9Gi9cWKt0WnzuPFfgXMTz+ief2iIGppUctbwLVM7FRAFKsiwTJ6
 ddPX/ZmOD0GC7aWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLMuK3Ackn8iJlYkTB/z+AghAeXGpm149HH7NfQFXt3LALISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:V4h1F6456LKLtZGgAAPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 eTdZEgvyMc5wx/ZJhNo7690ey7MBDhHP1OkO0s1NWZPDUO0VHARO1fBMnZsl/d8kXFndK1vp
 0QFpSWZueQMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="52741153"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Date: Mon, 20 Sep 2021 18:25:18 +0100
Message-ID: <20210920172529.24932-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

In the case that 'extra' isn't a multiple of uint32_t, the calculation rounds
the number of bytes up, causing later logic to read unrelated bytes beyond the
end of the object.

Also, asserting that the object is within TRACE_EXTRA_MAX, but truncating it
in release builds is rude.  Instead, reject any out-of-spec records, leaving
enough of a message to identify the faulty caller.

There is one buggy race record, TRC_RTDS_BUDGET_BURN.  As it must remain
__packed (as cur_budget is misaligned), change bool has_extratime to uint32_t
to compensate.

The new printk() can also be hit by HVMOP_xentrace, although no over-read is
possible.  This has no business being a hypercall in the first place, as it
can't be used outside of custom local debugging, so extend the uint32_t
requirement to HVMOP_xentrace too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Meng Xu <mengxu@cis.upenn.edu>

v2:
 * Adjust HVMOP_xentrace to avoid hitting the printk()
 * Fix TRC_RTDS_BUDGET_BURN
 * Adjust wording in __trace_var()
---
 xen/arch/x86/hvm/hvm.c |  5 +++--
 xen/common/sched/rt.c  | 24 +++++++++++++-----------
 xen/common/trace.c     | 21 ++++++++++-----------
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7b48a1b925bb..09cf6330ad26 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&tr, arg, 1 ) )
             return -EFAULT;
 
-        if ( tr.extra_bytes > sizeof(tr.extra)
-             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
+        if ( tr.extra_bytes % sizeof(uint32_t) ||
+             tr.extra_bytes > sizeof(tr.extra) ||
+             tr.event >> TRC_SUBCLS_SHIFT )
             return -EINVAL;
 
         /* Cycles will be taken at the vmexit and vmenter */
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index c24cd2ac3200..c58edca0de84 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
     /* TRACE */
     {
         struct __packed {
-            unsigned unit:16, dom:16;
+            uint16_t unit, dom;
             uint64_t cur_budget;
-            int delta;
-            unsigned priority_level;
-            bool has_extratime;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.cur_budget = (uint64_t) svc->cur_budget;
-        d.delta = delta;
-        d.priority_level = svc->priority_level;
-        d.has_extratime = svc->flags & RTDS_extratime;
+            uint32_t delta;
+            uint32_t priority_level;
+            uint32_t has_extratime;
+        } d = {
+            .unit            = svc->unit->unit_id,
+            .dom             = svc->unit->domain->domain_id,
+            .cur_budget      = svc->cur_budget,
+            .delta           = delta,
+            .priority_level  = svc->priority_level,
+            .has_extratime   = !!(svc->flags & RTDS_extratime),
+        };
+
         trace_var(TRC_RTDS_BUDGET_BURN, 1,
                   sizeof(d),
                   (unsigned char *) &d);
diff --git a/xen/common/trace.c b/xen/common/trace.c
index a2a389a1c7c3..4297ff505fb9 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     unsigned long flags;
     u32 bytes_to_tail, bytes_to_wrap;
     unsigned int rec_size, total_size;
-    unsigned int extra_word;
     bool_t started_below_highwater;
 
     if( !tb_init_done )
         return;
 
-    /* Convert byte count into word count, rounding up */
-    extra_word = (extra / sizeof(u32));
-    if ( (extra % sizeof(u32)) != 0 )
-        extra_word++;
-    
-    ASSERT(extra_word <= TRACE_EXTRA_MAX);
-    extra_word = min_t(int, extra_word, TRACE_EXTRA_MAX);
-
-    /* Round size up to nearest word */
-    extra = extra_word * sizeof(u32);
+    /*
+     * extra data needs to be an exact multiple of uint32_t to prevent the
+     * later logic over-reading the object.  Reject out-of-spec records.  Any
+     * failure here is an error in the caller.
+     */
+    if ( extra % sizeof(uint32_t) ||
+         extra / sizeof(uint32_t) > TRACE_EXTRA_MAX )
+        return printk_once(XENLOG_WARNING
+                           "Trace event %#x bad size %u, discarding\n",
+                           event, extra);
 
     if ( (tb_event_mask & event) == 0 )
         return;
-- 
2.11.0


