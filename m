Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D8A6DBD7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925541.1328408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi57-0003jm-F9; Mon, 24 Mar 2025 13:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925541.1328408; Mon, 24 Mar 2025 13:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi57-0003h2-BR; Mon, 24 Mar 2025 13:43:09 +0000
Received: by outflank-mailman (input) for mailman id 925541;
 Mon, 24 Mar 2025 13:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twi55-0003gq-TW
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:43:07 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaac303b-08b5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:43:06 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso47614625e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 06:43:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdaca8sm174465445e9.28.2025.03.24.06.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:43:05 -0700 (PDT)
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
X-Inumbo-ID: eaac303b-08b5-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742823786; x=1743428586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G4DNB1dx5ifmTN1sxouxw1mh0EjUJheHnd10f2QIf6w=;
        b=FUIlKnTLkDIMZaOjg+aE3mGO12UAX5fTaliolLf5CJwwGQs6RBWM64GNY4LrahmKyZ
         Gy2zk0q+uNgL4W2p0Xf/fuLMnwDH4i1aLJ2zrA8L8I8k8t6QO1iFJUBkz2XD1oRFH0yF
         +PLJV0PrqCpSw6vDV9djEOjIsamcOa1EeGaEg+EO7ixPbrZPCie1PQbdLC0LMNk6f+NE
         J0kGx+jxlLdQG70t9CGfTWSOI1JZKmQY6OOewb96hGA9avUZ76pBCRThWG6ZiZR6ZX3U
         6JK+w2KbHhRrTsWytSgm1pdu45l2WC5tOZ7Nb8NbFLyamsmL+3mRrBnPi55Bn+TeqDvA
         Yc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742823786; x=1743428586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4DNB1dx5ifmTN1sxouxw1mh0EjUJheHnd10f2QIf6w=;
        b=RKLR9LebyCKK1wFMQeQk7fTTx7JJRhI9GofdDEvINMwMptYEYc/o+sc0WjMznozyr1
         eh3L4gVe+Q+UKyH11tmSjjC5Km/8/CH6QDavvILgX+g9RjdBGJMUo0tOKYPvL3T26/wK
         qKPD4/d1Zj2OGPOqEkXUulVL3Wzj/5dkLRAr0CaYqN91DBsueRNsvhmdRI1Oh6wmAcqu
         xbXucNQVVguGUdSAazpfZuMV6Cy6Dh++Jrx3oMlgwQUQ+JoWNa361Cq9zpoNll/befdI
         u1OxkWVzDDf1Z7j3dhvC7yNIakOqTEG5/fY7ygLzvaq2OfQ2fL4TslLkF6/CK5Isdjhq
         qgOw==
X-Forwarded-Encrypted: i=1; AJvYcCXBIWdJ22LRJY2YgKxaaD07bevbfdgugQ5eXByBrmgw7Ll0tMBRjdUq5Wg0EYg4t/Rq9wvoK/isnss=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzofhSE0Y0veKqC5ClMJ4NVTQ+xVFc++0q/5Crowp0d5cqmF12z
	PN13w+aV6fxZZ9GoP/lyruDaP33Z4Sl8t90a6tAVCF3F1aYqF/96f4kWaXqr6A==
X-Gm-Gg: ASbGncub5qAjzrZ4qr6dINjJ3GEa4mG0ES6g2J9AFwqCRW7YLmLSkTqO4lGcrZGSqpQ
	1HjTyGJwgsz5XcmC30mqi0BMIandlWn+aQIXR6IeTao+FGL974OK39nko4xuFKCvfcHk2aF+SUu
	0hF44uyXWrvYJbBoXgqyabX2kPo63/vqap1iszdszMdf2dOJR1/JSRullBbyz1cbFiXkW6ImWaN
	NIEuBZHD5iTsm84b9PBt4EQtetwzsKVQ2hjVJ5DKPVfBuuPduZXACNPOlUPY78C4mvJRDzuwcH8
	K+JntunWne5sGE9cnLfWvdjSOuZbavuxSh1HrqNQ7IvYERFeHlLfbdvIRu2XpzW9Ga7KBF/xmNy
	E3WA/4WcF01pDptoMsWM2d7CgHp7aKA==
X-Google-Smtp-Source: AGHT+IEssfSEl8076fXpSwmMPHs7d9uCssoqUygGifnGP/f+i3wfjJGQBy2ZkftfJkuDmVYB8yjJvQ==
X-Received: by 2002:a05:600c:5021:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43d509f6307mr139336885e9.18.1742823786206;
        Mon, 24 Mar 2025 06:43:06 -0700 (PDT)
Message-ID: <3e2b42fa-a685-4f16-9fd9-094060b1c60d@suse.com>
Date: Mon, 24 Mar 2025 14:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
 <5190f71c-4a93-4f66-91d0-aec43a97ddab@epam.com>
 <15bea88c-8294-4164-83df-7ccdb61f9697@suse.com>
 <b1593e57-bb34-4aa4-b282-0f2de001c598@epam.com>
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
In-Reply-To: <b1593e57-bb34-4aa4-b282-0f2de001c598@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.03.2025 14:11, Oleksii Moisieiev wrote:
> Hi Jan,
> 
> On 24/03/2025 12:05, Jan Beulich wrote:
>> On 24.03.2025 10:00, Oleksii Moisieiev wrote:
>>> Hi Jan,
>>>
>>> Let me answer one of your comment. Please see below:
>>>
>>> On 11/03/2025 13:43, Jan Beulich wrote:
>>>> On 11.03.2025 12:16, Grygorii Strashko wrote:
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -526,6 +526,12 @@ S:	Supported
>>>>>    F:	xen/arch/arm/include/asm/tee/
>>> [snip]
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>>>    #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>>>    #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>>>>>    
>>>>> +#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>>>>> +
>>>>>    struct xen_arch_domainconfig {
>>>>>        /* IN/OUT */
>>>>>        uint8_t gic_version;
>>>>> @@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
>>>>>         *
>>>>>         */
>>>>>        uint32_t clock_frequency;
>>>>> +    /* IN */
>>>>> +    uint8_t arm_sci_type;
>>>>>    };
>>>> You're not re-using a pre-existing padding field, so I don't see how you
>>>> can get away without bumping XEN_DOMCTL_INTERFACE_VERSION.
>>> We are reusing an existing padding field in xen_domctl, which is defined
>>> as pad[128].
>>>
>>> The xen_arch_domainconfig structure is a part of the following domctl
>>> structures:
>>>
>>> - xen_domctl_createdomain
>>>
>>> - xen_domctl_getdomaininfo
>>>
>>> These structures are included in the union within xen_domctl, which
>>> defines pad[128] for padding.
>> Except that "an existing padding field" means a field which isn't just
>> there in space, but is also checked to be zero right now. That is, new
>> code setting the field to non-zero needs to properly get an error
>> indicator back from an older hypervisor.
> 
> I completely agree with you that XEN_DOMCTL_INTERFACE_VERSION should be 
> incremented
> 
> before the changes are merged. I just wanted to point out that we do not 
> exceed the size of the xen_domctl padding. If you are okay with the 
> fields we have added, then XEN_DOMCTL_INTERFACE_VERSION will be updated 
> in the next patch series.
> 
>> but is also checked to be zero right now.
> 
> Just out of curiosity, I have one more question: I couldn't find the 
> check you've mentioned. Could you point me to where Xen or
> the toolstack checks the domctl structure for 0? I would greatly 
> appreciate it if you could show me.

There's no such check here (as far as I'm aware), hence why the interface
version bump is necessary. There are _other_ padding fields which do have
appropriate checks, and hence could be assigned purpose without bumping
the interface version.

Jan

