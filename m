Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498C69F3CF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499401.770568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnne-0001fA-Gn; Wed, 22 Feb 2023 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499401.770568; Wed, 22 Feb 2023 12:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnne-0001cX-Cg; Wed, 22 Feb 2023 12:00:42 +0000
Received: by outflank-mailman (input) for mailman id 499401;
 Wed, 22 Feb 2023 12:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnd-0000Rg-7P
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8647edfc-b2a8-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 13:00:39 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id ee7so14262212edb.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:39 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:38 -0800 (PST)
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
X-Inumbo-ID: 8647edfc-b2a8-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2sR+ZHD7PGnYGWl4CAsPoK4VvzcqTimIkDugq8HftE=;
        b=M6NwNjYAfFKkG6YHT/G1ScixCYFLDYjYUFFAnszuY88+Nvke1Zt5JySwL2EyLwLpk0
         4FSGFL4chAga8yGLKycaCHkAMqGFmQ4YlX+2m/UVkrS9iF9dYfJ0+Uoztt3tV0eGSk3e
         wqpuiVdT8j4I8MW3/FHRADBVPGjoNuZN6i00Ya6Wx/oY79EIdWKEZuCya0tO7aLA5hOE
         nEWrLfdmLtQjOzFSndc1trvjC63L9ZCGk3LDQzqx/vSq++4T8uGmFQCsP/YSqZkj1tNO
         Hi5LJg9cka8htYGi8wL2FOArf4k1RtTDz1ZhMTEf5YevcidaWeZ+JReult//u5+q1FWa
         5jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2sR+ZHD7PGnYGWl4CAsPoK4VvzcqTimIkDugq8HftE=;
        b=Odoa8Mu9p9qwEjeiIGMTeXI+Cx2bv/ccYMqvGrpGAq0Pilzkt5CdPUdOQOdzYJbaK/
         oadtIc8Ai4O13UAcdEcYILeD1zf9Icp2pdXm3jUDXfQPpwrM4BP4Wqheda9QIqqgOTpB
         4SZyxPXR0vA2nzhUxMIlxFUqo4jAbyT7PyHFe3iXIrM6kWjp6qk5jidR+ZasXnwq4fQw
         9K4JQ3FW5ID2nA/kuH8FvE8omermCMQLW9ObtzVAox38p6sdhLxtDrbVVieL5x+CvANW
         VWd4qv5KXeSM8JBxSEJVae91dmm/6THRCPYh58Rtciq3sqkljezUsBXyx/y3efqxg2cS
         Tqyw==
X-Gm-Message-State: AO0yUKWKKpTIARyIrjm1oKB09oliB/roorBZ62l4rTBuXobaH3Vffssj
	JT7tMwLl3pG0OobBWdrOGkNoQrmBcrA=
X-Google-Smtp-Source: AK7set9WAj9zvoGbLC+eMz76L24vUQyCkVdiizLj2utZ4FpQyqvjFHCyKOK6wOsomomX5K61OnzrLA==
X-Received: by 2002:a17:907:b609:b0:88e:682e:3a9e with SMTP id vl9-20020a170907b60900b0088e682e3a9emr14679589ejc.61.1677067238949;
        Wed, 22 Feb 2023 04:00:38 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/9] x86/vmx: reduce scope of GAS_VMX_OP definition
Date: Wed, 22 Feb 2023 14:00:19 +0200
Message-Id: <20230222120023.3004624-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since GAS_VMX_OP is used only by vm{read,write}_safe, move its definition
just above those functions and undefine it after use.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - none

 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index c0ca6d10e3..1ba2937c23 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -319,12 +319,6 @@ extern uint8_t posted_intr_vector;
 #define INVVPID_ALL_CONTEXT                     2
 #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
 
-#ifdef HAVE_AS_VMX
-# define GAS_VMX_OP(yes, no) yes
-#else
-# define GAS_VMX_OP(yes, no) no
-#endif
-
 static always_inline void __vmptrld(u64 addr)
 {
     asm volatile (
@@ -414,6 +408,12 @@ static always_inline void __vmwrite(unsigned long field, unsigned long value)
         );
 }
 
+#ifdef HAVE_AS_VMX
+# define GAS_VMX_OP(yes, no) yes
+#else
+# define GAS_VMX_OP(yes, no) no
+#endif
+
 static inline enum vmx_insn_errno vmread_safe(unsigned long field,
                                               unsigned long *value)
 {
@@ -460,6 +460,8 @@ static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
     return ret;
 }
 
+#undef GAS_VMX_OP
+
 static always_inline void __invept(unsigned long type, uint64_t eptp)
 {
     struct {
-- 
2.37.2


