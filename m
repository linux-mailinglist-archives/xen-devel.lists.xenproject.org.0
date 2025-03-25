Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CEDA6FE34
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 13:51:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926455.1329300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3l0-0004R3-Jf; Tue, 25 Mar 2025 12:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926455.1329300; Tue, 25 Mar 2025 12:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3l0-0004Od-Gl; Tue, 25 Mar 2025 12:51:50 +0000
Received: by outflank-mailman (input) for mailman id 926455;
 Tue, 25 Mar 2025 12:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx3kz-0004OR-FT
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 12:51:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e936d76b-0977-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 13:51:47 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3300865f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 05:51:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f36sm13946521f8f.32.2025.03.25.05.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 05:51:45 -0700 (PDT)
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
X-Inumbo-ID: e936d76b-0977-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742907106; x=1743511906; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UI6kyWj0JfKs1+sNfG/JkSIh/aJ8nF8v50j99RHjYU=;
        b=DNFlB86VefGTE3x1sk2Am8rl1jaAAkJk/ktAuI1nL6SHWxb0/qfOkEmPTuOULVSQqI
         Mq/Q2+CFg9ID7lz/TUsTpVI33uEohxpLfs/CL/FR+GZDLLZi4gUvbfj9N7us3U3N8euT
         /FNdSSazLX7ACdJYd6SJlBNASrNYkUFG4ia0GJo7tg8FHIRgbpgfdaPDy2R7FDdsIkPC
         6EfdDH4d/tCMM19f8P006bEuAHsElFPH6tjW36cc5NKkE8VF/riB2P9ntSuvr2rwCkhF
         G4yVh3le355V20zIvLCEX8VmiTGpLr7ZoiF0YHYzqiUpA2YYdGw9Ei5gCQYnykBQGHh0
         YeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907106; x=1743511906;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UI6kyWj0JfKs1+sNfG/JkSIh/aJ8nF8v50j99RHjYU=;
        b=N0NVDi7TpkU78tKxA0nxIjnLLuMz8de5koy8ZRtLH4xn9EwjPNQp6+atxvtSU+VYS8
         MlQCgItV0mSHnC39cQeiVcTLMn3HyizuW+YJy/wR/D2lurBLTwonr06u4rjrT35YMiJu
         Ryo/F3Osh9TFfnhYUNFR/GZG78NGQRyZZv8zb/uktwQCPp0JJDiXtXtN8/MLHTLmceOe
         XG19bTHz4ieOykB+b5K8ds6si6VK0aMat8oZimOktV8SQGCBOwqaBkBzrUTHKGjbCOIj
         W8Kucdc69uFdq0xqfInWow83+CPdvh7Zlq0dQd+DDJIUsAtDumL/gbZXI553AMWNdSVv
         2JLQ==
X-Gm-Message-State: AOJu0Yy5YHX3g+3gfDfFzUukfHBZWXL0dIvHO7/UzkRK92rwfD/MpxWf
	BcVwnaF5lLHOHRqfsSBD2/ADIfSjcad8oREGXWTaXUQqk26Hr2b/4uzIBa8VFvr1s8UZn+JOCYI
	=
X-Gm-Gg: ASbGncsgg01xzFyjZXveBcU7NzhQLE/5OV6itbTC6DNOz9HtKG6zVKjI6Lixe4tbS8a
	QCAxl8A2aIm3u1YyWw5HOvEVZC//m/5EZfYUy3SN8qhwaQJQ5l2GdEe++84r8vJz40RF35C7EBy
	w+5u+3HEWLgilDQ/je6FNGsTGF2bQZ8N2CeKj8SWo0VyZNWaktsculWN4hgwj+yMzSZYoH2BMYh
	pCqc7Dr4x8rYOkBh5LUBtyjB0VLUtjq+VOzzGGoP2CdYh0Vq5opGGKOhiNtMARcVvbGGO7B/j3C
	5qEkFz0hqGvl3+LD5i2tKZL3LcfLcepngOOiLXrA9OOBDH8+cKwn1JAyKwR457yUm33rws7SmZv
	8Zeer6gx6KaXmunNFnX7WwOULnHW7WA==
X-Google-Smtp-Source: AGHT+IGdqTMKmvDwaCbAMMRkMPPBRBJxD13gUM3aAdpqSFbxFsJL6h+GF3pFg9XVJDDpB1yiQVYBig==
X-Received: by 2002:a05:6000:1849:b0:391:8a3:d964 with SMTP id ffacd0b85a97d-3997f92d0a6mr16586145f8f.41.1742907106128;
        Tue, 25 Mar 2025 05:51:46 -0700 (PDT)
Message-ID: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
Date: Tue, 25 Mar 2025 13:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jandryuk@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenpm: sanitize allocations in show_cpufreq_para_by_cpuid()
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

malloc(), when passed zero size, may return NULL (the behavior is
implementation defined). Extend the ->gov_num check to the other two
allocations as well. Don't chance then actually using a NULL in
print_cpufreq_para().

Fixes: 75e06d089d48 ("xenpm: add cpu frequency control interface, through which user can")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -840,8 +840,9 @@ static void print_cpufreq_para(int cpuid
     }
     else
     {
-        printf("scaling_avail_gov    : %s\n",
-               p_cpufreq->scaling_available_governors);
+        if ( p_cpufreq->gov_num )
+            printf("scaling_avail_gov    : %s\n",
+                   p_cpufreq->scaling_available_governors);
 
         printf("current_governor     : %s\n", p_cpufreq->u.s.scaling_governor);
         if ( !strncmp(p_cpufreq->u.s.scaling_governor,
@@ -907,7 +908,8 @@ static int show_cpufreq_para_by_cpuid(xc
         p_cpufreq->scaling_available_frequencies = NULL;
         p_cpufreq->scaling_available_governors = NULL;
 
-        if (!(p_cpufreq->affected_cpus =
+        if (p_cpufreq->cpu_num &&
+            !(p_cpufreq->affected_cpus =
               malloc(p_cpufreq->cpu_num * sizeof(uint32_t))))
         {
             fprintf(stderr,
@@ -916,7 +918,8 @@ static int show_cpufreq_para_by_cpuid(xc
             ret = -ENOMEM;
             goto out;
         }
-        if (!(p_cpufreq->scaling_available_frequencies =
+        if (p_cpufreq->freq_num &&
+            !(p_cpufreq->scaling_available_frequencies =
               malloc(p_cpufreq->freq_num * sizeof(uint32_t))))
         {
             fprintf(stderr,

