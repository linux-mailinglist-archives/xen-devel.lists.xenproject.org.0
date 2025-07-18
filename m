Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3768B0A7FD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048948.1419157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQU-00013W-1g; Fri, 18 Jul 2025 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048948.1419157; Fri, 18 Jul 2025 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQT-00011T-Ut; Fri, 18 Jul 2025 15:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1048948;
 Fri, 18 Jul 2025 15:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnQR-0000nc-Tq
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:55:07 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9319e593-63ef-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 17:55:06 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so16482115e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:55:06 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm2276468f8f.47.2025.07.18.08.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:55:05 -0700 (PDT)
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
X-Inumbo-ID: 9319e593-63ef-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752854106; x=1753458906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAF5gDhCmA/Unwlsalbb9JHf0PnE9yyVlu9PtFe4Do4=;
        b=lcTMMF3x6R6SGXn+Cg3QN5lZf5JPTU/Wsx09+H4zsYkN0pWa/reWGZ7/+bylav6GtU
         oxQbUyrHKelvb3bNA8E3JgBPGP/RueZsxYUdBSWFkM0c6hoGP2jjnn1leT7BYOvKCduB
         6PIlTZOlM8wFVMVWRELDzae9oSX1czxdLXVko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854106; x=1753458906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAF5gDhCmA/Unwlsalbb9JHf0PnE9yyVlu9PtFe4Do4=;
        b=A55+UlqnDOaSbX04n2ABP5DKaU2CkG7vDk+r9gn8Q9X5RwGBhE7QzKrR0Yv+o70vsr
         3dUEBDA6CzhMWIIRZbING2eRyRtYU02UrsuFjjMXxghwn8GOLOc+uPVShhvPakI6rYtf
         sJBD1kYtMk5o/QvOnBN+LzK9i99Gjrocef7QJry/bmxFydCEDoW/MHGU0+eUSDzpcscQ
         JS+/NJKhhHZMh7OY6jXtPcE/GggZmceGsk9U3/CZSItbcCLrBaiANJP/InjmY9FeFIsB
         NkhE8cwHpkw6aldm6IXwU+GUOpjaK4FyxzHFLAYqjZcjgUbzew8aBaAXObRm8vtM//rF
         JkjA==
X-Gm-Message-State: AOJu0YwxeJIELd5dtWUBpL2HmKOgtWs+UqY2qk+8Xrp3yTCJir8ngDLb
	ZTJxw7Gy5DZpdv2BAvw5JSlDY38LoguMnW3/HnyEKw9DGvu6rK7u4VLFpJiy9gETz7Z0DsCXpcc
	QmQFr+1owEA==
X-Gm-Gg: ASbGncuCqvEqbURgzWTLCTqR60SNCp45fH1npzJ9L+hzciPax1KutEXMxzJoWjqPTe5
	tDXd26oDvzMBDuQPCrEkTV9uIwqXstCqRdkSPCH32gFGtiEbb6nkvSbXdshExX8nag/rfsEB75L
	ygbhp0RXn0JZDGC8ZJHvdjiwwrLgSNlSKf7GRIgMYuAHOyYrUqGJVX4HXxAlGg5EwriemQM6qFJ
	VwX81xjRdz3JuTq1YoRloWlu3AedFcZyNUKMyGhESZmnma4H1HiuALghnKRbGih+sGzdUNF3t3A
	EqEU96X4iUdN6u+q0NZiT8YJaOLmZzZXeYCiFukni1bulUM1eUmMh9yPauMWk3PTK0DKfWoQ1lM
	e3Y6vyQyah2U79tTBJVIAIKL1SgypH6TTPWUQn2BFM8AppzYGjV2SPtFeLTz/chHZeYx0/e/SCF
	8k
X-Google-Smtp-Source: AGHT+IGYSRiWhYJW2kmjkmlfpU/KoinDdP9aEUKWuxCyXL85murXDpFI2JmHoAeptOT+IutkJNU7sw==
X-Received: by 2002:a5d:64ee:0:b0:3b6:d6c:a740 with SMTP id ffacd0b85a97d-3b60e54bdb3mr9386761f8f.54.1752854105815;
        Fri, 18 Jul 2025 08:55:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/mwait-idle: Update vendor/family/model logic
Date: Fri, 18 Jul 2025 16:54:59 +0100
Message-Id: <20250718155502.2610047-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
References: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the new fields and constants.

In mwait_idle_probe(), exit early for non-Intel CPUs.  intel_idle_ids[] is a
large (and ever increasing) table and it's not reasonable to scan it for other
vendors, nor is it ideal to be emitting an ambigous error(ish) message.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mwait-idle.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index e837cbf50eb3..f47fdfb569d4 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1566,27 +1566,27 @@ static void __init spr_idle_state_table_update(void)
  */
 static void __init mwait_idle_state_table_update(void)
 {
-	switch (boot_cpu_data.x86_model) {
-	case INTEL_FAM6_IVYBRIDGE_X:
+	switch (boot_cpu_data.vfm) {
+	case INTEL_IVYBRIDGE_X:
 		ivt_idle_state_table_update();
 		break;
-	case INTEL_FAM6_ATOM_GOLDMONT:
-	case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
+	case INTEL_ATOM_GOLDMONT:
+	case INTEL_ATOM_GOLDMONT_PLUS:
 		bxt_idle_state_table_update();
 		break;
-	case INTEL_FAM6_SKYLAKE:
+	case INTEL_SKYLAKE:
 		sklh_idle_state_table_update();
 		break;
-	case INTEL_FAM6_SKYLAKE_X:
+	case INTEL_SKYLAKE_X:
 		skx_idle_state_table_update();
 		break;
-	case INTEL_FAM6_SAPPHIRERAPIDS_X:
-	case INTEL_FAM6_EMERALDRAPIDS_X:
+	case INTEL_SAPPHIRERAPIDS_X:
+	case INTEL_EMERALDRAPIDS_X:
 		spr_idle_state_table_update();
 		break;
-	case INTEL_FAM6_ALDERLAKE:
-	case INTEL_FAM6_ALDERLAKE_L:
-	case INTEL_FAM6_ATOM_GRACEMONT:
+	case INTEL_ALDERLAKE:
+	case INTEL_ALDERLAKE_L:
+	case INTEL_ATOM_GRACEMONT:
 		adl_idle_state_table_update();
 		break;
 	}
@@ -1595,12 +1595,16 @@ static void __init mwait_idle_state_table_update(void)
 static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
-	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
+	const struct x86_cpu_id *id;
 	const char *str;
 
+	if (boot_cpu_data.vendor != X86_VENDOR_INTEL)
+		return -ENODEV;
+
+	id = x86_match_cpu(intel_idle_ids);
 	if (!id) {
 		pr_debug(PREFIX "does not run on family %d model %d\n",
-			 boot_cpu_data.x86, boot_cpu_data.x86_model);
+			 boot_cpu_data.family, boot_cpu_data.model);
 		return -ENODEV;
 	}
 
-- 
2.39.5


