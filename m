Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2F897263
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700561.1093908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1VJ-0007UH-U9; Wed, 03 Apr 2024 14:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700561.1093908; Wed, 03 Apr 2024 14:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1VJ-0007Sk-RC; Wed, 03 Apr 2024 14:22:17 +0000
Received: by outflank-mailman (input) for mailman id 700561;
 Wed, 03 Apr 2024 14:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rs1VI-0007Se-SD
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 14:22:16 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 915afcbd-f1c5-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 16:22:14 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3416a975840so4834659f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 07:22:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b00341e2146b53sm2164901wrb.106.2024.04.03.07.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 07:22:13 -0700 (PDT)
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
X-Inumbo-ID: 915afcbd-f1c5-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712154134; x=1712758934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7aO0JMjg2hBaX4gFYbFSMaeOLdBXRqEay15AfPUPHs=;
        b=DUqBkYAKeTBpRyDOhHBaZbZLuhWHPiV/Tirp9RmVQnyBzVuzboztqXnpwYssK1y93U
         IMhJXcI4tWPSmo7W3DaWeUdkKAeZXHDXArANOprxK/yvshKfpMqcXdaTwPhA9lCiOIzv
         ra1KHr5Y/LYkf4UJPTjkCyPPH8yZ/SUoOApkyH5LvjYorjLwXLn8QKlFc3U4HyL6xmW+
         jGkC+GyYT6s5s+n367vx5iqCBdKUZyOevFVFB88xig68BLqfgA/hkACsxtS3pPswpq9c
         E8r/JWnXhB7J3Aq0bSqXHngl2VJQMt7NjeI4iZ2Ft5JpsTBVC/htVMdDwxajY9CJ+Ai2
         GIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154134; x=1712758934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7aO0JMjg2hBaX4gFYbFSMaeOLdBXRqEay15AfPUPHs=;
        b=dN4f+Gk0X4PdvB/DIItpHJW+h/DcTa4iT8nuMJAYQBUJywwExhwfR3P/2HKHa6C3xf
         Ev+yPHuwW3FrRIRqTkq+HfNcBngfTTSJtL0hQwYTYGtEvkQs9DEErYE0y5iaINt6w9MH
         /kYDQ3HHYRFo255p5H2wISZ+BoT3fFRLHgTSWK5fSlk3Op9eabcym7xViCecV5hEFrA4
         FNBtTFqa8avQhWCNxmyRtHuIE2kBWUE/1KwPnndo8rIkWxcyPy1kIhinxa8fiixkTwry
         ne9cfiFsrvyHVSBox3paGOAPKU+DTCqeWf7TPILeM6qLNP+BX0I7TLaTTWvet5uSrsgV
         MdTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsvIEGkLPw4M0Zhbl2n/p0tzblo35qFlsw/B/9tjLiWiil/bSNKf6l2ltzZcQH/BW2/cDF2St3+TKOFOh1SPWdeSEgXPdla0mt1hwVClc=
X-Gm-Message-State: AOJu0Ywd/bp9VQhgo5WDXuwSv9zFx1ppsKNcAjp29UszmWWT4hmm9PqP
	gHVrs06i4AWrQ9XXUufIui7UxxkNlJ1NtrZ8eFsOliq2M2oe8kU6vueWWnNHxg==
X-Google-Smtp-Source: AGHT+IFt+emI1Mujk0noPxkoSpesSMNcktbwLSeAIPBIbemLqb6eNpm5ri9Dza6MsF9JMmm/X56evQ==
X-Received: by 2002:a5d:4246:0:b0:341:bf35:5088 with SMTP id s6-20020a5d4246000000b00341bf355088mr10544008wrr.52.1712154134043;
        Wed, 03 Apr 2024 07:22:14 -0700 (PDT)
Message-ID: <47374e80-4ac3-44d4-a440-5fbebc0c6a6c@suse.com>
Date: Wed, 3 Apr 2024 16:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: move definition of ASM_INT() to
 xen/linkage.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20240403120323.18433-1-jgross@suse.com>
 <e401ffe1-de4b-4548-8eba-feb7e85c9971@suse.com>
 <018e20ba-f15b-48e7-9333-19f6e570d55f@citrix.com>
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
In-Reply-To: <018e20ba-f15b-48e7-9333-19f6e570d55f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2024 15:59, Andrew Cooper wrote:
> On 03/04/2024 1:51 pm, Jan Beulich wrote:
>> On 03.04.2024 14:03, Juergen Gross wrote:
>>> ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
>>> exactly the same way. Instead of replicating this definition for riscv
>>> and ppc, move it to include/xen/linkage.h, where other arch agnostic
>>> definitions for assembler code are living already.
>> And this is why I didn't make a change right away, back when noticing the
>> duplication: Arch-agnostic really means ...
>>
>>> --- a/xen/include/xen/linkage.h
>>> +++ b/xen/include/xen/linkage.h
>>> @@ -60,6 +60,8 @@
>>>  #define DATA_LOCAL(name, align...) \
>>>          SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
>>>  
>>> +#define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)
>> ... to avoid .long [1]. There's no arch-independent aspect guaranteeing
>> that what .long emits matches "unsigned int" as used e.g. in the
>> declaration of xen_config_data_size.
> 
> I'd forgotten that point, but I don't think it's a good reason force
> every architecture to implement the same thing.

Of course.

> Borrowing a trick from the alternatives, what about this as a sanity check?
> 
> diff --git a/xen/tools/binfile b/xen/tools/binfile
> index 0299326ccc3f..21593debc872 100755
> --- a/xen/tools/binfile
> +++ b/xen/tools/binfile
> @@ -35,4 +35,10 @@ DATA($varname, 1 << $align)
>  END($varname)
>  
>          ASM_INT(${varname}_size, .Lend - $varname)
> +.Lsize_end:
> +
> +        .section .discard
> +        # Build assert sizeof(ASM_INT) == 4
> +        .byte 0xff - ((.Lsize_end - ${varname}_size) == 4)
> +
>  EOF

Hmm, tools/binfile may not be involved in a build, yet ASM_INT() may
still be used. Since there may not be any good place, I think we're
okay-ish for now without such a check.

> Ideally we'd want BYTES_PER_INT here but it turns out that doesn't exist
> in Xen.  If we find an architecture where .long isn't the right thing,
> we can make ASM_INT optionally arch-specific.

We don't even need to go this far - merely introducing an abstraction
for .long would suffice, and then also allow using that in bug.h.

Jan

