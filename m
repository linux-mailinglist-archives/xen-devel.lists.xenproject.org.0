Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D53330D87
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94859.178792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0d-0005N1-Mm; Mon, 08 Mar 2021 12:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94859.178792; Mon, 08 Mar 2021 12:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0d-0005Lh-GL; Mon, 08 Mar 2021 12:29:15 +0000
Received: by outflank-mailman (input) for mailman id 94859;
 Mon, 08 Mar 2021 12:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wcm=IG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJF0b-0004oO-2j
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:29:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eef2ae1-e9f7-4fb4-bdc7-7e8fe52f6720;
 Mon, 08 Mar 2021 12:28:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64ED5AE05;
 Mon,  8 Mar 2021 12:28:52 +0000 (UTC)
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
X-Inumbo-ID: 4eef2ae1-e9f7-4fb4-bdc7-7e8fe52f6720
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615206532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhjW9OQAos6g6yY96+Pq7xS90d5LZCpWCahF7JpKjGY=;
	b=BC+Dp++K0MR2LZHsFV2XEZVu2+fvWSz4dff/Jp0UFlIHP2JfaJEuJkByKIhMaG4slvVCON
	f7AlpVvuq5i4J7Zr9354F5ixzJwPZDMZO9Hvm83g9LgbuG2+9m3AvXqd91EVysKyBVC73Y
	bR5p0ujMSNfODh/QIJx6J4kV8h1/DS0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 10/12] x86/paravirt: add new macros PVOP_ALT* supporting pvops in ALTERNATIVEs
Date: Mon,  8 Mar 2021 13:28:42 +0100
Message-Id: <20210308122844.30488-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308122844.30488-1-jgross@suse.com>
References: <20210308122844.30488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using paravirt patching for custom code sequences add
support for using ALTERNATIVE handling combined with paravirt call
patching.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- drop ____PVOP_ALT_VCALL() macro
---
 arch/x86/include/asm/paravirt_types.h | 49 ++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 0afdac83f926..0ed976286d49 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -477,44 +477,91 @@ int paravirt_disable_iospace(void);
 		ret;							\
 	})
 
+#define ____PVOP_ALT_CALL(ret, op, alt, cond, clbr, call_clbr,		\
+			  extra_clbr, ...)				\
+	({								\
+		PVOP_CALL_ARGS;						\
+		PVOP_TEST_NULL(op);					\
+		asm volatile(ALTERNATIVE(paravirt_alt(PARAVIRT_CALL),	\
+					 alt, cond)			\
+			     : call_clbr, ASM_CALL_CONSTRAINT		\
+			     : paravirt_type(op),			\
+			       paravirt_clobber(clbr),			\
+			       ##__VA_ARGS__				\
+			     : "memory", "cc" extra_clbr);		\
+		ret;							\
+	})
+
 #define __PVOP_CALL(rettype, op, ...)					\
 	____PVOP_CALL(PVOP_RETVAL(rettype), op, CLBR_ANY,		\
 		      PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS, ##__VA_ARGS__)
 
+#define __PVOP_ALT_CALL(rettype, op, alt, cond, ...)			\
+	____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op, alt, cond, CLBR_ANY,\
+			  PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS,		\
+			  ##__VA_ARGS__)
+
 #define __PVOP_CALLEESAVE(rettype, op, ...)				\
 	____PVOP_CALL(PVOP_RETVAL(rettype), op.func, CLBR_RET_REG,	\
 		      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
 
+#define __PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, ...)		\
+	____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op.func, alt, cond,	\
+			  CLBR_RET_REG, PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
+
+
 #define __PVOP_VCALL(op, ...)						\
 	(void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,	\
 		       VEXTRA_CLOBBERS, ##__VA_ARGS__)
 
+#define __PVOP_ALT_VCALL(op, alt, cond, ...)				\
+	(void)____PVOP_ALT_CALL(, op, alt, cond, CLBR_ANY,		\
+				PVOP_VCALL_CLOBBERS, VEXTRA_CLOBBERS,	\
+				##__VA_ARGS__)
+
 #define __PVOP_VCALLEESAVE(op, ...)					\
 	(void)____PVOP_CALL(, op.func, CLBR_RET_REG,			\
-		      PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
+			    PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
+#define __PVOP_ALT_VCALLEESAVE(op, alt, cond, ...)			\
+	(void)____PVOP_ALT_CALL(, op.func, alt, cond, CLBR_RET_REG,	\
+				PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
 #define PVOP_CALL0(rettype, op)						\
 	__PVOP_CALL(rettype, op)
 #define PVOP_VCALL0(op)							\
 	__PVOP_VCALL(op)
+#define PVOP_ALT_CALL0(rettype, op, alt, cond)				\
+	__PVOP_ALT_CALL(rettype, op, alt, cond)
+#define PVOP_ALT_VCALL0(op, alt, cond)					\
+	__PVOP_ALT_VCALL(op, alt, cond)
 
 #define PVOP_CALLEE0(rettype, op)					\
 	__PVOP_CALLEESAVE(rettype, op)
 #define PVOP_VCALLEE0(op)						\
 	__PVOP_VCALLEESAVE(op)
+#define PVOP_ALT_CALLEE0(rettype, op, alt, cond)			\
+	__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond)
+#define PVOP_ALT_VCALLEE0(op, alt, cond)				\
+	__PVOP_ALT_VCALLEESAVE(op, alt, cond)
 
 
 #define PVOP_CALL1(rettype, op, arg1)					\
 	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALL1(op, arg1)						\
 	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_VCALL1(op, arg1, alt, cond)				\
+	__PVOP_ALT_VCALL(op, alt, cond, PVOP_CALL_ARG1(arg1))
 
 #define PVOP_CALLEE1(rettype, op, arg1)					\
 	__PVOP_CALLEESAVE(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALLEE1(op, arg1)						\
 	__PVOP_VCALLEESAVE(op, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_CALLEE1(rettype, op, arg1, alt, cond)			\
+	__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_VCALLEE1(op, arg1, alt, cond)				\
+	__PVOP_ALT_VCALLEESAVE(op, alt, cond, PVOP_CALL_ARG1(arg1))
 
 
 #define PVOP_CALL2(rettype, op, arg1, arg2)				\
-- 
2.26.2


