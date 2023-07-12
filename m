Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11367504D5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562257.878912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDo-0004Bc-0a; Wed, 12 Jul 2023 10:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562257.878912; Wed, 12 Jul 2023 10:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDn-0004Ad-Ma; Wed, 12 Jul 2023 10:37:23 +0000
Received: by outflank-mailman (input) for mailman id 562257;
 Wed, 12 Jul 2023 10:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAb-0006Dd-EF
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:34:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fa98df3-209f-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:34:04 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 4CB734EE0737;
 Wed, 12 Jul 2023 12:34:03 +0200 (CEST)
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
X-Inumbo-ID: 9fa98df3-209f-11ee-b239-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 15/15] xen: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:16 +0200
Message-Id: <7a58c9341d10ef79e117ac35da048bbb088ec5d0.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

Fot the sake of uniformity, the following changes are made:
- add the 'U' suffix to all integer constants before the
  '?' operator in 'bitops.h'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- change 'Signed-off-by' ordering
- change commit message
- fix in 'muldiv64.c'
- add changes to 'bitops.h' macros
- move 'cper.h' in a separate commit

Changes in v2:
- minor change to commit title
- change commit message
- add '(uint32_t)' in 'muldiv64.c' for consistency
- add fix in 'vesa.c'
---
 xen/common/gunzip.c          |  2 +-
 xen/common/xmalloc_tlsf.c    |  2 +-
 xen/drivers/char/ehci-dbgp.c |  4 ++--
 xen/drivers/video/vesa.c     |  2 +-
 xen/include/public/memory.h  |  2 +-
 xen/include/public/sysctl.h  |  4 ++--
 xen/include/xen/bitops.h     | 10 +++++-----
 xen/lib/muldiv64.c           |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index 71ec5f26be..b810499be2 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -11,7 +11,7 @@ static unsigned char *__initdata window;
 static memptr __initdata free_mem_ptr;
 static memptr __initdata free_mem_end_ptr;
 
-#define WSIZE           0x80000000
+#define WSIZE           0x80000000U
 
 static unsigned char *__initdata inbuf;
 static unsigned int __initdata insize;
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 75bdf18c4e..c21bf71e88 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -46,7 +46,7 @@
 #define BHDR_OVERHEAD   (sizeof(struct bhdr) - MIN_BLOCK_SIZE)
 
 #define PTR_MASK        (sizeof(void *) - 1)
-#define BLOCK_SIZE_MASK (0xFFFFFFFF - PTR_MASK)
+#define BLOCK_SIZE_MASK (0xFFFFFFFFU - PTR_MASK)
 
 #define GET_NEXT_BLOCK(addr, r) ((struct bhdr *) \
                                 ((char *)(addr) + (r)))
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index bb9d3198d9..4d8d765122 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -375,12 +375,12 @@ static inline u32 dbgp_pid_write_update(u32 x, u32 tok)
     static u8 data0 = USB_PID_DATA1;
 
     data0 ^= USB_PID_DATA0 ^ USB_PID_DATA1;
-    return (x & 0xffff0000) | (data0 << 8) | (tok & 0xff);
+    return (x & 0xffff0000U) | (data0 << 8) | (tok & 0xffU);
 }
 
 static inline u32 dbgp_pid_read_update(u32 x, u32 tok)
 {
-    return (x & 0xffffff00) | (tok & 0xff);
+    return (x & 0xffffff00U) | (tok & 0xffU);
 }
 
 static inline void dbgp_set_data(struct ehci_dbg_port __iomem *ehci_debug,
diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
index c41f6b8d40..b007ff5678 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -123,7 +123,7 @@ void __init vesa_init(void)
     if ( vlfb_info.bits_per_pixel > 8 )
     {
         /* Light grey in truecolor. */
-        unsigned int grey = 0xaaaaaaaa;
+        unsigned int grey = 0xaaaaaaaaU;
         lfbp.pixel_on =
             ((grey >> (32 - vlfb_info.  red_size)) << vlfb_info.  red_pos) |
             ((grey >> (32 - vlfb_info.green_size)) << vlfb_info.green_pos) |
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index c5f0d31e23..5e545ae9a4 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -234,7 +234,7 @@ struct xen_add_to_physmap {
 
     unsigned int space; /* => enum phys_map_space */
 
-#define XENMAPIDX_grant_table_status 0x80000000
+#define XENMAPIDX_grant_table_status 0x80000000U
 
     /* Index into space being mapped. */
     xen_ulong_t idx;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 33e86ace51..fa7147de47 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -384,7 +384,7 @@ struct xen_sysctl_pm_op {
         struct xen_set_cpufreq_para set_para;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
-#define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
+#define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU
         uint32_t                    get_max_cstate;
         uint32_t                    set_max_cstate;
     } u;
@@ -547,7 +547,7 @@ struct xen_sysctl_numainfo {
 #define XEN_SYSCTL_CPUPOOL_OP_RMCPU                 5  /* R */
 #define XEN_SYSCTL_CPUPOOL_OP_MOVEDOMAIN            6  /* M */
 #define XEN_SYSCTL_CPUPOOL_OP_FREEINFO              7  /* F */
-#define XEN_SYSCTL_CPUPOOL_PAR_ANY     0xFFFFFFFF
+#define XEN_SYSCTL_CPUPOOL_PAR_ANY     0xFFFFFFFFU
 struct xen_sysctl_cpupool_op {
     uint32_t op;          /* IN */
     uint32_t cpupool_id;  /* IN: CDIARM OUT: CI */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 4cd0310789..e926047932 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -227,11 +227,11 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
 }
 
 /* base-2 logarithm */
-#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
-#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
-#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
-#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
-#define ilog2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(_x))
+#define __L2(x)  (((x) & 0x00000002U) ?   1                     : 0)
+#define __L4(x)  (((x) & 0x0000000cU) ? ( 2 + __L2( (x) >> 2))  : __L2( x))
+#define __L8(x)  (((x) & 0x000000f0U) ? ( 4 + __L4( (x) >> 4))  : __L4( x))
+#define __L16(x) (((x) & 0x0000ff00U) ? ( 8 + __L8( (x) >> 8))  : __L8( x))
+#define ilog2(x) (((x) & 0xffff0000U) ? (16 + __L16((x) >> 16)) : __L16(x))
 
 /**
  * for_each_set_bit - iterate over every set bit in a memory region
diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
index 78177ce616..a51cbc8767 100644
--- a/xen/lib/muldiv64.c
+++ b/xen/lib/muldiv64.c
@@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     rh = (uint64_t)u.l.high * (uint64_t)b;
     rh += (rl >> 32);
     res.l.high = rh / c;
-    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
+    res.l.low = (((rh % c) << 32) + ((uint32_t)rl)) / c;
 
     return res.ll;
 #endif
-- 
2.41.0


