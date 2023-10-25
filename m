Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DF7D747B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623276.971007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjiv-0007bU-5v; Wed, 25 Oct 2023 19:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623276.971007; Wed, 25 Oct 2023 19:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjiv-0007Yc-3A; Wed, 25 Oct 2023 19:39:25 +0000
Received: by outflank-mailman (input) for mailman id 623276;
 Wed, 25 Oct 2023 19:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja4-0001Lv-Kk
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:16 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1f6471-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:15 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99de884ad25so19229566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:15 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:13 -0700 (PDT)
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
X-Inumbo-ID: ec1f6471-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262214; x=1698867014; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd+293SHW4v/x+H7sqG2NMYgcbXBrCZIg35fi93FtdA=;
        b=D5fnzjtpQWFqO+0CA8rszIYI8IYs00KdGENmFC67mNIHQzPA0spSKbRMR8xvslPCb1
         3WlvmsjDBUdU+ikzkmGKHXQPG1l2BvDWLS1YaEwyQysHDs2ePLlXhr9ihMh8vaERXIGq
         u9JMe+hwio76ueyjeR64v/QcjE2tDIh23sO8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262214; x=1698867014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nd+293SHW4v/x+H7sqG2NMYgcbXBrCZIg35fi93FtdA=;
        b=TtpEfkx9lCUxK2EL907JDjgg7RN5EOXFOJ0eRlHIRQszysEYxqDu6z7TWEypPqvi7U
         yIMRvGfnKHxg6y3EfTPDOj08NoDnVeUEBufceQJt7IxWRXdzL9loJFuHjWBI+X6Z9cSj
         cRkcyxQTTlduKRiD0Zki2ETIGOjicFBdHtn4j+XArHh4kzol27i4FHLRfWeSaJfMRQbg
         JDOX419n7ltTQpAfkuSIGlLA5T65zFhJhhDAH0RRplV4GIAISgm4a8w+hf3lb6hY3Kik
         zmiH3MTnsFB4aaDIJhRx9R87CWCNBYmaX2WEJHUUSen37sKfOdWgR2U1ojAzBfHHXJFO
         GBhA==
X-Gm-Message-State: AOJu0YwTj03qtGW6+l314O31HSpq5O0Fmmqsedd6nPrTLP5RK6Dga9Tm
	HAoyMPolwPl2ETWRbjYOxtXDiAoDeNEJ9nHYZsRCEg==
X-Google-Smtp-Source: AGHT+IHxj7lbSTjwVtjs1SNZl18dayBq8u7zBAbJVtzmUE5dKOwN0q93kJch17zKul0wjS72MB5pTA==
X-Received: by 2002:a17:907:97d2:b0:9ae:7206:963c with SMTP id js18-20020a17090797d200b009ae7206963cmr15122803ejc.15.1698262214513;
        Wed, 25 Oct 2023 12:30:14 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 20/22] x86/PMUv5: limit available fixed PMCs and enable support
Date: Wed, 25 Oct 2023 20:29:50 +0100
Message-Id: <bcbf0d561c4d77794c27e58b0248eb4fa75bae4a.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

AnyThread deprecation means a bit in 0xa edx, which we pass through.
(we could also avoid doing the anythread masking, but we need that
 for version <= 4 support).

Fixed Counter enumeration means we need to limit fixed counters if we
hide any.

Domain separation needs no action from the hypervisor AFAICT.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpuid.c            | 3 ++-
 xen/arch/x86/include/asm/vpmu.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 12e768ae87..8900943bcd 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -338,7 +338,8 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             res->a = u.eax;
 
             /* We only implement 3 fixed function counters */
-            if ( (res->d & 0x1f) > fixed_pmc_cnt )
+            res->c &= ~((1 << fixed_pmc_cnt) - 1);
+            if ( (res->d & 0x1f) > fixed_pmc_cnt)
                 res->d = (res->d & ~0x1f) | fixed_pmc_cnt;
         }
         break;
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index eaededadb5..f066b17e45 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -74,7 +74,7 @@ struct vpmu_struct {
 #define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
 #define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
 
-#define VPMU_VERSION_MAX                    0x4
+#define VPMU_VERSION_MAX                    0x5
 #define VPMU_VERSION_MAX_SUPPORTED          0x5
 
 static inline void vpmu_set(struct vpmu_struct *vpmu, const u32 mask)
-- 
2.41.0


