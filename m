Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA2C4BFCB5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276925.473317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBt-0005ve-TG; Tue, 22 Feb 2022 15:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276925.473317; Tue, 22 Feb 2022 15:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBt-0005tT-P7; Tue, 22 Feb 2022 15:35:01 +0000
Received: by outflank-mailman (input) for mailman id 276925;
 Tue, 22 Feb 2022 15:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXBs-0005NF-8J
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:35:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5e0568-93f4-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:34:59 +0100 (CET)
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
X-Inumbo-ID: fd5e0568-93f4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4bBOiMpVdWF12ymMblnGk01vxKqLv1d+rpIj3W+2L6w=;
  b=b1ZUG1DPCFOo2el/7shHwNWKtlFhTkTHxhYS3jfTCsiIYEW/ZVfQ0z/e
   eYgXm2hrM+pPInTfS7PE+JL+lAQeSYI9c6xhuj0Gct0L4TjKM8ykEDGN3
   i9zg+x5NujiiDVRZLjpMSmn2I+AFj6YWgo/B8Z812rgk6WSFsHBVmIliF
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66982709
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eP2spqkiMODgKh6tBgwoO/jo5gzlJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWDuDOvmKZWanfNp3bISx9B8D6JLczIAwS1dr/H01HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWVnV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZxV3NYzLv/onSzZTEHpGMLZk4ufcCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHN2s/NkuYMnWjPH8qLcNvsb2xnELgci17rXDJhI9m+y/cmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WFGuVC2QPJgDZJUVtPCAX98aLRZlOCt8x3B
 V5K8QspirYI7GOgTYLFUgaauiafl0tJMzZPKNES5AaIw6vSxg+WAGkYUzJMAOAbWN8KqS8Cj
 QHQwY6wbdB7mPjMEC/GqO/Ixd+nEXVNdQc/iTk4oRzpCjUJiKU6lVrxQ9lqC8ZZZfWlSGirk
 1hmQMXT7oj/bPLnNY3mpTgrYBr2//AlqzLZAC2NBQpJCSsjOeaYi3SAswSz0Bq5BN/xoqO9l
 HYFgdOCy+sFEIuAkieAKM1UQu30u6jUbWCG3Qc3d3XEy9hL0yT4FWy3yGsjTHqFz+5eIWO5C
 KMtkVk5CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps04nfIVCqWdgDSvpXk0DWbJhjiFuBF1zckXZ
 MfKGe7xXC1yIfk2k1KLqxI1jOZDKtYWnjiIG/gWDn2PjNKjWZJiYe1baADXNrhhtstpYmz9q
 r5iCidD8D0HOMWWX8Ud2dd7wYwiRZTjOa3Llg==
IronPort-HdrOrdr: A9a23:ukfrnqzFx3ZIqSmF9LpJKrPwKL1zdoMgy1knxilNoRw8SK2lfq
 GV7YwmPHDP+VUssR0b9uxofZPwJU80lqQFmLX5X43SPjUO0VHAROoJgOffKn/bakrDH4ZmpM
 FdmsNFaOEYY2IVsS+D2njcL+od
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66982709"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 46/70] x86/logdirty: CFI hardening
Date: Tue, 22 Feb 2022 15:26:41 +0000
Message-ID: <20220222152645.8844-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
 * Fix !CONFIG_SHADOW build.  Annotate targets in none.c
---
 xen/arch/x86/mm/hap/hap.c       |  6 +++---
 xen/arch/x86/mm/shadow/common.c | 12 ++++++------
 xen/arch/x86/mm/shadow/none.c   |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index de4b13565ab4..ed5112b00b63 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -180,7 +180,7 @@ int hap_track_dirty_vram(struct domain *d,
  * NB: Domain that having device assigned should not set log_global. Because
  * there is no way to track the memory updating from device.
  */
-static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
+static int cf_check hap_enable_log_dirty(struct domain *d, bool log_global)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
@@ -211,7 +211,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
     return 0;
 }
 
-static int hap_disable_log_dirty(struct domain *d)
+static int cf_check hap_disable_log_dirty(struct domain *d)
 {
     paging_lock(d);
     d->arch.paging.mode &= ~PG_log_dirty;
@@ -228,7 +228,7 @@ static int hap_disable_log_dirty(struct domain *d)
     return 0;
 }
 
-static void hap_clean_dirty_bitmap(struct domain *d)
+static void cf_check hap_clean_dirty_bitmap(struct domain *d)
 {
     /*
      * Switch to log-dirty mode, either by setting l1e entries of P2M table to
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 83dedc8870aa..071a19adce82 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -40,9 +40,9 @@
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
-static int sh_enable_log_dirty(struct domain *, bool log_global);
-static int sh_disable_log_dirty(struct domain *);
-static void sh_clean_dirty_bitmap(struct domain *);
+static int cf_check sh_enable_log_dirty(struct domain *, bool log_global);
+static int cf_check sh_disable_log_dirty(struct domain *);
+static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
@@ -3016,7 +3016,7 @@ static int shadow_test_disable(struct domain *d)
 /* Shadow specific code which is called in paging_log_dirty_enable().
  * Return 0 if no problem found.
  */
-static int sh_enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check sh_enable_log_dirty(struct domain *d, bool log_global)
 {
     int ret;
 
@@ -3044,7 +3044,7 @@ static int sh_enable_log_dirty(struct domain *d, bool log_global)
 }
 
 /* shadow specfic code which is called in paging_log_dirty_disable() */
-static int sh_disable_log_dirty(struct domain *d)
+static int cf_check sh_disable_log_dirty(struct domain *d)
 {
     int ret;
 
@@ -3058,7 +3058,7 @@ static int sh_disable_log_dirty(struct domain *d)
 /* This function is called when we CLEAN log dirty bitmap. See
  * paging_log_dirty_op() for details.
  */
-static void sh_clean_dirty_bitmap(struct domain *d)
+static void cf_check sh_clean_dirty_bitmap(struct domain *d)
 {
     paging_lock(d);
     /* Need to revoke write access to the domain's pages again.
diff --git a/xen/arch/x86/mm/shadow/none.c b/xen/arch/x86/mm/shadow/none.c
index 79889b926a89..463a0e3e89c3 100644
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -1,19 +1,19 @@
 #include <xen/mm.h>
 #include <asm/shadow.h>
 
-static int _enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check _enable_log_dirty(struct domain *d, bool log_global)
 {
     ASSERT(is_pv_domain(d));
     return -EOPNOTSUPP;
 }
 
-static int _disable_log_dirty(struct domain *d)
+static int cf_check _disable_log_dirty(struct domain *d)
 {
     ASSERT(is_pv_domain(d));
     return -EOPNOTSUPP;
 }
 
-static void _clean_dirty_bitmap(struct domain *d)
+static void cf_check _clean_dirty_bitmap(struct domain *d)
 {
     ASSERT(is_pv_domain(d));
 }
-- 
2.11.0


