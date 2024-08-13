Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CB95057E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 14:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776225.1186364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqw6-0002fx-6O; Tue, 13 Aug 2024 12:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776225.1186364; Tue, 13 Aug 2024 12:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdqw6-0002dl-3m; Tue, 13 Aug 2024 12:47:38 +0000
Received: by outflank-mailman (input) for mailman id 776225;
 Tue, 13 Aug 2024 12:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdqw4-0002df-On
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 12:47:36 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36731963-5972-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 14:47:34 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso83552111fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 05:47:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fb0acesm67866366b.89.2024.08.13.05.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 05:47:33 -0700 (PDT)
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
X-Inumbo-ID: 36731963-5972-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723553254; x=1724158054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBw8gwpjENpUOK0qposFMMPs6PXJMHDw5kLROU93bfU=;
        b=dRKm0Ytbyc4YJacK4jQuBr8skSVGNVgARovd+TzrSrhq/1aS06D+Dyy2gBtggKLK60
         1tYgMwxyoGuqWmNAGKD0/LAfXMCD1WZisLR/iFesuCJqpUAo639jARZLtToot44GDD/z
         +TFaEuhGBNvPF8iNQMJf/Z3dKcJWvrvlB9eIcm/PmuLrDqpImrcJnrsnivtdC/1YTGjD
         99X/fARNsiiDT79P+tn+jTJL9SzVgjaqRjTTmWTfInbvItxrWxuLzEkdrlwtl1fyJhzj
         X6daVUpIQKldFDSE22eLfLYDgpKbAvB+ONAmYap3Hj2Ec4X2M6bJmTB/7kNlnLFAaYz1
         vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553254; x=1724158054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBw8gwpjENpUOK0qposFMMPs6PXJMHDw5kLROU93bfU=;
        b=RW0gRzc82ifdl+aQnaWMdMt3SJ0bFdNilvbzEQ1NhrmH4Y+gZ2BjiekHzpJ8ZXIQsg
         TqM0rxzXToCZrs3TxxxB5+yr8KaGBWMrrmzQ/bFBEuI2a9vq2O9Vp1wKg+CCllrTPbmc
         Oh1bX4ZmQ4cXPPA3+30bWITA11VEOVhrur7GtaO5dsdxqq83lU4XEB/0+Z8UHh3COpnQ
         1M0btk2ZyjMsQUOqlql0gsqsX+7WRIPKGmUuO9Ttrhbp9LUA5TjMsNQSk6FIY+TeXJKk
         +Yl3D7qLllh804ME0s0zlnCXgwgSH7zEPplVogpUiAN4AHtnam0smJUHD7JZSMBJCyfV
         EWrw==
X-Forwarded-Encrypted: i=1; AJvYcCWyUmev83PRXpe2zqHo7/sdyWdZkkaocNc/lnjmzsZIFQXwelnGxZMzyas0VSQ5FltlSaL5CYE4aH7SSw9tpY8Fpf0O9+S5iun008d0Iog=
X-Gm-Message-State: AOJu0YzH8WhieK+J0zb/lSmzBLuNMpwJ6zXPie9/2kUSRZndnJeKDr1R
	6uqOu9kUdVTdYcI2tsT8Ki5Ex5kijMKDb8VBZFlGF4WmdN57+OkGYRpTLsnUPA==
X-Google-Smtp-Source: AGHT+IFQer+DEwoVXFc8sk/UYHEek+okl+6415jFTS6NWtW+xwn2CM0SbNAEq1etUYc10NiULCNJ3A==
X-Received: by 2002:a2e:be93:0:b0:2ef:2dbe:7455 with SMTP id 38308e7fff4ca-2f2b7146633mr29923851fa.1.1723553253927;
        Tue, 13 Aug 2024 05:47:33 -0700 (PDT)
Message-ID: <b4968a15-176d-4de2-9b51-dd22aa943495@suse.com>
Date: Tue, 13 Aug 2024 14:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/fpu: Split fpu_setup_fpu() in two
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
 <20240808134150.29927-3-alejandro.vallejo@cloud.com>
 <7f001aa8-ee42-4617-8fc4-e4a45d4228e2@suse.com>
 <D3ESHFJW8P2L.1YUEIVC4C77KJ@cloud.com>
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
In-Reply-To: <D3ESHFJW8P2L.1YUEIVC4C77KJ@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2024 14:40, Alejandro Vallejo wrote:
> On Mon Aug 12, 2024 at 4:23 PM BST, Jan Beulich wrote:
>> On 08.08.2024 15:41, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -1164,10 +1164,25 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>>>      seg.attr = ctxt.ldtr_arbytes;
>>>      hvm_set_segment_register(v, x86_seg_ldtr, &seg);
>>>  
>>> -    /* Cover xsave-absent save file restoration on xsave-capable host. */
>>> -    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
>>> -                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
>>> -                   FCW_RESET);
>>> +    /*
>>> +     * On Xen 4.1 and later the FPU state is restored on later HVM context in
>>> +     * the migrate stream, so what we're doing here is initialising the FPU
>>> +     * state for guests from even older versions of Xen.
>>> +     *
>>> +     * In particular:
>>> +     *   1. If there's an XSAVE context later in the stream what we do here for
>>> +     *      the FPU doesn't matter because it'll be overriden later.
>>> +     *   2. If there isn't and the guest didn't use extended states it's still
>>> +     *      fine because we have all the information we need here.
>>> +     *   3. If there isn't and the guest DID use extended states (could've
>>> +     *      happened prior to Xen 4.1) then we're in a pickle because we have
>>> +     *      to make up non-existing state. For this case we initialise the FPU
>>> +     *      as using x87/SSE only because the rest of the state is gone.
>>
>> Was this really possible to happen? Guests wouldn't have been able to
>> turn on CR4.OSXSAVE, would they?
> 
> You may be right, but my reading of the comment and the code was that
> xsave_enabled(v) might be set and the XSAVE hvm context might be missing in the
> stream. The archives didn't shed a lot more light than what the code already
> gives away.
> 
> Otherwise it would've been far simpler to unconditionally pass
> v->arch.xsave_area to the second parameter and let the xsave area to be
> overriden by the follow-up HVM context with its actual state.
> 
> If my understanding is wrong, I'm happy to remove (3), as I don't think it
> affects the code anyway. I thought however that it was a relevant data point
> to leave paper trail for.

I would certainly agree - as long as it describes (past) reality. If it
doesn't, I consider it misleading.

Jan

