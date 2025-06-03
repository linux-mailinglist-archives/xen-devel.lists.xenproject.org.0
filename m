Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9DACC0AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 09:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004028.1383677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLfG-00063I-Gg; Tue, 03 Jun 2025 07:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004028.1383677; Tue, 03 Jun 2025 07:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLfG-00060s-Dk; Tue, 03 Jun 2025 07:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1004028;
 Tue, 03 Jun 2025 07:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMLfF-00060l-Sz
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 07:02:25 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c0ad27-4048-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 09:02:24 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso3128411f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 00:02:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff723csm8724534b3a.164.2025.06.03.00.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 00:02:23 -0700 (PDT)
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
X-Inumbo-ID: b3c0ad27-4048-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748934144; x=1749538944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8QyAXpUdBS49Wdak3bz0E6RrV3wZJk9i9w8pmt4V8=;
        b=HbzgtvW05e6shimV24ce5uZZa4LJMe3mZdT1ObUFPN9EhZVBplJaryb9IReFTQ7QXq
         Pkl+4cmkKhbNnXayJHOAhkkvbIFHp0VK3gyAxQX5yefxOqKVWbob8jkPnkfuxc89UKSx
         Vu2KLviLaPonPMRInewVSSL7wbTWjvPkkRZl6bHiFsIRFHYRl9BU8JPZo42THnyOGvn1
         PQBLEstIp0o3PSnJL56kHX26yFv9l9bNd2PY6t1b/F1fqUVBT8QwY5DprTyHEje+sdc9
         Ik7q9p+91ogRvujljwbvVXmwUvF9nF9WsxYWxbbD66QjlbQ7b8JoPEKkcIBWlZfVDKVo
         Vm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934144; x=1749538944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME8QyAXpUdBS49Wdak3bz0E6RrV3wZJk9i9w8pmt4V8=;
        b=uzofI+7xydGJhCv4fIeT9z0JO2kHzKpEPk/NpEku1AOGqs5fw0zS9genDEYfOSzAl3
         17l5I0T2tvbalRBtD3WSsFNojSsJoh/bnhOEGS7jKVxDut+2/Y+5hNOb1D3CeAQ+zY7z
         2AtiQZjK94Q2Use+6oL2VFfHf4OVXR4EjBYkSHCTRogMJqhbeQzFNhrFMgQVm3uoijI9
         bzWI7DK+DKNJotvjIFJfR/pVHe9hk5YSK/zy4cxhB7imd2YaNvEQqxWOcf2f0gmeGMeX
         naPAsAsAD4BjhICqXLh5EY4wbKXJTyrZUw3OFNo3fQ/WUMWhtQU2avMKHK89/+V9v+zM
         kWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHD2iMhC9EK9XamEXJ/9GhSVB1C8VX5UIMYsiAzjihIQMertYhU3LW93iaYSTDdWGZen8fcoADY0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLQVcx3sJnc6jfCbFj1mmg3qc2MWWn86XHriuEVqkQSDjv6FZG
	TYSVX1eOv6ANIMbsnVxzeE1ne0yPJqGe1xSUdD6KSc+brzw/iRluEpipn09P6YqeAA==
X-Gm-Gg: ASbGncvfOgtFLy81/SUsa3Z9OhMXfc4kYZYb2d3xt5X2xIGSSApkRsfvyHQ3Ze7IIZ4
	H1ZKJ7fo6yH4BMAq2fF/jlQWX2knLJVptIT7mURzXEk113roFdQDGiLCJRUGbUFmtC9Zt8O83Ad
	I16m9aayr3sfMXmBPrf8GBsYlrRSWsku/ZRIwWZ528x6gSwyW9U2q0UOYjQvxINx+8DYvFbyV5z
	OXVsuT77Bre570ATui5uk+kWuRO7CWzEPTEHPnKBW3anX9gYtOmK756SZIw0XDMiGdsqSzGINZd
	wABPsVO3oGaC0wGdCTorQaIA+8nntW0tWIAQzzEOgfBD5vNld0RQzO4XWt3rc24+Z5k0sKcGneO
	mmVy/doYqekUp1myI9YBEhdDiS3zYvlOLYEOR
X-Google-Smtp-Source: AGHT+IGCKs5Cd4TR9HufkPatvl8H5FRyFaKs6ZlLSIgcBZyt5fRU3kEZ+MhiZMikFRNPAyHwyy2jCQ==
X-Received: by 2002:a05:6000:2902:b0:3a4:f6c4:355a with SMTP id ffacd0b85a97d-3a4fe3a80ccmr8910630f8f.57.1748934144133;
        Tue, 03 Jun 2025 00:02:24 -0700 (PDT)
Message-ID: <ba63d358-2fb6-4469-9653-e672e507f24b@suse.com>
Date: Tue, 3 Jun 2025 09:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to common
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527082117.120214-1-michal.orzel@amd.com>
 <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
 <28a9f398-d206-4e42-b627-bea71f038b4d@amd.com>
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
In-Reply-To: <28a9f398-d206-4e42-b627-bea71f038b4d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 08:54, Orzel, Michal wrote:
> 
> 
> On 02/06/2025 10:37, Jan Beulich wrote:
>> On 27.05.2025 10:21, Michal Orzel wrote:
>>> There's nothing Arm specific about this feature. Move it to common as
>>> part of a larger activity to commonalize device tree related features.
>>> For now, select it only for ARM until others (e.g. RISC-V) verify it
>>> works for them too.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> I realize this was already committed, but ...
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>>>  
>>>  	  If unsure, say N.
>>>  
>>> +config STATIC_EVTCHN
>>> +	bool "Static event channel support on a dom0less system"
>>> +	depends on DOM0LESS_BOOT && ARM
>>
>> ... I think we should strive to avoid such arch dependencies; they simply
>> don't scale very well. Instead (if needed) HAS_* should be introduced, which
>> each interested arch can select. In the case here, however, perhaps
>> DOM0LESS_BOOT alone would have been sufficient as a dependency?
> What if e.g. RISC-V wants to enable dom0less but not static evtchn/memory/shmem
> because there are some functions to be implemented and they don't want to do it
> now? Protecting with just DOM0LESS_BOOT would not be sufficient here.

Imo a transient(!) "depends on !RISCV" would in principle be fine, if ...

> I understand we could define HAS_*. I did not think about it.

... we don't want to go this route.

Jan

