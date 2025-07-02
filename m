Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C23AF6233
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 21:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031485.1405332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gy-00079i-CZ; Wed, 02 Jul 2025 19:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031485.1405332; Wed, 02 Jul 2025 19:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gy-000761-8J; Wed, 02 Jul 2025 19:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1031485;
 Wed, 02 Jul 2025 19:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2gw-0004a7-Sh
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 19:00:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd568ecb-5776-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 21:00:21 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso3350675f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 12:00:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e61f48sm16952111f8f.93.2025.07.02.12.00.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 12:00:19 -0700 (PDT)
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
X-Inumbo-ID: cd568ecb-5776-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482821; x=1752087621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpiuwut0yPfLD1eGlX+EYtVIl2/TnFL9WqDtVZoJUMA=;
        b=RaeqcKcF24uNHdIdvtB2Cbvchq227F7vGQu7ggT5yBN+1usVOKfkWu+iouSMpuPq0L
         5yrbWqAj01H1BX676AlWz1UXtXoKpeAPZdprOCblfGcPcfoleGHMSEuldRMWzk8D7LeX
         eiONcfGN/p0mebDgW9cCF6+uMKeWMVB8mrtlzT9SJMEEnjs6NzpiJmxlKApqIBDKRGlw
         NOZME+NYKrtxjC2abZGSwzGmJDmalHV+fcQqfTSMz2yhHHDFXwNKErD8z+MArVpp2146
         vRVoe/IJSrnUkPXVDq9HJZpCYwzVBHhYnQalnqTgJ+cZsre1ip3/U6H5SyzAgAOsjTP0
         wcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482821; x=1752087621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tpiuwut0yPfLD1eGlX+EYtVIl2/TnFL9WqDtVZoJUMA=;
        b=gRvyR0io+M10EZp5a7P6s+wx55IFr2RPYsr2PtTe3fHqCOK2aI6T3jxKppKbcl9KKb
         0DM0z68D5IKVWK3L9cP128zrn8aBomeveYjuuZdTZbXBAe5m4CzP0OHbTTrKW1pq5igX
         RwwoX7SeELCUcg/1XSTJ9CcrrIl+8w1qHLxCd022xuy85f9Ptl1UMZxKlIVevfvCCf4x
         Nyeg6/ngQwLGREWpLoQtD+nW/tSxzE0WTBrSjh5StU1avkp/rXDSVRPevG63JJSkCJl6
         759xcciiaDi2sovocuU0Pi4hzn/pcRGvxp+G+nuO5Wz+qyOYd4quJCw6VBJ+n0VMz3Pr
         JCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdIzNrz8CEZxa2Z2w2/jdsPBP6Qih18shEL9pAbFoW5OMQqw2O6sN2090nX+cEiZj0/h5RW3h3Po=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK3YKQvOn/lEX+OFQNDLX5EEUE9h64wQNUUaiq8TKWVG8dHrhs
	91JjcwQCDoJJBEpYrLSAFEEhl2jB36JdHLLav/HHYV9Ljhs9J8nEoxv4yuaEKqaHEkA=
X-Gm-Gg: ASbGncsXuJW5vAOTK/hIUbRLhguD3mvqeshysHninOkk8kORMinzRDcB6wXjO9p9KoX
	YjT4E9IHZMMPVQqDdxHf8O1fbRHaxbdwzXY5JV1F6/436gKNc8gAlIrVtLVyK87zj5UWXD9Wh1e
	VVbHE33jYuwXA8aa8LPPGKWHYYd9DEB01qSGJZAwz6MHqvuLMpJ/JUeCSmal0J4T40tw/8v8eRX
	r+fItl2Tz5l4FnQVVE46xCJI/2XhewFCTnYz+I0kZAfL11kFuWpxyE+DWjwHYiPMz9vrwjmWvSU
	a0GMIF7EtjBtqpsRQOIq/489nsjK5FBsM6R/SCCrPWuYbDccLDd2kGw10C7JHv6m1e112DicDfB
	fyYBbKQYseatzkx3qbiIYP+4iLBi1BEBMal+V
X-Google-Smtp-Source: AGHT+IF4lYebmXSJDkkpbBSrLVcnunRXwUEzJB3h3bw75jfnHK3g6xjQIPKWwyLiIUvuXZNP2uw57w==
X-Received: by 2002:a05:6000:1886:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3b1fd74c4b7mr3684763f8f.1.1751482820568;
        Wed, 02 Jul 2025 12:00:20 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 59/65] accel: Always register AccelOpsClass::get_virtual_clock() handler
Date: Wed,  2 Jul 2025 20:53:21 +0200
Message-ID: <20250702185332.43650-60-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::get_virtual_clock(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::get_virtual_clock() mandatory.
Register the default cpus_kick_thread() for each accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/accel-ops.h        | 2 ++
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/tcg/tcg-accel-ops.c         | 2 ++
 accel/xen/xen-all.c               | 1 +
 system/cpus.c                     | 7 ++++---
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 8 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 8683cd37716..d5154acc75a 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -82,6 +82,8 @@ struct AccelOpsClass {
      * fetch time. The set function is needed if the accelerator wants
      * to track the changes to time as the timer is warped through
      * various timer events.
+     *
+     * get_virtual_clock() is mandatory.
      */
     int64_t (*get_virtual_clock)(void);
     void (*set_virtual_clock)(int64_t time);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 17776e700eb..cf623a1ea47 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -369,6 +369,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->update_guest_debug = hvf_update_guest_debug;
 
     ops->get_elapsed_ticks = cpu_get_ticks;
+    ops->get_virtual_clock = cpu_get_clock;
     ops->get_vcpu_stats = hvf_get_vcpu_stats;
 };
 
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index f27228d4cd9..dde498e0626 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -97,6 +97,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
 #endif
 
     ops->get_elapsed_ticks = cpu_get_ticks;
+    ops->get_virtual_clock = cpu_get_clock;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index f22f5d73abe..780e9debbc4 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -207,6 +207,7 @@ static void tcg_accel_ops_init(AccelClass *ac)
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
         ops->get_elapsed_ticks = cpu_get_ticks;
+        ops->get_virtual_clock = cpu_get_clock;
     } else {
         ops->create_vcpu_thread = rr_start_vcpu_thread;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
@@ -217,6 +218,7 @@ static void tcg_accel_ops_init(AccelClass *ac)
             ops->get_elapsed_ticks = icount_get;
         } else {
             ops->handle_interrupt = tcg_handle_interrupt;
+            ops->get_virtual_clock = cpu_get_clock;
             ops->get_elapsed_ticks = cpu_get_ticks;
         }
     }
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 48d458bc4c7..85fb9d1606c 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -158,6 +158,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->kick_vcpu_thread = cpus_kick_thread;
     ops->handle_interrupt = generic_handle_interrupt;
     ops->get_elapsed_ticks = cpu_get_ticks;
+    ops->get_virtual_clock = cpu_get_clock;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/system/cpus.c b/system/cpus.c
index d32b89ecf7b..6c99756346a 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -216,10 +216,10 @@ int64_t cpus_get_virtual_clock(void)
      *
      * XXX
      */
-    if (cpus_accel && cpus_accel->get_virtual_clock) {
-        return cpus_accel->get_virtual_clock();
+    if (!cpus_accel) {
+        return cpu_get_clock();
     }
-    return cpu_get_clock();
+    return cpus_accel->get_virtual_clock();
 }
 
 /*
@@ -666,6 +666,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
     assert(ops->kick_vcpu_thread);
     assert(ops->handle_interrupt);
     assert(ops->get_elapsed_ticks);
+    assert(ops->get_virtual_clock);
     cpus_accel = ops;
 }
 
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index 4deff57471c..a2e84cb087a 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -86,6 +86,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
 
     ops->get_elapsed_ticks = cpu_get_ticks;
+    ops->get_virtual_clock = cpu_get_clock;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index f47033a502c..d27e89dd9c5 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -89,6 +89,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
 
     ops->get_elapsed_ticks = cpu_get_ticks;
+    ops->get_virtual_clock = cpu_get_clock;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
-- 
2.49.0


