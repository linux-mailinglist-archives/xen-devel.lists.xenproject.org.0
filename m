Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A2B0E129
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 18:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052917.1421698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFSQ-0002xk-M8; Tue, 22 Jul 2025 16:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052917.1421698; Tue, 22 Jul 2025 16:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFSQ-0002uF-JP; Tue, 22 Jul 2025 16:03:10 +0000
Received: by outflank-mailman (input) for mailman id 1052917;
 Tue, 22 Jul 2025 16:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueFSP-0002u9-IO
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 16:03:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5979d638-6715-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 18:03:04 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4563a57f947so122475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 09:03:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89cf951sm7834810b3a.36.2025.07.22.09.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 09:03:02 -0700 (PDT)
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
X-Inumbo-ID: 5979d638-6715-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753200184; x=1753804984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PGxTgi/1QzpoIxo8dlP6eDg2Eo3GGc8W8GR2aGCiuik=;
        b=JENHO4ndGPb/pb8R/hz4pc7+7RUgXa0l8uc0Al/Han1zBEDpCmQ2vhWEcLjbB+6XY6
         7khG32qi+PTgBdRSR1hg+0eg0qVj5Z5NQohblUmt1dpq+U/nCBA0x8/5Ri/+Cxu2CgZp
         t/+RjHHiaW+xIVv6FGEuhcrwchKrJ07GLQB5y2uBJBiuevtoy5k9YnkVD8YJpLRNfRAs
         FuxbeJqdoBJeV6LKSPJ2TFCHhOl7SIbg2DAvMSv1s5m7sucQUH45Ws1lzjMbfVhNbXdt
         y2/RgAwWMhuXtiq0SP6nJzTE2nYtAys4MiJYwSDZmHnh3PD1keYZ/1FkmqdI7zRwL8yA
         9SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200184; x=1753804984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGxTgi/1QzpoIxo8dlP6eDg2Eo3GGc8W8GR2aGCiuik=;
        b=qQM4AqucP48opye8vO62yqoIZjRUkgpQOieW3SURAw3794RUUrPYJncvMu89O7W7Sh
         Gm2mh79CHP2cxgdE94PemUl2un5fc5y04G0PZY6oHsJYZuDt+FeByMABEpqPbA/HQdDn
         abzXsQ03wuf1bSMN79o1YYo/+1S6/uQ5ltxS+mjrEmT6W3N94tKrzxB491ZkrWShc9+C
         ZZhYDl8vyLYpoh6ykqgEBTRTuYPp36vrB411QIp8Bf0yRJ5MyweLJgsaI4p2VA898c8c
         6mri74LtT1FK9ejNHFhxerllJtCZdr8ki2vHiNZoI9EG+p7pA/vqR0PL82EUXAmLykTZ
         w1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUgFdIvCEw7JLKm98CHThlvgqa95LHYtn1RRimr60rVfrZmrcdPzBQgKkRiNidc47Gkt2NpotT+3sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz26pQGYlKz1sQXEj0mpFZ+FrFvbh+NQBKtx4YaUwuHvaCcombh
	A8RT5+HlXKoTqnVyD110ZOAwjAEYupkk3mss4KfmwOZdSYgTpdAKCJ7B7RamuWGvmA==
X-Gm-Gg: ASbGncsBwOmwsaNJ1ykaIEd5w+6dJpb6ZWwUeUvwBHx8n8/qVsZJMqudTLYTDQbXPyx
	+g4I14JP5Nnw6w/fNmyDTE4DCwhreYXa1+CIG3x9z8tPhU+lQIGv7na7trdEzFeUK3BxUKytbn+
	I3YxNOdD0jy+koT9fHHqfRIxqrvsdkRQVu2llexui4rZ1vt0x8+dQCcOMdUCo4+RzMObHg6c3aX
	I47bfSQXzmQDKnrlmTyrftE91qejmsADmo4P3/41Mb7Gsvxc/18fLxctb/XqBJ2LrwZeadH4v2H
	+zJAkiZsrZWI21E9u8nNrOolLfsyizTYBfyRJcbB2ktcytI5DHuzh+lvUVFQQDOdFJx4ONQr01+
	vyZkGNapOhMCiq9pjhF9HLqoEAU2BhZqGXxhcLM1bcIlXskYURXOFv1L3NL5Mh3equjfBG9CJKy
	F+ZRe1Cfk=
X-Google-Smtp-Source: AGHT+IEeCVoUWLiztJ2AVV7A52B8tJl6lvtkRIUejFzapUtKZOLRfI5vTDEs7wASwJzk2S4s41cNmw==
X-Received: by 2002:a5d:588e:0:b0:3b6:1cba:a769 with SMTP id ffacd0b85a97d-3b7634e58d1mr3791586f8f.16.1753200183230;
        Tue, 22 Jul 2025 09:03:03 -0700 (PDT)
Message-ID: <6f88e20e-98dd-4d58-b459-5a67e2629f4c@suse.com>
Date: Tue, 22 Jul 2025 18:02:52 +0200
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
In-Reply-To: <640d6862-4ea9-49ca-adb8-0fad5ceb1ff1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 16:57, Oleksii Kurochko wrote:
> 
> On 7/21/25 3:34 PM, Jan Beulich wrote:
>> On 17.07.2025 18:37, Oleksii Kurochko wrote:
>>> On 7/2/25 11:25 AM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> Add support for down large memory mappings ("superpages") in the RISC-V
>>>>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>>>>> can be inserted into lower levels of the page table hierarchy.
>>>>>
>>>>> To implement that the following is done:
>>>>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>>>>     smaller page table entries down to the target level, preserving original
>>>>>     permissions and attributes.
>>>>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>>>>     entries at lower levels within a superpage-mapped region.
>>>>>
>>>>> This implementation is based on the ARM code, with modifications to the part
>>>>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>>>>> not require BBM, so there is no need to invalidate the PTE and flush the
>>>>> TLB before updating it with the newly created, split page table.
>>>> But some flushing is going to be necessary. As long as you only ever do
>>>> global flushes, the one after the individual PTE modification (within the
>>>> split table) will do (if BBM isn't required, see below), but once you move
>>>> to more fine-grained flushing, that's not going to be enough anymore. Not
>>>> sure it's a good idea to leave such a pitfall.
>>> I think that I don't fully understand what is an issue.
>> Whether a flush is necessary after solely breaking up a superpage is arch-
>> defined. I don't know how much restrictions the spec on possible hardware
>> behavior for RISC-V. However, the eventual change of (at least) one entry
>> of fulfill the original request will surely require a flush. What I was
>> trying to say is that this required flush would better not also cover for
>> the flushes that may or may not be required by the spec. IOW if the spec
>> leaves any room for flushes to possibly be needed, those flushes would
>> better be explicit.
> 
> I think that I still don't understand why what I wrote above will work as long
> as global flushes is working and will stop to work when more fine-grained flushing
> is used.
> 
> Inside p2m_split_superpage() we don't need any kind of TLB flush operation as
> it is allocation a new page for a table and works with it, so no one could use
> this page at the moment and cache it in TLB.
> 
> The only question is that if it is needed BBM before staring using splitted entry:
>          ....
>          if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
>          {
>              /* Free the allocated sub-tree */
>              p2m_free_subtree(p2m, split_pte, level);
> 
>              rc = -ENOMEM;
>              goto out;
>          }
> 
> ------> /* Should be BBM used here ? */
>          p2m_write_pte(entry, split_pte, p2m->clean_pte);
> 
> And I can't find anything in the spec what tells me to use BBM here like Arm
> does:

But what you need is a statement in the spec that you can get away without. Imo
at least.

>          /*
>           * Follow the break-before-sequence to update the entry.
>           * For more details see (D4.7.1 in ARM DDI 0487A.j).
>           */
>          p2m_remove_pte(entry, p2m->clean_pte);
>          p2m_force_tlb_flush_sync(p2m);
> 
>          p2m_write_pte(entry, split_pte, p2m->clean_pte);
> 
> I agree that even BBM isn't mandated explicitly sometime it could be useful, but
> here I am not really sure what is the point to do TLB flush before p2m_write_pte()
> as nothing serious will happen if and old mapping will be used for a some time
> as we are keeping the same rights for smaller (splited) mapping.
> The reason why Arm does p2m_remove_pte() & p2m_force_tlb_flush() before updating
> an entry here as it is doesn't guarantee that everything will be okay and they
> explicitly tells:
>   This situation can possibly break coherency and ordering guarantees, leading to
>   inconsistent unwanted behavior in our Processing Element (PE).
> 
> 
>>>> As to (no need for) BBM: I couldn't find anything to that effect in the
>>>> privileged spec. Can you provide some pointer? What I found instead is e.g.
>>>> this sentence: "To ensure that implicit reads observe writes to the same
>>>> memory locations, an SFENCE.VMA instruction must be executed after the
>>>> writes to flush the relevant cached translations." And this: "Accessing the
>>>> same location using different cacheability attributes may cause loss of
>>>> coherence." (This may not only occur when the same physical address is
>>>> mapped twice at different VAs, but also after the shattering of a superpage
>>>> when the new entry differs in cacheability.)
>>> I also couldn't find that RISC-V spec mandates BBM explicitly as Arm does it.
>>>
>>> What I meant that on RISC-V can do:
>>> - Write new PTE
>>> - Flush TLB
>>>
>>> While on Arm it is almost always needed to do:
>>> - Write zero to PTE
>>> - Flush TLB
>>> - Write new PTE
>>>
>>> For example, the common CoW code path where you copy from a read only page to
>>> a new page, then map that new page as writable just works on RISC-V without
>>> extra considerations and on Arm it requires BBM.
>> CoW is a specific sub-case with increasing privilege.
> 
> Could you please explain why it matters increasing of privilege in terms of TLB
> flushing and PTE clearing before writing a new PTE?

Some architectures automatically re-walk page tables when encountering a
permission violation based on TLB contents. Hence increasing privilege
can be a special case.

>>> It seems to me that BBM is mandated for Arm only because that TLB is shared
>>> among cores, so there is no any guarantee that no prior entry for same VA
>>> remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
>>> guaranteed that no prior entry for the same VA remains in the TLB.
>> Not sure that's the sole reason. But again the question is: Is this written
>> down explicitly anywhere? Generally there can be multiple levels of TLBs, and
>> while some of them may be per-core, others may be shared.
> 
> Spec. mentions that:
>    If a hart employs an address-translation cache, that cache must appear to be
>    private to that hart.

Hmm, okay, that indeed pretty much excludes shared TLBs.

Jan

