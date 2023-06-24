Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5C73CC20
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554650.865979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gs-0001xh-NR; Sat, 24 Jun 2023 17:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554650.865979; Sat, 24 Jun 2023 17:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gs-0001sF-KJ; Sat, 24 Jun 2023 17:42:02 +0000
Received: by outflank-mailman (input) for mailman id 554650;
 Sat, 24 Jun 2023 17:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Gr-0008Gp-Dh
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:42:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6eb909-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:42:00 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1638314f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:42:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d6ad2000000b00313e90d1d0dsm650617wrw.112.2023.06.24.10.41.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:42:00 -0700 (PDT)
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
X-Inumbo-ID: 6c6eb909-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628520; x=1690220520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCloP/Ux3IV8UJ0ZKXn7/ebp5dcIIh/2RC3mzeqRGMo=;
        b=B5Q6wTHDnyh2KH0MiJh6f7PRNtQ407iOhYbCWpAuAn2/F07ZIUhbhg5RZhnZx5aixo
         krIptOmRDGX4i+JQ48AmPyA0UMgIN9bZPYWdqQc0zCDEP4Do4gFa4VBPEK3TV2G/qjyK
         TxY+6y3B+iWbYRlATMU2lY1+o9i90v/HVZQYbeyLm6UdtSQEpYHVUcZ5fxK5VJ1NnEYs
         iy0BtiVzJy2t5b9awonbad36/jZG14S8MSTnthMeJln51zyNicO+yZr+ObXx88p69pnr
         S1aw9y9Wlm9wze65oBQ50fPz5m5iQqX+190XTv09khKKIIEk79oKUf1Nr2TcLzDhZUZR
         Grzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628520; x=1690220520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCloP/Ux3IV8UJ0ZKXn7/ebp5dcIIh/2RC3mzeqRGMo=;
        b=RLOzNh42ffm8wZ3wVwvkI9zk7HA7Gs9fFUWmYtxchm58fH1UGE3Wum2i4A8sH3cfLn
         xNe/MYp5gfOHEfmbO/FXarBQ+NvMCXZ95tVE3bQAHDLyVPBwKb0xuCE3UOdeYG1znovt
         ltWth7bc5msTpEnbIV4qSbsBbVhmM0PjKkEw+vk7NzGmx5QpG4kXUcJo1BoZ2G2Ljp9f
         rg6xE96p+vtGSd8H+pRp/vh/gimVJolezp5lM4R4xxieEQa0qONSffT2f9v+NkpK4Ab6
         5alBaj7BK31nbytSaqD6ioyyqL3TXRBZ+nTmnLm28csiM3ISGlEqCtblS3gWlfrUnUcM
         XCbQ==
X-Gm-Message-State: AC+VfDwD2TpkoZnMtScr5Jatvx8lFJ0blPToe4Jb9BhMsMGSPBd15w7r
	5fTXX37k8SQ5D4/Ayg6ud4WU3w==
X-Google-Smtp-Source: ACHHUZ5/SpC0ZbioPxnpVkbdcutfj7CfDUgxK3ql/H+wAujoV6T+DY7QM+cKCk/JAModrZsCdUekWQ==
X-Received: by 2002:a5d:5242:0:b0:313:deda:c444 with SMTP id k2-20020a5d5242000000b00313dedac444mr1551101wrc.24.1687628520556;
        Sat, 24 Jun 2023 10:42:00 -0700 (PDT)
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
Subject: [PATCH v3 05/16] accel: Destroy HAX vCPU threads once done
Date: Sat, 24 Jun 2023 19:41:10 +0200
Message-Id: <20230624174121.11508-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the vCPU thread finished its processing, destroy
it and signal its destruction to generic vCPU management
layer.

Add a sanity check for the vCPU accelerator context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/hax/hax-accel-ops.c | 3 +++
 target/i386/hax/hax-all.c       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 18114fe34d..0157a628a3 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -53,6 +53,8 @@ static void *hax_cpu_thread_fn(void *arg)
 
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
+    hax_vcpu_destroy(cpu);
+    cpu_thread_signal_destroyed(cpu);
     rcu_unregister_thread();
     return NULL;
 }
@@ -69,6 +71,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
+    assert(cpu->hax_vcpu);
 #ifdef _WIN32
     cpu->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index a2321a1eff..38a4323a3c 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -209,6 +209,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     CloseHandle(cpu->hThread);
 #endif
     g_free(vcpu);
+    cpu->hax_vcpu = NULL;
     return 0;
 }
 
-- 
2.38.1


