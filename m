Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD710939E78
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762951.1173193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCLX-0006TK-UM; Tue, 23 Jul 2024 10:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762951.1173193; Tue, 23 Jul 2024 10:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCLX-0006QQ-RC; Tue, 23 Jul 2024 10:02:15 +0000
Received: by outflank-mailman (input) for mailman id 762951;
 Tue, 23 Jul 2024 10:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWCLX-0006QK-6E
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:02:15 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a110f227-48da-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 12:02:11 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so78664221fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 03:02:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf7b2adafsm8699877a91.2.2024.07.23.03.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 03:02:10 -0700 (PDT)
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
X-Inumbo-ID: a110f227-48da-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721728931; x=1722333731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xsfroiK4oeor59++qycD2qtfKDNLdKaFvizIzX+T1ek=;
        b=eIIFEqW13zHtBPWCjU2sb9Yd2bF7oNewmEKvnzslXCNVeiiMAxdfsDu/P2lk5kQaie
         5XlSMt58FfmoaIqfF0/CjXVNcxXIluUn0OTFc3u21yTGgMBz0sbgPwGyFUPpW/l1zHD2
         +L6pA/cHQiwSuw1YbSZknZpty433ZyVrHupavgoi1XYr3vljYtVwfjLqyCypHYH52rM5
         8KCdgX+fEPy58DLJcQspl4XcEXxPlzPhft9UYYBJI/2ASAbcaqy9H246OQ1k38d4FY6H
         AEGPAFNvl5LTj0urKE6lynDvQGsKcCeG3jLVJj7OqbA08VJkDrANdMio0vlDuRs4UGd+
         KhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728931; x=1722333731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsfroiK4oeor59++qycD2qtfKDNLdKaFvizIzX+T1ek=;
        b=KhnFFn4H7alqPnXbRV9KjgD2/UVm9yPdC7+VxB37cHod8YGsM79b1AyIqIrtedPQr2
         64oTYh2DODxAH/d6Kr/9TSFAStkNqzarDYSY19gdJ9g8vBD+7o8/4HddNvs76D/ys9Hb
         7afROfDxqBMPVj0SCLjwJfsi7cl8IfLJnqenjI/YSQL948szkjUMbuzgaO5zn9boSuYT
         m3FS76YdsLOcgtTR1qxuPlEadm/LJa0OyTyY7XVP0t7AQxjB6vGjj8cWIL7hUz1IbivF
         XAdLClXXaxWh/0v6ajJE1DBFX8QMIpACDUp++kwwtqlRjgcDicVGr+KTH4ncsgfkUs1O
         lbgw==
X-Forwarded-Encrypted: i=1; AJvYcCV+wUnHte5fk+bY3swLgtskKtrRS5sDrWxV6nA3VcvYCeb/+mS+j8vvolZeGiJsTxGAHxNX61Kxzc5nlJZaPkGLmEyeCXykTe33sXQqFR4=
X-Gm-Message-State: AOJu0YyS2rrqJj/nPloA3yUzwoRNSzsc2y2Hhe/wJdih5ma7K4D3pPbC
	oMymGoG9CbFtklONSdfc9+vyJ5AV0if0XmT1HU52V45DgksSYAhn5+ZB913Ckg==
X-Google-Smtp-Source: AGHT+IEvKLs0dtZqmHulYvk+K+j9IpwyGar0Ge1ZmoYhNKRFBMtFwmdVOTUUJvgSrHY1dFRPDCfyhA==
X-Received: by 2002:a2e:95c2:0:b0:2ef:564c:a590 with SMTP id 38308e7fff4ca-2ef564ca663mr29682951fa.29.1721728931295;
        Tue, 23 Jul 2024 03:02:11 -0700 (PDT)
Message-ID: <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
Date: Tue, 23 Jul 2024 12:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
 <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
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
In-Reply-To: <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 10:55, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
>> On 23.07.2024 10:02, Oleksii Kurochko wrote:
>>> On Mon, Jul 22, 2024 at 7:27 PM Julien Grall <julien@xen.org>
>>> wrote:
>>>>>> On 22/07/2024 15:44, Oleksii Kurochko wrote:
>>>>>     /* Map a 4k page in a fixmap entry */
>>>>>     void set_fixmap(unsigned map, mfn_t mfn, unsigned int
>>>>> flags)
>>>>>     {
>>>>>         pte_t pte;
>>>>>
>>>>>         pte = mfn_to_xen_entry(mfn, flags);
>>>>>         pte.pte |= PTE_LEAF_DEFAULT;
>>>>>         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))],
>>>>> pte);
>>>>
>>>> It would be saner to check if you are not overwriting any
>>>> existing
>>>> mapping as otherwise you will probably need a TLB flush.
>>>>
>>>>>     }
>>>>>
>>>>>     /* Remove a mapping from a fixmap entry */
>>>>>     void clear_fixmap(unsigned map)
>>>>>     {
>>>>>         pte_t pte = {0};
>>>>>         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))],
>>>>> pte);
>>>>
>>>> Don't you need a TLB flush?
>>>>
>>> Inside write_pte() there is "sfence.vma".
>>
>> That's just a fence though, not a TLB flush.
> From the privileged doc:
>    ```
>    SFENCE.VMA is also used to invalidate entries in the
>    address-translation cache associated with a hart (see Section 4.3.2). 
>    ...
>    The SFENCE.VMA is used to flush any local hardware caches related to
>    address translation.
>    It is specified as a fence rather than a TLB flush to provide cleaner
>    semantics with respect to
>    which instructions are affected by the flush operation and to support a
>    wider variety of dynamic
>    caching structures and memory-management schemes. SFENCE.VMA is also
>    used by higher
>    privilege levels to synchronize page table writes and the address
>    translation hardware.
>    ...
>    ```
> I read this as SFENCE.VMA is used not only for ordering of load/stores,
> but also to flush TLB ( which is a type of more general term as
> address-translation cache, IIUIC ).

Oh, I see. Kind of unexpected for an instruction of that name. Yet note
how they talk about the local hart only. You need a wider scope TLB
flush here.

Jan

