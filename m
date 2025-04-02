Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27318A78B6F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935445.1336857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuby-0002LJ-Mm; Wed, 02 Apr 2025 09:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935445.1336857; Wed, 02 Apr 2025 09:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuby-0002IB-Jl; Wed, 02 Apr 2025 09:42:18 +0000
Received: by outflank-mailman (input) for mailman id 935445;
 Wed, 02 Apr 2025 09:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuby-0002I3-2u
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:42:18 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38dc7ab-0fa6-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:42:17 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso385408f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:42:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662c1csm16235017f8f.28.2025.04.02.02.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:42:16 -0700 (PDT)
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
X-Inumbo-ID: c38dc7ab-0fa6-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743586936; x=1744191736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7bkYIc5sK6KC2H3l8sO731WfsRKLZIuOe9PPaPtYiA4=;
        b=LWwIo+FU2k7Ze1v6U6K9NYPCDS1Ww+z76ZXHIqeIvPfIFK0OOdNlFMsmvPNI04gEla
         fEC9X0qRbYfbsg+NC9sMJ1+nlY3sbGgg0cB53XBtpZ3zZF5MSLGbqMwnsEapz6WC+HRu
         96Wj8TsxijFLVZCCE/nMcPi/pZHwPZTymI9gSNPIVZwbT2bqkYM84rCD0BWeRCl9ZsyC
         X7p2klmdmds23/fRX/ecCyxmQbnBXwJ1F1QtBhTFswzD1RpZ2G4b3a69OHIREq4AQsce
         F383EYGu+0c7uuF7dz5tGn0zbskhSn9FBei0eSyiS5sZx5BgcK4Sk+ABlSVf2FbnDn/F
         Q/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586936; x=1744191736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bkYIc5sK6KC2H3l8sO731WfsRKLZIuOe9PPaPtYiA4=;
        b=iwni+UUZ5B4OeiBWrASzt2nYbNZMhuFp7+EZHwTUaz7Y0twGXaRye075eeplm+jPPB
         vaqvx1+UKd9m77tPP5S7qpgYV74ZRXLcpEGHYxczd26cTd/IBYNIEWQXBiyvWaUYnsut
         IfBPuQ2KiodB79tBl4K10B03N6wcS2HnQGe9ob4eoq8dhEC5aJoBdQmQQ6r9MpZgQA8x
         ULz2+u0pk5EQQHPo24ay1GEsynFo5DuyVtZafsf3SKeMQ62wE4ukSkFIfn81QuS8fZn7
         H2tIQMWqkVhwmriGJJ1ow/2kr1A/E6/toTo3VtoLJ5GbV4UYIayv6HEBv9P2VKMbBHjR
         ShNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGei+7VgZcwKWT4K1WL5i1N7WsbjCiV6B816pGpMomWuOxzhFudRDZ2ov5Xdlw8DKmXIBn2GYzSq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFJo2x9cyaVRKJIAM0B7IOX1qdn6DjXffGl5K7SF90RRQu5y3G
	4B7ay+wtR+wtN2KaYX9C5YzJmVNrJOOpGfTrJ5/+9rgt+I4M5r7R0R+RiSU7Vw==
X-Gm-Gg: ASbGncvjlDz/ChS32oj+h5F5UaWsM35xoPLmMbbYLnN2bKE8qQEHQD3KdOAhcut6ovS
	VDsEa+/qSoNv/EFkWRM7ZfTkQjZkFRuXwjJe8CkZ3xMFrp96A2CR+n1FFFmeMBXPo3H8tTnf75A
	VtDgJuSjU12UcGpConaYgeyQ0VQsXtABKrK86c0AHchaXvlabhBCWGmHCe6v3vofDy/uF1j/JdQ
	Qnvf2uSZY82zfxfCFHzY9KnMpFzuL+MiRcGIfoTPx3YPHEFjU+HYt3VwegPt3LrtvOUvNcidWHG
	+ll/OHDc/kuw6/o+8o6SYiuHa68STN+99lMpkWYpKmi4xHecoiQV+vr4+l2lh9Egjic1dZFph1e
	Ug++O1eI8ArcrWOXAEPghhz9TUVOncw==
X-Google-Smtp-Source: AGHT+IGRCWogGRl8is2Zy5qQ32YRBWRqyizqwdChEvaCfiHL2lx9WOjh/1ggrupDQqtA+DeK/moGkg==
X-Received: by 2002:a05:6000:2504:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-39c2a6a3febmr1182451f8f.24.1743586936282;
        Wed, 02 Apr 2025 02:42:16 -0700 (PDT)
Message-ID: <5e9f85f2-8ac8-40de-9e17-1a070b3ff180@suse.com>
Date: Wed, 2 Apr 2025 11:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
 <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
 <87f8fc5f-ed82-4930-bc04-50106cc5acff@citrix.com>
 <52ae7bed-ba15-4842-b5d8-4fcb61df28b2@suse.com>
 <d8be8991-8ac0-4b79-83a9-f0393f1dc46e@citrix.com>
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
In-Reply-To: <d8be8991-8ac0-4b79-83a9-f0393f1dc46e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2025 11:36, Andrew Cooper wrote:
> On 02/04/2025 10:30 am, Jan Beulich wrote:
>> On 02.04.2025 11:21, Andrew Cooper wrote:
>>> On 01/04/2025 11:09 am, Jan Beulich wrote:
>>>> --- a/xen/common/bitmap.c
>>>> +++ b/xen/common/bitmap.c
>>>> @@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
>>>>  
>>>>  #elif defined(__LITTLE_ENDIAN)
>>>>  
>>>> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>>>> -				unsigned int nbits)
>>>> -{
>>>> -	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
>>>> -	clamp_last_byte(bp, nbits);
>>>> -}
>>>> +#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */
>>> I guess I can fix this in my bswap series by giving __LITTLE_ENDIAN the
>>> value of 1 when it is defined ?
>> Hmm, that's an option, yes. Yet then I didn't pay close enough attention
>> to that part of the respective patch in that series, as I was blindly
>> assuming it to instead be
>>
>> #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
>> # define __LITTLE_ENDIAN __ORDER_LITTLE_ENDIAN__
>> #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>> # define __BIG_ENDIAN __ORDER_BIG_ENDIAN__
>> #endif
>>
>> to keep the values of the symbols unaltered.
> 
> I saw no value doing that, after auditing that it was only ever used in
> an #ifdef kind of way.  IS_ENABLED() is an extension of the same
> concept, but requiring a 1 to work.

Fair enough then, and a (tiny) simplification here. I'll see about getting the
change here in, so you can re-base over it.

Jan

