Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308F917A5B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748457.1156169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNb8-0005VU-PE; Wed, 26 Jun 2024 08:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748457.1156169; Wed, 26 Jun 2024 08:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNb8-0005Sl-LX; Wed, 26 Jun 2024 08:01:46 +0000
Received: by outflank-mailman (input) for mailman id 748457;
 Wed, 26 Jun 2024 08:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNb7-0005GT-1u
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:01:45 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54076330-3392-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 10:01:44 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso76161651fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:01:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7069a42171dsm2617153b3a.191.2024.06.26.01.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:01:42 -0700 (PDT)
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
X-Inumbo-ID: 54076330-3392-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719388903; x=1719993703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xvkmClhPnl9irN7BosyBuUnrhgAEJgG7ZDAN1QohxQw=;
        b=YUrZoPljgLkrKFDmzxgxcqmhJbLY1y/5NDbgms5rZzmuigS/3WBQTWikhJS82+fnNY
         8DOHi8WI4d3hj8AjbPmxSjF2oyxFdpeLqlvYZdbIUM+GATQ7bq1oaaWiYIS85vXCr38M
         03FwjwUjr/E1rVf7pfBwif8HK7c10kG8a4NP0NMJaxAJX6Mmnw03OGcXqA2A2BYiweM2
         h94VBKWugwF3xhpznLEgQTWP0oTR4iF6jrWa55SbVfsQ3H1pjsLo2bWX0+8YHGrNM7UD
         CLOWg4Bq3k5Ez/N9J/MbkQ7SN2zUBFFev+PJx7j4hjgL4ZEMVDIr4NE74WXJV6x5iKXv
         h3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388903; x=1719993703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvkmClhPnl9irN7BosyBuUnrhgAEJgG7ZDAN1QohxQw=;
        b=UQ/SIUlyIqtcFfb2VBu5/B0P4Yb0dZbF5m50o77Kfrm8GjTTNZsU0UgQq/xf4XGhxz
         398y/jqNhDlEl5JUmX3Fbqpy6/4tJZG05ob0nZD+8tJ10kr7N8Vc3gSsxnRAAHNy818m
         rYjF6cpYwZC27K7rscJAynImvbKiyjFF1uX2xHwTP4+Ix5GKwdk1nRN6FCwR/iK2V7fe
         L5oWiH3ZYOBdKLZNK/TWfD8laB3BPLgN/iq6iSEqZA5fkwK10gzM0xlQ1LzHGeCglJgX
         Y8bhDc+s6cUKx1p+HTEBhwF4pgz9jbzkkC2Oarp/leuXnwjFqDG0RyAWFUDA3Dteofjr
         FSsA==
X-Forwarded-Encrypted: i=1; AJvYcCXWEFsgA3mLFsbeQVel8CAOzlBrtb3hB2gbms352WJrW/QxMPgt7sskMR0yg5G9BlIVlWWbCS9UhYPGnYa/JFLatrdFYYKZy+hrnwcjTmg=
X-Gm-Message-State: AOJu0YyDC/XKv/9Ux+ukhHPwGbs7eVKUym7LejHUyFjTsIEKXpAcJ3dJ
	mDIpwdMVxp0dkadUg2cXMVnkuz+OdBqPIpQbFo+A5wXx7U+6WoqDYUmJtDgLEg==
X-Google-Smtp-Source: AGHT+IGIrBqhXWrONmt2LE+SRROGEkvIv4XXShQwt8vhfZDNYij3n00PjhKTfKbY4mRB4nJVFKoJtg==
X-Received: by 2002:a2e:87d3:0:b0:2ec:500c:b2e0 with SMTP id 38308e7fff4ca-2ec593e0cc0mr62623931fa.22.1719388903382;
        Wed, 26 Jun 2024 01:01:43 -0700 (PDT)
Message-ID: <237405eb-5e27-42b0-a763-c99c474075cd@suse.com>
Date: Wed, 26 Jun 2024 10:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
 <3b2443ad76923afba348304b7cedbb257a6c5313.camel@gmail.com>
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
In-Reply-To: <3b2443ad76923afba348304b7cedbb257a6c5313.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 20:26, Oleksii wrote:
> On Tue, 2024-06-25 at 16:49 +0200, Jan Beulich wrote:
>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/cmpxchg.h
>>> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
>>> @@ -18,6 +18,20 @@
>>>          : "r" (new) \
>>>          : "memory" );
>>>  
>>> +/*
>>> + * Binutils < 2.37 doesn't understand ANDN.  If the toolchain is
>>> too
>>> +ld, form
>>
>> Same question: Why's 2.37 suddenly of interest?
> Andrew has (or had) an older version of binutils and started to face
> the issues mentioned in this patch. As a result, some
> changes were suggested.
> 
>> Plus, why would age of the
>> tool chain matter?
> As it is mentioned in the comment binutils < 2.37 doesn't understand
> andn instruction.

But that's not the point. If the tool chain is too old, our logic to
detect that should arrange for __riscv_zbb to not be set. That's all
that needed to cover gas not understanding the insn. The rest here
isn't about the capabilities of the tool chain: Either we make Zbb a
requirement (at which point .insn can be used to encode ANDN), or we
don't (at which point the replacement code you have comes into play).

>> What you care about is whether you're permitted to use
>> the extension at runtime. 
> At the moment we can't check that at runtime, w/o having an exception,
> ( there is some option to check when dts parsing will be available in
> Xen ). I will add the check when dts parsing functionality will be
> available. Right now the best what we can do it is just mentioned that
> as requirement in docs.
> 
>> Otherwise you could again ...
>>
>> Also something went wrong with line wrapping here.
>>
>>> + * it of a NOT+AND pair
>>> + */
>>> +#ifdef __riscv_zbb
>>> +#define ANDN_INSN(rd, rs1, rs2)                 \
>>> +    "andn " rd ", " rs1 ", " rs2 "\n"
>>> +#else
>>> +#define ANDN_INSN(rd, rs1, rs2)                 \
>>> +    "not " rd ", " rs2 "\n"                     \
>>> +    "and " rd ", " rs1 ", " rd "\n"
>>
>> ... resort to .insn.
> Hmm, good point, it could be an issue.
> 
> 
> If this patch is still needed (Andrew, have you updated your
> toolchain?), then it should use .insn instead of andn. However, using
> .insn requires encoding rd, rs1, and rs2 through asm ("some_reg") (?),
> which seems overly complicated.

Why? You don't want to use the raw form of .insn (which, as per the
other sub-thread on this series, is available from gas 2.38 only anyway),
but the one permitting operands to be spelled out (.insn r ...), along
the lines of what I suggested for "pause".

Jan

