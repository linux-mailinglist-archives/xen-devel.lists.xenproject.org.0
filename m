Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F68674D9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685502.1066301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rea4Q-0005s0-LV; Mon, 26 Feb 2024 12:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685502.1066301; Mon, 26 Feb 2024 12:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rea4Q-0005pk-Il; Mon, 26 Feb 2024 12:26:58 +0000
Received: by outflank-mailman (input) for mailman id 685502;
 Mon, 26 Feb 2024 12:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rea4P-0005pe-61
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:26:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 541d8175-d4a2-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 13:26:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a43037e40dcso204453666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:26:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wb14-20020a170907d50e00b00a42fb41e108sm2144600ejc.90.2024.02.26.04.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:26:55 -0800 (PST)
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
X-Inumbo-ID: 541d8175-d4a2-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708950415; x=1709555215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQaBybbjaIw+7Joa9mTe4+Zcunf/JJ188M54HzP/7h4=;
        b=XJQV6+yAW0VzwuCY/CU6cY0RuCP29kpkhsRHa1zQm4AuKsDCxQZ08/8TRY0URz+ALg
         QmMps8TcvgK8FQPIRTCX4w9RkjgZu4TfsebIyAPhUf0HlW+2irgIZ7qS4Sc/gxoyVBa4
         0B1oatxguysVxFr6eW335FHGaaICT1wIrSgttYNzG82xUrHqU03pAYfyUb+SCSyNIS6g
         5R9rIbKRRy604/cf4U5fEsIIJJ1ElGlN2e03f1OQXtJP5AoksKmz3CIPdCHUilOC/5Fc
         hJivL9FpiZMMu3hqVkA+51vzCRSbwCabtIHxYmND7+bsjZlh/emaFcyvno3cfx6nv01k
         silA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950415; x=1709555215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQaBybbjaIw+7Joa9mTe4+Zcunf/JJ188M54HzP/7h4=;
        b=epefWsavajtQnT2x7RW1Y42Ev7AbG3jhtNcZDtOFd63Tckxq5RWf3S3MtVEY/miXOL
         A0sLekR+tkoSlkeoYi246jOldKfCx/gffW/MNDLJf9gydQXqzRo6+Sq/sQ60m5HHQLR4
         ocVlxlelr+HSBPEwrMK0oBt1pCqpcnT/wL4SnWL8aMeF0Dl2AVqq+gznkUUqtF7jXvgy
         XNnHg01JDAc5x2cuwYrtwtwystIYl48NTD5/IBXui0WAtB37V6vUTj+bn4RWWKB3wajp
         gS3JlPDigGnpe7SahsSed7EnTdnrXDOloRFEu8o9Li52BY+gbOOXnC3mnAT2Ci56Dei2
         NTbg==
X-Forwarded-Encrypted: i=1; AJvYcCV8jyNHTZkYZpIbBP6Mez3knoWwVF20VvbLw7tIc8TSX6LIPpfs80a0A8Md6CGLXypOc7h+uF108rYb24I/RVGsqgZFnyJX1JSgRVIHRM4=
X-Gm-Message-State: AOJu0Yz4+3iRwBKwwT6xZdMopc6IDZnnHDr64F2DMG3945cGjXo4CjGH
	PYIjpqkIPiMplX2drfC7CBfBL7kqurRDRMEDdAbErXOho3wFOGjW1+v+b+FeOQ==
X-Google-Smtp-Source: AGHT+IGpV3gcyTZgScw9lLFlZ4rIr2cQ165uGMYP8sZSDe5CJ53ShYYqRMcuSq3SGqfpGWLBNuUyGA==
X-Received: by 2002:a17:906:4717:b0:a3f:2247:bb59 with SMTP id y23-20020a170906471700b00a3f2247bb59mr4541799ejq.61.1708950415268;
        Mon, 26 Feb 2024 04:26:55 -0800 (PST)
Message-ID: <9bebbe9e-5b02-4f6b-bb9e-9c520099fa84@suse.com>
Date: Mon, 26 Feb 2024 13:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-2-roger.pau@citrix.com>
 <ab71e3e7-c032-454a-b9eb-4a8e9e064b8c@suse.com> <Zdx3FjaKKfF6R_U9@macbook>
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
In-Reply-To: <Zdx3FjaKKfF6R_U9@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:33, Roger Pau Monné wrote:
> On Tue, Feb 13, 2024 at 04:51:13PM +0100, Jan Beulich wrote:
>> On 07.02.2024 15:55, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -29,6 +29,7 @@ config X86
>>>  	select HAS_UBSAN
>>>  	select HAS_VPCI if HVM
>>>  	select NEEDS_LIBELF
>>> +	select FUNCTION_ALIGNMENT_16B
>>
>> With the insertion here as well as for Arm and PPC obeying alphabetic
>> sorting:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Would you like me to resend with that adjusted?

I guess it can be taken care of while committing; I've taken note of
this. Sadly there is still at least one missing ack.

Jan

