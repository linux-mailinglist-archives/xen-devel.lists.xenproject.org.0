Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397E7ABFE3
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607084.945262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzc3-0000jQ-AL; Sat, 23 Sep 2023 10:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607084.945262; Sat, 23 Sep 2023 10:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzc3-0000bc-6R; Sat, 23 Sep 2023 10:11:47 +0000
Received: by outflank-mailman (input) for mailman id 607084;
 Sat, 23 Sep 2023 10:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzc2-0000Pn-4d
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:11:46 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 973034ac-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:42 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:37 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:36 -0700
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
X-Inumbo-ID: 973034ac-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463902; x=1726999902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MxQyQabDuj01hP6xHQ5mL2MlMceZ5LcTb8ReoP3KjJA=;
  b=KFGNScWaoQcbQsEA+h9DNqSZNUUaetMKn9dSXujxOMwSq9jpzJxYFsy1
   HXuSOB0wIL8wTkmu0jffBYjKdOSqNGKWe/ncdQ+elM15/mv5NrdD5MfJQ
   jcJ84cJaabaD6TyNSICG3k+FyqVDrN4aYblKHfXbR74Yp2u6zdMc/xx8J
   Qf/4eZM4BwYVxS9/HmqdTfQ6S9D3yBua+Z7P+PDKUYJxBxNMG63t77q2L
   yM4u1yW65GDVho1N+vjTK/kevJQ0zkaHnOq5obS3zzHZE6EF8KLWcaQCK
   5Tt7puzGEfIDrURRtGo8OnqTLgPCRJWQztBFH7N5DTuW7jUdzsq8YVkfT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492094"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492094"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388103"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388103"
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
Subject: [PATCH v11 02/37] x86/opcode: Add the WRMSRNS instruction to the x86 opcode map
Date: Sat, 23 Sep 2023 02:41:37 -0700
Message-Id: <20230923094212.26520-3-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the opcode used by WRMSRNS, which is the non-serializing version of
WRMSR and may replace it to improve performance, to the x86 opcode map.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/lib/x86-opcode-map.txt       | 2 +-
 tools/arch/x86/lib/x86-opcode-map.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index 5168ee0360b2..1efe1d9bf5ce 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -1051,7 +1051,7 @@ GrpTable: Grp6
 EndTable
 
 GrpTable: Grp7
-0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
+0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
 1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
 2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
 3: LIDT Ms
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index 5168ee0360b2..1efe1d9bf5ce 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -1051,7 +1051,7 @@ GrpTable: Grp6
 EndTable
 
 GrpTable: Grp7
-0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
+0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
 1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
 2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
 3: LIDT Ms
-- 
2.34.1


