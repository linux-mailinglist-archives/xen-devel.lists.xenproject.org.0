Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A892E8052D9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647622.1011063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbu-0001tE-SR; Tue, 05 Dec 2023 11:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647622.1011063; Tue, 05 Dec 2023 11:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbu-0001rW-Pn; Tue, 05 Dec 2023 11:29:06 +0000
Received: by outflank-mailman (input) for mailman id 647622;
 Tue, 05 Dec 2023 11:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUh-0003dP-UV
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:39 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e625f1-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:31 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:23 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:21 -0800
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
X-Inumbo-ID: 70e625f1-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775293; x=1733311293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/uN2WUhxBQNYcu14PCjKEEJ/KO0CK2Le/qFJcLIBoLk=;
  b=eXjW0sGMETibNzXYiuneEF8yJ12Lpx64YjHxAYQDwDGbHjnd1ejzvye3
   X9O1/adT/elBboJOTgn9wyhPBqRu3S/uHWkpaWgn78H/GJsleb7riNnII
   wpgI5kJIuF1GvgAZmKFid3w26FkV4zJzQroT7xo0JWnCZ9BFJqpvwEK3K
   ne+Ql4opnUCsQY3i+2w6gLCN3YpzTp0a3hl7H46pfGy1fc/8B22PJWCm8
   JuklxvOHnJaC+7iW4pR+rlMFWc7o2zLFoqHPxi3DyNzy6Wf9NUGMY7bWk
   0++KpDvM58j9M8gSkb7Wcjf/vbbx0AzeoBFxqS0RYrz3P/YI96y8QaHbz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942520"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942520"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192960"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192960"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 18/35] x86/fred: Disallow the swapgs instruction when FRED is enabled
Date: Tue,  5 Dec 2023 02:50:07 -0800
Message-ID: <20231205105030.8698-19-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

SWAPGS is no longer needed thus NOT allowed with FRED because FRED
transitions ensure that an operating system can _always_ operate
with its own GS base address:
- For events that occur in ring 3, FRED event delivery swaps the GS
  base address with the IA32_KERNEL_GS_BASE MSR.
- ERETU (the FRED transition that returns to ring 3) also swaps the
  GS base address with the IA32_KERNEL_GS_BASE MSR.

And the operating system can still setup the GS segment for a user
thread without the need of loading a user thread GS with:
- Using LKGS, available with FRED, to modify other attributes of the
  GS segment without compromising its ability always to operate with
  its own GS base address.
- Accessing the GS segment base address for a user thread as before
  using RDMSR or WRMSR on the IA32_KERNEL_GS_BASE MSR.

Note, LKGS loads the GS base address into the IA32_KERNEL_GS_BASE MSR
instead of the GS segment's descriptor cache. As such, the operating
system never changes its runtime GS base address.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Change since v12:
* Use the ASCII char ' (char number 0x27), instead of its unicode char
  (Borislav Petkov).

Change since v8:
* Explain why writing directly to the IA32_KERNEL_GS_BASE MSR is
  doing the right thing (Thomas Gleixner).
---
 arch/x86/kernel/process_64.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index b924477c5ba8..7f66c0b14de6 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -166,7 +166,29 @@ static noinstr unsigned long __rdgsbase_inactive(void)
 
 	lockdep_assert_irqs_disabled();
 
-	if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
+	/*
+	 * SWAPGS is no longer needed thus NOT allowed with FRED because
+	 * FRED transitions ensure that an operating system can _always_
+	 * operate with its own GS base address:
+	 * - For events that occur in ring 3, FRED event delivery swaps
+	 *   the GS base address with the IA32_KERNEL_GS_BASE MSR.
+	 * - ERETU (the FRED transition that returns to ring 3) also swaps
+	 *   the GS base address with the IA32_KERNEL_GS_BASE MSR.
+	 *
+	 * And the operating system can still setup the GS segment for a
+	 * user thread without the need of loading a user thread GS with:
+	 * - Using LKGS, available with FRED, to modify other attributes
+	 *   of the GS segment without compromising its ability always to
+	 *   operate with its own GS base address.
+	 * - Accessing the GS segment base address for a user thread as
+	 *   before using RDMSR or WRMSR on the IA32_KERNEL_GS_BASE MSR.
+	 *
+	 * Note, LKGS loads the GS base address into the IA32_KERNEL_GS_BASE
+	 * MSR instead of the GS segment’s descriptor cache. As such, the
+	 * operating system never changes its runtime GS base address.
+	 */
+	if (!cpu_feature_enabled(X86_FEATURE_FRED) &&
+	    !cpu_feature_enabled(X86_FEATURE_XENPV)) {
 		native_swapgs();
 		gsbase = rdgsbase();
 		native_swapgs();
@@ -191,7 +213,8 @@ static noinstr void __wrgsbase_inactive(unsigned long gsbase)
 {
 	lockdep_assert_irqs_disabled();
 
-	if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
+	if (!cpu_feature_enabled(X86_FEATURE_FRED) &&
+	    !cpu_feature_enabled(X86_FEATURE_XENPV)) {
 		native_swapgs();
 		wrgsbase(gsbase);
 		native_swapgs();
-- 
2.43.0


