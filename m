Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE11787412
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590157.922288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDy-0004u1-OB; Thu, 24 Aug 2023 15:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590157.922288; Thu, 24 Aug 2023 15:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDy-0004r8-L5; Thu, 24 Aug 2023 15:26:18 +0000
Received: by outflank-mailman (input) for mailman id 590157;
 Thu, 24 Aug 2023 15:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCDw-0003YM-VU
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:16 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90d33c80-4292-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 17:26:16 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34ccc0fca24so4727925ab.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:16 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 m18-20020a637d52000000b005649cee408fsm11863127pgn.0.2023.08.24.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:14 -0700 (PDT)
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
X-Inumbo-ID: 90d33c80-4292-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890775; x=1693495575;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgODJfRd0WTA80cEHsA/Uei6Ucfv+7jDUWTjhPEHYEY=;
        b=V9Mut+eWNrbusHaXrSW3IBQzjPDbvaN12ZQeghmoojU+Wq5YIx4NX8GO+TBBY5oZQi
         9IC0WGmkUTErFhjE1By09drVvFcdwpym2TEv06MBFdE5ZHBmCy04Q1euUgbG/F907Wde
         fYN0CZ0bN2bf7FZpHkgBUWz1oNgHdNF+S3gRKsL59yfASm9r30oZvx98MxMk03bKIU3u
         QkSBmf+OVFCXSjWlGdO+90cTvat3bNshbBuWQdQci2YBXPYi1o45F9O+eSD25b4HZa2Q
         6yOxXyuRBa5O2Azafk/T4YaR0gdIjjujFVwEuNoQeTjnXXz69SXaiqK57PCQc3Cn+UHi
         +gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890775; x=1693495575;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgODJfRd0WTA80cEHsA/Uei6Ucfv+7jDUWTjhPEHYEY=;
        b=OA5LjH7nKS5Cvtr6LvZI9tC7Ejddo8XMT+VkVQhDpZmnt3zwS2QxTy9YntJ1cIh2iU
         sboyF+w9TNxtZ3q4fgE23zN8fYtpKOo743XbLGB0dkmKoMsMU5IspmvhgzQkHUp8y6oL
         j6dNsXRfIOwFxkRyZKnaHdIE53Y+Bd98M0eB94oHuKJ2hvSrTQbB5nxT8LIjoKc/EaZr
         8+OJbZZ/xmjLJkJxVj6Gy2jtKmU+KlNfkbavkET1pyoJBaAHlSLFd5jSJ2eHpRenY1ge
         BTVsdNuF1esT1u7RM/BEUl8ZIJXGu02cLB/jkiB2nenIp+1utkDh+jUDh9J8DRbhQ1Ia
         +FHQ==
X-Gm-Message-State: AOJu0YzVPfRxzXEqLPacvN9PDWRiH16s/LqYRD6Vgob/JnfGPNa7+QpA
	qNOCT0eQwxrqnPNkgHtXQV8=
X-Google-Smtp-Source: AGHT+IGGOXDXITvzOdxZ911GZnrTySvGsqemh4y+P88ZuZ+YrUvKWCCDs8MH383ZWCDCH1F2FT+8rQ==
X-Received: by 2002:a05:6e02:13c1:b0:349:2bab:9e47 with SMTP id v1-20020a056e0213c100b003492bab9e47mr5308874ilj.12.1692890775177;
        Thu, 24 Aug 2023 08:26:15 -0700 (PDT)
Message-ID: <4d1605ff-fce9-1b31-5ea5-e297093dce63@gmail.com>
Date: Fri, 25 Aug 2023 00:26:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 4/8] x86/emul: Populate pending_dbg field of x86_event from
 {svm,vmx}_get_pending_event()
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensure that we pass the correct pending_dbg value to
hvm_monitor_interrupt().

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>

v1 -> v2: new patch
---
 xen/arch/x86/hvm/svm/svm.c | 8 ++++++++
 xen/arch/x86/hvm/vmx/vmx.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 3d0402cb10..038c8d6e7e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2422,6 +2422,14 @@ static bool cf_check svm_get_pending_event(
     info->type = vmcb->event_inj.type;
     info->error_code = vmcb->event_inj.ec;
 
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_DB )
+    {
+        unsigned long dr6 = v->arch.hvm.flag_dr_dirty ?
+                            vmcb_get_dr6(vmcb) : v->arch.dr6;
+        info->pending_dbg = dr6 ^ X86_DR6_DEFAULT;
+    }
+
     return true;
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9c92d2be92..9b59374258 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2469,6 +2469,14 @@ static bool cf_check vmx_get_pending_event(
     info->type = MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK);
     info->error_code = error_code;
 
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_DB )
+    {
+        unsigned long dr6 = v->arch.hvm.flag_dr_dirty ?
+                            read_debugreg(6) : v->arch.dr6;
+        info->pending_dbg = dr6 ^ X86_DR6_DEFAULT;
+    }
+
     return true;
 }
 
-- 
2.41.0


