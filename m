Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF914A4B268
	for <lists+xen-devel@lfdr.de>; Sun,  2 Mar 2025 15:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899724.1307817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjv-0002Qh-BH; Sun, 02 Mar 2025 14:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899724.1307817; Sun, 02 Mar 2025 14:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjv-0002OR-8W; Sun, 02 Mar 2025 14:56:23 +0000
Received: by outflank-mailman (input) for mailman id 899724;
 Sun, 02 Mar 2025 14:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRaO=VV=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tokjt-0001QO-IT
 for xen-devel@lists.xenproject.org; Sun, 02 Mar 2025 14:56:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7fe5db7e-f776-11ef-9898-31a8f345e629;
 Sun, 02 Mar 2025 15:56:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B79A16F8;
 Sun,  2 Mar 2025 06:56:33 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8B43F5A1;
 Sun,  2 Mar 2025 06:56:16 -0800 (PST)
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
X-Inumbo-ID: 7fe5db7e-f776-11ef-9898-31a8f345e629
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] Revert "x86/xen: allow nesting of same lazy mode"
Date: Sun,  2 Mar 2025 14:55:54 +0000
Message-ID: <20250302145555.3236789-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302145555.3236789-1-ryan.roberts@arm.com>
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 49147beb0ccb ("x86/xen: allow nesting of same lazy mode") was
added as a solution for a core-mm code change where
arch_[enter|leave]_lazy_mmu_mode() started to be called in a nested
manner; see commit bcc6cc832573 ("mm: add default definition of
set_ptes()").

However, now that we have fixed the API to avoid nesting, we no longer
need this capability in the x86 implementation.

Additionally, from code review, I don't believe the fix was ever robust
in the case of preemption occurring while in the nested lazy mode. The
implementation usually deals with preemption by calling
arch_leave_lazy_mmu_mode() from xen_start_context_switch() for the
outgoing task if we are in the lazy mmu mode. Then in
xen_end_context_switch(), it restarts the lazy mode by calling
arch_enter_lazy_mmu_mode() for an incoming task that was in the lazy
mode when it was switched out. But arch_leave_lazy_mmu_mode() will only
unwind a single level of nesting. If we are in the double nest, then
it's not fully unwound and per-cpu variables are left in a bad state.

So the correct solution is to remove the possibility of nesting from the
higher level (which has now been done) and remove this x86-specific
solution.

Fixes: 49147beb0ccb ("x86/xen: allow nesting of same lazy mode")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/x86/include/asm/xen/hypervisor.h | 15 ++-------------
 arch/x86/xen/enlighten_pv.c           |  1 -
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index a9088250770f..bd0fc69a10a7 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -72,18 +72,10 @@ enum xen_lazy_mode {
 };
 
 DECLARE_PER_CPU(enum xen_lazy_mode, xen_lazy_mode);
-DECLARE_PER_CPU(unsigned int, xen_lazy_nesting);
 
 static inline void enter_lazy(enum xen_lazy_mode mode)
 {
-	enum xen_lazy_mode old_mode = this_cpu_read(xen_lazy_mode);
-
-	if (mode == old_mode) {
-		this_cpu_inc(xen_lazy_nesting);
-		return;
-	}
-
-	BUG_ON(old_mode != XEN_LAZY_NONE);
+	BUG_ON(this_cpu_read(xen_lazy_mode) != XEN_LAZY_NONE);
 
 	this_cpu_write(xen_lazy_mode, mode);
 }
@@ -92,10 +84,7 @@ static inline void leave_lazy(enum xen_lazy_mode mode)
 {
 	BUG_ON(this_cpu_read(xen_lazy_mode) != mode);
 
-	if (this_cpu_read(xen_lazy_nesting) == 0)
-		this_cpu_write(xen_lazy_mode, XEN_LAZY_NONE);
-	else
-		this_cpu_dec(xen_lazy_nesting);
+	this_cpu_write(xen_lazy_mode, XEN_LAZY_NONE);
 }
 
 enum xen_lazy_mode xen_get_lazy_mode(void);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5e57835e999d..919e4df9380b 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -99,7 +99,6 @@ struct tls_descs {
 };
 
 DEFINE_PER_CPU(enum xen_lazy_mode, xen_lazy_mode) = XEN_LAZY_NONE;
-DEFINE_PER_CPU(unsigned int, xen_lazy_nesting);
 
 enum xen_lazy_mode xen_get_lazy_mode(void)
 {
-- 
2.43.0


