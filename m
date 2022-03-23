Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A644E579B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294026.499761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4tB-0004U5-2g; Wed, 23 Mar 2022 17:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294026.499761; Wed, 23 Mar 2022 17:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4tA-0004Rp-VC; Wed, 23 Mar 2022 17:35:16 +0000
Received: by outflank-mailman (input) for mailman id 294026;
 Wed, 23 Mar 2022 17:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4dT-0004Zy-K0
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:19:03 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5561da2e-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:19:02 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id c23so2183651plo.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:19:02 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056a00098f00b004faa58d44eesm455060pfg.145.2022.03.23.10.18.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:01 -0700 (PDT)
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
X-Inumbo-ID: 5561da2e-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0hihgfEmLJPNBEh4WW6rYf49XmgK0ovI41W1a0emuNk=;
        b=MrdYb7945anCfYH1VRiFA5pAW7S4hoZOOF1Pdv+2ZTrCvIPQ0tdNE6NgZGHvIaYl6F
         plkh3wIlaqYoXktAcEAtQmOqlHJdMmidt+Oa/wnRaHYaNMUJZ9CkCSrlqjquwFaZdWSC
         HPnXLzJcabcEufzwkRoVTxfpe1EHQA8+scJQyC9OkHIYWUa2UKWUlEhDYRHbD8EXQtLR
         hGXTs3LTe0tNECvEc0QQ3gavKzuFIBW5V+W6pGyNgy0F8X1RKcixk5n93FXcTecHiIep
         G1WrbmTHafbZqiFIsAW0M4VWI5qRob0xYjL9jnDgfVfth7/f271rS43Pm6WxxiTOI/Ta
         havA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0hihgfEmLJPNBEh4WW6rYf49XmgK0ovI41W1a0emuNk=;
        b=1OfMaxDMPcPasAsY7fbV2TiWVgXCVPfg6D625qP50cS7Yxzu0413ZYLJSLAkHYKOiN
         +h2Y+haFNJeWqgk2NRZpPtA1Sqo+SCjPECnctUuPi2WgxLL2c4LMHYjRqX1/FNjsavTw
         +4HQr3Wm6JCj3DSid5XlvBbvk9+jE+A005PhVLGtyhtfd10d3eJ2nJ9FrocaoH0U3qvf
         lKzPRkjjk1qS9tdpl9MKGNE35PCOvQmGZizcgZkCT6dzQARAdC3NSwi3LdM6tu4rvkF6
         EFmOmretVXFfJYYQ4NwcDPhkfz9ngw+XbH5LVbmKHKqeNTD8RsYKCy/s99+pzI4JXrx0
         N+yQ==
X-Gm-Message-State: AOAM531itduDtQnQVXu3zavZTAypP/HBBC+IdP2e3emVysmw7Fq/D7SG
	r+0ok+S8J5O8KWvQQkrYhwQ=
X-Google-Smtp-Source: ABdhPJwdV5/nAguIIYnMM8I+otidppMXPEnBBQGuuNIH21Igt/CypcRNRBAVG30eApAdY410n71pzg==
X-Received: by 2002:a17:90a:8581:b0:1b2:7541:af6c with SMTP id m1-20020a17090a858100b001b27541af6cmr842235pjn.48.1648055941418;
        Wed, 23 Mar 2022 10:19:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 05/13] accel/tcg: Init TCG cflags in vCPU thread handler
Date: Wed, 23 Mar 2022 18:17:43 +0100
Message-Id: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Move TCG cflags initialization to thread handler.
Remove the duplicated assert checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 5 ++---
 accel/tcg/tcg-accel-ops-rr.c    | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ea2b741deb..80609964a6 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -71,6 +71,8 @@ static void *mttcg_cpu_thread_fn(void *arg)
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
+    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
+
     rcu_register_thread();
     force_rcu.notifier.notify = mttcg_force_rcu;
     force_rcu.cpu = cpu;
@@ -140,9 +142,6 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
-
     cpu->thread = g_new0(QemuThread, 1);
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index b287110766..de8af32af7 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -153,7 +153,9 @@ static void *rr_cpu_thread_fn(void *arg)
     Notifier force_rcu;
     CPUState *cpu = arg;
 
-    assert(tcg_enabled());
+    g_assert(tcg_enabled());
+    tcg_cpu_init_cflags(cpu, false);
+
     rcu_register_thread();
     force_rcu.notify = rr_force_rcu;
     rcu_add_force_rcu_notifier(&force_rcu);
@@ -276,9 +278,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuCond *single_tcg_halt_cond;
     static QemuThread *single_tcg_cpu_thread;
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, false);
-
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_new0(QemuThread, 1);
         cpu->halt_cond = g_new0(QemuCond, 1);
-- 
2.35.1


