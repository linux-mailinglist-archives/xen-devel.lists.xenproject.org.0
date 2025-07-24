Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33BB1027E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055399.1423826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqqN-0006Me-Fm; Thu, 24 Jul 2025 07:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055399.1423826; Thu, 24 Jul 2025 07:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqqN-0006LC-Bw; Thu, 24 Jul 2025 07:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1055399;
 Thu, 24 Jul 2025 07:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqqL-0006Kq-NG
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:58:21 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6ad731c-6863-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 09:58:20 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45610582d07so4337935e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:58:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f686sm9721775e9.14.2025.07.24.00.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:58:18 -0700 (PDT)
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
X-Inumbo-ID: f6ad731c-6863-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753343899; x=1753948699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EIYypEu29ojAWmvu3Q8/gou0F4ucpqvLVaw/qdq0xYQ=;
        b=EUwIb9LJ5aalbOmzgFlXGA4JcQFqA2iytk1EKkIy6MRa8l7VKQorxWlqbnXJd3b5Cs
         M0sbguEykxUX9Zy5+QIImJD0VXJ9WTGJ6N0cW3J3j+Ax9uT+1W1cG0g+dn630Cv/SXyh
         9wjfeKXEKG/nWOBClfxpdK4gUh7ipY3YgrMJOHU0RkWsLsIRXO1bTCiqpjK8sXl6R7zM
         pzXhOTKL5iY7qwwFo4Uy8aVDtIdP0OvY+mcC797Ekn91aJi5v5K0zGd+FQyGSlkzmkTM
         01Iajvaq1p0prHAGwckHLokZZkcw0SRJiQyRLWoO9c9Qqsaubi/pw1OncASuqvO1KBNs
         IG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343899; x=1753948699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIYypEu29ojAWmvu3Q8/gou0F4ucpqvLVaw/qdq0xYQ=;
        b=VOdo6hqlQKEbBb4Ug8yT4JSu1OaGL/jlozUSmy/gtNYDoNnSFkgqz2XcBtOUv+O0N5
         n+s/jBzmBMdoriEZJIYDKadmEO6BkqgrQyNLLvotUXYhRCVRKsBd107ROKN9Fkekw6BB
         QeHmsq2l9yaga6iejQDeQdqMcj+cXmqv2CsVaC8cF7diABZatXaIh/wyOHIZ7Vwzfakv
         9TPc5rnPdmbA8e3Cagp6SBZq7CfOB2hLzRcRuRhSPOgje+oFUksoBu3t3mXda6hmrCDz
         hLpjfTqPK29T7Q7OtPrVRh+1RNQlSXfFnTDXzZl+1rG19TXchndGBKDmgMjs+FzDHuH7
         d/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUWmSbiWg/0OwR6CwYoTjesBOlTcttU7mWcgFOqa5fbWGclp+3eGm+qwrdh4xf8OyPevTrAztgq0g8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxouPAeF7Oo0upL5m36nWWrTLHfFVgDvrq8OaPsgJ5jIJDdAgT4
	BZ/8Sp7yAewZ2LIOzovVRw+ypZYB/b5Fzguwx/gzJXqTznflYc5nYvGDH4+g/5HAGA==
X-Gm-Gg: ASbGncu4axsjyyg3c5+Qr4O1/gVidmgkil/aLkzBSstBU4lzQSALXjjzPTLz697hwu1
	jA8AVYsf4evkN3owTX2t448/yqw1SknQj3IUCFTYX4BvBANWtpau/XFFevDRidZH6G12nQRxAgA
	ZFwFHdDUdM7/WqEgulX2T+KZnXz7ovaoaoVNVLJBdWQrWbe6FZVR/ZnFAXmrJsCc28DKtEsMJ3B
	kbD12sjURGiCkoPfFq+SJIJtV0uGRVigTqnClXBasz2TDFw2+ApuixUlHPTqIXlEJNecWBHZ93y
	616JF/uLhGEoTe6gjUYK3yII1c8AZ2b1+0gC/Ftm+gn8j/1yNzYVm0dZ6ztTqLZQEu2wi+vfNVt
	yNHOQm0K63Iua6tOdsQwJ/qQjsJyeIziH4PearEJEGmI4XLOXQ5VK3s8ab+/gloOHT3a5Jb64el
	jkLCGGS/4/EX2yo14siw==
X-Google-Smtp-Source: AGHT+IG9oGULCqILqvLI9UEJEE3mY6wmP8g1BKShOVqCJS8dEgfxyNA2Zvcg2oHZGK5h8rB/wNL4QA==
X-Received: by 2002:a05:600c:524a:b0:456:2285:ce7d with SMTP id 5b1f17b1804b1-45868d1bd2cmr50140655e9.18.1753343899223;
        Thu, 24 Jul 2025 00:58:19 -0700 (PDT)
Message-ID: <4e4df10d-0325-4c4f-a7ea-a5b672889bd8@suse.com>
Date: Thu, 24 Jul 2025 09:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/17] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7cdd3272f2eba32dfa00be4fd72da6921eac243d.1749555949.git.oleksii.kurochko@gmail.com>
 <9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com>
 <e2227002-e38c-41e1-8bea-7585138ec5ba@gmail.com>
 <0c1701ff-efe3-434f-97e0-4896707411b7@suse.com>
 <640d6862-4ea9-49ca-adb8-0fad5ceb1ff1@gmail.com>
 <6f88e20e-98dd-4d58-b459-5a67e2629f4c@suse.com>
 <d24d32b2-a4a4-4284-8b94-297d8dd08a76@gmail.com>
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
In-Reply-To: <d24d32b2-a4a4-4284-8b94-297d8dd08a76@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 21:51, Oleksii Kurochko wrote:
> 
> On 7/22/25 6:02 PM, Jan Beulich wrote:
>> On 22.07.2025 16:57, Oleksii Kurochko wrote:
>>> On 7/21/25 3:34 PM, Jan Beulich wrote:
>>>> On 17.07.2025 18:37, Oleksii Kurochko wrote:
>>>>> On 7/2/25 11:25 AM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> Add support for down large memory mappings ("superpages") in the RISC-V
>>>>>>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>>>>>>> can be inserted into lower levels of the page table hierarchy.
>>>>>>>
>>>>>>> To implement that the following is done:
>>>>>>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>>>>>>      smaller page table entries down to the target level, preserving original
>>>>>>>      permissions and attributes.
>>>>>>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>>>>>>      entries at lower levels within a superpage-mapped region.
>>>>>>>
>>>>>>> This implementation is based on the ARM code, with modifications to the part
>>>>>>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>>>>>>> not require BBM, so there is no need to invalidate the PTE and flush the
>>>>>>> TLB before updating it with the newly created, split page table.
>>>>>> But some flushing is going to be necessary. As long as you only ever do
>>>>>> global flushes, the one after the individual PTE modification (within the
>>>>>> split table) will do (if BBM isn't required, see below), but once you move
>>>>>> to more fine-grained flushing, that's not going to be enough anymore. Not
>>>>>> sure it's a good idea to leave such a pitfall.
>>>>> I think that I don't fully understand what is an issue.
>>>> Whether a flush is necessary after solely breaking up a superpage is arch-
>>>> defined. I don't know how much restrictions the spec on possible hardware
>>>> behavior for RISC-V. However, the eventual change of (at least) one entry
>>>> of fulfill the original request will surely require a flush. What I was
>>>> trying to say is that this required flush would better not also cover for
>>>> the flushes that may or may not be required by the spec. IOW if the spec
>>>> leaves any room for flushes to possibly be needed, those flushes would
>>>> better be explicit.
>>> I think that I still don't understand why what I wrote above will work as long
>>> as global flushes is working and will stop to work when more fine-grained flushing
>>> is used.
>>>
>>> Inside p2m_split_superpage() we don't need any kind of TLB flush operation as
>>> it is allocation a new page for a table and works with it, so no one could use
>>> this page at the moment and cache it in TLB.
>>>
>>> The only question is that if it is needed BBM before staring using splitted entry:
>>>           ....
>>>           if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
>>>           {
>>>               /* Free the allocated sub-tree */
>>>               p2m_free_subtree(p2m, split_pte, level);
>>>
>>>               rc = -ENOMEM;
>>>               goto out;
>>>           }
>>>
>>> ------> /* Should be BBM used here ? */
>>>           p2m_write_pte(entry, split_pte, p2m->clean_pte);
>>>
>>> And I can't find anything in the spec what tells me to use BBM here like Arm
>>> does:
>> But what you need is a statement in the spec that you can get away without. Imo
>> at least.
> 
> In the spec. it is mentioned that:
>    It is permitted for multiple address-translation cache entries to co-exist for the same
>    address. This represents the fact that in a conventional TLB hierarchy, it is possible for
>    multiple entries to match a single address if, for example, a page is upgraded to a
>    superpage without first clearing the original non-leaf PTE’s valid bit and executing an
>    SFENCE.VMA with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
>    hierarchy. In this case, just as if an SFENCE.VMA is not executed between a write to the
>    memory-management tables and subsequent implicit read of the same address: it is
>    unpredictable whether the old non-leaf PTE or the new leaf PTE is used, but the behavior is
>    otherwise well defined.
> The phrase*"but the behavior is otherwise well defined"* emphasizes that even if the TLB sees
> two versions (the old and the new), the architecture guarantees stability, and the behavior
> remains safe — though unpredictable in terms of which translation will be used.
> And I think that this unpredictability is okay, at least, in the case if superpage splitting
> and therefore TLB flushing can be deferred since the old pages (which are used for old mapping)
> still exist and the permissions of the new entries match those of the original ones.
> Also, it seems like there clearing PTE before TLB flushing isn't need too.
> 
> Does it make sense?

Yes, I think this indeed is sufficient as a spec requirement.

Jan

