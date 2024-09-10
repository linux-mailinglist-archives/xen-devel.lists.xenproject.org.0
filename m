Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97805973ABB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795773.1205273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2JH-0004aS-4B; Tue, 10 Sep 2024 14:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795773.1205273; Tue, 10 Sep 2024 14:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2JH-0004Ya-1L; Tue, 10 Sep 2024 14:57:39 +0000
Received: by outflank-mailman (input) for mailman id 795773;
 Tue, 10 Sep 2024 14:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so2JF-0004YN-CH
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:57:37 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03a823f6-6f85-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:57:35 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so449954266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:57:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ceed73sm494046066b.174.2024.09.10.07.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:57:34 -0700 (PDT)
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
X-Inumbo-ID: 03a823f6-6f85-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725980255; x=1726585055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LJej9psTaDEBftjPkm6BTz6hv7PKLjBsX/1IhKo253w=;
        b=dPvMBAmDkW1yBgOsZiZP0uRGDO4NpHYu2Edx2k2d/j9zlBdh86K3B21t6GEHhs3h2w
         1kI4t1S48A4iNwwPx7lmzcxqSMQRjXcCfCvPY9/IicdPqGr0qaZ4WAz9VIt3CECzjk4W
         kbA1MenFMMMw5A9ul/je53MsAuuba9NE+J/aO6BuT5LN3nnWeaBX8JWPtksfqaYtGIuj
         UayIeSBgLsnG9YDHTbgoBoazDv8PEBuaIfs7I4h9lV8Tvi/AL/nMXbS09W5Z1WlUy7Lp
         2kQoZUYIlhQHPWMXhoNyKA9k48VKztDF4RY+Pcvr+03LANgOxyNSJ5AtyFw6xtn7qJDa
         rCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980255; x=1726585055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJej9psTaDEBftjPkm6BTz6hv7PKLjBsX/1IhKo253w=;
        b=vfL3v2sS1yNuKrplRviv/oI4sknMKVk3vpNQ80kls2rfluhp9lBOfE4/MucJ7H80nW
         BXrgsieb5eTz5+2Ihf7lqDMkFpTfsYh6znAu3bddtqAs2Mnxz2KcILfX5XYnUIbf+gfn
         goW5kv7wwY7NFH6eaTi6q6SpnmScfkW8Hz3WILrr45tpv2iFsHkNz7qQ+KF5LRWXrdhM
         5miYkyJLRjw/LeTaFCfxd5N9rpRB23WFCcJkdUcHedNEbklqQJd5Bqe5dH58fc0PwdVY
         JYZNQfVz1I7Qs1aPA+i2XREQtZ7xVRouaYo9CjniAGxpu2+2n/mhMF1X/d5XpGAXZVpW
         8NMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW3/7FRGFYw9gymbjS4iuk7j2Ri22vIJSWpiU1hboPawL1jcquZsIufkxgg9wPpeLc1KbjMfhxA1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx86D03qXYHBqefRydW71yIlKHEn8BckikEiy3O8kB/VoSleO8x
	ro13aoeckpM2nP3Gg2q3WJzHlKv9vwjgUZHCus42PUFRp/8M5UZHnPm3UZVKFg==
X-Google-Smtp-Source: AGHT+IHYjwKBwtKLTiZ3Sxe5TmXiNbPUWZhjQnXFoYYWoTWLH3NUc+RlkKZWw0hv0J7g5FdSYt8YTA==
X-Received: by 2002:a17:907:608a:b0:a8a:af0c:dba9 with SMTP id a640c23a62f3a-a8ffab18a03mr107542966b.16.1725980254905;
        Tue, 10 Sep 2024 07:57:34 -0700 (PDT)
Message-ID: <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
Date: Tue, 10 Sep 2024 16:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
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
In-Reply-To: <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:09, Federico Serafini wrote:
> Address violations of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".

Since in our interpretation "return" is okay too, why is not sufficient to
simply ...

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>      {
>      case 1: case 2: case 4:
>          if ( *s )
> -    default:
>              return -EINVAL;
> +        break;

... insert just this one line here?

Jan

> +    default:
> +        return -EINVAL;
>      }
>  
>      phantom_devs[nr_phantom_devs++] = phantom;


