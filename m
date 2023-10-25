Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C347D7456
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623206.970937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjaA-0005vs-MH; Wed, 25 Oct 2023 19:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623206.970937; Wed, 25 Oct 2023 19:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja9-0005b6-7R; Wed, 25 Oct 2023 19:30:21 +0000
Received: by outflank-mailman (input) for mailman id 623206;
 Wed, 25 Oct 2023 19:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja2-0000YO-Sq
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8dbfe3-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so19626766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:14 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:12 -0700 (PDT)
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
X-Inumbo-ID: eb8dbfe3-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262213; x=1698867013; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eF/vhiJowLpX1e2n8G2TeyGZWL6SIxALSARC90/5+I=;
        b=f5HULaJUGkAJ8ff/7ptP6Hb0hFDr46RAOoLAGlBi1r/r08oET17uWEv+lJrdEzhNhJ
         nkorl+fjOS/rOFu18BAZHHyYvR+kKVGujiB41RTirqsQo+WJ2lshiSpxorQwWmgTbfGD
         lE9cYLUBUPOPrV8AI3+9uDRrW2pzoTW62Kio4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262213; x=1698867013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eF/vhiJowLpX1e2n8G2TeyGZWL6SIxALSARC90/5+I=;
        b=lwMngeD3+QCFccXwH5DwG8ywRuv74RVW1rv6rpgCtY2FG78F+9Ty7ppH+DgNHY8Kwa
         +UJNNjoxebSwE4+lI7JwyVgBN2Sxoowg6ZniV+nPNQJkk2owW5X46RoSPdjQlK3PdIuV
         4x47l9GZgfeTWQGdTAj6A6R7BU6X4kp8ZycIa/FMdT5B22VW1ar0Bush9YACC4ogeznC
         mWO69n1y7izKEFrKhoWYgfcXlhRfIvm1flNY2Y3dOItfzTDT1AnwdHVVd0/QZwimBBgV
         sOyTfWxnn1VCFFtcFidFovIzK5LYGQ355bCC+BL475coUEuNqGuWiU34M/Mme538dON3
         OrPg==
X-Gm-Message-State: AOJu0YwrNZVxY7pBcT/4pbOI4LlsvscfJUePqGTWUrvfICuNzi/foF7b
	Yis8+aGkbF6dWz/Zm0xj4ff+1mGJSxRMB98LtzwC1A==
X-Google-Smtp-Source: AGHT+IGXWcyEPQSQpmGRN8slTsWFz9fOVBr75bHc7OV40rvbFBerfXEiIVG5WX44sczPhewAuWaniA==
X-Received: by 2002:a17:907:3d9f:b0:9b2:b152:b0f2 with SMTP id he31-20020a1709073d9f00b009b2b152b0f2mr12217976ejc.10.1698262213534;
        Wed, 25 Oct 2023 12:30:13 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 19/22] x86/PMUv4: bump max PMU version to 4
Date: Wed, 25 Oct 2023 20:29:49 +0100
Message-Id: <981a906f2f309c5f9e7740f621929f7a58d7daaf.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Depends on the other x86/PMUv4 patches:
"x86/PMUv4: disable intercept for PERF_GLOBAL_STATUS"
"x86/PMUv4: IA32_PERF_GLOBAL_{STATUS_SET, INUSE} support"
"x86/PMUv4: support LBR_Frz and CTR_Frz"

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/vpmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 79f7f4a09e..eaededadb5 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -74,7 +74,7 @@ struct vpmu_struct {
 #define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
 #define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
 
-#define VPMU_VERSION_MAX                    0x3
+#define VPMU_VERSION_MAX                    0x4
 #define VPMU_VERSION_MAX_SUPPORTED          0x5
 
 static inline void vpmu_set(struct vpmu_struct *vpmu, const u32 mask)
-- 
2.41.0


