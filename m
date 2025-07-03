Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E1AF7152
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032005.1405779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHgp-0006SF-37; Thu, 03 Jul 2025 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032005.1405779; Thu, 03 Jul 2025 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHgp-0006Qh-0L; Thu, 03 Jul 2025 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1032005;
 Thu, 03 Jul 2025 11:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHgm-0003ud-Un
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:01:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076dd699-57fd-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:01:11 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-453643020bdso68442765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:01:11 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997e24bsm23541895e9.16.2025.07.03.04.01.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 04:01:09 -0700 (PDT)
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
X-Inumbo-ID: 076dd699-57fd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540471; x=1752145271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jox9I/hc4IW12DCVXl2QtoaQase5UN3XaHbWxSzsiYo=;
        b=secjHwsm48UYqsGvmKjBQWbOXIpJXoyJ9u4Ppzb1XkrTcieFVmZkfiGFENH5IbNVsM
         T2F7iVbe5kaFh0quNQa/PhGiIOS8f31LUmvCGpB+YItASBtozIrNS4M4vY+YHfAbBtUl
         rwb4TgTqNc76ilX7c1aZWjW48K6SmVRNu5hrO8LMxm6hY/oeqYUiORSOhBNBwf58Xh1x
         iy+wHbZXRSLj5zecvhbQBbLl5G6pYv21NDaeFPgnMLZ0ir1xfj+FYFZH/lwdSOdpvo3A
         55LbW8oKaAAOvYrWBkXpQdv2WI6HkmSzMqjrG8Y4Dnxtf4Yuth/5ayXgEgj9cIqVUsKL
         IlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540471; x=1752145271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jox9I/hc4IW12DCVXl2QtoaQase5UN3XaHbWxSzsiYo=;
        b=ZXCqEg1IOZD3NrJeBPTs9Y9SqUUb4X7DkJ2GRTwcXzFqx/wl8DmfWNBCvLgRw9zAo5
         AytaIzbMxNkhnaT5SMkSuEvhVBSuxQ8VEUOlWUzwVF5lGLCHfwzFw3si9JlDL1olNu49
         znzPNS1Q/31MzcjNF7aGMUsLLHw+d4z1xB5DlIlTkqAFtFCFrGHNWe2ZKlGc5gtnyZ74
         TiGvGcFGW437aCafvnZtpAoy9kyYqlQy/0NxweDxO22FOX/uqNjA+a90beSwXCPhC6FD
         YGfDz5elb7VtySV2IiAHS22s1hHWFVMUDHUhPUMRjQ8gKYStKAwVXysiJOgMlOu3+QNB
         O1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXRLrkj7TTmGXmoiC0klAChck5tZctn8ce0f/B5ayVslqrRmb/d26XhsLkukVp5naS4e8/Ec7NbKGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRGQy917e00uR+PqsltwNRPcj2NRHJxaCpvVassMENMBmEwKjx
	VyDI8R+HDII0JjC1rsmdVlSEAceER0W4ObNGSslNLmnj6tah6auBzjbV1zdX98TmfeA=
X-Gm-Gg: ASbGncvXftR+powm2k7aK4rlqoNHPFmGLw84YyqJb4+ry3DZxCW03o/sJtQRg3TPYkD
	Kuu3HFKxwUXMF5fe21kTIWw5iNCgDFVn1vsgsIfhQyADv6LuwT2O+7kjIpdGzyhPMTnVh8HJVpL
	izxY/uWsM3YINT28R+jwi2vex5Ri9hnEsg31HR3ygaoIaZsnYZovro5HElE+pbza/GxU86UAXCZ
	Mqth99y8JVDkv5wf/NUGR94g2pjI5EXbwO18fI24CIF8gfsHS6AU4khvAADBHN8HmC93dW3dVa8
	kjxzzbeaTsu0knTRJCRrTYzbcGp4ClZMYsl7Je6c4IxygMkcagAQs7sBeaJZdVbC7Hb3ItqUiJe
	T/8ldFm2PRDI=
X-Google-Smtp-Source: AGHT+IHAtbR+hufxeMURDPAweaVvkz8bA98tXT/yfuO0i+zP0XtJFFoPdGy8SpZsMLysHsZr5JSWzg==
X-Received: by 2002:a05:600c:8b43:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-454a3d23106mr69823115e9.10.1751540469774;
        Thu, 03 Jul 2025 04:01:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 62/69] accel: Always register AccelOpsClass::kick_vcpu_thread() handler
Date: Thu,  3 Jul 2025 12:55:28 +0200
Message-ID: <20250703105540.67664-63-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::kick_vcpu_thread(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::kick_vcpu_thread() mandatory.
Register the default cpus_kick_thread() for each accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/system/accel-ops.h | 1 +
 accel/kvm/kvm-accel-ops.c  | 1 +
 accel/qtest/qtest.c        | 1 +
 accel/xen/xen-all.c        | 1 +
 system/cpus.c              | 7 ++-----
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index dc8df9ba7dd..e1e6985a27c 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -43,6 +43,7 @@ struct AccelOpsClass {
     void *(*cpu_thread_routine)(void *);
     void (*thread_precreate)(CPUState *cpu);
     void (*create_vcpu_thread)(CPUState *cpu);
+    /* kick_vcpu_thread is mandatory. */
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index b79c04b6267..a4bcaa87c8d 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -81,6 +81,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->cpu_thread_routine = kvm_vcpu_thread_fn;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
+    ops->kick_vcpu_thread = cpus_kick_thread;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 47fa9e38ce3..8e2379d6e37 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -66,6 +66,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->thread_precreate = dummy_thread_precreate;
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
+    ops->kick_vcpu_thread = cpus_kick_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
     ops->set_virtual_clock = qtest_set_virtual_clock;
     ops->handle_interrupt = generic_handle_interrupt;
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index a51f4c5b2ad..18ae0d82db5 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -154,6 +154,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->thread_precreate = dummy_thread_precreate;
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
+    ops->kick_vcpu_thread = cpus_kick_thread;
     ops->handle_interrupt = generic_handle_interrupt;
 }
 
diff --git a/system/cpus.c b/system/cpus.c
index efe1a5e211b..6c64ffccbb3 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -486,11 +486,7 @@ void cpus_kick_thread(CPUState *cpu)
 void qemu_cpu_kick(CPUState *cpu)
 {
     qemu_cond_broadcast(cpu->halt_cond);
-    if (cpus_accel->kick_vcpu_thread) {
-        cpus_accel->kick_vcpu_thread(cpu);
-    } else { /* default */
-        cpus_kick_thread(cpu);
-    }
+    cpus_accel->kick_vcpu_thread(cpu);
 }
 
 void qemu_cpu_kick_self(void)
@@ -670,6 +666,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
     assert(ops->create_vcpu_thread || ops->cpu_thread_routine);
+    assert(ops->kick_vcpu_thread);
     assert(ops->handle_interrupt);
     cpus_accel = ops;
 }
-- 
2.49.0


