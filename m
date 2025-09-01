Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3EB3EB25
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105129.1456091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6gC-0007tf-Ep; Mon, 01 Sep 2025 15:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105129.1456091; Mon, 01 Sep 2025 15:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6gC-0007rT-C3; Mon, 01 Sep 2025 15:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1105129;
 Mon, 01 Sep 2025 15:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut6gA-0007rL-Re
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:42:46 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e0b18f8-874a-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 17:42:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so192677566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:42:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b017e4b9ed7sm620198766b.90.2025.09.01.08.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:42:44 -0700 (PDT)
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
X-Inumbo-ID: 4e0b18f8-874a-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756741365; x=1757346165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GYS3R48iHHv/+Et7qrkRueo6Lxdbvk4EmUuf6L//XdE=;
        b=bGYuXJSJ6Sp7N9B/Wbv/DxMPlkYk8ZiaagOJ5TBiPXSO41FI9sIcKFcimPqMweHpJT
         cZXuRD6LRYIdw6xV+w/bL0iWTZgvwxWrb0eqEvyGT/GF4z4pltGUUcNDxzG9/NaiS2X6
         V1aqy7fwr27juf8V4eo+WuvmWUXUqfR+MTYj/XAOIl6kVilNTQwu9bRbqpvZz0UDvov2
         nwabBmtnpAXMQG+a0f2piS7ICu+57bzAVjQDz6Z367RM0w/dH3savNVAlkLZ6AA25Yfr
         l/cPJS13r74jx9QSa8MYVhUnjgzffyJGwfRyk0eTW4pyueofIGKjB6xp+7aHkA5pFJor
         tViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741365; x=1757346165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYS3R48iHHv/+Et7qrkRueo6Lxdbvk4EmUuf6L//XdE=;
        b=Y1VMqVN75ssv1dZP+1kptm5M4gr7kEDSs9yxxD6vCda8PuToRABVYr4LPkQhtvbakl
         SPvBdHB66wSGxL547h7CktWGxydv5WROF9GnYP9ZTZBbtAk4I/axC2OovwynbQvXhGad
         OI2rclKmdEbBL9X4gNSrBX6S3Rpk6y+hfjTfBahT1yLt+aIZUFaIX83BMkgI/8la8dSh
         LoxhZiDQGm1UJxePfT0wWSpnJ7RSFort6Iag0uQG8rC0yS9brRon95UzLqwwkZY06cpw
         bW1xiTP45xrjg1F+fHgKVWEpwOOaAnABkgkEtU9H93Cfz9s29+ikUrYrA9X+deG041AE
         h2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWHaKiq6c8p5sehrzGKdYs78gi5mt/mRZQ0Pj4/3HPeGQW5oxmNIZBD/a0A8ij0s4Ng+WQRpGif/qg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrBI67xzwd1XAIUqlJghqFhw9XOloszEWdklAiUlLQQS5WNNB5
	Qr+5YR/F3QODuvUvmo9xqsNW49ZhCQncTLdIpKYcMmfypLPXyur7UQQwVDguPJ8pAA==
X-Gm-Gg: ASbGncutOW9namjjwnMraiUoQoB212C3Bkr0LooAA/EvscYvSgiOlpjgf0GiUez2ytf
	MSik2FQMLHBr/rA2nRBiHyzc2sUoAVv38Vk58z7I+Phid2YEqniw+3IOpMuhDylHPh2S+jiJ+Lt
	veqhGcB7EFyAonhKMsp6GN1zPVaxKrdBb1g+rUj76+NAtve8ph3IfACt5zG4H68tdjrgIgmDqX+
	9o45B0yQU3yW9xkHpP4Qe6ChwGOubGQuKxOtWfKuhVsUlVjxdQTIfYTL+ytqNBpTp26Xc5rWHmg
	/IfQvGa3IGvwYBDJD+RpL73metgGkf8bcdiQ7dQQtnJphKPr/3SqYeAP/2ebMq/R1bieNgpRbnc
	FoBMcJbjxjvEmSo0sn5bG9Wg8rCjA7a5tHKS2prRLny07dgIEHtDxNrqnQPEXD/5JCKqTyNRevu
	0cnSrgxATNeCegpGuX7w==
X-Google-Smtp-Source: AGHT+IHZH3MbCLPqITuA/UyF9K4gcbiQz8hy22imFWRImz80dntjTlAT8fyuVl0ZiW2AqMw2FESY8g==
X-Received: by 2002:a17:907:970e:b0:b04:3f61:aeda with SMTP id a640c23a62f3a-b043f61b010mr219212266b.63.1756741365091;
        Mon, 01 Sep 2025 08:42:45 -0700 (PDT)
Message-ID: <cd4958bd-779e-48f1-a980-88f75bbd177f@suse.com>
Date: Mon, 1 Sep 2025 17:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] x86/traps: Make an IDT-specific #PF helper
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-12-andrew.cooper3@citrix.com>
 <5c0cb015-b2e7-467d-9c1f-2314bcb66ad6@suse.com>
 <d113f104-8bf1-48d4-bd99-2ae06c0ea448@citrix.com>
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
In-Reply-To: <d113f104-8bf1-48d4-bd99-2ae06c0ea448@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 17:36, Andrew Cooper wrote:
> On 01/09/2025 10:46 am, Jan Beulich wrote:
>> On 28.08.2025 17:03, Andrew Cooper wrote:
>>> FRED provides %cr2 in the the stack frame, avoiding the need to read %cr2
>>> manually.
>>>
>>> Rename do_page_fault() to handle_PF(), and update it to take cr2, still named
>>> addr for consistency.
>>>
>>> Introduce a new handle_PF_IDT() which reads %cr2 and conditionally re-enables
>>> interrupts.
>> Why does this IRQ-re-enabling move to the IDT-specific function? Do you intend
>> to do the re-enabling yet earlier in FRED mode?
> 
> It is updated in a common path under FRED.

Right, having spotted it the meantime:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

