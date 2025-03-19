Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543FA68D29
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920664.1324768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuspS-0001B7-LU; Wed, 19 Mar 2025 12:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920664.1324768; Wed, 19 Mar 2025 12:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuspS-00019g-Iu; Wed, 19 Mar 2025 12:47:26 +0000
Received: by outflank-mailman (input) for mailman id 920664;
 Wed, 19 Mar 2025 12:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuspS-00019a-3f
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:47:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3d2f44-04c0-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:47:24 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso32067455e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:47:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f74b23sm17892185e9.29.2025.03.19.05.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:47:23 -0700 (PDT)
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
X-Inumbo-ID: 4e3d2f44-04c0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742388444; x=1742993244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=283xv1IgakwrLHODHPp9RF+SoHkcvH9OXNhE2uqRuu4=;
        b=MSaR9Kd4TB8MsYnIjD9oRVGwpRpwVPr6idjJOia4u7ThR0rXmp6nqsQ89NcLPQhNle
         S4KtwH/nA056clvSNw3zup+7pDJ7ZhJythb5812xoUh+1KhoV+/3oJTIw0cbECLXoKiw
         K4lJFYudZJ+FeoVJxfEhFct13gDkFUWFU0Hjj53SsO812Iuj3IgM+fSR4u6K37b1HQGN
         oSp5orMkrNHw6L2qFbqU0AE2Y6TkWBI7nhTR3LdWPdssBztzwRlKY2upsQKZ3WTncLXk
         XPB3wFxv+VT7YOncZ8dA/ICsOvbBnFzckUsTN+7zKOby0JmlfGzVKOP8R9RzZ9j15Z8Z
         FCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388444; x=1742993244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=283xv1IgakwrLHODHPp9RF+SoHkcvH9OXNhE2uqRuu4=;
        b=D1RCihgcSqFYE4W1nPypE/+IGRIjQ2QnlpnO25/H6Ub7H2XKZhgPjyNtjt/l7io1dN
         RNtiOkVp3sw/R0amiwmSBREdmzsU6EpHvJO3XAQOW46W1oxckEsRxB2GW/yrP3j8iArk
         eSpwaHQqHQ/fh7nBj2+BhSoVmqpDMzhIypE4hdEgz2Ke4S0uMAWpfQTC7NLQAWdxQ+0x
         HEeA1AvwLVV5tOSC8/mjXNacWOTsLKBuZO6+N74WT57gLyU6bHBDL2B/KwoLeiP1VLa4
         DEL8jI/IDZuwpvNObrnqbijdof8BYF0CezEgpGIPCYDzVzmuDuc7f6UpmrFcWJQXqlqx
         EU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm2gfYUBBzwxLfpNEcSHG3N03Lk4dQae+PJhgHC+eJZZZttGzAlE5QM5zFG8ajRmGheOdegwOCT5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg7hR8JRQMp2zvUi76MhatiN2sfsp1osvCkZbywzn5HPYtIBhI
	LYUS3BTAwbsYvhaCf6qQe0YfmJmC49J8yPT7CE6F2JzfSlpQBDMFZM+Dijt4Qg==
X-Gm-Gg: ASbGncubcGtE+5IADnX4/zfD3SlLVzLMMycVAwPY8fJvVY102/GPE4yq31QTSy+r+Zx
	Op7baZ6sTvpYCo0gStWYXSGhfQeS/wPef0bKqipDjqqPWZiu5HQ9XVAaxokMoFmXcqzKLRfYVWf
	Cp7d4TKcXz9m/9aF8q+PD5kL3I19C10lkmQ3hWNM9qgex9EsQu6ptGExOtP/y9rz6eyvilHGOm9
	iajTz4575oC2XHKYp/SfoUMSjlRlOZVywocBoZ7xljPflDEhxngeT1T/5NrsYa3PIBri91DN/xH
	B1sbgzGUbzsW7VmEyjLVIVncbbSz8F71/Eq4CG4hQo1srpVMphBX3WbVHdijmA5p7ICLXsjiDmC
	AeZV3HDTs4D01qbhTPE965v/uAIr+VA==
X-Google-Smtp-Source: AGHT+IF9CLUuFKqf13mBbqOtlOtYAt6LQetr1vx7St9C+CUVAJwjVrikf0D6Hcbf4Sxmtp4nd9gqUw==
X-Received: by 2002:a05:600c:190e:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-43d437c331cmr25548785e9.16.1742388443686;
        Wed, 19 Mar 2025 05:47:23 -0700 (PDT)
Message-ID: <a4662e3d-8206-442b-a1bd-75b3fa8dee9b@suse.com>
Date: Wed, 19 Mar 2025 13:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] xen/x86: Move freeze/thaw_domains into common files
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
 <9a958cb6-d9f3-4bc3-9305-db954902f897@suse.com>
 <CAGeoDV8zK89jfq-2uOayUVEAo5uEdGsXqTnyz-9h7+CjBYAtgQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8zK89jfq-2uOayUVEAo5uEdGsXqTnyz-9h7+CjBYAtgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 13:03, Mykola Kvach wrote:
> On Wed, Mar 5, 2025 at 6:48 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>>
>>> These functions will be reused by suspend/resume support for ARM.
>>
>> And until then they are going to violate the Misra rule requiring there
>> to not be unreachable code.
>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -2259,6 +2259,36 @@ int continue_hypercall_on_cpu(
>>>      return 0;
>>>  }
>>>
>>> +
>>> +void freeze_domains(void)
>>
>> Nit: No double blank lines please.
> 
> Thanks for pointing that out! I'll fix it in the next version of the
> patch series.
> 
>>
>>> +{
>>> +    struct domain *d;
>>> +
>>> +    rcu_read_lock(&domlist_read_lock);
>>> +    /*
>>> +     * Note that we iterate in order of domain-id. Hence we will pause dom0
>>> +     * first which is required for correctness (as only dom0 can add domains to
>>> +     * the domain list). Otherwise we could miss concurrently-created domains.
>>> +     */
>>> +    for_each_domain ( d )
>>> +        domain_pause(d);
>>> +    rcu_read_unlock(&domlist_read_lock);
>>> +
>>> +    scheduler_disable();
>>
>> When made generally available I'm unsure having this and ...
>>
>>> +}
>>> +
>>> +void thaw_domains(void)
>>> +{
>>> +    struct domain *d;
>>> +
>>> +    scheduler_enable();
>>
>> ... this here is a good idea. Both scheduler operations aren't related
>> to what the function names say is being done here.
> 
> I have just moved these functions from x86-specific headers to a common one,
> but they are still used only for suspend/resume purposes.
> It's not a problem for me to adjust the names slightly in the next
> version of the
> patch series.

I wasn't after a rename really; my suggestion was to leave the scheduler
calls at the original call sites, and remove them from here.

Jan

