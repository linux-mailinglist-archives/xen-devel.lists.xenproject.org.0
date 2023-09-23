Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559157ABFEA
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607133.945387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgZ-00088n-Us; Sat, 23 Sep 2023 10:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607133.945387; Sat, 23 Sep 2023 10:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzgZ-00080E-Nx; Sat, 23 Sep 2023 10:16:27 +0000
Received: by outflank-mailman (input) for mailman id 607133;
 Sat, 23 Sep 2023 10:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzcC-0000Pn-66
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:11:56 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cdc08da-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:51 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:42 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:41 -0700
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
X-Inumbo-ID: 9cdc08da-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463911; x=1726999911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nnaiSfOR32UqURagnGQyKATdoHKyxN7QZzCa/h9+/jY=;
  b=UReG64z6AQGBxsL+NCDvphShcPmjXqd1wLr2q9qqpcIZfyUe6L8Z03WA
   kPtpJ3FCOJKozGFxsdURSEzF0eFyVhbZWOslqbJ8a2MyhYkhSlN2zUSfY
   4jxWTDU/mRqRmY4vFtDaNLqwSTYBtUluN4RQIjeO6HjPNPshjTSZSNaJz
   wdVaaJiboMAiP/V8wWdyLB+HEQN06rj4fTx1mFPgGSwZQ/5rmN7e7uHqN
   /t7pFr6mlBWWP2eM0Q9xlaji4HfTAqwb+WesiaxrHXwkmbHOE0YB8q6Zj
   o1nbmLHf4jyW+T00XV5nSmG34M3RH34DbUNwsv3B+fBZW29fNt+55LJyH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492217"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492217"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388141"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388141"
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
Subject: [PATCH v11 12/37] x86/objtool: Teach objtool about ERET[US]
Date: Sat, 23 Sep 2023 02:41:47 -0700
Message-Id: <20230923094212.26520-13-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Update the objtool decoder to know about the ERET[US] instructions
(type INSN_CONTEXT_SWITCH).

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 tools/objtool/arch/x86/decode.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index c0f25d00181e..6999f478c155 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -509,11 +509,20 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 		if (op2 == 0x01) {
 
-			if (modrm == 0xca)
-				insn->type = INSN_CLAC;
-			else if (modrm == 0xcb)
-				insn->type = INSN_STAC;
-
+			switch (insn_last_prefix_id(&ins)) {
+			case INAT_PFX_REPE:
+			case INAT_PFX_REPNE:
+				if (modrm == 0xca)
+					/* eretu/erets */
+					insn->type = INSN_CONTEXT_SWITCH;
+				break;
+			default:
+				if (modrm == 0xca)
+					insn->type = INSN_CLAC;
+				else if (modrm == 0xcb)
+					insn->type = INSN_STAC;
+				break;
+			}
 		} else if (op2 >= 0x80 && op2 <= 0x8f) {
 
 			insn->type = INSN_JUMP_CONDITIONAL;
-- 
2.34.1


