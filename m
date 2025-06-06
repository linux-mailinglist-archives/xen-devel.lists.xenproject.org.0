Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98197AD0002
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008335.1387613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTvN-0002Wv-58; Fri, 06 Jun 2025 10:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008335.1387613; Fri, 06 Jun 2025 10:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTvN-0002Uv-2B; Fri, 06 Jun 2025 10:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1008335;
 Fri, 06 Jun 2025 10:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNTvM-0002Up-AY
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:03:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 871f75f0-42bd-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 12:03:43 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so1160360f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 03:03:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f66a622sm888967a12.38.2025.06.06.03.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 03:03:42 -0700 (PDT)
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
X-Inumbo-ID: 871f75f0-42bd-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749204223; x=1749809023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c8vug/+ZTsi8T4CoWMG4LEtISTJClyp/VV+jTSRjkZ0=;
        b=Vo3FBbSPjKwK5fbSil5dkaUrev/HQvGRIc8c19/UWPw5dle0xMP/qfIvnVmuX7ve7a
         pSgoIW6j/MOFkXEhVuECSIE9fC1A+DF+a6XZGHbdCvrhOiga0zM5fAR7u9ACUb3nwoFZ
         u3IoHedJVZ+neGijDjW3K6KcAzJiDzyN5DhPdkEjF1X5sAqBnTY95Tv1b8Td4qpf/oNw
         4X25aOV+dwC3NV8qHoeRVbLzurpM5QiZKBBYWieaIgeO1KS8N8o3wckr18S3LOqSGqK9
         tAQgkO4cQ3h2qLbAv5Gj8ALMKOb16Lkn6CDUWkJIvFbZWHAo/XkmlAUEKeQ0R0jVcLA1
         6uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204223; x=1749809023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8vug/+ZTsi8T4CoWMG4LEtISTJClyp/VV+jTSRjkZ0=;
        b=OHauMKtGb36ZZIvcWYsrJy7s8YehrsQ7/cMEUDFPWm3cZ0OCEk/wFh/LRft0dxZ4Ro
         WDc90PLpVwS5kH5ra9aZlNsztm34eIcobUhSUqCPB9dYmZtcEw+FxXQGkFuv0ezaD+MG
         klRwTgFFfqjfc+rvV4XDpcZ5giaAAlmAwftt/k2wQXKnEZ+ktgtTExBxJUSY+tQOrStO
         X49pf+0phRV5m0jOD/JLLYXfzIvPHmLetZlsmGxl6X6tDhk11UPTJ+ixfTGP1ntPh2uf
         SWZIokiXxwbTat8yTt6cK4/FRJ5d1U8X754XP/pgEBtd6MfVabxG18LdaW+2ZV0wWHWA
         0YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjqp7hBaya16ZMTeiQL9U7QLcmz1XBPvT0qIHfx9x7s0YK8JT/KfweS0h+l/54ZcB/D7xoT8f8/Gc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH6DbjTcLaDea3qqYTI7AAeq8YYLcqIJqL6gQMuZsAP0KVibQw
	AuUqM57rde3BdJELMbyCzDaV2rhXh9cBnvoNERBCj46tSqdpD84jOleIv2tfa6Kg3w==
X-Gm-Gg: ASbGncvHGzF0PWIH1Ve/T6kcM9elr4XriQmHCWmSjwPirgVMbMOfaaSdzQmFT+Qi3GK
	A1lQxa31d1aqh2dAZTvH+JWpGVpokdBLmJly5vLTBHdLCXIroaAp0ppx4z+IQNsGwCce46ZkRbx
	0YiNCIFsRMHHhAOzbxWSGZs40rfHX8TUBJLDUw7sBdRnfFSUMyTVPqleleCgSSHIKT/a7sJCFJ0
	J8oe4PR+OQg9tko0pHqrBnne2GG2lPxGgLYs2yAPBOH3xPgb8Wu0oeDJruVfjmpsDqprwKG2/JX
	NTAqdiMtoZCwcLTnOPQKGb7OHtGyKYDpay4sfWGA3lsznaCIgzlH5iHQfGhoH9wYxzeZdFjH4GA
	cwpbYqzEXjOegvU+TRSwflmFLG83GBxWi5zb7
X-Google-Smtp-Source: AGHT+IF0Bk6XCQvcCd9IOYay9d0mIQrpTJgAeJu87lkMcUWIyJ+V72xLHJmoBmQvPN2V1lGZ1n9OKw==
X-Received: by 2002:a05:6000:2484:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3a53189aacdmr2422601f8f.13.1749204222594;
        Fri, 06 Jun 2025 03:03:42 -0700 (PDT)
Message-ID: <20e6673b-bf85-4f9d-9938-7005a481b898@suse.com>
Date: Fri, 6 Jun 2025 12:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-2-agarciav@amd.com>
 <38104467-fb7e-4aa3-9c78-0f9bf23183eb@suse.com>
 <DAFCZ0J2JEVF.3TIHRWPDJA1PL@amd.com>
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
In-Reply-To: <DAFCZ0J2JEVF.3TIHRWPDJA1PL@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 11:55, Alejandro Vallejo wrote:
> On Fri Jun 6, 2025 at 8:51 AM CEST, Jan Beulich wrote:
>> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>>> --- a/xen/include/asm-generic/device.h
>>> +++ b/xen/include/asm-generic/device.h
>>> @@ -1,14 +1,20 @@
>>>  /* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * This header helps DTB-based architectures abstract away where a particular
>>> + * device came from, be it the DTB itself or enumerated on a PCI bus.
>>> + */
>>>  #ifndef __ASM_GENERIC_DEVICE_H__
>>>  #define __ASM_GENERIC_DEVICE_H__
>>>  
>>> +#ifndef CONFIG_HAS_DEVICE_TREE
>>> +#error "Header for exclusive use of DTB-based architectures"
>>> +#endif
>>> +
>>>  #include <xen/stdbool.h>
>>>  
>>>  enum device_type
>>>  {
>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>      DEV_DT,
>>> -#endif
>>>      DEV_PCI
>>>  };
>>
>> My objection to these changes remains; as a generic header it ought to be what
>> that attribute says - generic.
> 
> It is generic for any architecture where platform DTs exist (that is, anything
> but x86).

Here you're limiting things to what Xen presently "knows". I'm sure there are
other architectures where DT is entirely unknown.

Furthermore isn't the work here part of the hyperlaunch effort, where DT will
be introduced to x86? Hence "anything but" isn't quite right either then.

Jan

> As the commit message states, these guards are useless, provide no functionality
> and create the fiction that somehow this header is still relevant on an
> architecture where only PCI is available. And that's just not true. x86 being
> the sole architecture without DTs actively overrides it, and relies on device_t
> (defined as struct device here) to be a "struct pci_dev" instead in
> x86/include/asm/device.h, with dev_to_pci() and pci_to_dev() being irrelevant
> because device_t* and struct pci_dev* are identical types in x86. Removing that
> override header is not just a matter of performance. All the IOMMU ops are
> referencing device_t, while the drivers are assuming pci_dev, so all IOMMU
> code breaks immediately when x86 tries to use this.
> 
> To be perfectly clear, this patch isn't strictly required to do DT unflattening
> on x86. But it's a piece of arm tech debt that Xen is better off without.
> 
> Cheers,
> Alejandro


