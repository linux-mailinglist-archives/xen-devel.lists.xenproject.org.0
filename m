Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489AA411E0E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191046.340899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN2z-0003fB-7Z; Mon, 20 Sep 2021 17:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191046.340899; Mon, 20 Sep 2021 17:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN2z-0003cw-3a; Mon, 20 Sep 2021 17:25:41 +0000
Received: by outflank-mailman (input) for mailman id 191046;
 Mon, 20 Sep 2021 17:25:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN2x-0003ck-Jm
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:39 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 288e7a11-764c-4528-9450-fb71bdffc74f;
 Mon, 20 Sep 2021 17:25:38 +0000 (UTC)
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
X-Inumbo-ID: 288e7a11-764c-4528-9450-fb71bdffc74f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=X2OvFsDnk6zSkjs6xUlTPuHsZnVpWG/gEpynVHga6Vg=;
  b=HxexOTzyLOX5K81+NCiRuygkWPboy0+HBqlTKAmC6a0Mtfzbwfa9hqWp
   eFgUH/EhCXGANHs7Cd3xItLubgAoeH93MPmTk6dfsPLZ9ZHuFobXllSpv
   sCX760ethuFjHr1O/eE/U1jaTv2S9PYWET+Hob/PDYAIUv8tliRNnsuvD
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ggiTRXzvxA+1hkc/Vsc3ofkjT/EEw0m8NFIkyDG7SWNufK8rejv13u076MXQeJ++j5JMOHu7D5
 Pg+FU2nb9WtqF/x6HP+Xmr2phHmnJ/2EFDtikXI12N9pbzP3ianUbqyEhQwcXu3EFUe84Ok5LU
 89M2JooR+G36QNLKjoUBQjvcSJOV6VVg+rctTlub3ZBw7UywZAUYPU2dfOZ3a3tT1cpfqm/GeC
 7mQ/OpxSkSDN3AsSHnjQh0pVLfaNnr4EBBF+1aqVfpFSkR8VmNLIsbshcwIatMpihH6tVPR96f
 1dQIBaW0u6sHlnFiH9tT0HkX
X-SBRS: 5.1
X-MesageID: 54938583
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KFvEq6LfxIqoUY27FE+ROZIlxSXFcZb7ZxGr2PjKsXjdYENS3mECm
 DAaXWHTaf+PYWb3Ldp0b4+2pE8F6MDSzYRgSgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5w7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2vn8Bgm
 eVJ7KaVVAd0B47Qur49SQRxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gps15seQKaFD
 yYfQSMwahj6bFpSAXswLr4VoPqKuX+4aTIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9Qv3VosdG7y/8v9Cm0CIyyoYDxh+fUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mly7XWyxaUAHAeSTxMY8Bgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoaTjs3kSAH0m
 gqvsShjvpYPr5QrzbiSqAWvby2XmnTZcuIkzlyJBTv1tVIoPNTNi5+AsgeAvK0ZRGqNZhzY5
 iFVxZLGhAwbJczVzESwrPMx8KZFDhpvGAbVh0JmV7Il/i6kk5JIVdENuGwiTKuF38BtRNMIX
 KMxkVgKjHOwFCHzBUOSX25WI55xpZUM7fy/CpjpgiNmO/CdjjNrGR2CgmbLhQjQfLUEy/lja
 f93j+71VSty5VtbIMqeGL5GjO5DKtEW7mLPX5HrpylLIpLHPyX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJId09w/sNybeWo
 RlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:e3G0saobkfJMYFGT8X2hZ4YaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54938583"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH v2 02/12] xen/memory: Remove tail padding from TRC_MEM_* records
Date: Mon, 20 Sep 2021 18:25:19 +0100
Message-ID: <20210920172529.24932-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Four TRC_MEM_* records supply custom structures with tail padding, leaking
stack rubble into the trace buffer.  Three of the records were fine in 32-bit
builds of Xen, due to the relaxed alignment of 64-bit integers, but
POD_SUPERPAGE_SPLITER was broken right from the outset.

We could pack the datastructures to remove the padding, but xentrace_format
has no way of rendering the upper half of a 16-bit field.  Instead, expand all
16-bit fields to 32-bit.

For POD_SUPERPAGE_SPLINTER, introduce an order field as it is relevant
information, and to match DECREASE_RESERVATION, and so it doesn't require a
__packed attribute to drop tail padding.

Update xenalyze's structures to match, and introduce xentrace_format rendering
which was absent previously.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>

The xentrace_format script isn't remotely Py3 compatible, and was another
script missed by our previous efforts.
---
 tools/xentrace/formats    |  4 ++++
 tools/xentrace/xenalyze.c | 12 ++++++------
 xen/arch/x86/mm/p2m-pod.c | 17 +++++++++--------
 xen/common/memory.c       |  4 ++--
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/tools/xentrace/formats b/tools/xentrace/formats
index deac4d8598b0..0fcc327a4078 100644
--- a/tools/xentrace/formats
+++ b/tools/xentrace/formats
@@ -136,6 +136,10 @@
 0x0010f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_map      [ domid = %(1)d ]
 0x0010f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_unmap    [ domid = %(1)d ]
 0x0010f003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_transfer [ domid = %(1)d ]
+0x0010f005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  decrease_reservation   [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
+0x0010f010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_populate           [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
+0x0010f011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_zero_reclaim       [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
+0x0010f012  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_superpage_splinter [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
 
 0x00201001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ eip = 0x%(1)08x, eax = 0x%(2)08x ]
 0x00201101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ rip = 0x%(2)08x%(1)08x, eax = 0x%(3)08x ]
diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 5de167031e01..12dcca964645 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8121,7 +8121,7 @@ void mem_pod_zero_reclaim_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn, mfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( v && v->hvm.vmexit_valid )
@@ -8171,7 +8171,7 @@ void mem_pod_populate_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn, mfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
@@ -8204,14 +8204,14 @@ void mem_pod_superpage_splinter_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn;
-        int d:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
     {
-        printf(" %s pod_spage_splinter d%d g %llx\n",
+        printf(" %s pod_spage_splinter d%d o%d g %"PRIx64"\n",
                ri->dump_header,
-               r->d, (unsigned long long)r->gfn);
+               r->d, r->order, r->gfn);
     }
 }
 
@@ -8255,7 +8255,7 @@ void mem_decrease_reservation_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 8abc57265c10..90f02ae765f6 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -819,8 +819,8 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn)
     if ( tb_init_done )
     {
         struct {
-            u64 gfn, mfn;
-            int d:16,order:16;
+            uint64_t gfn, mfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
@@ -987,8 +987,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             if ( tb_init_done )
             {
                 struct {
-                    u64 gfn, mfn;
-                    int d:16,order:16;
+                    uint64_t gfn, mfn;
+                    uint32_t d, order;
                 } t;
 
                 t.gfn = gfn_x(gfns[i]);
@@ -1217,8 +1217,8 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
     if ( tb_init_done )
     {
         struct {
-            u64 gfn, mfn;
-            int d:16,order:16;
+            uint64_t gfn, mfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
@@ -1260,12 +1260,13 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
     if ( tb_init_done )
     {
         struct {
-            u64 gfn;
-            int d:16;
+            uint64_t gfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
         t.d = d->domain_id;
+        t.order = order;
 
         __trace_var(TRC_MEM_POD_SUPERPAGE_SPLINTER, 0, sizeof(t), &t);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 63642278fda9..8fd88ccb70bf 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -450,8 +450,8 @@ static void decrease_reservation(struct memop_args *a)
         if ( tb_init_done )
         {
             struct {
-                u64 gfn;
-                int d:16,order:16;
+                uint64_t gfn;
+                uint32_t d, order;
             } t;
 
             t.gfn = gmfn;
-- 
2.11.0


