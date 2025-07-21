Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D77CB0C54A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051520.1419863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqfH-0000ER-Lb; Mon, 21 Jul 2025 13:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051520.1419863; Mon, 21 Jul 2025 13:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqfH-0000Bl-Ic; Mon, 21 Jul 2025 13:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1051520;
 Mon, 21 Jul 2025 13:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udqfG-0000Bf-LP
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:34:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76e3997d-6637-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 15:34:45 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so2286641f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:34:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfdb1sm58140995ad.139.2025.07.21.06.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:34:44 -0700 (PDT)
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
X-Inumbo-ID: 76e3997d-6637-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753104885; x=1753709685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8R1Y8GAl+HE15okMxrJC3r6qUwWEWGJCtBkPfTidZ0=;
        b=Wi8fBlZPeifvF1QzNHgOQC9nsZfSxl6iNX4JOpvRLbD1FHsC2HVc1UmNXZwH1wBKD3
         PW8eVqyw9g4QzFz4WwQWYEAOO0bAZ1tii0fyShPh01tShgxXFAv5L2gJXPqgNSNBE6mu
         bcpibW6q4inEqaAs9cezxCoJ0GLWCmOxkC1ScBc8t8UjUhg+gNKvcp7jiiO5laWSB/5F
         t7aH/vJsX/PsN3eZ0Q3L0/wBtBcH2oOwGwK6gSlP8Q+3m7gXR3QEru1MT+7Ysy5VW0GV
         jCKpykkrhwTRd6xFBRoOzMEEqhQUcsrK8KyGCf9dXV9gIL0Y4NU9E2WZ45m+m7Hv+g6e
         68ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104885; x=1753709685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8R1Y8GAl+HE15okMxrJC3r6qUwWEWGJCtBkPfTidZ0=;
        b=fVk+Icj5d5LmJ6/z5TkTkGw4TF9a3/ZSPHkPC55QKJab/W/Fd3c7jTUrz2zy98/FXv
         P8oQRFNEgC69CBcRGcL4FuG8WeLKAZOw1RIxLQuVTPXflJnqj85Q/A5/ppGBOF2S/yM5
         Ds96mZ5QTMwez5Gjdcz7YnQ0maR+7mSKjR3Kj2YSVtf9di1HTtpFvGpevA1xsiViTFKh
         J5FPK8H1hu/KTgCeTVZn/yTBarbv+yk0r+tLW724yH2NyuEexoMke7/ogfyV8p5LAjjh
         af4X5w7xRYvoVPMQuYDwtKQuApigere59FWr40Z51Q+x70OxGV3WgI+38+ctTFTt0X8y
         pV1g==
X-Forwarded-Encrypted: i=1; AJvYcCWNOi9fgskXC7XJ1G5WWBzeA66Rv/VQmL/vywebnk+XP0KwMrZzQ23uSnuGWDm6gaXmZnXg6QA4ol4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoOR+i4Ire54YQ+Q3YMIWlWyYPj9+dAtQydQgOUqaS0PJf317/
	7sdKNF7BTVUrzEC7d0lWFBJb5kf+ElNzglEU1843h8dT6bLtN+Gnq0howK5153ZZ4w==
X-Gm-Gg: ASbGncsvGPFlFtkKBrh6Y2i/VZTB3F913ZCf4xIP/6cTN7E0iAVhujAcZ/Tbi2ae7WI
	AUcf95vagl2qln6QFKj1xWDsNKkEkxlWqi+HEwZCKb9YCj6iJPaqrvSp3yxMaPmV6bPZtmgjuJ8
	wXt1TYr3WdTQWJLej/BN8W9D8Sup/3s2InM+vLLnhlRXBbXMiFb6fDqwQopIsDh7ntrg7Eufu2f
	SoOrcRPH1BsM/G9J75DrOmdkYG4aEtJ/x0nwN/7kXSTBMVuoZaRgX+NeadYB7r5EDEqVw1VxzNy
	MQ3Rr14zvykNPXKEkhNstLR3zK2s8NP97OPqebvCJu6wW2DTkP37/rjLrjlEKddjvhKikiOkl7x
	p+B6TuOAIWLpLMUxUS59nfBL9i3hfhOp6KaVFiLjQz8jdcjiXucy7Csknyqq6eR9dpn0n+7Ipdg
	AaJfldTxI=
X-Google-Smtp-Source: AGHT+IGNtDTHnaQgUL9F3gwV+xnQpkNStJMIMels8zHtVxQokjjGvQqtkGJQ36pOOM8uhnTKztcs0A==
X-Received: by 2002:a05:6000:188e:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b60e4d2312mr16936074f8f.3.1753104884628;
        Mon, 21 Jul 2025 06:34:44 -0700 (PDT)
Message-ID: <0c1701ff-efe3-434f-97e0-4896707411b7@suse.com>
Date: Mon, 21 Jul 2025 15:34:34 +0200
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
In-Reply-To: <e2227002-e38c-41e1-8bea-7585138ec5ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 18:37, Oleksii Kurochko wrote:
> On 7/2/25 11:25 AM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> Add support for down large memory mappings ("superpages") in the RISC-V
>>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>>> can be inserted into lower levels of the page table hierarchy.
>>>
>>> To implement that the following is done:
>>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>>    smaller page table entries down to the target level, preserving original
>>>    permissions and attributes.
>>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>>    entries at lower levels within a superpage-mapped region.
>>>
>>> This implementation is based on the ARM code, with modifications to the part
>>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>>> not require BBM, so there is no need to invalidate the PTE and flush the
>>> TLB before updating it with the newly created, split page table.
>> But some flushing is going to be necessary. As long as you only ever do
>> global flushes, the one after the individual PTE modification (within the
>> split table) will do (if BBM isn't required, see below), but once you move
>> to more fine-grained flushing, that's not going to be enough anymore. Not
>> sure it's a good idea to leave such a pitfall.
> 
> I think that I don't fully understand what is an issue.

Whether a flush is necessary after solely breaking up a superpage is arch-
defined. I don't know how much restrictions the spec on possible hardware
behavior for RISC-V. However, the eventual change of (at least) one entry
of fulfill the original request will surely require a flush. What I was
trying to say is that this required flush would better not also cover for
the flushes that may or may not be required by the spec. IOW if the spec
leaves any room for flushes to possibly be needed, those flushes would
better be explicit.

>> As to (no need for) BBM: I couldn't find anything to that effect in the
>> privileged spec. Can you provide some pointer? What I found instead is e.g.
>> this sentence: "To ensure that implicit reads observe writes to the same
>> memory locations, an SFENCE.VMA instruction must be executed after the
>> writes to flush the relevant cached translations." And this: "Accessing the
>> same location using different cacheability attributes may cause loss of
>> coherence." (This may not only occur when the same physical address is
>> mapped twice at different VAs, but also after the shattering of a superpage
>> when the new entry differs in cacheability.)
> 
> I also couldn't find that RISC-V spec mandates BBM explicitly as Arm does it.
> 
> What I meant that on RISC-V can do:
> - Write new PTE
> - Flush TLB
> 
> While on Arm it is almost always needed to do:
> - Write zero to PTE
> - Flush TLB
> - Write new PTE
> 
> For example, the common CoW code path where you copy from a read only page to
> a new page, then map that new page as writable just works on RISC-V without
> extra considerations and on Arm it requires BBM.

CoW is a specific sub-case with increasing privilege.

> It seems to me that BBM is mandated for Arm only because that TLB is shared
> among cores, so there is no any guarantee that no prior entry for same VA
> remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
> guaranteed that no prior entry for the same VA remains in the TLB.

Not sure that's the sole reason. But again the question is: Is this written
down explicitly anywhere? Generally there can be multiple levels of TLBs, and
while some of them may be per-core, others may be shared.

>>> +    /*
>>> +     * Even if we failed, we should install the newly allocated PTE
>>> +     * entry. The caller will be in charge to free the sub-tree.
>>> +     */
>>> +    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
>> Why would it be wrong to free the page right here, vacating the entry at
>> the same time (or leaving just that to the caller)? (IOW - if this is an
>> implementation decision of yours, I think the word "should" would want
>> dropping.) After all, the caller invoking p2m_free_entry() on the thus
>> split PTE is less efficient (needs to iterate over all entries) than on
>> the original one (where it's just a single superpage).
> 
> I think that I didn't get your idea.

Well, first and foremost this was a question to you, as it's not clear to
me whether "should" is the correct word to use here. It would be
appropriate if the spec mandated this behavior. It would seem less
appropriate if this arrangement was an implementation choice of yours.
And it looks to me as if the latter was the case here.

>>> @@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>>>        */
>>>       if ( level > target )
>> This condition is likely too strong, unless you actually mean to also
>> split a superpage if it really wouldn't need splitting (new entry written
>> still fitting with the superpage mapping, i.e. suitable MFN and same
>> attributes).
> 
> I am not really sure that I fully understand.
> My understanding is if level != target then the splitting is needed, I am
> not really get the part "split a superpage if it really wouldn't need splitting".

Hmm, maybe I was wrong here. The caller determines at what level the
actual change needs to occur? In which case what you have may be right.

Jan

