Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D14B1435
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 18:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269941.464095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIDE2-0005gk-J2; Thu, 10 Feb 2022 17:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269941.464095; Thu, 10 Feb 2022 17:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIDE2-0005es-FT; Thu, 10 Feb 2022 17:27:22 +0000
Received: by outflank-mailman (input) for mailman id 269941;
 Thu, 10 Feb 2022 17:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kk9V=SZ=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nIDE0-0005em-GW
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 17:27:20 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1e030d6-8a96-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 18:27:18 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id k25so6064689qtp.4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Feb 2022 09:27:18 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254])
 by smtp.gmail.com with ESMTPSA id de43sm9781703qkb.4.2022.02.10.09.27.16
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:27:16 -0800 (PST)
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
X-Inumbo-ID: b1e030d6-8a96-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Px77cD0FejDu6XuNndK0FPvrCK+eDUGXBcpEO5pgJPI=;
        b=DlrBbAIeZ0CUD+nbjiaqZ6oYHEee3N47hOmnqKvGv1PkCECOfVqo6KoMAhluN24VbK
         Fb5scT5xHBDhffaBfpKF16Pgx/7bJuqPfjfF/ehhPsBxZhepelOpTcOFDqYT3dPycT6q
         exUXOLtiLfg3rA8CmGZIWMZjiXwvmq2YnZs93UmupZfdV3MQBamgzGYdJ7Md3Ihcj7gJ
         Rpm0prpXjiQXas8iRQ5U5LYSzRb68iFR6QtMKfobyLGK5AXHreMLLhBQD9bKbb/D0TMV
         SLqpQPvWGL7B9kjRtCGMqCdO5RPTiwnO1WqA+jXqniYJPo1bB7tW+9NduDPil0YexZBN
         3f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=Px77cD0FejDu6XuNndK0FPvrCK+eDUGXBcpEO5pgJPI=;
        b=mL6GmtK3zcmfhGt/6pmVH6sBGD1/lqIpzuJWHhjIM84u+0lI1qnYCz7QjGdRqP932/
         iUyoNd2uxhqPpz9oAKeLlJPryswafU0DQAKSQTx7PVEonaZfmi99FLWKT5AAO/ljdGKs
         5qbvx/AZC4JJ3OJefV913MgYZXYZcCOFweQ03/QnKdJhl2brr1Rl3TY0rjyUjtNajkzW
         cy2AlqpOaDRLKbi84CcP+XKpgAEz2EX7Q7O8PytcPgwmoG4DWEMcGIeSZ6dB0Kij0vAO
         HwZ6e39BomEWDCl1JEpj1MmAg656kF9PkrpRLwOYCcz1m6HxCKAIz9vqNuOfeR8FqKS9
         Vadw==
X-Gm-Message-State: AOAM531t1eJWElXbeypBhWP+vp5Z244/fREYDWS+5G8ZSbyvdW5BH6yN
	cMzEK3Ol4vYEidgv+X3vh04znUf754gMcQ==
X-Google-Smtp-Source: ABdhPJzcHqnBlz+AlHEqOuJWO+6b4zYfnmMaNfsuC9MoBxFlNJwGBuKKjsksUSa00VKuK6Vq3/1gDg==
X-Received: by 2002:a05:622a:349:: with SMTP id r9mr5683472qtw.37.1644514036893;
        Thu, 10 Feb 2022 09:27:16 -0800 (PST)
Message-ID: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
Subject: [RFC] Avoid dom0/HVM performance penalty from MSR access tightening
From: Alex Olson <this.is.a0lson@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 10 Feb 2022 11:27:15 -0600
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I'm seeing strange performance issues under Xen on a Supermicro server with a Xeon D-1541 CPU caused by an MSR-related commit.

Commit 322ec7c89f6640ee2a99d1040b6f786cf04872cf 'x86/pv: disallow access to unknown MSRs'
surprisingly introduces a severe performance penality where dom0 has about 1/8th
the normal CPU performance. Even even when 'xenpm' is used to select the
performance governor and operate the CPU at maximum frequency, actual CPU
performance is still 1/2 of normal (as well as using "cpufreq=xen,performance").

The patch below fixes it but I don't fully understand why.

Basically, when *reads* of MSR_IA32_THERM_CONTROL are blocked, dom0 and
guests (pinned to other CPUs) see the performance issues.

For benchmarking purposes, I built a small C program that runs a "for
loop" 
4Billion iterations and timed its execution. In dom0, the
performance issues
also cause HVM guest startup time to go from 9-10
seconds to almost 80 seconds.

I assumed Xen was managing CPU frequency and thus blocking related MSR
access by dom0 (or any other domain). However,  clearly something else
is happening and I don't understand why.

I initially attempted to copy the same logic as the write MSR case. This
was effective at fixing the dom0 performance issue, but still left other
domains running at 1/2 speed. Hence, the change below has no access control.


If anyone has any insight as to what is really happening, I would be all ears
as I am unsure if the change below is a proper solution.

Thanks

-Alex

---
---
 xen/arch/x86/pv/emul-priv-op.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 7f4279a051..f254479bda 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -970,6 +970,18 @@ static int read_msr(unsigned int reg, uint64_t *val,
         *val = 0;
         return X86EMUL_OKAY;
 
+    /* being unable to read MSR_IA32_THERM_CONTROL seems to significantly affect
+     * dom0 and thus HVM guest startup performance, as well as PVH VMs.
+     */
+    case MSR_IA32_THERM_CONTROL:
+    case MSR_IA32_ENERGY_PERF_BIAS:
+        *val = 0;
+        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+            break;
+        if ( rdmsr_safe(reg, *val) == 0)
+            return X86EMUL_OKAY;
+        break;
+
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
-- 
2.30.2


