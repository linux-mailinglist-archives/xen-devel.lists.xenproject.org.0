Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD94976DEA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797656.1207665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soltl-0008Rv-0B; Thu, 12 Sep 2024 15:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797656.1207665; Thu, 12 Sep 2024 15:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soltk-0008Om-TK; Thu, 12 Sep 2024 15:38:20 +0000
Received: by outflank-mailman (input) for mailman id 797656;
 Thu, 12 Sep 2024 15:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soltj-0008Og-6s
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:38:19 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0865f453-711d-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:38:18 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so1290136a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:38:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72e7fsm760393766b.109.2024.09.12.08.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 08:38:17 -0700 (PDT)
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
X-Inumbo-ID: 0865f453-711d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726155497; x=1726760297; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AtVc+7nHrPWj44KnO5EoZg9shgr1BIY/Jvn32C4fQM=;
        b=WpoQNvQal7VWLi84wwd/GOmADXozPlVZTUf0zXlGqXYFt/4zTvG5J1/H3Cm8cdDYMc
         0dQo9ZW1YDT0wfhpCbpAgadm3Noj/f1Jw8GShbIHG2krHkZ+N1cRRCKP9y+lHsFhzqmR
         XLFHSYqRn1xaFMXObTAXZMxUcO1NXh4wVWVeWoOVgt5v4Wgzf3t5TK7t0h+51+QkZ6UO
         q5VYDqztzr/ozXc3X9oUqLKI+ZPXZBa3JhTLNcp0mTsUw6y8/pugr9ou5TibI5lw1b+G
         eJeZu009ovQwFMAuLHmsS43Y/sJgAnReE2khAis6+S8mukO2G/nVpzRQN2Ydot4rbBCG
         pSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726155497; x=1726760297;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AtVc+7nHrPWj44KnO5EoZg9shgr1BIY/Jvn32C4fQM=;
        b=VZLZq9qIOzVVdYr4eiZqoSSJZzfvmK7DpthMdyxdNbuYT4QcSfKCwQc+iV3/sRmvqa
         UDs4SJmh1VNXKzDeMLZXivRaee4M04AsFD7625V3Q+5xdl608nB+LZFJVzCoqXzMpA+X
         K2o4RkC7msgONU0g8Je9WerH1DQn62rr1d1stxhL6h13AFQTOw1B5BdvW9RUR5RYV1yj
         fL7LngcUma+0rj1uq/fWNOYoW371q1qesBr9nCUGh3/YMnBqu4JhDcjVYCyySP1wwMwy
         2gp12Cj61TmG3/5thoPxljcKXhEcIPI7kewhq/hzsIDh+e8BPHbqefx2FHJDliYDx3CL
         X+Yg==
X-Gm-Message-State: AOJu0YwCSi8spGj4Mh70gchuRlOKx2H7srXf+4NqwpcEbqDMXflw4zOU
	DDm4/ZWJlsCN1R2eIBwNQJJDFqrG2WXBkGqAz09kidP6w3aZCQtlYX4R9rhzT2uarh5jEEglE0g
	=
X-Google-Smtp-Source: AGHT+IEoNl2/smpdEMNKK5iux1McX7vjo6HCskjf41YpK1AaAIpYnqzc7gwZJMXHY9o7iXLbxRcCxQ==
X-Received: by 2002:a17:907:1c1a:b0:a86:97c0:9bb3 with SMTP id a640c23a62f3a-a902961741bmr360609966b.51.1726155497431;
        Thu, 12 Sep 2024 08:38:17 -0700 (PDT)
Message-ID: <25a6b7e7-3bbe-4121-8f29-cce6f0a99206@suse.com>
Date: Thu, 12 Sep 2024 17:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: undo type change of partial_flags
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

Clang dislikes the boolean type combined with the field being set using
PTF_partial_set.

Fixes: 5ffe6d4a02e0 ("types: replace remaining uses of s16")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -286,7 +286,7 @@ struct page_info
         struct {
             u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
             u16 :16 - PAGETABLE_ORDER - 1 - 1;
-            bool partial_flags:1;
+            uint16_t partial_flags:1;
             int16_t linear_pt_count;
         };
 

