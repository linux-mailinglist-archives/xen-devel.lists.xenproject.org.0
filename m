Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99489EE402
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855653.1268499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgKf-0002ZY-N0; Thu, 12 Dec 2024 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855653.1268499; Thu, 12 Dec 2024 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgKf-0002WY-K9; Thu, 12 Dec 2024 10:22:09 +0000
Received: by outflank-mailman (input) for mailman id 855653;
 Thu, 12 Dec 2024 10:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLgKd-0002WS-Mt
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:22:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f015a96a-b872-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:22:06 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so2891665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:22:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559eaf6sm12181355e9.20.2024.12.12.02.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:22:05 -0800 (PST)
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
X-Inumbo-ID: f015a96a-b872-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733998926; x=1734603726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c645PNElfeFM12UdgKMeAmcuHLZRg8JK7eBZ7/1+xnY=;
        b=eyUdZu1R3DNBlpuqXezjIl8BGqI4WGWmJREA9qpq2lRA4vzsxci9F/mwygsmZ2AVZy
         m++/2pYUAyjCa3PdY56ZJ5lzwT6HUX9vvcb6thsV5O8Ql48ae6tLoLythFJ/mPSnFHcI
         MlWaFjrr8qMQX+Q91N1YTE8KrmXMPPNKeXAMw6hYUJiLxVc1X15iKptHbZ8190MdhGI/
         Ax3Vur3yi4CWmMrB2oQO53BWPNX3qmO8VZtMQCnCRTJRZEdOj3ErNDtykKt5Uix0W4n0
         sI0urxnt1J0ePliiVlcEkG4mgtn/coxhM5/LxCdq9QlYWAkESZrEbMRrV3fwPOWBV2Wd
         gVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998926; x=1734603726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c645PNElfeFM12UdgKMeAmcuHLZRg8JK7eBZ7/1+xnY=;
        b=VJXqoyPeIzf3GN8IPAMsBKc0I8L7tuhagrn+jUYl74/d9J955VlxxHv7xDRgu1UJ5h
         2uFOOiJr6stq+DDjqlDG8bdAxFhf16YFWJbVvXa6UZSLFN2azC1iVNxzMWLzqg43r1vb
         PyrxVQxXhYMzF0TMECG59hfQ47AojqsphQ8CjzNpAP8v8ie3fHrVOExOBRAgw4AKADEy
         rel+pEuAVCIg7R5t8ruaLITnZjl6Kt5GfgzKhy0irnGxWwxecSYY9aIvNpHFtWcpagGj
         XfVsTAfNzSZHYdqe9IQjbDBkbOnE0FFxuOIInc6I68EtAfowLukEBdgEkI+gE7KTtMHL
         idUw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUeSQLZ6noYGH0txsMeVj6tvi60RugEUeAiM7AYqwReLFmJi3JmXC3wkI6Z9x8NMgBtf2W2m0qWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygiq31Ee18R8o7kG0lKK9ze6QQ3LbZHpVrZT0CMKM8I90/79F8
	Ubc5vJK/egZw/L0LgnmIgmqNXUjmbNw9mqggkhlqakxbbdqbz4WVDs6MnoBbRg==
X-Gm-Gg: ASbGncurFvIA/ya0shLoZrq7W3+FgQ8cQnUZ1sjPb584UkwEXio9ZmJKws2guadwNwp
	RXrlVkfKEIVtRpMv2JN+L8yy51xen+bHWeB/A8WudiQC+yAjIYVa6gGgx4z9ILEqc8ffxePGvI9
	oR5mEHnI+j0m2wmAbmIB9ZUjqgXgbCzHS0I0IZQ04TXTcNzIuQEUppgdZAyOlu//Tot/YpLxqi7
	+7TQrbg9kBlcBgzq45tMZPgoVeE8ZTb9NpmLXdDxofXfaYUaUD+6SsDFSMPVXpgTPRIGnnI+JnJ
	BavSV1C21TiYgZZLNI4CJElQjxNP7HOc9fknW3b6TQ==
X-Google-Smtp-Source: AGHT+IEEpl5WnfVqD5Eyl1PeCZc5X0OZKvY51dNZlWpRgEl0ZIGnyTAoD5sXkKoKOCY9S9gRMv6sMg==
X-Received: by 2002:a05:600c:4450:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-4361c346a7emr52444405e9.2.1733998926105;
        Thu, 12 Dec 2024 02:22:06 -0800 (PST)
Message-ID: <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
Date: Thu, 12 Dec 2024 11:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
To: Thierry Escande <thierry.escande@vates.tech>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 linux-kernel@vger.kernel.org
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
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
In-Reply-To: <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 19:20, Thierry Escande wrote:
> Hi Jan,
> 
> On 09/12/2024 11:04, Jan Beulich wrote:
>> On 04.12.2024 18:14, Thierry Escande wrote:
>>> With change 9f40ec84a797 (xen/swiotlb: add alignment check for dma
>>> buffers), the driver mpt3sas fails to load because it cannot allocate
>>> its DMA pool for an allocation size of ~2,3 MBytes. This is because the
>>> alignement check added by 9f40ec84a797 fails and
>>> xen_swiotlb_alloc_coherent() ends up calling
>>> xen_create_contiguous_region() with a size order of 10 which is too high
>>> for the current max value.
>>>
>>> This patch increases the MAX_CONTIG_ORDER from 9 to 10 (4MB) to allow
>>> such allocations.
>>>
>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>> ---
>>>  arch/x86/xen/mmu_pv.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>>> index 55a4996d0c04..7f110740e1a2 100644
>>> --- a/arch/x86/xen/mmu_pv.c
>>> +++ b/arch/x86/xen/mmu_pv.c
>>> @@ -2200,7 +2200,7 @@ void __init xen_init_mmu_ops(void)
>>>  }
>>>  
>>>  /* Protected by xen_reservation_lock. */
>>> -#define MAX_CONTIG_ORDER 9 /* 2MB */
>>> +#define MAX_CONTIG_ORDER 10 /* 4MB */
>>>  static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
>>
>> While lacking respective commentary, bumping this value imo also needs to
>> take into account Xen itself, at least commit-message-wise. The bumping is
>> fine for Dom0 in any event. It is also fine for DomU-s with the defaults
>> built into the hypervisor (orders 12 and 10 respectively for x86 and Arm),
>> yet especially for Arm (and in the future PPC and RISC-V) any further
>> bumping would be less straightforward.
> 
> Thanks for pointing this out. On the Xen side, CONFIG_CTLDOM_MAX_ORDER
> and CONFIG_HWDOM_MAX_ORDER seem big enough on all architectures. But I
> see CONFIG_DOMU_MAX_ORDER set to 9 (also all archs). Won't that be a
> problem for drivers trying to allocate more than that from a domU ?

A driver assumes a (physical) device to be in the DomU, at which point it
is CONFIG_PTDOM_MAX_ORDER which applies (PT standing for pass-through).

>> However - does the driver really need this big a contiguous chunk? It
>> would seem far more desirable to me to break that up some, if possible.
> 
> Since this works on bare metal I'm afraid the driver maintainer (mpt
> fusion driver) will just tell me to fix Xen.

Well. The bigger such allocations, the larger the risk that on systems
that have been up for a while such allocations can't be fulfilled anymore
even in the bare metal case.

Jan

