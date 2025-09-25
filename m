Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1CAB9E96E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 12:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130313.1469891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1j05-0000nn-QA; Thu, 25 Sep 2025 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130313.1469891; Thu, 25 Sep 2025 10:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1j05-0000lE-MA; Thu, 25 Sep 2025 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1130313;
 Thu, 25 Sep 2025 10:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1j03-0000l8-M0
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 10:14:55 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac99db8-99f8-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 12:14:54 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-62fc28843ecso925480a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 03:14:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fd0a64sm137302066b.85.2025.09.25.03.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:14:53 -0700 (PDT)
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
X-Inumbo-ID: 7ac99db8-99f8-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758795293; x=1759400093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aeAeXlAbXoeVkWJUyNGQ1wkJMedtU3dM69DenLizizs=;
        b=OaZX01b1hqWtyoZ4h3+OWbF+Ep7ePnWZtX/Uxq1W30FVOSoGXxGBcfdGtDWqp92viD
         1mQGtLDqDw1LARd3jLIyxPiqXIRw4Yq/Z8vBqhsJ7kMJz+5Rka0/S+rP33nQY5+8Kz4k
         7VUmJFOkBGU974UiiwBuwpwdQvqRJ23wKfQo2KBITCoOM/4AdvCU67U63rjBol+d2PoV
         HyGsmnSHhpwlCQgJeIOkI2/rITHq+qyn/Z+nP50FIXfi+Gi3lH1Hn5IJgM6c0i9BuCIL
         LSNfhPctGyA84S9aciymAPWigtc2H4Ds45H2a9Fbmgjejirii40G4A61quC9bOGLeztR
         XuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795293; x=1759400093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeAeXlAbXoeVkWJUyNGQ1wkJMedtU3dM69DenLizizs=;
        b=oBbV1x5wWjpMaGafv0+SEAVjFXv7jzn4//uEQvtuBYFpZMOvGYCCNvomoCjnnVGZ4d
         jA4t0WUz9MsqduxYbrKEnemMjLUYPl8rdIxEdcaP64LmTRmfqaahLGFkIh1ON0dLME4o
         Axhx/ld5tPGIpa+Mg7k0roxbjOA9eegazm43WsMxOFq2+ZmklIwmm4Azf09ISdTbRETd
         MarFat0k5gXZePB7R6rnK7K+GJqqNtXsb9KdRN75Do+TZKroqjgdnxCbsFAUAENNnekS
         0vW8K5kEGNNKrFb2opafzzcT7GgPOpt+yWk4oRq2HGYsD8YBuc4EcqS+fnK9d0VIekcT
         19Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUM6dKAXYN2hWU2KxRH7jw5xnHed+TTq0qfDHFCElau4WZTGdsuZJyn+SwviuI+PK8b6Spnc7xNop8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE3FbdVWbaU6XlBbIM3TkyO6hYUG6XfwMWbLe6gkFscmsLMEwI
	uTCzdkWI8g1e6x/PI1DtxLMdpvDGuqArCElpgUwRcW5/HSkPNza5n/BBJnY8M0fTQQ==
X-Gm-Gg: ASbGncuflmod+45xel+2izqvUpe/kPQzpMMaelwL2sXTzzHUEDIqEFkEa7XrmdutAo6
	yiebE16zVgoVulHK1g2WARa4mjmYfYrUcWG9VDuO+rmFmto6ghwdmvGwqmHSuZ2lT5gBaaAp7xK
	3rhFIT9TEkmnpJxDfP8UE5fIMG0HfrgtoISGmCPdjqvhiMYRj4/Pu/Jzz3WNYH+RuBLxbHSwUIY
	ff40xQz/zSHFH9/OaskCIc3SEYwq9+mzxbFN6XdWNTw7QFcuNKmDcMiaF0GjsNh4Ur/neseWdh6
	EgVdSRHPnGy7Fx0BV7D3mSOeaYcim8cDDl/fLbJ/xYwkO6m/2kOAFgEd2hkV1h2mhPDbdxhTDqT
	QT7bxU3EVMZ6+UJfnoRJ68rHV2ncE9eJKBLKzVqUZpxgd/rSNjicPeflTVKrxfIE9Dt3Da+25Yz
	U3qq5vEOg=
X-Google-Smtp-Source: AGHT+IEprk6688V+XUNP41hZ3jJNhAQ8lPGp8D9qvrj71UFU5NPPjzab73oozCNYZVKEAcWL2+NMag==
X-Received: by 2002:a17:906:4fce:b0:b2d:b5d3:9630 with SMTP id a640c23a62f3a-b34bcd58344mr336683066b.48.1758795293351;
        Thu, 25 Sep 2025 03:14:53 -0700 (PDT)
Message-ID: <303871e2-f81a-45f7-a396-7bb449606dc7@suse.com>
Date: Thu, 25 Sep 2025 12:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
 <9507e775-f9c3-4351-9c76-ca939c1147bc@suse.com>
 <fba9650a-0015-435f-bca7-5876c952bcdd@epam.com>
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
In-Reply-To: <fba9650a-0015-435f-bca7-5876c952bcdd@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 10:14, Oleksii Moisieiev wrote:
> 
> 
> On 25/09/2025 09:34, Jan Beulich wrote:
>> On 24.09.2025 18:00, Oleksii Moisieiev wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>>>   	  Xen boot without the need of a control domain (Dom0), which could be
>>>   	  present anyway.
>>>   
>>> +config DOM0_BOOT
>>> +	bool "Dom0 boot support" if EXPERT
>>> +	default y
>>> +	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)
>> This line is too long, and really would have wanted to be broken up anyway. Clearly
>> "depends on HAS_DOM0" can be separated out. I'm not quite sure about the extra
>> Arm-specific dependencies: Are these two really Arm-only (as in: not also affecting
>> e.g. RISC-V)? Furthermore, what if I turned this option off for x86? Doing so would,
>> aiui, have no effect at all right now. An option without any effect imo better
>> wouldn't be exposed.
> My intention was to introduce same behavior for both x86 and arm.
> Added this config parameter as was stated in the following reply for v1 [0]

No. What I said was "Imo at this point x86 should have this option set to Y
unconditionally." That's not what the above construct does.

Jan

> For now, since hyperlaunch is not merged yet the only option for x86 is 
> Dom0 so it will
> take no effect for x86 right now.
> 
> [0]https://lore.kernel.org/xen-devel/9814144b-5eb4-421a-93f3-2a15232a7dd3@suse.com/
>> Jan


