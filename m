Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B88476E1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 19:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675155.1050373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxpg-00049V-TB; Fri, 02 Feb 2024 18:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675155.1050373; Fri, 02 Feb 2024 18:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxpg-00047T-PM; Fri, 02 Feb 2024 18:00:08 +0000
Received: by outflank-mailman (input) for mailman id 675155;
 Fri, 02 Feb 2024 18:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgAc=JL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVxpf-00047J-0P
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 18:00:07 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e53d7317-c1f4-11ee-8a44-1f161083a0e0;
 Fri, 02 Feb 2024 19:00:05 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d08df038b6so5117581fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 10:00:05 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d13-20020a50fb0d000000b00557d839727esm992380edq.7.2024.02.02.10.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 10:00:04 -0800 (PST)
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
X-Inumbo-ID: e53d7317-c1f4-11ee-8a44-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706896804; x=1707501604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgteywaViE777WQcL4kR53i7eXhLxOklKrqpmivgd+A=;
        b=Nq2/1kl4T2m0xmuk5ypiJtJ3OVGKKR3jGOGFsgGMAhtYd93MfmcbKUzfJmxGskfRHH
         nbUcqT5IWgpFdNMyRFbzyATGVEH9XjndHNRlEu9rWrTpMbI11LT+BgllSfury0hD2NqQ
         rKAe4pmPHUe5rvOPI8yBWBjukE4VagaipVgFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706896804; x=1707501604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgteywaViE777WQcL4kR53i7eXhLxOklKrqpmivgd+A=;
        b=HkFAEJgtVCFJ9fGmjaEMNg5LVRyTQp/Y+339RAfbExtZ90gbb/DWnVxMxCVVdqJwlO
         9cpXmvQFeuKr3BuIsfAhFmEJFaRkCfOApEDQNy9IBsUOO4y869eAYE9lztU81uGBm342
         nh7rb2DjjQlmYKPkCh0ZX0EUR3XwU4tWcep8me1136AGpPqrVpm4ejaFSZApK1B7re1Y
         lqZipiRRWtbMqgY6T2rbz/CrboibMIBTtLbN9SbqhdfYRDBLmGYMYgT4qOQvvcBMtk6E
         vgsqjSEVn1tS3p8ZtZJySipjgjUeI7j8gOHP5BijsliWctn6VOMscTxmC+q8sLtRrIIn
         va5g==
X-Gm-Message-State: AOJu0YwRzrEjgGSr5biVl34qYOyRXsN5sVziPmkau8DoYLo0Brxb+eSv
	5YWYXjCtLvMQ4v5HO/EsdeAlpwGLHZ0m7hQoSJ0bg57EyWSbWwTsV9ZuAt1t307UZMmwJYkbwJF
	Q
X-Google-Smtp-Source: AGHT+IEPE86/rtAqTDaTcPB9oCMttE8prHielYbZJ9xophVpMum+83jh1e3V2yZndcqiWtYdWMCMcA==
X-Received: by 2002:a2e:b5ae:0:b0:2cc:6210:1dce with SMTP id f14-20020a2eb5ae000000b002cc62101dcemr1628191ljn.4.1706896804656;
        Fri, 02 Feb 2024 10:00:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV8eKCZlu+wLy5g98L5X9hwQ/TA/q/g3EDNtfijxYf4JzF2J/7FeRSkkpN0NWac8kzygMaFGk1lqtFewmmq/g4L2oN0kUcjwHSqzIGbwUszyXF4yJ5pFQje3rcHYo1eHiH+YmA=
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ucode: Remove accidentally introduced tabs
Date: Fri,  2 Feb 2024 18:00:03 +0000
Message-Id: <20240202180003.1295735-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes: cf7fe8b72dea ("x86/ucode: Fix stability of the raw CPU Policy rescan")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I don't know what went wrong here.
---
 xen/arch/x86/cpu/microcode/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 6f95f7bbe223..1c9f66ea8a0f 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -685,12 +685,12 @@ static long cf_check microcode_update_helper(void *data)
          * Disable CPUID masking if in use, to avoid having current's
          * cpu_policy affect the rescan.
          */
-	if ( ctxt_switch_masking )
+        if ( ctxt_switch_masking )
             alternative_vcall(ctxt_switch_masking, NULL);
 
         calculate_raw_cpu_policy();
 
-	if ( ctxt_switch_masking )
+        if ( ctxt_switch_masking )
             alternative_vcall(ctxt_switch_masking, current);
     }
     else

base-commit: 3f819af8a796c0e2f798dd301ec8c3f8cccbc9fc
-- 
2.30.2


