Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426C93C079
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 12:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764927.1175486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWw9U-0007Tz-3v; Thu, 25 Jul 2024 10:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764927.1175486; Thu, 25 Jul 2024 10:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWw9U-0007SI-18; Thu, 25 Jul 2024 10:56:52 +0000
Received: by outflank-mailman (input) for mailman id 764927;
 Thu, 25 Jul 2024 10:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWw9T-0007SA-44
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 10:56:51 +0000
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [2607:f8b0:4864:20::e30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9777b53c-4a74-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 12:56:50 +0200 (CEST)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4929fa64542so262962137.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 03:56:49 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d74463besm65800285a.101.2024.07.25.03.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:56:47 -0700 (PDT)
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
X-Inumbo-ID: 9777b53c-4a74-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721905007; x=1722509807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnf1lnF4sJueMmlYsMrsZCaaFDpgQH1yHy/fTvyC3oE=;
        b=Y5O7k2CUqxHUFdQj0z+kTw6mhc+pcEEWGAMU51uJ7my/Fnhnd8/X0w1h3WCDxPGXlC
         uzveSP0H6wV8G3KtncOinAxdbRfirO0TbT+mybdweqJEsxWddJXnnuwRTxtzAWRfsb9X
         8AbKaRYfNO4VWAOs/nYNFLlxxzDSQHD9e/tLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721905007; x=1722509807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnf1lnF4sJueMmlYsMrsZCaaFDpgQH1yHy/fTvyC3oE=;
        b=nLJg2ijkTD7tjqkaZz+NMC1tSvG5idcjzFapGdvFljWGKf06g0M7O/6hyTtqxJ7ecv
         CIaye8HX7pWoygEdyXrJ7eD2k4Wp1CpezEzyWm/ufbuhPjHejID/JI53Zj9ccjbvhsF3
         PGQqDdwGphwf5BJMsMhRXpp8PK9AVc3bMfLkpGAMRdV2ugwxCCriaxeu9vhAsr0FSd5P
         k45VnM13/DJzyUiknysQIpDeLe5YOrRT8LuxYO5oIESVY935lIhl8SOFg9rREOImYpb2
         O3QQmdAAD7id42gmJSHbzm0fODMeT2j1lUdVrJHdjNb2QIX7sl+7MsRXY1NJCnHFj2TA
         A0LQ==
X-Gm-Message-State: AOJu0Yzl5La+5WIg4fK+Um8bUzwCUd8N+J4nNyjxOQeQIviNJNUFzvNv
	baz7/fj38EqfoAJUIXyN8/9gzgdEULpyC7UDQ09scT5o2bFlf14J1li/o43pYhQu+DHJdnk1pew
	1
X-Google-Smtp-Source: AGHT+IFRvVmGHqc4+Ckc9WYTR+cXwloGUZI5DKe58Rc740b6tWLFLxnWXb5NuIXAjQzsrc4wf2Mtjw==
X-Received: by 2002:a05:6102:c8c:b0:493:de53:9bac with SMTP id ada2fe7eead31-493de53a376mr867292137.11.1721905007353;
        Thu, 25 Jul 2024 03:56:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH] x86/altcall: further refine clang workaround
Date: Thu, 25 Jul 2024 12:56:34 +0200
Message-ID: <20240725105634.16825-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in ALT_CALL_ARG() won't successfully workaround the clang
code-generation issue if the arg parameter has a size that's not a power of 2.
While there are no such sized parameters at the moment, improve the workaround
to also be effective when such sizes are used.

Instead of using a union with a long, add the necessary padding so that the
resulting struct always has the same size as a register, and let the compiler
zero-initialize the padding.

Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/alternative.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index e63b45927643..c3e3a5e3f8a8 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -184,11 +184,11 @@ extern void alternative_branches(void);
  * https://github.com/llvm/llvm-project/issues/82598
  */
 #define ALT_CALL_ARG(arg, n)                                            \
-    register union {                                                    \
-        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
-        unsigned long r;                                                \
+    register struct {                                                   \
+        typeof(arg) e;                                                  \
+        char pad[sizeof(void *) - sizeof(arg)];                         \
     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
-        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
+        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
     }
 #else
 #define ALT_CALL_ARG(arg, n) \
-- 
2.45.2


