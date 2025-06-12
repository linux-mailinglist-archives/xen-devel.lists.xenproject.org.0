Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C7AD6948
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012451.1390900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcWj-0005JP-6h; Thu, 12 Jun 2025 07:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012451.1390900; Thu, 12 Jun 2025 07:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcWj-0005GI-3e; Thu, 12 Jun 2025 07:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1012451;
 Thu, 12 Jun 2025 07:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPcWi-0005GC-EF
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:39:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ba1bad-4760-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:39:06 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so586845f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:39:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1bf63afsm784840a91.22.2025.06.12.00.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:34:00 -0700 (PDT)
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
X-Inumbo-ID: 51ba1bad-4760-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749713946; x=1750318746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk1EuVWguEFFQAsK4ZoZZZZmGwMo+W72seNJuPLyBOQ=;
        b=Kg0gpzoyVNjbcJRk8byPSMtF5/RyrMBqkehwqUpf7bbwzav8P6Ze1hKxNsp2AtvFxp
         wRTmEBFxDBEyMj4saEX/RcLO4aE3m0GT2HnI63wGjvHy/cUmUaYxTGTFleJGYgLw3KnT
         Zq8UuQ84ViSdl7V7KtXrg4I5tQkYiOHwqyIXAeDs+aA7uluOfoJcFrD2bVQHDoSMKbLu
         VLojdI4CIuNY5gA17YhK+/ESvNGeoutQgLpTr/yjV3f9OdTDKs1GhwZfNHIJEHtQpM3z
         AtJzshfbloVrv6EdEMZVRMSWOhrhUkiNdo5eRd8LgPU943Ajd7V90MhFCnWznDw5D2zs
         sHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713946; x=1750318746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk1EuVWguEFFQAsK4ZoZZZZmGwMo+W72seNJuPLyBOQ=;
        b=h9W1OCxz9EVfLXhjaAexpuIbgqJP6tpjavU2ZgL7gVWR8qMXyGDEu9jUvX0RqNfLGK
         31QLY0mvwkl2f4SY79gtYwTbdZyVYCpe77zttSl8wkHFVfVqanRUxWOg65Zu7XGKGApg
         ylR0Fw+j8jxWLgSd8whHcNmBt+/ICbI3wPPu/QE31mlASuefBgEHb7ybIBEVtvNYbIWc
         noK1StBNLXQ2HSy4bVGMRnmAE4WLgm2dZAHzmsJVFqqXII7jmwpHEbDDdFtydDl0IrFG
         zJb0IM2Xb5zrKyzDnOAZyq8AVmYWNrCwP+7ewKUEs8065MBdS8lxV77KVyabMek+OC6U
         4Fpw==
X-Forwarded-Encrypted: i=1; AJvYcCXYbd6IDClgQ+HLyBhOfdhx3uB7/QQdzt7colcAWsiDPs61iXyJ/L8RZn2KZ7QgAOMv/Qg+Js/3XF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8Q+skdQgfVSMK16gW764KEXmCzYd6Tdx1Yhf1EFFnEafGJ5Vs
	t6+gGZhmArviRMB3ioTysp+N2ZDB+481LjzpXzXaQIiYBJLi1b1qJXlzYJu78eZ1sgAm25fPqCy
	UZLg=
X-Gm-Gg: ASbGnct8oVK/OXdsHRgUT6eZS/qdCh5Bw6oJGCNw9eQ+m5KOcKkzFWDZCKzMs1DgdCJ
	eznHcqoFF4W2WHtCa8IlLv2HlZxsCQ3vptmLMwDV3bkI+fM0K1XGscMsmG+x6Q+9CJx/bj2FrK7
	UIKI8LdzBm26ntAMYFRydyuUi2Xst/7819QpuAsCRFb2sBHPttzxqzIcPpYp/wR/Zw5HvJ63w9L
	PxM4rAQ2xJd5rhd4PRf9uP3kzgVQWHRdSPXeFR7oksKcOkqJN+Y5YLyCMXgDzcLDiKBhsc8Diu5
	XLDzs5c8ZR8YMsiKgPO0AsKCl3CGIKZA5X/DYEyl50NEOyq6nLQMYYJCay1FfH4UPQlOW823Per
	C/7FUbd+3LnB/FA+VxDT18o+qmMgoGmfMQsHEuluqBokZNpI=
X-Google-Smtp-Source: AGHT+IFBaq0RwwbcIip8Izuk0nLO04nvkeMufnFU77a6smivEi3KEwmTGQazt8N/nLRhfvEkQ9zt9g==
X-Received: by 2002:a05:6000:2886:b0:3a5:1471:d89b with SMTP id ffacd0b85a97d-3a5614dcdd8mr1604868f8f.53.1749713641500;
        Thu, 12 Jun 2025 00:34:01 -0700 (PDT)
Message-ID: <eecfaf59-3b7a-4330-863f-bbdc66a355e7@suse.com>
Date: Thu, 12 Jun 2025 09:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] XSM changes for split hardware / control domain
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <0defc4e7-382b-4651-8255-652da17a2129@suse.com>
 <4b0b7554-e22f-4ef2-9236-bcc2079842d2@amd.com>
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
In-Reply-To: <4b0b7554-e22f-4ef2-9236-bcc2079842d2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 07:08, Jason Andryuk wrote:
> On 2025-06-11 09:28, Jan Beulich wrote:
>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>> Theses are the broad changes needed for a split hardware / control
>>> domain.
>>>
>>> An earlier posting gave device_model privileges to hardware domain.  For
>>> this posting, it was split out into a new capability.  This way the
>>> operator can choose where to run the device models without making the
>>> hardware domain have the permissions.
>>>
>>> The first patch add XSM_HW_PRIV for the hardware hypercalls.  Unlike the
>>> first posting, the control domain can call these hypercalls even though
>>> it doesn't really make sense.  The idea was to keep the control domain
>>> all powerful from an XSM perspective.
>>>
>>> SILO is changed to allow control, hardwware or xenstore to service
>>> domUs.  Xenstore and hardware will use grants for PV interfaces.
>>> Control wouldn't typically provide PV interfaces to domUs, but it is
>>> given the permision to do so.  Again, to keep control all powerful.
>>>
>>> xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo this is not strictly
>>> needed.  xenconsoled could read Xen's dmesg.  If it's in hwdom, then
>>> that permission would be required.  SYSCTL_physinfo is mainly to silence
>>> xl messages, which are mostly cosmetic.
>>>
>>> Jason Andryuk (4):
>>>    xen/xsm: Add XSM_HW_PRIV
>>>    xsm/silo: Support hwdom/control domains
>>>    xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
>>>    xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
>>
>> Overall I can't help the impression that this level of disaggregation simply
>> requires the use of Flask.
> 
> I have thought about that.  The problem with Flask is the complexity of 
> the security server.  We don't want to have to deal with all that code. 
> A fixed policy is easier for our coverage testing.
> 
> Exposing separate control, hardware and xenstore capabilities, it makes 
> sense for the default policy to function with them.

Yet as indicated in replies to individual patches - the boundaries between
the three aren't clear, which imo goes (to some degree at least) against the
purpose of "disaggregation".

Jan

>  This would be a 
> coarse level of functionality, and Flask would remain for fine-grain and 
> MAC enforcement.
> 
> Regards,
> Jason


