Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D680680F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648930.1013026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAm7p-0008L0-Ip; Wed, 06 Dec 2023 07:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648930.1013026; Wed, 06 Dec 2023 07:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAm7p-0008Ib-G0; Wed, 06 Dec 2023 07:15:17 +0000
Received: by outflank-mailman (input) for mailman id 648930;
 Wed, 06 Dec 2023 07:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAm7n-0008IV-PV
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:15:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3364bc6d-9407-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:15:14 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c032962c5so49577735e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 23:15:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk14-20020a05600c0cce00b0040b2a52ecaasm24961745wmb.2.2023.12.05.23.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 23:15:13 -0800 (PST)
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
X-Inumbo-ID: 3364bc6d-9407-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701846914; x=1702451714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tsUrV2TsEnAnqqlFfFUF9DdBZ35EFK56xyRvjdTs+QI=;
        b=PtJ1FT+SOPtdKAGV0g//fVdfvxyX7/2jkFtaclaSV0bFk5JftzIGCWcOxl8BcjWv3a
         /md8fVOnp5fl/B7bIL4AicPQBNeBl+2IRR3CZ2Cv5oSU/SOEstAwiaqnzwJMoveDLfAj
         oTRoesBHYLQQWgj5OjTXxGKFuzL10ovZ+I7CR87TL2SG6TTWbu04ZS7p1h0fcrUVyXJP
         9bP9Mc9kwKyLHtjWgkVYvZCGfU0cacd1loNsXk8jwKA8O0c5kbzk9LFrQS+0kgnmpmbL
         24kNo4pSYfxbBLzS8IX1qQcwGND+XopebNfksuutD1WBE3kQx0B+B9at4r2qDNp+vQ1+
         RX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701846914; x=1702451714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsUrV2TsEnAnqqlFfFUF9DdBZ35EFK56xyRvjdTs+QI=;
        b=SegW6I5Elt3s00Wf4g2d15G6fmTXn3BwKtO7nswBHKw+WPsirjeZBh+4P1bAnpkX8P
         7C7SVBIzFqmfVn2m6ViqfUmnyMDh+LdZZSRmwDI1klRfx15fDy2Tazbg7s9J/fikmv0b
         ZtyMR8pPBb8fhEgQFSysfgQmPHDojbiPOsL++cZwp2e/ilVJNBWK0rGVNp6RPCLdE85G
         wuGxKNz1ZSo/gki4Hfivc8sk34tTeBpGGdj16J+qmEAopV22v0Dfscoct2zRQ930+Q0j
         cKIEo4UcBzQoz2KfSf9sat7rU5Fw9cW7UJt00MEuw3Xui+AUxXuMQi6z8TjVSwCrq5O/
         mW2Q==
X-Gm-Message-State: AOJu0YzFjWGq5Z2Hh1Vodv5ZSHEYr2HFY36U0+dTDhxCkm+R41tiVX85
	2nwf3DJSSSP9eEhC0mvvi4QQ
X-Google-Smtp-Source: AGHT+IHb+qIvx/+xyz5tsnH86VbLDff88N0kU1Yqz8cU99a+xZAn+Gp3aM+Vy7NfmhwadlwmdutlvQ==
X-Received: by 2002:a05:600c:46cb:b0:40c:83f:b6ce with SMTP id q11-20020a05600c46cb00b0040c083fb6cemr218178wmo.56.1701846913939;
        Tue, 05 Dec 2023 23:15:13 -0800 (PST)
Message-ID: <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
Date: Wed, 6 Dec 2023 08:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
 <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
 <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
 <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
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
In-Reply-To: <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 21:31, Sébastien Chaumat wrote:
>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> 
> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> ioapic-edge and IRQ9 to ioapic-level ?
> 
> IR-IO-APIC    7-fasteoi   pinctrl_amd
> IR-IO-APIC    9-fasteoi   acpi
> 
> to (xen 4.18.0)
> 
> xen-pirq     -ioapic-edge  pinctrl_amd
> xen-pirq     -ioapic-level  acpi
> 
> ?

Aren't you comparing different things here? IR-* pretty clearly is on a
native kernel (no Xen). It being "edge" looks suspicious, though.

But again - I'm not primarily a kernel person, and hence you continuing
to send replies To: me feels at least odd.

Jan

