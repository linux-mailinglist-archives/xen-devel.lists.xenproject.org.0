Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E29853520
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680035.1057863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZv42-00086M-VY; Tue, 13 Feb 2024 15:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680035.1057863; Tue, 13 Feb 2024 15:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZv42-00083g-Rj; Tue, 13 Feb 2024 15:51:18 +0000
Received: by outflank-mailman (input) for mailman id 680035;
 Tue, 13 Feb 2024 15:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZv41-00083a-PF
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:51:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8257428-ca87-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:51:15 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41166710058so13244845e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:51:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bn8-20020a056000060800b0033b198efbedsm10093929wrb.15.2024.02.13.07.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:51:14 -0800 (PST)
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
X-Inumbo-ID: b8257428-ca87-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707839475; x=1708444275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2i2aUtxxyZJ4vBmTsnj4Ousq0q5qhRJ9YTgfeT1TVAA=;
        b=B5gwgUfmktwHRmfHNjg6Z2lMTOmqj232C+CKxeQgKVnppZWQlsmTsdzOwdjsS87rwA
         jVEXLkZtd9xeP2uzyy5VLWcm07d2rALpqQj0Oi4gyUdg/QDPjlYbdyS1qkblEknSq9N9
         8bFX51qQuZLTaJmh2WZjaps6ANiZOW5BSQV5kmrfPtuJz/Khpj4dXsxRZYXsWBwTJluT
         QKRU77wJ8ST6ewwsxuid7IoutV5HJWuBXQxpsK26/PmtElzr4FL3wrbYt1xTiOCmc7sr
         4QTqRUhve5qO19FefDIpa8Dd9m7NbLDpp5xThR4IucMCSu3K/UE9WuulNyjgsazmAmyb
         O8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839475; x=1708444275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i2aUtxxyZJ4vBmTsnj4Ousq0q5qhRJ9YTgfeT1TVAA=;
        b=aEI9Gafc+38F6YAmqLn+FZzMtENG/1kMDp939V2YKYFBcOjvjvYArsQ/W5tBRJnSOB
         pc9jC6hqhPdVWCXDPxMUrM4pjLHyWdMPM75pNxydw42NyRAS+yP83dMrweSeJW9l/0BJ
         +f6Znd/lJ0o9eT6MBA3+sl7xA7mx/1T/asKncRxPVvgTbsKUDjh6uC31zBbaNtQNDO62
         4QgFZk4ZHK79muDNn/4kMnVbX07cZjsvQK8AqqXtZbdBQ7SXIhKAeu8KGnUJ+88fc4mn
         i1/++Yu2rpgdiXdf3G7AqELeAK2Xcr0BhfttANz2pMFzbXnU0WctvInngS2ZwcHVwAWR
         kO1A==
X-Forwarded-Encrypted: i=1; AJvYcCXp/4TsLM55+hSyIUeO34bnYPvolA9+asKBUjKtQKGmGDmRmNjg0X7A3dbS/FFbUogCwMM6ovGl0ooVuBXFtniUeNnX9/mJbvxzO760GXE=
X-Gm-Message-State: AOJu0Yw6z1PxOkEM+qG8EYkojeRV9/V6rjTjenjmFMaWN8ZkGUphCFLv
	9LCo+yheXjwGHNIF/jzwgE48fQ0D8Eu37wYVSi97rs/WPnRiUTqU03VaYiB4eg==
X-Google-Smtp-Source: AGHT+IHIMkvCzVWYYMDIAdMujc8qZuROpTA11IDUBbei6qnLnq+MmCoUVMiJgUjgROFdJxiaMGLb5g==
X-Received: by 2002:a05:600c:1549:b0:410:f582:6675 with SMTP id f9-20020a05600c154900b00410f5826675mr28695wmg.26.1707839475070;
        Tue, 13 Feb 2024 07:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKLdOcWVRZCP7QRXi2ZQLUChxHB7DqjozFgnYcpHXwbEWEJWBvGLS9HhgdSv9SeOco86Tia5Z2PjyroHGklsQCJHivy/O5D33B2u0R0xy+ReuPe9LYiqD+kXIfooY9ul20kiWsTz8bjjCy8No9xLoVoYO5CDVu7p8VjW2DLC/7+tI2ZbFI+B8nxUwKj2JDIug7G3WyPE6v40E0rmiiinZqIa0FdXHUbcfVedNV/C7GrKQ7CORPWiww4UfPTPP7v3HX3t6r16w1mA0ssyc2UD7p/lNi9lB/VPnLKgi73L2jRaUyR18/FANMv7HVxpZOehSviDNU4ueembdYXRANETC+7Gbn8Y8MEAMfwuWV8e2VNugrH0lwkJlpmTw00R9SPt1UvP9hdp4crypBR/2tpP6W3CfzRNXcYvDR2q8f9USpt1N3ut4YosuUGq74BmygevuigpOR
Message-ID: <ab71e3e7-c032-454a-b9eb-4a8e9e064b8c@suse.com>
Date: Tue, 13 Feb 2024 16:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
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
In-Reply-To: <20240207145547.89689-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 15:55, Roger Pau Monne wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -29,6 +29,7 @@ config X86
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> +	select FUNCTION_ALIGNMENT_16B

With the insertion here as well as for Arm and PPC obeying alphabetic
sorting:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

