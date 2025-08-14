Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C75B25F99
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081120.1441247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTiG-0005cS-JK; Thu, 14 Aug 2025 08:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081120.1441247; Thu, 14 Aug 2025 08:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTiG-0005a7-G1; Thu, 14 Aug 2025 08:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1081120;
 Thu, 14 Aug 2025 08:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTiE-0005a0-Tp
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:53:30 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 265cfa87-78ec-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:53:30 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so115627766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:53:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99148eab9sm1605267466b.77.2025.08.14.01.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:53:27 -0700 (PDT)
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
X-Inumbo-ID: 265cfa87-78ec-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755161609; x=1755766409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E5tkG3ozQhJgJYMy2RuwL7Q+aYwhRCvT6p0zheVxBW0=;
        b=NQcySK+/KzYdD1NHLOy9l2grVeEkguwfkvPfpPGy0RwMpHlhJN6CjZfoMQQlJ+a5xX
         figE4pLz3U/wvkzoh+vyk7e3pHKPEoRHNPB5ZlOqJ/XGcUuOLWj1oAF1n8QusobdpRA9
         fZ/p6dfiyNhitz1GWko0Bo5oufalKUeDk9TBvu02+8C8LLAZNyHJlAzTbDt407N0rO1W
         DzIRps4jhJmOSu5gdWhORlQl49qwcW5zKKX1znf+aACaLwlX+alBYqAsvoVk36Cyp6o5
         8yuM2RVbPVYSQu1QdUNfft1H4XgedDUQ38l7JBuYVTN+ELP/qF4uv8GcCOoeLejWdMDE
         JBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161609; x=1755766409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5tkG3ozQhJgJYMy2RuwL7Q+aYwhRCvT6p0zheVxBW0=;
        b=Uwr8TA0h8yGtKr72wjXDtG1snxLpE1p9UpF3V/a3CJGrA/ZMUXuSygc+qXeJbsye7p
         itnf7FZZeFKtAEt3ysBkOfLmyVMSzHpiuomhkp7PDUAE+X8hftTkoNTfUKk0Ywg0Lz4t
         gb6oQtm4HsM+3/7Zhtso/NWgOhYLzyXpStXMImqtdiIdpz1a0KGZTceZReX9jO9GlFmG
         JEatIIIrwwFGoLBfTg+t2zRK4dKHocUy992uhurHW4ThXJ7jMDOITVrivjHOHTVsOUOJ
         dT2Mq0WskaLmEkIBYZ1l7HGakJCe82I05+NTUpErfeTLrsF1KjxsF3It51cSgOTYeQKB
         ujLA==
X-Forwarded-Encrypted: i=1; AJvYcCVcevjIZyOGGB6OFI4eE1s4tLZUzfLD0d2jECwPvBZCMnurhmTo7UgP1+idfKFzLXTr4qH09HgAGLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yybo781zVYy6Z98HmamA2ePFd9TK22SllcbiZwJTKwh18LCXrJz
	oa+9EAzQ2quBJj3XXQqTkXYHgKnPyRn8tvirxKF7+tvOBdbB4+EHue1tjH38JQB+Ng==
X-Gm-Gg: ASbGnctbcHEVRxV1eY+43k1EZ94HHnVO5DyIK9CjFWwd9VLJX6dVoaywfoGtRqf9m6C
	9cSZWNxNv3N3uEdRQT0RdbxWLzrcFRJyqIoiUXHyzywkYQIbgQq0OLyLDHTmaCmFd08Vr9kBdUI
	oRvLHw0/tg2Q7wzr0ZOzJkxHxxEfyrp4yiInGBG4fN5u92yyu+IsKyuWam7nQwagIbkHE7uQBqk
	Xsm6TPL4iUfOLsCc58xDmPMNCXf1gw/fZxYiA2vRauhiJmC4vOq6u8UadQ2gNv6tagcuQSy4UtA
	YgK5zi4sRU8q4s3PFdSUxhZl2BydoKwiul9zIzFYj9fisYWWeasQvlhMw55g5NFIHL78FXy4BnM
	WLPeeCwaoXw5u1q1c8qgWGT575yGK2YpXUUckjq8S6haVjjb9axEyIe8w7Ov3h8EoP7JhiFHuHC
	ZkXYZiwiFnj40J0/LnFw==
X-Google-Smtp-Source: AGHT+IGaUN4Q/p0jE+iH+iT72ApGrE/PF67MNKL28GzZp3ZoiJBv6CzlnWuDfD27ySuBWh6DCfQPdg==
X-Received: by 2002:a17:907:94cd:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-afcb98e1ac5mr177869866b.35.1755161608114;
        Thu, 14 Aug 2025 01:53:28 -0700 (PDT)
Message-ID: <1059cde6-72e6-447f-bdf9-2bc859911ddf@suse.com>
Date: Thu, 14 Aug 2025 10:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] x86/traps: Introduce ap_early_traps_init() and set
 up exception handling earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-9-andrew.cooper3@citrix.com>
 <d6573487-14ed-4e1f-9525-b702048bb87e@suse.com>
 <3e590b78-b2ac-435d-98d7-89c39d6f731f@citrix.com>
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
In-Reply-To: <3e590b78-b2ac-435d-98d7-89c39d6f731f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2025 13:13, Andrew Cooper wrote:
> On 12/08/2025 9:41 am, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>> @@ -63,6 +63,9 @@ LABEL(s3_resume)
>>>          pushq   %rax
>>>          lretq
>>>  1:
>>> +        /* Set up early exceptions and CET before entering C properly. */
>>> +        call    ap_early_traps_init
>> But this is the BSP?
> 
> By the end of the cleanup, what we have is:
> 
> At boot only:
>  * really early init, basic exception handling only
>  * regular init (inc syscall trampolines)
>  * late re-init as we change the stack linear address
> 
> For everything else (APs, S3, hot-online):
>  * early, full exception handling
>  * regular init (inc syscall trampolines)
> 
> 
> Currently, these are named:
>  * bsp_early_traps_init()
>  * traps_init()
>  * bsp_traps_reinit()
> 
> and
>  * ap_early_traps_init()
>  * percpu_traps_init()
> 
> 
> Perhaps ap_early_traps_init() should be named
> percpu_early_traps_init()?  But I'm open to suggestions.

That name looks like a better fit to me, yes.

Jan

