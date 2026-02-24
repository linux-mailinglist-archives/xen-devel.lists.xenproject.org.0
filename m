Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLgTGp+dnWkoQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A73F1872B6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240003.1541478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurnn-0003xP-HQ; Tue, 24 Feb 2026 12:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240003.1541478; Tue, 24 Feb 2026 12:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurnn-0003uG-Dh; Tue, 24 Feb 2026 12:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1240003;
 Tue, 24 Feb 2026 12:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9vI=A4=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vurnm-0003tj-3g
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:46:10 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7f41cd5-117e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 13:46:04 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so4199164f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 04:46:04 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43987f3ed03sm4803236f8f.16.2026.02.24.04.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:46:03 -0800 (PST)
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
X-Inumbo-ID: c7f41cd5-117e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771937164; x=1772541964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E//KrHW5SVbFJ277xUaYoskVjOU3YAYhSUGMaxRLbXg=;
        b=tK8ZFlncsWZIJN/TYAsgv7CxoYxvxfpeHpJZG9ji5ck73acfv04UkxMjYX5Im41/S+
         iP9f+vI91KYlxxn49P4C8jthBhO3us0Go60QTGOCuqYUODEMzh/kzyhBGRndp/okzN26
         TdfPT0uCyOS6JVV1GFvCGJyATcHSYYfgTiRuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937164; x=1772541964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E//KrHW5SVbFJ277xUaYoskVjOU3YAYhSUGMaxRLbXg=;
        b=nZ8Ir8vXfamcyCKopL13bzVtV3vC6i+RrRqjIitX0I1LhF9rIbxXkc8DKG2lD9kfSb
         NqRsS4m04V9+Ffke1zBH4q77xuYrGb5AmrWnkkaZZ4Xh0z9gaaD3YZB+7AZEs0DNo3BU
         J8KBHVOijYURlzQy7AkYCybCUVwjzVuZzq5gDC9MrNKN4hmoecdQ4Uh6cNJng/9BkPXQ
         kLm6XpKCwh+k8UPMEn5M7oEh9d3bYl2qPTpVVpa/QX/dREO949PkKQaWjEI4URr5dIto
         Bjx61wwVdf2b6nTvZEiyqrAOUOghU1kjQ6Qpzch+UZrpVq87GjehxvdOHCP6LpLHR0HP
         vcjg==
X-Gm-Message-State: AOJu0YynS2GUJc/RcwpHExuT22WokJS6G7RJ3cAZmHUiEgSSk9QBtC2j
	4WQkyv+iu9SV7783JiQrmsE2K/9fNuhPJceKkFyQ+mKCTCiqa2zvDn4kLbNf9JzMlP5MQLJsHRp
	kUfX3dOdO+Q==
X-Gm-Gg: ATEYQzwDhMxTdkaQ+PSwPhOgxF9bwMDhJj2TrGdv7XT9Z2VP4yJy91yKH9B0HDH/xFZ
	zvXiM7CN2V6yOj4qtHsD9dvDr1Y/aRCD5OGhp7WzIT61vQVWGI492lkFNcUUJQDAhU+3clXbGKk
	dbjFvw+yIFhe83k6a+xQzSutTgrXznoZzc8dwNLLN+HSKDJRgFxEsXZlJsPbSPCxtoIAO+dhnAe
	JhzxF+Ts1DDtCwILaxX0bpwRn3szdjqndqmJPymdnMoaNTq5ijI3MxIA/RvzSpDpqQzgs6AE0in
	F3dqefT0JjxZYhBjlTCcyxtLdVNBYLQAnZzlfAKYk4dGdTeyCjvLlp7GI7JbPEtN+aLN6+MvZA5
	5pO5UuP68bF4Y9LSNcXJWinxn8ppcTqpzGmKL8caHNPi14dTBepZ0sME0WVRHLcOy/GGCCYtYbb
	cjNTYHKGD0Kr0GwIiwCSOn0UqLCz3J/gGtut6EAJnFjdX/txuWpmxTODbgmN7DRllhDENalfmHL
	oT14Krdhw==
X-Received: by 2002:a05:6000:188e:b0:436:f7e5:e047 with SMTP id ffacd0b85a97d-4396f18541dmr19951778f8f.47.1771937163532;
        Tue, 24 Feb 2026 04:46:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/2] xen/arm: Simplify SMCCC handling by reusing __declare_arg_$()
Date: Tue, 24 Feb 2026 12:45:57 +0000
Message-Id: <20260224124558.3675278-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,arm.com:email,xen.org:email];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2A73F1872B6
X-Rspamd-Action: no action

Now that the type handling is entirely uniform, it's easier to see that
__declare_arg_3() can use __declare_arg_2() and so on, just like the larger
__declare_arg_$()'s already do.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/smccc.h | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 5b30dd57b69d..347c4526d12a 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -114,26 +114,17 @@ struct arm_smccc_res {
 
 #define __declare_arg_1(a0, a1, res)                        \
     typeof(a1) __a1 = (a1);                                 \
-    struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
+    __declare_arg_0(a0, res);                               \
     register typeof(a1)     arg1 ASM_REG(1) = __a1
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
     typeof(a1) __a1 = (a1);                                 \
-    typeof(a2) __a2 = (a2);                                 \
-    struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
-    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
+    __declare_arg_1(a0, a1, res);                           \
     register typeof(a2)     arg2 ASM_REG(2) = __a2
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
     typeof(a1) __a1 = (a1);                                 \
-    typeof(a2) __a2 = (a2);                                 \
-    typeof(a3) __a3 = (a3);                                 \
-    struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
-    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
-    register typeof(a2)     arg2 ASM_REG(2) = __a2;         \
+    __declare_arg_2(a0, a1, a2, res);                       \
     register typeof(a3)     arg3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
-- 
2.39.5


