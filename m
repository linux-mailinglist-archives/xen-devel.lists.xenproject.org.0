Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1287BD91
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693217.1081021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl1t-0008L6-Sy; Thu, 14 Mar 2024 13:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693217.1081021; Thu, 14 Mar 2024 13:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl1t-0008Ip-Q1; Thu, 14 Mar 2024 13:21:53 +0000
Received: by outflank-mailman (input) for mailman id 693217;
 Thu, 14 Mar 2024 13:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkl1s-0008Ij-CF
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:21:52 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ea69af-e205-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:21:50 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512ed314881so881170e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:21:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p13-20020a170906228d00b00a4674a2bb3csm486762eja.1.2024.03.14.06.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:21:49 -0700 (PDT)
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
X-Inumbo-ID: d0ea69af-e205-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710422510; x=1711027310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7m8/tJkD59UgmWhQUC53WkJ0pubyi6X1UATytYLsMo=;
        b=U8hOP/Bg/oplqTcs4qXImAvhAOX7ZTLdyT57NIpoxMjjggCZOdhQnhoJsZd/HtSZuw
         5yyHCD8gYIJtybrF/TOTqfa7tz8SmNYoH/DwMiBA8TXIVqEl4o4Fm6uTL3NRxJbeCne4
         gSr3MykgKV8A3HKHKr2qiX3vZfhHB4fRmYQoQai8Nsdu+/6e/Tnhksmo4WAkFgrTH8at
         zr5x1s/m/lmMz0fZeI+cG3egdAAeVyH3OovnWMCqApm2TzhYlpi2J494yocPXZ1HM1tI
         UoNDSWhFIhil1Jt10/IygksRgH2rKcXfI3E8yqhUX268wSW0xMAB11uSou8PODei9KKK
         R/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710422510; x=1711027310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7m8/tJkD59UgmWhQUC53WkJ0pubyi6X1UATytYLsMo=;
        b=smDUDQ/j3qpa0tR5MfiCIQfADwNkqnyj9M8ZZV6O/9vlMYgPbIAlK7pGtFK8j0Mk4V
         G8vbyBS3+tz8vLZAbG+p2W4GmL20gr0ay4y49prrgUj+NybAMXTJdKpPeW/AzthvPupG
         DuREKHtn1+SxGvhYeTpr9jCs+jT7Zd3y0Ewt7JmjwfsdiqEeNY2SRShX2IQdQ0XaKcmX
         MJCUI5OVbn6tOJKvNTCRK3L/h2dOjmX1BvW+o0eiV37jKiy1WgKlGqxEPUqYJ9jbTz+F
         53QUks+gq+jHeT9SxovOtf8oqGsCrwn6GU9O7c4UGADEwBuu3RKlfwRtN61IaJMEMboL
         ucCg==
X-Forwarded-Encrypted: i=1; AJvYcCVTMNdaw7qPHvM74tCJcJUeYrodftTrZXHbWBzYMJ+fKbkRrBtLrsjAtYcFN/KZ16RHy8KnOOgNu6wbbngg1svNcYLjkHcy854HPxh0aUo=
X-Gm-Message-State: AOJu0YwPr0Tisw6l5apkgtezsoC1di6QvkWdmHnLw3Kvaj0dXRbnroUW
	0eWih4UF3N3Dp5t9+6phUByPcxlgmVN8m7Lrv/qbsYntQdxru1M8A7UXneF8XQ==
X-Google-Smtp-Source: AGHT+IG7zbROVytd1lxmw89V2aZzPFxVfPvSu+JWHNDuU5xQp0oZ6IXDTXc5X2CCMWnMl246+2XI0A==
X-Received: by 2002:a05:6512:32a6:b0:513:c54d:d4a with SMTP id q6-20020a05651232a600b00513c54d0d4amr1220022lfe.5.1710422509801;
        Thu, 14 Mar 2024 06:21:49 -0700 (PDT)
Message-ID: <945609d6-741e-4934-a4f2-6e5597ce5dcd@suse.com>
Date: Thu, 14 Mar 2024 14:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240313193021.241764-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 20:30, Jason Andryuk wrote:
> --- a/xen/include/public/elfnote.h
> +++ b/xen/include/public/elfnote.h
> @@ -194,6 +194,17 @@
>   */
>  #define XEN_ELFNOTE_PHYS32_ENTRY 18
>  
> +/*
> + * Physical loading constraints for PVH kernels
> + *
> + * Used to place constraints on the guest physical loading addresses and
> + * alignment for a PVH kernel.  This note's value is 3 64bit values in
> + * the following order: minimum, maximum and alignment.

Along the lines of what I said on another sub-thread, I think at least
alignment wants to be optional here. Perhaps, with max going first, min
could also be optional.

As indicated in different context by Roger, the values being uniformly
64-bit ones also is questionable.

> + * The presence of this note indicates the kernel is relocatable.

I think it wants making explicit here that the act of relocating is still
left to the kernel.

Jan

