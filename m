Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890A875E5A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 08:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690117.1075838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUUx-0005Ze-KH; Fri, 08 Mar 2024 07:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690117.1075838; Fri, 08 Mar 2024 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUUx-0005X7-GL; Fri, 08 Mar 2024 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 690117;
 Fri, 08 Mar 2024 07:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riUUw-0005X1-AA
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 07:18:30 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eab2fbe-dd1c-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 08:18:27 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so627079a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 23:18:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l13-20020aa7d94d000000b0056828004c75sm579845eds.51.2024.03.07.23.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 23:18:26 -0800 (PST)
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
X-Inumbo-ID: 0eab2fbe-dd1c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709882306; x=1710487106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QfZcAyokEhcr3g+gmO7LAD2eQKRA9xZssWV+SW3Ru+c=;
        b=DL+qEZEUKfvCYBmb8uzbsIt2EVreekv8i90weqlOHRufoV0n0gcb9SK76mtlydT25r
         KKRMZr8wVqRGGMoZZ4tCJusu98GwSaxEFTOWVq8VZELAy2PKBi0/xT60sLzzoD3w3avM
         8ymBNgW+wqxkQmlUQOvlursRid+1GlMr9EIbDmFsdldrs7p7/3/XdqT5ZwfTMUbRWcMF
         /rJRjXMIdHvl6a5oxG7zEfC/YkLXPyT6N0FpJ3OLAWH4FK3/kkWWQhmVvjOeUYtZsQoU
         SKvlio1x4JoYYRo3iegu6wR+TmIQuT5AYumXc+5HJ4ZHjnKMHh14RGscNiNYdUejvAMH
         b1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882306; x=1710487106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfZcAyokEhcr3g+gmO7LAD2eQKRA9xZssWV+SW3Ru+c=;
        b=CUVHOnOk4sw10AGu9azeQubPw186Wt0PuVm1RLeDFjZTbnsT1zz5I0hGiEeeMVap8j
         Yl0qtBiJV4PFlYi7v/1NsRTCk2B928OVmJsoW1hy4brGg+BA/5Eqwj4E6GxSlE25T0Vc
         ZOKY3ljq7OhsXNofdyh2bm12sSod94ODSX0r9Iv8ogSGCwTWxlh/PJ+w21yu8dgshngy
         v26a0VlEglBI2himFqXocUhLuFVIcqaXD7JC5fymgnhFAVyzJb4gQcGa5w91ZpVMUyL3
         YAcAmnFs/d47jHJeAbsAahUiOx3iTNZeRHHi+h6R3+Rds5p7Vt0JSsS//ZB2LgG7e4nB
         043Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCtxX++RcS6RGyR1s8OfO+/SeSTLDBWSmvSlnX55BR1CVSl2bLHrePzCGz12aJiyoIrxSvFovoLlZUOKdcn+s612PBXTD1evMdaxpc4qM=
X-Gm-Message-State: AOJu0Yx2Ng5s2kFnmXhf0UiBsmPvn7OPj635FrMDniZVuryBH5qD2E9x
	IWVLucJik2P5sr/a/XlZaZypeauUmm1jpAkrnmMyt35m8zmUZGr2s6oOP7w+ZQ==
X-Google-Smtp-Source: AGHT+IGJy7zMTfl2hzXYs/0qb354ygpOPOx5PjLGAyXyLhohemM1LAVzVE3VNFv9jSyeWT3SkX6L7A==
X-Received: by 2002:a05:6402:2311:b0:568:1599:b854 with SMTP id l17-20020a056402231100b005681599b854mr1146266eda.42.1709882306603;
        Thu, 07 Mar 2024 23:18:26 -0800 (PST)
Message-ID: <b6d14b07-33e2-4fca-9cd0-c461ceef4e84@suse.com>
Date: Fri, 8 Mar 2024 08:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
 <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
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
In-Reply-To: <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2024 21:49, Oleksii wrote:
> On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
>> For plain writes it should at least be "=Qo" then, yes.
> Constraints Q is a machine specific constraint, and I am not sure that
> it makes sense to use "=o" only and probably it is a reason why it is
> enough only "r". Does it make sense?

Especially the 'only "r"' part doesn't, no. I also don't see why "=o"
would make no sense - that's fundamentally no different than "=m".
Unless the immediates used in the ultimate insns are large enough to
cover the full range of possible values, my take is that "o" is never
appropriate to use. With one exception in a case like we have here:
If the operand isn't used in the actual instruction(s), then that's
fine, as the specific value of the adjusted immediate wouldn't matter
at all.

As to "Q" - that's an Arm constraint anyway, not a RISC-V one? If so,
I'm not sure why we're discussing it here. In any event, I'd be curious
to understand in how far the combination "Qo" makes sense.

>>  To me making those
>> input operands on Arm can't have been quite right.
> I  don't understand why they both are input, logically it looks like an
> address should be an output.

How would an address be an output, when that's needed to be calculated
for the memory access to take place? It would be an output (and
presumably a dummy/fake one) only if the address calculation was done
in the asm() itself (and there I don't mean the operands, but the
actual assembly instruction(s)).

Jan

