Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C089055CC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 16:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739393.1146407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPLj-0002YI-2T; Wed, 12 Jun 2024 14:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739393.1146407; Wed, 12 Jun 2024 14:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPLi-0002Wn-Ue; Wed, 12 Jun 2024 14:53:18 +0000
Received: by outflank-mailman (input) for mailman id 739393;
 Wed, 12 Jun 2024 14:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHPLh-0002Wf-2j
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 14:53:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7faf3f02-28cb-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 16:53:15 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57ca81533d0so1620405a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 07:53:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6ef83ac0c4sm654263666b.74.2024.06.12.07.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:53:15 -0700 (PDT)
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
X-Inumbo-ID: 7faf3f02-28cb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718203995; x=1718808795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KMfultdLDvWcbbfzC1McmTyqZlehqGAI5EuXh7v3no0=;
        b=XHBxSEWMV4Xett/K4NnOKPkBfGF7UBPP892dMGMe1iRbvyZqZEkoUA8xjuA7iJlOse
         agQp1gshxHJ2razcZkGOE99pj1pYsQ28s8F11ajp43KLHfWhBQLIyFTv6pJJRcpfLyxO
         ycaXgV9vMR979moDQp2pkYQLTsN31WZAkh0CX2HnVAnxae1mOFHzD9o8ZJu9K7EPL5vn
         j3e+hwjSKpvScU5JqmzxuPdbgkWiOUcOOyHjWw0tUoJsS7sUWbLLaQrs635uyJ/bi9EP
         ZyG9HX8QMomrH9w2TTOEMkGGJrtg/vRMUwLa6JuGAdWKold/2/WBIj5NMqt33w/UgWIT
         cxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203995; x=1718808795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMfultdLDvWcbbfzC1McmTyqZlehqGAI5EuXh7v3no0=;
        b=IcTky1h7QJ0RSSSwGP+BoXkJ/JtWYWMV7bXxgkNu4F6E1I+EY/BiwRNgym76BxDR2y
         8P3KLkJMlz/pdZ81FeElMFsKQE8fBrxeebnOnL/72UmKdU/sK4EDaVaKtDmRRFGqxCHU
         0FCgyPbcDWDZaCI2YDwXzbOh27efTeXmQRILr+YbLhJUUNsTrEj4t8LPv9eOHS98CQ4x
         OqiQftVPkQprW6Zm4m9t761AywKHGAkjgPJXKuMJ/l11QWXTetTtJi4Di3Y+cPVCV1uZ
         lG2vPatCErUzmxIeiYZ/ORZdTn2C4J5CFur/ra8hSKI5i2RTMKz3lOh5UxGNZds0Glcs
         6Aog==
X-Gm-Message-State: AOJu0YzQP7uC/HG2uS9NBDv8oiEfRcZxyBuA5ByUej2KBiNFu6EH6ek9
	ZIfxwTqg7BPwlfbxinBhZTZLgs4DVTIrKOHORh2aP3vInHgO9/4DWVPMC5UNjw==
X-Google-Smtp-Source: AGHT+IG4X/QPKD+xKjNDSrdz9/1FXMTgnLZcFFfG1GXXbfAMAyMOtizDFHET+2hsiUxS0SLWoydP/Q==
X-Received: by 2002:a17:906:31d3:b0:a6e:f99b:cd57 with SMTP id a640c23a62f3a-a6f468f2032mr138709166b.34.1718203995279;
        Wed, 12 Jun 2024 07:53:15 -0700 (PDT)
Message-ID: <e944583a-2459-435f-90fb-04bcca18197f@suse.com>
Date: Wed, 12 Jun 2024 16:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.19 2/3] x86/EPT: avoid marking non-present
 entries for re-configuring
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com> <Zmmy_-JqqWRuwvCj@macbook>
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
In-Reply-To: <Zmmy_-JqqWRuwvCj@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 16:38, Roger Pau Monné wrote:
> On Wed, Jun 12, 2024 at 03:16:59PM +0200, Jan Beulich wrote:
>> For non-present entries EMT, like most other fields, is meaningless to
>> hardware. Make the logic in ept_set_entry() setting the field (and iPAT)
>> conditional upon dealing with a present entry, leaving the value at 0
>> otherwise. This has two effects for epte_get_entry_emt() which we'll
>> want to leverage subsequently:
>> 1) The call moved here now won't be issued with INVALID_MFN anymore (a
>>    respective BUG_ON() is being added).
>> 2) Neither of the other two calls could now be issued with a truncated
>>    form of INVALID_MFN anymore (as long as there's no bug anywhere
>>    marking an entry present when that was populated using INVALID_MFN).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: New.
>>
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -650,6 +650,8 @@ static int cf_check resolve_misconfig(st
>>              if ( e.emt != MTRR_NUM_TYPES )
>>                  break;
>>  
>> +            ASSERT(is_epte_present(&e));
> 
> If this is added here, then there's a condition further below:
> 
> if ( !is_epte_valid(&e) || !is_epte_present(&e) )
> 
> That needs adjusting AFAICT.

I don't think so, because e was re-fetched in between.

> However, in ept_set_entry() we seem to unconditionally call
> resolve_misconfig() against the new entry to be populated, won't this
> possibly cause resolve_misconfig() to be called against non-present
> EPT entries?  I think this is fine because such non-present entries
> will have emt == 0, and hence will take the break just ahead of the
> added ASSERT().

Right, hence how I placed this assertion.

>> @@ -941,6 +932,22 @@ ept_set_entry(struct p2m_domain *p2m, gf
>>              need_modify_vtd_table = 0;
>>  
>>          ept_p2m_type_to_flags(p2m, &new_entry);
>> +
>> +        if ( is_epte_present(&new_entry) )
>> +        {
>> +            bool ipat;
>> +            int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
>> +                                         i * EPT_TABLE_ORDER, &ipat,
>> +                                         p2mt);
>> +
>> +            BUG_ON(mfn_eq(mfn, INVALID_MFN));
>> +
>> +            if ( emt >= 0 )
>> +                new_entry.emt = emt;
>> +            else /* ept_handle_misconfig() will need to take care of this. */
>> +                new_entry.emt = MTRR_NUM_TYPES;
>> +            new_entry.ipat = ipat;
>> +        }
> 
> Should we assert that if new_entry.emt == MTRR_NUM_TYPES the entry
> must have the present bit set before the atomic_write_ept_entry()
> call?

This would feel excessive to me. All writing to new_entry is close together,
immediately ahead of that atomic_write_ept_entry(). And we're (now) writing
MTRR_NUM_TYPES only when is_epte_present() is true (note that it's not "the
present bit").

Jan

