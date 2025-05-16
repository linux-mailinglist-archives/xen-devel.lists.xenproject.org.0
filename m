Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14521AB96F2
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986423.1371979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpv6-0001hX-60; Fri, 16 May 2025 07:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986423.1371979; Fri, 16 May 2025 07:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpv6-0001fa-33; Fri, 16 May 2025 07:55:52 +0000
Received: by outflank-mailman (input) for mailman id 986423;
 Fri, 16 May 2025 07:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFpv4-0001fT-31
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:55:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d971b78-322b-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:55:48 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad23db02350so341340666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:55:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d496576sm110783866b.133.2025.05.16.00.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:55:47 -0700 (PDT)
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
X-Inumbo-ID: 2d971b78-322b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747382147; x=1747986947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9YQR22x67Cw2L+wlNceLkVyk0xOaNpkeKO1tCeDrVM=;
        b=IWOAHLUyoa35tvCUZsaOKvPUBQcrF1ZTdt0uy6RxgU8xrGH5LzV6KyWVG4quH9UOuL
         8GGSs3VG7oE2oqQm8T/lI9gTARbyjKLxz1dS88X769zkU+uCkRTfOjqo+XQOBX/H/+8Q
         U5cffN+OHUoffkzVDFl0gJ4HlKowM0wVaxDmMUBrQvqisTC4YgWvMSeAEeiHLTT+/ui0
         E3olgcxDQfflmPg9GglQilyn4P9PQWCeoYkjcqRlp9RJxt76Uq2TyBWbP1zVTQmyT2kj
         QtO6KdU8nTiwXVOTP9a3W4D1BUzwCxsQonimCw6DE9N/DRvKaIitF3p+qOsWyCcBqxfs
         aDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382147; x=1747986947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9YQR22x67Cw2L+wlNceLkVyk0xOaNpkeKO1tCeDrVM=;
        b=RYEIpG9ibHPs5E50YjIjjh1vsICTff9HGJy6tW4XLLSQPGCWEH2jLoTR7vPFYaECP3
         qdPPgasq08aaEITZ9BYzz9dHrUkOzvh1gsUpNIRKqdnZcKpoNR26CnsE3E4JeD1czlxZ
         ZVSLRYczD4BkLD/bNTZMxAL5E2Tcr2oh3fEo1rQC2lZbyFQlZjtXl/WpO53Wwj8eIA2j
         FDGMZ1Jh3Y+MIKLg7Z5dVFASynSeMAMWMysaQhhu+Q/CNlF1FLam489L/dT/Qc1zFnEw
         PFgFNQvz/xhvxAddTZK76OrIalQ67vKunGbkenBMr8ZzFdBrFevA9/ESpIYOz6x+bkLK
         QWTw==
X-Gm-Message-State: AOJu0YyAZhScOvHKn9g8PW+hjUnPIpNlE7AUMbcB4p/2zN7pmZrwBKV4
	T0ELMQDhixw+WM2pM8q5fionsvn43NOorBvHIuGbzM65J23fZHdnF3FVBHJf/sFH6Q==
X-Gm-Gg: ASbGncshvFOGbBS4RIzlEZpkc7nEWwBFgT37BDIxfZjSIsC5Wnm4C6FxDy2eF1ktUvy
	tEhxU5AhDsdH65pijdetY9OJnG40K9qiMO9HnKMk8XPWTpd1Sr11fAQYpsn9Q3qinsFtZSmJYhN
	2zto3cOhTeR/vYKpuUKcH9WdnOFrqDbnFLiBmgZvyZtD9QqYjqSzwKaen2HN9DAAEdH0/l51VWw
	/wyq832wC6DiUV9b71G4x7aC28JOozRFvCvUUoy53PxNbgwsXHWwLnqU1sWNPIGGKrFs+Rx4YWp
	9U/hf3bjLGOLqp9o4jcRglDvlu+sCiM1UhjXc5hG3IlStni8bUExRQiJ7c+UWnLdS/k8dcgTtJT
	iSTpxvlTzs7jcl4PgWaq5Z+6uq6Qp60j5Svdz
X-Google-Smtp-Source: AGHT+IHBTo/p6jqWgGecC9rt3UmM8FNl92Xrol6gmevWOj4sbyLGU2ojNCuKyGHESdSXlYQbXzDITA==
X-Received: by 2002:a17:907:60d6:b0:ad5:211e:8cff with SMTP id a640c23a62f3a-ad52d5ba7b7mr224176366b.37.1747382147308;
        Fri, 16 May 2025 00:55:47 -0700 (PDT)
Message-ID: <22427127-af31-4f67-8988-b64d7d75e03a@suse.com>
Date: Fri, 16 May 2025 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>
 <aCW8RKZZCkvCuw5W@macbook.lan>
 <2032431f-fa8b-47ec-8879-29baadd266bd@suse.com>
 <aCbssIXqIBDI5C9a@macbook.lan>
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
In-Reply-To: <aCbssIXqIBDI5C9a@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 09:43, Roger Pau Monné wrote:
> On Fri, May 16, 2025 at 08:54:52AM +0200, Jan Beulich wrote:
>> On 15.05.2025 12:04, Roger Pau Monné wrote:
>>> On Wed, Mar 22, 2023 at 07:50:09AM +0100, Jan Beulich wrote:
>>>> We don't permit use of uncachable memory types elsewhere unless a domain
>>>> meets certain criteria. Enforce this also during registration of pinned
>>>> cache attribute ranges.
>>>>
>>>> Furthermore restrict cache flushing to just uncachable range registration.
>>>> While there, also
>>>> - take CPU self-snoop as well as IOMMU snoop into account (albeit the
>>>>   latter still is a global property rather than a per-domain one),
>>>> - avoid flushes when the domain isn't running yet (which ought to be the
>>>>   common case).
>>>>
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> At the expense of yet larger a diff it would be possible to get away
>>>> without any "goto", by moving the whole "new entry" handling into the
>>>> switch(). Personally I'd prefer that, but the larger diff may be
>>>> unwelcome.
>>>>
>>>> I have to admit that I can't spot what part of epte_get_entry_emt() the
>>>> comment refers to that is being deleted. The function does use
>>>> hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
>>>> about cache flushes (and their avoiding) in any way.
>>>>
>>>> Is it really sensible to add/remove ranges once the guest is already
>>>> running? (If it is, limiting the scope of the flush would be nice, but
>>>> would require knowing dirtyness for the domain wrt the caches, which
>>>> currently we don't track.)
>>>>
>>>> This is kind of amending XSA-428.
>>>>
>>>> --- a/xen/arch/x86/hvm/mtrr.c
>>>> +++ b/xen/arch/x86/hvm/mtrr.c
>>>> @@ -589,6 +589,7 @@ int hvm_set_mem_pinned_cacheattr(struct
>>>>  {
>>>>      struct hvm_mem_pinned_cacheattr_range *range, *newr;
>>>>      unsigned int nr = 0;
>>>> +    bool flush = false;
>>>>      int rc = 1;
>>>>  
>>>>      if ( !is_hvm_domain(d) )
>>>> @@ -612,31 +613,35 @@ int hvm_set_mem_pinned_cacheattr(struct
>>>>  
>>>>                  type = range->type;
>>>>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
>>>> -                p2m_memory_type_changed(d);
>>>>                  switch ( type )
>>>>                  {
>>>> -                case X86_MT_UCM:
>>>> +                case X86_MT_WB:
>>>> +                case X86_MT_WP:
>>>> +                case X86_MT_WT:
>>>>                      /*
>>>> -                     * For EPT we can also avoid the flush in this case;
>>>> -                     * see epte_get_entry_emt().
>>>> +                     * Flush since we don't know what the cachability is going
>>>> +                     * to be.
>>>>                       */
>>>> -                    if ( hap_enabled(d) && cpu_has_vmx )
>>>> -                case X86_MT_UC:
>>>> -                        break;
>>>> -                    /* fall through */
>>>> -                default:
>>>> -                    flush_all(FLUSH_CACHE);
>>>> +                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
>>>> +                        flush = true;
>>>>                      break;
>>>>                  }
>>>> -                return 0;
>>>> +                rc = 0;
>>>> +                goto finish;
>>>>              }
>>>>          domain_unlock(d);
>>>>          return -ENOENT;
>>>>  
>>>>      case X86_MT_UCM:
>>>>      case X86_MT_UC:
>>>> -    case X86_MT_WB:
>>>>      case X86_MT_WC:
>>>> +        /* Flush since we don't know what the cachability was. */
>>>> +        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
>>>> +            return -EPERM;
>>>> +        flush = true;
>>>> +        break;
>>>> +
>>>> +    case X86_MT_WB:
>>>>      case X86_MT_WP:
>>>>      case X86_MT_WT:
>>>>          break;
>>>> @@ -689,8 +694,12 @@ int hvm_set_mem_pinned_cacheattr(struct
>>>>  
>>>>      xfree(newr);
>>>>  
>>>> + finish:
>>>>      p2m_memory_type_changed(d);
>>>> -    if ( type != X86_MT_WB )
>>>> +
>>>> +    if ( flush && d->creation_finished &&
>>>> +         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
>>>> +          (is_iommu_enabled(d) && !iommu_snoop)) )
>>>>          flush_all(FLUSH_CACHE);
>>>
>>> I think it would be better if we could add those checks to
>>> memory_type_changed() rather than open-coding them here, and just call
>>> memory_type_changed() then, which would also avoid the goto AFAICT.
>>
>> Hmm, with this last remark, what does "those checks" cover then?
> 
> I have a patches I was going to send today (done some overnight
> testing) that do:
> 
>     if ( cache_flush_permitted(d) &&
>          d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
>          /*
>           * Do the p2m type-change, but skip the cache flush if the domain is
>           * not yet running.  The check for creation_finished must strictly be
>           * done after the call to p2m_memory_type_changed().
>           */
>          d->creation_finished &&
>          /*
>           * The cache flush should be done if either: CPU doesn't have
>           * self-snoop in which case there could be aliases left in the cache,
>           * or IOMMUs cannot force all DMA device accesses to be snooped.
>           */
>          (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
>           (is_iommu_enabled(d) && !iommu_snoop)) )
>     {
>         flush_all(FLUSH_CACHE);
>     }
> 
> As to attempt to limit the cache flushing done in
> memory_type_changed().
> 
>> I first
>> read it as meaning the conditions in just this if(), but the "goto" is
>> needed for a different reason.
> 
> Maybe I'm missing something, but couldn't
> hvm_set_mem_pinned_cacheattr() just call memory_type_changed() (with
> the proposed checks above added) if and return then, instead of doing
> a goto?

As per later replies to your patch - yes, looks like that's possible.

Jan

