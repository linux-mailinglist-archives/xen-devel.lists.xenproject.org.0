Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544CD2A8689
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20051.45660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRZ-0006jd-9K; Thu, 05 Nov 2020 18:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20051.45660; Thu, 05 Nov 2020 18:57:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRZ-0006j6-5p; Thu, 05 Nov 2020 18:57:09 +0000
Received: by outflank-mailman (input) for mailman id 20051;
 Thu, 05 Nov 2020 18:57:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRX-0006gr-Hb
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:07 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5a5f0a-c5e6-447d-9134-36238ffbd79f;
 Thu, 05 Nov 2020 18:57:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so3013984wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:06 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:04 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRX-0006gr-Hb
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:07 +0000
X-Inumbo-ID: cd5a5f0a-c5e6-447d-9134-36238ffbd79f
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cd5a5f0a-c5e6-447d-9134-36238ffbd79f;
	Thu, 05 Nov 2020 18:57:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so3013984wrn.0
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cxZBd9UtbAwSXXwBERB1exoaCA+r5xNDHyZ9ab9j0k=;
        b=dn2Sdwt7lDaVlJ36tXFutn/QDnyBoZUaQBm3vtVJR3qQIR4BcilQE16TK0PqCNRMX5
         x+nO8UUCrLJ3hZUYmFe7hUunJEx5yyuPk2L4Hs887M5FTxQNQ9W0h9gL0w3DKqgNGE8l
         qbi1dU0GQocRhOABQ1wg7Yh3azozTFGBhKbM1n7Rq52zQRBl9IaDukFFZwCmAyL0FLci
         ZZAJsJSPYcvpj9s2ON5W/JgSmFey8rKcwthoVAHzB5U8XJtcWhCrgAN5ePYH/jPcinwi
         P5pq13bukcF6y+IIPY5tWV+RAcpch3a+dMx0wwCNBomVmvc0yyOCSZmD4MhKguXPkomS
         h9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cxZBd9UtbAwSXXwBERB1exoaCA+r5xNDHyZ9ab9j0k=;
        b=fhdLF+qtSki9TQiouQtC3LPNjksMmqbVjNLW0F1Uc0cdP0AJY8tKHUA0QpsnEpLmWg
         ewbxZyJ6dBci+Yua58fIwuuSY9gHITgTxiG9dA3Gls5Qm7MRNkBK6AUjf7Z5E7KEGzZu
         NX3U2A5PCHk+XuS3mlihNqfv6gE4GwwQn5Kc395l3GoG1HRVSCgKEJo2jqdC1EEjFBB7
         v8ZViLLRDSoi+142FFYX5BR9W2MPJM0J+eRKYGXtuobeE2OD68pWNMhymkdm7NQgwJMc
         woqhZ763zGy8nehBVv3/Z+ToDYudWuH0YFAuX3wtbKEZFjpxRESweqIhabCfgRHFcFBi
         jEVA==
X-Gm-Message-State: AOAM530DgMKclVLAIMgZKoh1XgHVCXKVNp6+N3CWTnNwX3jua8lrqQ1C
	KrGbhniPFizzSw8VE9pIqtyWbvZOooE=
X-Google-Smtp-Source: ABdhPJyaKSWUq4UC8sHcV/FCKE6XLTUJDppDVYkUNwm0rWqZzMuRQz8ZP2rFjmFOFazXw8vjLY2WAw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr4446221wrs.377.1604602625681;
        Thu, 05 Nov 2020 10:57:05 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:04 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 2/6] xen/arm: Add detection of Armv8.1-LSE atomic instructions
Date: Thu,  5 Nov 2020 18:55:59 +0000
Message-Id: <20201105185603.24149-3-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new infrastructure for detecting CPU features in other ID
registers to detect the presence of Armv8.1-LSE atomic instructions,
as reported by ID_AA64ISAR0_EL1.Atomic.

While we're here, print detection of these instructions in setup.c's
processor_id().

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/arch/arm/setup.c             |  5 +++--
 xen/include/asm-arm/cpufeature.h | 10 +++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 5121f06fc5..138e1957c5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -128,10 +128,11 @@ static void __init processor_id(void)
            cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
-    printk("    Extensions:%s%s%s\n",
+    printk("    Extensions:%s%s%s%s\n",
            cpu_has_fp ? " FloatingPoint" : "",
            cpu_has_simd ? " AdvancedSIMD" : "",
-           cpu_has_gicv3 ? " GICv3-SysReg" : "");
+           cpu_has_gicv3 ? " GICv3-SysReg" : "",
+           cpu_has_lse_atomics ? " LSE-Atomics" : "");
 
     /* Warn user if we find unknown floating-point features */
     if ( cpu_has_fp && (boot_cpu_feature(pfr64, fp) >= 2) )
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index f9281ea343..2366926e82 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -15,6 +15,7 @@
 #define cpu_has_fp              (boot_cpu_feature(pfr64, fp) < 8)
 #define cpu_has_simd            (boot_cpu_feature(pfr64, simd) < 8)
 #define cpu_has_gicv3           (boot_cpu_feature(pfr64, gic) == 1)
+#define cpu_has_lse_atomics     (boot_cpu_feature(isa64, atomic) == 2)
 #endif
 
 #define cpu_has_arm       (boot_cpu_feature(pfr32, arm) == 1)
@@ -187,8 +188,15 @@ struct cpuinfo_arm {
         };
     } mm64;
 
-    struct {
+    union {
         uint64_t bits[2];
+        struct {
+            unsigned long __res0 : 20;
+            unsigned long atomic : 4;
+            unsigned long __res1 : 40;
+
+            unsigned long __res2 : 64;
+        };
     } isa64;
 
 #endif
-- 
2.24.3 (Apple Git-128)


