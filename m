Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCFAC063D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993103.1376578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lP-0007Bf-Bj; Thu, 22 May 2025 07:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993103.1376578; Thu, 22 May 2025 07:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lP-00076S-6B; Thu, 22 May 2025 07:54:51 +0000
Received: by outflank-mailman (input) for mailman id 993103;
 Thu, 22 May 2025 07:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0lN-0006LU-ME
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:54:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 083f4952-36e2-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:54:47 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4bdee0bf7so238247f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:54:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca5a892sm21774670f8f.24.2025.05.22.00.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:54:46 -0700 (PDT)
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
X-Inumbo-ID: 083f4952-36e2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747900486; x=1748505286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWtufX/fZJTkl4t/yBYN+P8J2qIQZH/xOV2FrRV6Hek=;
        b=N11JkwK+cstNd/PQ/n+Zpa05GWWNOw4jq37pyZcLxwowvRjKW+4y3a9quDdxXg7JFJ
         XoyqPfx8DUfov51sZYpnhNIANam9Axw2Pg2ROXadrtozeVXIFf0DYpIUv9tTiB6V2x5s
         cTV1jXDF95jUN4w0XXduJIn78MgyN9Oy9K6nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900486; x=1748505286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWtufX/fZJTkl4t/yBYN+P8J2qIQZH/xOV2FrRV6Hek=;
        b=B5Xq/1kj2fXHzBUZ6jGGpJ2QVUDmMcpyzQpKfXgotkdcqj5SaHaXSOxrzgvUM8hNSp
         mLkVKJRtlK4zXJzM7AOTknxqFby18mgoOnGkNxFx3d9un1FS5/87AsVBtiyAqLuZVqYW
         Si5OweUkaUwo5yjUTE6If/K+RjwSNjJnZUVC23WxbG2nYGeaqxFrBWFg/Z6qmVN0L5CG
         ijVSYuu1r4S4yGRwYAltZkzjD5yn/lfORAQKCH/3TnQgpk5j8P3NM2/LXUdQZY8Nph/R
         AZX5bBdEOvZobdlVIObbVeAvJGgM5M7ze25tK+0mwZFaOBcmlrDqdx7OM26RLzvBTAvK
         GcEQ==
X-Gm-Message-State: AOJu0YyBQ4/4B5WonlYCDWYVg3oJnX9hDvXdqK0+6K3J6+vPq47C4oyo
	T44zZcjm6PIDw2ObBDfLglntHiopMwA7oqI47Dkh4TXSMxghs9/ZJn4Zy4Psi8QiWMuHu9S4vnS
	Fq3yz
X-Gm-Gg: ASbGncuoIQxRrUMZSwxNOnoXD/5uOwyl0JFJ3GK485SFFA+XH18zN/NXUyKkkR8AV8m
	I1XHUDsCO55SpP2UZoIz8k51l/A5mm2aYFVUsWN161Fn9TdbQnT4b0nm7maf9W3BYUkZQ6MpVX3
	9ho8O8K8abotHmBRdjPBafP3Ozv/KqDXEK1Cgbiqxf6hLjBnEaVBIlVp20cuA/eksukG2CqjfaT
	t57XKha84lWPyQ/q3DAaBJBE59h7u03r8O5jOOw3T8xOC2/LXzasH0uPMjGNvdPEjogmVEM/31b
	4ud5zpvdU2jBIFMCOuOvJ9/HrpzemsoTv22yH6cRXIpj/rWMHcFgi6Mf0YqR7i8Mi+wBocdVISK
	i2ca+uHLs93gmeKxznH13aQcJ7L32QQ==
X-Google-Smtp-Source: AGHT+IEdIbVsdISUuEN4SVsoPfQG2xeQf8EhvNBS7jzQTibsGDg+6/qOpvLZsSWIvjZBCOZv6m8qOg==
X-Received: by 2002:a05:6000:22c7:b0:3a3:6cf9:9b58 with SMTP id ffacd0b85a97d-3a36cf99c63mr12895366f8f.20.1747900486560;
        Thu, 22 May 2025 00:54:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/4] x86/boot: attempt to print trace and panic on AP bring up stall
Date: Thu, 22 May 2025 09:54:40 +0200
Message-ID: <20250522075440.99882-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522075440.99882-1-roger.pau@citrix.com>
References: <20250522075440.99882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the current AP bring up code, Xen can get stuck indefinitely if an AP
freezes during boot after the 'callin' step.  Introduce a 5s timeout while
waiting for APs to finish startup.

On failure of an AP to complete startup, send an NMI to trigger the
printing of a stack backtrace on the stuck AP and panic on the BSP.

This patch was done while investigating the issue caused by Intel erratum
ICX143.  It wasn't helpful in that case, but it's still and improvement
when debugging AP bring up related issues.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use 5s timeout.
 - Print APICID.
 - Split NMI dispatch code movement to a pre-patch.
 - Reorder timeout check condition.
---
 xen/arch/x86/smpboot.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index dbc2f2f1d411..50c5674555e4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1372,6 +1372,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 int __cpu_up(unsigned int cpu)
 {
     int apicid, ret;
+    s_time_t start;
 
     if ( (apicid = x86_cpu_to_apicid[cpu]) == BAD_APICID )
         return -ENODEV;
@@ -1390,10 +1391,17 @@ int __cpu_up(unsigned int cpu)
     time_latch_stamps();
 
     set_cpu_state(CPU_STATE_ONLINE);
+    start = NOW();
     while ( !cpu_online(cpu) )
     {
         cpu_relax();
         process_pending_softirqs();
+        if ( (NOW() - start) > SECONDS(5) )
+        {
+            /* AP is stuck, send NMI and panic. */
+            show_execution_state_nmi(cpumask_of(cpu), true);
+            panic("CPU%u/APICID%u: Stuck while starting up\n", cpu, apicid);
+        }
     }
 
     return 0;
-- 
2.49.0


