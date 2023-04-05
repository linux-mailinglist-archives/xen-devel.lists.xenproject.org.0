Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310426D7979
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518395.804911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Dx-0003cT-UW; Wed, 05 Apr 2023 10:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518395.804911; Wed, 05 Apr 2023 10:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Dx-0003Ym-Qt; Wed, 05 Apr 2023 10:18:41 +0000
Received: by outflank-mailman (input) for mailman id 518395;
 Wed, 05 Apr 2023 10:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Dw-00024X-Nv
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:18:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c165dc3-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:18:40 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so21676991wms.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:18:40 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c7906000000b003ee4e99a8f6sm1696262wme.33.2023.04.05.03.18.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:39 -0700 (PDT)
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
X-Inumbo-ID: 3c165dc3-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
        b=rTu1tRZPqV4LFx/UoOZi2WLzS6khixq6d/WYxFS7eNNn/OYGeFnv0qc3Qcr02VSKxy
         rb660oY/fmNu7J89tEYsSKeFFMuIPWe0bwl6jY9zC3o3nLjl9EKCdNxVkCbBuJ6lm5CH
         gjTz1i3s9XYei/E+itmN9I/+2jlgOY1BBVZJB9fjEYyywfgateusSwusPqpu7NrWhMR0
         GMl837ggRVzo1kt3Z33apYrhv71R+7WptfZnBSbUKuQc75ogJNF4kCG2j8Ggv1YnBRCy
         yVn/ZgcJgjoRbF4Cbyz/wswjzVjQZxiYa1fX9y35/BD8s5WDn2b95Nx3tL6XSawRO0qk
         iJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
        b=48W1T2IaEf288nn7yfly3SGwmytE2z05UcIbVEjvOhBS0U/It01nMMQxkNiLXdRXRn
         X6HieE5DWVJ0ug2s2PqgAK6QzXz1fJarjAqOuj5WOUYf9ASbNMUEuy2NasnmfVTYy0f1
         42Rs0JXpeMyxtkrixDPuspTI6Ezayv68VfYgUa795y/W9Ahflxs2b5cm963dPvSOEyg+
         dJqnGZPQNEqOwy/DuzZ8wPCRhQ2CaqCLwKXOySKq23Gft5zhc39k7M3vCLTPVGudiz1l
         WHVPDzfZzx+AqHEIMZyu/WXi6eFTLEg+3lBIQFJNasK0OOpI7vV6awsti9S99Ud755qy
         A6Xw==
X-Gm-Message-State: AAQBX9fG1/zDNeZ119JRmWPGiH/38FJMyANdCrMbAzULANK4oLfjfBOb
	Xi2X8hwSreW61CXkMm9OSoRWmg==
X-Google-Smtp-Source: AKy350ZDfAFPi7DjfgX/oekuSK5IMwY5EAU6LrxLx1bImlo8Bj5BMxd5ZdtWz6ZThOU3rdF/7XqStA==
X-Received: by 2002:a1c:770e:0:b0:3ed:8780:f27b with SMTP id t14-20020a1c770e000000b003ed8780f27bmr4338493wmi.16.1680689919738;
        Wed, 05 Apr 2023 03:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/14] accel: Destroy HAX vCPU threads once done
Date: Wed,  5 Apr 2023 12:18:01 +0200
Message-Id: <20230405101811.76663-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
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


