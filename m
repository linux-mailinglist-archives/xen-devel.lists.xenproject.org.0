Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFD8CC225
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727659.1132249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m2X-0005xW-ER; Wed, 22 May 2024 13:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727659.1132249; Wed, 22 May 2024 13:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m2X-0005vk-BP; Wed, 22 May 2024 13:29:57 +0000
Received: by outflank-mailman (input) for mailman id 727659;
 Wed, 22 May 2024 13:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9m2V-0005uB-IU
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:29:55 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4ec0a9-183f-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:29:53 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso14127946a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:29:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17555sm1773890266b.189.2024.05.22.06.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:29:52 -0700 (PDT)
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
X-Inumbo-ID: 5f4ec0a9-183f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716384593; x=1716989393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBQwF2MTC44b/9TtLPH2MX0VuDwOJrgwU5fmaM9VTQw=;
        b=VySFlEjRjzqRIdw9F2BLsQbPKqXpsIuD7I0GtwyTn5pc8nT2E6aqh+VVFWYf7OKno5
         Fv06PiW80d5dlnckI1BO9k9Et4tHmClNtGkkaxmuVtMMmaZCm6sQEShyGtN5OUdtu89s
         mNxT/6h898bM0ZTKUBiDF2kuPwQ2xT/l72xRzEh3mHcOU9HMrX0a0lfkjK77qFAuIWVg
         KvRtfeiX207yc70TEV1fn8Dfw7I9Eyc1EfU8TZbMfWqMjvw3oSwbSIPP/AvGOtzWyD+R
         06HzMjTdORchWnUkzx6T/KJrbDoS4zpSdm2V4ndHspdz2mB1CiRbzR6VKBtHjCRIzLXZ
         Rkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384593; x=1716989393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBQwF2MTC44b/9TtLPH2MX0VuDwOJrgwU5fmaM9VTQw=;
        b=i9njNCtg+aSXjTwtiS3cHytEg2DZJpCDwd9QF1yeINR9UJcX+dD+BdAya/iYaXkPNu
         RuEBS6ZJmuK5K1sjrrY69cx3jps58m9olXhEPRwg3KLUlDW3Goa9QMfh/L0WpxGSNSvY
         ZvS+nfHC/DxTJe/FLq99W8P0fGBvQVUb7rYomc+KvW/QvC3JprNmkiokJUAR0wSQbEf8
         hIlt5Xopg3zr7FOfytVZBpG6bfy1tUHKYsdCZnDgSmS5procvYwVMiEAipSAT2cilaPO
         MnDm6NpQaoSOr91z5Tqd168u797OYcAqtcbC1BHnGBXXs/XC81xILcmQ33Wjrlziiy/4
         m9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVldbPwv4/7uKlmPxWQh4gH5dOmxaL/Dpx84p668MaRmV4rLbtCifUM/OPT2x60nEHNALzNwjdqUYd0YesZ4NEs/7e8m2Ih1cLFg0A588g=
X-Gm-Message-State: AOJu0Yz8HaKkJYEP5TVeKwEXxWssRocZlbgaGS5TjBXuvWAVzbWDCD24
	tyGYCYenNIqyTpWemFHxPJrXtfnPU7H1idX4bukgdhkWbbng0AyFpR9HCnxqwA==
X-Google-Smtp-Source: AGHT+IGX9DUTMg58NzGkz/C5hDlFYHSaWaR9BMHaC2XzSJw57H/UxAqRbwZ2cNoNhtS4rFCpFeJ2Wg==
X-Received: by 2002:a17:906:3594:b0:a59:b784:ced4 with SMTP id a640c23a62f3a-a622818ebc3mr125008766b.75.1716384592843;
        Wed, 22 May 2024 06:29:52 -0700 (PDT)
Message-ID: <93c7230a-bd2a-4763-a90a-89e02a169b1d@suse.com>
Date: Wed, 22 May 2024 15:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2708dbbb-f913-4920-a008-beef12cd1265@suse.com> <Zk3xtK0SaaqEadXY@mail-itl>
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
In-Reply-To: <Zk3xtK0SaaqEadXY@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 15:22, Marek Marczykowski-Górecki wrote:
> On Wed, May 22, 2024 at 09:52:44AM +0200, Jan Beulich wrote:
>> On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
>>> +static void subpage_mmio_write_emulate(
>>> +    mfn_t mfn,
>>> +    unsigned int offset,
>>> +    const void *data,
>>> +    unsigned int len)
>>> +{
>>> +    struct subpage_ro_range *entry;
>>> +    void __iomem *addr;
>>
>> Wouldn't this better be pointer-to-volatile, with ...
> 
> Shouldn't then most other uses of __iomem in the code base be this way
> too? I see volatile only in few places...

Quite likely, yet being consistent at least in new code is going to be
at least desirable.

Jan

