Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299AB879272
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691757.1078059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjziX-0003uo-EK; Tue, 12 Mar 2024 10:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691757.1078059; Tue, 12 Mar 2024 10:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjziX-0003sh-Av; Tue, 12 Mar 2024 10:50:45 +0000
Received: by outflank-mailman (input) for mailman id 691757;
 Tue, 12 Mar 2024 10:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjziW-0003sb-C5
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:50:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd0dd31-e05e-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 11:50:43 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a44665605f3so753046166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:50:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x11-20020a1709064bcb00b00a449b175d2fsm3729713ejv.222.2024.03.12.03.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:50:42 -0700 (PDT)
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
X-Inumbo-ID: 5fd0dd31-e05e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710240643; x=1710845443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYBA5ZRY3sMwHRTKUt/lRju6/j+m+2WI0qT9VSOvySE=;
        b=ACL20bEkRLf5qZARviwUH3COUKQ6W36sj0lzJKyLCXprVd/2te9lVw1Q8jjcB+B/jy
         V5hOtdF9+Ckxj7GCuo162PuLMN3CnPeFf2dHHRMdcis0HCZMEWu1jit/dSSt8e+vk+mB
         8LdstAQ5ITcZmFyu3tvM8cThe8BSktkNYLE5JJbxMr5ayQ+x/pxWtOy8QwgtMg4A+fNT
         DHTdw3iUrzvB4iW3sU/CuLHW06iqUZCBrhsJYhgriq8W20/Nalqr/FfxYXq4+ok37Ew1
         2imFEkjF2Cx63li7f+ZCL4ep4Q5i4Ym5adfmWvCfacoRHb31a/3WV08L2hrRUszfc3AW
         OOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240643; x=1710845443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYBA5ZRY3sMwHRTKUt/lRju6/j+m+2WI0qT9VSOvySE=;
        b=NnM7TXZKWy/+mU+7XSdYF/V+3URsAywocx9APLqOzCs9KFZeCJJLF4o+YrJaOoSlN5
         UrppC9MmFEIT/1LiB4K/CqblSqobZsU020IPqI9Zv05F+UyENcemku0f+ZQ7kXxiK8AB
         7s3CeE4cqnsv4zGDfS3FUwEqIJ7TscGowcwgw8DTw5aKEQEKfzpN9WGow3rRY9vubH7s
         V38JxGT3mQ2mxYL9iBVRn9HYPr/TdmzKU9PP/VEwTLLLZCcgW/zvySYcOMt1o0Kkwf9V
         1UGhnAUyK0sTt4Z2+Qn3tVV2GekLulUp7r1lGR0SYG9T8zS8ibjhXp/OK/s3d/KenS5a
         /QUA==
X-Forwarded-Encrypted: i=1; AJvYcCWiC18jVFB4SuagQs8JTXFxgSP0UdVOR/vtbr+0Ll4izGzC5kVmHL4cx0bK3p+4S8L8WLybi2Myog+ldsFiNgDR5JWBGc46LbZAKnXWPPo=
X-Gm-Message-State: AOJu0YxBIv7ivqJoFeVCBCbT4KV2m4MWT1BEmbSMXvaHBqcVePAcGTtl
	xtTPa7N9A8ff8RDtWdwl813YT/D4O06xl00OHDbP3BpvM/ylFIjtFXXMpqPKCA==
X-Google-Smtp-Source: AGHT+IH5nZR5vvDN4qN+c89PhcPB2ebU/v35WNGv1h28RdKTbha0GZhT7FgsPZCFJY6E8KRYjz4KUQ==
X-Received: by 2002:a17:906:19c5:b0:a46:2c22:7f4c with SMTP id h5-20020a17090619c500b00a462c227f4cmr3090292ejd.35.1710240642995;
        Tue, 12 Mar 2024 03:50:42 -0700 (PDT)
Message-ID: <b6c32d82-1081-49c3-9d09-99561847bfd5@suse.com>
Date: Tue, 12 Mar 2024 11:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/svm: Drop the suffix _guest from vmcb bit
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <b0e5dde517599e8af5aadbaff7dd4410e83fcf86.1710149462.git.vaishali.thakkar@vates.tech>
 <d2830e8e-6cf5-4266-a7ac-c5103fcae233@suse.com>
 <b0740f0b-0833-4d7b-959b-89a3cef051d5@vates.tech>
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
In-Reply-To: <b0740f0b-0833-4d7b-959b-89a3cef051d5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 11:08, Vaishali Thakkar wrote:
> On 3/12/24 08:59, Jan Beulich wrote:
>> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>>> @@ -698,11 +698,11 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>>       /* Convert explicitely to boolean. Deals with l1 guests
>>>        * that use flush-by-asid w/o checking the cpuid bits */
>>>       nv->nv_flushp2m = !!ns_vmcb->tlb_control;
>>> -    if ( svm->ns_guest_asid != ns_vmcb->_guest_asid )
>>> +    if ( svm->ns_asid != ns_vmcb->_asid )
>>>       {
>>>           nv->nv_flushp2m = 1;
>>>           hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>>> -        svm->ns_guest_asid = ns_vmcb->_guest_asid;
>>> +        svm->ns_asid = ns_vmcb->_asid;
>>>       }
>>>   
>>>       /* nested paging for the guest */
>>> @@ -1046,7 +1046,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>       /* Keep it. It's maintainted by the l1 guest. */
>>>   
>>>       /* ASID */
>>> -    /* ns_vmcb->_guest_asid = n2vmcb->_guest_asid; */
>>> +    /* ns_vmcb->_asid = n2vmcb->_asid; */
>>
>> Unlike in the earlier patch, where I could accept the request to switch
>> to using accessor functions as scope-creep-ish, here I'm pretty firm
>> with my request to stop their open-coding at the same time. Unless of
>> course there's a technical reason the accessors cannot be used here.
> 
> Yes, so as mentioned in the other patch's reply, I plan to tackle this 
> instance too in the followup patchset along with others. So, if you're
> fine with it, I'll leave this one here for now. Unless you prefer otherwise.

I thought I said pretty clearly that here I'm stronger with my request
than on the other patch.

Jan

