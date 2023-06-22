Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285273A596
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553738.864494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMro-0002Qn-Un; Thu, 22 Jun 2023 16:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553738.864494; Thu, 22 Jun 2023 16:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMro-0002O8-Rf; Thu, 22 Jun 2023 16:09:04 +0000
Received: by outflank-mailman (input) for mailman id 553738;
 Thu, 22 Jun 2023 16:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMrm-0001Yq-Ln
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:09:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a5da7e-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:09:00 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31109cd8d8cso7361123f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:09:00 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b003113ccbf388sm7480042wrt.13.2023.06.22.09.08.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:09:00 -0700 (PDT)
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
X-Inumbo-ID: 19a5da7e-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450140; x=1690042140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG1kgLZ5QV1q9fprOekDS1vi4YDLS9XqOgasp153yeA=;
        b=pioUrZaFPhU8I3k58jH5e1qB2rLoMjDOpycpjg9MKCT8jB0VWYDPIf8BgBkiqcuhFF
         TGcG4z4waQLxR0t85sX3LfEm1fBfri5nyTc7hT7LFVuMZJ8cJ7iLzkMzgCCxgXAXjRp1
         5FcEvpmzbqIFAxYcu+grqZd6fl2U26lypXHSgtzz883z04khvbCBjPhnZpOIijZm7hIY
         73T6xIrKJfYThnwqe3k9n+UZwuUIp87JUU4oxyTveu1UWR2+M0IfsVqIofaSE6fL7s6R
         TsZ+4CItCUkFmVs4drtOmtuFIt03b22ea/hckXR+fp4F3k6OU3hz418EDxIcz7+/pZ4m
         IaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450140; x=1690042140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG1kgLZ5QV1q9fprOekDS1vi4YDLS9XqOgasp153yeA=;
        b=PDBhd+ugVpqqwPNNOKrhDyrd6L5iob/6cPTlWzlx2Ff3smM+FZJUk8CVaOrhRjVgJq
         mjpyWJdKMmcguiZ44WKEynpI1pfvxdifo2O4CNKr/UNMEEWu6MBp9SPgOSbGFnnh06sK
         M4Rj3nAWqb5CnlDElBO58vTmax7EiztN9QIaGa/0WBaVhfoHVO1nj6LGeAs9MekIwq8x
         VD9cXyaIYIUekjbahYIYBFk68tOU0XYVvKDO5gxbBud2WTM6ZfuabujeTOJITbu1wCqE
         M/t5RgGHGHUYqcQLo3NqE9C0lwYHdTwaYaxzxbawNsmLTV4MlOzfoAf2KJ3ru6H7zV4/
         no+w==
X-Gm-Message-State: AC+VfDw3hklDpFcrZJRSI7E3dfekwhOZ+Yi84FG0Se3jahR3w6x1mWJ1
	x96v31VHCk//gV33myhpoeZZvg==
X-Google-Smtp-Source: ACHHUZ5hS1cl385w0yy33SqHwzVfoviqPj7U7KGbU74d6nSn/Ie9wcppThLz//Iv2Nhpzhzuwuby+Q==
X-Received: by 2002:adf:e610:0:b0:311:1679:6b5c with SMTP id p16-20020adfe610000000b0031116796b5cmr2213196wrm.63.1687450140515;
        Thu, 22 Jun 2023 09:09:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 03/16] accel: Remove unused hThread variable on TCG/WHPX
Date: Thu, 22 Jun 2023 18:08:10 +0200
Message-Id: <20230622160823.71851-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
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


