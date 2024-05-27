Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B48D01C6
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730756.1135944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaXQ-0004f2-1i; Mon, 27 May 2024 13:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730756.1135944; Mon, 27 May 2024 13:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaXP-0004dP-Ta; Mon, 27 May 2024 13:37:19 +0000
Received: by outflank-mailman (input) for mailman id 730756;
 Mon, 27 May 2024 13:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBaXO-0004dJ-MS
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:37:18 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b3648e3-1c2e-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 15:37:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5766cd9ca1bso10323227a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:37:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a631e324816sm27876466b.15.2024.05.27.06.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 06:37:15 -0700 (PDT)
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
X-Inumbo-ID: 3b3648e3-1c2e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716817035; x=1717421835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Gny4Ab2e3yPKopA6ax7hto72c8SMIy0PsmVtYocx2c=;
        b=GwBcSnwjJUnA8Tfng8K4f/qbHHEZgrO6VyT3Yg2+SKhUnxG4lz4c89LOj5N4RBLKA8
         gVx0/iD5HZnNMfKQ5v52B6yUf8mO6Qo6QrcKzKobPx/dcKQGOwFVs2VINE6+zAUl8wzO
         nsbrSZLfgdpsG2bf0Xdb/qWAX52njIrExlhM4mbXkY6/qBukub01Ch6UYEodCU6rg28N
         OPt6J3cxn6HOk7SVNrQwD2dtk6hYGqJSO2hqKRdJ+siy/gxLY2vmyb3Kvh210vb8p5oh
         XqUVFs33umsAnr0bt65e77oqgJyksL1GhRwJa9jB7cK7GgYJW+YvJBU1RiZebzxhMOab
         +Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817035; x=1717421835;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Gny4Ab2e3yPKopA6ax7hto72c8SMIy0PsmVtYocx2c=;
        b=p5r1kM6PoC/i+G50B1dT6ihL6H1m3vU+MPTAX3/jR/ANgxJqPycue6MVUDJ93qPF5W
         frE7pdw8/y13FCCB5ZR7tfF4jQfDnEaqahVbREDbriKMgEWwAkpQdM1zccRICIUDyNNt
         7Ana45Q1/Y2l9vUTSmYmrIssJnHg1aRGryg9E+JFmW/oiM7uPcdRX/3ODS/Kq1Qwdgpa
         v5oU2a9b4N9TFN6rASWdiTvznpUa27TwxD96q6qGvkJ38DiNUvvl0Ds/VOyy84vWEWcU
         nFJT4KPOPASpw/43+l0pxtEQmMewCnIgvc2PpUzcF9+kAnmNuIf3HNlOQDyI+qx3ZETv
         zsCw==
X-Forwarded-Encrypted: i=1; AJvYcCVrk+psHkJgkxTiDn7fjWR3jo+DEcggyawwU+6IQFNpT8OrNLsBPYbLueb2K+CZnCTdKWBHj79XFUZcNr0xA11NaUg/NPEmTjVtAj1dvOM=
X-Gm-Message-State: AOJu0YwuPzB43JFTvRI2Dx05iyXRf6bi5EshyA4Y/5gHu/vho8kLSJVg
	mse/Rn6J5iL81a9suMloavj1krfdaIF+yQCpTjF5ZGfdyCvl0HYPJUEoIRT8WQ==
X-Google-Smtp-Source: AGHT+IFcrn1pbcmLn/tN42dFrOZymzeN0hd1z0TZ69y5uIyI+tDGAf5wz1oDXqbS43JMGdKABTq96Q==
X-Received: by 2002:a17:906:f88b:b0:a5c:d67a:1e1c with SMTP id a640c23a62f3a-a62641b8ba2mr700764566b.20.1716817035487;
        Mon, 27 May 2024 06:37:15 -0700 (PDT)
Message-ID: <57a47c76-c484-4309-8a87-a51f79dd48b6@suse.com>
Date: Mon, 27 May 2024 15:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] x86/bitops: Improve arch_ffs() in the general
 case
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-8-andrew.cooper3@citrix.com>
 <1660a2a7-cea4-4e6f-9286-0c134c34b6fb@suse.com>
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
In-Reply-To: <1660a2a7-cea4-4e6f-9286-0c134c34b6fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 15:27, Jan Beulich wrote:
> On 24.05.2024 22:03, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>>  
>>  static always_inline unsigned int arch_ffs(unsigned int x)
>>  {
>> -    int r;
>> +    unsigned int r;
>> +
>> +    if ( __builtin_constant_p(x > 0) && x > 0 )
>> +    {
>> +        /* Safe, when the compiler knows that x is nonzero. */
>> +        asm ( "bsf %[val], %[res]"
>> +              : [res] "=r" (r)
>> +              : [val] "rm" (x) );
>> +    }
> 
> In patch 11 relevant things are all in a single patch, making it easier
> to spot that this is dead code: The sole caller already has a
> __builtin_constant_p(), hence I don't see how the one here could ever
> return true. With that the respective part of the description is then
> questionable, too, I'm afraid: Where did you observe any actual effect
> from this? Or if you did - what am I missing?

Hmm, thinking about it: I suppose that's why you have
__builtin_constant_p(x > 0), not __builtin_constant_p(x). I have to admit
I'm (positively) surprised that the former may return true when the latter
doesn't. Nevertheless I'm inclined to think this deserves a brief comment.

As an aside, to better match the comment inside the if()'s body, how about

    if ( __builtin_constant_p(!!x) && x )

? That also may make a little more clear that this isn't just a style
choice, but actually needed for the intended purpose.

Jan

