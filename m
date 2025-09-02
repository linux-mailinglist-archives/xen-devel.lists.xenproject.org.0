Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A5B3F530
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 08:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105673.1456531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKKj-0005eH-QD; Tue, 02 Sep 2025 06:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105673.1456531; Tue, 02 Sep 2025 06:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKKj-0005co-MM; Tue, 02 Sep 2025 06:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1105673;
 Tue, 02 Sep 2025 06:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utKKi-0005ci-De
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 06:17:32 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 816d019a-87c4-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 08:17:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aff0775410eso494033566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 23:17:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0971379esm932767866b.102.2025.09.01.23.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:17:29 -0700 (PDT)
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
X-Inumbo-ID: 816d019a-87c4-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756793850; x=1757398650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gZt3bFPJkMMncWlUEi9JchKzNhlanR/N4cao59y1WR4=;
        b=c/BGpDpm5sU8QtduBcFIeu0mc2uCQPHTfsIlXfnnGFQdoZxl4QTSg4cXJ3FgaxKgJx
         Kji/e8RuGrKWVoC1DZec94lK5D4rh6lKiW/7JA8dmNp6WUW9XlPYCmucTEEQ4Eo+GjUi
         95lTmpz/2afFSdSEapBROsDDFvX68U5sTX7JuPfG7KBbJjGF5Ylc1yHbkvsA5Pokgt3F
         IOu2+APWrt+BylMPFG6SGxZlmfkFF1egj/ZnX7p1S/qSg5n6Ghp1DAOc8gVVO8tE20iS
         GUHeWcleLGRU4jkue1Shc0VxtEyYTPGZ0YtBICayLi+nHldSVzVzF612MaVQpmsCNyDl
         Qfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793850; x=1757398650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZt3bFPJkMMncWlUEi9JchKzNhlanR/N4cao59y1WR4=;
        b=KrY8JiKuAD8qpyA5yeLzic+EZJHUWIE1tXrxS9WL08b6r+pFFVnlHKZyfSdMEDVO/I
         oS6JDqsey1Id1lozW9JiWW7J0+m6b1FGZCG4X82JyABErtTM3F9/VB5R3sLTzhdDrZn3
         /jXqTG4cVUjOal2z1fA7T42Unl7/5e8kWmbPHmzf+yfHUTVsY5NOOI2NsTJ6xR6IxfMp
         rN7ULnrfvk8Elv73zeKJO0Ywt9OfratviC461bK1duGntuwoGUTPksu+eoJMed3JnEWS
         t6jWL52AMpCNbwD+Q4/byJEtzUJfCxNWNVowRp9UOfgn7IKMC3HJmKlIcKqEdWRLs5wz
         nGEw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Dvn+7WiCY6clDqEL28UX5wkOjhRjHXQmzX60YerQkx1zpSjyHu/JSwMc7vgS31mxyhLOBJwp3mY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3jxCgZWf5RbzS3r8dohSsU36yhwjDH9ujfUqCeqEzhiA7zUVw
	VmCdHmIVfTxZDwdGcvi/+6+lHApHP1XqD3VhOdvRQkkAkT/JG+OHPJWmPwGhIWp6Mw==
X-Gm-Gg: ASbGncumc/jy/kVuCZhTV65YBt4T+FkjR6bWp9TOFGssrEmJI/bw15wFBAY5HJ2H63h
	r8tYgWZKvETCdlW+d/p+CuswnupPdiaE9F1Ng3TzJb/qR2G8B1IwJfTQKbMf4IhGOLI4yA61qJi
	StPs4MvTy5u6a/WPHTAHVTCODDE7Z2Ilz+b1Vw0PoR8CM+L+VM+gttN7EX5UlyOllt853pwasPJ
	qrzYFhxmcuVEN2FG3U9sQA+fzgdQ2b8Vpg7J/EbXCnD0Lo6i8sAfYypgPlowk2+9NvnN9iy3z06
	53qXAwqbvYwDqVgQuv271iriYJz71Q7R1/MZ+gWsg52iHa5ielXzzZR51Y2mlYUAubeNwN/5n4t
	X/WDOvXRIwyLyFe++U9Do0rmVm0R6Ig5y4pYyx9yVWrM7xfPdOaYPD8gZ5i46Ro6K8YZMpRjaAr
	oPz8SKpOsvS7HBg4Ycng==
X-Google-Smtp-Source: AGHT+IEFz7ntxND1P1n8C8vW/y1FvLVfItkGR4898+qm3QNOantCM8J87NocSkbqeSg8UhVwt+y9uQ==
X-Received: by 2002:a17:907:980c:b0:afd:eb4f:d5d2 with SMTP id a640c23a62f3a-b01f20c8180mr1092497166b.31.1756793849863;
        Mon, 01 Sep 2025 23:17:29 -0700 (PDT)
Message-ID: <70b835e4-2b38-48c7-a7de-9720939502cb@suse.com>
Date: Tue, 2 Sep 2025 08:17:28 +0200
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
 <595a24ff-9eb8-40f3-9108-dca02e5a7a2c@suse.com>
 <935c5307-86c4-48ae-80da-a4454f28398d@citrix.com>
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
In-Reply-To: <935c5307-86c4-48ae-80da-a4454f28398d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 20:53, Andrew Cooper wrote:
> On 01/09/2025 4:41 pm, Jan Beulich wrote:
>> On 01.09.2025 17:33, Andrew Cooper wrote:
>>> On 01/09/2025 10:28 am, Jan Beulich wrote:
>>>> On 28.08.2025 17:03, Andrew Cooper wrote:
>>>>> @@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
>>>>>      if ( cpu_has_xen_shstk )
>>>>>      {
>>>>>          wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
>>>>> -        asm volatile ("setssbsy" ::: "memory");
>>>>> +
>>>>> +        /*
>>>>> +         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
>>>>> +         * therefore by the value in MSR_PL0_SSP.
>>>> Beside not being overly relevant here afaict, is this last part of the sentence
>>>> actually correct? Patch 06 doesn't write different values into the MSR.
>>> It is correct, but also well hidden.
>>>
>>> #define MSR_FRED_SSP_SL0                    MSR_PL0_SSP
>>>
>>> I suppose I should should write MSR_PL0_SSP/MSR_FRED_SSP_SL0 here to
>>> highlight the logically different names for the two modes.
>> But the code following the comment doesn't access any MSR. That's what
>> first tripped me up. It was only then that I wasn't able to spot the two
>> different writes. Now that you point out the aliasing it becomes clear
>> that until patch 14 it is simply impossible to find that other write.
> 
> I suppose the MSR value isn't relevant now that neither paths write the
> value.  The first iteration had both writes here.
> 
> I guess I can drop that paragraph, and just have the second?

I'd keep everything up to the comma (plus the other paragraph of course).

Jan

