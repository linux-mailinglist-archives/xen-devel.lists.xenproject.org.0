Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BAD7B6186
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611889.951525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIq-0004Hn-EP; Tue, 03 Oct 2023 06:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611889.951525; Tue, 03 Oct 2023 06:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIq-0004CF-Ao; Tue, 03 Oct 2023 06:54:44 +0000
Received: by outflank-mailman (input) for mailman id 611889;
 Tue, 03 Oct 2023 06:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIp-00040o-3J
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:43 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba688412-61b9-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 08:54:42 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:37 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:36 -0700
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
X-Inumbo-ID: ba688412-61b9-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316082; x=1727852082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IaxeoNWuhGDXlIm0wMB8nNslGvpF2+LIDATl0KgTQLA=;
  b=NfB/fRiqcfMsba6vsRr/mORbMHrcu3fZXKzmKXOFYt1urrbgkhFLbNdT
   KV4UBX2W+0m8mVcGU0h4OHGIWAIyqE1Oq8VOo/N9J4zN22TI+Wmjyjta1
   hC6ERHsafuuo47CfP527Vk5zWcdep3PE+WDCShfiDhSFtUqUMKfRiWERl
   zJxoqq7wqmBt0Pmn6lJRwTkBHzPxkYSzrg/rq/Uo4YML3lyHxfKCg2hNO
   KZ9/PyRF8j3wxHCD/x84W3uhYZ8DLhwpE2FWKPR3dxqywcmEPx7893ynv
   n63/2KRHtN/nWoGfnWMKImSHRjOlMTK5PvycI9KV/HoyD6AsfaEKd/L+8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367857939"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367857939"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900906"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900906"
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
	nik.borisov@suse.com
Subject: [PATCH v12 04/37] x86/entry: Remove idtentry_sysvec from entry_{32,64}.S
Date: Mon,  2 Oct 2023 23:24:25 -0700
Message-Id: <20231003062458.23552-5-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
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
index 9b4b512f2a75..aa4214703091 100644
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


