Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496CAF7EFF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032345.1406020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqV-0002LD-MD; Thu, 03 Jul 2025 17:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032345.1406020; Thu, 03 Jul 2025 17:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqV-0002IZ-I4; Thu, 03 Jul 2025 17:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1032345;
 Thu, 03 Jul 2025 17:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXNqU-0001VU-0z
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:35:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20ab4d13-5834-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 19:35:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso28210f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:35:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97382sm320521f8f.56.2025.07.03.10.35.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 10:35:34 -0700 (PDT)
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
X-Inumbo-ID: 20ab4d13-5834-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564135; x=1752168935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3486zTUHknyNnHUemYDF582+L164Ncw9awD18XnK3g=;
        b=Us8xRbEOBLbd0cMfayo+F8zgI65hnex6qwRVWMFTH0kY9nznUSsOdqzUOuEnKeB5nu
         /+uZY7XM+hU3Xt2Pd2WqAB7JBJwlUmC6zizeZkXb9Ztbcsyw6JzbL2himI1KLEyREEPh
         x9I5zkUVjOGxCv4k07wBd6WHHjzW3A9XXXnOSNtHpVCgS8THCFusoDQ2oczJrBc9DHqB
         5H4cbYGufhUXd00kJNmOspOW9yzHjfUwcgXKxmPu7wdFFUJUwxaLooRL+VqyAIFqISUi
         kvlv4cpVep+NWdg5T+ff8g5MReoP4srx0t4mTicvabyuPmN6dfCLXOyk9zkzq3tAMp7a
         6Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564135; x=1752168935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3486zTUHknyNnHUemYDF582+L164Ncw9awD18XnK3g=;
        b=prCiec8YlxlHKoHDKi9iXnQl/T569Y6w110gKdCULN1i1amfhg7Gg6OLh5Ze9ZPGJ6
         WlR/6j6X9Ak53pT66n1XXYJnlsscJkDrcWYi8cghjIE9IHWIbdXUztESX4jDQg0dNVKH
         erBpvUTncyjD5LBqnBIjfSN4KHCaryKcOmh45TjubTL0MYR9DrQGe4z15fn+EWGR38Ix
         dxWg9j4w9TTW6imqMKPBqGPvhzTuem1F8NqqqYxJADjsT/SdzGFLSMwI3H6YRZxESIei
         dQlQaDR1eS7/Y0aa14XjbnLERCPb59nr3Uw/M45307va9A6/PiJLKryeiFgMhc0AgxQy
         ZHkw==
X-Forwarded-Encrypted: i=1; AJvYcCWqK9eWErupdHc+1v33Rx8QCvRkKSmaMpHQLEGcBORut8oZP3CpVld/Y4FFvs2KtfSsVgR0o4MUC+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEA25yjYn0yS5iZEve9gv2w2zG/9cegKC8oqQisZ6HdZTd3vBR
	sy3Qz6up0vehu9UbU7J3JDYl/KKdegjohnu82PdZm4yCE0v0v/RTk9ElGQvEbjPOcXM=
X-Gm-Gg: ASbGncseQnDlhPvLWqhc/m/ImC5BE52M2I1seBmxWQSMAMgV5bb+1Z7y+FQOz2qz9VD
	u2NXu5MPEs3obXP2Jl6JwJX8IEYDr02jO16+qOAPARtVQpql4vp7NXId0uptDfdnVDbfGoZOK6q
	4HsZXoem4dsjhBDT+QVghg6khCca9ZsIlauckAz+GPOmNqefyZdYPD8xdLEXDF+NIyEdRnxNksm
	KjFEdGQSqCdHv9VGNstMtOVeSEJlKf6PnZgFzxXt+txen2hVAIgfWfH0Izvhjz4su1F/rTZEZdc
	meL3FLdAIp42nXpswjrIosREMarPD89n8rZurcentJuySCMQhw+8ovC7ZEJM8/pvjcU1gd1R0uK
	zIM9+SPCh+4mwmFQJIWejNxjoWklcVZT9wjxe
X-Google-Smtp-Source: AGHT+IFkhhlZSbMvBFh6UdUhOeDV184atk4sneL/YpRsGW7A5ClqyXIooVwAUEBKx8X5RV+czV8IYw==
X-Received: by 2002:a05:6000:220f:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3b32cb36152mr3879437f8f.16.1751564135278;
        Thu, 03 Jul 2025 10:35:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 30/39] accel: Propagate AccelState to AccelClass::init_machine()
Date: Thu,  3 Jul 2025 19:32:36 +0200
Message-ID: <20250703173248.44995-31-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to avoid init_machine() to call current_accel(),
pass AccelState along.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/accel.h        | 2 +-
 accel/accel-system.c        | 2 +-
 accel/hvf/hvf-all.c         | 2 +-
 accel/kvm/kvm-all.c         | 2 +-
 accel/qtest/qtest.c         | 2 +-
 accel/tcg/tcg-all.c         | 2 +-
 accel/xen/xen-all.c         | 2 +-
 bsd-user/main.c             | 2 +-
 linux-user/main.c           | 2 +-
 target/i386/nvmm/nvmm-all.c | 2 +-
 target/i386/whpx/whpx-all.c | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 197badcb705..b040fa104b6 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -40,7 +40,7 @@ typedef struct AccelClass {
     /* Cached by accel_init_ops_interfaces() when created */
     AccelOpsClass *ops;
 
-    int (*init_machine)(MachineState *ms);
+    int (*init_machine)(AccelState *as, MachineState *ms);
     bool (*cpu_common_realize)(CPUState *cpu, Error **errp);
     void (*cpu_common_unrealize)(CPUState *cpu);
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index b5b368c6a9c..fb8abe38594 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -37,7 +37,7 @@ int accel_init_machine(AccelState *accel, MachineState *ms)
     int ret;
     ms->accelerator = accel;
     *(acc->allowed) = true;
-    ret = acc->init_machine(ms);
+    ret = acc->init_machine(accel, ms);
     if (ret < 0) {
         ms->accelerator = NULL;
         *(acc->allowed) = false;
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 897a02eebe2..2cf2b18fd23 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -247,7 +247,7 @@ static MemoryListener hvf_memory_listener = {
     .log_sync = hvf_log_sync,
 };
 
-static int hvf_accel_init(MachineState *ms)
+static int hvf_accel_init(AccelState *as, MachineState *ms)
 {
     int x;
     hv_return_t ret;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 88fb6d36941..1b6b7006470 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2573,7 +2573,7 @@ static int kvm_setup_dirty_ring(KVMState *s)
     return 0;
 }
 
-static int kvm_init(MachineState *ms)
+static int kvm_init(AccelState *as, MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     static const char upgrade_note[] =
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 5474ce73135..2b831260201 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -38,7 +38,7 @@ static void qtest_set_virtual_clock(int64_t count)
     qatomic_set_i64(&qtest_clock_counter, count);
 }
 
-static int qtest_init_accel(MachineState *ms)
+static int qtest_init_accel(AccelState *as, MachineState *ms)
 {
     return 0;
 }
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 0cff0f8a0f9..7ae7d552d9e 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -80,7 +80,7 @@ static void tcg_accel_instance_init(Object *obj)
 
 bool one_insn_per_tb;
 
-static int tcg_init_machine(MachineState *ms)
+static int tcg_init_machine(AccelState *as, MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
     unsigned max_threads = 1;
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index c12c22de785..8279746f115 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -77,7 +77,7 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
     }
 }
 
-static int xen_init(MachineState *ms)
+static int xen_init(AccelState *as, MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7c0a059c3ba..d0cc8e0088f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -474,7 +474,7 @@ int main(int argc, char **argv)
                                  opt_one_insn_per_tb, &error_abort);
         object_property_set_int(OBJECT(accel), "tb-size",
                                 opt_tb_size, &error_abort);
-        ac->init_machine(NULL);
+        ac->init_machine(accel, NULL);
     }
 
     /*
diff --git a/linux-user/main.c b/linux-user/main.c
index 5ac5b55dc65..a9142ee7268 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -820,7 +820,7 @@ int main(int argc, char **argv, char **envp)
                                  opt_one_insn_per_tb, &error_abort);
         object_property_set_int(OBJECT(accel), "tb-size",
                                 opt_tb_size, &error_abort);
-        ac->init_machine(NULL);
+        ac->init_machine(accel, NULL);
     }
 
     /*
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 2df49d7eeb4..b4a4d50e860 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1152,7 +1152,7 @@ static struct RAMBlockNotifier nvmm_ram_notifier = {
 /* -------------------------------------------------------------------------- */
 
 static int
-nvmm_accel_init(MachineState *ms)
+nvmm_accel_init(AccelState *as, MachineState *ms)
 {
     int ret, err;
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 94fd5fc7849..721c4782b9c 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2504,7 +2504,7 @@ static void whpx_set_kernel_irqchip(Object *obj, Visitor *v,
  * Partition support
  */
 
-static int whpx_accel_init(MachineState *ms)
+static int whpx_accel_init(AccelState *as, MachineState *ms)
 {
     struct whpx_state *whpx;
     int ret;
-- 
2.49.0


