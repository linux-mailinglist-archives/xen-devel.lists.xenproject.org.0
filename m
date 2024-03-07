Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC18874992
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 09:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689667.1074874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri94r-00068X-33; Thu, 07 Mar 2024 08:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689667.1074874; Thu, 07 Mar 2024 08:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri94r-00065z-04; Thu, 07 Mar 2024 08:26:09 +0000
Received: by outflank-mailman (input) for mailman id 689667;
 Thu, 07 Mar 2024 08:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ri94p-00065t-UZ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 08:26:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5771c96d-dc5c-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 09:26:05 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a456ab934eeso92771166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 00:26:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o7-20020a170906288700b00a42ed7421b8sm8088558ejd.93.2024.03.07.00.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 00:26:05 -0800 (PST)
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
X-Inumbo-ID: 5771c96d-dc5c-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709799965; x=1710404765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7l0GZitSpPL4w6PpS6/l7z/DlCc0WejNdMFZiCxAnc=;
        b=GzcoKCTPWYehOQY5wPyoJ+4H/6eWv1o8/Ve5lNp8mTtgYeSj3fxTIwrqKDT94WEu/U
         99Dd5wR+/ZSc/9XTvsDOLezYMab5ykZLyLi/k+z6aCejV819Zr57YPIZsovSAknkTESS
         GCEzrJKoY7FYk3enCXIodOgy96MqlqNB8xZOVPBFeSgTpNbc1FojGfuLJ2b0nd7yU/2I
         7M7UXkcUZCUyQacS5TTYZQsA9TpnWYNZ4MaZ3WI4PY7/Pmk0bA+y9JRUpyXEJCAD9lqu
         M1jsblmKYPzmY6125KWU5U74o+a/4rIef2ZK5Y3CSrH4aqRqSkTQHbgGl2ARRucnOojS
         2TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799965; x=1710404765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7l0GZitSpPL4w6PpS6/l7z/DlCc0WejNdMFZiCxAnc=;
        b=kZju/1qk3ze4OxaFFpFBRc6+gKKQrnH8bk8J6nFAJmUDl/4Yc68urlssOvLqU8bAFw
         t90TW8YVyp695jC0dlvgks5rRnDDsNtyoupNySUzQb6etdrHPlgI3+qRUXocuSaJNjAf
         PAmFXcfTKDNbFfbEz/WiL6gIoHcC+VfVjq33qIQyJQ1IModIudUvT8iNMHUhy4KVssFs
         BzHjH4K0rmu506Npjz7/TAB6IYjN0lr0X8iAjQ89gfI/cOsraYUzCdj8hQlMMzoBTdAA
         GRfHbiCjxa+T4Hdo6JWwun6HN0ZIdnTvr5yOsRZ9IEehlOUMcTtGBYGkJ3dSWPdPa86n
         WssQ==
X-Gm-Message-State: AOJu0YwF73iYshafsStXKoibZ5k7T04RFyDeljjBJB2QIB9uYahsB8fc
	byZmpiDWJAjatPxPhWKJCjLhvO9qbDg48enbjIOWFdk2AExptgGVq609zjuPBw==
X-Google-Smtp-Source: AGHT+IHEARlUQzPah8TcatUtYqt3dhawpWIQ4/frE2MAr7wPon90pWCRXps08MIqR1RYX+mleSUEfw==
X-Received: by 2002:a17:906:d0c7:b0:a45:b74c:6e14 with SMTP id bq7-20020a170906d0c700b00a45b74c6e14mr3409610ejb.57.1709799965382;
        Thu, 07 Mar 2024 00:26:05 -0800 (PST)
Message-ID: <8b02fb20-2e4d-4a68-b633-417c964e38be@suse.com>
Date: Thu, 7 Mar 2024 09:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: bzImage parse kernel_alignment
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-3-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2403061809170.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403061809170.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2024 03:09, Stefano Stabellini wrote:
> On Wed, 6 Mar 2024, Jason Andryuk wrote:
>> Expand bzimage_parse() to return kernel_alignment from the setup_header.
>> This will be needed if loading a PVH kernel at a physical offset to
>> compensate for a reserved E820 region.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -548,12 +548,14 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>      struct elf_binary elf;
>>      struct elf_dom_parms parms;
>>      paddr_t last_addr;
>> +    unsigned int align = 0;

Strictly speaking this isn't needed here, yet, and would suffice when added
in the next patch. But I'm okay with keeping it.

>> --- a/xen/arch/x86/include/asm/bzimage.h
>> +++ b/xen/arch/x86/include/asm/bzimage.h
>> @@ -4,8 +4,7 @@
>>  #include <xen/init.h>
>>  
>>  unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
>> -
>>  int bzimage_parse(void *image_base, void **image_start,
>> -                  unsigned long *image_len);
>> +                  unsigned long *image_len, unsigned int *align);

Any particular reason for dropping the blank line? I'd prefer if it was kept,
and I may take the liberty to respectively adjust the patch while committing.

Jan

