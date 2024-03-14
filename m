Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1487C0C6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693351.1081314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknUG-00013f-Tp; Thu, 14 Mar 2024 15:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693351.1081314; Thu, 14 Mar 2024 15:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknUG-00011H-Qy; Thu, 14 Mar 2024 15:59:20 +0000
Received: by outflank-mailman (input) for mailman id 693351;
 Thu, 14 Mar 2024 15:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rknUF-00011B-Is
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:59:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd6cbda-e21b-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 16:59:17 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a44e3176120so149983466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 08:59:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u23-20020a1709064ad700b00a4479997b97sm827987ejt.66.2024.03.14.08.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:59:16 -0700 (PDT)
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
X-Inumbo-ID: cfd6cbda-e21b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710431957; x=1711036757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgW6x4OIe60B2dlZUDhPbecfA3EZ1GTZVuz81ZJtJu4=;
        b=dFGviQnn/+BdwUHmAEaZjG36pLQRAy/LHdsDoxoycrT+KMzH70jORizYAhA7HW+T5H
         DvkryQ+iLOyOvJCYRDprpVLfJC4okVS72sTgEuEznRGPThCZlRSYEnknnhdpAYSfQP/0
         p6X5AKDZkdgAW5bPj/nweGn7RvqYOOQOhJBaTWC9xVpKMAJPzVfo4ZTZoM1iaAxmv/yx
         unKqXEf8ZjBvEdmg3dObZ5Q/fz8hcRGjXOBP/MDGEvxFQa5jpJyuvH1aWj3gwPbiUBpV
         2eQ7jn8reDI4matkIs2Hu6z3P7H4u2COfCkYT94W7O4gqerziXMs9hShWMvLTFiDn/r9
         9Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431957; x=1711036757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgW6x4OIe60B2dlZUDhPbecfA3EZ1GTZVuz81ZJtJu4=;
        b=uLygjuwvs1f++GODGMfk9JhKXo04DKGVzE5iEMdbznPMoCTQQ+UBd7FiSVHgD3LROT
         VGZX2GUzUlnGiAxmpnJEWhN8JWpQAbxF30ZT/R+oeh+cbQW1YFpcCq9GkVqJN6bMg9ox
         v7e7EKMsh0HZE1C622mtdF8CtnO9yvxtGlo3McHtGrQ+cbaVLnoHBVKS2dEH9kAfCMhY
         G1xiuy6Ri9otbT/w3Numrmnw9kpvUK6cSd0FD4NWufuZVkPu5iENQVj+x6WjaquwQc6+
         Ww0cz8hUacdQ2FYOfZSuDtalH4w1xpm+o/x0gGhmn9kBJYVsdgnt0wnyTJpdbHCbrXR+
         NKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWQkOr1Ao3KETxELMKZ2K1PEmYPkRY6H29lvdI6QaqAN+oqMOXQ7RAnvWubK/VqvUWYKN6MsIF5wBcuLXuIZHaInnS3W2QJ/ZQb/VyvuEM=
X-Gm-Message-State: AOJu0YzONmpKZWVH+/y/SVVUgdNO011cgxDApr2TY+aNn60oe+M+cBwF
	mWm1KpfzbLWcAzNRwoq9amQxnOoQuCsbBIggs8dFzZmSM0zD/HjcY19Y+WOgyQ==
X-Google-Smtp-Source: AGHT+IGWwC/XwNYlYaLKlj6hhGSuOjawQ1L55RSNxPzkUmB6xnfcUIkDuSwKGxljl3UpDQXlPSLCzg==
X-Received: by 2002:a17:906:3b42:b0:a46:5f03:fe01 with SMTP id h2-20020a1709063b4200b00a465f03fe01mr216432ejf.18.1710431956971;
        Thu, 14 Mar 2024 08:59:16 -0700 (PDT)
Message-ID: <926895a0-f777-4e17-951f-6df0cc24b0f2@suse.com>
Date: Thu, 14 Mar 2024 16:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/bitops: Delete find_first_set_bit()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313172716.2325427-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 18:27, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -401,18 +401,6 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
>      r__;                                                                    \
>  })
>  
> -/**
> - * find_first_set_bit - find the first set bit in @word
> - * @word: the word to search
> - * 
> - * Returns the bit-number of the first set bit. The input must *not* be zero.
> - */
> -static inline unsigned int find_first_set_bit(unsigned long word)
> -{
> -    asm ( "rep; bsf %1,%0" : "=r" (word) : "rm" (word) );
> -    return (unsigned int)word;
> -}

And you think it's okay to no longer use TZCNT like this when available,
where the output doesn't have to have its value set up front?

Jan

