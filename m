Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B7AEFEC9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 18:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029852.1403588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWdQF-00048X-58; Tue, 01 Jul 2025 16:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029852.1403588; Tue, 01 Jul 2025 16:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWdQF-000475-2L; Tue, 01 Jul 2025 16:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1029852;
 Tue, 01 Jul 2025 16:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWdQD-00046z-PU
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 16:01:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c350a94-5694-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 18:01:12 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so49327865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 09:01:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b001csm107231995ad.154.2025.07.01.09.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 09:01:09 -0700 (PDT)
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
X-Inumbo-ID: 9c350a94-5694-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751385672; x=1751990472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtfqZmbVNsX3HGFp8PPYYCES0lQBi5oORU8OGa9kPDI=;
        b=IkjjZCTK6dzcvhGNeHzwGEzhhtoO4mOAWZ8UD3CgzpzrkQvLBGQQ+QVt/VC+MdXEb8
         kgpd6XDBslmtDUwHPUcuxHTDJ25tHN43U9BaBSo1da20O8pe0xzZhgdUvIgpPiAfkmtN
         N0Kv0Q09X6f9KLsYRM5lcdTd4F+LfcYkMkBsjrqqdmGg/2VnOWjCJWnGD+IXLicOtpsk
         sJU3Wox3HdB62emvQ5A/ZD1uGnjCZoF4mJKNUyPW2jSUwbP6+4QG1CYGoj+elM/9TLMd
         wKv6INgTLqgn8F3XpANEHN6UYmyQMGFl/4PdyXZFbLRks5YX5v4bqMU//CbjjaZj08oZ
         segw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385672; x=1751990472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtfqZmbVNsX3HGFp8PPYYCES0lQBi5oORU8OGa9kPDI=;
        b=pukUbIg/wYOVVVTijubUetXs+Et+gTyrCClq7VbSueyxBgUj2KIzNY92ZprPaKIbrY
         fyjZhqJZBCcKEPsPegnWVKa4+mVsFtuJ5APn9lucyNea8MbqokcymROjRc0/J5D8Z6dq
         iRfK7Eccg5GtJaeErFTXPPEemS2jcU4+VvUrtoy8yQV8Qa77vqLDCEl5tW66PXZVseO3
         Wo8UG3epZQ0PStmh7dKYskbo+tZU9SlfwroanSbtWo8TM3wRyYnheYEiX3acqOjGt0jm
         Aq+EkbGRXFPduqj2T0daMv/5XIIWpJ/wZJ8Ph1P3811GRe/Wo524YxFFD42LMce9paUC
         GvIg==
X-Forwarded-Encrypted: i=1; AJvYcCVgML3zslwS9FiR6D5b1//Zj41aLO6D8oZp4cY8rLghkMdEOm3uvlNghtHOq2hnKQR+yCSXo2Pfk5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjRdbBjn3UREo9AFTcFTV8kutUjOPksLrSscHwjpDIJeZndgCX
	jEpxTrlVSXuo7KEIXmeeWzguNBvggq96I81Lk2Rcb7l7QATHquhhbMIFwmou8CHWTg==
X-Gm-Gg: ASbGnctnjM7uFu20j3dKhe3RkhU7WTO2OuPss/T/ig5PU2pF7VriIzv1QWEMvZLfhpt
	qTC4xrkuwsMAkH290BECLMDhgYC4ZnEIzjWTogf1TfMGTCigZzO9M7k6f/CP8SCZX4NBSSgarsz
	pzviR4MmUsvKh4w2ZRlnSDFJA0d/v+EksC5GWest83FnNTRZe0SyGHWmIYxIjgHDNpqAbh42I8x
	WqrTjQLMMFJumahf9U3kSINlai1jIQncCy+tumTgca4CPupul1nZtJ09J4MsqdAEqbflrpsfulP
	Ou59WZ+U67/o8AheJyyS6LUDUU7+jXxib6MrBcX6GQQVnYdV8yGB2xh2DN0j47Ss64HEs+53b+Z
	eVlPAR4R0U4qTKe3e/p3ATl1mtBydDrUTmV498T0mckG+ja0=
X-Google-Smtp-Source: AGHT+IEd6pS06m/izIOi4t/8jtGVOxdRbgmF2SpKpGrr4xN9y+GK5vE7w3qvEjosnmfw49T4ilANNg==
X-Received: by 2002:adf:fb82:0:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a90da747e9mr13166510f8f.25.1751385670234;
        Tue, 01 Jul 2025 09:01:10 -0700 (PDT)
Message-ID: <99e98299-58b6-4b80-a13f-9c843c604d2e@suse.com>
Date: Tue, 1 Jul 2025 18:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e895039e-48a3-4a46-907d-660555b95dcb@suse.com>
 <aGQDkIuPbQO4emVK@macbook.local>
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
In-Reply-To: <aGQDkIuPbQO4emVK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 17:49, Roger Pau Monné wrote:
> On Mon, Jun 30, 2025 at 08:34:52AM +0200, Jan Beulich wrote:
>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>> @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
>>>  
>>>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>>>      invalid |= mfn & pfn_hole_mask;
>>> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
>>> +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
>>>  #endif
>>>  
>>>      if ( unlikely(evaluate_nospec(invalid)) )
>>
>> In the chat you mentioned that you would add a check against max_pdx here. While
>> that feels sufficient, I couldn't quite convince myself of this formally. Hence
>> an alternative proposal for consideration, which imo is more clearly achieving
>> the effect of allowing for no false-positive results. In particular, how about
>> adding another array holding the PDX upper bounds for the respective region.
>> When naming the existing two arrays moffs[] and poffs[] for brevity, the new
>> one would be plimit[], but indexed by the MFN index. Then we'd end up with
>>
>> 	p = mfn - moffs[midx]; /* Open-coded pfn_to_pdx() */
>> 	invalid |= p >= plimit[midx] || p < plimit[midx - 1];
>>
>> Of course this would need massaging to deal with the midx == 0 case, perhaps by
>> making the array one slot larger and incrementing the indexes by 1. The
>> downside compared to the max_pdx variant is that while it's the same number of
>> memory accesses (and the same number of comparisons [or replacements thereof,
>> like the ^ in context above), cache locality is worse (simply because of the
>> fact that it's another array).
> 
> I've got an alternative proposal, that also uses an extra array but is
> IMO simpler.  Introduce an array to hold the PFN bases for the
> different ranges that are covered by the translation.  Following the
> same example, this would be:
> 
> PFN compression using lookup table shift 29 and region size 0x10000000
>  range 0 [0000000000000, 000000807ffff] PFN IDX   0 : 0000000000000
>  range 1 [0000063e80000, 000006be7ffff] PFN IDX   3 : 0000053e80000
>  range 2 [00000c7e80000, 00000cfe7ffff] PFN IDX   6 : 00000a7e80000
>  range 3 [000012be80000, 0000133e7ffff] PFN IDX   9 : 00000fbe80000
> 
> pfn_bases[] = { [0] =          0, [3] =  0x63e80000,
>                 [6] = 0xc7e80000, [9] = 0x12be80000 };
> 
> With the rest of the entries poisoned to ~0UL.
> 
> The checking would then be:
> 
> base = pfn_bases[PFN_TBL_IDX(mfn)];
> invalid |= mfn < base || mfn >= base + (1UL << pdx_index_shift);
> 
> I think the above is clearer and avoids the weirdness of using IDX +
> 1 for the array indexes.  This relies on the fact that we can obtain
> the PDX region size from the PDX shift itself.

Sounds okay to me.

Jan

