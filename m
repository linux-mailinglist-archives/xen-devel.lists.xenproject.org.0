Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B6196B7F
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 08:20:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIRF4-0001B3-Fo; Sun, 29 Mar 2020 06:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NY0J=5O=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIRF2-0001Ay-Vx
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 06:16:17 +0000
X-Inumbo-ID: cbd479d6-7184-11ea-a6c1-bc764e2007e4
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbd479d6-7184-11ea-a6c1-bc764e2007e4;
 Sun, 29 Mar 2020 06:16:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w3so5316281plz.5
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2020 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=txcl7yoqFiQ76QwLBasVd922jNfCuFa56SS2yfvUs2w=;
 b=Guaj5zJFPqkMZgJDpXRq5zJ5n8KAZeA8eO7z1rkNEQQZxiX5vb0ZuiAWhtiWM1xMX7
 ihe7CSBz2oZh+eOGJIau47sQEIeUDfQ/nP2viYmPA+z/bTyPfkYhbVSCY6rp8CWc/UrO
 y6kej4k2uiZ62/CW06r1giOroHiakYWDvSBs+w8gPntOC83q32lXkJaoWhPjl5ofn2zb
 gFizisPp6DkBJOsWmvxnZf9ThhneRxOeOwatV0I/3QmbNapm5fdaWbak2lANQlfoQVHe
 KOudGxNtuVWIsDWZNmbRsa4Bp2IKiK/WTqObHiOyasrX365q8s1utus7pVua+wUytm6w
 WIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=txcl7yoqFiQ76QwLBasVd922jNfCuFa56SS2yfvUs2w=;
 b=YgvguSziKkkE81Eynw6uIcYgc8E1x66E/VpmiXqKw9GvcJV7EThyAMRxHi6YKZaCu2
 FtFnjqpEC3LKOy7EVCk8qOdUgM4tcibp2afm2PPdvGa3sGoVBuheBMHKc9LucpBmLbJp
 MgGoSoBGaWiWMDzeYMidKsDSeqNXHutjaaOr8FzEj74k8Hcd3jHSPggCgle4Hz5rV72V
 aSDlqBrnrW1nuEbd3e4cRsfaRHLzF4ZWS5aj7U9HRVvSBTqS67lWeo8nS/RNB0nZJyNY
 MqbbvQ8KpoKmMOUSx0vNpDaVNDj/rXLjFfftjR5e9LcpEr0uDBuFjJQ1xf762RaTdDxa
 AbAg==
X-Gm-Message-State: ANhLgQ17gY8+PaxOpb3GIuHmvBJDDPcVj51gXawc7L7THoxfc0/yj/Jo
 8yaoT/s77PZf7CywDmSFamU=
X-Google-Smtp-Source: ADFU+vvN6ggdvH94/alkCHshG5evVWblYbN5Ssrp4QxbpNqOKLmcuIUoPpqmedRsM9W+62Znz5hg9w==
X-Received: by 2002:a17:90a:2dc2:: with SMTP id
 q2mr8795756pjm.146.1585462575196; 
 Sat, 28 Mar 2020 23:16:15 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:2ea9:879:e86a:3263:71b5:b71b])
 by smtp.gmail.com with ESMTPSA id
 l18sm3620803pgc.26.2020.03.28.23.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 23:16:14 -0700 (PDT)
Date: Sun, 29 Mar 2020 11:46:08 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200329061608.GA29651@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH] xen/x86: Compress lines for immediate return
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
It also remove variables retval, freq, effective, vector and now
as they are no longer needed.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c     | 9 ++-------
 xen/arch/x86/hvm/mtrr.c                 | 6 ++----
 xen/arch/x86/hvm/vpic.c                 | 5 ++---
 xen/arch/x86/oprofile/op_model_athlon.c | 3 +--
 xen/arch/x86/time.c                     | 5 +----
 5 files changed, 8 insertions(+), 20 deletions(-)

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
index 5c48f868ae..2bc0d04a1f 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -343,9 +343,8 @@ static int athlon_check_ctrs(unsigned int const cpu,
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


