Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0378AF61FC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 20:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031453.1405261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2bX-0003Ck-AO; Wed, 02 Jul 2025 18:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031453.1405261; Wed, 02 Jul 2025 18:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2bX-0003Ao-6T; Wed, 02 Jul 2025 18:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1031453;
 Wed, 02 Jul 2025 18:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2bV-0003Ai-Al
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 18:54:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 032a4a8a-5776-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 20:54:42 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so51343715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 11:54:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9966a00sm5940465e9.3.2025.07.02.11.54.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 11:54:41 -0700 (PDT)
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
X-Inumbo-ID: 032a4a8a-5776-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482482; x=1752087282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pcxyecq1Uca5OV4SmO/+hJU9sxDq9D6xrBJnOg87yRs=;
        b=foU7zJ/z1cKdybMLNk1BnCVaXcDZ87GCh4aSbN8GwqJMfSUjdM9jagXD8kq+Apm3l2
         dvStAn3gKtqcEqkMA78Ba6wIY5YzTWi9fMhCN1QP0ULq3cQVGVjO6r/jNhupqkcV1Gyy
         COFq6zFmI8GjiT+t4DUni6lYNsNMXAwyvNigUiHXKxsGucIFU8Vn+76VVSgW8VzUW72h
         26Yk3r1vhry4Vx1y4g98McaQH98g00eAgZxF/q2DM/c8sDlNGmtNFMmzuJbaCVXMZ7hx
         zpUCHV6RPIPgdWE9/wStJelG/MetoTDeBidcVoAbQL9R8jXKlguK/BJmGXsWQRaX4Gch
         COxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482482; x=1752087282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pcxyecq1Uca5OV4SmO/+hJU9sxDq9D6xrBJnOg87yRs=;
        b=rGxwf5HayApBOijebtHr89e6Z9nLNfceqiiNTKIbdPtUDvTpxdS0LlrOIKEjQZuOBK
         3cOB2wLA3f/dAohG1P1U3n34JbOsRnrJIEtfAT6LdW/RXw5oPwuLAqPKoBUEIuE0tUhD
         nHv9uCDOnL9/AU7PCF1nBJcj9GObwIVVPZT7WS4kUwD7BKNQBv4RRyi7eFCC4HR6ddgu
         lI/iMcsuTEpkyvUPuaele0hCUgFIS8Ev9GOAwJIc/3QjhlDJoIea+Q0kEmuihEeXiVfF
         fS7z98L3HSdNUZbwGvPlr/igUKorGuO1NU9FDM+altJdc6Plbrk5P0AS/ZbVakSl2NmN
         G/LA==
X-Forwarded-Encrypted: i=1; AJvYcCUNVtMw+RlpjqS1WdU52uUSCjzh2YmkbKGAwg5R3RAGYDEhQJp7Dkcf+Bka9g0TULBuoWuF/PMzqc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZuQJt2K5NpvzjFY/Nr90teH+hgwtPg6K+KfTfu6GIMOJD8HmD
	/LCyMLHo9/DXpFSJlcr2b3MpFa3pQTBdKhaTnOU6bW9raoh0HVL7k4WYoZ9fn9urzfg=
X-Gm-Gg: ASbGncsySgccqNFHKn88ib2ehWKi+CBNo4OlfpQyjk0IYbKOM5vNyYn7SZngWSuAG33
	h5IrhRJ/0i3bO9brrtaLUFItx8KWXp7702SXd8LXO7lfLUol0Tymk+pf8lxUcOWy8CHyypfgXj3
	OmXC6waeE6VSQjxlYqed9ypitDeSPdzzKXy2ojP74Hd4ohqgKO6D0WqJqDWcPRfDwjJW3GMLaPI
	0RgQ9CGy5LdqNQXJ8miMnRG1DQ3sgA2SqANsvKJGU1hzBaLnuIzJ49+O9hDW2PKxqN4ojoXed9P
	5CH6f7TIgNlS+O1YcVhnDTNPinHAgqLUcgmUxQNpuFIgAXfYDi1oHTreTgYNL39edIOqLAmQzvF
	kAmiSyN+t4D2JZXnaWi2WcToesbzi+R/dAYkCdVMEsZEYW6c=
X-Google-Smtp-Source: AGHT+IG2xbJ0vrnlKXjnJOXC1pKqbgrk71RyrOx0GBs5KhAxvWN6hGdVgbklFARA84XuaOzPgh1qcg==
X-Received: by 2002:a05:600c:3b07:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-454a3704fd2mr40210905e9.19.1751482481564;
        Wed, 02 Jul 2025 11:54:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
Subject: [PATCH v4 09/65] accel: Propagate AccelState to AccelClass::init_machine()
Date: Wed,  2 Jul 2025 20:52:31 +0200
Message-ID: <20250702185332.43650-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
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
 accel/hvf/hvf-accel-ops.c   | 2 +-
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
index 9dea3145429..b9a9b3593d8 100644
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
index 64bc991b1ce..913b7155d77 100644
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
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b9511103a75..6af849450e1 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -321,7 +321,7 @@ static void dummy_signal(int sig)
 
 bool hvf_allowed;
 
-static int hvf_accel_init(MachineState *ms)
+static int hvf_accel_init(AccelState *as, MachineState *ms)
 {
     int x;
     hv_return_t ret;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 17235f26464..264f288dc64 100644
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
index 92bed9264ce..8b109d4c03b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -37,7 +37,7 @@ static void qtest_set_virtual_clock(int64_t count)
     qatomic_set_i64(&qtest_clock_counter, count);
 }
 
-static int qtest_init_accel(MachineState *ms)
+static int qtest_init_accel(AccelState *as, MachineState *ms)
 {
     return 0;
 }
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 6e5dc333d59..d68fbb23773 100644
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
index de52a8f882a..1117f52bef0 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -76,7 +76,7 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
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
index f1c6120ccf1..eaae175aa5d 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1153,7 +1153,7 @@ static struct RAMBlockNotifier nvmm_ram_notifier = {
 /* -------------------------------------------------------------------------- */
 
 static int
-nvmm_accel_init(MachineState *ms)
+nvmm_accel_init(AccelState *as, MachineState *ms)
 {
     int ret, err;
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index cf6d3e4cdd4..f0be840b7db 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2505,7 +2505,7 @@ static void whpx_set_kernel_irqchip(Object *obj, Visitor *v,
  * Partition support
  */
 
-static int whpx_accel_init(MachineState *ms)
+static int whpx_accel_init(AccelState *as, MachineState *ms)
 {
     struct whpx_state *whpx;
     int ret;
-- 
2.49.0


