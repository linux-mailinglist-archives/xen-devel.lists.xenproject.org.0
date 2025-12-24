Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642BCDCEA8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192965.1512095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHD-0006cI-R3; Wed, 24 Dec 2025 17:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192965.1512095; Wed, 24 Dec 2025 17:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHD-0006ZK-GE; Wed, 24 Dec 2025 17:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1192965;
 Wed, 24 Dec 2025 17:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSHA-0003CV-P6
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:52 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85788b4e-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:51 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64b8123c333so8864650a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:51 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:50 -0800 (PST)
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
X-Inumbo-ID: 85788b4e-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595831; x=1767200631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6hiHqwl+Z7Yh4uAVa4kDT1XiFyPodQcTQAl+wvwf0w=;
        b=XMALNBWcjzpRY9YOG2Vq53gnTeLAkbsnjDDqnc8OX9fy4TS7ewbiIou6BRaVcWHGor
         LnzI9weig+GZ8evxyotaZwrQ9PmCGhtptWul0MYTp1oV/PCYecw/b8pZd89SUfCUo/4a
         eRqUE+34U+ogkGkFJEcPE5A/QS7BOz1zZakNKrjuCI6klsxcDSJ+mNlFuXaOlNIV8LJB
         5lY5skjnlavdjvsjNwmPzh6rUiJA0sso6p0kxTHfece16DkFJiM/70UNdWcYBo30g0Y8
         MdE7QJoUMWImF2wHttUeuepV7jZfuk8hgQ0+M4Izc/ZCnOD/u8cvqPUCYyyjCxR22Q6o
         /b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595831; x=1767200631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6hiHqwl+Z7Yh4uAVa4kDT1XiFyPodQcTQAl+wvwf0w=;
        b=n6vBdwTYOmcoXWG0kPIcRv+f0jJSHS3lsUNkdS5X8F+BruBSSF1MwJTTJgFuuMq9d3
         XSATp4Dq4gcdIxcjge5pmqcPFwBh3RXueUWaFLrpesDLV3vqy13ZwW8sseNm4IqphnuM
         sltECfcTtdwOGBZ3dYX93pwN+K7YQMfn1drUdF9njg1E2mbI81kbyJyGCZZBqpE6Q5cL
         yau4wu98H6YE5IkLTJqdqZpaSgrRy9uCNM7RoobMfiyp0p35mqtaQw7k50f/CqjPWgz8
         5P1eIkzUOXpOyueehpuOLD4YPxK+KB2otEv6sy4HRBbLphZ5GBNyF5ezQJTndYX2HCjR
         6GQg==
X-Gm-Message-State: AOJu0YytEL9I6dhZPg53FIBVKb4y7oIMi0Pmy5gGw9GoeWgNL+KYQXpq
	ci0bvmQocoR+hvFhPZyrm7amaGHs1pim488dVfFjHMgP/TR4z+r3FzgqeAGkVw==
X-Gm-Gg: AY/fxX7/9Ilnyr0mn+M51tMYOvZpJwg5vGvT9VJd+tM/yir9J/NyBSU1/TkQe4sL0D4
	Y/fUSQBQmeeBQvWVxSVFA1Ajd9CO63k2Ednq+hL/XxE1QQe4wI8RQEbHkPPQDWssn6D1Wg4Y6gw
	VSlhdj9niqKbTLp+FGcKfrDysM+ieYDQXWKEBMmk9z7SdtFs7lbbPgQ5h+sA7nANeAXMUJk+y+x
	1ODiFM1EDieMRqutsFZWuX3W0ERjKbINu6qS1geeXQg/IXeILZ+Wig7yWmixd5L0WnsRCxpTyK6
	BejOd1dBPYsa8Zn8fZ7Pi6GyM9wa5DUDSOUWh78QYXOQQ4P0om5EtIY5Sp2GmwRqEO5fA2b0oy0
	xIkVYPrmHVXglR/dGdByY5MsSHfWIcQtCQUxRH2A7nmJTsPD3mw+w0syMDsVnJ2D29JEfTVCUXp
	fZ2nBgTmsCzy4bOyuNB/bOd+pNV50DW8MnRPO0nWAbFJQaBUVS1S1XKLo=
X-Google-Smtp-Source: AGHT+IFZDDoqLAbYXkPFbUkXKiCs+Oiox6J1OyndpU35+7MxaU1dUMcYECbzYLhVMAVG5FUxsi2txw==
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id a640c23a62f3a-b80372228e5mr2019898966b.60.1766595830803;
        Wed, 24 Dec 2025 09:03:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 15/15] xen/riscv: init tasklet subsystem
Date: Wed, 24 Dec 2025 18:03:28 +0100
Message-ID: <7fd154cda45466ca4bd425bc05d191caccc7d96d.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

After introducing sync_local_execstate(), the following linker issue occurs:
  riscv64-linux-gnu-ld: prelink.o: in function `bitmap_and':
    /build/xen/./include/xen/bitmap.h:147: undefined reference to
                                           `sync_vcpu_execstate'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
                        `sync_vcpu_execstate' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
Therefore, an implementation of sync_vcpu_execstate() is provided, based on
the Arm code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c | 23 +++++++++++++++++++++++
 xen/arch/riscv/setup.c  |  3 +++
 xen/arch/riscv/stubs.c  | 10 ----------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 8a010ae5b47e..574a5a34a389 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -141,6 +141,29 @@ void vcpu_kick(struct vcpu *v)
     }
 }
 
+void sync_local_execstate(void)
+{
+    /* Nothing to do -- no lazy switching */
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    /*
+     * We don't support lazy switching.
+     *
+     * However the context may have been saved from a remote pCPU so we
+     * need a barrier to ensure it is observed before continuing.
+     *
+     * Per vcpu_context_saved(), the context can be observed when
+     * v->is_running is false (the caller should check it before calling
+     * this function).
+     *
+     * Note this is a full barrier to also prevent update of the context
+     * to happen before it was observed.
+     */
+    smp_mb();
+}
+
 int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq)
 {
     /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9b4835960d20..e8dbd55ce79e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/tasklet.h>
 #include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
@@ -133,6 +134,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    tasklet_subsys_init();
+
     init_IRQ();
 
     riscv_fill_hwcap();
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index d120274af2fe..2b3eb01bf03c 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
     BUG_ON("unimplemented");
 }
 
-void sync_local_execstate(void)
-{
-    BUG_ON("unimplemented");
-}
-
-void sync_vcpu_execstate(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void startup_cpu_idle_loop(void)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


