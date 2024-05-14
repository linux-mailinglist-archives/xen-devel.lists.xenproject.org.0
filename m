Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008128C4DE4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721265.1124555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nnO-00086J-O3; Tue, 14 May 2024 08:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721265.1124555; Tue, 14 May 2024 08:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nnO-00084m-Jg; Tue, 14 May 2024 08:46:02 +0000
Received: by outflank-mailman (input) for mailman id 721265;
 Tue, 14 May 2024 08:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6nnN-00084g-8U
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:46:01 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63545bd7-11ce-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:46:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59ad12efe3so592668666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:46:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c2c7d79sm7241850a12.59.2024.05.14.01.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:45:59 -0700 (PDT)
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
X-Inumbo-ID: 63545bd7-11ce-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715676359; x=1716281159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XAdd1MYGx0CrayOzgBjMlQADEkkAwdXEBr5JB4DeYY=;
        b=AeEBc2RNVLUxfiNRfkKKzTNJWf6zqnBOL9R0HoBNrSyehjV8RGFQA8KjPEePnQhFD2
         5wXsOOhJEvZhChFXs2bbyt6EqIqcQr1Fta4dMnyRozLmivQj1+LpyOguesFw0z3T0Hvj
         DhUMUD8fEtNlfo4WwW5EF7C4A5zICUWo9xf1gSY1fhhxGlguVaqqPXg2M9gkxETeIojK
         piMvuER7lJytEPD3pzBF29Mx2YT0IsMgNyESp35xupOfR04qsQ0d45aObEGMQ5U/zjw0
         DuQgg3pQKWxKBJ165GEyuascsgBRW2YWn0LOQb5vA0N/SHooBSapgec+WYfzIa2lYDxJ
         ZTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715676359; x=1716281159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XAdd1MYGx0CrayOzgBjMlQADEkkAwdXEBr5JB4DeYY=;
        b=Ja9yEFjG61/wjTr3+K085SU7WRVG4Ds44O6Xzfzczr57zmM64ZSU8MwInC4GlkZKJv
         iqmKDuF9/G8Iu15znife4pfEdmWZ97VwkrvZFJa4CtG9WPLFIpnwaF7lYFMzPczKXpib
         7yVXU9z4/FA9FcRw5B/1R+Qh/h9fGOBpdHRNvlYjRGrqoAkSeO6opDIQgiVZz9+a3Lna
         5VbmBaog1JEsQ00lW7h/No1KmB/P6GteyRAmN/cyni3ZM9mM51IZpQ7yKKeobZx0Cyhr
         dJnR2r/p6jlZSMsYourmO9GSeFJe7N1afSgIoLvjKWblFWDWjlhSG7F2mO4/j0jx5SMh
         TAFA==
X-Forwarded-Encrypted: i=1; AJvYcCUuKze5M7jN2BvJv5BcyaNKIknjXsFKQGhFXTdE85QEFUWZHT6o6DwS7u5d4ZQ1O5r+U1xxIyAGUfDEMd0eAynPFZfQ02T1H0qghKuL+Es=
X-Gm-Message-State: AOJu0YwsZaiZvVfYkNZ/ixM5DIA1gQZpXHLYXjC+Ab3aEYt9cTNOKRxu
	S9s6jBXSSX4kzvuD4czSZrgc09oLpFlUI2vsTt5tr42FPEmwYHP/ULG9eAJT9g==
X-Google-Smtp-Source: AGHT+IEofKuRVyAilE/2E/qhxyXB1uW0PdcCJ4yIirxWw369HYdKDL19hk2XuaugodTuSroYp2tnTQ==
X-Received: by 2002:a50:ab12:0:b0:572:3f41:25aa with SMTP id 4fb4d7f45d1cf-5734d5c0eb9mr11269796a12.11.1715676359623;
        Tue, 14 May 2024 01:45:59 -0700 (PDT)
Message-ID: <16990192-aceb-408f-9247-45f3b1f58e0a@suse.com>
Date: Tue, 14 May 2024 10:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/strtoul: fix MISRA R10.2 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 02:32, Stefano Stabellini wrote:
> Fix last violation of R10.2 by casting the result of toupper to plain
> char. Note that we don't want to change toupper itself as it is a legacy
> interface and it would cause more issues.

Can you point me at a single example where a new issue would arise? All
places I've spotted (including tolower() uses) would appear to benefit
from changing toupper() / tolower() themselves. Further, since they are
both wrapper macros only anyway, if any concern remained, fiddling with
the wrapper macros while leaving alone the underlying inline functions
would allow any such use site to simply be switched to using the inline
functions directly. As said, from looking at it I don't expect that
would be necessary, so instead I'd rather hope that eventually we can
do away with the wrapper macros, renaming the inline functions
accordingly.

Jan

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> I believe this is the last R10.2 violation
> 
> diff --git a/xen/lib/strtoul.c b/xen/lib/strtoul.c
> index a378fe735e..345dcf9d8c 100644
> --- a/xen/lib/strtoul.c
> +++ b/xen/lib/strtoul.c
> @@ -38,7 +38,7 @@ unsigned long simple_strtoul(
>  
>      while ( isxdigit(*cp) &&
>              (value = isdigit(*cp) ? *cp - '0'
> -                                  : toupper(*cp) - 'A' + 10) < base )
> +                                  : (char)toupper(*cp) - 'A' + 10) < base )
>      {
>          result = result * base + value;
>          cp++;


