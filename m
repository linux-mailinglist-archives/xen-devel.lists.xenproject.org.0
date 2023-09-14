Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E179FA67
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601777.938002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel9-0002jW-4J; Thu, 14 Sep 2023 05:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601777.938002; Thu, 14 Sep 2023 05:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel8-0002aT-S1; Thu, 14 Sep 2023 05:19:22 +0000
Received: by outflank-mailman (input) for mailman id 601777;
 Thu, 14 Sep 2023 05:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgel6-0001XI-DV
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:20 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40f3d8c9-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:18 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:31 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:30 -0700
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
X-Inumbo-ID: 40f3d8c9-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668758; x=1726204758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5CJMqB3+DFFPkJgP2JbGGqYZrsstVDR6C7ywuBVlQe8=;
  b=UDGPezT2r1lItN9QmHWJFF8+q7GloYICmG61JL4rHuFMkaLFs64hHeLs
   c9kfIruKb3oX/7Wlpqq8eeMp3rNqQiLmYh7KX8D8O/vaxXR7bXLmIexnl
   43Dj9YGMb5luqJdppXG3vrbhtK6FmTV5WQY6RDvjACnH4scXLa79NzTIq
   q76DCj3BHQ3KCDg5aPWhq6ebIrSQ/JlzWZ05gNC1z0Ya+opZ+87vD0qcL
   fTVo8bNPGcu9fgjPRbp93iN8jBlmu/zT0yMABxIrEy6ubPylUEh8/rArQ
   RfA/SLgw5+6J5jDZ8xtw/F3C09m3GJ9XpWvZV9RSmRzW8Cb8Gryyo3Gs6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661118"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661118"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488746"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488746"
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
Subject: [PATCH v10 04/38] x86/entry: Remove idtentry_sysvec from entry_{32,64}.S
Date: Wed, 13 Sep 2023 21:47:31 -0700
Message-Id: <20230914044805.301390-5-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idtentry_sysvec is really just DECLARE_IDTENTRY defined in
<asm/idtentry.h>, no need to define it separately.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/entry/entry_32.S       | 4 ----
 arch/x86/entry/entry_64.S       | 8 --------
 arch/x86/include/asm/idtentry.h | 2 +-
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 6e6af42e044a..e0f22ad8ff7e 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -649,10 +649,6 @@ SYM_CODE_START_LOCAL(asm_\cfunc)
 SYM_CODE_END(asm_\cfunc)
 .endm
 
-.macro idtentry_sysvec vector cfunc
-	idtentry \vector asm_\cfunc \cfunc has_error_code=0
-.endm
-
 /*
  * Include the defines which emit the idt entries which are shared
  * shared between 32 and 64 bit and emit the __irqentry_text_* markers
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 43606de22511..9cdb61ea91de 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -432,14 +432,6 @@ SYM_CODE_END(\asmsym)
 	idtentry \vector asm_\cfunc \cfunc has_error_code=1
 .endm
 
-/*
- * System vectors which invoke their handlers directly and are not
- * going through the regular common device interrupt handling code.
- */
-.macro idtentry_sysvec vector cfunc
-	idtentry \vector asm_\cfunc \cfunc has_error_code=0
-.endm
-
 /**
  * idtentry_mce_db - Macro to generate entry stubs for #MC and #DB
  * @vector:		Vector number
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 05fd175cec7d..cfca68f6cb84 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -447,7 +447,7 @@ __visible noinstr void func(struct pt_regs *regs,			\
 
 /* System vector entries */
 #define DECLARE_IDTENTRY_SYSVEC(vector, func)				\
-	idtentry_sysvec vector func
+	DECLARE_IDTENTRY(vector, func)
 
 #ifdef CONFIG_X86_64
 # define DECLARE_IDTENTRY_MCE(vector, func)				\
-- 
2.34.1


