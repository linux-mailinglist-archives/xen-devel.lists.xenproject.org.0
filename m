Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B25197BC6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 14:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jItRo-0002fX-6S; Mon, 30 Mar 2020 12:23:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3hNz=5P=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jItRm-0002fS-SS
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 12:23:18 +0000
X-Inumbo-ID: 3c4bf912-7281-11ea-b58d-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c4bf912-7281-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 12:23:17 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k15so3355993pfh.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2020 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=R+Mvo6YlEZSEXIKSXyFXtHJSEKQK632DZDrO5pcJL88=;
 b=dty1WsQYVo1AJ4mkUnijL7v5+ZWKOz66ci7aCPCxDo6A3ysctmYN8NbjjD1pythGi8
 ptm1pmp8LFvrHGPHnySvmh7JhwRDJcdpIZh3E2Os08ihckP1D7lzt4ToIZTrevKQMd6M
 WIguUgZo+iu29WtYM29n8ClzR1ptqir1ZJkC4NCsO8k2WLe9hOX8TbJQVz7A/0L7VGH0
 B74clDUHTFJaZnOmRuWUdmO3K76TEy2wYVR4QFzLKHiLGl88xJed7eN7U2GmxKNK6cJR
 TetIKs8IcBEWPxx2Rfutxt9GjTSY7zu+H3KzBVouKjm4qEnw7kp4GghCpZlLN4RKcB2q
 Oo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=R+Mvo6YlEZSEXIKSXyFXtHJSEKQK632DZDrO5pcJL88=;
 b=Kl8iQapUdVA5VsQGhXXwdnoS//2c7DW7c++62rwkrt65MgkHpLVlbxycZEw5XGB5KZ
 0lXrMbKkxiGHexf2VR4GfOVOkqrSpCYG7a8B8mr+itwjlAxKG3REGoeLLx4LwwMIM+j+
 +bMA/lvaWNU8FuGn5rk8CnW81RZGDqGdv7Ihk26uk59GR8jQjf+6IkEEWUlZRybCpGXh
 TPiJrHJJzHKCMuMKw/00PytnZ9Qyz9jXwKzKE+rk4tPe/tcfdKjwsBa5YuRM5r9fYP4k
 Mih7CQ/5+T4oshrgu4BMwHjY6yIljedU5XT+dP5F9okTE06VoyWJd6HWK7bOJ1rzADrn
 V//g==
X-Gm-Message-State: ANhLgQ1ydQqfZUtkt1hMrftt3C5w+iblgtSDAQaPvTdzNSS9tYmCT2bx
 bMRUDNElPQn1VJMAvto+8pU=
X-Google-Smtp-Source: ADFU+vunGFf1powzNR1Rm06pzIHd96j30bTGZKN/qbMdJGiUyPT82nWZGh7vwx7zAnTejfxc7Yu/VQ==
X-Received: by 2002:a05:6a00:41:: with SMTP id
 i1mr13146765pfk.275.1585570996986; 
 Mon, 30 Mar 2020 05:23:16 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:200b:c71e:714b:a6a2:c67d:105f])
 by smtp.gmail.com with ESMTPSA id g81sm10083137pfb.188.2020.03.30.05.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 05:23:15 -0700 (PDT)
Date: Mon, 30 Mar 2020 17:53:08 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200330122308.GA10191@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH v2] xen/x86: Compress lines for immediate return
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Compress two lines into a single line if immediate return statement is found.
It also remove variables retval, freq, effective, vector, ovf and now
as they are no longer needed.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
Changes in v2:
        - Remove variable ovf as it is also not needed.

 xen/arch/x86/acpi/cpufreq/cpufreq.c     | 9 ++-------
 xen/arch/x86/hvm/mtrr.c                 | 6 ++----
 xen/arch/x86/hvm/vpic.c                 | 5 ++---
 xen/arch/x86/oprofile/op_model_athlon.c | 5 +----
 xen/arch/x86/time.c                     | 5 +----
 5 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 281be131a3..f1f3c6923f 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -270,7 +270,6 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     struct cpufreq_policy *policy;    
     struct perf_pair readin, cur, *saved;
     unsigned int perf_percent;
-    unsigned int retval;
 
     if (!cpu_online(cpu))
         return 0;
@@ -318,16 +317,13 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     else
         perf_percent = 0;
 
-    retval = policy->cpuinfo.max_freq * perf_percent / 100;
-
-    return retval;
+    return policy->cpuinfo.max_freq * perf_percent / 100;
 }
 
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 {
     struct cpufreq_policy *policy;
     struct acpi_cpufreq_data *data;
-    unsigned int freq;
 
     if (!cpu_online(cpu))
         return 0;
@@ -341,8 +337,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
         data->acpi_data == NULL || data->freq_table == NULL))
         return 0;
 
-    freq = extract_freq(get_cur_val(cpumask_of(cpu)), data);
-    return freq;
+    return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
 static void feature_detect(void *info)
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 8356e8de3d..511c3be1c8 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -317,7 +317,7 @@ static uint8_t effective_mm_type(struct mtrr_state *m,
                                  uint32_t pte_flags,
                                  uint8_t gmtrr_mtype)
 {
-    uint8_t mtrr_mtype, pat_value, effective;
+    uint8_t mtrr_mtype, pat_value;
    
     /* if get_pat_flags() gives a dedicated MTRR type,
      * just use it
@@ -329,9 +329,7 @@ static uint8_t effective_mm_type(struct mtrr_state *m,
 
     pat_value = page_pat_type(pat, pte_flags);
 
-    effective = mm_type_tbl[mtrr_mtype][pat_value];
-
-    return effective;
+    return mm_type_tbl[mtrr_mtype][pat_value];
 }
 
 uint32_t get_pat_flags(struct vcpu *v,
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 4897a0e05b..61f4b6784c 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -484,7 +484,7 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
 
 int vpic_ack_pending_irq(struct vcpu *v)
 {
-    int irq, vector;
+    int irq;
     struct hvm_hw_vpic *vpic = &v->domain->arch.hvm.vpic[0];
 
     ASSERT(has_vpic(v->domain));
@@ -498,8 +498,7 @@ int vpic_ack_pending_irq(struct vcpu *v)
     if ( irq == -1 )
         return -1;
 
-    vector = vpic[irq >> 3].irq_base + (irq & 7);
-    return vector;
+    return vpic[irq >> 3].irq_base + (irq & 7);
 }
 
 /*
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index 5c48f868ae..ee6eb0ecae 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -315,7 +315,6 @@ static int athlon_check_ctrs(unsigned int const cpu,
 {
 	uint64_t msr_content;
 	int i;
-	int ovf = 0;
 	unsigned long eip = regs->rip;
 	int mode = 0;
 	struct vcpu *v = current;
@@ -339,13 +338,11 @@ static int athlon_check_ctrs(unsigned int const cpu,
 		if (CTR_OVERFLOWED(msr_content)) {
 			xenoprof_log_event(current, regs, eip, mode, i);
 			CTR_WRITE(reset_value[i], msrs, i);
-			ovf = 1;
 		}
 	}
 
-	ovf = handle_ibs(mode, regs);
 	/* See op_model_ppro.c */
-	return ovf;
+	return handle_ibs(mode, regs);
 }
 
 static inline void start_ibs(void)
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 2d4430b283..bbaea3aa65 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1142,16 +1142,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
 {
     const struct cpu_time *t = &this_cpu(cpu_time);
     u64 tsc, delta;
-    s_time_t now;
 
     if ( at_tsc )
         tsc = at_tsc;
     else
         tsc = rdtsc_ordered();
     delta = tsc - t->stamp.local_tsc;
-    now = t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
-
-    return now;
+    return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
 }
 
 s_time_t get_s_time()
-- 
2.17.1


