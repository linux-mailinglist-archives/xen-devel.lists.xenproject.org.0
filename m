Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62F88F812
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698806.1090967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjUk-0001hQ-5K; Thu, 28 Mar 2024 06:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698806.1090967; Thu, 28 Mar 2024 06:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjUk-0001ee-24; Thu, 28 Mar 2024 06:44:14 +0000
Received: by outflank-mailman (input) for mailman id 698806;
 Thu, 28 Mar 2024 06:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpjUi-0001eX-PI
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:44:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9516463d-ecce-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 07:44:10 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33eee0258abso308442f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 23:44:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b738:601a:1073:a6:6f09:9d9a?
 (p200300cab738601a107300a66f099d9a.dip0.t-ipconnect.de.
 [2003:ca:b738:601a:1073:a6:6f09:9d9a])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfca12000000b0033ec81ec4aesm865204wrh.78.2024.03.27.23.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 23:44:09 -0700 (PDT)
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
X-Inumbo-ID: 9516463d-ecce-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711608250; x=1712213050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+ngn8E3vs13LHuA7cDAEqxMP1Otz8IieGxNdDhDTH4=;
        b=IPFac2HzEIycZGTkj8rJvqR/FMgotuV7U7mBBGg4pEHqaoPAfWh/NsLXDYMias5/NO
         a3/OXiSKoRQE6dtIggYz5N+DtWwrM/XQN0OKEQlAGuVodru2KH3kRh/NyGKBWl1MtYVK
         j32AcpxpxSSeNp8ARKQqjyG6FWnkp8kX20ZAU4kgO0okK1TwpfTtg55K+Pi2t3EQt90C
         28ID80jZQiAIy4PZUXxGDZyrgI28oQk/t1p5HaRPxK2zp4FAa2c/KDJogls1iPoaVCKU
         cNJy0HjBWpE57No2iK+5yWcfs91TY/qIacsAh+DL9hOI5UyevJMBOEC7d9OfohLF7Jyq
         P6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711608250; x=1712213050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+ngn8E3vs13LHuA7cDAEqxMP1Otz8IieGxNdDhDTH4=;
        b=YlYo+0ttcSKFadA0DDnT+GcGbhICk8+WyW5jtocPBmufboryUQMcN454oKNQSZ+fyZ
         V06u0mGzPfyuNv2gxb2PHjn8CPYLTyZmaDx2j0olwvhsIFuc1CJKxtfTrYs5gDx/hDM5
         rmF47Ngx3EHGNx0X59jlUvc0+g+idomDxL8MSdDUS/cwqsM9THuolQush8QUyDioOmhi
         y2+mLM/FAY5W/Bby+rThXZBHPj1KMJafdXqRdT2w3D2LYJUHjc5byCjYi5Ys3K+kreMH
         9HsJhdswKZE4fBLUreYWC2nlR1PppTnZTvyRMAdQ3OqZJnZuhqciCKMTiIZC35TR/FpE
         DGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAvu1SQ1o4V6lLGAz1uWBIOPE5OJpTe4Kq5+P8sRQIVSFxYZoU1tr2eU7nFPc+JxPFcUkBo0mEg0wscI09VSDz5g3/KZGZCtofmGTX2RM=
X-Gm-Message-State: AOJu0YwfXHDEIDrokdvU+Plm7a4tDafh3aihxUdZ6Qa1DHBlODfM7ojH
	WxJvVbqutgqh8Qj3Z7LyVjgrsPiT5YIhaCvHJkIfJD4soM+LN6reKBL7CavwcQ==
X-Google-Smtp-Source: AGHT+IFqhcT2qtauiJS3uwVxW9fbZO7buKGqLYAeBcQprvw10Vf3qS56d5IsqdA6MLVMsGfqM9z1ng==
X-Received: by 2002:a5d:6e51:0:b0:33e:d244:9c62 with SMTP id j17-20020a5d6e51000000b0033ed2449c62mr1199980wrz.68.1711608249959;
        Wed, 27 Mar 2024 23:44:09 -0700 (PDT)
Message-ID: <f4f33db5-a49d-4706-8b55-cfcad916e8cb@suse.com>
Date: Thu, 28 Mar 2024 07:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com>
 <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
 <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 18:01, George Dunlap wrote:
> On Mon, Mar 18, 2024 at 2:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.03.2024 13:24, George Dunlap wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -673,6 +673,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>           */
>>>          config->flags |= XEN_DOMCTL_CDF_oos_off;
>>>
>>> +    if ( nested_virt && !hvm_nested_virt_supported() )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "Nested virt requested but not available\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>      if ( nested_virt && !hap )
>>>      {
>>>          dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");
>>
>> As mentioned in reply to v1, I think what both start_nested_{svm,vmx}() check
>> is redundant with this latter check. I think that check isn't necessary there
>> (yet unlike suggested in reply to v1 I don't think anymore that the check here
>> can alternatively be dropped). And even if it was to be kept for some reason,
>> I'm having some difficulty seeing why vendor code needs to do that check, when
>> nestedhvm_setup() could do it for both of them.
> 
> I'm having a bit of trouble resolving the antecedents in this
> paragraph (what "this" and "there" are referring to).
> 
> Are you saying that we should set hvm_funcs.caps.nested_virt to 'true'
> even if the hardware doesn't support HAP, because we check that here?
> 
> That seems like a very strange way to go about things; hvm_funcs.caps
> should reflect the actual capabilities of the hardware.  Suppose at
> some point we want to expose nested virt capability to the toolstack
> -- wouldn't it make more sense to be able to just read
> `hvm_funcs.caps.nested_virt`, rather than having to remember to && it
> with `hvm_funcs.caps.hap`?
> 
> And as you say, you can't get rid of the HAP check here, because we
> also want to deny nested virt if the admin deliberately created a
> guest in shadow mode on a system that has HAP available.  So it's not
> redundant: one is checking the capabilities of the system, the other
> is checking the requested guest configuration.

Hmm, yes, you're right.

> As to why to have each vendor independent code check for HAP -- there
> are in fact two implementations of the code; it's nice to be able to
> look in one place for each implementation to determine the
> requirements.  Additionally, it would be possible, in the future, for
> one of the nested virt implementations to enable shadow mode, while
> the other one didn't.  The current arrangement makes that easy.

Well, first - how likely is this, when instead we've been considering
whether we could get rid of shadow mode? And then this is balancing
between ease of future changes vs avoiding redundancy where it can be
avoided. I'm not going to insist on centralizing the HAP check, but I
certainly wanted the option to be considered.

>>> --- a/xen/arch/x86/hvm/nestedhvm.c
>>> +++ b/xen/arch/x86/hvm/nestedhvm.c
>>> @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
>>>      __clear_bit(0x80, shadow_io_bitmap[0]);
>>>      __clear_bit(0xed, shadow_io_bitmap[1]);
>>>
>>> +    /*
>>> +     * NB this must be called after all command-line processing has been
>>> +     * done, so that if (for example) HAP is disabled, nested virt is
>>> +     * disabled as well.
>>> +     */
>>> +    if ( cpu_has_vmx )
>>> +        start_nested_vmx(&hvm_funcs);
>>> +    else if ( cpu_has_svm )
>>> +        start_nested_svm(&hvm_funcs);
>>
>> Instead of passing the pointer, couldn't you have the functions return
>> bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
>> pointer looks somewhat odd to me.
> 
> For one, it makes start_nested_XXX symmetric to start_XXX, which also
> has access to the full hvm_funcs structure (albeit in the former case
> because it's creating the structure).

This last aspect is the crucial aspect: start{svm,vmx}() are indeed quite
special because of this. Everywhere else we have accessor helpers when
hvm_funcs needs consulting, e.g. ...

>  For two, both of them need to read caps.hap.

... caps _reads_ would want using (an) accessor(s), too.

>  For three, it's just more flexible -- there may be
> future things that we want to modify in the start_nested_*()
> functions.  If we did as you suggest, and then added (say)
> caps.nested_virt_needs_hap, then we'd either need to add a second
> function, or refactor it to look like this.

Right, I can see this as an argument when taking, as you do, speculation
on future needs into account. Albeit I'm then inclined to say that even
such modifications may better be done through accessor helpers.

>> Is there a reason to use direct calls here rather than a true hook
>> (seeing that hvm_funcs must have been populated by the time we make it
>> here)? I understand we're (remotely) considering to switch away from
>> using hooks at some point, but right now this feels somewhat
>> inconsistent if not further justified.
> 
> Again it mimics the calls to start_vmx/svm in hvm_enable.  But I could
> look at adding a function pointer to see if it works.

Andrew - do you have any input here towards those somewhat vague plans
of getting rid of the hook functions? I guess they're more relevant in
places where we can't easily use the altcall machinery (i.e. not here).

Jan

