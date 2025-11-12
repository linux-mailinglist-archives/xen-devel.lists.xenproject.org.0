Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA3C53165
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:38:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160101.1488332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCvT-0000pQ-Bn; Wed, 12 Nov 2025 15:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160101.1488332; Wed, 12 Nov 2025 15:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCvT-0000nD-97; Wed, 12 Nov 2025 15:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1160101;
 Wed, 12 Nov 2025 15:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJCvR-0008Gb-Sp
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:38:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b17f5bf-bfdd-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:38:16 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b727f330dd2so159636066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:38:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf723172sm1603651966b.32.2025.11.12.07.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:38:15 -0800 (PST)
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
X-Inumbo-ID: 9b17f5bf-bfdd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762961895; x=1763566695; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvdn/YOEw/NnNm8kV+DjBN/TshsYdk9FMorxA63YZUM=;
        b=HwjvDR3z83Oih77XawyXqnqWur0Iszx7pasyACezccX/t6Am+jnebQX2PCf7iEWO2e
         i8lZBead5/twKQ0MQuF4YwGKGGBBhZJSGbU3w29bC50tgOZtjXIS7ODMjF/Qsyn9q1W/
         QknuGO/rWVrape8PQ8Y8lkmQPDIWJPezVRRKrFAhflkH2sVmEoiQvBENj9F3W73MZl16
         gcm+jrcXaCt16EYMo7zNyGz3t6tmveff4pkkmMX6plvgi5ZOfUHzsW13ls5fBkyyDRPG
         ZT/i50Hpx6TSScthUGoTX6mB742/j/WJhtotob2KEyxnnP5MHtjLnNCYPEIyFaNY6ptn
         88PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762961895; x=1763566695;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvdn/YOEw/NnNm8kV+DjBN/TshsYdk9FMorxA63YZUM=;
        b=uWtGEdqcJ4VCFtfxI1dfxMOjMDyoFwinXAqBCBAx7kMleQWVJ/WwrmXDE3JWp176Ho
         7uG4hd8SCHFMDw/jp4NPq4iDFaN3ZwQGe6Ih5PZoW5kjEESAViwbC063Z1jfx8tjZhQN
         fYcdfJXs3N+nJP8nuifY8qAxnGAK2WKS8mSFy3IxBurR7gKuuBgHPIxwAuXrh61Dg1MB
         196zuuYWY5LZXJm3dWqOW5kJ2ZGdTrt/lAB23oGD7QgEhGZNZnLvGg4j1oykK+agw8yB
         nhJP5Aig7rADuuE7IqeKiiuTpSBwn+3Jf+Ar8nD+mzKnDVJQJLgfoJAL+g+xvqsSf8Ke
         vD4w==
X-Gm-Message-State: AOJu0Yy+sYWsOWb6CfZhTST+UidGf8mivzP+7WcPGtEBJ0Q2U9KWlG1d
	yk0Rgpc5QD0xBnEep4cRmbYa+iaWuppIvigQD3m6ZHGGffqgGVUNNKGmWBeMaNLH0NlWo1xWzlA
	0COY=
X-Gm-Gg: ASbGncvgVvdJUpp8wFPzgSDeCvEm8u/ArYfOL4baS0oUBnpMtjL+12vMvYgaieQAWcg
	X+E4ZyQXWnIO0ZD2PQnamEhmLfX2MdBt4J+KMLCSwbLdV2QLmgnIOoK7ka+lKxQqgVmTywm35XY
	1Nmb5nVpf7DEzPz0xWZSDmWCCjSxcJ+Jyxko9FFHmfjOpKVSm3bLn6NM9lEte8y2jTPyStHBRPO
	TkyPN5mBL8SnaEsSGdnDu1SHXECB9gfxulue10K6XFXWuBhw/8Q/xZUK3ha2ulhj93P9n49XS61
	0apCpho83RCmsAaZ0Lu1xm6KfgxN48DQgLTrFKCUd6qKj/tGpx0Bpc6/dV+r+WxsUYKASOYHdea
	hOpcAvhXKnYu/x9trLGu7R7CzMOuulMvQ5Uh1BspsZ9vymbGZbaxit9hzLQ8o1WnWJ6H4+OFwMT
	AWIIUEpquT/5lcxMXqf0ssVspcAaXdPl40pAbVRnUPdgf2V3/ciW+ATAbaR3N3yfUb
X-Google-Smtp-Source: AGHT+IFk+RTd/pu58Fj0kLi5co02NEQH384dGAfAnPx5TLBwVNmjmnvwAxLXYV/QjLkYlo6nNMgcjg==
X-Received: by 2002:a17:907:60d3:b0:b28:b057:3958 with SMTP id a640c23a62f3a-b7331aec36cmr336231666b.48.1762961895446;
        Wed, 12 Nov 2025 07:38:15 -0800 (PST)
Message-ID: <af03f611-ef38-49d0-ac7b-4bad39db46c1@suse.com>
Date: Wed, 12 Nov 2025 16:38:13 +0100
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
Subject: [PATCH] core-parking: shrink and relocate core_parking_cpunum[]
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

This NR_CPUS-dimensioned array is likely unused on most installations.
Therefore it is especially wasteful for it to consume more space than
really needed. Use the smallest possible type.

Further the array having all fields set to -1 is actually useless. Nothing
relies on it, and core_parking_remove() doesn't restore the sentinel for
vacated slots. Drop the initializers, moving the array to .bss.

Finally take the opportunity and update an adjacent variable's type, where
a fixed-width type was pretty clearly inappropriate to use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I assume there is a reason this is acting (mostly) as a LIFO. Else a
simple cpumask_t would suffice.

An alternative would be to use the new BRK allocator, at least for NR_CPUS
above a certain threshold.

--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -27,8 +27,16 @@
 #define CORE_PARKING_DECREMENT 2
 
 static DEFINE_SPINLOCK(accounting_lock);
-static uint32_t cur_idle_nums;
-static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
+static unsigned int cur_idle_nums;
+static
+#if CONFIG_NR_CPUS <= (1U << BITS_PER_BYTE)
+    unsigned char
+#elif CONFIG_NR_CPUS <= (1U << (BITS_PER_BYTE * __SIZEOF_SHORT__))
+    unsigned short
+#else
+    unsigned int
+#endif
+    core_parking_cpunum[CONFIG_NR_CPUS];
 
 struct cp_policy {
     char name[30];

