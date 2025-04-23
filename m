Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F2A97BF3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963778.1354725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVm-0001Iw-Ph; Wed, 23 Apr 2025 01:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963778.1354725; Wed, 23 Apr 2025 01:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVm-0001Fk-MX; Wed, 23 Apr 2025 01:02:50 +0000
Received: by outflank-mailman (input) for mailman id 963778;
 Wed, 23 Apr 2025 01:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVl-0000oH-2l
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac78f74a-1fde-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 03:02:48 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso67688295e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:48 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:47 -0700 (PDT)
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
X-Inumbo-ID: ac78f74a-1fde-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370168; x=1745974968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hixb/ZwuxNqQ0rmjpvM4G3/QpMDCCkyGKcIaO2DF2yg=;
        b=RjlGaz3BAFrynbTC29EjpQtESSz2LoFW7nPfAzd5GddUurdmcIekNRaFH21URheUqh
         9cMYY2b8R9EJLUOqqd7egQn9Pwond3y6PMmIqX6tenjniIO9mwrkXUHCleEXZ0FInckg
         nU7DnJ9TVLbmBAVLyNJd3YspSgs1E7lgkO328=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370168; x=1745974968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hixb/ZwuxNqQ0rmjpvM4G3/QpMDCCkyGKcIaO2DF2yg=;
        b=t4J3nQt5YzXekkLwjvrlNz8GKOVywz8C8hKK29lQZPzXHMC1ezc7n8VJ/V2z2TcaOK
         9ICeE0KusW3QoWv+cxLDCSc3lxwN08gGfy282KqB1O8yVBIlS3XiKliQWJInr5mBRqSB
         kMUzVbhkGBxD9H9sjqOz25VSLK8TWSOcX9Gd1VH9YPDuhg4cC78d5csC8s/RokAd2wLp
         2lGlgU/7dvxzONALTZ3M4ANRRqqoFDgvw+ShoLIn6VoUpYjbraR+FHI9Q8ZhQrvGOaPF
         EUHqKSN11/Q5HHSAi7ODJ7p6icq/uJzak2oJf5LsqWSNgStPJsE59bE4Ix2ejznBjNSv
         gEtg==
X-Gm-Message-State: AOJu0YwfnPxIfY0Qv4FLYGUxHqCrO5c3+eIbARphyCtMUG6/8x8wxJnp
	BT0tIHxknSMlqFhzssKx0AeHSuku4nRg0KqjKPFnrvsX9gjOHtNYUHW1IdFuGWLAzH0LPY6ArLx
	s
X-Gm-Gg: ASbGnctZixydjEScJokOXtL3SGS1Tjg/eZBDO+m1Y+ChyQn+ijbtG9dqtPkzXov3peE
	CcFR0Ii1w/aJJXEXBQzSnpVq/hXNJhat89Ftu5iu4lb5yQgnHkgm8NnmjxybncVLBRwsSe8JcBB
	kgVqPxif1weX2GvvigpRz4+EYhgM4+089vDwg7JrbTUNHQBS5TlXaEdKtVPJINzhzNIK/cHOabN
	NJls92OibasyzfM7LDSUiJxh8uXvCkHHCF+fSvwfPP/GQKeTiqGSrt6COy2rUsdm0m2qHG/oxGx
	n42QrkcZaKdDXuYbcedYs7ifZG7BJrNv9pXJ/J0MLWBgoRSvQY8XYhna40HmGg==
X-Google-Smtp-Source: AGHT+IGG65bPPpjp6zyCd08HRoORDUf6/LHaa7fgyod4T8zNUbNxIP+hfw/DjUz88TWXAFtevruM/w==
X-Received: by 2002:a05:600c:3d96:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-4406aba6809mr162887685e9.17.1745370167910;
        Tue, 22 Apr 2025 18:02:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/8] x86/alternatives: Rework information passing into nmi_apply_alternatives()
Date: Wed, 23 Apr 2025 02:02:32 +0100
Message-Id: <20250423010237.1528582-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nmi_apply_alternatives() is soon going to need to dispatch to multiple
functions, and a force parameter is not a good way of passing information.

Introduce ALT_INSNS and ALT_CALLS to pass in at the top level to select the
operation(s) desired.  They represent what will happen when we've separated
the altcalls out of the general alternative instructions infrastructure,
although in the short term we still need to synthesise the force parameter for
_apply_alternatives().

Move two externs to reduce their scope a little.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index d1a3b7ea7ca6..9aa591b364a4 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -19,8 +19,6 @@
 
 #define MAX_PATCH_LEN (255-1)
 
-extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
-
 #ifdef K8_NOP1
 static const unsigned char k8nops[] init_or_livepatch_const = {
     K8_NOP1,
@@ -387,9 +385,13 @@ int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 }
 #endif
 
+#define ALT_INSNS (1U << 0)
+#define ALT_CALLS (1U << 1)
 static unsigned int __initdata alt_todo;
 static unsigned int __initdata alt_done;
 
+extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
+
 /*
  * At boot time, we patch alternatives in NMI context.  This means that the
  * active NMI-shadow will defer any further NMIs, removing the slim race
@@ -419,7 +421,7 @@ static int __init cf_check nmi_apply_alternatives(
         flush_local(FLUSH_TLB_GLOBAL);
 
         rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
-                                 alt_done);
+                                 alt_todo == ALT_CALLS);
         if ( rc )
             panic("Unable to apply alternatives: %d\n", rc);
 
@@ -442,7 +444,7 @@ static int __init cf_check nmi_apply_alternatives(
  * This routine is called with local interrupt disabled and used during
  * bootup.
  */
-static void __init _alternative_instructions(bool force)
+static void __init _alternative_instructions(unsigned int what)
 {
     unsigned int i;
     nmi_callback_t *saved_nmi_callback;
@@ -460,7 +462,7 @@ static void __init _alternative_instructions(bool force)
     ASSERT(!local_irq_is_enabled());
 
     /* Set what operation to perform /before/ setting the callback. */
-    alt_todo = 1u << force;
+    alt_todo = what;
     barrier();
 
     /*
@@ -490,12 +492,12 @@ static void __init _alternative_instructions(bool force)
 void __init alternative_instructions(void)
 {
     arch_init_ideal_nops();
-    _alternative_instructions(false);
+    _alternative_instructions(ALT_INSNS);
 }
 
 void __init boot_apply_alt_calls(void)
 {
     local_irq_disable();
-    _alternative_instructions(true);
+    _alternative_instructions(ALT_CALLS);
     local_irq_enable();
 }
-- 
2.39.5


