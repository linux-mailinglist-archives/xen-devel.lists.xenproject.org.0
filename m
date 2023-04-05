Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AD6D796F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518391.804890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Dm-0002ii-BW; Wed, 05 Apr 2023 10:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518391.804890; Wed, 05 Apr 2023 10:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Dm-0002ge-8H; Wed, 05 Apr 2023 10:18:30 +0000
Received: by outflank-mailman (input) for mailman id 518391;
 Wed, 05 Apr 2023 10:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Dk-00024X-Nw
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:18:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ea1565-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:18:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id m8so9666674wmq.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:18:28 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 ay8-20020a05600c1e0800b003edddae1068sm1744815wmb.9.2023.04.05.03.18.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:27 -0700 (PDT)
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
X-Inumbo-ID: 34ea1565-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3PbVXrARru//womsk1QFTfUC/jT1xFpRBIRhWzNLeg=;
        b=c4FFRXSdAKN2IWwtiqV7Ffzer7xJF5apMUkKlQiTaxUK2YipBsMKVqtP9PC9OjOLHc
         rMq0iWLrZJBM6oJj3ZcxNuV1npeN62fnwpOyTCL/NyjHhKWn4eE/PATJuuf/ffKK2NvR
         l5O6MKTRN5ifGk9nigJmitObdfRL5i9btUsj2E5xzt7sy+nX/kRuir/iAaexJdDqUFJg
         4racwp2lla6NgRk1CkowemsGQ25lhbtxKUZ69OG2cP31L9IIwSsFNGT7+hn7ucd+REZe
         bpReBOAvbbifyVLiPMUCDSGVvfBSE6MFot4sUTf8DSomPdPCaRK9s3qVOS+XAggbGFny
         j31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3PbVXrARru//womsk1QFTfUC/jT1xFpRBIRhWzNLeg=;
        b=VB59JqOIqaDXPClAXUimm8p7iDootZNKVZg2JAL1vWCxo34vMwlvKU2Km/j4M+XAc+
         dSjcvErBoeALjA53npzx0q7IYUD9X76zQel7XFigb5JIl0scoBUQ3fFg5DOQaJRQgIn9
         W6FYkBezEGfrXDSyN6v+MqKVdnr68xojRPPhpVg80K5fzgJOXbqfJa0cCVzfDt//kEwG
         7LzTclcd73syOm4486bI1WzinO4Exh/TCnG5lMCIKnhxNfHEKcpft+n95Y20e+HeMJCd
         IWqpMjPyCQZGTPiLd+I4HzrS7SgeV+HBZdJiRqPUHH4mbwVhCniBjH66TL1JNeZwnuai
         aqVg==
X-Gm-Message-State: AAQBX9cOObw1G6AfPvNJu1tLR8n+krWwC7zrw4+y67mVYYmoRQ95MCuX
	TgsILXMnCNpTzpqzY35MYBh82g==
X-Google-Smtp-Source: AKy350brt1TNZ7pG57+pZfUAcAl5eE1plZdTvYqjEnxz0kMrxGEeLijqmQ0ROub7VB7ZqCDrKQfQFA==
X-Received: by 2002:a05:600c:2942:b0:3ee:4ee:bf73 with SMTP id n2-20020a05600c294200b003ee04eebf73mr4220330wmd.24.1680689907651;
        Wed, 05 Apr 2023 03:18:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 02/14] accel: Remove unused hThread variable on TCG/WHPX
Date: Wed,  5 Apr 2023 12:17:59 +0200
Message-Id: <20230405101811.76663-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Windows hosts, cpu->hThread is assigned but never accessed:
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c   | 4 ----
 accel/tcg/tcg-accel-ops-rr.c      | 3 ---
 target/i386/whpx/whpx-accel-ops.c | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index d50239e0e2..19cfb26c02 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -152,8 +152,4 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 
     qemu_thread_create(cpu->thread, thread_name, mttcg_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
-
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37f..dafff71530 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -291,9 +291,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
 
         single_tcg_halt_cond = cpu->halt_cond;
         single_tcg_cpu_thread = cpu->thread;
-#ifdef _WIN32
-        cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
     } else {
         /* we share the thread */
         cpu->thread = single_tcg_cpu_thread;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index e8dc4b3a47..67cad86720 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -71,9 +71,6 @@ static void whpx_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, whpx_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
 }
 
 static void whpx_kick_vcpu_thread(CPUState *cpu)
-- 
2.38.1


