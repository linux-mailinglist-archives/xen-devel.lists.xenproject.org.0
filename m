Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DD79FA70
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601772.937955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel5-0001fR-3X; Thu, 14 Sep 2023 05:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601772.937955; Thu, 14 Sep 2023 05:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgel4-0001Yj-UX; Thu, 14 Sep 2023 05:19:18 +0000
Received: by outflank-mailman (input) for mailman id 601772;
 Thu, 14 Sep 2023 05:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgel3-0001X7-5c
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:17 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7bdddf-52be-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 07:19:16 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:30 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:29 -0700
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
X-Inumbo-ID: 3f7bdddf-52be-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668756; x=1726204756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kr0CN67v2SsYJemD+2TL2DrONkvf6IluzdZd2yzKUPQ=;
  b=ezwGlEpHYeeZ/0Idm88wug8+t++G2vPBEpedG3NQapaU3ygxRmoqwxOJ
   75w29q7zPmCj8hE6n1W3T3ZOhAnXs9noar78zRvbBgcuclheWQBIylIOv
   bNEtLEr5ssNllwGHvb8IYNu+OwucG56m8oJTv0AKgPEK9GxPZeVwhRkmT
   cmKvCzGPHeIMTDvhgfjW31azofYaEHeLEhCatEWF6+z/CsCmT/bgNIeD1
   m+GcN1K3lPjiDynCch986JkHJiae5wUKCyFTFJBl2nOpfDUZSkDSWzYYs
   w+ztFmo7gZMpBuYNhwy8F6wIyhijnWuRu0QQhom21tgFGWGDO1yRrucTv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661091"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661091"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488739"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488739"
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
Subject: [PATCH v10 02/38] x86/opcode: Add the WRMSRNS instruction to the x86 opcode map
Date: Wed, 13 Sep 2023 21:47:29 -0700
Message-Id: <20230914044805.301390-3-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the opcode used by WRMSRNS, which is the non-serializing version of
WRMSR and may replace it to improve performance, to the x86 opcode map.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
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


