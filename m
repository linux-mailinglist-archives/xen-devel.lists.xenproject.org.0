Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7690B841
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742541.1149395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKK-00046V-Gd; Mon, 17 Jun 2024 17:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742541.1149395; Mon, 17 Jun 2024 17:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKK-0003zi-Bp; Mon, 17 Jun 2024 17:39:32 +0000
Received: by outflank-mailman (input) for mailman id 742541;
 Mon, 17 Jun 2024 17:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKI-00036g-LB
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b6c3158-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:27 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso4553420e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:26 -0700 (PDT)
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
X-Inumbo-ID: 8b6c3158-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645967; x=1719250767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hZrd7J+i5bTlpEezybGSWjb1th3JpIpYnEjFoW/+BI=;
        b=eqqLgikruXq+2H7oZBZ19ee9T8xWoxjR2ZAEXu6DtEhhp0r2+vODmYF3fhqluhZrqU
         zHaLmG5GqG/sQXd2xI9xffLyBN4CIC8erBCoaruu+yn2BCImWBjRjKrtFVWFdEM5PdlB
         Okt1Me80+Qbx9IBbGIt64pmq0FQ1To8XozU/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645967; x=1719250767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hZrd7J+i5bTlpEezybGSWjb1th3JpIpYnEjFoW/+BI=;
        b=Ue8JcaPB3WyX61ob3Qd01lRLEFOKiqmCBjg9s2hBVd+UQa46aJADLCBOutYUIP1sNk
         BarxM2SZ3QP76/gW3Zf7ryhXH7oeBE6bHyJ4AtsDk6lrCf/d37gDQ0QDdMF42onAreT6
         yAvggoUb9PN5IwzBNevXq1hEHl8py3Qd/2Q7REHz30K/iJJC7dcx/+J+m5IQOK33xRdm
         XgADBRfHd0AqbIk+KSj4lcXu3D8kYlAEWMlL7BuQAtwrAdGZjMZnnoo+mC8eWRwuNljN
         VUqhHZEuSv6JB+4LbwkavEjILIZpVmKi6G4zjwzOcxeENRIs2jviBf9I9lxEggyVf9GD
         2Cww==
X-Gm-Message-State: AOJu0YzYbSth5amJlnPaqj4tHsj6Dis4HnXGsQtxE8p5pcNfA0oDVeGt
	AmSvx/sdiYFQybO+d2JItSYERS33BHirhs57d+qrI7ZArz9E39sxXPqJvI1kK15hlmzdXmBuww6
	N8tw=
X-Google-Smtp-Source: AGHT+IGqswVteiKgyhCwzghy5F3j/dZoVVGu9AAXTgMs18mPwS1twjrtvvS5gzvDBXXDpOpKJ67J7Q==
X-Received: by 2002:a05:6512:3113:b0:52b:c089:4579 with SMTP id 2adb3069b0e04-52ca6e91501mr7271082e87.49.1718645966685;
        Mon, 17 Jun 2024 10:39:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
Date: Mon, 17 Jun 2024 18:39:17 +0100
Message-Id: <20240617173921.1755439-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a tangle, but it's a small step in the right direction.

In the following change, xstate_init() is going to start using the Raw policy.

calculate_raw_cpu_policy() is sufficiently separate from the other policies to
safely move like this.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This is necessary for the forthcoming xstate_{un,}compressed_size() to perform
boot-time sanity checks on state components which aren't fully enabled yet.  I
decided that doing this was better than extending the xstate_{offsets,sizes}[]
logic that we're intending to retire in due course.

v3:
 * New.
v4:
 * Adjust commit message a little.
---
 xen/arch/x86/cpu-policy.c | 1 -
 xen/arch/x86/setup.c      | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index b96f4ee55cc4..5b66f002df05 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -845,7 +845,6 @@ static void __init calculate_hvm_def_policy(void)
 
 void __init init_guest_cpu_policies(void)
 {
-    calculate_raw_cpu_policy();
     calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index dd51e68dbe5b..eee20bb1753c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1888,7 +1888,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-    identify_cpu(&boot_cpu_data);
+    calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
+
+    identify_cpu(&boot_cpu_data); /* Needs microcode and raw policy. */
 
     set_in_cr4(X86_CR4_OSFXSR | X86_CR4_OSXMMEXCPT);
 
-- 
2.39.2


