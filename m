Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D7262CBD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtP-0008V8-PV; Wed, 09 Sep 2020 09:59:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtO-0008SC-RH
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:59:54 +0000
X-Inumbo-ID: 5ae97973-df49-4a94-8459-a4f4a86a9017
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ae97973-df49-4a94-8459-a4f4a86a9017;
 Wed, 09 Sep 2020 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=omgwX94meR9g2tOyVCxV+2Bo3Nu0tqHjyyAWxvHuVi8=;
 b=Ks90o/BjeOAwW8BJ2Piub8mGKRkc+vPKMfZm3e39q0FeFJs+Pp3CsfJG
 JxXxb9iFBchYQYZl2jnTWnmjlQ6yszHGdXHAIUqNSpS6mnsGJvFw9cqXc
 qLgD8xfKbfQhHiG9s/vIko+xUZN53KRL8AunuRoj4v/8+2NHpWbiCMw5I 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sEB81jO8yAmHZnB7wNrWC9viDBCDKqAgErxga3DBrc4/iJQpe79MRxz5y80jtxnEXgJkDPpCur
 7RVd5nWVHmxOAqkoAyHgHvcmEZz/vCY97y7Lrglj/Wp3XQ0b7yJY+2RI0K28jh3DKdhf/mmOl/
 jRJ6S0YqzX++0+ql05KefgQaL802r25lIvwq4sRMmejJ8DSwJ5Esl2kohnW9lzoW4zwS+4zs6e
 aoG4hEg6Gr93eJtWUuZw/dSVyVT8AHUrTXHXAzNsVfPPDCN7uVDgJWYrFIfZLKEwKguRXUWkEV
 m9c=
X-SBRS: 2.7
X-MesageID: 26254234
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26254234"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] x86/pv: Optimise prefetching in svm_load_segs()
Date: Wed, 9 Sep 2020 10:59:18 +0100
Message-ID: <20200909095920.25495-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200909095920.25495-1-andrew.cooper3@citrix.com>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Split into two functions.  Passing a load of zeros in results in somewhat poor
register scheduling in __context_switch().

Update the prefetching comment to note that the main point is the TLB fill.

Reorder the writes in svm_load_segs() to access the VMCB fields in ascending
order, which gets better next-line prefetch behaviour out of hardware.  Update
the prefetch instruction to match.

The net delta is:

  add/remove: 1/0 grow/shrink: 0/2 up/down: 38/-39 (-1)
  Function                                     old     new   delta
  svm_load_segs_prefetch                         -      38     +38
  __context_switch                             967     951     -16
  svm_load_segs                                291     268     -23

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/hvm/svm/svm.c        | 43 ++++++++++++++++++++-------------------
 xen/include/asm-x86/hvm/svm/svm.h |  5 +++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 2271bee36a..0b0e3f8294 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1928,7 +1928,7 @@ static void __context_switch(void)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( cpu_has_svm && is_pv_domain(nd) && !is_pv_32bit_domain(nd) &&
          !is_idle_domain(nd) )
-        svm_load_segs(0, 0, 0, 0, 0);
+        svm_load_segs_prefetch();
 #endif
 
     if ( need_full_gdt(nd) && !per_cpu(full_gdt_loaded, cpu) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 23b2a2aa17..9a2aca7770 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1520,6 +1520,19 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
 }
 
 #ifdef CONFIG_PV
+void svm_load_segs_prefetch(void)
+{
+    struct vmcb_struct *vmcb = this_cpu(host_vmcb_va);
+
+    if ( vmcb )
+        /*
+         * The main reason for this prefetch is for the TLB fill.  Use the
+         * opporunity to fetch the lowest address used, to get the best
+         * behaviour out of hardwares next-line prefetcher.
+         */
+        prefetchw(&vmcb->fs);
+}
+
 bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow)
@@ -1530,17 +1543,15 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
     if ( unlikely(!vmcb) )
         return false;
 
-    if ( !ldt_base )
-    {
-        /*
-         * The actual structure field used here was arbitrarily chosen.
-         * Empirically it doesn't seem to matter much which element is used,
-         * and a clear explanation of the otherwise poor performance has not
-         * been found/provided so far.
-         */
-        prefetchw(&vmcb->ldtr);
-        return true;
-    }
+    vmcb->fs.sel = 0;
+    vmcb->fs.attr = 0;
+    vmcb->fs.limit = 0;
+    vmcb->fs.base = fs_base;
+
+    vmcb->gs.sel = 0;
+    vmcb->gs.attr = 0;
+    vmcb->gs.limit = 0;
+    vmcb->gs.base = gs_base;
 
     if ( likely(!ldt_ents) )
         memset(&vmcb->ldtr, 0, sizeof(vmcb->ldtr));
@@ -1558,16 +1569,6 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
         vmcb->ldtr.base = ldt_base;
     }
 
-    vmcb->fs.sel = 0;
-    vmcb->fs.attr = 0;
-    vmcb->fs.limit = 0;
-    vmcb->fs.base = fs_base;
-
-    vmcb->gs.sel = 0;
-    vmcb->gs.attr = 0;
-    vmcb->gs.limit = 0;
-    vmcb->gs.base = gs_base;
-
     vmcb->kerngsbase = gs_shadow;
 
     svm_vmload_pa(per_cpu(host_vmcb, cpu));
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index 2310878e41..faeca40174 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -50,12 +50,13 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
 
 /*
- * PV context switch helper. Calls with zero ldt_base request a prefetch of
- * the VMCB area to be loaded from, instead of an actual load of state.
+ * PV context switch helpers.  Prefetching the VMCB area itself has been shown
+ * to be useful for performance.
  *
  * Must only be used for NUL FS/GS, as the segment attributes/limits are not
  * read from the GDT/LDT.
  */
+void svm_load_segs_prefetch(void);
 bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
-- 
2.11.0


