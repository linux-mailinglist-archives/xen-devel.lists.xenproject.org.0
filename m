Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975E941198
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767679.1178365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlhN-0000Y3-2U; Tue, 30 Jul 2024 12:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767679.1178365; Tue, 30 Jul 2024 12:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlhM-0000WT-VW; Tue, 30 Jul 2024 12:11:24 +0000
Received: by outflank-mailman (input) for mailman id 767679;
 Tue, 30 Jul 2024 12:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYlhL-0000WN-J7
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:11:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5527d41-4e6c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:11:21 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7d2a9a23d9so493266766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:11:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de06sm635379466b.71.2024.07.30.05.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:11:20 -0700 (PDT)
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
X-Inumbo-ID: d5527d41-4e6c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722341481; x=1722946281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFHEc9VLs6aD6v7ubFKDDN9rjvCJlMDm8nYff6mJLpM=;
        b=T5z4fjSTW4g4jCVNyktoJy3occ3tHFt6IeN+EcLIoravKGsOyBSJ+iVYsLjikrdi3h
         EYzzArNlnZCL81hoSZT/JVVYsbcq5y+EuA4KQK1e9xnePd1fJfZY1zScNxFlsrPJM0DK
         ObIEYQjMAGv2r2HLPeZX1pYIJw4PXFaUXb3yh31ViOjFtI/Kfusbh+kjWlkaN5/h0ULh
         xYN4tAhjcv3IzoyAO8V4Q8UZ36B0W7byjgeBWoBvcTVOfJx/7l/u4LY78dQT7mwsLD2w
         YF6KGTCLEy7GWtkN2d8XKThZWfwuKQehQAgn2JDc8yMvhmx+M5h8sFi/ugJVe0iHrFaH
         j64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341481; x=1722946281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFHEc9VLs6aD6v7ubFKDDN9rjvCJlMDm8nYff6mJLpM=;
        b=LKp7c7CBJGV813eA57X6ER0wfA5rsQjHiGbCMQbXVZ5JC4qzr8DwCcHorTZ6i5xj65
         SshMSArxuAyYZbzN+3QRqGk4VdZZx1eTnx9fOPzXjdEu3UTYc6e/q56t9zwcE0qlJv0Y
         V0eCEUvvT7D6jUqGaz+8DtaQS6Ct7qC5TwoDOsekcgIbI1pd72vh86oYiPcnL40ec6Sa
         NMMPtJ+yB0AUS85S1S2+0va26vZVtXQror0lgnPsyhisilnD3FszquiZr/uSMozT05Yj
         iiIb27c+msYZcqDoApEy1yBerq2rOvpAXfzj+GbIq+i2MKk+RXeirmkZhCP02+2Xa9xg
         3MRg==
X-Forwarded-Encrypted: i=1; AJvYcCUtUDuIiyZy4duNRjtK5fDgkHiOzl1AmLJRuaCotAFKDAlia6TLbU/8+sl5X9vX7L2VWx9cSGW6kaegRexPL4KvZQkOQnlS6tQNRWOoSKE=
X-Gm-Message-State: AOJu0YzifMgZtq1zGj+43I6PvPZPV4v8WNNXIVg/Z8arPFj6suorF4V8
	ZUDa3skNdlUIKnuAgR3o61PODrK9BIvwO8OpChQq8pKomRrDr8X1R7H7kQ0+Fw==
X-Google-Smtp-Source: AGHT+IG+0LM30RBDwqeSFQ1Rtl4XfhNktvMPtzGlh2QKUMpH1VUL6k3FFvWBbPLp9Z4d4rtxLP1GoA==
X-Received: by 2002:a17:907:7286:b0:a7c:4095:ccb6 with SMTP id a640c23a62f3a-a7d3fff71eemr861557166b.16.1722341480899;
        Tue, 30 Jul 2024 05:11:20 -0700 (PDT)
Message-ID: <9ed45d6d-5fdc-4754-908c-1d29b66b850a@suse.com>
Date: Tue, 30 Jul 2024 14:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
 <8b8b0304-9f6f-4ded-a451-edc8fdd0e52a@suse.com>
 <2803670c49bdce4ef5982e7d149c77dda0701a31.camel@gmail.com>
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
In-Reply-To: <2803670c49bdce4ef5982e7d149c77dda0701a31.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 13:25, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-30 at 09:49 +0200, Jan Beulich wrote:
>> On 29.07.2024 18:11, oleksii.kurochko@gmail.com wrote:
>>> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>>>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>>>> @@ -81,6 +82,14 @@ static inline void
>>>>> flush_page_to_ram(unsigned
>>>>> long mfn, bool sync_icache)
>>>>>      BUG_ON("unimplemented");
>>>>>  }
>>>>>  
>>>>> +/* Write a pagetable entry. */
>>>>> +static inline void write_pte(pte_t *p, pte_t pte)
>>>>> +{
>>>>> +    RISCV_FENCE(rw, rw);
>>>>> +    *p = pte;
>>>>> +    RISCV_FENCE(rw, rw);
>>>>> +}
>>>>
>>>> Why the first of the two fences? 
>>> To ensure that writes have completed with the old mapping.
>>
>> Wait: There can certainly be uncompleted writes, but those must have
>> walked the page tables already, or else a (synchronous) fault could
>> not be delivered on the originating store instruction. Or am I
>> misunderstanding how paging (and associated faults) work on RISC-V?
> I am not sure that I correctly understand the part regarding (
> synchronous ) fault. Could you please come up with an example?
> 
> If something during page table walk will go wrong then a fault will be
> raised.

On the very insn, with subsequent insns not having started executing
(from an architectural perspective, i.e. leaving aside speculation).
That is what my use of "synchronous" meant.

> My initial intension was to be sure if I will be writing to an actively
> in-use page table that other cores can see at the time then fences
> above are required. It is not the case for now as we have only one CPUs
> but I assume that it will be a case when SMP will be enabled and more
> then one CPU will be able to work with the same page table.

Would that first fence really help there? The other CPU could use
the page tables in the window between the fence and the write. My
understanding of the need for fences is for them to be used at times
where ordering of memory accesses matters. For the moment I don't
see this as an aspect for the 1st fence here, but I may be
overlooking something.

>>>>> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned
>>>>> long)&xen_fixmap),
>>>>> PTE_TABLE);
>>>>
>>>> I'm a little puzzled by the use of LINK_TO_LOAD() (and
>>>> LOAD_TO_LINK()
>>>> a
>>>> little further up) here. Don't you have functioning __pa() and
>>>> __va()?
>>> No, they haven't been introduced yet.
>>
>> So you're building up more technical debt, as the use of said two
>> constructs really should be limited to very early setup. Aiui once
>> you have functioning __va() / __pa() the code here would want
>> changing?
> 
> Ideally yes, it would want to changed.
> 
> Would it be the better solution to define __va() and __pa() using
> LOAD_TO_LINK()/LINK_TO_LOAD() so when "real" __va() and __pa() will be
> ready so only definitions of __va() and __pa() should be changed.

Well, that's something you're in a better position to answer, as it
depends on the ordering of subsequent work of yours.

Jan

