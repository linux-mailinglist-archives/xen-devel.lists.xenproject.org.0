Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD97E9816
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 09:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631381.984658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Sgd-0007E3-ON; Mon, 13 Nov 2023 08:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631381.984658; Mon, 13 Nov 2023 08:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Sgd-0007Br-Ln; Mon, 13 Nov 2023 08:52:51 +0000
Received: by outflank-mailman (input) for mailman id 631381;
 Mon, 13 Nov 2023 08:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2Sgc-0007Bl-D0
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 08:52:50 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034a6308-8202-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 09:52:45 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso58018941fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 00:52:48 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b00407752bd834sm7361180wmq.1.2023.11.13.00.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 00:52:46 -0800 (PST)
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
X-Inumbo-ID: 034a6308-8202-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699865567; x=1700470367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i41EUFcBrTV5a0pKEIKGdyFmARmH0W13cJ7pDnX0qRY=;
        b=OYIL55/SZDPLd3xOaqieEATeraU3Yhmhrt31hzjTVGmSMZoySNPD3QrmkcpKlQPbSf
         t3lsKrD3WUUBYz6LWh1Qm3SrALRvQck459/OTKn8PPJB7y7vUbNbDN3LIpUzSTTzLf3f
         xAeqfAPvhoVnxBccw/+8KNnvpVQFedOqDzFj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865567; x=1700470367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i41EUFcBrTV5a0pKEIKGdyFmARmH0W13cJ7pDnX0qRY=;
        b=Oh1pu5WNVpifZ6BzK76iT7sE7bOly3TClspO8PuuWw1a3BWNLtLkzza5nKQQybqxuI
         vUScL0h6KNAGkvPDM/V8+5mKYqEXmnP5J1JF1oy2jDUFPdu/Ux7fuTmlUV9WFmHc4Gwl
         ygZGgswnodVop8HgZhCPqRJQBJLZZWPr0OXZM4GPRGwOrz7oE+WFBn0wPwBRpb0jfeOL
         c+OLspg2aop61i/p+I+wqtPM/ADV/+cNFvQZjZR4RAOANrsMvYR4ekFOizCbmkYnWRFY
         NqtJlmMFOhWhbCWyqE2ic/g8w2uoxMGlr8YsDeiR2Xjoml9J1tB21bldxCoORbWXYHhD
         RUqw==
X-Gm-Message-State: AOJu0Yzc/cIyi+iUqtPvOGKggNZGLvuIhJT9QyOnPZI+OB+OdGvG9a6y
	aWURv8YT0Lj4ZP+f0OweD6ITkU/D+beGeZ4OB9A=
X-Google-Smtp-Source: AGHT+IEXIWu9jm2jOF3kMofE85dAqIw9SEA45xnCcQguM2FII9ASIMLzF0Qe929VtqI6FqGiOAsxlw==
X-Received: by 2002:a2e:3a09:0:b0:2c5:15a5:826a with SMTP id h9-20020a2e3a09000000b002c515a5826amr3995557lja.19.1699865567054;
        Mon, 13 Nov 2023 00:52:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/intel: fix indentation
Date: Mon, 13 Nov 2023 09:51:30 +0100
Message-ID: <20231113085130.43458-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust line to use a hard tab and align using spaces afterwards, instead of
using all spaces.

Fixes: fc3090a47b21 ('x86/boot: Clear XD_DISABLE from the early boot path')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Realized while doing backports, not sure if it's worth fixing on it's own.
---
 xen/arch/x86/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index a8ba3191e618..dfee64689ffe 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -307,7 +307,7 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 		c->x86_cache_alignment = 128;
 
 	if (c == &boot_cpu_data &&
-            bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
+	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
 		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
 
 	/* Unmask CPUID levels and NX if masked: */
-- 
2.42.0


