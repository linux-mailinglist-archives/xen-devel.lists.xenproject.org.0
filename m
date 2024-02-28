Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8586B321
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686718.1069092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLpK-0005id-7k; Wed, 28 Feb 2024 15:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686718.1069092; Wed, 28 Feb 2024 15:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLpK-0005gb-4y; Wed, 28 Feb 2024 15:26:34 +0000
Received: by outflank-mailman (input) for mailman id 686718;
 Wed, 28 Feb 2024 15:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLpJ-0005gV-GD
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:26:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfdc3e67-d64d-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:26:31 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a440b1c445eso108937866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:26:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w18-20020a170906481200b00a440ec600e3sm517437ejq.121.2024.02.28.07.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:26:30 -0800 (PST)
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
X-Inumbo-ID: bfdc3e67-d64d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709133991; x=1709738791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBCQAmcAwbz+4BjecfA3CxB4ZRhe3irb7v10lQK7hPE=;
        b=a0A8s6YsCX/notlfJ+KNjSi2SQ1StL1/9wAGvtbyXLi5UV+PaBHxzyojY1NPxxG5RE
         GK3Sv0XY0bgrC8o831HABc0+J4ZsJ9D5TwjU1/Ho4B0TvNGmYaCkCF7W60RtSaPidqzI
         O+wAviAutC6+BAs5OmGruBjFRdhUqGB/HWr+jOExoM5vrBZq1rdW9L3WK52XQrglkO4n
         e+PFtjnG2oR7kdrubTGfZY9wHu0NyjUGJpIm8ObOJSKSjYznEtgsXwWmNHZA7JAvXX2L
         JI928e1M+zLS6t164eVcUHGEbFOnM4QK02+m6fLLepopODDz0z5UUL9DKDpzM+MR9Neu
         45SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133991; x=1709738791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBCQAmcAwbz+4BjecfA3CxB4ZRhe3irb7v10lQK7hPE=;
        b=eGcJW2jVVPuLbvBXfaGSNHpK3ta4l9OH31a73gXmhY1fd/fPn97zxjJ4ZMbeGiZFoc
         w+mGmhY2eGMWZfHNqaoE0beYMyVck2u48PipdKojhJXSS7+Z2F3nb0KVIJMqpxGVCShw
         emWUmvZpOmwUtoKsj1aortO58N8Fm277LXTpbF0djK4KfYg4SNEiCJR8A+8cF7j973R4
         +oPS6qqfd2OD4UDhAn6OAu62iUiOzUGXb8aw7ouI4mDs7nci2nQJKB9dfYMHCG2FmYAX
         1/st9VZ4nqIUxqpLYwWQ64aDZjzdAtDgH1rHvtLROJZKAccEaxNOddzuqqAIgRumi6wc
         k/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJga2uQO0hEwLCSrEP5TX/fvJPPZx1OWZupIO7J1yvb7f9w/q7vhYFzPGDPB4pUQ9OxWz0dIoOJ/NdT2DDEpbQIzJow3Os8Z+KfQxihSU=
X-Gm-Message-State: AOJu0YyvJTbbgKjNXw/DLKJF7zQm3tYMVN5uLrNY76EiiK0q/HrYgQgk
	hz04CpET5exAbY8NhIAvOpq1PkyVgFX1i3GMTXtjC4lHq+7eNOUf1cypUUOEbQ==
X-Google-Smtp-Source: AGHT+IHd1v/CSRpIrXzfYayj6GEQtN4EaQiXBkNxAe/PQh6vZVkrCEKg2JbiRXOKtZzCVMI5Oxq7PA==
X-Received: by 2002:a17:906:4a17:b0:a43:f924:d65 with SMTP id w23-20020a1709064a1700b00a43f9240d65mr1823858eju.26.1709133991068;
        Wed, 28 Feb 2024 07:26:31 -0800 (PST)
Message-ID: <8d08be46-f847-431b-86c8-7cae3d68574f@suse.com>
Date: Wed, 28 Feb 2024 16:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/traps: use entry_ssp in fixup_exception_return()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <45f89d82-bdc6-44b6-a784-bcdfdcca403d@suse.com>
 <aebc274a-31ea-41f2-abb7-e45493ada436@citrix.com>
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
In-Reply-To: <aebc274a-31ea-41f2-abb7-e45493ada436@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 16:21, Andrew Cooper wrote:
> On 28/02/2024 1:52 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -837,24 +825,26 @@ static void fixup_exception_return(struc
>>  {
>>      if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>>      {
>> -        unsigned long ssp, *ptr, *base;
>> +        unsigned long ssp = rdssp();
>>  
>> -        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
>> -            goto shstk_done;
>> +        if ( ssp != SSP_NO_SHSTK )
>> +        {
>> +            unsigned long *ptr = _p(regs->entry_ssp);
> 
> To double check, this works by the magic of:
> 
>     signed long entry_ssp:48;
> 
> getting sign extended back into a canonical address?

That's the very reason for using an explicitly signed bitfield there,
yes.

Jan

