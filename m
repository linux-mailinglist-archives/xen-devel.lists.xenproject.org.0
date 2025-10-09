Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA7BC8F22
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140537.1475390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pPg-0004YN-EO; Thu, 09 Oct 2025 12:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140537.1475390; Thu, 09 Oct 2025 12:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pPg-0004Ww-Be; Thu, 09 Oct 2025 12:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1140537;
 Thu, 09 Oct 2025 12:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6pPf-0004Wq-29
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:06:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb45ea2-a508-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 14:06:21 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso6160385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 05:06:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe49sm34918261f8f.21.2025.10.09.05.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:06:20 -0700 (PDT)
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
X-Inumbo-ID: 5eb45ea2-a508-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760011581; x=1760616381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yq8+oZ8sCpaPnU7ewuf6krsrOkpu1Vs7QMFLUjRalKE=;
        b=OqKT5fzFUda3zD/pcfnCX82jSVsKJSr448ZS7EgeScqHUgUgtcojtAmtJrz/uIzqB4
         KBbPOO/CKCCLZW9VFVAxQiqeIS3YKiNPU8ysuwZ4vCfwD35zR9SsYUBSGmngNwP3TJqE
         vm+77uTfSMQj1ZcEVzNIUoYiCK25BlNsSiZ7inOAY4ZrOrfZrY0qCbkOSHL2ltmrFYQb
         qjPbimQtRlMcQeNupGomCSN5i4OzGSXXSrM6sjJ0y5/preRdMMm1buGNosAbmV1Cow+/
         2A58JwLlJ1zGYQyJMKJrM8d5TGiER9t6VMxgDTbV+4IxTkR5hHm3S7t2VG2MUJqBwrRh
         iY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011581; x=1760616381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq8+oZ8sCpaPnU7ewuf6krsrOkpu1Vs7QMFLUjRalKE=;
        b=K462jQYdpKomNA7GRBUteH2LyzxZHR/r5fwEqUJDv9kmXaOwcOFeZyMXpAqO6nxuW3
         5YZ0ZMlTx1f07cilp/Ti8adz3R8N9dpL8V+kaxoWV5taknq7595d1L50FCTgAUzSGe94
         2HT++K3RkWN+5Dh8cuAfEhO6uCHax8GlIzZ8+j9yqG9odvlD994F3RNHNGg+PftWcZaq
         KL9rQaEcAKugVFopUgxarKXQoq46JV00HEJFMM7iPO6LSNYA6Bg1uND7rPQW17qYUI6k
         M/nM0QAtwj8hr9VYY4zXUFfbfdh2FNaglKB4NA9gUfXjb25xx9HxSQ51WvNNFLCkSYuj
         9t1g==
X-Forwarded-Encrypted: i=1; AJvYcCXxkCFyxxn6oCI4VhD96H0BxcsMlfAROFGzEOcz4ZGFZo+dySGM/8voYsxhZgEXYhkQsZYT1JvJtgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7Rq1HmsBMTCbHJpsMt++f2xGSi0Rtad9hP8b+pTrsY4sKlACi
	Brm+J4Kv4Z3a9TzXnDzOlcYHQiu1pWLoASKZPSZNPFK7+EXQBsrQPvu9RAmPzGg7mA==
X-Gm-Gg: ASbGncuh+7ACaiq2MaUD0pBtLFPasoF83gz/nLlQ8Z1VlrcoltOzM/EkKgJ5LFRETXC
	OxFPxEjB8f0rrfPc5cTMow4J/6WBZtdlPF7COxFEBbd9jgvI6EoQc051m4YWv+SbDnqSJOZHpU3
	hXacUm1k+t7XGhKOnsuwt96DzopySDqxhx94phSPh4WpG+X8GLPrUEf+ia6n9qycqVf1TVXh3Hw
	x+MSp3GNmmmoSR/hy5UeAcU/XLZCDIidIIlENvV528epITB7lMZ/tHTpXDhztjlSWxvT+6Uy8F1
	nNzFmW6n1nGnICxlYkPN6KKf1hutmkqSjBk/CscPJFDBY3jR6iBuAX9AzvVJhNnwEa6zOUT3n+6
	BE4T4gH1/GWLxskaxrB9s7tFpmIEmo2ewe25yGTw/VwUaBLAdGtYxBvq+aik3hZmm98CeKfBzsR
	CiRZ4R7N1xDujo24Fwk6Plm4hcx1S1yAfh43H2RROCxw==
X-Google-Smtp-Source: AGHT+IHECNvjmo7jkwIKG5p4/kCfX3LRmeEuYC184HERGcJWIKJPy5J008k+qHX4RNHG3nWmgeIOkg==
X-Received: by 2002:a05:600c:4687:b0:45d:e5ff:e38c with SMTP id 5b1f17b1804b1-46fa9b02000mr48641675e9.32.1760011581093;
        Thu, 09 Oct 2025 05:06:21 -0700 (PDT)
Message-ID: <4b873422-a8be-4afe-b973-020690b0ff8e@suse.com>
Date: Thu, 9 Oct 2025 14:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
 <7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com>
 <6902c46e-c805-43aa-8753-7b6dc09716ae@gmail.com>
 <7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com>
 <08f2b98c-928e-44eb-96ee-f8566330aed5@gmail.com>
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
In-Reply-To: <08f2b98c-928e-44eb-96ee-f8566330aed5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 11:21, Oleksii Kurochko wrote:
> 
> On 10/7/25 3:09 PM, Jan Beulich wrote:
>> On 29.09.2025 15:30, Oleksii Kurochko wrote:
>>> On 9/22/25 6:28 PM, Jan Beulich wrote:
>>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>>> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>>>>        p2m_write_pte(p, pte, clean_pte);
>>>>>    }
>>>>>    
>>>>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>>>>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>>>>    {
>>>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>>>> +    e->pte &= ~PTE_ACCESS_MASK;
>>>>> +
>>>>> +    e->pte |= PTE_USER;
>>>>> +
>>>>> +    /*
>>>>> +     * Two schemes to manage the A and D bits are defined:
>>>>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>>>>> +     *     is clear, or is written and the D bit is clear, a page-fault
>>>>> +     *     exception is raised.
>>>>> +     *   • When the Svade extension is not implemented, the following scheme
>>>>> +     *     applies.
>>>>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>>>> +     *     updated to set the A bit. When the virtual page is written and the
>>>>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>>>> +     *     address translation is in use and is not Bare, the G-stage virtual
>>>>> +     *     pages may be accessed or written by implicit accesses to VS-level
>>>>> +     *     memory management data structures, such as page tables.
>>>>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>>>>> +     * necesssary to set A and D bits.
>>>>> +     */
>>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>>> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>> All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
>>>> machine mode software responsible for dealing with this kind of page faults
>>>> (just like the hypervisor is reponsible for dealing with ones resulting
>>>> from henvcfg.ADUE being clear)?
>>> In general, I think you are right.
>>>
>>> In this case, though, I just wanted to avoid unnecessary page faults for now.
>>> My understanding is that having such faults handled by the hypervisor can indeed
>>> be useful, for example to track which pages are being accessed. However, since we
>>> currently don’t track page usage, handling these traps would only result in
>>> setting the A and D bits and then returning control to the guest.
>> Yet that still be be machine-mode software aiui. By always setting the bits we'd
>> undermine whatever purpose _they_ have enabled the extension for, wouldn't we?
> 
> It’s a good point, and from an architectural perspective, it’s possible that
> machine-mode software might want to handle page faults.
> However, looking at OpenSBI, it delegates (otherwise all traps/interrupts by
> default are going to machine-mode) page faults [1] to lower modes, and I expect
> that other machine-mode software does the same (but of course there is no such
> guarantee).
> 
> Therefore, considering that OpenSBI delegates page faults to lower modes and
> does not set the A and D bits for p2m (guest) PTEs, this will result in a page
> fault being handled by the hypervisor. As a result, we don’t affect the behavior
> of machine-mode software at all.
> 
> If we want to avoid depending on how OpenSBI or other machine-mode software is
> implemented, we might instead want to have our own page fault handler in Xen,
> and then set the A and D bits within this handler.

Won't Xen need its own page fault handler anyway?

> Do you think it would be better to do in this way from the start? If yes, then
> we also want drop setting of A and D bits for Xen's PTEs [3] to allow M-mode to
> handle S/HS-mode page faults.

What I don't really understand is what the intended use of that extension is.
Surely every entity should be responsible for its own A/D bits, with lower
layers coming into play only when certain things need e.g. emulating. This
lack of understanding on my part extends to ...

> Interestingly, OpenSBI doesn’t allow hypervisor mode to decide whether to
> support Svade or not [2]. By doing so, we can’t set|henvcfg.adue = 1| to disable
> it as menvcfg.adue=0 has more power, which is not very flexible.

... this point, which I was also wondering about before.

Jan

