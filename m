Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155B7ABFED
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607137.945411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgb-0000JR-V9; Sat, 23 Sep 2023 10:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607137.945411; Sat, 23 Sep 2023 10:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgb-0000CC-Ps; Sat, 23 Sep 2023 10:16:29 +0000
Received: by outflank-mailman (input) for mailman id 607137;
 Sat, 23 Sep 2023 10:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcL-0000Pn-7f
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:05 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f8e696d-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:56 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:46 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:46 -0700
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
X-Inumbo-ID: 9f8e696d-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463916; x=1726999916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=daicXFK30tmpTUp95RTD2ZQAe5K9xY8zuW1WSEbSaqA=;
  b=bTvLYvEL753J6F+eT7JbN/mdzjZC7Rq5LQCQFkvCCAqkes4P/hwHR1+B
   UleqtudmL/IKwrD84g+JSVa8A7tKh1UUyKR9D1NsCeQPb6z5VfuCzNAir
   vu4aKHpjix2pcX4cIrCmk2aQRYy/QoeIP/vziv4mxEwVgvGrvjBJkIzEd
   UHcalqfL0TISgwSVAFQS0SU0I8ELlV1AdEqbOuF7KSe9Bkc4tZvdySSHI
   jbWhD3K/dXlzVBirVP+nnQMzVYIr2KJ6NasNuM4tySXYLY3y9uPO8AFja
   453EWHmSouN3jYga5/cLvw7na2DafSB6h30p1IOPp3Bd+UJRuOp/9Inn3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492327"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492327"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388176"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388176"
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
Subject: [PATCH v11 21/37] x86/fred: No ESPFIX needed when FRED is enabled
Date: Sat, 23 Sep 2023 02:41:56 -0700
Message-Id: <20230923094212.26520-22-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Because FRED always restores the full value of %rsp, ESPFIX is
no longer needed when it's enabled.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/kernel/espfix_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/espfix_64.c b/arch/x86/kernel/espfix_64.c
index 16f9814c9be0..6726e0473d0b 100644
--- a/arch/x86/kernel/espfix_64.c
+++ b/arch/x86/kernel/espfix_64.c
@@ -106,6 +106,10 @@ void __init init_espfix_bsp(void)
 	pgd_t *pgd;
 	p4d_t *p4d;
 
+	/* FRED systems always restore the full value of %rsp */
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		return;
+
 	/* Install the espfix pud into the kernel page directory */
 	pgd = &init_top_pgt[pgd_index(ESPFIX_BASE_ADDR)];
 	p4d = p4d_alloc(&init_mm, pgd, ESPFIX_BASE_ADDR);
@@ -129,6 +133,10 @@ void init_espfix_ap(int cpu)
 	void *stack_page;
 	pteval_t ptemask;
 
+	/* FRED systems always restore the full value of %rsp */
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		return;
+
 	/* We only have to do this once... */
 	if (likely(per_cpu(espfix_stack, cpu)))
 		return;		/* Already initialized */
-- 
2.34.1


