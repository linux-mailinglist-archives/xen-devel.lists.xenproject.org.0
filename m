Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A885C7D744B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623197.970865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZy-0003Vs-Ut; Wed, 25 Oct 2023 19:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623197.970865; Wed, 25 Oct 2023 19:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZy-0003Ki-78; Wed, 25 Oct 2023 19:30:10 +0000
Received: by outflank-mailman (input) for mailman id 623197;
 Wed, 25 Oct 2023 19:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZw-0000YO-K6
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:08 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e438ec-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:08 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so24754666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:08 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:06 -0700 (PDT)
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
X-Inumbo-ID: e7e438ec-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262207; x=1698867007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D26h79W0uIiar9apEu5I8y2IaailVn2qskwn4HTwx6M=;
        b=QbiW5/Go6RCvbYnKe+hqpGo5NRPq2Nzb1yZHzP/wYSeeH5X6FamF0fVyXb0l/eDgLE
         pSlQw/M9mwTVuzQ0E8vjDywzeqMi+SnDwOvQltPKrUaTqqvv3UkStr5gyHJJwu6lfDsN
         cRS6Vapqsu/acduE/GNAK0kxXjgaHGe6U2qa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262207; x=1698867007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D26h79W0uIiar9apEu5I8y2IaailVn2qskwn4HTwx6M=;
        b=Kyw7EPugo1Ks3BluFSZLxZibbYy43aLvVXs5zlrpAyJT3A8/uFshVl/3gaiCZiaXXR
         41HY1mSkvjwVlFGMfzSw6iMKK1O7/F/z6pEfz3tHlsP0HcGTv+wptPf0COgqlI8sVXJO
         A7D1f2jlMQ859RX1MFrUow5s4n174KrAqB6Q7cF2IETfqezipTjQnucA9D7GYkv5ftNU
         oZEHeguht555SE9Kw+20234XN0w66I1HtEnTrUf54lzB1jymmW1lqtPuVjYOB3Lg4K1f
         9NwAQoxHOdSzVhDQblJuSTcBX87Fr0/ATDK2Up7TKuD1ndmJfATvbPQQKo93oZ/8i4Oh
         ALTQ==
X-Gm-Message-State: AOJu0YyR5NNX+XNJhShWFGI+9Vw82o1ti3FyoHJUyFhoI/1hQR1asILc
	aamVabxWH/9tSeQICOfwugCVc4XCPmF7x0bU68V3tlHY
X-Google-Smtp-Source: AGHT+IFA7BksNHd8kthUX3uqbV5iFjWiTjpdglNpTm6OMMEu96h5FNd6/mqRyoOx7YpZdrWseSba+A==
X-Received: by 2002:a17:906:da82:b0:9c7:5db4:c943 with SMTP id xh2-20020a170906da8200b009c75db4c943mr13931963ejb.40.1698262207467;
        Wed, 25 Oct 2023 12:30:07 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 11/22] x86/PMUv2: freeze support in IA32_DEBUGCTL
Date: Wed, 25 Oct 2023 20:29:41 +0100
Message-Id: <53246128214e8bc91e4a6d765935936efa8cd2f0.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

This is not yet exposed by HVM policies, but PMU version 2 requires that
if PDCM is supported in CPUID then these 2 bits would work.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c           | 4 ++++
 xen/arch/x86/include/asm/msr-index.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1510e980dd..f1f8a9afa2 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3601,6 +3601,10 @@ static int cf_check vmx_msr_write_intercept(
                           IA32_DEBUGCTLMSR_BTS_OFF_USR);
         }
 
+        if (cp->basic.pmu_version >= 2 && cpu_has(&current_cpu_data, X86_FEATURE_PDCM)) {
+            rsvd &= ~(IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI | IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI);
+        }
+
         if ( cp->feat.rtm )
             rsvd &= ~IA32_DEBUGCTLMSR_RTM;
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 8a881a8a6f..0dfb5b499f 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -305,7 +305,9 @@
 #define IA32_DEBUGCTLMSR_BTINT		(1<<8) /* Branch Trace Interrupt */
 #define IA32_DEBUGCTLMSR_BTS_OFF_OS	(1<<9)  /* BTS off if CPL 0 */
 #define IA32_DEBUGCTLMSR_BTS_OFF_USR	(1<<10) /* BTS off if CPL > 0 */
-#define IA32_DEBUGCTLMSR_RTM		(1<<15) /* RTM debugging enable */
+#define IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI	(1<<11) /* LBR stack frozen on PMI */
+#define IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI	(1<<12) /*  Global counter control ENABLE bit frozen on PMI */
+#define IA32_DEBUGCTLMSR_RTM			(1<<15) /* RTM debugging enable */
 
 #define MSR_IA32_LASTBRANCHFROMIP	0x000001db
 #define MSR_IA32_LASTBRANCHTOIP		0x000001dc
-- 
2.41.0


