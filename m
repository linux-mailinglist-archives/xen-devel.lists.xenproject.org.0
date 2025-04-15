Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA09A899CB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952558.1347970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dPR-0001Mv-3P; Tue, 15 Apr 2025 10:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952558.1347970; Tue, 15 Apr 2025 10:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dPR-0001Hi-0d; Tue, 15 Apr 2025 10:20:53 +0000
Received: by outflank-mailman (input) for mailman id 952558;
 Tue, 15 Apr 2025 10:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4dPQ-0001HZ-82
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:20:52 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e1f85e3-19e3-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:20:51 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394a823036so53276845e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:20:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338db88sm206530655e9.6.2025.04.15.03.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:20:49 -0700 (PDT)
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
X-Inumbo-ID: 4e1f85e3-19e3-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744712450; x=1745317250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dyL62BBdKEUUdeZTFEVZEa5BEIOvNS4mcc26VHnkdIs=;
        b=IUMJCNsBiwd/7moblYkhO8NbKJ0MygJkWQ7cWQUsZxV869K3ak7IrUp7KSCkw7vn2s
         gbBzo8ovTNpXmNVWvc8ZRbyZFuLFfXh7o5wLYY99BLpwrghnaQAb5KdQxqQqnRlZ/VBG
         DTHCtyEtUlB8xCzJ99mF/V7Y1glJTFeZl6tltpXKRg0A9Pewowz4yNH/vRlWbTQZlZwc
         IUMNo9+4n7fIo8wlIHs++nR1XfiNfh407yf+tkvJiMJi7kItsoBtFtI4zJtgyiafnxWn
         7p0VgDQ5A3Ayepa4SwPfdsfVkLyDNfb4qa7ETU1LLGj3iWhKBCECDxOslR4nE0zlGN98
         kmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712450; x=1745317250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyL62BBdKEUUdeZTFEVZEa5BEIOvNS4mcc26VHnkdIs=;
        b=vNaTpJVfkOLtXAGuqR53Wc4QsyQ4gYNrgI/RrKIhkesgg3dihFtisxPb1LBMh4KHPo
         TKfABWynuVzSVsSvN6SuQScp/0qcfSRczJV/RLRq2M6wY5wHCtL82qneJgL3TMCJaCkL
         glJmKA+rEvQonl9WuwsZhS8xy+Z1pH5LR/tPW8WVSfjb9eBQye313pw3y15Q9LuF94nC
         LqrEbWEgV+axkCuF6lUJ0N1fX7yiLtOIICcVnwjFxIeguW5TAt/oSvOQpFTAxuDJQrlP
         5efkg5LOF5yHWshqJzmFIKHnHKqnUxjGHX1gyqvjrzC7FmSMdo7MbXMdDeIhWpqLpTRz
         +E/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU09vC9YLs1oXVVx1OShfR1BSVk179EoqMLp4i+QQ5Ww+Vk++hLklEoxTKb3QXCeQjz3OmEpgr1IPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwV3xJzE1GOf7prul7N/2+p3HR7XzXft8as4Ve3C00gjfM5XNPg
	232RRPBmbIQ8y5fmwrI8F9CeIQRn0335oKgJFYeY/DJmAeSyGWibxCOAb/T2tg==
X-Gm-Gg: ASbGncvnL9saqQoINgIBcnuBLXeZVnDMuCL/r93/rwzQU5IvoQeyJhSU4A/onjKHhvJ
	BfM49cso9uU8Wh6X6nlnXNUGLsghwbb1NvqviilktLE46QKTwBurHZBti1DhuEot+JX/Sqt8WFG
	oe0fOOiHFiz5bsj3rMUZ4M5UaQicl5Ie5ytNWv0FkKsSrQhId+T9yzun8jqKlt+EeXMuWFgAFgg
	shYlWoAYvF5QsM/o85uRCY2VDlAz+576lIC2P39l9q81TVmCZ3LxE1Zu0zjFuG8bn0Z6M+AXeRT
	LPa9Rze6RXdqvS96EzXjZXXlJCDcsP1nl+hpoaAO2V9uAF3uWaYRfsW5NwIcgDuuGeOFG5KEYAI
	jmcpCTf4YW6dqlalEchyd1jXC6w==
X-Google-Smtp-Source: AGHT+IFhvtTUKnkHFGuURnhb46hUwv0E25fV4Y9gI2d2xccdX5fhtV0GWlXSe2Fq7EEItJcY57Q8Rg==
X-Received: by 2002:a05:600c:3b93:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43f3a93ce18mr121868855e9.8.1744712450258;
        Tue, 15 Apr 2025 03:20:50 -0700 (PDT)
Message-ID: <27303692-2e7a-4fdd-9d66-712cc9932575@suse.com>
Date: Tue, 15 Apr 2025 12:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-4-Jiqian.Chen@amd.com>
 <dd4dd741-b063-4619-a893-a9c02c0ca791@suse.com>
 <PH7PR12MB5854D4F8AB6F4E56E67DE757E7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB5854D4F8AB6F4E56E67DE757E7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 12:18, Chen, Jiqian wrote:
> On 2025/4/15 17:49, Jan Beulich wrote:
>> On 09.04.2025 08:45, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -815,6 +815,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>      return rc;
>>>  }
>>>  
>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +    u32 header;
>>> +    unsigned int pos = 0x100U, ttl = 480;
>>> +
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        /* Extended capabilities read as zero, write ignore */
>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>> +                               pos, 4, (void *)0);
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +
>>> +    while ( pos && ttl-- )
>>> +    {
>>> +        header = pci_conf_read32(pdev->sbdf, pos);
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>> +                               pos, 4, (void *)(uintptr_t)header);
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>> +        if ( (header == 0) || (header == -1) )
>>> +            return 0;
>>
>> I realize pci_find_next_ext_capability() also has such a check, but even
>> there it's not really clear to me why compare not only against 0, but also
>> again -1 (aka ~0).
> Thank you for raising this question.
> When I coded this part, I also had this confuse since pci_find_next_ext_capability() has this check,
> so I chose to keep the same check.
> Do you think I need to remove this -1 check?

Unless you can explain why it's needed (perhaps by figuring out why the other
one is there), I'd say - yes.

Jan

