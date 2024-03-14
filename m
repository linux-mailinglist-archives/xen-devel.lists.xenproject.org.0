Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A387B899
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692935.1080671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfZb-0006lp-0Q; Thu, 14 Mar 2024 07:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692935.1080671; Thu, 14 Mar 2024 07:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfZa-0006iX-T6; Thu, 14 Mar 2024 07:32:18 +0000
Received: by outflank-mailman (input) for mailman id 692935;
 Thu, 14 Mar 2024 07:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfZZ-0006ec-Qj
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:32:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb120c9b-e1d4-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:32:15 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a4663b29334so80786866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:32:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qs28-20020a170906459c00b00a4550e8ae70sm426840ejc.63.2024.03.14.00.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:32:15 -0700 (PDT)
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
X-Inumbo-ID: fb120c9b-e1d4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710401535; x=1711006335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GIcEdI7kxKhclI2LxWoGU/C+gHk87AbL9d+nyKPro2c=;
        b=Zu94OhF+EgjWRUeeFLj6xgaAY+AWVcfeMrOSjAlCOVzZ4dSV+INoCofBh0Vqmh7B0L
         miwavrrL0xs7ZijsbZ8VAJ/CejZGTxBKz8OlxLUuoFXQFBq1ngjDwuimz8M4zqIMTVjk
         EsbUHEFJ0Ka8QF9jQBRWctiCm5dfYuUz+/uxgE3rsf6XH7NgcFss45LqLG/vsG/kWzMA
         6ZvzNl6koYZH1RCebyILhfXRJ1BQ7465o9xDY4PUDdPv8VXC2hXGoOldoqpeylnVjGnN
         y11I6cu8MEwFG3YXngeJDFwD4j/RE9xGX6Mu/z+aviZc0xZH+K2tkDr76yYFFJPEoWl1
         Sdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710401535; x=1711006335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIcEdI7kxKhclI2LxWoGU/C+gHk87AbL9d+nyKPro2c=;
        b=YdLFOvYf0lEKZkwjmx/qAZQz+Slo9xpmUeUvgv6ApLjaqgLS2RxTtENmT6J0qzifcs
         7JIE457rpdnJ8YTL0cvLeQ8OB173SUptcI6hKCw+qmbxRXvie/XmZ0DxRseKSl1Mu5j7
         ux3OWiAPc1rD6QRXikG2XJ0GLlZjw5nZVe345vs2DKB03S/crEp8ldZeEe0DEibbnOQy
         Nsl6z+LvcZ5JvwlFosh03NKViwQy7pwPiaUtZ986iWmjalw3UsyK7J+m8nN/DGAsFrBn
         usKRPzsLEHzO7muOrOAtr9pe9//KIDfnRrYIwOIuxupHiHlUt+GOXffpU3yt4fGiGIXf
         OZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/D/U0nUEAMSdFNH00VTjbbmE10bURVDj5X47ec/eQowQd678veFkVHBtHJ4ojx9W4py1LLu4XuItpnDr4NdGrjFYm4yQf2E4GwC4y1TA=
X-Gm-Message-State: AOJu0Yz4aCvsSgqDEq0SOWuDL9SB9rmcP0ncRBryvUoJaQ8GEXWAdpu9
	CSnl59tg89OKbQeU3GQi2VxsfSGkZVNM57g2ANQc8XQe8HCpJEHQe+fuOXVDSg==
X-Google-Smtp-Source: AGHT+IF9WzJnd6nnanJZeTCmwGwPjJUgCKSkfJVCB5DEoFNuhLDB9i6TTbrwqmpcGKAFNZwp3mPGRg==
X-Received: by 2002:a17:907:1049:b0:a46:6623:6938 with SMTP id oy9-20020a170907104900b00a4666236938mr508517ejb.50.1710401535292;
        Thu, 14 Mar 2024 00:32:15 -0700 (PDT)
Message-ID: <272d0e4a-3ac0-4b42-9297-6d476151e28d@suse.com>
Date: Thu, 14 Mar 2024 08:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/spinlock: remove misra rule 21.1 violations
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-2-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> In xen spinlock code there are several violations of MISRA rule 21.1
> (identifiers starting with "__" or "_[A-Z]").
> 
> Fix them by using trailing underscores instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I can live with the changes as they are, but before giving an ack, I'd
still like to ask if the moved underscores are really useful / necessary
in all cases. E.g.

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -22,7 +22,7 @@ union lock_debug {
>          bool unseen:1;
>      };
>  };
> -#define _LOCK_DEBUG { .val = LOCK_DEBUG_INITVAL }
> +#define LOCK_DEBUG_ { .val = LOCK_DEBUG_INITVAL }

... for an internal helper macro it may indeed be better to have a
trailing one here, but ...

> @@ -95,27 +95,27 @@ struct lock_profile_qhead {
>      int32_t                   idx;     /* index for printout */
>  };
>  
> -#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }
> -#define _LOCK_PROFILE_PTR(name)                                               \
> -    static struct lock_profile * const __lock_profile_##name                  \
> +#define LOCK_PROFILE_(lockname) { .name = #lockname, .lock = &(lockname), }
> +#define LOCK_PROFILE_PTR_(name)                                               \
> +    static struct lock_profile * const lock_profile__##name                   \

... I'm not entirely convinced of the need for the double infix ones
here ...

> -#define SPIN_LOCK_UNLOCKED _SPIN_LOCK_UNLOCKED(NULL)
> +#define SPIN_LOCK_UNLOCKED SPIN_LOCK_UNLOCKED_(NULL)
>  #define DEFINE_SPINLOCK(l)                                                    \
> -    spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
> -    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
> -    _LOCK_PROFILE_PTR(l)
> +    spinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                 \
> +    static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \

.... and here.

Jan

