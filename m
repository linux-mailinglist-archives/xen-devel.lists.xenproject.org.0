Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A609FACFD21
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007925.1387103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQwl-0007Rf-Co; Fri, 06 Jun 2025 06:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007925.1387103; Fri, 06 Jun 2025 06:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQwl-0007Oh-9B; Fri, 06 Jun 2025 06:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1007925;
 Fri, 06 Jun 2025 06:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNQwj-0007Ob-BW
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:52:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfacd3a4-42a2-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:52:55 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1823152f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:52:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ee851efsm637547a12.31.2025.06.05.23.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:52:54 -0700 (PDT)
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
X-Inumbo-ID: dfacd3a4-42a2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749192775; x=1749797575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzB4mRNnbhI6ZmujJOdTcsEs2mXKlzNBii3rirIvmBQ=;
        b=EUxA2uihhtkRZE6dC/GaRs9EL01CKvgNBwqtp+b/g+nup0RgqpsKyGbflADAJp2i17
         GMZ1ooJQJTp9HvJvbicy3irn/YeHZit30O0JtpoGWrLgq2mP+SJtGGCLF7mvOtCSFY/E
         xxe+MhxwMFVgAB/BnzYFqBv5+2m9MAakZVVXw3XhufDS7eButYG8UYMrrvqSvWPCw/vN
         Ux35R4JotwIDZZyFOEurBvhlc/sDhBGbd/t9/vY7vP0TYHwim/LWaTlgrU5niArMZCRQ
         m59fJi0yMggKClJ0QmdqH41XKhS+VN0ABIuYFe36Zu4fdTqvkGtry6GpGYnUkhv72lH5
         P94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749192775; x=1749797575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzB4mRNnbhI6ZmujJOdTcsEs2mXKlzNBii3rirIvmBQ=;
        b=CAeDtXQUZMmpV9lHKNqQN3h2FeKOpdd5589UzaRscvjPHi3WKtA8D7QKTYRNXRjrjD
         T1cFRnMdrqfBhq/z8QBCU/x9Tdv6NT9It97CvwhhAXD6OFAZPfTAhH4CJLHYEUf2SnPb
         prqgJOy5uosSjgEQHJEiw5O520F94bCWLQoTOoimEp9xGv2bfHLmNu2KZyZzaBX2Ayoh
         CvBlcKw+gIChd58+dttGMpybeRv9pz1KRS7lhl0XEJSFHp4lZqrLzyy3lM3iGYjmM8Ix
         DX00GQZxuAo1SRM07YXnv05kK830Asze3QPufahoJfs8rLSk4+EpPY+8Sq07ozSLcjxY
         8uhw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8T0htH74FnTpJ7hVyDDroRn/t//y2Ie2ZrLBUxzk5pmK9qjpJ2Kgy/x7HVyS3YaT76YRTQNVTdQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiQZLAck+BUKXmw1RRF77TMfLwFbyh9lpfErzk3BVFCxgPRAyy
	oZxXVV6hXaSs4S+O7WEVv9tJJLUWJeIW9da7ZTfMiap0FLVA/P5SVqwOlroNv2PNZg==
X-Gm-Gg: ASbGncvbkRqOFZEBYac5gnGdxHE+CRbgmafwd78RQ3sqKTConT619tjvyuI5IgiuBpS
	SrLw6UYiWs9FSaZMv1aYM0EcyBkkPfdODjFZNz6BU2rGKm/vaW0s9DkD7NVKak4K3wSiLx7h0Ig
	cWRy+gSAq4ZwBbtg2Hy6yjZHcr5bkbN/FGG5l0YW/qQspc/sKAi0KY5k+K7HErtkUyf8E93usWs
	ghd79cOnr7Z3nc4M5bMYd0u25MpmL72F5ctoNdKcJOdr8F/9flK0/9pwezeKXdMsagM6bNgVLwi
	JJXABMRWJOqdYurLdc0id7XyqIWjU1A/kyxm3OmIahEmbwpxpFYWFWhZqpvGBGMUebfvJgPuFzF
	A0A4iVUAQVIi8g1zz1ahAdxjq7l0NjOaxafip
X-Google-Smtp-Source: AGHT+IGBT04TaFXGugovn+YgV+0OEbaWut9dvnScLYuUZrXQBZfvGyePLInN+TJL3zzivCUm+ockzA==
X-Received: by 2002:adf:a405:0:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3a52b1ec589mr3496494f8f.29.1749192774838;
        Thu, 05 Jun 2025 23:52:54 -0700 (PDT)
Message-ID: <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
Date: Fri, 6 Jun 2025 08:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] arm/gnttab: Break links between
 asm/grant_table.h and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-3-agarciav@amd.com>
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
In-Reply-To: <20250605194810.2782031-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 21:47, Alejandro Vallejo wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -42,8 +42,10 @@
>  #include <xen/xvmalloc.h>
>  #include <xen/nospec.h>
>  #include <xsm/xsm.h>
> +
>  #include <asm/flushtlb.h>
>  #include <asm/guest_atomics.h>
> +#include <asm/grant_table.h>
>  
>  #ifdef CONFIG_PV_SHIM
>  #include <asm/guest.h>
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -27,10 +27,6 @@
>  #include <xen/rwlock.h>
>  #include <public/grant_table.h>
>  
> -#ifdef CONFIG_GRANT_TABLE
> -#include <asm/grant_table.h>
> -#endif
> -
>  struct grant_table;
>  
>  /* Seed a gnttab entry for Hyperlaunch/dom0less. */

The description doesn't make clear why these two files need changing.

Jan

