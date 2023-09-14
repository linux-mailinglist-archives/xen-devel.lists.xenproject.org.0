Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF279FAE2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601926.938306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgez8-0008Fc-F9; Thu, 14 Sep 2023 05:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601926.938306; Thu, 14 Sep 2023 05:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgez8-0008Ah-9b; Thu, 14 Sep 2023 05:33:50 +0000
Received: by outflank-mailman (input) for mailman id 601926;
 Thu, 14 Sep 2023 05:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelN-0001X7-6p
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:37 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4abbb475-52be-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 07:19:35 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:45 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:44 -0700
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
X-Inumbo-ID: 4abbb475-52be-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668775; x=1726204775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M6fmRAapBD1o7lcFP0DE6JJOLTPbVa+6x+sO9If/vNA=;
  b=WpPxeH1Ts2MvSGl6bDZHyuRN69wLPuzT80OxMtnqt0CLhb0kexc3Ez41
   GlWxBbarZ6paIjDdFqbNd+8m/YeRPzv2S+1zVjvS0s4LdPaqLNE5uU4SC
   8m/2t7X5fw+exD9qAKXH0ekSneJ4p4ZTv2HHW8PgcGDhzyl0pkOUe9ID4
   9EGaUfCUr8TVwHQbUZZId9tEJvTFi9OA+YyHwI3dUiRALI2U5b8gLrpX2
   1OCfG1EFHAXs64JsI8dIN6LxGVugdJnPNkfAgbPS1YDI9SxBMFOWiBXTV
   xyy8XGrvhmks86IGGubK1kLzLyT2/A4rJOTA9qV2wEeVJTQXyTo4S35lu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661459"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661459"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488829"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488829"
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
	jiangshanlai@gmail.com
Subject: [PATCH v10 30/38] x86/fred: Let ret_from_fork_asm() jmp to asm_fred_exit_user when FRED is enabled
Date: Wed, 13 Sep 2023 21:47:57 -0700
Message-Id: <20230914044805.301390-31-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Let ret_from_fork_asm() jmp to asm_fred_exit_user when FRED is enabled,
otherwise the existing IDT code is chosen.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/entry/entry_64.S      | 6 ++++++
 arch/x86/entry/entry_64_fred.S | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 9cdb61ea91de..c9e14617dd3f 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -309,7 +309,13 @@ SYM_CODE_START(ret_from_fork_asm)
 	 * and unwind should work normally.
 	 */
 	UNWIND_HINT_REGS
+
+#ifdef CONFIG_X86_FRED
+	ALTERNATIVE "jmp swapgs_restore_regs_and_return_to_usermode", \
+		    "jmp asm_fred_exit_user", X86_FEATURE_FRED
+#else
 	jmp	swapgs_restore_regs_and_return_to_usermode
+#endif
 SYM_CODE_END(ret_from_fork_asm)
 .popsection
 
diff --git a/arch/x86/entry/entry_64_fred.S b/arch/x86/entry/entry_64_fred.S
index 37a1dd5e8ace..5781c3411b44 100644
--- a/arch/x86/entry/entry_64_fred.S
+++ b/arch/x86/entry/entry_64_fred.S
@@ -32,6 +32,7 @@
 SYM_CODE_START_NOALIGN(asm_fred_entrypoint_user)
 	FRED_ENTER
 	call	fred_entry_from_user
+SYM_INNER_LABEL(asm_fred_exit_user, SYM_L_GLOBAL)
 	FRED_EXIT
 	ERETU
 SYM_CODE_END(asm_fred_entrypoint_user)
-- 
2.34.1


