Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE11AD2F02
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 09:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010544.1388667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtb8-0008WE-Ij; Tue, 10 Jun 2025 07:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010544.1388667; Tue, 10 Jun 2025 07:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtb8-0008Uh-Ft; Tue, 10 Jun 2025 07:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1010544;
 Tue, 10 Jun 2025 07:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOtb7-0008TI-F5
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 07:40:41 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 303c4407-45ce-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 09:40:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so4356603f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 00:40:39 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324360a3sm11643349f8f.50.2025.06.10.00.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:40:38 -0700 (PDT)
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
X-Inumbo-ID: 303c4407-45ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749541238; x=1750146038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WGPmr254+fUvyiqnH6r2Z3+S7aNGdpLaH0Vp/MfxfO8=;
        b=Vl6UAVQq1n9+7YmJvZKIDxsDlEEZ24vKTa2KPpD9KA4EmFAqkSIRAc4gYz/KuBcs9x
         MQpuK78GcAYTXQvkDPYtggf9eHgS1jZrylh3pP8AJpXcQjSTbFj7fjV27sUNIoBfIJGH
         joY5KWWG+iK3vt7rTLOnPr0mWy65MB8rB+zZic8gNubyaUzMXWaPXmP68hBF1VhOJIKU
         2v8sKGzOBrlMbdp6LsU6kZfIEFcCyin3vYvEm7HQDX89I3BDiH9o9tg3qYc3uLw69I2L
         n7LjQf9N/ONcHfCD1dj/xTDvVqIpSjqMDX1PwVWkF++CKFKJpZiTb/R5K0BRPQJlk2VG
         v+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541238; x=1750146038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGPmr254+fUvyiqnH6r2Z3+S7aNGdpLaH0Vp/MfxfO8=;
        b=g9OkWLdBFHwKjDNjaWATvUjY0ZeOzQqpKErXYEW2EPDN6M5JzL0ug58G+ZNlmo22Rx
         bWPtwT7dKX9e/2oj121c2ImzpDGExwvX2sS/9ku6gluZpGz54xM4PeXaKtflXEqm6h8u
         vd32YN07ubYpWEqYKgksjW7bTvQgFwI8vG43ufDnT6+TipETCvjkHVvrI7heFcyUE4ol
         7TgOtx1J/QaViAkIKb1GiwK7r1WDAJ0V8LnpYwbddd8R0H8AvZuF0AT+RjI7n8lfAFES
         Ohgwg3BAjjlK9eGqLjzcY3mjl/gxfM+tA9YjM1gyjHcn3jM1ieCDZbXC4mDL0ftwCNVr
         Knag==
X-Gm-Message-State: AOJu0YxqWLLjOvuTEEhY8Gt48QBzJixWGMmidU9hGEbPdgpis8gFsL/N
	d8V/kDYyy1O1+XGQChaX2crYCJatej+PRkGbw//RuwKckPRg3388apWzREFGQzp++Q==
X-Gm-Gg: ASbGncvZ72JpYn5SxlLlPFwVOST/z3N2BfGlSao/60tA+znja0rIx8ulF+hBAfUtKse
	wBoCrhLXH16qPbXjEuZZe7/q5RYZK28yMbJjWQhyIoGN7JD8Wiu7m1pAdrYE9pjJtNU4uIsKerv
	HmJruzWiStp7V+QAFG3X+MNXKlBEBe+20cdkiAYZ06/5cETfx9ufDKNlS8JmWE+3wDqYLQH7p5T
	E9AW3BPm2OEDCOAAwNyUejbj2ASw0BMi9rdB0QNf89KpoNZd44H3D37cYu9egaEsoYQrycOR87w
	w6Nv+TnMjyRUCegSTV5WlymMmwjMErdwZ/gYAJJ/phbbFoSM5AgSTLa/YgEmeCaWVkyIuA5QMbr
	Q7HucM4CdDbQ1bYU6eCmiZqQ36RoxOKKxD8nm85nDMavh3H8CE2jiWEipCuqwa6FZkiYzmIB+Ow
	rqiUDzfaFfHaAjAjvMNxp1OMdszqam5jo=
X-Google-Smtp-Source: AGHT+IH504FJdMWI939rh5fNfypQ3fKkpJw/a1y+bMxOAhBucalXorOPQ/jTWmkRcKxfLMsxAyYOhQ==
X-Received: by 2002:a05:6000:178f:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3a531ce73bbmr12799646f8f.52.1749541238525;
        Tue, 10 Jun 2025 00:40:38 -0700 (PDT)
Message-ID: <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
Date: Tue, 10 Jun 2025 09:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
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
In-Reply-To: <aEa5J_TlSAdS9-m_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.06.2025 12:36, Roger Pau Monné wrote:
> On Wed, Jun 04, 2025 at 11:48:00AM +0200, Jan Beulich wrote:
>> @@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
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
> 
> Is the check here required?  memory_type_changed() will already check
> for is_iommu_enabled() and cache_flush_permitted(), and hence you
> could just set flush to true unconditionally here IMO.

The behavioral difference is when both predicates are false: The way I have
it now, p2m_memory_type_changed() will then still be called (conditionally),
better matching prior behavior.

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
>> @@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
>>  
>>      xfree(newr);
>>  
>> -    p2m_memory_type_changed(d);
>> -    if ( type != X86_MT_WB )
>> -        flush_all(FLUSH_CACHE);
>> + finish:
>> +    if ( flush )
>> +        memory_type_changed(d);
>> +    else if ( d->vcpu && d->vcpu[0] )
>> +        p2m_memory_type_changed(d);
> 
> FWIW, I would just call memory_type_changed() unconditionally
> regardless of the change.

In which case the need for the "flush" local var would go away, if I
understand your suggestion correctly. Like above, there'll then be
more of a behavioral change than intended. In particular ...

>  We suspect the hypercall is only used at
> domain creation time (where memory_type_changed() won't do a cache
> flush anyway).

... "suspect" is not enough for my taste. The only alternative there
that I see (as mentioned in a post-commit-message remark) is to
refuse such "late" changes altogether. Yet for that we need to be
sure, which it looks like no-one of us is.

Jan

