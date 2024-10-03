Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B498F14B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809503.1221857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMhN-0005cQ-Lh; Thu, 03 Oct 2024 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809503.1221857; Thu, 03 Oct 2024 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMhN-0005a5-IX; Thu, 03 Oct 2024 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 809503;
 Thu, 03 Oct 2024 14:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwa6=Q7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swMhL-0005Zz-Es
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:20:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2708b43-8192-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:20:53 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37cdac05af9so1049164f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:20:53 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082a6c3asm1370764f8f.69.2024.10.03.07.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:20:51 -0700 (PDT)
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
X-Inumbo-ID: b2708b43-8192-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727965252; x=1728570052; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Iubt4LVeJnWXXUPp+yr5ntgHtX5098yOqc7fyRXQc4=;
        b=fmHrNgJHQqYzB19riFqWeQpLgYABoYz81gDRL3JvGqJGaIDuPG0yHNprzc1n1c3xdA
         mGySFxnOI3jh6KOtnwKrkng3Vcq5ik5gk39s80DXcBKO3f1YeNPG8jIVaR3YpRVhVkRo
         n0gXstWYuWibWmZHpP+4Tr1sbQ4nZhqHFfGek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965252; x=1728570052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Iubt4LVeJnWXXUPp+yr5ntgHtX5098yOqc7fyRXQc4=;
        b=liM8u/z5SIDUrdXIvsUIdCX/tIjMwf2KOGXBdg3CCdmAS9wLzqDDu+AC2dxIBSP9ys
         xJPp0FzsAWjtrCH9M2Cd6/yAYzFPMVVn+hjrHCvWmDvHRo4VVbGZ1qyFnOI4SXFeTtIN
         EWf+JxnrSbpzFSenaOkgDHys01iOPC9j4R8kKve59IhqieU1ua0DeO5931TK90CeHKN6
         LQz0J0hZjxydZVbAdcLCo86IPMvRkHm9rJ7W5M7fQFFMhWE3HxiLQoPO4EyamjUZ8QXS
         o/389W4/pnggXzjkKhC+RqgnjKRXwHKgD8R07clEhHNA+PrRhqg94DUcwFu02Snf3Qlx
         v19Q==
X-Gm-Message-State: AOJu0YxZ2g63ZfkxAZ6dNm4s3+taZQWmsheaMk2rrZrpZzfTz4Gv/vF8
	flHJs4EkL5Kd3hpulVZXK4aatXzGoP+iVkXgQsM24O+OE5SufbB7ZlHu/g+i95NanOHGcqCEeEk
	2
X-Google-Smtp-Source: AGHT+IHleqqD344+K3yvBg0FYlef2zBT0I4JQAxP2yuYsqbVYPgZkoNh9vTwYHZybHQKfqaR5EnJ3A==
X-Received: by 2002:a5d:6612:0:b0:37c:f35c:1634 with SMTP id ffacd0b85a97d-37cfb9d321emr4828122f8f.26.1727965252296;
        Thu, 03 Oct 2024 07:20:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/dpci: do not leak pending interrupts on CPU offline
Date: Thu,  3 Oct 2024 16:20:36 +0200
Message-ID: <20241003142036.43287-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current dpci logic relies on a softirq being executed as a side effect of
the cpu_notifier_call_chain() call in the code path that offlines the target
CPU.  However the call to cpu_notifier_call_chain() won't trigger any softirq
processing, and even if it did, such processing should be done after all
interrupts have been migrated off the current CPU, otherwise new pending dpci
interrupts could still appear.

Current ASSERT in the cpu callback notifier is fairly easy to trigger by doing
CPU offline from a PVH dom0.

Solve this by instead moving out any dpci interrupts pending processing once
the CPU is dead.  This might introduce more latency than attempting to drain
before the CPU is put offline, but it's less complex, and CPU online/offline is
not a common action.  Any extra introduced latency should be tolerable.

Fixes: f6dd295381f4 ('dpci: replace tasklet with softirq')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/hvm.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index d3627e4af71b..f5faff7a499a 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1105,23 +1105,27 @@ static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
+    unsigned long flags;
 
     switch ( action )
     {
     case CPU_UP_PREPARE:
         INIT_LIST_HEAD(&per_cpu(dpci_list, cpu));
         break;
+
     case CPU_UP_CANCELED:
-    case CPU_DEAD:
-        /*
-         * On CPU_DYING this callback is called (on the CPU that is dying)
-         * with an possible HVM_DPIC_SOFTIRQ pending - at which point we can
-         * clear out any outstanding domains (by the virtue of the idle loop
-         * calling the softirq later). In CPU_DEAD case the CPU is deaf and
-         * there are no pending softirqs for us to handle so we can chill.
-         */
         ASSERT(list_empty(&per_cpu(dpci_list, cpu)));
         break;
+
+    case CPU_DEAD:
+        if ( list_empty(&per_cpu(dpci_list, cpu)) )
+            break;
+        /* Take whatever dpci interrupts are pending on the dead CPU. */
+        local_irq_save(flags);
+        list_splice_init(&per_cpu(dpci_list, cpu), &this_cpu(dpci_list));
+        local_irq_restore(flags);
+        raise_softirq(HVM_DPCI_SOFTIRQ);
+        break;
     }
 
     return NOTIFY_DONE;
-- 
2.46.0


