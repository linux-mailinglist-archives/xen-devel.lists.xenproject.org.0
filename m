Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D8A5C3E7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908217.1315358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0hT-0004Ue-Np; Tue, 11 Mar 2025 14:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908217.1315358; Tue, 11 Mar 2025 14:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0hT-0004Rl-Kf; Tue, 11 Mar 2025 14:35:19 +0000
Received: by outflank-mailman (input) for mailman id 908217;
 Tue, 11 Mar 2025 14:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts0hS-0004Rf-Fq
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:35:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d289d4f-fe86-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 15:35:17 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so24728495e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:35:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1031e3sm18046300f8f.82.2025.03.11.07.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 07:35:16 -0700 (PDT)
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
X-Inumbo-ID: 0d289d4f-fe86-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741703717; x=1742308517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EZb/PHy6+WkaWcYYnXl21lbfb4pVo3HGrkzj7elF85w=;
        b=cRUX+CXP+UFqiygnRaHvuYZFItFueew+qbXAWWMkI4b9MdizbPICWRNoi4tVcXN5gp
         qLxVjnw0UUqcrpAIAmMlwxAMGAIJoVPyQaFjR9jJvdZlW4nbuNM6v3yyCtyNbJUl/Tvb
         SGBC/RU+0IObJK24UsDyfFm4TOpVFvq59KhBRFyk8OazPjFrJQHX96YOq/6DiSJBagrt
         dFm8ywFZ6FrMmT+JpoyAvSVi+hUKE0l+frNXac4wqJBG5AWShTO++FHiFHEkhPh4qvBj
         P0Q7i1S0vo5wgdmv6bVuAmpz8c8RodBOI0omb5jFf6Qj6afhJxUZiZs/L8G4LKJSXO5/
         OZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703717; x=1742308517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZb/PHy6+WkaWcYYnXl21lbfb4pVo3HGrkzj7elF85w=;
        b=PMzSRcYkQ3dbpWzhc5KloA1SdFbBJuxOuuh7/Z4wvd/LQq9pQMBAqRHZQUlJJ9Zo4/
         GqTH/3WT++VkK0J/phcLxQlFC8cjqmX87/EVaVwN2EWhVIIGmTLg4gWf0xN+HKUFwOTr
         4H1gs9m8oxyqnuWCNX6jyJ7WmYZ5oWdCOBa85YwaoQo8bi+jTFvq/HbJQmx+iKMWoHAk
         Cl4fL0YlEtEX5Ol2URG5B+PLH5AzUe4zPOTLhRGzT4IsxkGVIpypavJVhUcZ49QvN1c5
         4I/tltGzeX4G3gqUD4hskDuAOp/HgwRUBVqBItG/JdK13TwdjIemBbJq6GsimsJnFwnL
         YoXg==
X-Forwarded-Encrypted: i=1; AJvYcCUfx762xFRvBsco6a2cHhSz0RN5MZVroa+BZq5v6WmnEuDyW99iNtr0HKpC8oAVuryQd9pyJQ7NeRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy89Sx05L38MtQQzhsCrbXHUYSSHUGK2KXdHEzImxnf+c6Ff/jM
	cfiH/nZWAw4ZiUrt9TkBRo/5ttQumAJGiiQlHqaINYhKJulbLoTrnjCLf7cOqQ==
X-Gm-Gg: ASbGncu/Wlri9RoHvm2Dhu+FjfLOEULNmas0yux0/lDP7TC+RVxm3puU/fk6VSj22Gj
	l2VycPP4SaWOgbyU0T37ess5VjaQ94hkVEmB4PvJF61yBetFlUKKzTbxdX++HQcT8kpjayQdiFW
	ynZJgYzv3No7LQL92nq9aBt3Zms1edIv63jtSkn0Easy2OIjHpLrOvgaCl3sU+Fe/Dgd6FhQvpe
	s3fI7ZCXIR/2IM3Sy0x4XE3FT9U/l+kGRmLQIaMMOM8QvvXk2tnMX3tvUxi5Z1n2kmKmFWBznQg
	V10AWMmtSCdt2ZD0izj58lDfoBpkFDXAQkou6D597OgASd7dwSavYb5Q3Ty4AyiHBIAnRNJIJCM
	5AvrAGDrkDFywtI4LzbQvvYVSPe31jw==
X-Google-Smtp-Source: AGHT+IEEQ8G71tKfiPchCvjLcK9+EDzzWpRvKUJZXaxQnfKv6tnmBOw3I1W4xpIEukSg63zZIsI5xw==
X-Received: by 2002:a05:600c:3ba3:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43cfcbc97d3mr93533745e9.7.1741703716688;
        Tue, 11 Mar 2025 07:35:16 -0700 (PDT)
Message-ID: <99771639-af21-4872-b81f-8442f3cb2652@suse.com>
Date: Tue, 11 Mar 2025 15:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
 <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
 <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
 <8b26199e-94f6-4a72-b1ca-efd65a6265c5@epam.com>
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
In-Reply-To: <8b26199e-94f6-4a72-b1ca-efd65a6265c5@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 14:41, Sergiy Kibrik wrote:
> 11.03.25 14:01, Jan Beulich:
>> On 11.03.2025 11:23, Sergiy Kibrik wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -92,7 +92,7 @@ config HAS_VMAP
>>>   config MEM_ACCESS_ALWAYS_ON
>>>   	bool
>>>   
>>> -config MEM_ACCESS
>>> +config VM_EVENT
>>>   	def_bool MEM_ACCESS_ALWAYS_ON
>>>   	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>>>   	depends on HVM
>>
>> I still don't see why we would then stick to MEM_ACCESS_ALWAYS_ON as a name
>> for the sibling option.
> 
> as HVM requires mem-access to be enabled

If that was indeed the case, ...

> I felt like it should be kept 
> as is -- to hint that it is mem-access that ties vm_event to hvm.

... I'd agree. It was my understanding though that MEM_ACCESS_ALWAYS_ON
only exists because when Arm support was added no-one wanted to take the
time to make mem-access properly optional on x86.

Jan

