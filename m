Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EC830251
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668304.1040377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2F1-0001lf-1H; Wed, 17 Jan 2024 09:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668304.1040377; Wed, 17 Jan 2024 09:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2F0-0001jO-Um; Wed, 17 Jan 2024 09:29:46 +0000
Received: by outflank-mailman (input) for mailman id 668304;
 Wed, 17 Jan 2024 09:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2Ez-0001jI-2W
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:29:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d302ba-b51a-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 10:29:42 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3368abe1093so8388664f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:29:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l14-20020adffe8e000000b00336755f15b0sm1196574wrr.68.2024.01.17.01.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:29:41 -0800 (PST)
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
X-Inumbo-ID: f1d302ba-b51a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705483782; x=1706088582; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgV5Q9KvqQ7PhZNunAtTlFJQbxXoBPUKSUdE+lKAOH0=;
        b=JUg9ofi/uUwzLsYNvZcBxGqc/dCXrmwW7TMm5xuU8Xn1tk+6Nwurj7RoP8aG40GvhE
         kJAbUVXC1jaA/zdcFt6oYSUYcFokfDwJGfkrO5AbIo3lWfKPN1sh11o9DMkTlbBgVx4B
         FdtHX18LlFj4Q5vlba+uyqgwsBpZQdlWumW6T8pIJPrnynjOU09PF4ypAL7nusXg2sQL
         AfXILoNoRdWleCaQ6uaqE3XssA+Y20oVX0lgrY4ZDo1X/l3/KWQpurjp1yk/m2lJFCNA
         rPVEPI2haWrVBJtPoxV2ttWN1Qmom5Oy+JRdQe4U1Q/V8PnsImWfNI0Ecyzyj7gRiZZO
         VNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483782; x=1706088582;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgV5Q9KvqQ7PhZNunAtTlFJQbxXoBPUKSUdE+lKAOH0=;
        b=VP4D2/69M/KWVi3EfJ7DZXlJ1yl6JZK0HS8fLSXQ/85jPQF+XjpaUD1orP04/27fV0
         a0of2fpnvN++EW46BVjHo3WTDy60ns1c4VE2VwpU2tYHFtlF9TtmXA2EsUezKEKuMwdd
         yz8mt+zdnmvarZGT9ulDOkEMXJI6lhRRM08UIAhzBhzTabyW14hpYKDuR/FpagJu452n
         oKyAa3OP6zyA/XBrDoA8iILgFL45CbK9Mtr0dAS+OHZMQtDfD1OIUUNQv0+Fwc519JUr
         rtYbB30HvouNJJ9uRZSajezGJQNY+9QZTCBQulS2DA3rLjuBhQP7D6qFC9EsoCL0v3yT
         r0KA==
X-Gm-Message-State: AOJu0YwaITe3KsbBOSCJeukQEqCjO95gl4NMckVjcqa5C87PkfzGAAmC
	OMYOrzFuaWzzaXh7RWgVi61Nb6//lReIWWRn3CFMRnvOQQ==
X-Google-Smtp-Source: AGHT+IFhc0fO/fpLB47nIBBVLLrf8vEqOlxE4zEQMMrqFCKgQJgpoyi6prGhOHmiK0eN4PxIDJzoNA==
X-Received: by 2002:a5d:54c6:0:b0:337:6eac:2cad with SMTP id x6-20020a5d54c6000000b003376eac2cadmr5156252wrv.133.1705483782218;
        Wed, 17 Jan 2024 01:29:42 -0800 (PST)
Message-ID: <3b2842b2-a2fe-49e7-9ea3-4f55cbc95738@suse.com>
Date: Wed, 17 Jan 2024 10:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] core-parking: use alternative_call()
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

This way we can arrange for core_parking_{performance,power}()'s ENDBR
to also be zapped.

For the decision to be taken before the 2nd alternative patching pass,
the initcall needs to become a pre-SMP one, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -30,10 +30,11 @@ static DEFINE_SPINLOCK(accounting_lock);
 static uint32_t cur_idle_nums;
 static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
 
-static const struct cp_policy {
+struct cp_policy {
     char name[30];
     unsigned int (*next)(unsigned int event);
-} *__read_mostly core_parking_policy;
+};
+static struct cp_policy __ro_after_init core_parking_policy;
 
 static enum core_parking_controller {
     POWER_FIRST,
@@ -175,12 +176,13 @@ long cf_check core_parking_helper(void *
     unsigned int cpu;
     int ret = 0;
 
-    if ( !core_parking_policy )
+    if ( !core_parking_policy.next )
         return -EINVAL;
 
     while ( cur_idle_nums < idle_nums )
     {
-        cpu = core_parking_policy->next(CORE_PARKING_INCREMENT);
+        cpu = alternative_call(core_parking_policy.next,
+                               CORE_PARKING_INCREMENT);
         ret = cpu_down(cpu);
         if ( ret )
             return ret;
@@ -193,7 +195,8 @@ long cf_check core_parking_helper(void *
 
     while ( cur_idle_nums > idle_nums )
     {
-        cpu = core_parking_policy->next(CORE_PARKING_DECREMENT);
+        cpu = alternative_call(core_parking_policy.next,
+                               CORE_PARKING_DECREMENT);
         ret = cpu_up(cpu);
         if ( ret )
             return ret;
@@ -239,12 +242,12 @@ uint32_t get_cur_idle_nums(void)
     return cur_idle_nums;
 }
 
-static const struct cp_policy power_first = {
+static const struct cp_policy __initconst_cf_clobber power_first = {
     .name = "power",
     .next = core_parking_power,
 };
 
-static const struct cp_policy performance_first = {
+static const struct cp_policy __initconst_cf_clobber performance_first = {
     .name = "performance",
     .next = core_parking_performance,
 };
@@ -254,7 +257,7 @@ static int __init register_core_parking_
     if ( !policy || !policy->next )
         return -EINVAL;
 
-    core_parking_policy = policy;
+    core_parking_policy = *policy;
     return 0;
 }
 
@@ -269,4 +272,4 @@ static int __init cf_check core_parking_
 
     return ret;
 }
-__initcall(core_parking_init);
+presmp_initcall(core_parking_init);

