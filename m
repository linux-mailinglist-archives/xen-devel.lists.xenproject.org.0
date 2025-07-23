Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B8B0F670
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054341.1423111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb1H-0004Q0-TR; Wed, 23 Jul 2025 15:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054341.1423111; Wed, 23 Jul 2025 15:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb1H-0004Nr-P3; Wed, 23 Jul 2025 15:04:35 +0000
Received: by outflank-mailman (input) for mailman id 1054341;
 Wed, 23 Jul 2025 15:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueb1G-0004Nl-4G
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:04:34 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56988c0a-67d6-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:04:32 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5561c20e2d5so8745540e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:04:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e519e17besm1854911a91.15.2025.07.23.08.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:04:30 -0700 (PDT)
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
X-Inumbo-ID: 56988c0a-67d6-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753283072; x=1753887872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8NMokbaBp0UVNkQY8i1OyGtRiOGryfOCXgyyJBAULIQ=;
        b=Fd7sBN4ILczbFKErd588q3BMhoHsNHIbbBPff+OyD4G2KBuyYyHlcb158Zv/600xU8
         VTAKoWoDbTQNMUfYAyRm3JMu8gVDyYT76MFbEBE0+kvFdUqHJgzm5Qcu68CJBpWeVOV/
         waEIQ4qYWQ/X03gvRoNjGMa5WLVTVWW2nbb6rNG24GFwlaIYTM8/zP5hNH+nzbMAJUnt
         F50THS7ZDC/xao7w+MNg7GQ6ez48ZAyB8c00A5qekoqivttrw9pBffW9ggvjOsjtholN
         pIFTVbk1vxmGJsuM5mOFWmmeGY6BGKqRnbskvKfw6M86Zvm8SBuzMIp4h49jZ7dl44rQ
         0C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283072; x=1753887872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NMokbaBp0UVNkQY8i1OyGtRiOGryfOCXgyyJBAULIQ=;
        b=kueMqOwdELo+gQ66yVW0imxvgxiDuLkQsd3nkB5WM5Zvc10A3v7ErClWAQvPGIhW+7
         Q+2tp+8xAHaXfWZqYnwOpYNcaivLxuTvOp5D2nRjN7lC3jGr+h9K72DY+G2by0gHjIxp
         j1s4taxcZTkGkfTpgOFOvqQpV/FruSMiDia149Tgwjnadhvmr/5m/TDkn8RJ1UYzrQWR
         O8Wxgazgn5oXHqNNNy5HfUmseALBdllq2YnXBLk2xN0lXwI9L3LAEjz0wIdWsLTQvwer
         0DnMZcCIWMKcAY4+4iGY8z0d1x4Wu5pNuRGHyzJqApBxOqtwfARNKcL+B7AfBk6LjUDa
         WGcg==
X-Forwarded-Encrypted: i=1; AJvYcCX9AHvwI+skCaUUJ4mxpEUSFlG4InFCmp0V7vrHVBZ4j6c1Sl1Z8VNoWQjKoiLNE/3isWZ0MSS1Mt4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/XEqNsj8/TR2Y+dgkh4/0WO2dlM4gvq/Hv68i3Fv+IWiz4glS
	hXpbgNKJDToHpYq419gJc2u303fx61fKWIWQqGUabnwKw/czRFXwqGBMCLKOHgcK3A==
X-Gm-Gg: ASbGnctlY2pvuzvoPZ/NIBZCSKoO4NNGExSrZttmkXIDZvUxNPDU57zsORvpLCg4+3E
	neJb06dZATOEkMPNo+MxV9e/wYirNigAcN9N+6sQs1Wqj9n7yZagDbYnqSmX87hnYDbzJmA6VDS
	70JeIPFNbJUtvl7SM4tpKxYRP9c0x7+ubFoXjfXB5F4b54whw2mssoETWOf2ap/0HoW4px1RKK4
	BlYi5SNYAFpUYPtWT0oxGL7PXd2qePGZpHFOkDsWCB2yDQfIhzx/0m6XvnOki2KYF6UFJn9vdL0
	e6CPr1uS4Aa50RsUDHAIboxn5IWiSKD2lVes+pz26YVBzfceH+dAgQuW+iPt5XMr0jUx68dMJ2/
	OwTwqdNHZAkJ4r+Jw+e3u3IA7Yu5TVBUAaQ8NgF4wzkj7O4oC7YdMFFWqfBfauNNbRFCfalxL3p
	sulXOY340=
X-Google-Smtp-Source: AGHT+IF7A2OrNYCXwoaByiQEe86BViFm8sWZEz5bpMLA1N2+lkDVLPWQcoGUQGIWRzRppX8+hkmL6g==
X-Received: by 2002:a05:6512:159b:b0:553:3314:adcf with SMTP id 2adb3069b0e04-55a51340ca8mr1073337e87.5.1753283070842;
        Wed, 23 Jul 2025 08:04:30 -0700 (PDT)
Message-ID: <9814144b-5eb4-421a-93f3-2a15232a7dd3@suse.com>
Date: Wed, 23 Jul 2025 17:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "amd-xen-safety@groups.io" <amd-xen-safety@groups.io>
References: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
 <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
 <f8d6e3b2-aca2-4a0e-8913-0f52f2016846@epam.com>
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
In-Reply-To: <f8d6e3b2-aca2-4a0e-8913-0f52f2016846@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:33, Oleksii Moisieiev wrote:
> Hi Jan,
> 
> On 23/07/2025 17:27, Jan Beulich wrote:
>> On 23.07.2025 16:05, Oleksii Moisieiev wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -19,6 +19,7 @@ config ARM
>>>   	select HAS_ALTERNATIVE if HAS_VMAP
>>>   	select HAS_DEVICE_TREE
>>>   	select HAS_DOM0LESS
>>> +	select HAS_DOM0
>> This wants to move one line up, for the set to remain sorted. But see below.
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -21,6 +21,14 @@ config DOM0LESS_BOOT
>>>   	  Xen boot without the need of a control domain (Dom0), which could be
>>>   	  present anyway.
>>>   
>>> +config DOM0_BOOT
>>> +	bool "Dom0 boot support" if EXPERT
>>> +	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>>> +	default y
>>> +	help
>>> +	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
>>> +	  manage domU guests using the Xen toolstack with provided configurations.
>> What about non-Arm? x86 has a Dom0 too, but doesn't select HAS_DOM0. It
>> actually requires a Dom0 for now, so to me HAS_DOM0 is a misnomer. Maybe
>> HAS_OPTIONAL_DOM0?
> Right now DOM0_BOOT is the only option for x86 so I've made the changes 
> only for arm.

But this aspect of x86 isn't reflected in the option properties above. Imo
at this point x86 should have this option set to Y unconditionally.

Jan

