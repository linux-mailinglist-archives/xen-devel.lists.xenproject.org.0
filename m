Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD41952E27
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 14:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778039.1188099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seZOy-0000NA-JS; Thu, 15 Aug 2024 12:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778039.1188099; Thu, 15 Aug 2024 12:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seZOy-0000LT-Ge; Thu, 15 Aug 2024 12:16:24 +0000
Received: by outflank-mailman (input) for mailman id 778039;
 Thu, 15 Aug 2024 12:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seZOx-0000LN-1E
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 12:16:23 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e3a8b3e-5b00-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 14:16:20 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f3b8eb3df5so5874591fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 05:16:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f92dsm813454a12.60.2024.08.15.05.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 05:16:19 -0700 (PDT)
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
X-Inumbo-ID: 2e3a8b3e-5b00-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723724180; x=1724328980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GsR8ZL78tB2dFaI1XI1FBjlIiJxvI9ZB1N762qE70eo=;
        b=GjAUIXSbVMa07QiMcj7WdDsysuMV1LFjIwFkQpVpHCpQNIWEdGBdaFJG7AvApTB0aT
         hQXUmxpoDybUog4bMazB8UKl9YPOhm/9Kt5K0Q7Ng9nhfE47rEf7Er50gF4uKB3u4GN0
         97h43QPtfiLFTFuIWlHEk1jyicEjK2mpsjEBj5LO/rQHDLjvMuWH2/oqpAuACENT9MZ3
         vY/i8rNVaYfepoONtVIzdH0JE8YGTh0agEYDwGlxgR9VVkyV95mphTjDNoFzJNlM7ic7
         wwH5RbxW5fFXO8zpAJNJaVHRSd/klFyj84X0fzWcSyxiTNUfpSHYkPYThoYLGaujYUKS
         auMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723724180; x=1724328980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsR8ZL78tB2dFaI1XI1FBjlIiJxvI9ZB1N762qE70eo=;
        b=MjK9dAfbYJPhy/Bdwz2bD587hGtdDNTvalq0sF1uS0JbOwtDzaITO+RF3PYrdwMnZy
         QOowVbsBLLrErexE287FQtGQKpn5nwv80ApOfxLm5VfQPRGc65u9DXahKVngTT2BRGUn
         a7mGYrsg3OZ5BpJO4CHu0wY2VE7t1WlAhaYAAyFw1ola7KsMWGppSBcwwh4g4bTDVerq
         n1Md0HEAEwgtcrwIaD6YUFyHnFj70DcOxP5WIM3FjZ0IHADddlHhsXi8DkGi2cXHS5db
         s+2SXf/MRmhMaUi9GZQ3rPy2KaUhpHprCGE70iN+ygZ/r/PaprTD9ETjB53jQdY+ci5J
         i3hg==
X-Forwarded-Encrypted: i=1; AJvYcCVpiCx+izANdfQmFAgpKqUFu+zKlhPKw0Hv2PGWrBBrN8by/Sa99dh6YMOS7lMYbBVd5CpabtNpOZuZBfrJae16i4T9MW46M/u/eMEDqx0=
X-Gm-Message-State: AOJu0Yz5yF6wK4lNASED47Sun7WvhhYS/HJ4ZuoVAZ91bc1LZ1KDyJhV
	FEL/Nvhe2FIxBckBGDA9Znsmgetp8q+awbVtnKKO8lezNUkvXXPkEWtrNYrNEA==
X-Google-Smtp-Source: AGHT+IE4LsrnJ4MYvocKdfbqpxMTxdeZuuNcXyKeTA1PdPi0TcG+1ayUrLnHBwtznCYjbTbIm/UKjw==
X-Received: by 2002:a05:651c:4ca:b0:2f3:b76c:25c4 with SMTP id 38308e7fff4ca-2f3b76c2731mr10676201fa.37.1723724179807;
        Thu, 15 Aug 2024 05:16:19 -0700 (PDT)
Message-ID: <2ded848e-f2a5-4005-b4c6-09014a92122c@suse.com>
Date: Thu, 15 Aug 2024 14:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
 <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
 <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
 <be47249638cbae5e057279acd9a3464c218fbac8.camel@gmail.com>
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
In-Reply-To: <be47249638cbae5e057279acd9a3464c218fbac8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 13:21, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-15 at 10:09 +0200, Jan Beulich wrote:
>> On 14.08.2024 18:50, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
>>>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>>>> RISC-V detects superpages using `pte.x` and `pte.r`, as there
>>>>> is no specific bit in the PTE for this purpose. From the RISC-V
>>>>> spec:
>>>>> ```
>>>>>   ...
>>>>>   4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go
>>>>> to
>>>>> step 5.
>>>>>      Otherwise, this PTE is a pointer to the next level of the
>>>>> page
>>>>> table.
>>>>>      ... .
>>>>>   5. A leaf PTE has been found.
>>>>>      ...
>>>>>   ...
>>>>> ```
>>>>>
>>>>> The code doesn’t support super page shattering so 4KB pages are
>>>>> used as
>>>>> default.
>>>>
>>>> ... you have this. Yet still callers expecting re-mapping in the
>>>> (large)
>>>> range they map can request small-page mappings right away.
>>> I am not sure that I fully understand what do you mean by "expcting
>>> re-
>>> mapping".
>>
>> Right now you have callers pass PTE_BLOCK when they know that no
>> small
>> page re-mappings are going to occur for an area. What I'm suggesting
>> is
>> that you invert this logic: Have callers pass PTE_SMALL when there is
>> a possibility that re-mapping requests may be issued later. Then,
>> later, by simply grep-ing for PTE_SMALL you'll be able to easily find
>> all candidates that possibly can be relaxed when super-page
>> shattering
>> starts being supported. That's going to be easier than finding all
>> instances where PTE_BLOCK is _not_used.
> So if I understand correctly. Actually nothing will change in algorithm
> of pt_update() and only PTE_SMALL should be introduced instead of
> PTE_BLOCK. And if I will know that something will be better to map as
> PTE_SMALL to not face shattering in case of unmap (for example) I just
> can map this memory as PTE_SMALL and that is it?

That is it.

>>>>> +    spin_unlock(&xen_pt_lock);
>>>>
>>>> Does this really need to come after fence and flush?
>>> I think yes, as page table should be updated only by 1 CPU at the
>>> same
>>> time. And before give ability to other CPU to update page table we
>>> have
>>> to finish a work on current CPU.
>>
>> Can you then explain to me, perhaps by way of an example, what will
>> go
>> wrong if the unlock is ahead of the flush? (I'm less certain about
>> the
>> fence, and that's also less expensive.)
> pt_update() will be called for interleaved region, for example, by
> different CPUs:
> 
>                      pt_update():
> CPU1:                                    CPU2:
>  ...                                spin_lock(&xen_pt_lock);
> RISCV_FENCE(rw, rw);                 ....
> 
> /* After this function will be
>    executed the following thing
>    can happen ------------------>  start to update page table
> */                                 entries which was partially      
> spin_unlock(&xen_pt_lock);         created during CPU1 but CPU2       
> ....                               doesn't know about them yet        
> ....                               because flush_tlb() ( sfence.vma ) 
> ....                               wasn't done      
> ....                                                                  
> flush_tlb_range_va();

Not exactly: CPU2 knows about them as far as the memory used / modified
goes, and that's all that matters for further page table modifications.
CPU2 only doesn't know about the new page table entries yet when it comes
to using them for a translation (by the hardware page walker). Yet this
aspect is irrelevant here, if I'm not mistaken.

Jan

