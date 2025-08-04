Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE462B19C05
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068798.1432659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipNe-0004xe-2I; Mon, 04 Aug 2025 07:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068798.1432659; Mon, 04 Aug 2025 07:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipNd-0004vA-VU; Mon, 04 Aug 2025 07:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1068798;
 Mon, 04 Aug 2025 07:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipNc-0004v4-Iz
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:13:08 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77ff8387-7102-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:13:06 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61589705b08so8848317a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:13:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23bedcsm689825966b.120.2025.08.04.00.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:13:05 -0700 (PDT)
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
X-Inumbo-ID: 77ff8387-7102-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754291586; x=1754896386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9sL4KOg9CuE7xg6Q3R/auyFJ3h+arscPSkuPTb1/UQ=;
        b=EeL3i2VL/Nrw1b8pVzaDz1NsANxQC+bLRRyRBe98ueENMqpNOLv4WW1JeIq0hl7YJz
         CyyMnrNkLjJm4ryU9yGMwdnqNAN1A4isjrswUsWegZxFGhXpUL9Cxr//2W5qJfxOsPVG
         SyX1YRKQGTIQKty4UxBYzUps80zpMnxdeKypDOOq/LOX/lsviJuVy8vFwgUMxqhrOHL5
         bozOf8HmVGYAhKHVWfAwu4zciBd34NR0cr7kfGNGhCWBGgh1Gmhjz3v7Tu1B50tEBAMW
         IX5hWo0uUy/KUqGZ7+avnqShd5B41A4QhljEPY+8aCsQ3i4QiDi9I51QKrQzs8lzk4BR
         oCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754291586; x=1754896386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9sL4KOg9CuE7xg6Q3R/auyFJ3h+arscPSkuPTb1/UQ=;
        b=LLGyUCapsi2A7oGhr6akS3j2lzlf8wVaQd76jPPQWxBj9j+o2pLLQizBPPieiBxvEQ
         YZajqmpDLjTWb+qG43HpQbYJDRwcD3AsR3ovrrwQ41pocVKVM6yislOc2xAhTvtBcA/f
         4Fr1mqwbsVXzocTuYC0JhrywrTLIdS6ViKTiJwz9rDxglMExSp4Ooe4z6g2ISHt2wf5B
         aiDoOjUuf1TDjoSdmXO08HUregHve0EumuHiHVVY+9hb9TPCrM8paFZRa6OIp6+7S4vs
         b9c/4Zj6HrqR2dTX2Q4LmTUebEELGwcLcVpNhLz0DTmvWOj0sei+ltFz7VpTSp0zhypA
         wliA==
X-Forwarded-Encrypted: i=1; AJvYcCXFiAjkHyvgIuxY86eq3QKNGWVuclJtOtm0azjJDiI/fsjLqQfMk6SIhU2W7NHDcjzLtj50A9y0KnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCTDpj0uElG7QxZ5OfIHwPlgLxOIc7XU002ifCppdVxSdlh+h6
	maXf74ISXSoqcVsSkDd6uu1iyi1KeK5cs5sK3oUQgdnNVlFe8Vdm1V3lXHxL4LDRGA==
X-Gm-Gg: ASbGnctkShuUC78gxeJNKChIvAFh+R0uGOQtLuP6qr5sOQT9x1nfRrBXqbJqoNEo+pE
	BJxK4C12nVuAND+rkvEW+CaRWbN+iFv69IKfJkUu/ho9THa+qsPNr/JcqrRCsWHCDQjHEcylxxB
	iIl4/7VNxr2iI/hPLVq/aSeloK6V9oeH7wCrstYSnoRxXjercEGFspDWdTbXaPd5V8L7G0Kr/Pk
	2GJEhw2WYobDdGD35wYPYS7eC1rcjM2uB75GiNPG77XzUjGXPey8dYhUWbOUvo7qtDGMGBX8kf/
	49TzuGF5UoAV7Sp7spm/+yNKw6avTZ6r4HBiZ1+4kCGNSzO+rjwLBGoadCHa6rKCuO6pcfzVKAb
	GJ4H2luvzNc9wcbXV+dNCMHaefT9dXvoBpcWKI8zl9j8bJ0/BzVAd8Qi4D1FOxdx7/qBsTFZ5A5
	4gauceawU=
X-Google-Smtp-Source: AGHT+IGTXm91faOqQN9nSQajgLptXqREmpR8L6HaCfZjdMu771gvrgH1+6DmODtTlGIsr6uoSuVk3w==
X-Received: by 2002:a17:907:1c0a:b0:ae0:d38e:5852 with SMTP id a640c23a62f3a-af94016a045mr810434566b.39.1754291586089;
        Mon, 04 Aug 2025 00:13:06 -0700 (PDT)
Message-ID: <61efc085-a787-4ca9-82e4-032408532ba6@suse.com>
Date: Mon, 4 Aug 2025 09:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-13-dmukhin@ford.com>
 <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com> <aIvYSn2ZwyWTwIzm@kraken>
 <65e288b7-d8fe-409e-a287-69b4dc29f0c2@suse.com> <aI0V0v0yltODw5bs@kraken>
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
In-Reply-To: <aI0V0v0yltODw5bs@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 21:30, dmkhn@proton.me wrote:
> On Fri, Aug 01, 2025 at 08:02:56AM +0200, Jan Beulich wrote:
>> On 31.07.2025 22:55, dmkhn@proton.me wrote:
>>> On Wed, Jul 09, 2025 at 04:57:44PM +0200, Jan Beulich wrote:
>>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
>>>>> @@ -458,16 +459,16 @@ struct arch_domain
>>>>>  } __cacheline_aligned;
>>>>>
>>>>>  #ifdef CONFIG_HVM
>>>>> -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
>>>>> -#define X86_EMU_HPET     XEN_X86_EMU_HPET
>>>>> -#define X86_EMU_PM       XEN_X86_EMU_PM
>>>>> -#define X86_EMU_RTC      XEN_X86_EMU_RTC
>>>>> -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
>>>>> -#define X86_EMU_PIC      XEN_X86_EMU_PIC
>>>>> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
>>>>> -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
>>>>> -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
>>>>> -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
>>>>
>>>> The old code deliberately used values from the public interface.
>>>
>>> In next version I am building, I moved all of XEN_X86_EMU_XXX definitions as
>>> is to a new public header under include/public/xen-emu.h:
>>>
>>>   https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/9b0bc5ffa5710114df8523ae2aa7680b7c6f0942
>>>
>>> That looks less invasive.
>>>
>>> Will that work?
>>>
>>> There should be a common header with emulation flags somewhere, since
>>> there will be SBSA and hwdom vUART definitions there.
>>
>> Yet will there be a strict need for any constants to be identical (i.e.
>> not only have the same name, but also the same value) across architectures?
> 
> I don't think there's strict need for identical values across achitectures.

That's what I was expecting.

> But some of the constants _may_ be reused for non-x86 arches, like VPCI bit
> and, perhaps, IOMMU, PIRQ and future NS16550 (after adding MMIO).

Right, but as you say - they want to use the same name, but they could easily
have a different value there. I hope you understand that what I'm questioning
is the introduction of a single header covering all architectures.

Jan

