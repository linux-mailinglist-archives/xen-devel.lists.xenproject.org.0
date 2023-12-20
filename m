Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18DF819E85
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657750.1026825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvAh-00058M-6y; Wed, 20 Dec 2023 11:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657750.1026825; Wed, 20 Dec 2023 11:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvAh-00054d-3v; Wed, 20 Dec 2023 11:55:31 +0000
Received: by outflank-mailman (input) for mailman id 657750;
 Wed, 20 Dec 2023 11:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFvAf-00054T-MH
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:55:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa5041f6-9f2e-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 12:55:27 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so57722705e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:55:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040c11fbe581sm7139023wmq.27.2023.12.20.03.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:55:26 -0800 (PST)
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
X-Inumbo-ID: aa5041f6-9f2e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703073326; x=1703678126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjYflLFl4JlqHisJ3gQLEdhkT8vvEyla0LhlslTZ4Go=;
        b=aUTUmSeRoZc1hgISAxR9yoln4lgO9G4eOtU9p67nEski7y8ufcqYdSp3rKxNZT4y5C
         A/WX0ZN9sIa3sYJFDQz1ia3wdDS//SV9GSSKqXeuvbFRubspBBQolqU0rF8GRHqG3nwL
         TdcBBHHl4YTYvP4FSeoXMGxR2yHu2qaPH+Q4Jf0q2QQfRvYeCzkQZW2WV+Unmn3krN/k
         Cb+aSq7XODj2W6SIwpvRwq+XouQuy2VkWMeHs0vZYz0XJoYybwnXNGT6r6SkssW3MO6l
         cHSsMQooitXz66H86Ir9xtoE5s4gfFiTpMVRiXA8lKpNhoRWvtwmTaBWlH36vbxLuR/3
         0hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703073326; x=1703678126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjYflLFl4JlqHisJ3gQLEdhkT8vvEyla0LhlslTZ4Go=;
        b=YusHSIz9sd8hKBbGohddHY1y1V8Z+jvNyaZFVpeXvRYwp6SInVNXf2WGPdbkgkyBH7
         aeg2URUuOtHMSkO6dSazjE1GT7XhkZzHywaa4aM6su7hMhRgtPPSOFyH0a/rlc0KNThN
         iNgD8cHiG86NDr72AAiN32gflxUWciVHkjFmukFSf6tbZ6YJLlaUxMTjRHr222GEYBf9
         4caWB50JJyxSKd2rCTpkfYxsnFV3BOdACjRxBKYABsDmvZNRACvQuDcVK5SU50E/PbfJ
         UE8GntBbOBXVAHsRYLqVKXVxvoGCGa3HXRWPygfIO+IL1djfDvIIaLTCgFNxTUJbjpLd
         o+CQ==
X-Gm-Message-State: AOJu0YxheIUCvdXOYqWjyrx0MYx5BS2LGQMu8sq39XcSEKL4UXv3In/d
	f9xATIJbHziQ5l+38swvtErS
X-Google-Smtp-Source: AGHT+IHLRsIA77xzW4f9n6d50qWHbigAh8ICDdEbqVsExtDU8XqbYVJtt6nOgwsnJL+HeeGPwFfnhw==
X-Received: by 2002:a05:600c:ccf:b0:40d:2f89:2e03 with SMTP id fk15-20020a05600c0ccf00b0040d2f892e03mr475433wmb.99.1703073326526;
        Wed, 20 Dec 2023 03:55:26 -0800 (PST)
Message-ID: <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
Date: Wed, 20 Dec 2023 12:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
 <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
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
In-Reply-To: <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 12:48, Julien Grall wrote:
> On 20/12/2023 11:03, Federico Serafini wrote:
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>>           /* RO at EL0. RAZ/WI at EL1 */
>>           if ( regs_mode_is_user(regs) )
>>               return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>> -        else
>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>> +
>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> 
> I don't 100% like this change (mostly because I find if/else clearer 
> here).

While (it doesn't matter here) my view on this is different, I'm still
puzzled why the tool would complain / why a change here is necessary.
It is not _one_ return statement, but there's still (and obviously) no
way of falling through.

> But I have the feeling any other solution would probably be 
> worse.

Use the conditional operator?

Jan

> So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 


