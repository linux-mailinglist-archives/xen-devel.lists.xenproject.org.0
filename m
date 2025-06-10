Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450CAD3572
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010715.1388882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOxe1-0008Mp-BF; Tue, 10 Jun 2025 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010715.1388882; Tue, 10 Jun 2025 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOxe1-0008LN-89; Tue, 10 Jun 2025 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1010715;
 Tue, 10 Jun 2025 11:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOxe0-0008LH-4F
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 11:59:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b63c1a8-45f2-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 13:59:53 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so3075411f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 04:59:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532435f95sm7574175f8f.60.2025.06.10.04.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 04:59:52 -0700 (PDT)
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
X-Inumbo-ID: 6b63c1a8-45f2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749556793; x=1750161593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=raWaNDVxzAzVk17YF8f5juSCqNsqhhgPnYBtY+XkZWc=;
        b=R4F3ZSubYnFXy35OTGpgvnVi6zmh5QPEwM6eGZAPypuldIabwM0uijq+gSUzprZNHC
         ebOAwnxQsMD8XwXszSsYCEykBzOsJLeAVe6U+RWf0wWSDx61SxfbbvjAaabCaj4Ua+HM
         gjOTKUITZWTDJzwees7wFWURTasiaGBGOHikS8F637dP7HvrVUeSMDbii+F/ew3YKdUc
         4zEb94udfKQM6T7Be9l1VVH6J7pKEbbK5Mo/XQjC2fxU6XyTl/tOAQIvGLchP6gqPRhN
         ooN+7mCsFa6jKS1SPBOYXCcB7nhjW9e1jihN0MUkhe9BX7VhX5Hx/Itftr7XD1rsTxUs
         AdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556793; x=1750161593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raWaNDVxzAzVk17YF8f5juSCqNsqhhgPnYBtY+XkZWc=;
        b=aBvrUVbVyVq2jHZSUVwD/LuD6juwxezpIpAtf9AMxyDi2AdqZ68W1AO9oi5FwzEeQs
         /FRSJNtd7MDl3NW4jr7A+C6++HuPFzrlLsBOmyy2u+vL/dX8efs0jds23qHLaJxE/uhd
         BbTLuG7xyW+QT7+9cB0r8gnsj0dgH/tRPZ0FGVxOtyQY5x4N3wR2kBGdSLbZIVPVuVnS
         iQt3GGbb6S0Y55Wnt7w5kbFYpfJztvO1HgI3gdQA4vcqHtHG+O/Nf3T/z1vufM1i347G
         Tb68AM66dCBkNxUSSe7ZYK4i9jwAvadYzv4TFuY93xHNzwk+aSso+/fKEPOZmHuufdqq
         tfgg==
X-Gm-Message-State: AOJu0YxEVgQuqW1asRADbftHsnUoVIKQegRqceWNRwNiarmI1qsgoI9y
	YMfn0nGdzuvJXtnQPKdkxs+I4B1HS9JJ1jQmbOjD6tnHaTPRHbpB1ZjF3dzqJ4p4Uw==
X-Gm-Gg: ASbGncvl/bo/MEojEcXvbexj1czUjBy4p/VIhE2SPbqOEWius3+vIQwuBp3OjrABOBu
	ff64IW7X1QufW3vv5ngO9OZaTnqXV9p/56EunMgvdtjhQ5eYS6kMfvDfklyRcE3irXDABrcpDg8
	Epa7+Sh4RrVqhKMUMbzPRs+uFwUn5AJb7zJ679cME6DzHGVLikxEk0G8le5RmlSYcwPpoZb7Xkv
	H8bEA/quQwzCXjs9k6FtBTtosvct7zee2sN/yTWN5K1dTf2bbRR+dlF2tiO3Xs7Vax4sDlUeTfO
	/lWpWAh0sZH0HTxDOedWQqWgRXsxye1hbxkmdEVVS+YpQ0qAw80K/AR00t3Gw3y1Ng/A0SMdP7h
	yE21IT9woteOg9FK3jEx88voL1UTaxl7V4ImKW/igf8o4OjpKQGJ9Tg7BJbx0GoVO0mDNPcwxuf
	h/5tvd5ako2H1sdVeIhCPX
X-Google-Smtp-Source: AGHT+IEtJA0pLD/Z9FE0bvaVzVlpVjClivVfcA8JL9INM182EtCS2wRRREmwZT2CIysBzZnJ3WN2Yg==
X-Received: by 2002:a05:6000:2088:b0:3a4:d98d:76b9 with SMTP id ffacd0b85a97d-3a531cadb37mr11442025f8f.41.1749556792874;
        Tue, 10 Jun 2025 04:59:52 -0700 (PDT)
Message-ID: <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>
Date: Tue, 10 Jun 2025 13:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
 <aEgMe1i4Rpmnz8M9@macbook.local>
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
In-Reply-To: <aEgMe1i4Rpmnz8M9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 12:44, Roger Pau Monné wrote:
> On Tue, Jun 10, 2025 at 09:40:38AM +0200, Jan Beulich wrote:
>> On 09.06.2025 12:36, Roger Pau Monné wrote:
>>> On Wed, Jun 04, 2025 at 11:48:00AM +0200, Jan Beulich wrote:
>>>> @@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
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
>>>
>>> Is the check here required?  memory_type_changed() will already check
>>> for is_iommu_enabled() and cache_flush_permitted(), and hence you
>>> could just set flush to true unconditionally here IMO.
>>
>> The behavioral difference is when both predicates are false: The way I have
>> it now, p2m_memory_type_changed() will then still be called (conditionally),
>> better matching prior behavior.
> 
> I see.  Yes, p2m_memory_type_changed() needs to be called.
> 
>>
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
> 
> When assigning IO resources without an IOMMU enabled we likely need
> to allow the pinned cache attributes to be set, but there's no need to
> propagate the changes to the p2m, as the EMT calculation won't take
> into account the pinned attributes.

Why would it not do so? Am I overlooking a conditional there that would
cause hvm_get_mem_pinned_cacheattr() to not be called? The only related
one I see is

    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
         !cache_flush_permitted(d) )

covering the without-IOMMU case just the same as the "with" one. (The
"without" case looks dubious to me, as I don't think we arrange for
any identity mapping, but that's a separate topic.)

> IOW: I don't think we can safely short-circuit and return -EPERM here
> without agreeing that it's a behavioral difference form the previous
> implementation.

There's no question there is a behavioral change here. Without I/O
resources (and without IOMMU) we simply don't accept cache attributes
other then WB elsewhere; the change is to avoid doing so here as well,
to get things to be consistent. Hence the -EPERM return.

>>>> @@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
>>>>  
>>>>      xfree(newr);
>>>>  
>>>> -    p2m_memory_type_changed(d);
>>>> -    if ( type != X86_MT_WB )
>>>> -        flush_all(FLUSH_CACHE);
>>>> + finish:
>>>> +    if ( flush )
>>>> +        memory_type_changed(d);
>>>> +    else if ( d->vcpu && d->vcpu[0] )
>>>> +        p2m_memory_type_changed(d);
>>>
>>> FWIW, I would just call memory_type_changed() unconditionally
>>> regardless of the change.
>>
>> In which case the need for the "flush" local var would go away, if I
>> understand your suggestion correctly. Like above, there'll then be
>> more of a behavioral change than intended. In particular ...
> 
> There will be a behavioral change, but not one that the guest would
> notice IMO.
> 
>>>  We suspect the hypercall is only used at
>>> domain creation time (where memory_type_changed() won't do a cache
>>> flush anyway).
>>
>> ... "suspect" is not enough for my taste. The only alternative there
>> that I see (as mentioned in a post-commit-message remark) is to
>> refuse such "late" changes altogether. Yet for that we need to be
>> sure, which it looks like no-one of us is.
> 
> Why do you say only alternative?

Oh, sorry, I meant "only" just in regard to options keeping the main
code structure of the change. I agree ...

> Calling memory_type_changed() unconditionally (without taking into
> account the previous or new cache attributes) would also be an
> acceptable solution, that might wide the cache flushing a bit, but
> would still be correct and much simpler IMO.

... that this, too, is a possibility. It would, however, go against the
stated purpose of the change (in the subject "... as well as associated
flushing"), which - after all - was the main goal here, seeing the
series this was originally part of.

Jan

