Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D1E8A85AE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707532.1105537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx640-0007GI-9B; Wed, 17 Apr 2024 14:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707532.1105537; Wed, 17 Apr 2024 14:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx640-0007Eo-6J; Wed, 17 Apr 2024 14:15:04 +0000
Received: by outflank-mailman (input) for mailman id 707532;
 Wed, 17 Apr 2024 14:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx63z-0007Ei-0W
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:15:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0df9e38-fcc4-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 16:15:01 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3481bb34e7dso1271276f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 07:15:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z4-20020a5d6404000000b00343b09729easm17671506wru.69.2024.04.17.07.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 07:15:00 -0700 (PDT)
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
X-Inumbo-ID: e0df9e38-fcc4-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713363301; x=1713968101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JTzleOEDmFfkoZIM0qvTTNcyt2HkPDk0yTJMAI0IcQ=;
        b=HSeKQwARlRgJyCXo8eWfpC4cR8UlCufFkEYRJdzB1O8UADe2PssyAfxy4IXLqYKxYf
         Ir7zWZFbEUhN3WNr7Yxk0SM8jtWp8k+piqp2rp+lW/7ji3wjFwNRW+lURJhGPk5mt4fL
         CIl5LcSG1JmMQkooWQT90fazal6MLM+YUK/sRcjEj4VOMS8ZZWh+3bxdYfTQdktVABsL
         adBjVksLFHx6yc5/77s4YBKd41mg0JNw4E26fJktqbHtzPkXnTRGQGrmzJfz3wsJzUX+
         L2FFA7Mr2BVNWUuxRrpkvlN20U3iEndBEPETrcL0M50fxvYV950weX5zP1y8WEn1SMpD
         OtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713363301; x=1713968101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JTzleOEDmFfkoZIM0qvTTNcyt2HkPDk0yTJMAI0IcQ=;
        b=m3ksZ113mTm5QuDmFT9T+6UdEPlVtVeQBcDOeFV1O18Hl1cyUwZIDNeTkaBIge5RYu
         sjcRo+QCaxtxcU5TdCpafJBCqGnHLsvIkxY41ukVe9cGP64Uj9ae0mlJwtPA2oTKCOsc
         SvttPi5d5mCnT5ueWXSi5zYQX0IZJ/5cbiXfMGfDRiF5x8JKz967vKBGmK/4yxqrfvUn
         SHlq/VTW9q4dbcYg8E/GDdaaa7wYbbj+wTqIXg5l2J2F4mXs/E/7FTHknTUIncolwaE4
         c05aNFCbe1Lhs3gU7ABZMjSfxuToXL+Kb6gXpkfgTzsGFGnTICbt92UoWyWdOuIgXbJ5
         ksBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoyuUoQnNm3FHSgwhmoH7kTZnLrrJa1XqqPkUBieEaqqOrSch5QblN3UHJaAYIK1NC/sBkoqS8ap99NM+nRDIWvJUYalb/6ksdp3v+GyI=
X-Gm-Message-State: AOJu0YxtEC6UFS3UUWkw51dNV9U81bP9Qg/A1OLCfWSs74CG5doLmaq6
	SW4ClohcQgtJTNU5OnCpajifTA0J0gTcotRlaAa5IUCP7daToA3kbv7Wj477DQ==
X-Google-Smtp-Source: AGHT+IFPrVuavRLBDGvLrq3YsuZ2R1MCf0knaoR8Mp//uvN52vGcjbZnsqWwaxLxcmpuiHnL5N/5uA==
X-Received: by 2002:adf:e25b:0:b0:347:3a0d:c665 with SMTP id bl27-20020adfe25b000000b003473a0dc665mr8996580wrb.67.1713363300703;
        Wed, 17 Apr 2024 07:15:00 -0700 (PDT)
Message-ID: <0d84a96a-c1ec-4c4e-9cb5-44a6542e0d43@suse.com>
Date: Wed, 17 Apr 2024 16:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE
 binary
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-2-ross.lagerwall@citrix.com>
 <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
 <CAG7k0EroeA=cRRDWnJqzH8esoaSmtg8-xjTwc-01og5R9JwPzg@mail.gmail.com>
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
In-Reply-To: <CAG7k0EroeA=cRRDWnJqzH8esoaSmtg8-xjTwc-01og5R9JwPzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.04.2024 11:41, Ross Lagerwall wrote:
> On Mon, Apr 8, 2024 at 11:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.03.2024 16:11, Ross Lagerwall wrote:
>>> * The image base address is set to 0 since it must necessarily be below
>>>   4 GiB and the loader will relocate it anyway.
>>
>> While technically okay, what is the reason for this adjustment?
> 
> The multiboot2 spec generally uses 32 bit addresses for everything and
> says:
> 
> "The bootloader must not load any part of the kernel, the modules, the
> Multiboot2 information structure, etc. higher than 4 GiB - 1."
> 
> An image base address above 4 GiB causes trouble because multiboot2
> wasn't designed for this.

Yet mb2 doesn't care about that PE header field at all, does it? In which
case my question remains: What purpose does this particular modification
of the image have?

Jan

