Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E897953724
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 17:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778162.1188199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secMr-0002JX-MG; Thu, 15 Aug 2024 15:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778162.1188199; Thu, 15 Aug 2024 15:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secMr-0002Gi-J0; Thu, 15 Aug 2024 15:26:25 +0000
Received: by outflank-mailman (input) for mailman id 778162;
 Thu, 15 Aug 2024 15:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1secMq-0002GT-IZ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 15:26:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb196198-5b1a-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 17:26:23 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so1350773a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 08:26:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f05dsm1010345a12.78.2024.08.15.08.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 08:26:22 -0700 (PDT)
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
X-Inumbo-ID: bb196198-5b1a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723735583; x=1724340383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pqfl20bKXAXhb/ludWp+7Qy3i76y1mV2/EVnviux2DE=;
        b=Bz3JpoRgaeUX70OnkFX+aEdv4yocFAw4BhYCy5Qn/+cWDUPBraHjJHXa0k4jRUnCsD
         VkI3Oisb+SnCd9txBtpsTB54F5IaV7oFjN2bJlsfxWPABnQAGjnQlZofTCfXh1rQ/dUQ
         Yw7LILx3A9moYx81K+Vk6HnEKN2Qd/cqELpzHIZXxCL+jXte6OsYh/boWcnsmZCpbMMj
         CSp22gqXxUA+7f1dG9pfUnvNjd4toaaoptX6D2JORQZn7wteLFRhc1m+SeLzsKDXNpo1
         osWkwYwmhFwS/N4UE+8ncrI4bMhKjp71c26CM0BdIAbTwKg3KqiMVw10AXo+RbgJMjkw
         6K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735583; x=1724340383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqfl20bKXAXhb/ludWp+7Qy3i76y1mV2/EVnviux2DE=;
        b=N2YWyOnod3Gv2ZPNQSu/hXuR3pkJIx2DaIOl6ysej3crnWlBmaENdbkace74oKLDJf
         JWLxQ5g6/mE2KB71nRkPD6/T8RHFr5s9czHTfCVAtIfOX27lbt2+1c8CQ/ctRVNMmthV
         QiePrijCp/+IEt8P/M7IZ47QdlV3eE0JFPcyul3j1s9fF2IazP6LMOdoGlksL+tg590l
         zBZ5gORxxHQX6kFJmdColDscC0EnCMergBJiUrG/3B8XUnjAKhdAEBzrWTSONhOvqH5Q
         8GcQOq0YeWx5vNPgHyK1XfxZU9/+jBNLnUX97WCJeG5npcm7m6xSeqEh6oVx1mI7RJD5
         w5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXBnGe1K02DmNRdirbgLY8HtGvrJyzR1gYYxzV8kdEKKL+YIkRjD9NztgfKYdOQSSv3y/RLGkjYKw2B5eQy0yi7oHsEEJON0Xlnk20BkWE=
X-Gm-Message-State: AOJu0Yy6AKdVrY2q9tYMLf8N8hVmTfn/EzkpspyNW8mCG1X2ylR7lNw7
	YaSnGvC4/PJxOyX+QDnzVBf9ZoFnotARhkXO8pu7t43IyaWWFWxQme/7KCkF4w==
X-Google-Smtp-Source: AGHT+IFteGmoDPDgtq4H6FSpkf2a6WeQPwxSmR4CzjuhjnXYcAYH3ogip/PUM2SURvIb293Hz8mPFQ==
X-Received: by 2002:a05:6402:34cc:b0:5a3:e652:d59 with SMTP id 4fb4d7f45d1cf-5bea1beaa8dmr4725103a12.0.1723735583189;
        Thu, 15 Aug 2024 08:26:23 -0700 (PDT)
Message-ID: <63af73be-d95e-47d5-bfbe-7f0304118a17@suse.com>
Date: Thu, 15 Aug 2024 17:26:21 +0200
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
 <2ded848e-f2a5-4005-b4c6-09014a92122c@suse.com>
 <48fc698708a87fed986cbb6526a6422bae488823.camel@gmail.com>
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
In-Reply-To: <48fc698708a87fed986cbb6526a6422bae488823.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 15:34, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-15 at 14:16 +0200, Jan Beulich wrote:
>> On 15.08.2024 13:21, oleksii.kurochko@gmail.com wrote:
>>> On Thu, 2024-08-15 at 10:09 +0200, Jan Beulich wrote:
>>>> On 14.08.2024 18:50, oleksii.kurochko@gmail.com wrote:
>>>>> On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
>>>>>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>>>>>> RISC-V detects superpages using `pte.x` and `pte.r`, as
>>>>>>> there
>>>>>>> is no specific bit in the PTE for this purpose. From the
>>>>>>> RISC-V
>>>>>>> spec:
>>>>>>> ```
>>>>>>>   ...
>>>>>>>   4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x =
>>>>>>> 1, go
>>>>>>> to
>>>>>>> step 5.
>>>>>>>      Otherwise, this PTE is a pointer to the next level of
>>>>>>> the
>>>>>>> page
>>>>>>> table.
>>>>>>>      ... .
>>>>>>>   5. A leaf PTE has been found.
>>>>>>>      ...
>>>>>>>   ...
>>>>>>> ```
>>>>>>>
>>>>>>> The code doesn’t support super page shattering so 4KB pages
>>>>>>> are
>>>>>>> used as
>>>>>>> default.
>>>>>>
>>>>>> ... you have this. Yet still callers expecting re-mapping in
>>>>>> the
>>>>>> (large)
>>>>>> range they map can request small-page mappings right away.
>>>>> I am not sure that I fully understand what do you mean by
>>>>> "expcting
>>>>> re-
>>>>> mapping".
>>>>
>>>> Right now you have callers pass PTE_BLOCK when they know that no
>>>> small
>>>> page re-mappings are going to occur for an area. What I'm
>>>> suggesting
>>>> is
>>>> that you invert this logic: Have callers pass PTE_SMALL when
>>>> there is
>>>> a possibility that re-mapping requests may be issued later. Then,
>>>> later, by simply grep-ing for PTE_SMALL you'll be able to easily
>>>> find
>>>> all candidates that possibly can be relaxed when super-page
>>>> shattering
>>>> starts being supported. That's going to be easier than finding
>>>> all
>>>> instances where PTE_BLOCK is _not_used.
>>> So if I understand correctly. Actually nothing will change in
>>> algorithm
>>> of pt_update() and only PTE_SMALL should be introduced instead of
>>> PTE_BLOCK. And if I will know that something will be better to map
>>> as
>>> PTE_SMALL to not face shattering in case of unmap (for example) I
>>> just
>>> can map this memory as PTE_SMALL and that is it?
>>
>> That is it.
>>
>>>>>>> +    spin_unlock(&xen_pt_lock);
>>>>>>
>>>>>> Does this really need to come after fence and flush?
>>>>> I think yes, as page table should be updated only by 1 CPU at
>>>>> the
>>>>> same
>>>>> time. And before give ability to other CPU to update page table
>>>>> we
>>>>> have
>>>>> to finish a work on current CPU.
>>>>
>>>> Can you then explain to me, perhaps by way of an example, what
>>>> will
>>>> go
>>>> wrong if the unlock is ahead of the flush? (I'm less certain
>>>> about
>>>> the
>>>> fence, and that's also less expensive.)
>>> pt_update() will be called for interleaved region, for example, by
>>> different CPUs:
>>>
>>>                      pt_update():
>>> CPU1:                                    CPU2:
>>>  ...                                spin_lock(&xen_pt_lock);
>>> RISCV_FENCE(rw, rw);                 ....
>>>
>>> /* After this function will be
>>>    executed the following thing
>>>    can happen ------------------>  start to update page table
>>> */                                 entries which was partially     
>>> spin_unlock(&xen_pt_lock);         created during CPU1 but
>>> CPU2       
>>> ....                               doesn't know about them
>>> yet        
>>> ....                               because flush_tlb() ( sfence.vma
>>> ) 
>>> ....                               wasn't done      
>>> ....                                                               
>>>    
>>> flush_tlb_range_va();
>>
>> Not exactly: CPU2 knows about them as far as the memory used /
>> modified
>> goes, and that's all that matters for further page table
>> modifications.
>> CPU2 only doesn't know about the new page table entries yet when it
>> comes
>> to using them for a translation (by the hardware page walker). Yet
>> this
>> aspect is irrelevant here, if I'm not mistaken.
> And it isn't an issue that CPU2 will add these new page table entries
> again during execution of CPU2's pt_update()?

Add these page table entries again? That's only going to happen due to
another bug somewhere, I suppose. And it would be as much (or as little)
of an issue if that happened right after dropping the lock.

Jan

