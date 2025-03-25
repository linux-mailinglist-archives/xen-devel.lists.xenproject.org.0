Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B890A6FE6E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 13:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926467.1329310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3mi-000547-32; Tue, 25 Mar 2025 12:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926467.1329310; Tue, 25 Mar 2025 12:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3mi-00051v-0O; Tue, 25 Mar 2025 12:53:36 +0000
Received: by outflank-mailman (input) for mailman id 926467;
 Tue, 25 Mar 2025 12:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx3mg-00051B-Dq
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 12:53:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28659fb5-0978-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 13:53:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso35403005e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 05:53:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeb79sm201290315e9.25.2025.03.25.05.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 05:53:31 -0700 (PDT)
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
X-Inumbo-ID: 28659fb5-0978-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742907212; x=1743512012; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4M2M3fPpC3XGA5w4WkSqlgXfuPFwv3Z2U63mS/wHHbQ=;
        b=Y+Oa1JSndvOkd+gwa3UvlJKjQK/c+ZURPxHkXVr/emSX8XJlj6LHwMZ4ZYnc3jLWyo
         Cj52vXOima0mqjFD17MZGSn6umy6U30L4Nrzw2nLgAKoz172xcmALe/QtXgAuEwoDr8h
         GJbQhcV2VOvgz1gPrJbI52b3WevRyTU4LusoSNvYQJ/ejr7XnztowZJkJsTP4SMi2LMw
         iYNCVHSvDhxwKGdCmAPsZA0BWi7G4TGxOX7WKwNRRbBYKedIcGPTzsPkfYE63H6ijFDW
         5wedQXYOrb9CaShLjVFrjOdyyfOYEnk9aDp9or4GQ4BBlCce34oz75lxIvKbJ3KKeCJ4
         JRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907212; x=1743512012;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4M2M3fPpC3XGA5w4WkSqlgXfuPFwv3Z2U63mS/wHHbQ=;
        b=I/N22qwyX8/ByYqCXbmF8xOp7YFAAjruuXVkTqLNjlLzFv4JKwsE314Xe/adR90jze
         WVb/1njony0yN32E2/ewtojUXxwcfRhuFy6G0fwzVuaTvh+XA9DwkTN3ROU8jJoNuSqg
         h/ywFiEMflg9m0y7Q6g2Swr11itr94G+Cb8PmKss07wRhgwxOYYlSUpsOIRbJbH4EtWg
         +DqdpuS/7sLEf8oI7bys1JBVHNCJ1pRHk88jWpa+SwJxUC9eEJnTZqRZeSMnBQQQFhIq
         TekuoJCLfDUlo+vFHNNBT73Tn3xLeViI54HVMD/L49nQtroOWFlSoMl3KsY/IhnfIroz
         Uhvg==
X-Gm-Message-State: AOJu0Yw2FvGZpS+EnpEiIz0PIfNlo1c3VdAJ8+bIpsA9ZmaSecCQYd/v
	qCVA0bfnAH4Mwtqo/nsRVb6GiUGPnJFHjMDED6gBS43FQb2Od3xKFLKpTiL5KqGx5Gyby0ela30
	=
X-Gm-Gg: ASbGnct+dYHlDePBKWJ9FCC/zVav+w7mrch/QAWRjy3d4aHlAi5QZsvfL2iDgy1cl2A
	8jqFHx9ZdVfvD5bHa+bGe5ypJ+XSVR/W/ZII/35dfGqL3KwYcPLlWpG9quWmskm9K2qdhRtKsDQ
	h/zRzdUD/c+Zh6BcrUsfPksYYvoiaE7/d6yDsjB64zhBmJNIqlyjbHjos31QdAqX1Evs0KeHwEp
	+gZBqPYhXjvMFvhxD/CGJDqjyxSeCMTRQsNIltz8+mG8PyjsRTNek15Eu509MEFJfNa+pdfcYQm
	jSWVF0SLG6M0z8uaOO+xfGfCoAWlamYXmmemil1RUAM8KzefbCeWYAJjFs8vMmPvyWaL7najYQd
	Wf12hmgVvVfXZWU6Ve77qzz+VmpTj7Q==
X-Google-Smtp-Source: AGHT+IGpg8Xf1zfeNspgS2q3ag1+5n+BSDWB7VIfm5eQvFPgvfSqMsxKQRKKrxpIh5U8PMwBo8yMwQ==
X-Received: by 2002:a05:600c:83c4:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43d509eb097mr190408905e9.10.1742907212080;
        Tue, 25 Mar 2025 05:53:32 -0700 (PDT)
Message-ID: <b2f1d0dc-54b0-4520-b4b6-3a1892662e53@suse.com>
Date: Tue, 25 Mar 2025 13:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/pmstat: fold two allocations in get_cpufreq_para()
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's little point in allocation two uint32_t[] arrays separately.
We'll need the bigger of the two anyway, and hence we can use that
bigger one also for transiently storing the smaller number of items.

While there also drop j (we can use i twice) and adjust the type of
the remaining two variables on that line.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -193,11 +193,10 @@ static int get_cpufreq_para(struct xen_s
     const struct processor_pminfo *pmpt;
     struct cpufreq_policy *policy;
     uint32_t gov_num = 0;
-    uint32_t *affected_cpus;
-    uint32_t *scaling_available_frequencies;
+    uint32_t *data;
     char     *scaling_available_governors;
     struct list_head *pos;
-    uint32_t cpu, i, j = 0;
+    unsigned int cpu, i = 0;
 
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
@@ -219,25 +218,22 @@ static int get_cpufreq_para(struct xen_s
         return -EAGAIN;
     }
 
-    if ( !(affected_cpus = xzalloc_array(uint32_t, op->u.get_para.cpu_num)) )
+    if ( !(data = xzalloc_array(uint32_t,
+                                max(op->u.get_para.cpu_num,
+                                    op->u.get_para.freq_num))) )
         return -ENOMEM;
+
     for_each_cpu(cpu, policy->cpus)
-        affected_cpus[j++] = cpu;
+        data[i++] = cpu;
     ret = copy_to_guest(op->u.get_para.affected_cpus,
-                       affected_cpus, op->u.get_para.cpu_num);
-    xfree(affected_cpus);
-    if ( ret )
-        return ret;
+                        data, op->u.get_para.cpu_num);
 
-    if ( !(scaling_available_frequencies =
-           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
-        return -ENOMEM;
     for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        scaling_available_frequencies[i] =
-                        pmpt->perf.states[i].core_frequency * 1000;
+        data[i] = pmpt->perf.states[i].core_frequency * 1000;
     ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                   scaling_available_frequencies, op->u.get_para.freq_num);
-    xfree(scaling_available_frequencies);
+                        data, op->u.get_para.freq_num) ?: ret;
+
+    xfree(data);
     if ( ret )
         return ret;
 

