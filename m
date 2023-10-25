Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D37D7457
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623207.970945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjaB-0006HL-Pq; Wed, 25 Oct 2023 19:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623207.970945; Wed, 25 Oct 2023 19:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjaA-0005tr-Da; Wed, 25 Oct 2023 19:30:22 +0000
Received: by outflank-mailman (input) for mailman id 623207;
 Wed, 25 Oct 2023 19:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja4-0000YO-As
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec85bd75-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:15 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so20702866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:15 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:14 -0700 (PDT)
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
X-Inumbo-ID: ec85bd75-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262215; x=1698867015; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zycp1bHlrzodfdOe+CAlIL8xTOpfZ5SI6NbqB9xJUcQ=;
        b=YwTp7VblVMOlCCpT5HzVRYTSz7IHe227p05A+xA4uGz0eoR6gSAzz+2BqV+OgitLue
         qfG6AEWxUy07xosvy4ojjCIOcl8AxPSdlKZBYeLpR2YROGhwuHZMGLaRX+OJkueBApMB
         CRaXIR22BCmA07sE8a2ZFyoUFaqzS82Yi82k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262215; x=1698867015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zycp1bHlrzodfdOe+CAlIL8xTOpfZ5SI6NbqB9xJUcQ=;
        b=dj/9zSEXJBhw681DKPlxJEL7zpcsRYQgbSsdV/Dqoq0v2q2Loa5kXB3/P9qKbVmD1R
         lrVr/be9bKMjdpBHdfYtsMECyNgJ8uq+AE1VxqPo7nEHlNrX9Cm53Kv6hw3BQQAyNSon
         Iw+7RXpMX/NZRGgQQGiae9O/vYEuGpy5X4aLaZUsJOojsWfzVn6OcoJWi+SuE0FHcxsd
         Bs6vQ0JnUemEQB57mO6Su9HIY0WQfM4G49Q4Vq3mU3SwUkxM0Jj/IIIIEIiV5AVa0tij
         n98x9o6fQ6NdNXMTsh1KXuuUdpWTRV9ei1TfzIeCZzv7vywEpGUisYfPzan0N0qE+i3X
         Aihw==
X-Gm-Message-State: AOJu0Ywr0ZADswg0sAXw5HtgtFcZu1Nuf1sE/W0OVKt1g7H0qlQTA4ud
	3mh6rmVusGpDozuNhqh3L78aGXaeSNonhZ7k/xvwHQ==
X-Google-Smtp-Source: AGHT+IEzN5FXTuOzD8uMuYRrOJ7KU5L8PcbtVzzNvjc7IoBpIn6ESNEPx5NCJxJvJKQYw7XaoPAi8Q==
X-Received: by 2002:a17:906:34d1:b0:9c9:44aa:7dcd with SMTP id h17-20020a17090634d100b009c944aa7dcdmr7770153ejb.33.1698262215191;
        Wed, 25 Oct 2023 12:30:15 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 21/22] x86/AMD: fix CPUID for PerfCtr{4,5}
Date: Wed, 25 Oct 2023 20:29:51 +0100
Message-Id: <29b4fbb1045bb7cb49facfe2bc3e470fd74234bf.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

These are available, but were hidden by CPUID previously.

There are IR (all guests), NB and L2I (dom0 only) performance counters too
that need to be implemented, add placeholder entries for them.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu-policy.c                   | 14 +++++++++++---
 xen/arch/x86/hvm/svm/svm.c                  |  1 +
 xen/arch/x86/pv/emul-priv-op.c              |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index e38b648f7d..4242a21e1d 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -340,9 +340,16 @@ static void recalculate_misc(struct cpu_policy *p)
         p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
         p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
         p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
-        break;
-    }
-}
+
+        /* These are not implemented yet, hide from CPUID.
+         * When they become implemented, make them available when full vpmu is on */
+        p->extd.irperf = 0;
+        p->extd.perfctrextnb = 0;
+        p->extd.perfctrextl2i = 0;
+
+         break;
+     }
+ }
 
 void calculate_raw_cpu_policy(void)
 {
@@ -391,6 +398,7 @@ static void __init calculate_host_policy(void)
     if ( vpmu_mode == XENPMU_MODE_OFF ) {
         p->basic.raw[0xa] = EMPTY_LEAF;
         p->basic.pdcm = 0;
+        p->extd.perfctrextcore = 0;
     }
 
     if ( p->extd.svm )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 45f8e1ffd1..ecb6184f51 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1905,6 +1905,7 @@ static int cf_check svm_msr_read_intercept(
     case MSR_AMD_FAM15H_EVNTSEL3:
     case MSR_AMD_FAM15H_EVNTSEL4:
     case MSR_AMD_FAM15H_EVNTSEL5:
+    /* TODO: IRPerfCnt, L2I_* and NB_* support */
         if ( vpmu_do_rdmsr(msr, msr_content) )
             goto gpf;
         break;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 105485bb1e..8d802b5df0 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1156,6 +1156,7 @@ static int cf_check write_msr(
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
+            /* fall-through */
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
             if ( vpmu_msr || (boot_cpu_data.x86_vendor &
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0aa3251397..5faca0bf7a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -166,7 +166,10 @@ XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
 XEN_CPUFEATURE(NODEID_MSR,    3*32+19) /*   NodeId MSR */
 XEN_CPUFEATURE(TBM,           3*32+21) /*A  trailing bit manipulations */
 XEN_CPUFEATURE(TOPOEXT,       3*32+22) /*   topology extensions CPUID leafs */
+XEN_CPUFEATURE(PERFCTREXTCORE, 3*32+23) /*A! Extended core performance event-select registers */
+XEN_CPUFEATURE(PERFCTREXTNB,  3*32+24) /*   Extended Northbridge performance counters */
 XEN_CPUFEATURE(DBEXT,         3*32+26) /*A  data breakpoint extension */
+XEN_CPUFEATURE(PERFCTREXTL2I, 3*32+28) /*   Extended L2 cache performance counters */
 XEN_CPUFEATURE(MONITORX,      3*32+29) /*   MONITOR extension (MONITORX/MWAITX) */
 
 /* Intel-defined CPU features, CPUID level 0x0000000D:1.eax, word 4 */
@@ -238,6 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
 
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
+XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
-- 
2.41.0


