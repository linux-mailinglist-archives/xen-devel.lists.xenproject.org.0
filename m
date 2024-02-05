Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5150849CBA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676135.1052026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzkE-0006OE-Ku; Mon, 05 Feb 2024 14:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676135.1052026; Mon, 05 Feb 2024 14:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzkE-0006Mg-Hg; Mon, 05 Feb 2024 14:14:46 +0000
Received: by outflank-mailman (input) for mailman id 676135;
 Mon, 05 Feb 2024 14:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rWzkE-0006Ma-2p
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:14:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c4872b-c430-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:14:43 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a37878ac4f4so160937666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:14:43 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tk3-20020a170907c28300b00a36d0dae491sm4386283ejc.202.2024.02.05.06.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 06:14:42 -0800 (PST)
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
X-Inumbo-ID: e8c4872b-c430-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707142483; x=1707747283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41QmEK7DxB5U6RS33FRHcI/eQ7monSTUA7T7HhrUaQM=;
        b=apBMmfmZc4YTmkzT4YVFc7WJuza9uTNZGpRpS9i6v/mLmSTnb8YJCFXOVCWMuB1dnJ
         bQeXF9CRm+5b5L66aQfUFZ23NxpExXFWhgbXEHUe79GiCoeBGsP0/ZKhwKvHeOHj58h3
         QZH0oom/gzSfFsbkLmBehDBcw88X1L+yAck+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707142483; x=1707747283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41QmEK7DxB5U6RS33FRHcI/eQ7monSTUA7T7HhrUaQM=;
        b=fac0clUxeqDJEGqkNcfntGDbMlL4az8UQwQrmg37Rrji6sUzgWDMd93NNnwxcyAREC
         NFA7VmSbzAcFCAApNv5/qVQ8u3qQXaHRgMO/pY3/yqbxccXJRK4Wg7j8vDfEW1xb3jLT
         5PNrsPrrKOrSfZzk/T89Wche9TRX2iyPeWsTUT1rkBqPhenixcs4Rkv+ERS6rIl7oDWA
         yF1gRkOD0U7mLxfPyHB60mQXnz1cTIOuoC0XSRin+vdDEVaFAhGQlhKIRbe4T8j6bmlQ
         tn4xFw6vScSssAli3EoWUbDgwIftqg6b3xk1D3ntPSjljaoQewZ0GrHPzb/vyHTvQeB/
         UMZA==
X-Gm-Message-State: AOJu0YxT/QgRoO4S0Bo89WTw7/GDiubUvgHDLeB/9g2r7PSukvZ5Oon2
	9MAi7eJQzqa0H3XRAdDkiIh+/GU6c1tMmZC+3R5HxLNs3QjuktQNzRW4aTmktq7LtgzyJkIAXuG
	s
X-Google-Smtp-Source: AGHT+IGz7CuvzQlHrzbkmmxFpkz2VFiR2Dj/lSIvS8xZZn9YBXerEWe58k9CxXWv2QkFw1jGOJIAgQ==
X-Received: by 2002:a17:906:b56:b0:a37:8227:debb with SMTP id v22-20020a1709060b5600b00a378227debbmr3459007ejg.30.1707142483148;
        Mon, 05 Feb 2024 06:14:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW8ItI73Mh/4o2xJVmIaqrJb3ccRHjjLexE04qMZwKg0YDtPE4z2esDIkEAeJBWzEvIbYy1PFBkOLmoIAIkTq/iFK2artPkBp84vMmRCxPUwesmesZdKtARnJBESUgb3KsAd/U=
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu: Fix mixed tabs/spaces
Date: Mon,  5 Feb 2024 14:14:41 +0000
Message-Id: <20240205141441.1880188-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes: 660f8a75013c ("x86/CPU: convert vendor hook invocations to altcall")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 26eed2ade1e3..28d7f34c4dbe 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -336,8 +336,8 @@ void __init early_cpu_init(bool verbose)
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
-	case X86_VENDOR_INTEL:	  actual_cpu = intel_cpu_dev;    break;
-	case X86_VENDOR_AMD:	  actual_cpu = amd_cpu_dev;      break;
+	case X86_VENDOR_INTEL:    actual_cpu = intel_cpu_dev;    break;
+	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
 	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
 	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;

base-commit: 9eee78988ca081eeed0a69fc9773e2e4268d1ed7
-- 
2.30.2


