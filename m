Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F3C53323
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160208.1488412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDA4-0008MY-A9; Wed, 12 Nov 2025 15:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160208.1488412; Wed, 12 Nov 2025 15:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDA4-0008Jr-6r; Wed, 12 Nov 2025 15:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1160208;
 Wed, 12 Nov 2025 15:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJDA2-0008IB-17
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:53:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb58f16c-bfdf-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:53:29 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so214745166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:53:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa24d14sm1621914266b.74.2025.11.12.07.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:53:28 -0800 (PST)
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
X-Inumbo-ID: bb58f16c-bfdf-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762962808; x=1763567608; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOudpYJ0be8RTqnBRUMnFbqtoyMnoVQ+VmxJe0HQzyw=;
        b=QDUhNBKo2SnYsfffGBV17gJh0CXkuHbVIrhcQTb1oR2CD9TCyrbgHb2fuljkv4ft8v
         psbeV9OuiUJkC+6c23+vvOesE24DVsUJSwum6IWZq3B16xTIn1H1eeytTRgCJnFJvpAZ
         2i/k6q7+Mzv68+CLTwRyCjc7Hm2CEavEe8SHRuJPsWZdZvYOXl76REGK1WV5RprbeWEy
         9H3G7vU5lHmtYcx2jHGApRIkOYFSVuA9lL4qrpBoRRYKD8Ruui2xh5nzZAqjG2ZwMPid
         9+noGpY+6VrMOZxHZ+CAo4xBOs9Pg1m4+UISZCpxT6NlZzbohlvNto0B5XcBYBv5Cmxl
         VGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962808; x=1763567608;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOudpYJ0be8RTqnBRUMnFbqtoyMnoVQ+VmxJe0HQzyw=;
        b=cb6EFoEA/EZcvBDksLq6LnabmQ+NnYpx9dTa9G2kpLvv3IIANYItbEW+msrePDHRkl
         wZR93vwsKaLqg7wyLMY/6x3JcKGkADc4PbFXb3v1kBiQamYZNRtRL4susABxIdScMLZ9
         m5qp8KL1H/qZbtxtvNVoedEiTJk0uQtgYjlWZjPGIpSp3zeR+Rt32nImF5sX59Lsh2dD
         93BeGf7wnLL79jv6Pz75CS1ZuPXxNIPOvX3H+SeqghA9TiFOmgfMnp6+gwWu+7tqlWx+
         9frT2pBjoP8BL/aoNWM8DVL01YQn6pxvL6k6775J1P88hCnoaWkUW0ngCEYVTQWi0kIB
         RMJQ==
X-Gm-Message-State: AOJu0YywXalQAW3oHBp4vMOqARQbzINiKh8sv4RWFxw41r8ySHJxlQqk
	ezx5GfxTjwXIfdenaUkUXXL+nik3kNimDjdhdY9zrX3v4AhQ4Gr80AXgyt707kQIyknwLbj8NlF
	vbRE=
X-Gm-Gg: ASbGncufssSSbdSTVAJYLXZDJVVcj9v7xHcOz7WN5ZLY7uf7EAKAoxKe0fxyXXbCx68
	Xbu5vdJJH7JQY10V4LYFU4Q6XX5UCBWcuT5kozsMkVHeCOpU2B7KZEt3pb2qtVd8mlrrMK/JLhq
	cd0Fjuamuh/3HN4YiMtWb5hxtHO+HoWuG1lEp21mDd5QbCI+909HORqV/WDn1mNvUK1BcF0truv
	Bj2I7LckAXyL4LsTPMdLCP112CWuA9NywwWrH7t/2qJsC5rjAz29EZnSXCvhKb/yGkN2anFPJ2H
	R1Pkvj/pV7Xj9diABQSx897UGtqxwRlKxMtUH6ZDLYQ+zk67sqhALAMTwZM9MWbki+QJi9XNkyu
	vaEClkAykccPYTmNhyPBFoRehgBIgDpI4Ze3a6XSdcQTRKtPChhq9f3YzuvbxC3eVBpWDhyoseY
	AMZHmeftWBeHxEMiHeFXXZHOrXTlHqpWjcqbnvR948luf5NW4gXh7Acie39O2TtzF7
X-Google-Smtp-Source: AGHT+IGbGh7VwnZnQmbew8JbA8pjvk/p73SWu+ElvrhjxV2WJlQOkvbwKDDs7QnvcMSUQm/+v8rjnA==
X-Received: by 2002:a17:906:6a1b:b0:b70:b077:b94b with SMTP id a640c23a62f3a-b7331aa33a8mr318563266b.43.1762962808422;
        Wed, 12 Nov 2025 07:53:28 -0800 (PST)
Message-ID: <fe35f075-ff44-4942-bcd1-dcd917179867@suse.com>
Date: Wed, 12 Nov 2025 16:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] CPU: abstract read-mostly-ness for per-CPU cpumask_var_t
 variables
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

cpumask_var_t can resolve to a pointer or to an array. While the pointer
typically is allocated once for a CPU and then only read (i.e. wants to be
marked read-mostly), the same isn't necessarily true for the array case.
There things depend on how the variable is actually used. cpu_core_mask
and cpu_sibling_mask (which all architectures have inherited from x86,
which in turn is possibly wrong) are altered only as CPUs are brought up
or down, so may remain uniformly read-mostly. Other (x86-only) instances
want to change, to avoid disturbing adjacent read-mostly data.

While doing the x86 adjustment, also do one in the opposite direction,
i.e. where there was no read-mostly annotation when it is applicable in
the "pointer" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really in the pointer case it would be nice if the allocations could then
also come from "read-mostly" space.

--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -20,7 +20,7 @@
 static DEFINE_PER_CPU_READ_MOSTLY(u32, cpu_2_logical_apicid);
 static DEFINE_PER_CPU_READ_MOSTLY(cpumask_t *, cluster_cpus);
 static cpumask_t *cluster_cpus_spare;
-static DEFINE_PER_CPU(cpumask_var_t, scratch_mask);
+static DEFINE_PER_CPU_CPUMASK_VAR(scratch_mask);
 
 static inline u32 x2apic_cluster(unsigned int cpu)
 {
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -52,13 +52,13 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
 /* representing HT and core siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
 
-DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, scratch_cpumask);
+DEFINE_PER_CPU_CPUMASK_VAR(scratch_cpumask);
 static cpumask_t scratch_cpu0mask;
 
-DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, hpet_scratch_cpumask);
+DEFINE_PER_CPU_CPUMASK_VAR(hpet_scratch_cpumask);
 static cpumask_t hpet_scratch_cpu0mask;
 
-DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, send_ipi_cpumask);
+DEFINE_PER_CPU_CPUMASK_VAR(send_ipi_cpumask);
 static cpumask_t send_ipi_cpu0mask;
 
 DEFINE_PER_CPU_READ_MOSTLY(struct stubs, stubs);
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -311,6 +311,9 @@ extern const cpumask_t cpumask_all;
 
 typedef cpumask_t *cpumask_var_t;
 
+#define DEFINE_PER_CPU_CPUMASK_VAR(sym) \
+	DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, sym)
+
 static inline bool alloc_cpumask_var(cpumask_var_t *mask)
 {
 	*mask = _xmalloc(nr_cpumask_bits / 8, sizeof(long));
@@ -349,6 +352,9 @@ static inline void free_cpumask_var(cpum
 #else
 typedef cpumask_t cpumask_var_t[1];
 
+#define DEFINE_PER_CPU_CPUMASK_VAR(sym) \
+	DEFINE_PER_CPU(cpumask_var_t, sym)
+
 static inline bool alloc_cpumask_var(cpumask_var_t *mask)
 {
 	return true;

