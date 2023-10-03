Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A797B6175
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611898.951611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIx-0006T3-Ur; Tue, 03 Oct 2023 06:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611898.951611; Tue, 03 Oct 2023 06:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIx-0006Ia-Fw; Tue, 03 Oct 2023 06:54:51 +0000
Received: by outflank-mailman (input) for mailman id 611898;
 Tue, 03 Oct 2023 06:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIu-00047B-7i
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:48 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce155d6-61b9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 08:54:46 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:40 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:40 -0700
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
X-Inumbo-ID: bce155d6-61b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316086; x=1727852086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5VPM7WJy8QX3AfDJPn+y86GzsjxiQoeNBcvUeRwUoQ=;
  b=aCWiTG6n8Q1hGGBVkpSEGOPWHYd1a56i3jypHiVmVuWkpQ1RQCGfA8Fz
   Irq8cr1Kj8awf/6vOQLhEjtTefvfejzhU70s++DmnaYmRERJvFTlZUE8W
   7I18SFInUB3DZTC/9X2u6FVTdnDJf+nIFlMDDAxYkUStfEgbsDGil32Eq
   UvWpySc9mUE7rN0FFaFhSf3x3vSTzWTsBikRCEJL6AdRdh+GcRmQKtGRr
   0AguiK5uOToJkdNg4F/BGKoIwX7ZMmkDon3KdR7cYqmZHXkV/XLTFN7c3
   t9OcEEXiQuv69Z48Tw+qcL2pk9XCPXFlz6TIQ61dEj+6dhFZMYXrdoquW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858028"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858028"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900928"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900928"
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
Subject: [PATCH v12 11/37] x86/opcode: Add ERET[US] instructions to the x86 opcode map
Date: Mon,  2 Oct 2023 23:24:32 -0700
Message-Id: <20231003062458.23552-12-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

ERETU returns from an event handler while making a transition to ring 3,
and ERETS returns from an event handler while staying in ring 0.

Add instruction opcodes used by ERET[US] to the x86 opcode map; opcode
numbers are per FRED spec v5.0.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/lib/x86-opcode-map.txt       | 2 +-
 tools/arch/x86/lib/x86-opcode-map.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index 1efe1d9bf5ce..12af572201a2 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -1052,7 +1052,7 @@ EndTable
 
 GrpTable: Grp7
 0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
-1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
+1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B) | ERETU (F3),(010),(11B) | ERETS (F2),(010),(11B)
 2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
 3: LIDT Ms
 4: SMSW Mw/Rv
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index 1efe1d9bf5ce..12af572201a2 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -1052,7 +1052,7 @@ EndTable
 
 GrpTable: Grp7
 0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
-1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
+1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B) | ERETU (F3),(010),(11B) | ERETS (F2),(010),(11B)
 2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
 3: LIDT Ms
 4: SMSW Mw/Rv
-- 
2.34.1


