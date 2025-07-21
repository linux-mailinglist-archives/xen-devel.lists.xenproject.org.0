Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F8B0C147
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 12:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051358.1419693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnrT-0001zr-0i; Mon, 21 Jul 2025 10:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051358.1419693; Mon, 21 Jul 2025 10:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnrS-0001yM-TK; Mon, 21 Jul 2025 10:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1051358;
 Mon, 21 Jul 2025 10:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udnrR-0001Ys-Lf
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 10:35:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a388ee2-661e-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 12:34:59 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2281468f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 03:34:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b708698sm55101615ad.233.2025.07.21.03.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 03:34:58 -0700 (PDT)
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
X-Inumbo-ID: 5a388ee2-661e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753094099; x=1753698899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HK3sXHTGlsqjEh/utH0B2VtOigxP0KnV6mQddJuNy7E=;
        b=CgoLX3G7fZXWiV3WnJPzGffi+al2vuUdsqBnX4eTdyX1ZjuMPTlog8XCqnDiLMVyb7
         lwjfaVku8wt5svXKlo1DD5FLoAAtkWND9rD0SJfDP+5yN7tS7aq1ek5qO9aYDLueqHTR
         KDmvdCkLF1ml1hSko3e+mjm38R+B9+P0Uv8LVs75miIIFQfAW7sQMg85LfNuDsOFjTDK
         O+rlMY4Df8f0eE4n7MGjkZTJ4YL4EfwFLqVYf1U1wGX44LpvqX/cRBvV1X2nLqjHaoBl
         NuAtTyyL1fBKZKL2NY1nZqQ8v3ZzHcwKE7uf03wrLXxkZ0usRy5crEvmh0jmNH4HJX1H
         2j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753094099; x=1753698899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK3sXHTGlsqjEh/utH0B2VtOigxP0KnV6mQddJuNy7E=;
        b=gkvQjzps2LlmMx5d4iQXBIU9ZGS6EBLIpSdJAYy8R+YzDdd/MYNZiWF7G+U+nmlIpD
         Ay+hwZ7CM5OGZz0bC8zAKeIJhGUC7q/my3f1qjpMSVlK1oAclCfAb5bgPeDsnq7zwBzM
         Y5yOZYGbeUhVjLBLVFTLHo/w8Gxiq+UCsaTxFfKLaDiUdIBCKmBIwsEFNPKqDFVQ9XEe
         O1mIye4SzabeaOnHpFkNx/RqLhjbBuUW0l/KBqW7fbdJ7QWDcRmRnZPt9pfQWqndFcoB
         7if1YAuNTlxZt8xrhb9Jo2w+j1dfGSundz9G/BlBCPE0Rl+ndD7Gni4HRm87Uf68s3+G
         YqKw==
X-Gm-Message-State: AOJu0Yyalut7aB/Jbnd2hrYZd5tVbQg9FdlndE2pGHu+T9JUttDyaSQa
	SUBTTbPe6XcvCaBTGjT+KWN19Hq0Ma82yNqvJKm8gzwzrLYeNSPX3yXlP6lL3VAIbg==
X-Gm-Gg: ASbGncuRICloOxx1hETxS1Px7bpmtQjnnpxrMYaAKfhyT40bu04FkiObctpEec67WQA
	QYOFWoKIsEQN15/blmZn+79k1TUqAQCZF+mQsuh28WfK9FYunlQfdl/HUE991uKmiVX7dnuyFPl
	+XHeEPQsDeQmRtw/saiAA5WkewzTgmzqBmzKxQVZhCXES7Yb7CXpHwE0i5vZ+xqOA+ULwJ47gT9
	RX40LVgyzS4sotjjY5z6ijCp7WzoON31zFZCc9z4cJkao6RQC54yQDimK9696HD65f6sATv3Wc1
	7k33PR9BkdHJMl/6qK+BbeUuiLRt0ajklcMgwsyIoK2VSqdGkc1EP3MZRhuGZYD/DzdBNXr0MY9
	psYU0yvIZ3yCLN/1qwom6uz/P9RCYc/2jnYwWR4r2ObHyWDIi8NRWMSHjhtsa5QVVwy1m1tuFZt
	0GdF7uukITsDeBRYp7Ng==
X-Google-Smtp-Source: AGHT+IEliCWjozm+U+SCeRIbVJd8JlNDk2i9SGEs/98AyMH7t/FPWiqlSoALCr0ziPYkjkRMjOpdBw==
X-Received: by 2002:a05:6000:41ed:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b613eab461mr12369381f8f.55.1753094099193;
        Mon, 21 Jul 2025 03:34:59 -0700 (PDT)
Message-ID: <a5d97ba5-9450-455d-972e-181e179f7ca0@suse.com>
Date: Mon, 21 Jul 2025 12:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
 <69b7ea65-c69a-4184-b4d1-0664282ab849@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <69b7ea65-c69a-4184-b4d1-0664282ab849@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.07.2025 12:27, Dmytro Prokopchuk1 wrote:
> On 7/16/25 21:08, Dmytro Prokopchuk wrote:
>> MISRA C Rule 5.5 states that: "Identifiers shall
>> be distinct from macro names".
>>
>> Update ECLAIR configuration to deviate:
>> - clashes in 'xen/include/xen/bitops.h';
>> - clashes in 'xen/include/xen/irq.h';
>> - clashes in 'xen/common/grant_table.c'.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> This patch makes MISRA Rule 5.5 "clean" for ARM only.
>>
>> Was agreed to narrow deviation:
>> https://patchew.org/Xen/cover.1752096263.git.dmytro._5Fprokopchuk1@epam.com/e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro._5Fprokopchuk1@epam.com/
>>
>> CI:
>> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_5.5_deviation_final/ARM64/10706457595/PROJECT.ecd;/by_service.html#service&kind
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
>>   docs/misra/deviations.rst                        | 7 +++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 8504e850c1..3895148460 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -117,6 +117,13 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>>   -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>   -doc_end
>>   
>> +-doc_begin="Clashes between function names and macros are deliberate and needed to have a function-like macro that acts as a wrapper for the function to be called.
>> +Before calling the function, the macro adds additional checks or adjusts the number of parameters depending on the configuration."
>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)) && macro(name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit)))"}
>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)))"}
>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
>> +-doc_end
>> +
>>   -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>>   depending on the guest."
>>   -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 620e97f0bd..84bc933cbf 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -142,6 +142,13 @@ Deviations related to MISRA C:2012 Rules:
>>          memmove.
>>        - Tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R5.5
>> +     - Clashes between function names and macros are deliberate and needed
>> +       to have a function-like macro that acts as a wrapper for the function to be
>> +       called. Before calling the function, the macro adds additional checks or
>> +       adjusts the number of parameters depending on the configuration.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>>      * - R5.6
>>        - The type ret_t is deliberately defined multiple times depending on the
>>          type of guest to service.
> 
> Could you review this patch?

I don't understand. I'm not feeling capable of (fully) reviewing changes to
automation/eclair_analysis/ECLAIR/deviations.ecl. Nor am I the only maintainer
of that file. And the text being added to docs/misra/deviations.rst is too
unspecific for my taste, yet I thought I'd better not repeat that same concern
over and over again. If others feel like ack-ing in this shape, so be it.

Jan

