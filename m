Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F8B3EB15
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105119.1456082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6f1-0007OL-5t; Mon, 01 Sep 2025 15:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105119.1456082; Mon, 01 Sep 2025 15:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6f1-0007Lo-2q; Mon, 01 Sep 2025 15:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1105119;
 Mon, 01 Sep 2025 15:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut6ez-0007Li-PC
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:41:33 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22016f03-874a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 17:41:31 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b0439098469so126492466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:41:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd9090sm880311066b.69.2025.09.01.08.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:41:29 -0700 (PDT)
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
X-Inumbo-ID: 22016f03-874a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756741291; x=1757346091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BoC7DuQfIrzZ2uAuJOP6ZRGrjvn0NPG7Yk/TUsrJuNw=;
        b=KKsL1ZAD+UdqsTKJ5MMqhwjLx8iXpq1HLZ7w8yd8W4D9KusBdCa+jIkmO1WpZ/ZKJW
         esJ6qyD1WzbjgG+TViR/pZc7LILpVnOSX6oUQCNW99xhmBMYVMKvnQRJYf2LixPHEljz
         yzwxeqQ5JKh3utoMcAOniaBYp6X7L5jTRmtYra9knRFhzMXDfT8aEH75hOU9o0mMMqHO
         OV2gsSBE0v8iIEiNGqnEGcCQd22R+Wbc7m2Af48sIdrGk1uavOcCoKSR2MLt6wJZmb0w
         9zQ27n+IPgM0AYFlnjUpl5P0uSj2qcXLd5wiTJVOitVaPWXLbMUeiTGd7mI9AGLhcAs9
         uAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741291; x=1757346091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoC7DuQfIrzZ2uAuJOP6ZRGrjvn0NPG7Yk/TUsrJuNw=;
        b=aoWFMJ+Q9okxrvpl/iJDJjFKmcbXDd0bVX68+7ljBtAxNvlvnsrn7zNLUyFpIMUydM
         viVL0HJQWEAYr+KK9IHew+GU5OQQuPm9ykoLUIwm1AWOqyAigVPbgTkRjS/i3e9vXngE
         +rcJ9qjM9nxaX2tOlKUEBE+b2BDwebgacACR+WsQiEPQKmd6aWG7n+tuqqobowzEWh5g
         ddf0HHPYbyLi5B5BsGQWEKfr7W/uB0KtIzs7XqF4o/y/QK+NKh+iOUgyWgQm8KhkOKzm
         LkYyVul25+D3/lOWIdDogvUNDbArWtFJeA4Meo/bUZgPy4Wb4uvq/NjYeeVEg85+BYL2
         x6BA==
X-Forwarded-Encrypted: i=1; AJvYcCWGTNKJcA5Om4WGD2YpwxsxGSyYfWHfWtk8h3mSUgShyO605PFTET+Lzhx6PYkrfJyn6KwIIpnSPQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJhYNBEfMYXj4BaTeQWVCHlZ+afdZDUOJNZdLCYcIqAZgbKrcq
	r6BLtUQgHGaMdG0TiJBfyhJrC5wyCQNYX9TZN2ppgNjqz1v+SiEBIvczE2K1kJNgOQ==
X-Gm-Gg: ASbGncsLx90kzv19RwG7lS/M7vkJZUiBtrAFmiqUvt7+Y0xWYgXNE87XnwT6x7piA98
	ISLGL5SlLp5aOuqICshuHxDyvi2WodjkclBZ0G+hg3b5R7EIfU1Qfy8upfB243CZByymJRUCYED
	AlohOrg+vy32zMzXzO5/g1InHSwniJflL6U5T9iAy73L1Z4l7uAdkLOrjuEloiZvnlOyyKrGIFZ
	4Df1o8uCNZG3+CkduMKlW4dleJxizgRQh5NyUlrJlpHXF+VQ9E0ch2jRGJOFg0bCWYWVh4IqzEE
	kLTNVVp64McauRPG47hYmKOlFtrj3J4nIhUS7z3ejWb9UXQBjDiMKf2ORmSZ1/d3+KCDCho061n
	byvdF74yWwvPwZYno6WsuCCLJtBio5PMyRkPMy2/BZcMfs2kUB8zU7TbkWlheIMrnl7jqFMIE0A
	ojadGRPc8=
X-Google-Smtp-Source: AGHT+IGnfOtKS908xhNyz6cgFpiKlHaYjl6FYJcJJCvkVHb3nUF+T2Zh0ZMTY8AwaaG0bBdS+9+tEA==
X-Received: by 2002:a17:907:7209:b0:afc:d3f2:6061 with SMTP id a640c23a62f3a-b01d8a6b819mr849626466b.14.1756741289736;
        Mon, 01 Sep 2025 08:41:29 -0700 (PDT)
Message-ID: <595a24ff-9eb8-40f3-9108-dca02e5a7a2c@suse.com>
Date: Mon, 1 Sep 2025 17:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-8-andrew.cooper3@citrix.com>
 <9322056d-9f09-4f5b-801b-6f0fdad5ead9@suse.com>
 <18e139ce-36a5-4a0c-8a9c-440ef1c1e29f@citrix.com>
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
In-Reply-To: <18e139ce-36a5-4a0c-8a9c-440ef1c1e29f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 17:33, Andrew Cooper wrote:
> On 01/09/2025 10:28 am, Jan Beulich wrote:
>> On 28.08.2025 17:03, Andrew Cooper wrote:
>>> @@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
>>>      if ( cpu_has_xen_shstk )
>>>      {
>>>          wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
>>> -        asm volatile ("setssbsy" ::: "memory");
>>> +
>>> +        /*
>>> +         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
>>> +         * therefore by the value in MSR_PL0_SSP.
>> Beside not being overly relevant here afaict, is this last part of the sentence
>> actually correct? Patch 06 doesn't write different values into the MSR.
> 
> It is correct, but also well hidden.
> 
> #define MSR_FRED_SSP_SL0                    MSR_PL0_SSP
> 
> I suppose I should should write MSR_PL0_SSP/MSR_FRED_SSP_SL0 here to
> highlight the logically different names for the two modes.

But the code following the comment doesn't access any MSR. That's what
first tripped me up. It was only then that I wasn't able to spot the two
different writes. Now that you point out the aliasing it becomes clear
that until patch 14 it is simply impossible to find that other write.

Jan

