Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE4A84220
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945415.1343613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qV5-0002Nu-3s; Thu, 10 Apr 2025 11:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945415.1343613; Thu, 10 Apr 2025 11:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qV5-0002MS-0n; Thu, 10 Apr 2025 11:55:19 +0000
Received: by outflank-mailman (input) for mailman id 945415;
 Thu, 10 Apr 2025 11:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qV3-0002MM-PT
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:55:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa53e8a3-1602-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:55:15 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394a823036so7362735e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:55:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207aed49sm51558675e9.34.2025.04.10.04.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 04:55:14 -0700 (PDT)
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
X-Inumbo-ID: aa53e8a3-1602-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744286115; x=1744890915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u4Pw5/VoxHtO9ZqeibaOkih2SMILFHrenMLyg9OHUW0=;
        b=FdQ8ul8jH8rrWzu+0jMx8S0JUI4InJIeSBcwtUrYmzzy3ZH2C1czj4KCERtiLoSN/W
         oIIJrASIrZetizJ8sAdhBgChqGrAEHeJwSdrKe6GTRUflX56oBx5NgPRtWJcjzCA4gIt
         pgeRyQdGJ5lzPcsVQa0mBwiopLUQv69SZRbyqnneFW97YFWPXLHBXXLO2DxHS9UGkYPQ
         SFAt4/6SCQbIcLzWHe8O0lWfWWK5UAB/rOoVGkcafmrFUcuTlX11YMsjwlW/JqMzR7kf
         p+U0EhreqRExLUg5jwr582mUxmzP0rLsO5n+WgweD2JZvuNwKLc7BRWX1sn7uPbw8I19
         1AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286115; x=1744890915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Pw5/VoxHtO9ZqeibaOkih2SMILFHrenMLyg9OHUW0=;
        b=TctScs/K0dTCek0TFCSVCdnGHrDDVEpVd0PTCaGB8DijDEYhq1M0kIB/UvLsO7V7uj
         ZKlXxNkasp3dDvDQ4xn+gf8VeMO8dBa7xizmAJG/Tlk1LxqAui8J4I7KP8YTCMbd+oUy
         GP7gf7ssF/qVDckIZ4w+/rSObtda1htC9s6uj5Z6ywjFL/+AJbCWk079XLH9Qb3qaPog
         yut1/AMXMeOoPtFe8/BfoXM1c8NnxOktCbsYlynThA8Zm6T9H9X4QuUzZb7w2C8NwdEL
         BpBNyNkFFWWzqlB/nYltORYNsaz0PNWIt/uiamWhL8h7MLLS5UXzLKw1JhzdRJbsZViY
         cBbQ==
X-Gm-Message-State: AOJu0Yx6fzXyuH8qiPzJNuHkjmo6/Bp864F+1/hGJqvxROPRr1HAOmdz
	fONFFLtU8uZcmUB25i56p/Bh3tpQIDEdUdTHRc+noqWGTyu7rLfyz+yIjQ+5qQ==
X-Gm-Gg: ASbGncvCJ+NPwsOt9o1d97hNLGZkqz60JKjhQb/fq0Do87n9JNkZrtuLC4Gr9ERumUn
	ZNnV6ZV/k5ThXacNtomkQpS9PdC8i7ZSM9bB9plhZCP62MzNGPw6UZAa8vTi1ZuQ6+MWwB4WX0H
	e2s+ZAeM/znNsMpzaXCFKdQQevliFZBjdHbnJ2irInm8yoF/5iYvW5wYe0wlX6an3x27SBuMaI2
	f4Hiajsv02vHPbKcEH0qFtfv7wXNFhtghzRtJgxLyxDcDs1hPAL6gyGox6c0uByPOyTxZuzEK1i
	NXN5aiMpOEtbeOYzxUjM30T/3UOPkbMJPkHB9fwFI3Yerucu1MeT5bWdp3YkTq2mzbrsp5PEWPR
	S+Ou5rLDzxu60pHIA/Q7kupf3Hrh64Sm/f5SB
X-Google-Smtp-Source: AGHT+IE000VPhwJGMDfMHCp0eMImWnP5DYjSmOvSjGhgbalmhbC4NAwYrCLaDZlGsOQdGd0ECgzhQw==
X-Received: by 2002:a05:600c:5487:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43f2d9619e2mr25524495e9.30.1744286114771;
        Thu, 10 Apr 2025 04:55:14 -0700 (PDT)
Message-ID: <484a3c20-caa7-4187-8a8b-97d23b8bb6a5@suse.com>
Date: Thu, 10 Apr 2025 13:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
To: Denis Mukhin <dmkhn@proton.me>, Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <zz01k2KPjivL5-avbZJmfIKFKTodzbdL80XbXNBdrZP_7Kk9oips4Ox0aG-MYZUe74V8Rm5gHDbLjdUNlZLzmYD0MboIVY5XeUq_DmYXz6s=@proton.me>
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
In-Reply-To: <zz01k2KPjivL5-avbZJmfIKFKTodzbdL80XbXNBdrZP_7Kk9oips4Ox0aG-MYZUe74V8Rm5gHDbLjdUNlZLzmYD0MboIVY5XeUq_DmYXz6s=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 00:24, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com> wrote:
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>> bd->domid = (domid_t)val;
>>
>> printk(" domid: %d\n", bd->domid);
>>
>> }
>> + else if ( strncmp(prop_name, "mode", name_len) == 0 )
>> + {
>> + if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>>
>> + {
>> + printk(" failed processing mode for domain %s\n", name);
>> + return -EINVAL;
>> + }
>> +
>> + printk(" mode: ");
>> + if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>>
>> + {
>> + if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>
>> + printk("HVM\n");
>> + else
>> + printk("PVH\n");
>> + }
>> + else
>> + printk("PV\n");
>> + }
>> }
> 
> I would re-write so the positive condition is processed first, e.g.:
> 
>     if ( bd->mode & BUILD_MODE_PARAVIRT )
>         printk("PV\n");
>     else if ( bd->mode & BUILD_MODE_ENABLE_DM )
>         printk("HVM\n");
>     else
>         printk("PVH\n");
> 
> I think it will reduce indentation and make code block a bit easier to read.

I agree, except it's not so much the "positive condition" but "can be written
as if/else-if sequence".

Jan

