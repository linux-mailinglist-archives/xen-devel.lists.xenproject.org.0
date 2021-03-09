Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D833278C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95419.180159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJciz-0004Jl-Hm; Tue, 09 Mar 2021 13:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95419.180159; Tue, 09 Mar 2021 13:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJciz-0004Ic-Bk; Tue, 09 Mar 2021 13:48:37 +0000
Received: by outflank-mailman (input) for mailman id 95419;
 Tue, 09 Mar 2021 13:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jEQk=IH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJcix-0003yx-NJ
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:48:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec7aebdb-f7ef-4251-b419-f37fecb6d632;
 Tue, 09 Mar 2021 13:48:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D9E4AD73;
 Tue,  9 Mar 2021 13:48:20 +0000 (UTC)
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
X-Inumbo-ID: ec7aebdb-f7ef-4251-b419-f37fecb6d632
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615297700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRGAbVR+8Mnnt7NDHm7B8xvG2OtdGz+E1qKK/7NsSt0=;
	b=MRIb7zVmGu6NutqWwIyJg9GRHrMVUFvhJWF/PIfZSZoV3ucw7PhypfxfxYwb3FsfCbbjlh
	HgMdGby6x+WbX0JzblobosedkjGcdBkP9mZGrLv8ryZg6K7aS+5YfbkCKSTkNuYM4bcQwN
	wIP3sXBnw1bM2AVQ6rdSpJy7iH4M4iw=
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
Subject: [PATCH v6 05/12] x86/alternative: support ALTERNATIVE_TERNARY
Date: Tue,  9 Mar 2021 14:48:06 +0100
Message-Id: <20210309134813.23912-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
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
---
 arch/x86/include/asm/alternative-asm.h | 4 ++++
 arch/x86/include/asm/alternative.h     | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/asm/alternative-asm.h
index 3965daf0460e..80bc6b533358 100644
--- a/arch/x86/include/asm/alternative-asm.h
+++ b/arch/x86/include/asm/alternative-asm.h
@@ -112,6 +112,10 @@
 	.popsection
 .endm
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2 oldinstr, newinstr2, X86_FEATURE_ALWAYS,		\
+	newinstr1, feature
+
 #endif  /*  __ASSEMBLY__  */
 
 #endif /* _ASM_X86_ALTERNATIVE_ASM_H */
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 89889618ae01..4fb844e29d26 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -178,6 +178,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_REPLACEMENT(newinstr2, 2)				\
 	".popsection\n"
 
+#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
+	ALTERNATIVE_2(oldinstr, newinstr2, X86_FEATURE_ALWAYS, newinstr1, feature)
+
 #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newinsn3, feat3) \
 	OLDINSTR_3(oldinsn, 1, 2, 3)						\
 	".pushsection .altinstructions,\"a\"\n"					\
@@ -209,6 +212,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
 	asm_inline volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) ::: "memory")
 
+#define alternative_ternary(oldinstr, feature, newinstr1, newinstr2)	\
+	asm_inline volatile(ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2) ::: "memory")
+
 /*
  * Alternative inline assembly with input.
  *
-- 
2.26.2


