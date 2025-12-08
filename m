Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7748CAD463
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180522.1503695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbLd-0005rd-Mo; Mon, 08 Dec 2025 13:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180522.1503695; Mon, 08 Dec 2025 13:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbLd-0005pb-JD; Mon, 08 Dec 2025 13:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1180522;
 Mon, 08 Dec 2025 13:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSbLc-0005iU-T7
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:32:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef5bbe7-d43a-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:32:15 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso36816525e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:32:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310ca502sm251176985e9.7.2025.12.08.05.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:32:13 -0800 (PST)
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
X-Inumbo-ID: 4ef5bbe7-d43a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765200734; x=1765805534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjjzRqp8kNsrKWcYj+HM6mx3RmDo4z8EJs0JNu+iAvk=;
        b=VvRqlA9gDHwMv3cXl/rcNTjIr4qW0SPoBVcKQpbQL4x9QtTGrIoFqoL9dCmM5Q9P+T
         7MG2Iyz2IFfke6Xqt31g7IkdASielgmfAcofkW2swZtANPXgpfbXg0s2rHAI4inGUxTX
         wM6ncm+RahW3S77rXXV+Nul65f17KScuYuvN36b3BRQWQWJKGIrUSiwzWMLOK6/Th/wP
         raqaxeLEbwQiOWXT9QJoLw/TDIbM8aYbDmNUuvvEN6PZuTI8x+g86x2ItnNocvu/uvOV
         b+fAgJnxv44qA5oKtbu+4ZNAXVjx/g7hbUqEU0tcOxlSdsVaw0H4SQlTIPgotPw0UGgq
         qtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200734; x=1765805534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjjzRqp8kNsrKWcYj+HM6mx3RmDo4z8EJs0JNu+iAvk=;
        b=CrQO7U9mAnHDhrGSh3LI49H5YBHcmw8x8LhbL9C3GtweQFykSjzFUSVH80eBz9+iEp
         Q6+wGcRhwYh6GhWZUZeUlL8qV/EaX9f/HtixY4y4yb6lIwJzZrOsb79z/pepCv3+Zb4F
         st3y+PTE3vv5XoUrEvDEktl+h5SWlKLGz/k/1Rh9/9qeb7FcchjzwixqnJm2EqH1nEr4
         V5Wh3OKkAC1UNag8SZi+X2wJ2Oi+LhetCty4gSvv9RhlI9leE7g4PtV5038geBA73izL
         UkDnphojM87DnP/CoVvC4HlQ2f3NGk99wQWU1nmz8c9XzRKh2489+cmfFCxxis4qYd1L
         oB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUDff0eEbA3o2vzn3MyFOXGSM9ux8mkviZsDcvrRzeKwCrdQvR4/AO5hKVIJYoXUHwvp+LJncXw18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6wtM0z/2DB8iksmWbYl2deBfTF4U1DvhxaiOp254lo7S+aE5N
	AefDTPUl5Q5ztSZd0ZppJcA6JpYDA7CJH1lefHuH8tXqkbb7CzARDYWZcfkrOkr8OQ==
X-Gm-Gg: ASbGncsWRssrafPnaMsyqYQ5MqKkkGJiWHXmsmvEGrTcdb0++dPkwz5Lz386L9xDYaK
	hGcz06pNcVNbJcXArxi0H4uChDYQ1HsxIIhpe5p5U3z0kdv8cRBGoT/Oj4CN9wiPS+DN8Aqe7ru
	WAGgY0lvz02C0kDzGxv8c8ksL9NGeUpNawCRKbHBUlda8pa8qaAYQI77qNbqEbx34356TL2G51N
	IedNohE/Gzk04IAL8PPDi6vm4ir2ZsBMrZklH2W9IrB/U9Y1WIaSPcXpcdJ/QVMJozocFOtrG6Y
	E66zGSWhMzRHzVyEEK9Hwe9i+xwThAcxBa2uYqrUeNi3/BneUlIjicNUIcrQm/T++5tbdoy8JS0
	9ztt3LJnvL2xmDQ/wfXllYw4yyPQeKvoPAgOj6Hon0riLIJ6ukYNVG6Q/5ZzIXMMSz11q39czrJ
	PtVrIxlRIvKiFtto2a3wGzfog+X2WKrTvbXW9NaLu3BZI1vMT5QwElpmSHHG6wcRl1S+k+sdi1C
	Rs=
X-Google-Smtp-Source: AGHT+IGExjfEGhKzbzueB8+lWb3X3whSty/YvulORbnmgUwmjMOK0/fBiyVSb5VeEASD4m4jhuswyg==
X-Received: by 2002:a05:600c:4fd6:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47939e1deacmr85222595e9.16.1765200734077;
        Mon, 08 Dec 2025 05:32:14 -0800 (PST)
Message-ID: <ac0b7706-ceb4-49c0-9147-250055b4cf6a@suse.com>
Date: Mon, 8 Dec 2025 14:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] sysctl: align handling of unsupported commands
To: Milan Djokic <milan_djokic@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <6c7cc11e3569f69b185d32809d63b8cdca67aa25.1764961645.git.milan_djokic@epam.com>
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
In-Reply-To: <6c7cc11e3569f69b185d32809d63b8cdca67aa25.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 21:36, Milan Djokic wrote:
> Handling of unsupported sysctl commands currently diverges: some commands
> return -EOPNOTSUPP, while others fall back to generic -ENOSYS.
> 
> Unify the behavior so that unsupported commands consistently return the
> appropriate error code, allowing the control domain to correctly identify
> unsupported operations.
> 
> Using IS_ENABLED() macro to identify disabled commands, allowing
> dead code to be removed at compile time.
> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>

Overall quite okay imo, yet there are a number of small issues.

> @@ -170,19 +173,22 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          op->u.availheap.avail_bytes <<= PAGE_SHIFT;
>          break;
>  
> -#ifdef CONFIG_PM_STATS
>      case XEN_SYSCTL_get_pmstat:
> -        ret = do_get_pm_info(&op->u.get_pmstat);
> +        if ( !IS_ENABLED(CONFIG_PM_STATS) )
> +            ret = -EOPNOTSUPP;
> +        else
> +            ret = do_get_pm_info(&op->u.get_pmstat);
>          break;
> -#endif
>  
> -#ifdef CONFIG_PM_OP
>      case XEN_SYSCTL_pm_op:
> -        ret = do_pm_op(&op->u.pm_op);
> -        if ( ret == -EAGAIN )
> -            copyback = 1;
> +        if ( !IS_ENABLED(CONFIG_PM_OP) )
> +            ret = -EOPNOTSUPP;
> +        else {

Misplaced figure brace.

> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -92,7 +92,6 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
>  #endif
>  
>  struct xen_sysctl_perfc_op;
> -int perfc_control(struct xen_sysctl_perfc_op *pc);
>  
>  extern void cf_check perfc_printall(unsigned char key);
>  extern void cf_check perfc_reset(unsigned char key);
> @@ -114,4 +113,7 @@ extern void cf_check perfc_reset(unsigned char key);
>  
>  #endif /* CONFIG_PERF_COUNTERS */
>  
> +struct xen_sysctl_perfc_op;
> +extern int perfc_control(struct xen_sysctl_perfc_op *pc);

Why would you move the function decl, but duplicate the struct forward decl?

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -7,6 +7,7 @@
>  
>  #include <asm/system.h>
>  #include <asm/spinlock.h>
> +#include <public/sysctl.h>

Why would this be needed? It means effectively the whole codebase gains a
dependency on this header even when DEBUG_LOCK_PROFILE=n. Yes, you may
need ...

> @@ -40,8 +41,6 @@ union lock_debug { };
>  
>  #ifdef CONFIG_DEBUG_LOCK_PROFILE
>  
> -#include <public/sysctl.h>
> -
>  /*
>      lock profiling on:
>  
> @@ -164,7 +163,6 @@ void _lock_profile_deregister_struct(int32_t type,
>  #define lock_profile_deregister_struct(type, ptr)                             \
>      _lock_profile_deregister_struct(type, &((ptr)->profile_head))
>  
> -extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
>  extern void cf_check spinlock_profile_printall(unsigned char key);
>  extern void cf_check spinlock_profile_reset(unsigned char key);
>  
> @@ -360,4 +358,6 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
>  #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
>  #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
>  
> +extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
> +
>  #endif /* __SPINLOCK_H__ */

... a forward decl of struct xen_sysctl_lockprof_op; I don't see what's
wrong with doing just that.

Jan

