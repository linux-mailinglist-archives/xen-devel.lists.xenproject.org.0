Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7CBAF8B81
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033004.1406428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbmH-0001uq-L0; Fri, 04 Jul 2025 08:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033004.1406428; Fri, 04 Jul 2025 08:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbmH-0001rg-HI; Fri, 04 Jul 2025 08:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1033004;
 Fri, 04 Jul 2025 08:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXbmF-0001qp-O3
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:28:11 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1cd6e74-58b0-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 10:28:10 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so352406f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 01:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459a528sm14179685ad.225.2025.07.04.01.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 01:28:09 -0700 (PDT)
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
X-Inumbo-ID: d1cd6e74-58b0-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751617690; x=1752222490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb+BIWfjSDl49ow0qjw+xjxN6Js6kBsD12MAxQDBUD8=;
        b=Ysv5+fyvPkl78ncxechRzLFnlky+0FmmHhDjgJjaVN5pm268zos+Hvsjbk5W8oEAiM
         2G2kVMvD9UWyaTotmrEv6hAIxXa8C6M0+DA+8xlBjsOswmzbpJBRcpncCqZVLwBRvmBZ
         8qojpoi58zBleiKRPXOnqZLKK2Q1X0HZMRBuPJDCmvm9OkwCnRZKgh8sTA+NaOSGnju8
         Jhe36MuK1DcXWC6w4umiChkI7CxRHPBe2XkBQYe9PQR16wy9mTce5Ul7r4PRiIDsnfxv
         MJWSlmGOGkO0R7rPAgcHutZwHQo/kzOEbeH7YwJMeO4pTGPgK6iaerjo2/GTufItUmdi
         dqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617690; x=1752222490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb+BIWfjSDl49ow0qjw+xjxN6Js6kBsD12MAxQDBUD8=;
        b=G3Pc7U0WWeYxtkhBWw4lzo/fapXmNhQHG/hnwu/8R3T5ttuRDXpsaZ7xxcKtV3Vyuj
         G+4lP07CYuevOibMe4NPJxbI1h24SSHUsIP9unbW3IvFot9YvhKkjwDu/A/X4MudDIoP
         Ld+VAWaZLWI10rh9CeH9fP41JzkJfTXHLmuybqA5YdJdwIqxOeaAp2ECQTcTRPuA0aOt
         Jj8gV/39B4jt5JRufMFBpn21Lqjp0RJF0P062u4kt/d7YxBqoZ0pk4uW0ZNrp63QvlV5
         5IXAXG0H8s7ai162uG4cSJm0Uy9uYebTiaZargHupEpe+FwbFMEwq3cG4cv1UcrfFGKA
         aNow==
X-Forwarded-Encrypted: i=1; AJvYcCVEaDGUCOilsFjBNdYI09HsR/efYGxjzReTfc4UIDA4k4rkXhOQL5jj7NrPQeoXXIdgTMEYjJsbtpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbIMIKDTvoRB7C0XO7+tSOlxE9pNyUDZLF79bR3ynUW1u158KO
	+FQ82fGtYPG36Cjmg255QCi54Hich8iH1gw1PqzwE19B9eI6IDnlkZmmXQCymX+7Jg==
X-Gm-Gg: ASbGncsbtwIww5zUfSK1v5CvbjNybvc3Yly9XSoSefINAhq3VvHC2M7O80hEHwGfEkY
	6C4JWps7aXZ/2mNTbnl63mFU7StQU/j9Aa7vhPB17g2upUJO9nSOFK/1+yD4u4C/Lw+IUIhACes
	mPBTIZrLGUwUzqXUxgy4olvSIIRpNV4fYS2UqKznM8djHm5apHbbEBNMP5QPwa1D0ajA7Vun1vq
	yqHeSNMHNQDIljItnz6I8+yGhaN53OEFjMGKjz0iiYUHyUlB9wMb1WfaDWDgo6Dj9+ZAMl2MdR0
	dKpRt9rliG2lYv6oPCigEPJEYo1ZVUl9LcQh8bBDT53bQDXR7qK0aReLetG5TsFnoELWqlOepF9
	OTwj0k1mGBnzxJMnUNoQkxC8aF/40DeehDBdcXJoO5qwFfLs=
X-Google-Smtp-Source: AGHT+IG/54GNYPXIdMviSF3L0iLEB5uAUfUl5Ku6KBn5W15XAyGp2HSjQNXhRxDfStjBSI7jK8HTRA==
X-Received: by 2002:a05:6000:1a88:b0:3a5:8cf0:fc0f with SMTP id ffacd0b85a97d-3b4964c15edmr1145944f8f.19.1751617690133;
        Fri, 04 Jul 2025 01:28:10 -0700 (PDT)
Message-ID: <da3b8707-1eb1-406b-8344-e562511dc5d5@suse.com>
Date: Fri, 4 Jul 2025 10:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/18] xen/cpufreq: get performance policy from
 governor set via xenpm
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-13-Penny.Zheng@amd.com>
 <0a5c9445-904a-4321-8406-8618fd82313b@suse.com>
 <DM4PR12MB8451401F33E538209B1CBFB6E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451401F33E538209B1CBFB6E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 09:51, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 17, 2025 12:22 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 12/18] xen/cpufreq: get performance policy from governor
>> set via xenpm
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -319,6 +319,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op
>> *op)
>>>      if (new_policy.governor == NULL)
>>>          return -EINVAL;
>>>
>>> +    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
>>> +    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
>>> +    {
>>> +        printk("Failed to get performance policy from %s, and users
>>> + shall write epp values to deliver preference towards performance
>>> + over efficiency",
>>
>> This message is excessively long and is lacking a newline (i.e. effectively two:
>> one in the middle and one at the end; yet better would be to find less verbose
>> wording). What's worse, how would a "user" go about "writing epp values"?
>>
> 
> Maybe change it to
> ```
> printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n", ...);
> ```

Looks quite a bit better, thanks.

Jan

