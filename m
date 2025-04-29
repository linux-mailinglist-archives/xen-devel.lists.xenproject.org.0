Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662CAA0D91
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972637.1360955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9l9Q-0005hI-Gm; Tue, 29 Apr 2025 13:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972637.1360955; Tue, 29 Apr 2025 13:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9l9Q-0005fd-E0; Tue, 29 Apr 2025 13:37:32 +0000
Received: by outflank-mailman (input) for mailman id 972637;
 Tue, 29 Apr 2025 13:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9l9P-0005fX-6H
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:37:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180546ba-24ff-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 15:37:28 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f728aeedacso6775634a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:37:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c6b1sm792909366b.14.2025.04.29.06.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:37:27 -0700 (PDT)
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
X-Inumbo-ID: 180546ba-24ff-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745933848; x=1746538648; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyQfqNSQSl/BRnAcsNhdDLGopnrJXni2NfGu26gWAXU=;
        b=VEDH4ea8E8470bFyw1GHOWFzShFrq90fsDHK8lMmL9r4M7TCQjVcbxjdvRAtC85V1A
         ksk56zcWAfTnsJVdOr1C4udsT1rrlUGiuUqYd6J82ui7e7G+37Y686KuwtuxQ4y2ECMg
         GxZhHjnm+dbpPF8mO2WtvAbuQo4gLZzsd2NO6gqvlSgeKguZpzauecE5JNsJhP0g6DgT
         YuaXElPD1tutmYdHODNdyM6unw1aa74DcykQL1W3Sh/QFPapxdJpPNHx190JL+8TB6p+
         9+6vk3SS4k74ipZPRTd97cNC37ZNZfhBkD0ixV/wi84Id1VhEGQjKSBYOfQw21cpT9PR
         X5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933848; x=1746538648;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyQfqNSQSl/BRnAcsNhdDLGopnrJXni2NfGu26gWAXU=;
        b=ia9FnZbKjYQgS/D0CEUQAeXvcN9M6FJINgIrM6iMUPZqkxdhuPxTRQs8tT5JbGs6mH
         fYhA3StF63eWYMOR6ED/akf8abbA0ELlXZgmLAgMmRfkNjFEoOAsf5OOZ333EahqbaXd
         6RMCY9qFKKDYtf79CvymMkzzKqUrVQsIy5PweAv629w+IDeuYKFltrluQuc/k4ycFQOi
         nx7RYNNeiZzxtQkwDCcxX+CDvoWigru0/9nak+2+LQnX2Xg3/6A1Ho/AJSgT6LQ5tme+
         eKGFogF77muk2W3N1JWg8phdVgKjftNy8KRTJ664gtJ/SfPnUPxmJeWcf9czS2biQDQj
         iejw==
X-Gm-Message-State: AOJu0YxdzIZ5ELYuXuiSpfLTgWRALDr5oJ9uxxqyVCJLqmU60+uUJ39W
	t1zepHt7G69n5xgIwi7ciIkqcllb9ykgdODwu0aB1vv+s0d7/rrQAi25WBMOFZhisS6VzE3Z7sQ
	=
X-Gm-Gg: ASbGncvn2ZeAAD5QvZr0HHGpR3MIEhafkLVC2lyogHfygMhUy3MRlbgJWhw0dk9z6JH
	G2gkoHZmAOMzmRH0Bc/U3G05liY2LciuPm97IldoWLdkbzo8aNR7Hicbfrw9L82EID3cDV8XJ6A
	0zMrkaAHVqXV3u2kHuOBvy5prneauUJ2krstEjNTw+ODld7Rd9Q02k6iV60RpdBA9RQKfuV3Kxj
	rGlK82ks2bK4tgOrsPNAToqeyZfCGiZhr9q2DWjcwKabqh1P9fcMccJ6nZD1aEMqjo7poqXiRnk
	i3VQT89DHkZuCJb0WeFceR0BnAG/0RkpHc0yQCUftsONprpTh+ttE+7xRY9aKjVILSmwVBLzjnv
	ktXB3zubdS5jWVa2YZrQ85OIDlv178yVdsmZ0
X-Google-Smtp-Source: AGHT+IEXoRl/8YHd2sTFZk+w1D5JuCQ5zfzvWIdxGhcUcMbdUHpledAU/QVUMt81YGWa0g1CoMzYTw==
X-Received: by 2002:a17:907:7208:b0:acb:1b87:5399 with SMTP id a640c23a62f3a-acec4eae2b6mr368964166b.43.1745933848223;
        Tue, 29 Apr 2025 06:37:28 -0700 (PDT)
Message-ID: <17eddb04-f4ce-4d90-8619-1351eb810117@suse.com>
Date: Tue, 29 Apr 2025 15:37:26 +0200
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
Subject: [PATCH] cpufreq: don't leave stale statistics pointer
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

Error paths of cpufreq_statistic_init() correctly free the base
structure pointer, but the per-CPU variable would still hold it, mis-
guiding e.g. cpufreq_statistic_update(). Defer installing of the pointer
there until the structure was fully populated.

Fixes: 755af07edba1 ("x86/cpufreq: don't use static array for large per-CPU data structures")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -113,7 +113,6 @@ int cpufreq_statistic_init(unsigned int
         spin_unlock(cpufreq_statistic_lock);
         return -ENOMEM;
     }
-    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
 
     pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
     if (!pxpt->u.trans_pt) {
@@ -139,6 +138,8 @@ int cpufreq_statistic_init(unsigned int
     pxpt->prev_state_wall = NOW();
     pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
 
+    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
+
     spin_unlock(cpufreq_statistic_lock);
 
     return 0;

