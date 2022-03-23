Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE94E578E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294015.499741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rv-0002zp-AP; Wed, 23 Mar 2022 17:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294015.499741; Wed, 23 Mar 2022 17:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rv-0002wB-45; Wed, 23 Mar 2022 17:33:59 +0000
Received: by outflank-mailman (input) for mailman id 294015;
 Wed, 23 Mar 2022 17:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4dr-0004Zy-E8
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:19:27 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 639b15f3-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:19:26 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id u17so1963987pfk.11
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:19:26 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 a24-20020a637f18000000b003821e17819csm354438pgd.61.2022.03.23.10.19.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:24 -0700 (PDT)
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
X-Inumbo-ID: 639b15f3-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qDaNpZGuS1pck7ljrYFEMbUPV6qyv4FTweWO+b6dthQ=;
        b=T/qLqQeIJbWYsc9iaC9cBJMrxMVXpFG/QUiJyPoZd2LdVpzgu4IXrjsjtgh7JucAvy
         K7XpwsgzEr4aysFsdfXZmw3r4NYiJ3DWcc8JZSOA6Tl3BokPzJQNj2so5OQV1hh6HwEd
         K1QxKLSW49T2dyO8ay7JL+g882pp7zrdo93r7w/Lf9Ytie2vCQEYjBetUSMwG2E36vDl
         O1T8FHb+t6UP2pO29Px3c/CN3Z5Qpup501aDNB/0R3S7yzRNJBBBqU6RsNi2V43JnUir
         +2yzv/A6XJFzT3jeRvNmug8zR6Gv0G3QKmEJL2xM7jyr2axrPlstTpbbBI6cVPxAa6d7
         uTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qDaNpZGuS1pck7ljrYFEMbUPV6qyv4FTweWO+b6dthQ=;
        b=wp2rxRnMbJRes1RM7Hq5I1eNTJ4aGEiMsNJlYoAiQ7bZbMe3lOZ7vr5vQNyNusJMLQ
         7klhajUDgZHKsPsgeiRxah2Rbc/Oe6JebIJqE6vGiifbPcA5oXeic5W9udJuOW4dkTdy
         MasP9ha1TqXBcRayTGxpXE8b5/7/Tkfm4FeUqZI5fysgt2pM5zg0BhBUUDUO7Yh2iclE
         G67aXQnGMI5J4OSLBJxLHdJh+5sd/YyZF3wZKbjJjy8yeCHgUOp+FM5qHe97fsTAJZrI
         3eL9/0Eyi003bWEOd5dSeIAR874vaGeFeXehg6EV7L36QBSKHZ3bRWvKiLBuoVfUsaBi
         NgBQ==
X-Gm-Message-State: AOAM530QHjQiYOnPXAzYIi5ejLX19J0W43QZjWeqqiFWHYx+bQZy92vi
	iCJOSxuF7UeLqSW1F/A5Ghw=
X-Google-Smtp-Source: ABdhPJysELA1SacEi6NLWr6VDuEztyIdr+gkkW330J+PSAAiBOd3a1EdmuP7lIO3WbruDTaR69cscQ==
X-Received: by 2002:a63:cf09:0:b0:372:d564:8024 with SMTP id j9-20020a63cf09000000b00372d5648024mr705074pgg.251.1648055965298;
        Wed, 23 Mar 2022 10:19:25 -0700 (PDT)
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
Subject: [PATCH v4 07/13] accel-ops: Introduce create_vcpu_thread_precheck / postcheck handlers
Date: Wed, 23 Mar 2022 18:17:45 +0100
Message-Id: <20220323171751.78612-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce precheck/postcheck handlers which will help to
refactor code common to the various create_vcpu_thread()
implementations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 4 ++++
 softmmu/cpus.c             | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 6013c9444c..26b542d35c 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,10 @@ struct AccelOpsClass {
     bool (*cpus_are_resettable)(void);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    /* If non-NULL, return whether common vCPU thread must be created */
+    bool (*create_vcpu_thread_precheck)(CPUState *cpu);
+    void (*create_vcpu_thread_postcheck)(CPUState *cpu);
+
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7b75bb66d5..857e2081ba 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -637,7 +637,13 @@ void qemu_init_vcpu(CPUState *cpu)
 
     /* accelerators all implement the AccelOpsClass */
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
-    cpus_accel->create_vcpu_thread(cpu);
+    if (cpus_accel->create_vcpu_thread_precheck == NULL
+            || cpus_accel->create_vcpu_thread_precheck(cpu)) {
+        cpus_accel->create_vcpu_thread(cpu);
+    }
+    if (cpus_accel->create_vcpu_thread_postcheck) {
+        cpus_accel->create_vcpu_thread_postcheck(cpu);
+    }
 
     while (!cpu->created) {
         qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
-- 
2.35.1


