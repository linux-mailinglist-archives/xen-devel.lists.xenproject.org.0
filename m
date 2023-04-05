Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DDA6D79B0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518423.804982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Nz-0000T0-9a; Wed, 05 Apr 2023 10:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518423.804982; Wed, 05 Apr 2023 10:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Nz-0000L1-2a; Wed, 05 Apr 2023 10:29:03 +0000
Received: by outflank-mailman (input) for mailman id 518423;
 Wed, 05 Apr 2023 10:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0ES-00024X-SF
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f45fb5b-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:19:12 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id n19so20587973wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:12 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003ede06f3178sm1730449wma.31.2023.04.05.03.19.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:11 -0700 (PDT)
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
X-Inumbo-ID: 4f45fb5b-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAVav4ABEpIiF2Ib5SEI8jHJn5J3YAuyzrKJBGzco1s=;
        b=hHxXSS6O9+86vT2m6d0DTc+hiT8gaRNGAVM+7W9qw5K7dcdKYYbh0E7lvSzpkYn368
         fOMNZZP/1e+qRYjuveniW+hqJPeXRIDEN0l73ChMXeJHLmaPOblTjTKGwBGBBShSS3FY
         MjxZ0uY781JiDGIyrZ2Wmf9jZfbEMqhXfcJrGMdfGEFfNJ40NRBoRK/JRBa+tS5fdI92
         eU/ZF0jqD4wzOX6Sr/86Q1BA8EHQgHGTKipyyzmSWtpcvo657D+2/e3mC0kuVQ+XljSH
         s07gbWhPjhP4utq/Kj/s6MnBKF2BXRP7AOXf6kw6C44JcSBNEeM091V355Hm/Q/Y0H3V
         Xa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAVav4ABEpIiF2Ib5SEI8jHJn5J3YAuyzrKJBGzco1s=;
        b=r0T/AgGQgPTwWlFRuvSMOVNOkd3Eg89SaacytUiZgbkguQ0bMbB+kiUEylaneX+tQQ
         VvaSIPzIz9ZoAwd+YdLsmWwD4Dl8F0/gLncgYxdmxZC+ghIXnznrMEpyGf3CJfESIyXa
         IHzIH0jdOKZQgQr6/5G1QidfGAYNnsA79PX0ywMOcLa3fIas1mntpdtRCoj2W8gwAmB2
         h2Jj36abKocfiCQnRuQVCUN7C7N3BYbQCkX/ySVrDvNzwThAIt79+N4rAfrcy1uRWiUi
         MmWHbAT2ODcniJrtDcAl0F89/TsRA+vNEfKq+LoIfgYx3Ejo4CgFvyTN3kFscFGwLqPO
         ADPg==
X-Gm-Message-State: AAQBX9eLn0bTzTKqijVcuVsRo4ag9vwO9B/irOvAQFjNJXI2PX2glKd7
	bN78kTUp+PUHaogTff+bhLwMg5EwWpnNd4dZof4=
X-Google-Smtp-Source: AKy350Zr65D5G7Y2SXbNR//LfCiPeKcYs21bo5zZhAXH6JQLmNB2HwLRUfAeUMYH/5tXslpZRuo8zQ==
X-Received: by 2002:a05:600c:28f:b0:3ea:bc08:b63e with SMTP id 15-20020a05600c028f00b003eabc08b63emr4378808wmk.2.1680689951840;
        Wed, 05 Apr 2023 03:19:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 08/14] accel: Move HAX hThread to accelerator context
Date: Wed,  5 Apr 2023 12:18:05 +0200
Message-Id: <20230405101811.76663-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hThread variable is only used by the HAX accelerator,
so move it to the accelerator specific context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h           | 1 -
 target/i386/hax/hax-i386.h      | 3 +++
 target/i386/hax/hax-accel-ops.c | 2 +-
 target/i386/hax/hax-all.c       | 2 +-
 target/i386/hax/hax-windows.c   | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 173f47d24e..8d27861ed5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -334,7 +334,6 @@ struct CPUState {
 
     struct QemuThread *thread;
 #ifdef _WIN32
-    HANDLE hThread;
     QemuSemaphore sem;
 #endif
     int thread_id;
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index d11d43e857..15d16772db 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -27,6 +27,9 @@ typedef HANDLE hax_fd;
 extern struct hax_state hax_global;
 
 typedef struct AccelvCPUState {
+#ifdef _WIN32
+    HANDLE hThread;
+#endif
     hax_fd fd;
     int vcpu_id;
     struct hax_tunnel *tunnel;
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index a8512efcd5..5031096760 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -73,7 +73,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
     assert(cpu->accel);
 #ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+    cpu->accel->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
 }
 
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index a55b18f353..c9ccc411e9 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -206,7 +206,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     hax_close_fd(vcpu->fd);
     hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
 #ifdef _WIN32
-    CloseHandle(cpu->hThread);
+    CloseHandle(vcpu->hThread);
 #endif
     g_free(vcpu);
     cpu->accel = NULL;
diff --git a/target/i386/hax/hax-windows.c b/target/i386/hax/hax-windows.c
index 08ec93a256..b907953321 100644
--- a/target/i386/hax/hax-windows.c
+++ b/target/i386/hax/hax-windows.c
@@ -476,7 +476,7 @@ void hax_kick_vcpu_thread(CPUState *cpu)
      */
     cpu->exit_request = 1;
     if (!qemu_cpu_is_self(cpu)) {
-        if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
+        if (!QueueUserAPC(dummy_apc_func, cpu->accel->hThread, 0)) {
             fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
                     __func__, GetLastError());
             exit(1);
-- 
2.38.1


