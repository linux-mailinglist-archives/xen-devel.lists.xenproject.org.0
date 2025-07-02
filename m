Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8DAF6232
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 21:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031483.1405322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gx-0006sI-3k; Wed, 02 Jul 2025 19:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031483.1405322; Wed, 02 Jul 2025 19:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gw-0006qo-VH; Wed, 02 Jul 2025 19:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1031483;
 Wed, 02 Jul 2025 19:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2gv-0004a7-1Y
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 19:00:21 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6ebc7bb-5776-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 21:00:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2796089f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 12:00:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e6f23sm17160457f8f.11.2025.07.02.12.00.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 12:00:09 -0700 (PDT)
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
X-Inumbo-ID: c6ebc7bb-5776-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482810; x=1752087610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MeO0MVHQxtzOMjVIG+Z9L61DD5vh1obKnrosrBS7YI=;
        b=somarGunwNZfDAoGVUNhCF3sn1qgZFrYG3x/++cui3LTqN0CE8+Sk+Qf+uSIuSJDE1
         eTUfyjusafChXmcLHlU+S3LFuqHwsXDBq8oYhr0ixZyy8Xc8VXXQzlDj5+6y6pi3O7ii
         RT2CYcUlKPGv9t/noE8gXkmfSSrKMOTXx8OJqjo5u6XL1mCOTrnq+sWdxd96rZxiHCNQ
         6KwSvMJF5tA8u9NHaCeO04PpdVO7UIjQTwG/54VN8ho7Sg3okwxdc7zrAias61Rj4772
         Jy/IjAwSDweENa/laJSHdCBuEYyXRU2MAzqZATXQvyOFIAcM7uWpdaE6v3nC88fB2qWg
         rG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482810; x=1752087610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MeO0MVHQxtzOMjVIG+Z9L61DD5vh1obKnrosrBS7YI=;
        b=OvM6b7SP9IG26YriK+3Rg5pDquXhq01P6rT44Kv1cG6jXZuNcDelBjFjUcEOCtdStN
         tb7VqRmyythMAL1LrwDQ1/hLn0oWuqaDezThhP1p0Zf9T1x7FUdmjOmtXOlaImgFsIoZ
         LSd0oEkSTv7lhlVrbksCv7QdwsuXfmO+JPmjY6dos9YJlw8djEUDJYC7DkjOMik0N3Mt
         +n6MUBq2Nqw81W4qLm3YRv2xDCFlFIObj+glYtWvAiukROi9sCrzdlSEI2Y4c5aRYS3Y
         LVNCO3VczJzwl+GQVFGrUzk0igLRHBiKq99zV5g5HWx5TK66kQh5fAoT05dB3idS6P4z
         owdA==
X-Forwarded-Encrypted: i=1; AJvYcCUcNuBXEqIXaFwLtIRTsvePbqaXIQTJsRk4HfapnrktMY9J+gEkBqWM74YRP94jzE5BA83HNhOSjSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkmsUbMhuG5y1OQOJZ5XsOebwuvh7SiGpNFHKj0DfojoGoG6WP
	yFdk/IEM41DBvD5OEb5vM4JB7r2yzKemMPq5FEV5QrehL/57CieMGKpR676x69vxuKM=
X-Gm-Gg: ASbGncsBTnrovGDbqJd5igcqEKmbsnQML+YYLqDLtqwORxz1BZSm0OpD/6BleHdJa4S
	QqPPxIG6kTdJiQEsAa7rdMDBxeQ3cBuUPgX5WD7TZtGxP70IzlphDyU5BA2iJizAnINnuwVrB4f
	1WN4shtlkS66AHUDygFm1AV//T+uu790boXeUq/QEPL1GPbn0z5kelTCHIRNqDa01YdmfiXzeLN
	Ge/yAXhye7pu8Pa1IksTZKS+Na7Kj0sMT192RKLyLvh6IZE0SYcBdgpOVXH6fMQYOpbZY9FZUH1
	oQngWiJR70s0zuMv/CYF1QI8aeHUDcglisnTpfxYp2JAYJ5GENmMAs9f2uEQAhSZ1sp18+op/iO
	B5nhM+lzCGBjo/bor3mvEAQRuACOCfrqr5B28
X-Google-Smtp-Source: AGHT+IGAzFYW2tCDZllrD+UyqAdQOcQvAD/ViiyKPGAS9AB0EUk4i5HkuSqBJEdDHxidIq6E8KU+xg==
X-Received: by 2002:a05:6000:4807:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3b1fe5beeeemr3514236f8f.12.1751482809769;
        Wed, 02 Jul 2025 12:00:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 57/65] accel: Always register AccelOpsClass::kick_vcpu_thread() handler
Date: Wed,  2 Jul 2025 20:53:19 +0200
Message-ID: <20250702185332.43650-58-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::kick_vcpu_thread(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::kick_vcpu_thread() mandatory.
Register the default cpus_kick_thread() for each accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


