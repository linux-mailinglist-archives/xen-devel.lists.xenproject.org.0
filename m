Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91DAD74DC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 16:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013205.1391719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjOF-0006mr-8a; Thu, 12 Jun 2025 14:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013205.1391719; Thu, 12 Jun 2025 14:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjOF-0006kE-5L; Thu, 12 Jun 2025 14:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1013205;
 Thu, 12 Jun 2025 14:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPjOE-0006k8-IK
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 14:58:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be202eb1-479d-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 16:58:47 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so9392315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 07:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809eb68fsm1586007b3a.134.2025.06.12.07.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 07:58:46 -0700 (PDT)
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
X-Inumbo-ID: be202eb1-479d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749740327; x=1750345127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HE6XiRpYb7iMAsr7wnjlHDRlYHG+UfPUNERBvtqTOW4=;
        b=IcDggSQ5hiFKmI11jmkyshEydlldn8pKjVNtzmFMSLcIbOsTeWxrP04Bvni5W/yJ5M
         DTsBFo/YrvJec4OF8NAeg9jNN4GYOvsImMlgmEfZJZzV3k9H2bN1b5mwe4VyLAcQbT1z
         lemBjnSRcdXPf4cfKRizlCToXGcgGJZsI0muKvS6gUaQhJKhu8iU76+i0lamt3ZxLNvR
         mRPFNDN5BGbc1iTmgL2CLk5xYiele/rgwABt59yFoKe8cR+FsAkPDI0ungySJVVyDD99
         ps+ARelHSYFwOOHOSJ51lTwHrwOaBTsgT2mwdQ7PHcl0SfWepdFDkfWXp6pRdK9hOB7A
         jZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740327; x=1750345127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE6XiRpYb7iMAsr7wnjlHDRlYHG+UfPUNERBvtqTOW4=;
        b=KoQye+BGcDDcCvbrkwv4VIE2tYo0Qwf7VxwXlC26vIfoVJi9BLYZgVMjCcAgJDrf+b
         J0NDTz4cc7C3vynFmtlw4MY+X7hElsvWDyh/pACaj+5YYD6xMnkS/gSFf0S9hSk2xgT8
         EZ+v5OC2KG+iz9hUjVQBGPGborqyfycqj6qGA01N9NCAk0ee5xIL8/drjw6NaOcTjtwk
         8EkFvjkMEQ4DTFvLs+6oTeUoR8NnUUDDJv8b0j3SRNa3h6BUcvSv7uLU4jm6Zighfxjn
         EWBS0ComsoS4ZomOoaan4MpIMYjVINRKu0eZ/pqOilysmAxqHb3rL6stLMkj+3KEjW2r
         C4oA==
X-Forwarded-Encrypted: i=1; AJvYcCXV8x07e4W65zQPChpIZiTqYIloxZgx7q1uKBKgn6QKmtUa/nA8FMqkgiUWpeewpl/sFIQnnT223fY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/FgS/3QA/nWqVIgwkE/RTU0IeoSUcCFaqFstG4O4Buz5zqJqE
	PYntLtE95CZQjirKeDaIX+UVIZOywrQ+jwzc1BgfUwCE1iELtK6NK5rrawPPHg+wkw==
X-Gm-Gg: ASbGncsoSCkQ9tic+7SVebYc94Q79700I3O+xdaLQ3RhRktj655UkXRf6N4QhGu39ds
	dYnLuYxaCT+NpI0zvZ15id6fkWNS9pVIIBkV/Bwz3JRnxfTnqlwZX2V7yfcq+llNYnBMbfzox2E
	JB7Pl6rKezsXpTlOMAAVqW7/6OyFhM3SdOeez7Fnf5iZZ+sKBcTf7hXIEUuJSuiYsgjjbfhnDc3
	CjfYj0iOYnmcQrxXrSt3ghkv99n+PDMzXMfOFdWFM2I7iwP+R+w7lSlhFirGRSOXI4+XnMmA65z
	9uSp6e7orc8Y8rKfVRZEOd0iU3gzmSwjcISkc9gxz4T9DRLO3mamv9UsZr6tQn/c/Z//9BMi6S8
	Wvoi1tjYlFqEx2WKQc8TG0XccPCRLhqLf9cRgWCaktZSASuO0YCmyn/DXMw==
X-Google-Smtp-Source: AGHT+IHOuqA1bqHsLIjsdjHpS64jMKxaYhdEsWyH+Ihe2fB+OvkUJJ1hYx0z/Rz1L+RiuRyAu6LxSA==
X-Received: by 2002:a05:6000:65a:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a5679f75d8mr182324f8f.46.1749740326962;
        Thu, 12 Jun 2025 07:58:46 -0700 (PDT)
Message-ID: <fb7ce573-f827-49d8-9cb4-31439db46564@suse.com>
Date: Thu, 12 Jun 2025 16:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250610174635.203439-1-stewart.hildebrand@amd.com>
 <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
 <3a203b96-94e3-47c3-92b6-b68141ea3794@amd.com>
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
In-Reply-To: <3a203b96-94e3-47c3-92b6-b68141ea3794@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 15:39, Stewart Hildebrand wrote:
> On 6/11/25 01:23, Jan Beulich wrote:
>> On 10.06.2025 19:46, Stewart Hildebrand wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -258,6 +258,16 @@ config PARTIAL_EMULATION
>>>  
>>>  source "arch/arm/firmware/Kconfig"
>>>  
>>> +config PCI_PASSTHROUGH
>>> +	bool "PCI passthrough" if EXPERT
>>> +	depends on ARM_64
>>> +	select HAS_PCI
>>> +	select HAS_VPCI
>>> +	select HAS_VPCI_GUEST_SUPPORT
>>
>> What about HAS_PASSTHROUGH? Seeing that being selected by MMU, what about
>> that connection here?
> 
> Hm, yes. I'm not sure if depends or select would be better?
> 
> 	depends on ARM_64 && HAS_PASSTHROUGH
> 
> or
> 
> 	select HAS_PASSTHROUGH

Actually, thinking of it: HAS_* shouldn't be selected based on user choices,
imo. Perhaps unless the HAS_* is a sub-feature of the dependent (as in e.g.
"select HAS_VPCI if HVM" as we have it for x86). In which case all the
select-s here might be wrong to use.

Jan

Jan

