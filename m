Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3098C145F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 19:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719366.1122138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57v5-0006b0-1M; Thu, 09 May 2024 17:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719366.1122138; Thu, 09 May 2024 17:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57v4-0006YC-Uw; Thu, 09 May 2024 17:51:02 +0000
Received: by outflank-mailman (input) for mailman id 719366;
 Thu, 09 May 2024 17:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XlW=MM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s57v3-0006Y5-7c
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 17:51:01 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f47f4d-0e2c-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 19:51:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so290850366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 10:51:00 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b177fcsm96102066b.202.2024.05.09.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:50:58 -0700 (PDT)
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
X-Inumbo-ID: b1f47f4d-0e2c-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715277059; x=1715881859; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pNAOzdrTXcAGJ1Ot2q3kGu92saKCNjFwk0wxdWZLiI=;
        b=Cd51WdbHqU5ZJ/jdqExPsi3tWEGu4dv91kx567rqg9I20f+Vgnx9RQOBA1HGhFABwu
         vU/U2UySXcIWTe49ijE+Ptz3kf9ohwLty45jUGpahW3ADELRK4U+ZhwSpmWHQZff53UL
         JEACzStF/7sOaKqrPrYJefRb6hgndf4E4LLcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715277059; x=1715881859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pNAOzdrTXcAGJ1Ot2q3kGu92saKCNjFwk0wxdWZLiI=;
        b=cPQ2Z+ld6NAyne/Y0CanJ9f495v0SgPrivZqAxzeGV/WXN0kk57QWTghiIrp8yqLuM
         jW6Wicimd0xHGALuQJqXoro+5MIy/b4vrBp3kWJGgR8BER2m2DUraFRjvIZmCamWHbgO
         9atKGXi5FKgDQsr88EZvWsh/MoTL0pY3jgWonGbhQcppt3POsa5/7S0BOtJzFGo2nllR
         8+b7iqd2Z5YfjxaJRPoDF8LB1KBcEQ+suh1me3e7fbLjvBdjINKsfaBruqg6g8PMwmlO
         bIiX+XYOcu3ZrKbsPoaG0gQdzwUKbEvOqjHKpApisrzkHQ756XUpXkcEurlNrLJGUP9C
         KGeg==
X-Gm-Message-State: AOJu0YyG4kTOFkUOtkEEZlkLszX8B8PpzLllEc0kFkBCTInLJJOwjqFr
	Bb+9eR4TUV1OQdWUanNZUm45VSJl0LVqbTuOyK5Vr6iliTngNq+EhLm+VRG0EncSdJlFBcJ6QV3
	n
X-Google-Smtp-Source: AGHT+IH5MZCYaDFzD4zge9TBvPnXZMBYvVb3Z8Al0dhmacUqE8oCSW6JhmyPzMctMLDfgx5W4ubDPA==
X-Received: by 2002:a17:907:36c:b0:a59:c6fd:5160 with SMTP id a640c23a62f3a-a5a2d6bc140mr22992166b.76.1715277059271;
        Thu, 09 May 2024 10:50:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 4.5/8] tools/hvmloader: Further simplify SMP setup
Date: Thu,  9 May 2024 18:50:57 +0100
Message-Id: <20240509175057.1921538-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
References: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we're using hypercalls to start APs, we can replace the 'ap_cpuid'
global with a regular function parameter.  This requires telling the compiler
that we'd like the parameter in a register rather than on the stack.

While adjusting, rename to cpu_setup().  It's always been used on the BSP,
making the name ap_start() specifically misleading.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

This is a trick I found for XTF, not that I've completed the SMP support yet.

I realise it's cheating slightly WRT 4.19, but it came out of the middle of a
series targetted for 4.19.
---
 tools/firmware/hvmloader/smp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 6ebf0b60faab..5d46eee1c5f4 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -29,15 +29,15 @@
 
 #include <xen/vcpu.h>
 
-static int ap_callin, ap_cpuid;
+static int ap_callin;
 
-static void ap_start(void)
+static void __attribute__((regparm(1))) cpu_setup(unsigned int cpu)
 {
-    printf(" - CPU%d ... ", ap_cpuid);
+    printf(" - CPU%d ... ", cpu);
     cacheattr_init();
     printf("done.\n");
 
-    if ( !ap_cpuid ) /* Used on the BSP too */
+    if ( !cpu ) /* Used on the BSP too */
         return;
 
     wmb();
@@ -55,7 +55,6 @@ static void boot_cpu(unsigned int cpu)
     static struct vcpu_hvm_context ap;
 
     /* Initialise shared variables. */
-    ap_cpuid = cpu;
     ap_callin = 0;
     wmb();
 
@@ -63,9 +62,11 @@ static void boot_cpu(unsigned int cpu)
     ap = (struct vcpu_hvm_context) {
         .mode = VCPU_HVM_MODE_32B,
         .cpu_regs.x86_32 = {
-            .eip = (unsigned long)ap_start,
+            .eip = (unsigned long)cpu_setup,
             .esp = (unsigned long)ap_stack + ARRAY_SIZE(ap_stack),
 
+            .eax = cpu,
+
             /* Protected Mode, no paging. */
             .cr0 = X86_CR0_PE,
 
@@ -105,7 +106,7 @@ void smp_initialise(void)
     unsigned int i, nr_cpus = hvm_info->nr_vcpus;
 
     printf("Multiprocessor initialisation:\n");
-    ap_start();
+    cpu_setup(0);
     for ( i = 1; i < nr_cpus; i++ )
         boot_cpu(i);
 }

base-commit: 53959cb8309919fc2f157a1c99e0af2ce280cb84
-- 
2.30.2


