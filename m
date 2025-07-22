Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C5B0DA3E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052621.1421364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCZG-0001KJ-Jc; Tue, 22 Jul 2025 12:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052621.1421364; Tue, 22 Jul 2025 12:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCZG-0001J5-G2; Tue, 22 Jul 2025 12:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1052621;
 Tue, 22 Jul 2025 12:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueCZF-0001Iz-Gr
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:58:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df0df6c-66fb-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:57:58 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so3192821f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:57:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2fa7sm75755255ad.162.2025.07.22.05.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:57:57 -0700 (PDT)
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
X-Inumbo-ID: 7df0df6c-66fb-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753189078; x=1753793878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=avrdjd0XWQGzP5k5W7muRrXHeV1TxTbEk9iawdfD4YA=;
        b=EK3IWF9DFhqi+cgnLE6FOeCXIC5gM+jmzlM2iIMaqqV8TmOtk2Te0M8sBd8JNEeaF2
         WUCaCTfNWDR2ZEYpxw7lrbDwXtaEu8nGvwHYiH6HoPfYblIvd0Py441/lAMmrV8byKE7
         I5d1QQ2Dlq2XKKITQ+VfaWRiBmSG2dpKPIjiNsuztbcfTGbTl9vINRYVA0PRvsKow3ig
         Uq7C8B84BbbLo+4L9SCvzYH/O5YGoIbnQRFJAmbXGlmuFzHOUULso6vJALAhbGQeBv56
         d2YvM8uIpMyeMR5w8EM/rS/ZtTUQfS5tOVOwFKovw9dC7RfbUvbAVhscxeKKKZc2CuRA
         N9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753189078; x=1753793878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avrdjd0XWQGzP5k5W7muRrXHeV1TxTbEk9iawdfD4YA=;
        b=waYDcntSTJ4AG4WAC7Xi+Kj403gfp7OgFQPSiHS+iDx4aXuHvxhL1LpknN0VAJULl9
         m+nl0IUC0/S6K37AKqeWS6UCdJIo9VBD2NvriMcye9+YPj9mSQQEDL7d/Ynb0QwPdg8r
         ARlydrQz7G2y4uB7dp2Rbek3wkihTtvWW6PduzWqpbgyGyVYkjZLfO3+Xqf9EYiHLF47
         NA/uuc+Nsz6JsuWeT6my86n7rJFRqPYMh7KqiloVkuZ/Pc69uvhJgFt+kprxo+EMczMp
         dlSRrOrPLf0pL69JDPCyeilyZJWtZMAOSU27XoaJHXAcmfOOPecNjFPZXYUZRe08aJjC
         kNPw==
X-Forwarded-Encrypted: i=1; AJvYcCV9KO03asrYn/yNWa4wEYA3NLoEJrOmXgJKhg5Pn0jdsIpsrmndvBFF6y37MaPebI1ls915Zyery2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZksMljAfzD9ooYNri1pQVReJ/4lqZg6hMtkOsuQucTRCVMMHX
	esOEzqSk+ZLOiXSI8NDtJUCt/lPoBZ+AUmZKVQd1f3lt7jVyM8AfNKNxvRjxOw7gA2jlG5CYtlE
	WUh4=
X-Gm-Gg: ASbGncuaPJjIZITVg5ltNrWwV9nEK4sxLhwAvGrQ4uXf7GRUhkhdmba04z9TDVEmCsr
	inL757zKDdGxGNDq2l4sZiWTYi3NFIpcdVogLalLxzM8ELzeYoLAAiJnnnWi43zpgTZcG+eFTOX
	cx80IPU80Z2w2Kehlvbw/d6Km0hAvoH5dWJUTqMjRmqwUYtg78O+GdjtKkFjCliCDTUhEC5SDdM
	2GSOmV3oyD+QzyxVVB874oJX+20cl3NVTEG1D0bb3zcuUGaXLaWqz7r18diXstFYeKZmZ0uZYDn
	m2+JvmxIu3p8Les+piURUiPsM+CoPLqH5wlbCEgFYJh4vBU4Afhk5n26OtRStrymilUn4hepW4X
	gwl2dXty1mDjRSahNp72a+wNP+3jo8Br/N7s29dmW2g37eRHpDiuC4TAL2bksbmT7uoMgEnzzUl
	JPkPwKMnQdN5qFlCpohg==
X-Google-Smtp-Source: AGHT+IEYsr+CcAmhAxPq+36CF9zC/kMt78q3eMMy+A8r6qMAsB7+XBRXw2alKAg9fvOMR/pj6FTlIw==
X-Received: by 2002:a05:6000:2304:b0:3b3:9c75:bb0e with SMTP id ffacd0b85a97d-3b60dd64b7bmr21677545f8f.11.1753189077837;
        Tue, 22 Jul 2025 05:57:57 -0700 (PDT)
Message-ID: <f88a499a-86c2-4247-b788-a37115c17067@suse.com>
Date: Tue, 22 Jul 2025 14:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dom0less: Reinitialise all variables on each loop
 iteration
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
 <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
 <DBIL7TSOVEXY.2SBQ063EVQ7GK@amd.com>
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
In-Reply-To: <DBIL7TSOVEXY.2SBQ063EVQ7GK@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 14:37, Alejandro Vallejo wrote:
> On Tue Jul 22, 2025 at 2:18 PM CEST, Jan Beulich wrote:
>> On 22.07.2025 13:59, Alejandro Vallejo wrote:
>>> Reduce the scope of every variable so they are reinitialised. "iommu",
>>> for instance, isn't being cleared, so the wrong flags may make it to
>>> domains that should not have them.
>>
>> Yet "for instance" isn't quite right, is it? "iommu" is the only one where
>> the (re)init was misplaced. The other two ...
> 
> We do strive for minimal scope where possible. But you're right "for instance"
> might be misleading in suggesting there's more bugs than one.
> 
> I'm happy to have "for instance" removed, leaving the rest as-is, if that works
> for you.

Except that "every" isn't quite right either. Nor is "they".

Jan

>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -826,14 +826,14 @@ static int __init construct_domU(struct kernel_info *kinfo,
>>>  void __init create_domUs(void)
>>>  {
>>>      struct dt_device_node *node;
>>> -    const char *dom0less_iommu;
>>> -    bool iommu = false;
>>> -    const struct dt_device_node *cpupool_node,
>>> -                                *chosen = dt_find_node_by_path("/chosen");
>>> +    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
>>>  
>>>      BUG_ON(chosen == NULL);
>>>      dt_for_each_child_node(chosen, node)
>>>      {
>>> +        const char *dom0less_iommu;
>>> +        bool iommu = false;
>>> +        const struct dt_device_node *cpupool_node;
>>
>> ... had no initializer, and also don't gain any. So they must both be
>> set inside the loop. (Irrespective, the scope reduction is a good thing
>> imo.)
>>
>> Jan
> 
> Cheers,
> Alejandro


