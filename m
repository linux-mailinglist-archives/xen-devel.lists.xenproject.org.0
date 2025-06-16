Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F4ADAE84
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 13:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017163.1394131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR83n-00008U-BK; Mon, 16 Jun 2025 11:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017163.1394131; Mon, 16 Jun 2025 11:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR83n-00006I-8p; Mon, 16 Jun 2025 11:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1017163;
 Mon, 16 Jun 2025 11:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR83l-0008RD-F4
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 11:31:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1b3d3a-4aa5-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 13:31:19 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so6549033a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 04:31:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4adeb51sm5923836a12.70.2025.06.16.04.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 04:31:18 -0700 (PDT)
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
X-Inumbo-ID: 6c1b3d3a-4aa5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750073479; x=1750678279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XAe+MWgJTvsR6VoPJ+x38dlb6fw2IK0oklKJhP7LoCo=;
        b=V5LZ2B16M1wI87xulmNRYEVfzWg7j1r2WFs+lqbrLUkf+Qe0VBsRnVXtd/fEC8l2Ep
         AGZ9aTX0uLasOityoTzp8uLwsG3kheP754pUe89K1xu2lZAgAmDxfgGtdBgKpDll1JoE
         XpKGKQgSMKaTLhNukIy7OBFGMSWzly9Ulc3o0ajxY3Bq49+6BQ0/gGrZCQQ/sHYelTvM
         aIzAe7uJbqwaDnOWy2Dv1b9zC6pOlnbixi5z1K4l6Lo2Qma0sNL3f05nd03WVx6ajchr
         39n8ppnVROaBcOj+HW67e+YNO8j9Q51/QuO2UT8b16vJTJm17OFrjlOEu/nNuPq0hTtF
         +uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073479; x=1750678279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAe+MWgJTvsR6VoPJ+x38dlb6fw2IK0oklKJhP7LoCo=;
        b=VBj5wtdSrxXWg4jn1vvUL1FaDOKl0qCx6QUHLBDnNG5sM35FaUGdCc0+EtELXTeZJC
         caI6wqCfuFbs3JpJnq5xQG7vnaQ3mC/Hb/N8N6uiOE+HF5/siPC50WJ2wAbiS19nyx1j
         wly0mGFEsz//REi4zYhXCPv1V3q9lnblCKpDTqb9t8yiMmKefx5sE8AAORR0E4iV5A6f
         hCc2kLqjUdo2vKmYJfFyZh6s8uIed0uNQphgQHVcC8a43roamVKeS9zWuKSvDR4jOKpo
         d7+lt54pkCbSDrcG/80PfQY+R0EecEL2ZuYBkF2rIy/GKfa1jReswXqqmJrw3SSFsc+C
         hGAA==
X-Forwarded-Encrypted: i=1; AJvYcCWZige2aoHmhyMuOhkeA1G0uyX9JHQ4IUbkXXE0NF6a85D5U06UqliDsPyd+NUK9Z8+ie9NlVJISxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/cSVbSJ496u//UOEclAVpioy0HfMXhR7C03I/XRvE456+2XJU
	CUNfkmDCljLZ0NLTIj7e62nZqolVXOOjufPiRLJ2fQtEhyy/e+abFcPtC95EceZvOw==
X-Gm-Gg: ASbGncse1SrR1Mxx1tfUO8YNzdhcATSm5d6MEpkp9CO9J/b1Y439ZyjyZpTXvtUPEmm
	8lP8xUdF6pWFNwAJHq8XW3Mzckuc9l4arppZnS6ub9K0NQFDQMRq8+T8t2aMGyXSn+kJ81zWFiu
	1SYHF84PSAQxA7SoXDRaG1+e9JIYfRGeyOPnYrLFRLH6llh2vc7+d48399NvOprSLhSVaBTVwgq
	UHmofp1mTzhV9JBJnspWPoG2jh52FAoRAiHCXKG34dO5HrlWy+7zUXHTVknFutqY759ac5b5YMG
	lluaAY/lON9Jg6t56o3nNOIrA0uVvHJ2Wb7tuwBuYgqbHVyAd4WK3G4I/5LXVfvfeMurmXilMTf
	/VEYwUrmQmxNGm/o5nc1JYcM1iJGwqbxGdvEbk73j/zaHEAU=
X-Google-Smtp-Source: AGHT+IH+BLZwEcBLybJQKT5SFJQLs01w7H3/XLYig6z8CCdLC5U/AfTI5N+RnPzHCMzC5ebw9N/U0A==
X-Received: by 2002:a05:6402:350e:b0:607:1c07:727d with SMTP id 4fb4d7f45d1cf-608d09b8ec8mr7225402a12.23.1750073478680;
        Mon, 16 Jun 2025 04:31:18 -0700 (PDT)
Message-ID: <bf161fea-5b89-40a5-b3da-b5096ea3e09b@suse.com>
Date: Mon, 16 Jun 2025 13:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <3ecf10e5-5df7-4348-85a1-b8eecb940bf8@suse.com>
 <2e0627fa-35b8-4d3d-a3bc-338f9f7ed61b@amd.com>
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
In-Reply-To: <2e0627fa-35b8-4d3d-a3bc-338f9f7ed61b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 12:37, Stewart Hildebrand wrote:
> On 6/16/25 02:42, Jan Beulich wrote:
>> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -8,6 +8,8 @@ config ARM_64
>>>  	depends on !ARM_32
>>>  	select 64BIT
>>>  	select HAS_FAST_MULTIPLY
>>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
>>
>> Seeing this, I like this as little as I liked ...
>>
>>> @@ -258,6 +260,12 @@ config PARTIAL_EMULATION
>>>  
>>>  source "arch/arm/firmware/Kconfig"
>>>  
>>> +config PCI_PASSTHROUGH
>>> +	bool "PCI passthrough" if EXPERT
>>> +	depends on ARM_64
>>
>> ... the form with the select-s put here. I'll (obviously) leave it to the
>> Arm maintainers to judge, but my recommendation would be to simply drop
>> this patch. As per the description it's merely "make it easier ...",
>> which imo doesn't warrant such an abuse of HAS_*.
> 
> "easier" was a poor choice of word. "possible" is more accurate. This
> patch addresses a real issue: currently the PCI and vPCI bits can't be
> built for Arm, allowing build issues to go unnoticed. E.g. see
> 4ce671963eb1 ("xen/arm: fix build with HAS_PCI").

Which gets us back to the question of whether to use "depends on
HAS_PASSTHROUGH" (I think yes then) and where to put the remaining select
(might then better move back to the new option).

Jan

