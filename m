Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E81963DC6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 09:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785531.1195000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZzJ-0005dx-PU; Thu, 29 Aug 2024 07:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785531.1195000; Thu, 29 Aug 2024 07:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZzJ-0005cS-Mi; Thu, 29 Aug 2024 07:54:37 +0000
Received: by outflank-mailman (input) for mailman id 785531;
 Thu, 29 Aug 2024 07:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjZzI-0005cM-E4
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 07:54:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eee2bb53-65db-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 09:54:35 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so248092566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 00:54:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989021983sm43236566b.84.2024.08.29.00.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 00:54:34 -0700 (PDT)
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
X-Inumbo-ID: eee2bb53-65db-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724918075; x=1725522875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gKGplyn+VBD9o0AN7kFlSJBHVrIldR04oPCMcvO8e4k=;
        b=Gwc8lb2p4eT60dEi9Kni2UnzPFtS2tG+Upt3a/FsZiT655bPiS0YeQVm035i6yd2T+
         MRk3ZTNYwkcYaX7baUjapfCYYd37+XTeGvg2povn7gbXk9h+kvwUzxqmFsnFzvTI4Ire
         4ooltXTFz/76P++J5yJerMXDPYej/0uYLK0rtz4fGgkbxuwBzeJlCRvuyTYHamzzVUj1
         afXQUSaNK3oAO9Xm5t2NCuTmAv/XfHhZ6ALMqseO4GgOspwMsRWijQNVp4KjfRumUfaQ
         B8NDpI5n+4W97MXVCiJwM7mpdiIXamCWspgO1botlRl04dG8FrEOYPTv7MgLebUibNGC
         0N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918075; x=1725522875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKGplyn+VBD9o0AN7kFlSJBHVrIldR04oPCMcvO8e4k=;
        b=jpot25FBVjyVGDsT/bN6rmXdwuehrvzLo6rbTCvbcj7jTJlLGFoIfQmIkUeFsFKVkY
         qcHdiHYjYhw/GCGZTjITYi2sro7IplWbs1Uymp4HoAvAhToq0/WZPDR0mm+ZYmBBOJJ3
         /2Y/T31mAEoBpDfz5sP+RVRoWGjiIC6ryrX4tRkxAjy8EcjtoXyo1VVLDH9qbB4oz3fP
         B9JsV2imLH3zBNDGTjuKtnjaoHyWC0owMccBUO6SoBYiQFNK6S7XACekB9dMBpIBP99l
         1KAnditqWI8qaUA83HpFup3l0ss10M4SVbkJ6rf5+LFkG44f1dEKmkHBMXXaDcbcSdIx
         qrSg==
X-Forwarded-Encrypted: i=1; AJvYcCU+D49GyZo43p5KU0T7YA5ePAPKcp6JQSb2UMIsdpEHcdu/rledAbx/YPoZMylOC+clLD4AXF/s9t0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrb5xOX2E3WLL9OXtp9EYfc0WVc/Dv91ogNSZuQeSYJxEkGkOl
	UTYgNReEnL/0YK4d/htg2rraKv5QdJ3dY3szhAIJqFa/ZaAkIFfgmMG8AY3Jqg==
X-Google-Smtp-Source: AGHT+IE3q4esLwnEuhjY+OE16gMSPBa84KGNtQoQGuWiUwUOu5xorkG8E2DZPyEeDx/jXHZxSgj9NA==
X-Received: by 2002:a17:907:9726:b0:a7a:ac5f:bbef with SMTP id a640c23a62f3a-a8982833612mr177672766b.31.1724918074662;
        Thu, 29 Aug 2024 00:54:34 -0700 (PDT)
Message-ID: <ec35f90e-d999-49a5-b3c3-79aa32689687@suse.com>
Date: Thu, 29 Aug 2024 09:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make VMAP support in MMU system only
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
 <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
 <cd2e6b08-ce76-4707-831a-c21b05ca85cf@xen.org>
 <6d065949-dfae-41f8-b030-c7d09516846b@amd.com>
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
In-Reply-To: <6d065949-dfae-41f8-b030-c7d09516846b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.08.2024 12:52, Ayan Kumar Halder wrote:
>   I will update the commit message as below. Let me know if this makes 
> sense.

Certainly better. One more question though:

> ```
> xen: make VMAP support in MMU system only
> 
> Introduce CONFIG_HAS_VMAP which is selected by the architectures that
> use MMU. vm_init() does not do anything if CONFIG_HAS_VMAP is not
> enabled.
> 
> HAS_VMAP is widely used in ALTERNATIVE feature to remap a range of
> memory with new memory attributes. Since this is highly dependent on
> virtual address translation, we choose to fold HAS_VMAP in MMU. And
> ALTERNATIVE depends on HAS_VMAP.

What is "fold HAS_VMAP in MMU"? I see no folding anywhere. My only guess
is that this means to describe the "select HAS_VMAP" being added to MMU.
But then why the word "fold"?

Jan

> At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use the
> vmap() to update the exceptions vectors. While it might be possible to
> rework the code, it is believed that speculative attackes would be
> difficult to exploit on non-MMU because the software is tightly
> controlled. So for now make HARDEN_BRANCH_PREDICTOR to depend on the
> MMU.
> 
> Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
> from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
> HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
> them use MMU and has VMAP_VIRT_START defined.
> 
> ```
> 
> - Ayan
> 
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>> Cheers,
>>


