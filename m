Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369E577C5D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369276.600630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1m-0005ZS-T4; Mon, 18 Jul 2022 07:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369276.600630; Mon, 18 Jul 2022 07:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1m-0005Rb-Lh; Mon, 18 Jul 2022 07:18:50 +0000
Received: by outflank-mailman (input) for mailman id 369276;
 Mon, 18 Jul 2022 07:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1k-0004to-Nh
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd84a51-0669-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 09:18:46 +0200 (CEST)
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
X-Inumbo-ID: dcd84a51-0669-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebOQyw54nOOd0pf8acUFtFVapBth6uiZeKHzw4jUO8k=;
  b=dbRg3o8jbpf7EYumHEO9USjY+zLSYaKU6IU3RjkwyUnzL8bnIQ3sMkJw
   TuUrI0SedUVrKNuV/qcJeYeFxVx+Hjjw8tsvdWg+e9QBL8KMxxATDqO/S
   BVv/MW2GfUmXN8oX7WoytCg9e1rz/RMFOXQ8E+krJfNLHWhoTQRmpydmo
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76007332
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AzjBJsa2tB0xEkJQofPbDix16xS7N8HFdZTh5A?=
 =?us-ascii?q?9k8jSZ0cfkRliZWkhF6PiwklHlZu+rW2YndT/em3FGgmSslSUnMXd4QO/PJH?=
 =?us-ascii?q?hVrmHATwQEHUHVE2NFApiHviEdWNnjUaBy65wBs81Eismu0A9pSy5YFciCEk?=
 =?us-ascii?q?jMPwJ7ek37nVVutO35b33UT7JRP5F/H3jn+KVRCr5/xrZZxp+VXVcLF2F/lF?=
 =?us-ascii?q?q3KSUyb0H8LcL8SdO1n3lp5gr09/uS/VfPfvYA9iS3hT7yfGtBZyU31dpkBN?=
 =?us-ascii?q?rx7mkC4lYI8xl9BbuzQl74WYbXOwNE/LrirTkv/hEMReKhLiR+VXP5Z+PtEz?=
 =?us-ascii?q?TU6wWRo/NhkDABzB3T4+aL8uBx9xnwALmCCVJBPKATbm+55KHZrd4jNRVens?=
 =?us-ascii?q?DLN5KJ1Y6xEWpQzxsWc5HfteSE8KUCIRl/fIwRaGMAsL/A3WrdvC88c/l0lI?=
 =?us-ascii?q?PjXh23vQYIm3LxsIRS7q8w01GL6FhGa6/6SXuQGnlFXp4T8Ji5Pt0qELmP4L?=
 =?us-ascii?q?T09DwL1nc7phsLmE9/PePhpT6Ud1kUBu09lXuDlpZ+xCmm8rIQEhZ7j4u+Ta?=
 =?us-ascii?q?yUflwoG+NwI4z/9IKnKb0cFF4+9zymJqLwW1Wnrc//O+P9cjXfFrPkKSUqQm?=
 =?us-ascii?q?2EggxRtnS4E/6WVUlJrarcs5WB/VN1P/ZAXBxdJHGF3ZCUNGeaP2BXb2zapl?=
 =?us-ascii?q?sufyb+QxJFWdAd2AKlTk6hmAtFfGCY3BqecuUIAeOODnFRSRD5El1bZkVTeA?=
 =?us-ascii?q?BXJEPLNd6CmcKiocVKHTNs1Rtv+ib0aow1Vd0Yv32hmzbpopmL+T6n4Aa8AV?=
 =?us-ascii?q?rHNePMiFAEcM32wAr6S6dapPO3yV3uMjFv6Ys88F8D7hZo936QdpG89j2JPV?=
 =?us-ascii?q?rhuBki62RiKdIFqrKlnavZ/bY657+c1P0iwmUgF9QIKc4jf6twjk8fpsaxq+?=
 =?us-ascii?q?Giw3iXdS68a5dxfndxD3hcJfd/wNlkKM5LF7u0ozPQ7Ez77Jl+YmJwAhQI1E?=
 =?us-ascii?q?kXMrCr08HlFkRWHYITsYZaSi2ElyS0RC9cKwnNjQEmQ2HMSjMrSInTqrdQjf?=
 =?us-ascii?q?+riPAUd+l8mNMHVbXcIXHDycDBQse6Ge8bg9VxNOzDtekFMDffAlheffciXv?=
 =?us-ascii?q?URsKXmLqcbiYkn4WewPfWmZfqzlVyBvIrUWimBC2wBsY1lCh8k2L2jiJKs6A?=
 =?us-ascii?q?l4i018ucgPgxFmvAtc0uyjgJ5STKYWPAmnX27nXbh9s9dWyo2btBF4JolKew?=
 =?us-ascii?q?yKnxDWTKc7IbTZXOLcM8xw4dLBHJ4U5irDGZSfpCErn3f4IU4cmTxMgwifYs?=
 =?us-ascii?q?04mdMMGMQTLyr/6MdJyQEA2j5uuxVn40FcGIB0CuzDrO45+s52Ra633kXyOe?=
 =?us-ascii?q?UecITqzRciQrgQ1W0OoyawiQerdoeH0bJwZSDZH28HIVc7UaZGK4buvxPDiI?=
 =?us-ascii?q?OhldnMURbQj8s2ZDSXG5OLr9fEWX1nI36xi9QnDc7DZH8/GVR99AO9doyOuS?=
 =?us-ascii?q?1XDLNLwsiuh0pNr8n2WYiScvxMph9l9L8q0O24BqBKIMlalyS4MuQZ21pcl+?=
 =?us-ascii?q?7pZOwDGzoNGu6mw2XodioYsE52k+95+n5vAiQ8n40yjzVLk6zardi15ONIP6?=
 =?us-ascii?q?BmCHVyscY0b5B/8Gj89HB7vxzzp1sGb1qGR/EaOwbAa6TGikImFi9Dn2iV+v?=
 =?us-ascii?q?WsizV5GHj0BIc08AUTtwB5HHVScAGy2hNmS5u8QCzMbSMOXQiTGa3P9x3rtO?=
 =?us-ascii?q?HMSePyfCBDtS7A49pq2qbVqjvTqlOyhDwZEpz693zP4aekwr9NbEctmYzP5o?=
 =?us-ascii?q?8ssw5YIW8yqTqsDy3lo5aJEjsNqcdoc5qJl/IOkFXuj3N6ka7Z49rFDWBIEJ?=
 =?us-ascii?q?kyh00D/Qd+h99JpNijBx/QGjyb544knApj9Ejal+CU0Ywh20BqUNi7eKaUcq?=
 =?us-ascii?q?HJA/ofDDxeKFpJk5EL4wYvctZslSfJJ4R3JyAc4c5s1TS+3GixP7gZxI/icX?=
 =?us-ascii?q?+Na5bY8xIPrhWMW7hC8A72hBrVvHbt79AuNDhw26dB10X/ckN7JR8mblrdqM?=
 =?us-ascii?q?frVtZbolwZFcU7nqfLSK8j8rbrOLzIWpUeHZy91oDwz4nfAE3JecsOKzTdqu?=
 =?us-ascii?q?1C9AkQCD+8XC/mUfPBOhE2AmA0IJ4GFX289K03lJPx0aR3997VDbHIasgdyP?=
 =?us-ascii?q?e3+pkEwtUXw26Jor0+X4bXD7xZ28BjVchK/lyrWU/ujyFtTBZ3e7NWsnlQQT?=
 =?us-ascii?q?WIeGwUrodpuJrSGaaLo9GGoxT19Nv3uIp4ox9nRMgHxAOQTJp2OZ63K4KtgZ?=
 =?us-ascii?q?o69spRrkTbnOQSfVRrxN12Er5y4z4b/E3BsOIHhLAFB7kdpPCsz7iZfLsgYu?=
 =?us-ascii?q?VEXz7UQCGOFCSEIzBob9f2riyi5KiDJrg9jSpp9yxa0SV7oOaZZub+vcX+RG?=
 =?us-ascii?q?abo8BPqd4Iou1q9SsQO0znSDXzPbobCCTDCaL+MN2eEXbefTVQzeXq+3/1g6?=
 =?us-ascii?q?+OE/b/UgQWHkjK2JGEMaTjKqH2ozj4SInCJAUhMPApaPU53NqC5Vgf7RlsOJ?=
 =?us-ascii?q?J9XxseJneJi6YTkHGtDva8UAa47lvKzc2ZMLHNHfVPYG6Q5gg/Rrd41LgRGv?=
 =?us-ascii?q?EI5NmNuy3YQwZqtSB3mgzFhIoshSkkfmg6fvAGkhao89CkGoTqbJafEAy084?=
 =?us-ascii?q?2u7U8M7jxVpIVtopct0AuiWcTNdhKh0d0Lz8pm1so0Z8FrzDCepLYKVW6cdf?=
 =?us-ascii?q?3FZ5JzO7gB7Wdgwrbip3We7+UJn?=
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76007332"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] xen/wait: Use relative stack adjustments
Date: Mon, 18 Jul 2022 08:18:24 +0100
Message-ID: <20220718071825.22113-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The waitqueue's esp field is overloaded.  It serves both as an indication that
the waitqueue is in use, and as a direction to check_wakeup_from_wait() as to
where to adjust the stack pointer to, but using an absolute pointer comes with
a cost if requiring the vCPU to wake up on the same pCPU it went to sleep on.

Instead, have the waitqueue just keep track of how much data is on wqv->stack.
This is no practical change in __prepare_to_wait() (it already calculated the
delta) but split the result out of the (also overloaded) %rsi output parameter
by using a separate register instead.

check_wakeup_from_wait() has a bit more work to do.  It now needs to calculate
the adjustment to %rsp rather than having the new %rsp provided as a
parameter.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 4bc030d1a09d..4f1daf650bc4 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -32,8 +32,8 @@ struct waitqueue_vcpu {
      * Xen/x86 does not have per-vcpu hypervisor stacks. So we must save the
      * hypervisor context before sleeping (descheduling), setjmp/longjmp-style.
      */
-    void *esp;
     char *stack;
+    unsigned int used;
 #endif
 };
 
@@ -121,11 +121,11 @@ void wake_up_all(struct waitqueue_head *wq)
 
 static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
 {
-    struct cpu_info *cpu_info = get_cpu_info();
     struct vcpu *curr = current;
     unsigned long dummy;
+    unsigned int used;
 
-    ASSERT(wqv->esp == 0);
+    ASSERT(wqv->used == 0);
 
     /* Save current VCPU affinity; force wakeup on *this* CPU only. */
     if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
@@ -154,24 +154,25 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         "push %%rbx; push %%rbp; push %%r12;"
         "push %%r13; push %%r14; push %%r15;"
 
-        "sub %%esp,%%ecx;"
+        "sub %%esp, %%ecx;" /* ecx = delta to cpu_info */
         "cmp %[sz], %%ecx;"
         "ja .L_skip;"       /* Bail if >4k */
-        "mov %%rsp,%%rsi;"
+
+        "mov %%ecx, %%eax;"
+        "mov %%rsp, %%rsi;" /* Copy from the stack, into wqv->stack */
 
         /* check_wakeup_from_wait() longjmp()'s to this point. */
         ".L_wq_resume: rep movsb;"
-        "mov %%rsp,%%rsi;"
 
         ".L_skip:"
         "pop %%r15; pop %%r14; pop %%r13;"
         "pop %%r12; pop %%rbp; pop %%rbx;"
-        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
-        : "0" (0), "1" (cpu_info), "2" (wqv->stack),
+        : "=a" (used), "=D" (dummy),     "=c" (dummy),         "=&S" (dummy)
+        : "a" (0),     "D" (wqv->stack), "c" (get_cpu_info()),
           [sz] "i" (PAGE_SIZE)
-        : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
+        : "memory", "rdx", "r8", "r9", "r10", "r11" );
 
-    if ( unlikely(wqv->esp == 0) )
+    if ( unlikely(used > PAGE_SIZE) )
     {
         gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
         domain_crash(curr->domain);
@@ -179,11 +180,13 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         for ( ; ; )
             do_softirq();
     }
+
+    wqv->used = used;
 }
 
 static void __finish_wait(struct waitqueue_vcpu *wqv)
 {
-    wqv->esp = NULL;
+    wqv->used = 0;
     vcpu_temporary_affinity(current, NR_CPUS, VCPU_AFFINITY_WAIT);
 }
 
@@ -191,10 +194,11 @@ void check_wakeup_from_wait(void)
 {
     struct vcpu *curr = current;
     struct waitqueue_vcpu *wqv = curr->waitqueue_vcpu;
+    unsigned long tmp;
 
     ASSERT(list_empty(&wqv->list));
 
-    if ( likely(wqv->esp == NULL) )
+    if ( likely(!wqv->used) )
         return;
 
     /* Check if we are still pinned. */
@@ -220,14 +224,22 @@ void check_wakeup_from_wait(void)
      * the rep movs in __prepare_to_wait(), it copies from wqv->stack over the
      * active stack.
      *
+     * We are also bound by __prepare_to_wait()'s output constraints, so %eax
+     * needs to be wqv->used.
+     *
      * All other GPRs are available for use; they're either restored from
      * wqv->stack or explicitly clobbered.
      */
-    asm volatile ( "mov %%rdi, %%rsp;"
+    asm volatile ( "sub %%esp, %k[var];" /* var = delta to cpu_info */
+                   "neg %k[var];"
+                   "add %%ecx, %k[var];" /* var = -delta + wqv->used */
+
+                   "sub %[var], %%rsp;"  /* Adjust %rsp down to make room */
+                   "mov %%rsp, %%rdi;"   /* Copy from wqv->stack, into the stack */
                    "jmp .L_wq_resume;"
-                   :
-                   : "S" (wqv->stack), "D" (wqv->esp),
-                     "c" ((char *)get_cpu_info() - (char *)wqv->esp)
+                   : "=D" (tmp), [var] "=&r" (tmp)
+                   : "S" (wqv->stack), "c" (wqv->used), "a" (wqv->used),
+                     "[var]" (get_cpu_info())
                    : "memory" );
     unreachable();
 }
-- 
2.11.0


