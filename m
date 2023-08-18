Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B47780F86
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586417.917674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1h3-0006EJ-Mj; Fri, 18 Aug 2023 15:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586417.917674; Fri, 18 Aug 2023 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1h3-0006C4-JQ; Fri, 18 Aug 2023 15:47:21 +0000
Received: by outflank-mailman (input) for mailman id 586417;
 Fri, 18 Aug 2023 15:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1h2-0005WD-9t
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:47:20 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 833a6e06-3dde-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 17:47:19 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-26d54d3d984so329510a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:47:19 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 rm4-20020a17090b3ec400b0026094c23d0asm1717425pjb.17.2023.08.18.08.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:47:17 -0700 (PDT)
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
X-Inumbo-ID: 833a6e06-3dde-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373638; x=1692978438;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vxu4BWosO06wdQVnGmCCgPXnQgECbdfZfm/WjoZh/WM=;
        b=X9F25AXnH9TmwZRfJJw7gbAbh5UWbe3it0a6R/9Bsl+60AGYSaXTaLV/I5l73MS2A+
         EqnW7YTe846s4OaRx1zI5G3QNIB75NL4fduaz2ElhIN4YVutFavh9Xd5qNC/9nEyNfju
         Zk0nvJiyAlLPJrrZZSjnfbpKB3RkB31vuEh3+wXiuj9aSBXKh550oEzYNl+7sGAsw1/O
         svNljWF58V67CanyRqg2wtzbvespKQSphq+HCudiLKKau3usCUS5OSxSAOR+Ye4Kwg0O
         vqk7hgWkpRpTJoilFLEPq8m63hqAPkp2TxusD8LwHP1ntPjahBmoSALc50Qt8QhGXV2S
         mLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373638; x=1692978438;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxu4BWosO06wdQVnGmCCgPXnQgECbdfZfm/WjoZh/WM=;
        b=dr2PAwcmfJ7X5aOwH4Jwz0iQ4JzbOsMWJHVVugPThXwO/eQndpogkhihmEk++dmKNy
         eF8dtjZhGW+pPrYJmbnKbNIloUXtdnokyf7T+a7Z3MBcNcXY5UaNJnA5BfUx0GNGM+A0
         s9LLp9qnHvZWWfZKVnnsU5IwCwb6sQZgf1GMKeYKwIDwz3PWdk4tIWq9jWe0nfZrMDZT
         c8OkRdpU8/JuzN5dntg2y/s7hHeCD8/zDNQwvztOHzDU/v3Dxl+j9eqATE7DLHkjb7ib
         ECBaHH0XQ3m9RFK+y18vZGwIwl7GWEXzSkyI5q13hrQf06cb4N6ip+3oa7zVYrYI6bgx
         KB9A==
X-Gm-Message-State: AOJu0YxuttP2ITAXJBGWsKbJCVvey8Nr3uHusDOREw2pQ0VcNGXw353v
	7KmDHBuXwXm9KNSsEvXCTGE=
X-Google-Smtp-Source: AGHT+IFMeKKMDRP91za9mlECpdKbVEJw9ePs0osxm4JWhWj8/CiqALhLvv85YSHlIE+jCZ13VrPP9w==
X-Received: by 2002:a17:90a:d78a:b0:26b:1081:a432 with SMTP id z10-20020a17090ad78a00b0026b1081a432mr2707022pju.30.1692373638303;
        Fri, 18 Aug 2023 08:47:18 -0700 (PDT)
Message-ID: <2c68b5aa-843c-7d59-7137-5ea72363ea0d@gmail.com>
Date: Sat, 19 Aug 2023 00:47:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 4/6] x86/pv: set DR_STEP if single-stepping after ro page
 fault emulation
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Language: en-US
In-Reply-To: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/pv/ro-page-fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928ad..238bfbeb4ac4 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -10,6 +10,7 @@
 
 #include <asm/pv/trace.h>
 #include <asm/shadow.h>
+#include <asm/debugreg.h>
 
 #include "emulate.h"
 #include "mm.h"
@@ -390,7 +391,10 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
         /* Fallthrough */
     case X86EMUL_OKAY:
         if ( ctxt.retire.singlestep )
+        {
+            current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
             pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        }
 
         /* Fallthrough */
     case X86EMUL_RETRY:
-- 
2.41.0


