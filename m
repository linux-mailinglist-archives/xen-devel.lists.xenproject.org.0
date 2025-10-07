Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A491ABC170F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138761.1474379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67Ry-0005Jo-Q9; Tue, 07 Oct 2025 13:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138761.1474379; Tue, 07 Oct 2025 13:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67Ry-0005IN-MD; Tue, 07 Oct 2025 13:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1138761;
 Tue, 07 Oct 2025 13:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v67Rx-0005IG-Ea
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:09:53 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e856faa1-a37e-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 15:09:51 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b3da3b34950so802732066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 06:09:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e77427sm1418385366b.36.2025.10.07.06.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:09:49 -0700 (PDT)
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
X-Inumbo-ID: e856faa1-a37e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759842590; x=1760447390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ftJmllaYyjfanSuNvIzs0yck2YaqXyq6e4LsoEKAzY=;
        b=MIv+Vdlro9gVJihGpw+ZRFp5NKChySaXs4rCwPDbEYHlxxHLO5KgIVv+4b6Dk0wOu7
         i8esVJdZqz8mOWO6lM5o9nUhvCZ0YyEld4pK4LBY4fsYyWaLPBtQUA0i5Mp8yxyZk8Ci
         +Ym6J+pYeA41MEZ4zrXZu1opcOv1e7qRF7FhMM8/kERDx4RvNUy0KREmTNUdX9nwkrKG
         Xj4EjUGgEDq0MvQ4w7hg1sq0EqLizp0BxonUc/ShXgMbsgKVH4hDDTY+O+x63Gl4sj7Z
         MJejWOHHZYI+D94yhPoYJ6coHgSSxhF6tvC6qkVyjWjGUkVotovRV7jCbKmtq+anRWef
         pnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842590; x=1760447390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ftJmllaYyjfanSuNvIzs0yck2YaqXyq6e4LsoEKAzY=;
        b=XBDPk3QnL/v9C+OUVbEao86SntD3mrhBaxCbGhmuAd+0CYWfj2VSFPmZoBEJ9/CFkS
         99YjlGfBuFmRmjgX5h6AcRnfEgf0keftZvtP9i3gnLTzeGml2+oGH/POvj1rm5LyxS+2
         lBHMXKVzaP3TcCFnXa92HgUk9EBdPfjceSjamZqSc6uF9tEeVgCQAYehGpIO8WU7RIF0
         Z4w2zVccQ+3isZzTVS2BoPAm4C25uSKkqpc+jYdUw9D5BTKuJd1lF4WTdhaAQjLVmoKX
         +q2Q7CrHfN8TSvP9+Rv4pJ2Mhp7TU4wdIgm64tSiVmZ9a7JjLAe9DNMy/VBmfKiAKSgD
         5o/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUPugCEpNRTxGAoxFTN0S1fFcfw7pVkCG89WZZGCVOndr4FL9Mz6LCVHcgSw2hpZBvwAQqPUdAD5Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWXNOnKzDe3LyDFFl7AZJRpl+HIV1qEKYQOMg4Kkpf/JmdN9eE
	W4pFdqIRxmJDumlwj18e6Jz2tYMtiJkDF6yql1Az78o6PQirat/RDzpmQ5hGHd9uMA==
X-Gm-Gg: ASbGncuNW5Hk7syys/qUTgduqvpn4HE9aECrNe1hoG0Q9q/IL3J3c6tu+qvL76YTnKf
	U9v+Ddo1RSzj380FEfetK36A6m9ITYZoEd90dKXDBzE7yt84dt99ZNGZEMgDOv4vLDFnkRUXCsm
	CXG/TK4VDvj4P+Qz22MUga9pP4VcAXI9gr/iJ4cc12Mxd1Zf3fc56WRacEohTGrqaR0pANoQVol
	XHi3vqBDHMKaDhRsjdrVg4HqhmTSPT9CXoIrT/9WHvUK0Qy68OOlDniqSoC3sSCjFxE4J4jYhCQ
	RnulCPPEhr/HpQevIAvO70p03U1buVtZA/DX2qxmgglP7UcKUn4THZsQ6HSzDmEoWYQMjIpxmuK
	1vFkbj2Fu7bJnOpVp4d4GTlF6IWKwX1FOyYNzRJi4oznuFlp9fcwt+qiiRBony0P+9tvWM4WgFK
	2/HWw/O0GGK+JHWZ4CzbFsYd/LxJFboNo=
X-Google-Smtp-Source: AGHT+IEudusrr09UGIZsTokdUZrTZWCy1hPiLQ+ihGatC8tHOjgczbTz/vhcXOoN5BFXBTFdLSdYlg==
X-Received: by 2002:a17:907:3f9d:b0:b2b:3481:93c8 with SMTP id a640c23a62f3a-b49c08981c4mr2083987466b.19.1759842590218;
        Tue, 07 Oct 2025 06:09:50 -0700 (PDT)
Message-ID: <7fe4f483-ef3c-4954-9030-2c364673c9db@suse.com>
Date: Tue, 7 Oct 2025 15:09:57 +0200
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
In-Reply-To: <6902c46e-c805-43aa-8753-7b6dc09716ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.09.2025 15:30, Oleksii Kurochko wrote:
> 
> On 9/22/25 6:28 PM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>>       p2m_write_pte(p, pte, clean_pte);
>>>   }
>>>   
>>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>>   {
>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>> +    e->pte &= ~PTE_ACCESS_MASK;
>>> +
>>> +    e->pte |= PTE_USER;
>>> +
>>> +    /*
>>> +     * Two schemes to manage the A and D bits are defined:
>>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>>> +     *     is clear, or is written and the D bit is clear, a page-fault
>>> +     *     exception is raised.
>>> +     *   • When the Svade extension is not implemented, the following scheme
>>> +     *     applies.
>>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>> +     *     updated to set the A bit. When the virtual page is written and the
>>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>> +     *     address translation is in use and is not Bare, the G-stage virtual
>>> +     *     pages may be accessed or written by implicit accesses to VS-level
>>> +     *     memory management data structures, such as page tables.
>>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>>> +     * necesssary to set A and D bits.
>>> +     */
>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>> All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
>> machine mode software responsible for dealing with this kind of page faults
>> (just like the hypervisor is reponsible for dealing with ones resulting
>> from henvcfg.ADUE being clear)?
> 
> In general, I think you are right.
> 
> In this case, though, I just wanted to avoid unnecessary page faults for now.
> My understanding is that having such faults handled by the hypervisor can indeed
> be useful, for example to track which pages are being accessed. However, since we
> currently don’t track page usage, handling these traps would only result in
> setting the A and D bits and then returning control to the guest.

Yet that still be be machine-mode software aiui. By always setting the bits we'd
undermine whatever purpose _they_ have enabled the extension for, wouldn't we?

> To avoid this overhead, I chose to set the bits up front.

Irrespective to the answer to the question above, if you mean to do so, I think
all of this needs explaining better in the comment.

Jan

