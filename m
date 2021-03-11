Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C5337571
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96579.182900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKME1-0003yY-FA; Thu, 11 Mar 2021 14:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96579.182900; Thu, 11 Mar 2021 14:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKME1-0003xe-9Y; Thu, 11 Mar 2021 14:23:41 +0000
Received: by outflank-mailman (input) for mailman id 96579;
 Thu, 11 Mar 2021 14:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMDz-0003YK-Os
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0229db14-070f-479e-82e2-4b631778e5ce;
 Thu, 11 Mar 2021 14:23:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F96CADCD;
 Thu, 11 Mar 2021 14:23:24 +0000 (UTC)
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
X-Inumbo-ID: 0229db14-070f-479e-82e2-4b631778e5ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MKy6lSEcqRltqkWApgm84thplgjw9W/kgg8ogVcUb6U=;
	b=TuSNTb9JzVfcsxkcShX+P8cRCgJOrN0TPKs68MYP2sHfziWBCPDnMFwE0bLHD5bWKeGIzS
	yedHoyUFxGWACCPLMFzmJ9go04kFSPP48InTpIlMeZzt4UB35ilJbX41UcEmi3OBAvT3Gr
	PQ1kV+cd1odVp8NCh4WO77Jqolikqg4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v7 06/14] x86/alternative: support ALTERNATIVE_TERNARY
Date: Thu, 11 Mar 2021 15:23:11 +0100
Message-Id: <20210311142319.4723-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ALTERNATIVE_TERNARY support for replacing an initial instruction
with either of two instructions depending on a feature:

  ALTERNATIVE_TERNARY "default_instr", FEATURE_NR,
                      "feature_on_instr", "feature_off_instr"

which will start with "default_instr" and at patch time will, depending
on FEATURE_NR being set or not, patch that with either
"feature_on_instr" or "feature_off_instr".

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- new patch
V4:
- use X86_FEATURE_ALWAYS instead of negated feature (Boris Petkov)
- unfortunately this isn't enough to get rid of the "not feature"
  support, as this is needed in the patch "x86/paravirt: switch
  functions with custom code to ALTERNATIVE", too
V5:
- carve out the "not feature" part
V7:
- rename parameter names (Boris Petkov)
---
 arch/x86/include/asm/alternative.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 649e56f70889..a044e59cbdf5 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -179,6 +179,10 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_REPLACEMENT(newinstr2, 2)				\
 	".popsection\n"
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr_yes, newinstr_no) \
+	ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS,	\
+		      newinstr_yes, feature)
+
 #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newinsn3, feat3) \
 	OLDINSTR_3(oldinsn, 1, 2, 3)						\
 	".pushsection .altinstructions,\"a\"\n"					\
@@ -210,6 +214,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
 	asm_inline volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) ::: "memory")
 
+#define alternative_ternary(oldinstr, feature, newinstr_yes, newinstr_no) \
+	asm_inline volatile(ALTERNATIVE_TERNARY(oldinstr, feature, newinstr_yes, newinstr_no) ::: "memory")
+
 /*
  * Alternative inline assembly with input.
  *
@@ -380,6 +387,10 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	.popsection
 .endm
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr_yes, newinstr_no) \
+	ALTERNATIVE_2 oldinstr, newinstr_no, X86_FEATURE_ALWAYS,	\
+	newinstr_yes, feature
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_ALTERNATIVE_H */
-- 
2.26.2


