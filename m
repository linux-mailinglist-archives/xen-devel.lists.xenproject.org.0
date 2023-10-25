Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1D7D7449
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623201.970891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja3-0004Sw-65; Wed, 25 Oct 2023 19:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623201.970891; Wed, 25 Oct 2023 19:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja2-0004Dg-CV; Wed, 25 Oct 2023 19:30:14 +0000
Received: by outflank-mailman (input) for mailman id 623201;
 Wed, 25 Oct 2023 19:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZy-0000YO-T8
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e952b5fa-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:10 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso21801866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:10 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:09 -0700 (PDT)
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
X-Inumbo-ID: e952b5fa-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262209; x=1698867009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyRq+c9BJCb93kXBrKQv/KcXMiJOXue/WyRit8/QUCo=;
        b=Nzy0RgWNnYbzTXvFjA9ixvtHno8FE0b7OMLnj6E2clULz+PuWfxqLQJ1PwjJvgyBBD
         VX5LMXgfSIFIe9bxAGgzGdxirujoHfxkPw1IGR9x3/KLkb/+Z6nwXvnf52E+t4yn/xc3
         Tpq2KjNFjGKFUPWUvp20nSjJ53hVc07aoFeJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262209; x=1698867009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyRq+c9BJCb93kXBrKQv/KcXMiJOXue/WyRit8/QUCo=;
        b=gtQfEUssn11XqE4xgFrUpVU0y4ePOTglMnCQA9x1ItplSLv48mdd1oYqTkq1eWvmT5
         foPqntFlllGCP03Rv/y8vOLHj3s43ZfKxx5Bqp8ujzWJjW9tXSzxD6hBwuRkP8Ddquvd
         hDG+OI1MH480zUBfB3Mq46TdafzrYRSvcD/wkpmR6JeR+DW4CirIVES0M9GIWCu+wHTX
         B/ufNa3l3eBI4/nan24XsENEnOnkLaaLJWyQU4TdXuTlPICwkanGGYuiW72lAiZvz5ZC
         FQoWyzW6v5+/fheIP2QbzhMDHfpggX+jRHChAY/ZM/F1NIZNH/ib9WfPG8bN0nMMP0fG
         N08g==
X-Gm-Message-State: AOJu0YxlPkjYr7xbD+bQy7+8guFNPZe+jGMCsIHOloI1/uxo9gaZqOQp
	5vQrXVyBIrCJ4+ZrwEts4ONBtYLAG5ZDjvwipRdvkw==
X-Google-Smtp-Source: AGHT+IHx63H6w1nV7s5odhzwJCu1JVRIyW0hIwXWD+zmVSCbxvji+pd+k7UkLJx74o5xGRIAg/XqxA==
X-Received: by 2002:a17:907:3e0b:b0:9c5:8a6b:29e with SMTP id hp11-20020a1709073e0b00b009c58a6b029emr14545667ejc.13.1698262209651;
        Wed, 25 Oct 2023 12:30:09 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 14/22] x86/msr: RO MSR_TURBO_RATIO_LIMIT{,1,2}, MSR_TEMPERATURE_TARGET
Date: Wed, 25 Oct 2023 20:29:44 +0100
Message-Id: <85b2230c2c40789f6c8548ae9978cea244daf2c3.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Expose MSR_TURBO_RATIO_LIMIT{,1,2} and MSR_TEMPERATURE_TARGET to guest as RO.
Although these are not architectural MSRs they are in the same place
currently on all supported CPUs.
They also have the same meaning, except for 06_55H and 06_5C where
they have a different meaning (turbo core count).

It is safe to expose this to the guest by default: they are only
statically defined limits and don't expose runtime measurements.

It has been observed that some drivers BSOD on an unguarded read on
MSR 1ADH (e.g. socwatch).

Also we read as zero the actual temperature, so reporting the temp
target as 0 might lead to 0/0.

Backport: 4.15+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c     | 9 +++++++++
 xen/arch/x86/pv/emul-priv-op.c | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index fefd01be40..cd772585fe 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3353,6 +3353,15 @@ static int cf_check vmx_msr_read_intercept(
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
         break;
+
+    case MSR_TEMPERATURE_TARGET:
+    case MSR_TURBO_RATIO_LIMIT...MSR_TURBO_RATIO_LIMIT2:
+        if ( !rdmsr_safe(msr, *msr_content) )
+            break;
+        /* RO for guests, MSR_PLATFORM_INFO bits set accordingly in msr.c to indicate lack of write
+         * support. */
+        goto gp_fault;
+
     case MSR_IA32_MISC_ENABLE:
         rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
         /* Debug Trace Store is not supported. */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e623e57b55..09bfde1060 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -960,6 +960,10 @@ static int cf_check read_msr(
         *val = guest_misc_enable(*val);
         return X86EMUL_OKAY;
 
+    case MSR_TEMPERATURE_TARGET:
+    case MSR_TURBO_RATIO_LIMIT...MSR_TURBO_RATIO_LIMIT2:
+        goto normal;
+
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
-- 
2.41.0


