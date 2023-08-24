Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E751F78740C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590149.922269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDY-0003tz-7E; Thu, 24 Aug 2023 15:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590149.922269; Thu, 24 Aug 2023 15:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDY-0003qW-4A; Thu, 24 Aug 2023 15:25:52 +0000
Received: by outflank-mailman (input) for mailman id 590149;
 Thu, 24 Aug 2023 15:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCDX-0003YG-08
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:25:51 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8020759a-4292-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 17:25:48 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68a4bcf8a97so3503314b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:25:49 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001b2069072ccsm12937709plh.18.2023.08.24.08.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:25:47 -0700 (PDT)
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
X-Inumbo-ID: 8020759a-4292-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890748; x=1693495548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gl1uSk6cql3DTrfRNGOLaEQ10Vv8LUbqQ//89vIyzb8=;
        b=AY01yRMuYtAmiu92yTvpMOTNoj/Adx2YB0agM8mAQI8m6cBDwcotG7QiNIHKmQgGgm
         h9IdGWPKCLXiiDH/1cvTT87X/zsVNIrIm1BZNK3cndyAZFt/tA7uMDoyz5e1VmC3fJt8
         dX6UJrAPbJ3vDIetTsPBNmSmhh6qbKd0Sxnp6s3dfrSRn/kw817tHn+7sVXaVXxoBxNs
         GzZWpvYYa1qKdBWSLWbHU4SrvGlU7AFcuGN6nM3NDFRt3FIg7g0ugvYMxKCMyIKq/Fig
         auvQdNlCyx10gFKGHZqIjnYJ71GmTnynm2MuvgnV7mN4LvF3beHIbMvyYvppwOpIeTMT
         5Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890748; x=1693495548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl1uSk6cql3DTrfRNGOLaEQ10Vv8LUbqQ//89vIyzb8=;
        b=TU7PtTyFOFUgvpFee2kz9wHYYgDiLcP4LjMyxOG7sb/8CGcVgb0KFkX2lz+IzVSFRD
         Xw7O/75BdEhhoeWbyQX5NaV5f3QexIBCrocWgrjK7raqxWwbVobRu7OofWJn+9NCUXku
         MwUjRwa0gobPKGnZ8NNks/0uE3cynfVPzYB81/tqqeIWIFimmUCT+fhYAFsegreRiix+
         0Aj+CkjUoWj7C6eJY5+1t3eVKmf1oZGVThP9jbX1it3zZRFoPZjYRj+0AbLUaWp6rdd4
         isOf0uSeyfaJWNgBa4dn1aJDmqHl2PUiDYHnz4icz2PAyeGkYnD4LRRl2A40tn7NMNb6
         Zc1g==
X-Gm-Message-State: AOJu0YzBMr5Km7sHtrqsr72qBAaS99w9+ZEAHLJvi52CDAHl6XLPFfUy
	QVmDQjPzz7LE4JQPCVk4G4s=
X-Google-Smtp-Source: AGHT+IHqIJVwaKLxuEl54tRyNpEYhjtCZry0YPvF1C/MyjxUoO4jectbyIT4f1UzRQsd2YXNFOmHnA==
X-Received: by 2002:a05:6a20:6d9d:b0:12e:98a3:77b7 with SMTP id gl29-20020a056a206d9d00b0012e98a377b7mr10918296pzb.59.1692890747798;
        Thu, 24 Aug 2023 08:25:47 -0700 (PDT)
Message-ID: <c668f355-0a31-0ffb-a7c2-4fee46705a3e@gmail.com>
Date: Fri, 25 Aug 2023 00:25:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 2/8] x86/hvm: Only populate info->cr2 for #PF in
 hvm_get_pending_event()
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for an upcoming patch that overloads the 'cr2' field for #DB.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>
---
 xen/arch/x86/hvm/hvm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 66ead0b878..c726947ccb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -503,9 +503,14 @@ void hvm_migrate_pirqs(struct vcpu *v)
 
 static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
 {
-    info->cr2 = v->arch.hvm.guest_cr[2];
+    if ( !alternative_call(hvm_funcs.get_pending_event, v, info) )
+        return false;
+
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_PF )
+        info->cr2 = v->arch.hvm.guest_cr[2];
 
-    return alternative_call(hvm_funcs.get_pending_event, v, info);
+    return true;
 }
 
 void hvm_do_resume(struct vcpu *v)
-- 
2.41.0


