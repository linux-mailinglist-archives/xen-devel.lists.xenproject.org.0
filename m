Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83473A59B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553743.864513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMs7-0003Mq-H1; Thu, 22 Jun 2023 16:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553743.864513; Thu, 22 Jun 2023 16:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMs7-0003KZ-De; Thu, 22 Jun 2023 16:09:23 +0000
Received: by outflank-mailman (input) for mailman id 553743;
 Thu, 22 Jun 2023 16:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMs5-0001Gi-NO
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:09:21 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25b93591-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:09:21 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f96so63531215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:09:21 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c21d000b003f90b58df65sm13346472wmj.29.2023.06.22.09.09.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:09:20 -0700 (PDT)
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
X-Inumbo-ID: 25b93591-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450160; x=1690042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
        b=oSZmsX3T/bloo+326SGPd5ZsHm46v9IjsSm+mX6+GHNqWc46SWntkTlBPS90redCNR
         ZUMjqxtJd3cZHvi9zSxHB4xdh1n7b8jsItx4rFl+mHiH+OgAFoaK+J/yb1D8i8vh1g6X
         Wh9p6+BtcM6BS/8tmV15GdIAi11Ly82V4oPU2YaNVUAxQtA0pzh18AGcDLF12Jbmstq5
         FC0EyBMowodStWUPlID3y0Fm2oMAF3cehAD/OcX6fjRY42O0eaZ1AhKvLl08mXhP6Qb/
         KU5JoMrq5Jkcz4ttchABNISgzL5QJIvTO362BtWKxVuE531Y/t0qEaegExQ9L9kbFuzp
         Gf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450160; x=1690042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
        b=brmd/uTKyyNOxq8aIdLP2zTo81L/+ZYQoildiSyworXch68/6Jz/GlY6DzrfBrgEby
         L3eAFvOs4wCyKMhyMA5eoOXGSvK8e67UykSC0I8up91PoL1JRH/+QIRAfWx7fna2TBFj
         vqrnBbTukfGW9RmpTRW0j6ipwKF49sov88JPl1dSsU0gZnY39l3yjbSxUXtCbu9suFct
         MMFmaEboSm8XuEEjes9Q5P1jdWGAHr7SrW+p79Qm/eCJSz6kqwcDaDdE+uAA9hxr3lLg
         PtCB3AG+DJl46dDQpvPkYnEN/VWjDk01g7in6/Di5hW51Yro2s9Uxkaube/wHx9qpyV/
         pOvw==
X-Gm-Message-State: AC+VfDyE7C8tGyilIMtWSFijdSK353jd7YtM9tGP5NFh11M29DCtPJy1
	1o0b/dIIJ6JyK+zFwWkk/vZs7Q==
X-Google-Smtp-Source: ACHHUZ74qZrgBDYUQFFsXIVlBQ+o5CwN3jxcBXCwUZJbgQTonuPJrTO0oSESuEoeaErY25ll4f9Zaw==
X-Received: by 2002:a05:600c:2650:b0:3f8:1f52:f3a9 with SMTP id 16-20020a05600c265000b003f81f52f3a9mr13773747wmy.23.1687450160763;
        Thu, 22 Jun 2023 09:09:20 -0700 (PDT)
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
Subject: [PATCH v2 05/16] accel: Destroy HAX vCPU threads once done
Date: Thu, 22 Jun 2023 18:08:12 +0200
Message-Id: <20230622160823.71851-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the vCPU thread finished its processing, destroy
it and signal its destruction to generic vCPU management
layer.

Add a sanity check for the vCPU accelerator context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


