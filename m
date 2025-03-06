Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCEFA54FFE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903855.1311793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDfW-0005Qn-NH; Thu, 06 Mar 2025 16:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903855.1311793; Thu, 06 Mar 2025 16:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDfW-0005OP-JT; Thu, 06 Mar 2025 16:01:54 +0000
Received: by outflank-mailman (input) for mailman id 903855;
 Thu, 06 Mar 2025 16:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqDfV-0005OH-0q
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:01:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 516e040f-faa4-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 17:01:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so10009875e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 08:01:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba679sm2412408f8f.8.2025.03.06.08.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 08:01:50 -0800 (PST)
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
X-Inumbo-ID: 516e040f-faa4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741276911; x=1741881711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uLWpTGVPbP54zZg0oH2MJOXMXr6oA2WmY/1G3fBO8CI=;
        b=TeXC7/hPn4MEk/DKxeVwcbvf6lhIlsJ7mfIv3DP/HPTmB8SdxIHjpmnF/ZjrlGThB/
         bwEPx5VxH0VFpNVwMHI6V4p3sOkOcSRGlifHOUvhQJJ7CfD2WSKziy0tP/HiyBQPk2b4
         wtihJgGjsZ+EJDmBTLv6vpaUYkBF48Gh3SDdiTg05L4JlzYbQZIsqnovJQSW04+TTuid
         PnkuiyL32Rh2Ux6aadQSrvi0wxKbB2RwOzp/pH/t5WHEmcG6jQiWhLGa2WZ3sDEgP1p7
         py6Dw6DM5Y/Qkr2GEDvOIEOpOz9TqUFvkh/A0EjRQwhTGAbEvduSVpyOg4yZV5nMBp99
         zY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276911; x=1741881711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLWpTGVPbP54zZg0oH2MJOXMXr6oA2WmY/1G3fBO8CI=;
        b=B9zgPT7UGYfMC4UYTXiui9RwLBqBViOkgHV1OgnYdekPDqrEhyGm6Ca7TXMpnriOxC
         Xv+DVPsUXFlUPglOthozRwHUw/ZcZ+DhUVzugQyJ7o5aQRM8QaUtkI+NTJq3cDZ9S6+x
         LDJJpnVlIxWbgSoy+DTdR2mCauKB0V7+UKuEsHZ8D29LPkWY+0OqOGTo2tYKV+wZr82D
         ggLpuCFG8nxa2KlKu9Wxj9RF2nd5iJpQbZ7nBu3Ae20Xc+EDJBx2wYJ799gK8KJ2L4g5
         JF5a5oGL9xTUjkXNa1BofGBxiSEoVqfLkPX77WH1FpzW3JPay8vLAjg3FikYEG1EhHGb
         eIIw==
X-Forwarded-Encrypted: i=1; AJvYcCXEsiaDvPmqoQIf+v7Ee/d0knQ6bbOBPNsXI22cqv8XZ7+WaKj4kNRuaYMh851btZQZgWTyDtezYKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7NV/9L0mHRZYMk7UM8roWVIZVk8787X1uj4QnxbVBPhYeXSKq
	S8t3BACHhVVre0/rQifou1gySbNQSCkyzSs/0JmkSA9ZqlAHvtQOEi5I2abfhg==
X-Gm-Gg: ASbGnctRAiR9fhKlE8BNYpUFiixZXaNZRzJRU1y6M25lYv5v1Dmcr+Q59he7gtwRtGu
	fJGO2WNReDnGrVLosWH3RdGdApH15UIFBvp/wlcgfj4vb+Y6jygSOwCFdZyFalf/YfzceGlj99K
	Lw2es9VgH3vKidFu8KRUe6rlmNMe6fkO6iEgg9t9woQtyulTRsNnDivVSK4WW8IL075RO9W7hwU
	Yo6kqUNY7nNb5fRvoJVfCX0kSeCrcC0qYA1PVszAtgoI3KxShAot706vK/apHCRb32XJBM3TI/d
	ec7y3P+6Fegig5pymC4qwoc9TlekBHxZ5BoB6E5HunjoeJ21NXrmmAHsbJlX1PG1j6PGiOLIYHW
	J6jyRtNquX0kJ5Ckd+C50/OHJYdhXDQ==
X-Google-Smtp-Source: AGHT+IF+FcAkAzRvhpz1+CA+MJBeFMdbc44Sb1UYPzAD/TcS84LfYFSoGjniqXi9+kif+MFNSeJ6mQ==
X-Received: by 2002:a05:600c:3544:b0:43b:d6ec:3d57 with SMTP id 5b1f17b1804b1-43c601cfe21mr167375e9.15.1741276911067;
        Thu, 06 Mar 2025 08:01:51 -0800 (PST)
Message-ID: <82b6ef38-2977-4087-ab92-965e64ae4c8a@suse.com>
Date: Thu, 6 Mar 2025 17:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/apic: remove delivery and destination mode
 fields from drivers
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-2-roger.pau@citrix.com>
 <f53539b7-ca49-465c-8aeb-205a489130ea@suse.com>
 <Z8nFQoHzXdeedN6j@macbook.local>
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
In-Reply-To: <Z8nFQoHzXdeedN6j@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 16:54, Roger Pau Monné wrote:
> On Thu, Mar 06, 2025 at 04:33:37PM +0100, Jan Beulich wrote:
>> On 06.03.2025 15:57, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/genapic/bigsmp.c
>>> +++ b/xen/arch/x86/genapic/bigsmp.c
>>> @@ -46,8 +46,6 @@ static int __init cf_check probe_bigsmp(void)
>>>  
>>>  const struct genapic __initconst_cf_clobber apic_bigsmp = {
>>>  	APIC_INIT("bigsmp", probe_bigsmp),
>>> -	.int_delivery_mode = dest_Fixed,
>>> -	.int_dest_mode = 0, /* physical delivery */
>>>  	.init_apic_ldr = init_apic_ldr_phys,
>>>  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>> --- a/xen/arch/x86/genapic/default.c
>>> +++ b/xen/arch/x86/genapic/default.c
>>> @@ -16,8 +16,6 @@
>>>  /* should be called last. */
>>>  const struct genapic __initconst_cf_clobber apic_default = {
>>>  	APIC_INIT("default", NULL),
>>> -	.int_delivery_mode = dest_Fixed,
>>> -	.int_dest_mode = 0, /* physical delivery */
>>>  	.init_apic_ldr = init_apic_ldr_flat,
>>>  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>> --- a/xen/arch/x86/genapic/x2apic.c
>>> +++ b/xen/arch/x86/genapic/x2apic.c
>>> @@ -140,8 +140,6 @@ static void cf_check send_IPI_mask_x2apic_cluster(
>>>  
>>>  static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
>>>      APIC_INIT("x2apic_phys", NULL),
>>> -    .int_delivery_mode = dest_Fixed,
>>> -    .int_dest_mode = 0 /* physical delivery */,
>>>      .init_apic_ldr = init_apic_ldr_phys,
>>>      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>> @@ -163,8 +161,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
>>>       * The following fields are exclusively used by external interrupts and
>>>       * hence are set to use Physical destination mode handlers.
>>>       */
>>> -    .int_delivery_mode = dest_Fixed,
>>> -    .int_dest_mode = 0 /* physical delivery */,
>>>      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>
>> Like we had it everywhere above, ...
>>
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1080,8 +1080,8 @@ static void __init setup_IO_APIC_irqs(void)
>>>               */
>>>              memset(&entry,0,sizeof(entry));
>>>  
>>> -            entry.delivery_mode = INT_DELIVERY_MODE;
>>> -            entry.dest_mode = INT_DEST_MODE;
>>> +            entry.delivery_mode = dest_Fixed;
>>> +            entry.dest_mode = 0;
>>
>> ... here and below these zeros would better gain a comment, or be expressed
>> as e.g. (untested) MASK_EXTR(APIC_DEST_PHYSICAL, APIC_DEST_MASK).
> 
> I've started adding those comments, but then I got the impression they
> where a bit redundant, many of the setting of the fields didn't have a
> matching comment.  I was even tempted to just not setting the field at
> all, seeing as the structure is zeroed.
> 
> Also this is the IO-APIC RTE, so it feels a bit out of place to use
> the local APIC defines?

Maybe. There is a certain level of correlation, but yes, it may end up
being confusing.

> I will add a comment if you are fine with it.

I am.

Jan

