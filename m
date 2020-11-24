Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40B2C30BD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36924.69045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khe1Y-0005gG-8K; Tue, 24 Nov 2020 19:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36924.69045; Tue, 24 Nov 2020 19:30:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khe1Y-0005eW-0q; Tue, 24 Nov 2020 19:30:48 +0000
Received: by outflank-mailman (input) for mailman id 36924;
 Tue, 24 Nov 2020 19:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khe1W-0005cT-6c
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khe1U-0004Ok-B6; Tue, 24 Nov 2020 19:30:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfV-0000r4-5F; Tue, 24 Nov 2020 19:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khe1W-0005cT-6c
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=5cd/xhDogl5UDMyDsWm0T9i011ok+fe44oXnYZ42O/I=; b=Qmp21wK5h1oc0ABJmUzsUyrNLh
	BKxtVu8O1r2cZKJUdkJ33s7n+l+d+S7+GeB/Np/G6JDTVP+3O8dwmE+VYhl/7dwz9RzyWL1j0r2D6
	42mY+Y1R4hhg3uW0tgsZqOR8CJkVfG6a+eVhJOYWGqGQh7rkVZIgHMUjBq5PCCHlDA14=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khe1U-0004Ok-B6; Tue, 24 Nov 2020 19:30:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfV-0000r4-5F; Tue, 24 Nov 2020 19:08:01 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 13/13] x86: replace open-coded occurrences of sizeof_field()...
Date: Tue, 24 Nov 2020 19:07:44 +0000
Message-Id: <20201124190744.11343-14-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
References: <20201124190744.11343-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... with macro evaluations, now that it is available.

A recent patch imported the sizeof_field() macro from Linux. This patch makes
use of it in places where the construct is currently open-coded.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/vpmu_intel.c |  4 ++--
 xen/arch/x86/setup.c          | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 75aa11c6adec..6e97ce790037 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -90,8 +90,8 @@ static uint64_t __read_mostly global_ovf_ctrl_mask, global_ctrl_mask;
 static unsigned int __read_mostly regs_sz;
 /* Offset into context of the beginning of PMU register block */
 static const unsigned int regs_off =
-        sizeof(((struct xen_pmu_intel_ctxt *)0)->fixed_counters) +
-        sizeof(((struct xen_pmu_intel_ctxt *)0)->arch_counters);
+    sizeof_field(struct xen_pmu_intel_ctxt, fixed_counters) +
+    sizeof_field(struct xen_pmu_intel_ctxt, arch_counters);
 
 /*
  * QUIRK to workaround an issue on various family 6 cpus.
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 44c04e273537..30d6f375a3af 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1617,19 +1617,19 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     total_pages = nr_pages;
 
     /* Sanity check for unwanted bloat of certain hypercall structures. */
-    BUILD_BUG_ON(sizeof(((struct xen_platform_op *)0)->u) !=
-                 sizeof(((struct xen_platform_op *)0)->u.pad));
-    BUILD_BUG_ON(sizeof(((struct xen_domctl *)0)->u) !=
-                 sizeof(((struct xen_domctl *)0)->u.pad));
-    BUILD_BUG_ON(sizeof(((struct xen_sysctl *)0)->u) !=
-                 sizeof(((struct xen_sysctl *)0)->u.pad));
+    BUILD_BUG_ON(sizeof_field(struct xen_platform_op, u) !=
+                 sizeof_field(struct xen_platform_op, u.pad));
+    BUILD_BUG_ON(sizeof_field(struct xen_domctl, u) !=
+                 sizeof_field(struct xen_domctl, u.pad));
+    BUILD_BUG_ON(sizeof_field(struct xen_sysctl, u) !=
+                 sizeof_field(struct xen_sysctl, u.pad));
 
     BUILD_BUG_ON(sizeof(start_info_t) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(shared_info_t) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(struct vcpu_info) != 64);
 
-    BUILD_BUG_ON(sizeof(((struct compat_platform_op *)0)->u) !=
-                 sizeof(((struct compat_platform_op *)0)->u.pad));
+    BUILD_BUG_ON(sizeof_field(struct compat_platform_op, u) !=
+                 sizeof_field(struct compat_platform_op, u.pad));
     BUILD_BUG_ON(sizeof(start_info_compat_t) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(struct compat_vcpu_info) != 64);
 
-- 
2.20.1


