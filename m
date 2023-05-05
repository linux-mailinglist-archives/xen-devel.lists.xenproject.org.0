Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A76F8844
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530597.826326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgI-0007Eu-Eb; Fri, 05 May 2023 17:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530597.826326; Fri, 05 May 2023 17:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgI-00077E-BM; Fri, 05 May 2023 17:57:22 +0000
Received: by outflank-mailman (input) for mailman id 530597;
 Fri, 05 May 2023 17:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1gM=A2=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1puzgF-0006Yg-LX
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:57:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4724a395-eb6e-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 19:57:19 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so108096885e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:57:19 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020adfe30c000000b00306423904d6sm3053844wrj.45.2023.05.05.10.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 10:57:16 -0700 (PDT)
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
X-Inumbo-ID: 4724a395-eb6e-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683309438; x=1685901438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6Xql5GXzmjj1oZIuAO041sn7FGeLxwpchTwgQr2k5s=;
        b=D0MY9e7uNVDRqXI8XB8j0kmwsJFPVA7488rLg9o/qJf8WaepewgG92ynTMnwvzhgog
         jnRDm8hfKRRxDpUVXyyGyt+JvmlmGkJY3xY6+QDL+STz9HxbWQxpNgRjSyMfgvqjnbwt
         rjXVlyagTW6MNShOmpa3YA6meVEmH44P4I7Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309438; x=1685901438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6Xql5GXzmjj1oZIuAO041sn7FGeLxwpchTwgQr2k5s=;
        b=cxvPjfpLe6hYnoyjg9omWzzY8z/PiA4Z0jC6uHqsLPAIN58aCB7MEg9hpvebBJDaTK
         Fu9S6ACj/3yfhLToUuifSjRRHs9w1pNQS4g3ECGumw7JDFUb1r7+RKervez7Fv3UbPf6
         ud0X9ZRfSB0ZJlNrXFsAg1a8sMVx+iv5mrlfEkf56flGVpIZJqrRjj7QiwZrpO7GqUV4
         LA3aaMpG/X0fIrfSyYjrgEEc21tDZSYoEfpfMFFm3qrGVu79dr7KjIzqbe6f/RFql83g
         pXMWso2cbHW70fre956KHcfIi3ZuvRLTxlooLrv1YXIfwXFH+KMdRp4CKrx7Uo0oYouM
         JGWA==
X-Gm-Message-State: AC+VfDxs88VZWpP9t2Uei2hVs4NBKYmRNWs499F+z6CWqQbdOyR5agIu
	PYIsl1gYCYkVzDiZ2JdJfOl4z3iXdCtmfR3MDJM=
X-Google-Smtp-Source: ACHHUZ7HbbsoCdRLwpKFkeV3KYcoZ2tYunzSdAflnU/lJ4BAM1XJOaXtZDpyoaNJmG9s2CmAuNrwFQ==
X-Received: by 2002:a05:600c:3d9a:b0:3f1:6ebd:d995 with SMTP id bi26-20020a05600c3d9a00b003f16ebdd995mr2286776wmb.0.1683309438059;
        Fri, 05 May 2023 10:57:18 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles CPUID faulting
Date: Fri,  5 May 2023 18:57:05 +0100
Message-Id: <20230505175705.18098-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is in order to aid guests of AMD hardware that we have exposed
CPUID faulting to. If they try to modify the Intel MSR that enables
the feature, trigger levelling so AMD's version of it (CpuidUserDis)
is used instead.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/msr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ecf126566d..984aedf180 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -431,6 +431,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     {
         bool old_cpuid_faulting = msrs->misc_features_enables.cpuid_faulting;
 
+        /*
+         * The boot CPU must support Intel's CPUID faulting _or_
+         * AMD's CpuidUserDis.
+         */
+        bool can_fault_cpuid = cpu_has_cpuid_faulting ||
+                               boot_cpu_has(X86_FEATURE_CPUID_USER_DIS);
+
         rsvd = ~0ull;
         if ( cp->platform_info.cpuid_faulting )
             rsvd &= ~MSR_MISC_FEATURES_CPUID_FAULTING;
@@ -440,7 +447,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
         msrs->misc_features_enables.raw = val;
 
-        if ( v == curr && is_hvm_domain(d) && cpu_has_cpuid_faulting &&
+        if ( v == curr && is_hvm_domain(d) && can_fault_cpuid &&
              (old_cpuid_faulting ^ msrs->misc_features_enables.cpuid_faulting) )
             ctxt_switch_levelling(v);
         break;
-- 
2.34.1


