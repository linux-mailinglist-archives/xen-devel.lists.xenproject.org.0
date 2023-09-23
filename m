Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB757AC064
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607205.945619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjziQ-0004dJ-N1; Sat, 23 Sep 2023 10:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607205.945619; Sat, 23 Sep 2023 10:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjziQ-0004Ys-JG; Sat, 23 Sep 2023 10:18:22 +0000
Received: by outflank-mailman (input) for mailman id 607205;
 Sat, 23 Sep 2023 10:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcJ-0000Pn-78
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:03 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa922c9-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:55 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:45 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:44 -0700
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
X-Inumbo-ID: 9fa922c9-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463915; x=1726999915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U5v5FfPZcbv+kEeu4BDXYc9n8fkslqM+14uJJDiLwkk=;
  b=WPfB7UKtiEuFbXEXqidrWzrv0G2GfmJptzDs8I3fMn0Y0Tnfp1vczppZ
   zWufH1uJHyDPN9w8d9WtBYyEFyX+cIAbsxKhvmh2+TTNXTJlLEJ9wxZdB
   Ckv+XSRpbnjPrAVxKm3MNk0jSS9wF7gc8W25g4C9YXXllyAWNWloLGK3q
   DNuxllCA7qK4pSXhyPxetQhwobTUzDwIbRd2hEpFYHibdgFe6v8QC8269
   MloJLMpCGMzVJnpqKsKq/xC3KUSqQpqweUqiQtZdICn1c9F2p/5a0Pocz
   23UTQafWj5mAEQcDYPXXDiZeyvPaAKyURfsO75pO+76gmvqNEbfs1KTiR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492303"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492303"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388168"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388168"
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
Subject: [PATCH v11 19/37] x86/fred: Update MSR_IA32_FRED_RSP0 during task switch
Date: Sat, 23 Sep 2023 02:41:54 -0700
Message-Id: <20230923094212.26520-20-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

MSR_IA32_FRED_RSP0 is used during ring 3 event delivery, and needs to
be updated to point to the top of next task stack during task switch.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/switch_to.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/switch_to.h b/arch/x86/include/asm/switch_to.h
index f42dbf17f52b..c3bd0c0758c9 100644
--- a/arch/x86/include/asm/switch_to.h
+++ b/arch/x86/include/asm/switch_to.h
@@ -70,9 +70,13 @@ static inline void update_task_stack(struct task_struct *task)
 #ifdef CONFIG_X86_32
 	this_cpu_write(cpu_tss_rw.x86_tss.sp1, task->thread.sp0);
 #else
-	/* Xen PV enters the kernel on the thread stack. */
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
+		/* WRMSRNS is a baseline feature for FRED. */
+		wrmsrns(MSR_IA32_FRED_RSP0, (unsigned long)task_stack_page(task) + THREAD_SIZE);
+	} else if (cpu_feature_enabled(X86_FEATURE_XENPV)) {
+		/* Xen PV enters the kernel on the thread stack. */
 		load_sp0(task_top_of_stack(task));
+	}
 #endif
 }
 
-- 
2.34.1


