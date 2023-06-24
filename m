Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4973CC1D
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554643.865959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gg-0000zt-UI; Sat, 24 Jun 2023 17:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554643.865959; Sat, 24 Jun 2023 17:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gg-0000xj-Qj; Sat, 24 Jun 2023 17:41:50 +0000
Received: by outflank-mailman (input) for mailman id 554643;
 Sat, 24 Jun 2023 17:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Gf-0000wd-G6
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:41:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6468e15a-12b6-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 19:41:47 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f9bece8d1bso22347675e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:41:47 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f9b0f640b1sm2712454wmc.22.2023.06.24.10.41.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:41:46 -0700 (PDT)
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
X-Inumbo-ID: 6468e15a-12b6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628507; x=1690220507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG1kgLZ5QV1q9fprOekDS1vi4YDLS9XqOgasp153yeA=;
        b=K86GwMMvk4Df7udKOIOJ1vd/414tWjcj7PaRdAJ3QyILeXtNH5ZrXuja1IMnbHcdr6
         Y3ebUsAdLPajHQlE39ljJ0fh/t/JOBvYNV3b1NEe+LE9+APH19Ejl4JAt+dbQAuXBfQG
         APP2deEp7Mz2AHGIykGQohAv+jMZxXlGcUZUUP5eB4eZ+/bp2zpXSpG45gUaftUbbM4h
         5VXKPOKiAkaTH9X4aafmA+F7qu6COUvyHTBWEy2hotlnbHYRw86edbr2sm8Jd6RGhxKg
         UTQS4TDFLjCbZez6jFysEJYiEbh83uGUurvLwpjCbf3TGV5woFHYcA+a7TFnE+XwwpJc
         rP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628507; x=1690220507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG1kgLZ5QV1q9fprOekDS1vi4YDLS9XqOgasp153yeA=;
        b=WzV8ca3ZJXh4ugua8NwCEHSBNiQLJQUDlGbFixxopDByGzHMH02exGb7BUfsd0e4VR
         QO1YAQdF0cgOTW92VSbBEABkW/0buDSzCPX3sKp4+pk8+pLFPxsOjUMTnbMqp/3G5Y9W
         5AqPfOgbGIqhSczqEe4+N+k/spBAp9kA+IFIiDbM7JGIErdgLOFqFmNncAqJGwruxn75
         MLuxGv6uubr62ThUsMIqridKmwVZdF+BHR+CGExKvxUkh5LlmxGBT+ozsJGLVY/+bCL2
         YxRh/3n3PDfop0T/tRHg9tVXWuUM35Qa38ErQXSeoVx2SeBVyn5W3bcagh/q4ysZJbwa
         Ru3A==
X-Gm-Message-State: AC+VfDz7Ko9ahy3tAbuuALmkUaJnS4MY0CNWdI+JaA1VwKLEwc6LEsbX
	xV8mrwtyBhH5vOMbx2VajiDPnoCZUtTmu0Wk1w0=
X-Google-Smtp-Source: ACHHUZ7OfepQue0fzzv7ARVu6MjpgeQ79vp0jBcJMaT0gk3oCOgSw7w1smkAWzCkTRk8bysAFxnFSg==
X-Received: by 2002:a1c:7419:0:b0:3f9:b79d:a5fa with SMTP id p25-20020a1c7419000000b003f9b79da5famr10746278wmc.16.1687628507031;
        Sat, 24 Jun 2023 10:41:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	xen-devel@lists.xenproject.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 03/16] accel: Remove unused hThread variable on TCG/WHPX
Date: Sat, 24 Jun 2023 19:41:08 +0200
Message-Id: <20230624174121.11508-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Windows hosts, cpu->hThread is assigned but never accessed:
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c   | 4 ----
 accel/tcg/tcg-accel-ops-rr.c      | 3 ---
 target/i386/whpx/whpx-accel-ops.c | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index b320ff0037..b276262007 100644
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
index 23e4d0f452..2d523289a8 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -329,9 +329,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
 
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


