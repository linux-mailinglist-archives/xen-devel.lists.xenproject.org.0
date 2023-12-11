Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5080C7CF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 12:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651664.1017455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeKX-00065d-BG; Mon, 11 Dec 2023 11:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651664.1017455; Mon, 11 Dec 2023 11:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeKX-00063U-7y; Mon, 11 Dec 2023 11:20:09 +0000
Received: by outflank-mailman (input) for mailman id 651664;
 Mon, 11 Dec 2023 11:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCeKV-00063O-O5
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 11:20:07 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c363efd-9817-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 12:20:06 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-336121f93e3so1003348f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 03:20:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4210000000b003334898aafasm8334019wrq.11.2023.12.11.03.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 03:20:05 -0800 (PST)
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
X-Inumbo-ID: 3c363efd-9817-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702293605; x=1702898405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwB+kvMqUMkTzmz0uOSBDsL5YuLefs77D+QoxbBK3Jk=;
        b=MNsdZm+a8J6EkCVV4RKh0Je0k4aETtoI/VB4AS60/F0p6DLaZuSY/g6g9ghbTIXj6W
         s4a500ZsHokghzxXyeTaisUChh/7gBhgTF5DhiZZAmjuJqhJ4jUehf43zCXyiG1wtMir
         AiAO9OY61AlCZDNFZI4a8xaaGUrTD5O65THxs3P//9IedmA3LTqHTbU+osNJ9BTKMAq5
         4cl69sXDtUtbmer9tQog6hh8070otJyfrPU9j8ow3uQi0SaPI4GJ8o8+cFARy77Zgf/m
         XMMgmuY+8J+12jN84WTsGjphIAARKzEqQgGgU8nVPK1pYhx5yhaItAiwVyqrBtTue/lo
         SmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702293605; x=1702898405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PwB+kvMqUMkTzmz0uOSBDsL5YuLefs77D+QoxbBK3Jk=;
        b=BA7bSVcH8BUJySaIuIKRC8H6s772wWY88KZZz9d5mJlNFm4CTWKEHGpW1v2jE/yoEW
         teJqHeva/X0dVAD668LMpipy2A+sgHiSo9DGxSfdr4gAjdjb9I/oiv/AQCr7Ak1C3gJk
         SechH5HRaYzu7kPE6M9R8mQAofWJY3fA+35RvgQ1krfKZwJgRYeZ4MR5yGo47gO9clqX
         egbgQCCjaBVbH9xhKCvus9IBQsekgjes/ckJC3TqXCmD4cWEkKiDNTbX8wCug1r7HFo5
         EK2/VWN/eX2e3yV67OcXdMktmaGC2t/Tr/qFHp3TWvmd0mNalqvGiH8UlxDROrDmRg5P
         yoUg==
X-Gm-Message-State: AOJu0YzeIj06EjqnforWDFDayiDKaOa5Dd3dwojRmh3zVgU1kZB74Han
	wBtdLog5ytY0UDwC3zvfqseA
X-Google-Smtp-Source: AGHT+IFxirBDjkNlierymWgbOpCSWD6GU22PMm8HVm6GVh7Zq6p8nLPax9K/xeG86NkpnSWtx3JUfg==
X-Received: by 2002:adf:f88a:0:b0:336:8f5:2e39 with SMTP id u10-20020adff88a000000b0033608f52e39mr2628497wrp.30.1702293605575;
        Mon, 11 Dec 2023 03:20:05 -0800 (PST)
Message-ID: <8ebe1be6-e082-4716-9da9-5534f9f84a97@suse.com>
Date: Mon, 11 Dec 2023 12:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra/rules.rst: add more rules
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org,
 roberto.bagnara@bugseng.com, federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2312071609060.1265976@ubuntu-linux-20-04-desktop>
 <1974e461-78f8-4a5c-90f2-d637ee3341e7@citrix.com>
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
In-Reply-To: <1974e461-78f8-4a5c-90f2-d637ee3341e7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 11:53, Andrew Cooper wrote:
> On 08/12/2023 12:09 am, Stefano Stabellini wrote:
>> Add the rules accepted in the last three MISRA C working group meetings.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>> Changes in v2:
>> - remove 17.1 for now, to be a separate patch
>> - add a clarification comment for 17.7
>> ---
>>  docs/misra/rules.rst | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index 75921b9a34..2b570af0e0 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -462,6 +462,13 @@ maintainers if you want to suggest a change.
>>  
>>         while(0) and while(1) and alike are allowed.
>>  
>> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
>> +     - Required
>> +     - An unconditional break statement shall terminate every
>> +       switch-clause
>> +     - In addition to break, also other flow control statements such as
>> +       continue, return, goto are allowed.
> 
> And what about fallthrough ?
> 
> $ git grep -iwe fallthrough -e "fall through" | wc -l
> 315
> 
> This is an under-estimate because there are other comment based
> justifications too.
> 
> All are an explicit statement that a break, or other control flow
> statement, is wrong in the given context.

But that's going to be documented in deviations.rst according to my
understanding.

Jan

