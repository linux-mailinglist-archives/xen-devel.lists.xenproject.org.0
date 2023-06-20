Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD8736A25
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551558.861240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ78-0001tM-6i; Tue, 20 Jun 2023 11:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551558.861240; Tue, 20 Jun 2023 11:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ77-0001bs-OI; Tue, 20 Jun 2023 11:01:33 +0000
Received: by outflank-mailman (input) for mailman id 551558;
 Tue, 20 Jun 2023 10:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYi5-0004Ou-SI
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33315939-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:39 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 272A74EE0752;
 Tue, 20 Jun 2023 12:35:38 +0200 (CEST)
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
X-Inumbo-ID: 33315939-0f56-11ee-8611-37d641c3527e
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
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 13/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:35:05 +0200
Message-Id: <3560de5fd05a67cc10c9426ffd55639ebe24d98d.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/gunzip.c          |  2 +-
 xen/common/xmalloc_tlsf.c    |  2 +-
 xen/drivers/char/ehci-dbgp.c |  4 ++--
 xen/include/public/memory.h  |  2 +-
 xen/include/public/sysctl.h  |  4 ++--
 xen/include/xen/bitops.h     | 10 +++++-----
 xen/include/xen/cper.h       | 34 +++++++++++++++++-----------------
 xen/lib/muldiv64.c           |  2 +-
 8 files changed, 30 insertions(+), 30 deletions(-)

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
index 9d06e92d0f..4e8b087502 100644
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
index 33619a0873..3b7e09a26e 100644
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
+#define __L2(_x)  (((_x) & 0x00000002U) ?   1 : 0)
+#define __L4(_x)  (((_x) & 0x0000000cU) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
+#define __L8(_x)  (((_x) & 0x000000f0U) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
+#define __L16(_x) (((_x) & 0x0000ff00U) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
+#define ilog2(_x) (((_x) & 0xffff0000U) ? (16 + __L16((_x)>>16)) : __L16(_x))
 
 /**
  * for_each_set_bit - iterate over every set bit in a memory region
diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index f8e5272bc1..71d14faa02 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -56,7 +56,7 @@ static inline uint64_t cper_next_record_id(void)
 #define CPER_SIG_RECORD				"CPER"
 #define CPER_SIG_SIZE				4
 /* Used in signature_end field in struct cper_record_header */
-#define CPER_SIG_END				0xffffffff
+#define CPER_SIG_END				0xffffffffU
 
 /*
  * CPER record header revision, used in revision field in struct
@@ -80,36 +80,36 @@ static inline uint64_t cper_next_record_id(void)
  * Corrected Machine Check
  */
 #define CPER_NOTIFY_CMC							\
-	UUID_LE(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4,	\
-		0xEB, 0xD4, 0xF8, 0x90)
+	UUID_LE(0x2DCE8BB1U, 0xBDD7U, 0x450eU, 0xB9U, 0xADU, 0x9CU, 0xF4U,	\
+		0xEBU, 0xD4U, 0xF8U, 0x90U)
 /* Corrected Platform Error */
 #define CPER_NOTIFY_CPE							\
-	UUID_LE(0x4E292F96, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81,	\
-		0xF2, 0x7E, 0xBE, 0xEE)
+	UUID_LE(0x4E292F96U, 0xD843U, 0x4a55U, 0xA8U, 0xC2U, 0xD4U, 0x81U,	\
+		0xF2U, 0x7EU, 0xBEU, 0xEEU)
 /* Machine Check Exception */
 #define CPER_NOTIFY_MCE							\
-	UUID_LE(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB,	\
-		0xE1, 0x49, 0x13, 0xBB)
+	UUID_LE(0xE8F56FFEU, 0x919CU, 0x4cc5U, 0xBAU, 0x88U, 0x65U, 0xABU,	\
+		0xE1U, 0x49U, 0x13U, 0xBBU)
 /* PCI Express Error */
 #define CPER_NOTIFY_PCIE						\
-	UUID_LE(0xCF93C01F, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D,	\
-		0xAF, 0x67, 0xC1, 0x04)
+	UUID_LE(0xCF93C01FU, 0x1A16U, 0x4dfcU, 0xB8U, 0xBCU, 0x9CU, 0x4DU,	\
+		0xAFU, 0x67U, 0xC1U, 0x04U)
 /* INIT Record (for IPF) */
 #define CPER_NOTIFY_INIT						\
-	UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B,	\
-		0xD3, 0x9B, 0xC9, 0x8E)
+	UUID_LE(0xCC5263E8U, 0x9308U, 0x454aU, 0x89U, 0xD0U, 0x34U, 0x0BU,	\
+		0xD3U, 0x9BU, 0xC9U, 0x8EU)
 /* Non-Maskable Interrupt */
 #define CPER_NOTIFY_NMI							\
-	UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24,	\
-		0x85, 0xD6, 0xE9, 0x8A)
+	UUID_LE(0x5BAD89FFU, 0xB7E6U, 0x42c9U, 0x81U, 0x4AU, 0xCFU, 0x24U,	\
+		0x85U, 0xD6U, 0xE9U, 0x8AU)
 /* BOOT Error Record */
 #define CPER_NOTIFY_BOOT						\
-	UUID_LE(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62,	\
-		0xD4, 0x64, 0xB3, 0x8F)
+	UUID_LE(0x3D61A466U, 0xAB40U, 0x409aU, 0xA6U, 0x98U, 0xF3U, 0x62U,	\
+		0xD4U, 0x64U, 0xB3U, 0x8FU)
 /* DMA Remapping Error */
 #define CPER_NOTIFY_DMAR						\
-	UUID_LE(0x667DD791, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E,	\
-		0x72, 0x2D, 0xEB, 0x41)
+	UUID_LE(0x667DD791U, 0xC6B3U, 0x4c27U, 0x8AU, 0x6BU, 0x0FU, 0x8EU,	\
+		0x72U, 0x2DU, 0xEBU, 0x41U)
 
 /*
  * Flags bits definitions for flags in struct cper_record_header
diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
index 78177ce616..641ac25d01 100644
--- a/xen/lib/muldiv64.c
+++ b/xen/lib/muldiv64.c
@@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     rh = (uint64_t)u.l.high * (uint64_t)b;
     rh += (rl >> 32);
     res.l.high = rh / c;
-    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
+    res.l.low = (((rh % c) << 32) + (rl & 0xffffffffU)) / c;
 
     return res.ll;
 #endif
-- 
2.41.0


