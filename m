Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085EA72B43
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928603.1331283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiS6-0006JL-84; Thu, 27 Mar 2025 08:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928603.1331283; Thu, 27 Mar 2025 08:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiS6-0006GS-4s; Thu, 27 Mar 2025 08:19:02 +0000
Received: by outflank-mailman (input) for mailman id 928603;
 Thu, 27 Mar 2025 08:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiS4-0006GM-V2
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:19:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2278791c-0ae4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:18:59 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394a823036so6780885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:18:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83609sm29587755e9.15.2025.03.27.01.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:18:58 -0700 (PDT)
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
X-Inumbo-ID: 2278791c-0ae4-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743063539; x=1743668339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy6X/pds0LeIPGYc2gJPeGYo3rta6p8lXrStEaz3Q/8=;
        b=JHCX4W4FYfR3mF62Rb3tcqUXKMG9bhuGekEgk6UCe5XfrE/s+H93BV5sVZwq22DeDK
         aeKKAAM/c3c8kqivf4uXZfMd3j2x66Y6XJpfAinMinfqo0kZ3svUfudexbFF481S8no/
         LqJvh18laOLThU9eoVcQFkKz4tm4avuPjieEc7I2W5JYcJ8in+iSjrdpbqA1pFjIgjV1
         HYTirjOj2OCHzijwhHQBXelZPFMExUjmoRR2T9YRR+AF4AxV1+Eu5tNKXPE41Ixm0ZOB
         oR/IlYI3WcGlco3IYb//M3rgr6pPeE1RG/kuIXT0j8/gShfpR52/L7tcehqiT6ezsMTY
         +O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063539; x=1743668339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy6X/pds0LeIPGYc2gJPeGYo3rta6p8lXrStEaz3Q/8=;
        b=vQu57xpWDPuroMDSLJF0PvUQ+Qei7eQMeH24Hj9GwUJyYC/L8cWxaHTQ59dYFDMKiS
         ViPAyReIfHN3zFdQ+u2QLQwQsb0sddkQd5TkNKiuuks5gej3xJ49BpHHFjRC9/DifV4T
         LxdA0LVjqUqjyDHYGvI15QRv3mHHWTCreOHv+6UCBsYeQKIQM1pE5THHeTJs1qAirTDP
         C16xhUQIQHOwsVml3MyLn8Enhz0cXWWlW0pXGOsJYF1UVtH27/FHooA5c7+lAw1xSCB+
         a9PE8INEgaHbrycIT4Wotmhk/xKK/aeAQSt/bakDOoeNjkky7eeDC5TcDn1uF8xKpyiu
         znaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEFKomRiahlO+1DS3tHlsDO2iPihKMETmamklUhZUCRwUjWMorWcOPRfKhDEJhXjKQ49ZfNQ6naFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRuxLqRyJvIWamcFXnbkcVgoCTllxfBFpOa7mhe47+hp8GysNh
	e5aqdFIbXlp9FP9GRiJ1PwrNa3e/EaTpI4MWBsnlZ5Ui68dyJb73m1S1a3LKfQ==
X-Gm-Gg: ASbGncsle04dVpDbMZXxNmxHReOJjajJuwFYDXIQnevcIKi8Jj5Y4gZbLk49+qhAH5/
	akdQBjKdVxQWjLpBrkoGBmdnUzsLAsCksszkWQyiChdd/+UjcDZC945LAv3iShvFFtZx4+5s/gg
	kBTo30+YZK8jdUHHQ64BK/+vL8cTUFmAIT7BFtqzgVXrkLUhMP1f/16AQ6qdj11Ti8emuiD1JAR
	mytpKWHx/pE306YI1i83CPQOh344qn/mZw9Ix4t4f21Nx/99Ian5fY1LpK3jP8PVjIFVdrFeiK0
	isVZwDk/HiQ4I6ozlLcjtGJPCdoYLkjth4CKBzz1LQuXzLc5SLixjFpGPGVlC+rVtM5356zMaLX
	gHDHgvFbhFX55OjXTnQu4BYlHky4NHA==
X-Google-Smtp-Source: AGHT+IHMYqGUU4cXvf5sudRsYkF0lIKhrX356Q+bv+ELtSRN66rRwSBXd35BYyyBVXyVPC9WoTMfFw==
X-Received: by 2002:a05:600c:886:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-43d8654e969mr11829325e9.23.1743063539111;
        Thu, 27 Mar 2025 01:18:59 -0700 (PDT)
Message-ID: <8046d3c4-c00e-4322-b665-81614af89f13@suse.com>
Date: Thu, 27 Mar 2025 09:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 18:47, Oleksii Kurochko wrote:
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -98,4 +98,13 @@
>  #define ZERO_BLOCK_PTR ((void *)-1L)
>  #endif
>  
> +#define BYTES_PER_LONG  __SIZEOF_LONG__
> +
> +#define BITS_PER_BYTE   __CHAR_BIT__
> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
> +
> +#define POINTER_ALIGN   __SIZEOF_POINTER__

Just one remark here: Imo this needs to come with a comment, as alignment and
size aren't necessarily tied together. It's merely that we assume that
sizeof(void *) == __alignof(void *).

Jan

