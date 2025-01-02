Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884FD9FFF62
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864431.1275662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQon-0003L5-AY; Thu, 02 Jan 2025 19:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864431.1275662; Thu, 02 Jan 2025 19:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQon-0003Iz-6v; Thu, 02 Jan 2025 19:25:17 +0000
Received: by outflank-mailman (input) for mailman id 864431;
 Thu, 02 Jan 2025 19:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQol-00030j-L2
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4abc98d2-c93f-11ef-a0dc-8be0dac302b0;
 Thu, 02 Jan 2025 20:25:14 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3863494591bso6151745f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:14 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:12 -0800 (PST)
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
X-Inumbo-ID: 4abc98d2-c93f-11ef-a0dc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845914; x=1736450714; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNg/xL5jgFrtg8KGSp8+PUC646w5vHXUt7CvxvruBYw=;
        b=rupzvsGwV4T7VztuA5Fdvu9Ta8kQbO5qUMTpWHE5p5lDU+NTaLKWERUkqZBuCNlkEI
         hPHHSSEwxkUsfamWRL5ZtgiptdWLEsYh0NyKQeb/cEi67jNEhsu3CXTarg9+EeqJGmqU
         QTs5hL9Mn9eTxBfnxlE8ejVRpiQS7Aeo05oJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845914; x=1736450714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNg/xL5jgFrtg8KGSp8+PUC646w5vHXUt7CvxvruBYw=;
        b=VUBYIRoB6n1gGrc/+tbxu83WiH+ENxO4hspAPZKD0b9SsVTKDacw+H+roA85eYC0nU
         E5Ct7DgqDWTuep6C9urfsJGuSaxvh9OhZqZCPGIRagW8ostD9jhOuSsdhoI6tcoOvRMg
         c76OhPIlFdsqymRNW5Lu5gbknb+OtAUKKKVgOTcvAfmRCNa0zaeCvX72AYouUl0MQoFw
         PIEyw2Pr3q+d1R85vStDG7nvDd6F12h2jaaeWxDgNO77hJwTr3MeO4sqyjk2y3JrX45P
         0XxVHU6184f3g9Qr99qkm9qbL6Kb4JnmgpLGjQ8Q35hjR8MDx6I+7x/50qvjSoOZL6AV
         d4BQ==
X-Gm-Message-State: AOJu0YxqHECluwZlmCyQ6nw3cdPUiNQfgiNE4kQxxKr3q44lJSJYy6+e
	liMnSB3YqIame/Jv2yWC/XSeLeb5J6zSfu3picI2fpY5nMmq6xOm4Y+68CfXTaAGpT0jpk412Bj
	I/gKvDg==
X-Gm-Gg: ASbGnctx3uPO0BwGxuFB3BRIHcm9SEMZakZR61FRhygDaTxax4OZPiXPokPC1CSGSlT
	yuiCzGFcbni/WBj5jrFrl4rZc/SWdUjmIL6tj+FzmHt9TpQjtkdbf3UW548WETfsv6XQ/ooNk9k
	ZAJy7x3a6V/XanbFMeiStDTVwUXIEAJJNcETJjPolbOgEyFvDcK8FyHZyiof7biDNx7QGc5jLB0
	iiO+VGGTs6UdAf8CgUg3ljBKSfUNDAl3f1ihrblzR5icWvv0GXgMo1aoNy0oLAgWw==
X-Google-Smtp-Source: AGHT+IEO0jFa1wsTom2pBAvfDBImQ+92OtAvCK8OHQn98ont8h1Zd3voDTpF+kkLcK3kGKcB23SwrQ==
X-Received: by 2002:a05:6000:18ae:b0:385:e5d6:130c with SMTP id ffacd0b85a97d-38a22408dcfmr33328269f8f.51.1735845913749;
        Thu, 02 Jan 2025 11:25:13 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
Date: Thu,  2 Jan 2025 19:25:05 +0000
Message-Id: <20250102192508.2405687-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and hook it up for RISC-V and PPC.

On RISC-V at least, no combination of headers pulls in errno.h, so include it
explicitly.

Guard the hypercalls array declaration based on NR_hypercalls existing.  This
is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so drop
the randconfig override.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml      | 1 -
 xen/arch/ppc/include/asm/Makefile    | 1 +
 xen/arch/riscv/include/asm/Makefile  | 1 +
 xen/common/perfc.c                   | 1 +
 xen/include/asm-generic/perfc_defn.h | 5 +++++
 xen/include/xen/perfc_defn.h         | 2 ++
 6 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 xen/include/asm-generic/perfc_defn.h

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1b884cc81cdb..41f17ed45641 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -734,7 +734,6 @@ debian-12-riscv64-gcc:
       CONFIG_GRANT_TABLE=n
       CONFIG_LIVEPATCH=n
       CONFIG_MEM_ACCESS=n
-      CONFIG_PERF_COUNTERS=n
       CONFIG_QEMU_PLATFORM=y
       CONFIG_XSM=n
 
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index ced02e26ed13..c989a7f89b34 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -7,6 +7,7 @@ generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
+generic-y += perfc_defn.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index ced02e26ed13..c989a7f89b34 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -7,6 +7,7 @@ generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
+generic-y += perfc_defn.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index ed4dba36f1bc..8c967ab900f9 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -1,4 +1,5 @@
 
+#include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/smp.h>
 #include <xen/time.h>
diff --git a/xen/include/asm-generic/perfc_defn.h b/xen/include/asm-generic/perfc_defn.h
new file mode 100644
index 000000000000..8237636d83fb
--- /dev/null
+++ b/xen/include/asm-generic/perfc_defn.h
@@ -0,0 +1,5 @@
+/* This file is legitimately included multiple times. */
+/* #ifndef ASM_GENERIC_PERFC_DEFN_H */
+/* #define ASM_GENERIC_PERFC_DEFN_H */
+
+/* #endif ASM_GENERIC_PERFC_DEFN_H */
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 0027d95a60bc..a987d80dd6f1 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -4,7 +4,9 @@
 
 #include <asm/perfc_defn.h>
 
+#ifdef NR_hypercalls
 PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
+#endif
 
 PERFCOUNTER(calls_from_multicall,       "calls from multicall")
 
-- 
2.39.5


