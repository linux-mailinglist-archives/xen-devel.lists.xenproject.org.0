Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDAA7336F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929308.1331923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnPK-0006XV-8c; Thu, 27 Mar 2025 13:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929308.1331923; Thu, 27 Mar 2025 13:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnPK-0006VP-5f; Thu, 27 Mar 2025 13:36:30 +0000
Received: by outflank-mailman (input) for mailman id 929308;
 Thu, 27 Mar 2025 13:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txnPI-0006VJ-V0
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:36:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c250b3a-0b10-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 14:36:28 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso7277275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:36:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eff6esm19953245f8f.100.2025.03.27.06.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:36:27 -0700 (PDT)
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
X-Inumbo-ID: 7c250b3a-0b10-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743082587; x=1743687387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4JhjMh7hWu20C1sCTUo60gpwltU8peQAYhTfB/lLtbc=;
        b=Dtf9Cqu60ZuhvvJZeTuhm35KUREU6ZTYzWfYokj18+agLSiVwgbEtCzumrfZ6Mmdbe
         nXE+N+Qu/nBM+NsnTNHIBhtSHZz4UqtfDFseeFlq+LkiI/kf4RYJAY/3JqvJlENYH+wA
         XOEBQGlEhbXNLehYdjNmoVxVx4Ls24Rqxvw0sc/HaggTd9j2BhdoD72ZnZEGaudD9B5c
         qUgpkp0qr0zI66BgNGsxZndpyeDRVz97OWu+WGKC/+ujbGbmeHv8GTmXiVJ2AQPUKod3
         UkhykCN7E+Scyqwydo69oC3yN4JwC5KCkoepiwDA8YpAWTDI7XxFfgsWJrD/YfEeTXI3
         OHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082587; x=1743687387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JhjMh7hWu20C1sCTUo60gpwltU8peQAYhTfB/lLtbc=;
        b=J4ph8HmRELZ0oPZQSqvoBjHxuB4h9RlLnCT26yICtgMtfJNDTolsURJ/1WA7vPfAVJ
         56wHj0MBAuWo60Z5+iL7fXiW4Ju/0MJx2wOMhNoR7vTLTA9LuepDeK5S65dJU0Wvn5HZ
         7H1SWGIle62RmX1LByOZjawhN5JrkJaEzMDN2jUjXoGGzCbk6/Jt9abSPWnS2DtNCMuS
         IDSkehpk7LdWPk+cw4be8tfENQ8YpdOHmaQG+KrcHM1fS1sdtr/07agA4Zd8DcOTIeWi
         flghPxo60R2VYwwX/95P1IeCW75C4CsOywTrO40gyiBFSLPOm8T61fuRMHGh6uo8aNxk
         KgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKmc1aKJ9PesgBkX+eITZuJR5mUTPirhDfHwqpfEOyejhXU/xTu0HNhJA9Czra3PjJVJlsFA3xUeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp6d9ODuA+lmAhIO3PZ5LPgpGy7Ecre8m4nmtYjcUD/nCLUIIT
	cKHYUytYD7D1U4on01NbcAffiQBVrSEqrW31FxaU/R6c6Gdpm6GwG8zKwFMhaQ==
X-Gm-Gg: ASbGncsf81xN0HTTes/9jf1ypD6Wf7/Z/8cx5owZFEOYk8qqVSu/672yEEm8FUda1Mo
	R4EBYI5Pl/D40FddK4Wg79NGPw5ecsZABUnLcadBOWb4ahtJ7SrydH1kqJ3slV7P7lDo+iN5iM1
	sl4/6O5Z6p0txbBZcwWRqGyBN8k1RLqITnq7q6LrHQD4eKhA8qgmsVgpyhae6nuuWtCO0vqt4v3
	PxTawfkVtcMu3r53pnCIZW3Ud/5QfniRS14NE8E16up6YERkYNqhkolpMZXOmlWcBJjOIwZMv7h
	Ck+20x0Hj0+JcOmMxfUIsLVTr7We3ALoMoHTHdUVQ2cIDqNlBIOhroZTXxVWy1wZX2zWftbJ5Il
	Ugej4IWtKc+yQutElyXygtPgKBe9jSQ==
X-Google-Smtp-Source: AGHT+IE5x7hTphmGwx7ZUsPW8nai6fo1iU3wARgNCPHi7XupijTjCWMuFnVyEnijjD9MivI8ofUOoQ==
X-Received: by 2002:a05:600c:4e05:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d84f5e5bcmr40959545e9.5.1743082587366;
        Thu, 27 Mar 2025 06:36:27 -0700 (PDT)
Message-ID: <92bcf196-a138-4784-8bfd-c73a1d430321@suse.com>
Date: Thu, 27 Mar 2025 14:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
 <994b9d44-f82f-4eb7-8742-9041ba2caf17@suse.com>
 <f7381aa7-cfc8-4225-b500-374804cbf23d@citrix.com>
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
In-Reply-To: <f7381aa7-cfc8-4225-b500-374804cbf23d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 13:53, Andrew Cooper wrote:
> On 27/03/2025 8:21 am, Jan Beulich wrote:
>> On 27.03.2025 01:44, Andrew Cooper wrote:
>>> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>>>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>>>> index d888b2314d..dbbf2fce62 100644
>>>> --- a/xen/include/xen/config.h
>>>> +++ b/xen/include/xen/config.h
>>>> @@ -98,4 +98,13 @@
>>>>  #define ZERO_BLOCK_PTR ((void *)-1L)
>>>>  #endif
>>>>  
>>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>>> +
>>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>>> +
>>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>>> See how much nicer this is.  This patch possibly wants to wait until
>>> I've fixed the compiler checks to update to the new baseline, or we can
>>> just say that staging is staging and corner case error messages are fine.
>>>
>>> One thing, you have to replace the "<< 3" as you're hard-coding 8 here
>>> and ignoring __CHAR_BIT__.
>>>
>>> I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:
>>>
>>> #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
>>>
>>> which tabulates better.
>>>
>>> I suggest keeping BITS_PER_XEN_ULONG to be arch-local.
>> I agree here despite ...
>>
>>>   ARM is the
>>> odd-one-out having a non-64bit arch use a 64bit XEN_ULONG.
>> ... not agreeing here: x86 is the odd-one-out; I sincerely hope any new ports
>> to 32-bit architectures / flavors will avoid compat layer translation by making
>> this type a proper 64-bit one. Architectures truly being 32-bit only, with no
>> expectation of a 64-bit flavor ever appearing, would be different.
> 
> I have some very firm opinions about this.
> 
> It is an error that the type xen_ulong exists, anywhere.  The fact it
> wasn't named guest_ulong shows a profound misunderstanding of its
> purpose and usage in the API/ABI.
> 
> Similarly, BITS_PER_XEN_ULONG is buggily named, and should be
> BITS_PER_GUEST_ULONG, as demonstrated by it's singular use in Xen
> (calculating BITS_PER_EVTCHN_WORD(d)).
> 
> ARM declaring that arm32 uses 64-bit xen_ulongs was cutting a corner
> that's going to bite twice as hard when 128bit comes along, and
> RISCV-128 is in progress already.

Yes indeed.

> All of this needs purging from the API/ABIs before RISC-V/PPC inherit
> the mistakes that are holding x86 and ARM back.

I'm curious to learn how you envision to support a 32-bit guest on RV128,
for example. You dislike the compat layer, and you also dislike xen_ulong_t
(I agree its name is potentially misleading). So you must be thinking of
something entirely new to express in particular interfacing structures.

Jan

