Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9FA2D038
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884034.1293856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPm-0003mk-8r; Fri, 07 Feb 2025 22:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884034.1293856; Fri, 07 Feb 2025 22:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPm-0003il-3B; Fri, 07 Feb 2025 22:01:34 +0000
Received: by outflank-mailman (input) for mailman id 884034;
 Fri, 07 Feb 2025 22:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgWPl-0002Xy-Fn
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:01:33 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 177a9ca8-e59f-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:01:33 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-38dd14c99c3so210236f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 14:01:32 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb4410e6sm2636035f8f.8.2025.02.07.14.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:01:31 -0800 (PST)
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
X-Inumbo-ID: 177a9ca8-e59f-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738965692; x=1739570492; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHWhi9LlP88PFOcKM3oJlGjDcIcKjnkLzR/D136D9GI=;
        b=bpfS/Sf8/9nCarnHsuVf/iohWwcMK/u2SuDRyXd6sEo/8CiwdgKCBnhTaxDdIXktBJ
         Jg0BXLeJzmJGO5U/0gj+DXOpcXfqMWCzAB286vNVNZZE6lmJ4JF0tCaxp4l/se0HZHwI
         WoSrCIrw2IlXHBnAsgckjUV07mWmlCzlwa57o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965692; x=1739570492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHWhi9LlP88PFOcKM3oJlGjDcIcKjnkLzR/D136D9GI=;
        b=sY1LYdJgSEpLDgIrBSTsf8Ly2HqQmQWb/0BIpzhPck43AWZCubti1hn8tbFKfHYv/Z
         YJ1R5gY8BrLfZZTTS0Xa4eXyMSD2WobwFZltqgmDO/HLlAPsRH5cI2Zd3BDKKpAAlseR
         nuGplOQGhR44dNfo0Vyg/9KMeHD1NS+q/LjZgTwKQAbukTO5e2k3L0QFfvvBKsJscYUE
         Ki6hlI8Usv1a+4DdF4NzZo9QCt4DKS7ZFdzJQFvuAw5D7IbjPy96hHXhtsjV4Qfc7pBj
         An6ARgkUA04jBbRb8An9Frs79WdjVaGjyNyvWwfqv/O9TciIQIW+YEgZVxilhlW+jkS1
         mL0A==
X-Gm-Message-State: AOJu0Yx/ZrWXu1MEathAd4SvX+H1FYeBXnG6cGZ4nUMoi0RMV57L+wem
	XKUfZCh9u+8VnkwFCR27yjsjK91o2VWLJaldHtKDP1YiQa+x1enodAU4Ncpjn6N4XpA9ua2+189
	2ZPqZhw==
X-Gm-Gg: ASbGncuwO22xml2k/50X4ACi5GABw4FmpRJkDbRUV9C2v6EsRTSLWOVpO61bXI3EDoH
	idYXlc6gskr0hU9gh8pMY4kp8pwQy3sDPm2jw6t7O7k4HVRAdAmOvk7U3N5tjYm8Fu7qZBDlr5P
	H4mn854wPHTuR9PBRrSR2C9xOixKZktuN1kvDR5kF+wAU+frNVr1OvVgulaRhG1CfpT3AGkiSc2
	+JCKZmWwGpnsrh582T0jgaIAl17b4x4VSx+WYqG1vlCxxgGxpjFY/W07uJROiWC+EKsNOgx81ui
	poXy8JWYq9LuuVsS+/3d2+gA/KP3fLt/Oa3Lu1W53sCiOMLCgdyyHJEocYF0kkd3gDfGqKY=
X-Google-Smtp-Source: AGHT+IGToOrXAyQPYAf4GdaAsMQzgNSFBh22mxX8a3arJxgNN1SUCCQSqaQrCu1bLfz8Q+/cY2mrSA==
X-Received: by 2002:a5d:5f48:0:b0:385:f7a3:fed1 with SMTP id ffacd0b85a97d-38dc935ef28mr4234767f8f.44.1738965691999;
        Fri, 07 Feb 2025 14:01:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 3/3] RISCV: Activate UBSAN in testing
Date: Fri,  7 Feb 2025 22:01:22 +0000
Message-Id: <20250207220122.380214-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207220122.380214-1-andrew.cooper3@citrix.com>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V has less complicated headers, so update ubsan.c to pull in everything
it needs.  Provide dump_execution_state(), and update the printk() message to
make it more obvious that it's an outstanding task.

As with commit 8ef2ac727e21 ("automation: enable UBSAN for debug tests"),
enable UBSAN in RISC-V testing too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Testing of this series:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715

Sample run with an intentional UBSAN failure:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135
---
 automation/gitlab-ci/build.yaml        | 3 +++
 xen/arch/riscv/Kconfig                 | 1 +
 xen/arch/riscv/include/asm/processor.h | 2 ++
 xen/arch/riscv/traps.c                 | 2 +-
 xen/common/ubsan/ubsan.c               | 5 ++++-
 5 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fb55d4ce5568..35e224366f62 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -359,6 +359,9 @@ debian-12-riscv64-gcc-debug:
     CONTAINER: debian:12-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 # Arm32 cross-build
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 00f329054c94..fa95cd0a4213 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
+	select HAS_UBSAN
 	select HAS_VMAP
 
 config RISCV_64
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 90b800956303..39696fb58dc6 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -91,6 +91,8 @@ static inline void sfence_vma(void)
     asm volatile ( "sfence.vma" ::: "memory" );
 }
 
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PROCESSOR_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index d55a4a827b8c..ea3638a54fed 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -140,7 +140,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 
 void show_execution_state(const struct cpu_user_regs *regs)
 {
-    printk("implement show_execution_state(regs)\n");
+    printk("TODO: Implement show_execution_state(regs)\n");
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index 7f73f94759db..e99370322b44 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -10,8 +10,11 @@
  *
  */
 
-#include <xen/spinlock.h>
+#include <xen/bitops.h>
+#include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/percpu.h>
+#include <xen/spinlock.h>
 
 #define __noreturn    noreturn
 #define pr_err(...) printk(XENLOG_ERR __VA_ARGS__)
-- 
2.39.5


