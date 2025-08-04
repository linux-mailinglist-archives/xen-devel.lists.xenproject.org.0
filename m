Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98DB19DC7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068955.1432808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqiD-0007W0-Ks; Mon, 04 Aug 2025 08:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068955.1432808; Mon, 04 Aug 2025 08:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqiD-0007TG-Gu; Mon, 04 Aug 2025 08:38:29 +0000
Received: by outflank-mailman (input) for mailman id 1068955;
 Mon, 04 Aug 2025 08:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqiB-0007T9-IH
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:38:27 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614e91b2-710e-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 10:38:22 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so855485866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:38:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078cbasm704522866b.5.2025.08.04.01.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:38:21 -0700 (PDT)
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
X-Inumbo-ID: 614e91b2-710e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754296702; x=1754901502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HXG7tHiAB743HpxKHieGihPuc05fpEEq3E3TZqq8f2c=;
        b=Pq8ph3SO5FcPEx1jqxywjKVJOEbwgFDx5ImpeEpqzWYV8+f60eEDVI7xw6UINrHMho
         Qhoo60v6TDiVhQaz9NzC8FRRG24D4xB13ZAhhzbB22EcdVdXtNM/4up+N8fYN+hxzfa4
         roLpG3iE+APwgxMBlXaiVUkOaU6RkMnlqulV+gT4JcuwElWButa7Ry3/ATOAEiYhTXiS
         8tZguMkRn3BmPZt/yyMFRgV94vwXr0Q/AD+pUYfjcKWnDJwtGDW2wjMM3GPWTMAlrm9I
         4mtKnxup59doQyWQcEDht6k4ja3b/MbOPZTCB1QWKBjaQwXta+jr+HbdGZ0/k+tqKDHX
         bOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296702; x=1754901502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXG7tHiAB743HpxKHieGihPuc05fpEEq3E3TZqq8f2c=;
        b=UWoabz+60NLnIEjSZSbR0o49xlDHT4nblblOXCp7qmRlCsQJ5rcueLxxnP7kGYh6Uv
         SG1p1ehh+qGJzOBZqRBruJV7NAWar45acwOsJTbEs5sKTHcpmySQWO04JdCy42F6a4gJ
         3/Tk2lmGF0i97zNIHG+h/S4NC/St9jsXjbPs7Y5/nyDBZHrNqSbnl3drDZxG5e1pWjYX
         SS5HrA+aLuEnmYWLrHXtL/O/bGw/0GdVVHfMnGSoGU4wXCikbb8MSz6MTc25Cp76XUnr
         PesEGPVB/MRwJrZUlAaFn+gN6xHpdUpb/Jf9b+1sU3f4rhKD6Nfj289tePVdn6dKBWLQ
         egkg==
X-Forwarded-Encrypted: i=1; AJvYcCXgXlv87UJqRadlFx4clUfdN/uSMHMmX0HaMtyLQVWWW2KYWajQjDR2SM4f2J+Lxd3aIv05WAG0CfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/ZLuTuxnRLlu0/f2zqu6nOZF9pQ4Kfxc+ZPOaeIZSRBgjrFxm
	fK2EATPYiIo5BEXCO1kY+OQO5VudedSfkeomDJl8VcMqL9bUuFNby3RZaZ3P+R4MZA==
X-Gm-Gg: ASbGncvtYNbCrv6+QY0Nfrn9CRGe8qOE9DGYDCbeDrHtMPpdLCiV3I84qMQqPfwjFNv
	BBTtTpOlIIStpoYpIyU4v8EEvdy29nomdOBOFoq5pAvzMm78jt6cznwwdGFgGxiw/6uftRw/byd
	Xi0TPiNS31TiGSsYvJFcHNA/H5XXdhY4U27zFhbO2uMO4ae8q6hN6oJcikPwMO71K66B8pR6fUq
	Iy9UFmo8c+iHWNBETSm7gJdkOV9Xv1X3EBeFauyOqq8pdSBy+h27MR9J+PMiW75zNSxq76f7Wgo
	qxBB0Pxw4yCAKn6yXWoZmRsZelZdQ4dgiUdsXqL+QnMnlUhJBwM8WBbEbqBiezqCsBxyVcsLgk5
	jJ/SbJQDsZz9Tk4jB3WKbVZiUtEf+QUZpj2+sa+3UZaGOuU/X65vgkPS970uyqgE0xspwkSyIbg
	qkaDjy8ArDTVDoz52X+w==
X-Google-Smtp-Source: AGHT+IG5f3z2UY3eOHZULglTXhH4jpASMXUYbuUl4z+isOVUiPZ0WpRXfCo0YMLyZRWKK9HBbIK5bw==
X-Received: by 2002:a17:907:948c:b0:ade:9b52:4cc0 with SMTP id a640c23a62f3a-af94007889dmr857625266b.26.1754296701957;
        Mon, 04 Aug 2025 01:38:21 -0700 (PDT)
Message-ID: <f4b914ca-690f-45c8-b7f2-05dac1249074@suse.com>
Date: Mon, 4 Aug 2025 10:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-6-Penny.Zheng@amd.com>
 <770f41e5-5d02-4358-8f91-e577f762cf58@suse.com>
 <DM4PR12MB845118D11DCA4E169D294553E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845118D11DCA4E169D294553E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 10:29, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, August 4, 2025 3:41 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
>>
>> On 03.08.2025 11:47, Penny Zheng wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -627,6 +627,10 @@ config SYSCTL
>>>       This option shall only be disabled on some dom0less systems, or
>>>       PV shim on x86, to reduce Xen footprint.
>>>
>>> +config DOMCTL
>>> +   bool "Enable domctl hypercall"
>>> +   def_bool y
>>> +
>>
>> Just to re-iterate - we don't think we want things to be this fine-grained.
>> (As an aside, nit: "bool" and "def_bool" are partly redundant with one
>> another.)
>>
> 
> Are we suggesting to use one Kconfig, maybe like CONFIG_XENCTL(not a good choice, just popping in my head...), to wrap all scenarios, including sysctl-op, domctl-op, jiqian's platform-op, etc ?

Yes, that's the thought that was circulated, and that I had hoped Stefano
would have conveyed.

> In which case, maybe we still submit commits(or features) serie by serie, more easy to review,  but only when all is completed, we make this Kconfig as an selectable option ?

Likely the best route, but that may then mean stepping back a little on
SYSCTL, before trying to deal with SYSCTL and maybe PLATFORM_OP (albeit I
raised further reservations there).

Jan

