Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B43AB964E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 08:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986328.1371890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFoyA-00064R-3J; Fri, 16 May 2025 06:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986328.1371890; Fri, 16 May 2025 06:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFoyA-00062O-03; Fri, 16 May 2025 06:54:58 +0000
Received: by outflank-mailman (input) for mailman id 986328;
 Fri, 16 May 2025 06:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFoy9-00062I-43
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 06:54:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac207467-3222-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 08:54:54 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fbf52aad74so5485062a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 23:54:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4d27e8sm102157166b.174.2025.05.15.23.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 23:54:53 -0700 (PDT)
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
X-Inumbo-ID: ac207467-3222-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747378494; x=1747983294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H+ueh+xRWH9F0Fp0CCy3syRXy2wWNOh7EahesQF6JGw=;
        b=C9USGKREEeGaTgDmHeJZBqbRvZRonGMd+yhv1fZ+WJcGZlpOL5msm3idDZ/CCuW1y9
         wk1ghCWyDoZ/+rFPEjA2PPVey/Qgj5+5Ctnf7VycP9lBka4spGggpklMZdlxGWEvx1zG
         0VXK4lYFXBTPN0+j2CMNNVYH1oLE7sF/UyhQiqv0HhU+hAoTHNUqFkVk6ecQlEbDvbEb
         FchS8FnJqa+KcjVLnzHZ30GSrysU7n2bSMzQjyLSFKu94ZlX8RAF2EFnDXSyckgDawMh
         pjqObBtQAyekZwXJhdvTeC5AanqukhYZ43IhZQjCw9Z6OPHf43RmjrNMAMwaqJO+0ZoJ
         aLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747378494; x=1747983294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+ueh+xRWH9F0Fp0CCy3syRXy2wWNOh7EahesQF6JGw=;
        b=VraKrLt+6npO1SXQZebBX7SDy7G3PsWR/6HJSd+g27BmB6El4kyNVrGcj+zc8fKBGI
         uH6RipSH0oN34qD6BGr2qim04aH+sbiFHfLCbMPZOp9jTA7f30BBbAkX3VdwGQ3J6w7J
         gq/8DPOhPuDdUzxapUp4Ertc2usDplvrwmYcPKkq4UwtfK3t9rOpJeNfvZMmbGejRPkn
         fErm54mzghVLDep+H0CC4PEjOBe42YUyFb16Tr1un2g3zMRbOfHZyhYVRTUclG84uHVR
         HhOAwrz4BUPfPzmz2+FQc55LC3K+w+sWILxmVPcotiJ0Q7MOccKH91twFmiMIUTBqywF
         4xEg==
X-Gm-Message-State: AOJu0Yxr3hZMI1Rv1UVQlLeAdNpG30CkYubibt08hv8xs5HVKooHYhYn
	4PwMRV29AmXY8lRubHqG32N/+Qu78yXzIEGd7KNfnYV5h2Oq2teemD3/JSoLOvGiGQ==
X-Gm-Gg: ASbGncvLqDmnhFxk4iSS+vQiEjQ7h59vat6yUwDG4QsOIBbuBq0+5+3VSDAViunem5c
	IXoZR1yzWtrKmy5ts4kjOuZsTSTrbq/rtanfWhYwcA1Eqdp5RfDa0m9cMZpML7aWfxy7uWwaSRY
	K+rftKUDitt98MWj3AefKcTGoDJq0qmimSAP2Dfr136m5/d9V5A8GVxlh8YvuWfSzqOtontdq4z
	eSaKcowH2VyI06Cr/7sz0bwRb23LzO413owInfl/I4VoAcdzsn2Ailps7v4QTMQmoSDueIHDe1n
	bDJ7ZG9RZ4tn8Ozmx7lSS79qTnGK1yoyIWqggpM3qXkulhxmvYAkBc1QLkutJRtwbjaUu0uz5rk
	hgwLn/wDGXNJSg1rb9XLDLi8N5QHtCwBl/uHeeES4UitguFc=
X-Google-Smtp-Source: AGHT+IHlZHaWe4BLNCVr+ft24X9TYMIVhcZ4UNBWRInFxrljBHnZgwBzW6HopMxyADLwpcyBgryBtg==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr171977566b.25.1747378494152;
        Thu, 15 May 2025 23:54:54 -0700 (PDT)
Message-ID: <2032431f-fa8b-47ec-8879-29baadd266bd@suse.com>
Date: Fri, 16 May 2025 08:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>
 <aCW8RKZZCkvCuw5W@macbook.lan>
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
In-Reply-To: <aCW8RKZZCkvCuw5W@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:04, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 07:50:09AM +0100, Jan Beulich wrote:
>> We don't permit use of uncachable memory types elsewhere unless a domain
>> meets certain criteria. Enforce this also during registration of pinned
>> cache attribute ranges.
>>
>> Furthermore restrict cache flushing to just uncachable range registration.
>> While there, also
>> - take CPU self-snoop as well as IOMMU snoop into account (albeit the
>>   latter still is a global property rather than a per-domain one),
>> - avoid flushes when the domain isn't running yet (which ought to be the
>>   common case).
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> At the expense of yet larger a diff it would be possible to get away
>> without any "goto", by moving the whole "new entry" handling into the
>> switch(). Personally I'd prefer that, but the larger diff may be
>> unwelcome.
>>
>> I have to admit that I can't spot what part of epte_get_entry_emt() the
>> comment refers to that is being deleted. The function does use
>> hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
>> about cache flushes (and their avoiding) in any way.
>>
>> Is it really sensible to add/remove ranges once the guest is already
>> running? (If it is, limiting the scope of the flush would be nice, but
>> would require knowing dirtyness for the domain wrt the caches, which
>> currently we don't track.)
>>
>> This is kind of amending XSA-428.
>>
>> --- a/xen/arch/x86/hvm/mtrr.c
>> +++ b/xen/arch/x86/hvm/mtrr.c
>> @@ -589,6 +589,7 @@ int hvm_set_mem_pinned_cacheattr(struct
>>  {
>>      struct hvm_mem_pinned_cacheattr_range *range, *newr;
>>      unsigned int nr = 0;
>> +    bool flush = false;
>>      int rc = 1;
>>  
>>      if ( !is_hvm_domain(d) )
>> @@ -612,31 +613,35 @@ int hvm_set_mem_pinned_cacheattr(struct
>>  
>>                  type = range->type;
>>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
>> -                p2m_memory_type_changed(d);
>>                  switch ( type )
>>                  {
>> -                case X86_MT_UCM:
>> +                case X86_MT_WB:
>> +                case X86_MT_WP:
>> +                case X86_MT_WT:
>>                      /*
>> -                     * For EPT we can also avoid the flush in this case;
>> -                     * see epte_get_entry_emt().
>> +                     * Flush since we don't know what the cachability is going
>> +                     * to be.
>>                       */
>> -                    if ( hap_enabled(d) && cpu_has_vmx )
>> -                case X86_MT_UC:
>> -                        break;
>> -                    /* fall through */
>> -                default:
>> -                    flush_all(FLUSH_CACHE);
>> +                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
>> +                        flush = true;
>>                      break;
>>                  }
>> -                return 0;
>> +                rc = 0;
>> +                goto finish;
>>              }
>>          domain_unlock(d);
>>          return -ENOENT;
>>  
>>      case X86_MT_UCM:
>>      case X86_MT_UC:
>> -    case X86_MT_WB:
>>      case X86_MT_WC:
>> +        /* Flush since we don't know what the cachability was. */
>> +        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
>> +            return -EPERM;
>> +        flush = true;
>> +        break;
>> +
>> +    case X86_MT_WB:
>>      case X86_MT_WP:
>>      case X86_MT_WT:
>>          break;
>> @@ -689,8 +694,12 @@ int hvm_set_mem_pinned_cacheattr(struct
>>  
>>      xfree(newr);
>>  
>> + finish:
>>      p2m_memory_type_changed(d);
>> -    if ( type != X86_MT_WB )
>> +
>> +    if ( flush && d->creation_finished &&
>> +         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
>> +          (is_iommu_enabled(d) && !iommu_snoop)) )
>>          flush_all(FLUSH_CACHE);
> 
> I think it would be better if we could add those checks to
> memory_type_changed() rather than open-coding them here, and just call
> memory_type_changed() then, which would also avoid the goto AFAICT.

Hmm, with this last remark, what does "those checks" cover then? I first
read it as meaning the conditions in just this if(), but the "goto" is
needed for a different reason.

Jan

