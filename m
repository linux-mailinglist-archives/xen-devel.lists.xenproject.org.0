Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB5XFaCdnWkoQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EE1872BD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240004.1541487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurns-0004DV-QP; Tue, 24 Feb 2026 12:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240004.1541487; Tue, 24 Feb 2026 12:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurns-0004B7-Lv; Tue, 24 Feb 2026 12:46:16 +0000
Received: by outflank-mailman (input) for mailman id 1240004;
 Tue, 24 Feb 2026 12:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9vI=A4=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vurnr-0003tj-Cy
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:46:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a8cdd5-117e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 13:46:05 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so3770570f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 04:46:05 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43987f3ed03sm4803236f8f.16.2026.02.24.04.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:46:04 -0800 (PST)
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
X-Inumbo-ID: c8a8cdd5-117e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771937165; x=1772541965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4sp/g7nefG7eULFXp8l8pUWsqFfRFPg4pIwmWThBj4=;
        b=NI1vGpZtD3OUSSmvgxKX5PC/NZKOvoWRA0R3mwY+2t7xDqCAUgZ64IYncg6LKRTG5+
         KgtgyGXrB/KWRAWFW5ZFxB1qP4MY3CyzDSYHx56LbfhJleAsPOqnP5Kbc1zf8OSQ69iD
         vKBWbP2lPxuqeUMSquAxkgsyPg7vwlQSOOw4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937165; x=1772541965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4sp/g7nefG7eULFXp8l8pUWsqFfRFPg4pIwmWThBj4=;
        b=Gu2wzLDq2yGUQJILzXZj7Mqn+IoHbEd2gOUaaxTY9ZqBgla2dvXvmwNKkgqCAXz55+
         INsjAZACmRX8OiZAhQ5Rz+bWjWuBViaDUD4KwD1l0VIHQ+M8lWTYsdX3utx3uopg8N9s
         p3nIQmiQL/lJBV5EqawMcCtJFMSJ1zd9hW1dx+zwBdMWqi7IfjAXQJaBOQFM1U6xntsR
         SqcFxnHhznXN7CkLrqBbelRIZIHFpWlipEXt6cOtb1AiNR9hjFRTAdO6ZaHVNPOO0hVT
         Ks1vwgEye3296SRNxqriaWbBl7ph3+ruJnWBthndgoomMKjNm4M1rkBz9b7H1jlKsg5+
         prfA==
X-Gm-Message-State: AOJu0YzhIvfAiPLRwvGiAIJkDJe3WeGn1t2CqpIDEy58wX2XeK5hVHEa
	ul5JNcwmAJSZGUBBIaT+h8ivsg1O/8OJgeJM9BRk4/naQVFEEhSkLT0lk28JalYlBvsy2QX0P/O
	SItW6Pd2vVw==
X-Gm-Gg: ATEYQzy+dJgrKBxueC4qoENCUR8d62uVptYpAQb40aFjPO5QR7M3mwlQfC7vONKbl1Y
	LGTGLT3Yqp1NB5GAErMPOpZnhV55PXlrhw7oc0SW2kJ+hxspgT77VJiFJtoMY2nq0FrOcVGrgS1
	BgTyE89FSM/hQQYYFnyDbPFf0aygHn2+aK52C57oG049tIrPeZPg0fBphnDZvHZCUGL0rdYb19e
	oNJChMH6MG/wT3sbamHS0T5oYOgWHuDz51o5YTeWcgbMHievX2DXWxA+xlk8cuChbi45MTQNQt9
	vrDOzdSKfgAjAYhpn1sfGYloIcC7+27UEVEt6YdGEuKYxEAPFrT8UuCsOmpUmRW1j+GKnCnSQLg
	eu9ILEyPJDvwuIb/yziTa9qUQDy/c0hCvB5DwThhWpkuUIc0XlguBKvDSo+Y9/F7Yq9pUQ+WKos
	5uwEgzgaSS65ErgQ1UsahcQuf4kjLfw4Sai697P6hUp/A9QJu/q4iNJ2Hz5vM/9iYoIEh6m7s=
X-Received: by 2002:a05:6000:2281:b0:436:19f6:31b0 with SMTP id ffacd0b85a97d-4396f153c41mr23095241f8f.4.1771937164753;
        Tue, 24 Feb 2026 04:46:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/2] xen/arm: Simplify type handling for SMCCC declarations
Date: Tue, 24 Feb 2026 12:45:58 +0000
Message-Id: <20260224124558.3675278-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,xen.org:email,arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 083EE1872BD
X-Rspamd-Action: no action

There's no use creating a typed copy of a macro argument, simply to use it to
create a second typed copy.  Remove the indirection, halving the number of
local variables created in scope.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

This also makes them clearly elliglbe for converstion to auto, where they
weren't before (typeof expression not being that of the RHS).
---
 xen/arch/arm/include/asm/smccc.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 347c4526d12a..7e90b0b56550 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -113,39 +113,32 @@ struct arm_smccc_res {
     register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
 
 #define __declare_arg_1(a0, a1, res)                        \
-    typeof(a1) __a1 = (a1);                                 \
     __declare_arg_0(a0, res);                               \
-    register typeof(a1)     arg1 ASM_REG(1) = __a1
+    register typeof(a1)     arg1 ASM_REG(1) = a1
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
-    typeof(a1) __a1 = (a1);                                 \
     __declare_arg_1(a0, a1, res);                           \
-    register typeof(a2)     arg2 ASM_REG(2) = __a2
+    register typeof(a2)     arg2 ASM_REG(2) = a2
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
-    typeof(a1) __a1 = (a1);                                 \
     __declare_arg_2(a0, a1, a2, res);                       \
-    register typeof(a3)     arg3 ASM_REG(3) = __a3
+    register typeof(a3)     arg3 ASM_REG(3) = a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
-    typeof(a4) __a4 = (a4);                             \
     __declare_arg_3(a0, a1, a2, a3, res);               \
-    register typeof(a4)     arg4 ASM_REG(4) = __a4
+    register typeof(a4)     arg4 ASM_REG(4) = a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
-    typeof(a5) __a5 = (a5);                             \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
-    register typeof(a5)     arg5 ASM_REG(5) = __a5
+    register typeof(a5)     arg5 ASM_REG(5) = a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
-    typeof(a6) __a6 = (a6);                                 \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
-    register typeof(a6)     arg6 ASM_REG(6) = __a6
+    register typeof(a6)     arg6 ASM_REG(6) = a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
-    typeof(a7) __a7 = (a7);                                     \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
-    register typeof(a7)     arg7 ASM_REG(7) = __a7
+    register typeof(a7)     arg7 ASM_REG(7) = a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
-- 
2.39.5


