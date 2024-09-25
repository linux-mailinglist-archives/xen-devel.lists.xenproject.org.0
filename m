Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2734986274
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804166.1214990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTgu-0005WM-Hu; Wed, 25 Sep 2024 15:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804166.1214990; Wed, 25 Sep 2024 15:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTgu-0005U2-Ed; Wed, 25 Sep 2024 15:12:32 +0000
Received: by outflank-mailman (input) for mailman id 804166;
 Wed, 25 Sep 2024 15:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stTgs-0005Tw-MB
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:12:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b5e18c-7b50-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:12:29 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so9047746a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:12:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c4ff7sm1966498a12.71.2024.09.25.08.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 08:12:28 -0700 (PDT)
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
X-Inumbo-ID: 94b5e18c-7b50-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727277149; x=1727881949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TeSC6CxCA259MW2M9SaDdWXCxOGGvY+tGydSJFpmpjc=;
        b=dn2ihgZbZWTMkaVq6kUEoSx033cSA9foGQ/kpY2Y8eaomsATzTq7Licku5cqOFce97
         MNrZXnhnU3nmd8Qd6ZDXORxl+vXw+e79+bkMReGRZLAfe+upvIZk09qFJTyIE0f85atu
         8PMwAaAjr+C2D5Wm+2zVbvZ1+e6s+hJUcAnVzoN2jXmwinwDB/DWXwuyoOnkPjN6Zl6f
         3H7ZVEAwbILBpiglU/v0Nl5RDNc7JxejTY+3NlZ8FYXQBsGoguXyKZgBlhrzIOv7EsDt
         VwU8uLPgskFE50kphghCPauzfybOAfUIbyzDfDWqnjTz9s6BqVqpd4Gp+YRnqR6fZEaH
         y42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277149; x=1727881949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeSC6CxCA259MW2M9SaDdWXCxOGGvY+tGydSJFpmpjc=;
        b=QhqQ8AdB0vGOIBYd/fMvcgflUw7H9u73w9/v6j2Qc0zye/9fjXYv4VP+EjtOCxa3r1
         pj4Zkab0DSgfJC3t757Ew3YgNUVUJplF5AkOSmcChvi51+xFRkGkzkCKq/PSw5//144S
         ZzQ3RP7Bq/vmfdqaLVpJRCGsdHd78VX0s9u3U7wdV0krgQNMrz9yGfhMpXG1tSXbNNJP
         ZN//3XeUnymjDIDP3nKogLf55R5sNG7pj8r8sc48Zz1gjuCnOTMc4og1yCEkSR43j9zR
         fXfzd6R0QyFd9/EJVP3MkG0xKFKDwNA0kny2IbedQNJjojdhFRVhY+5fDfX75heVtbdz
         5ZoA==
X-Forwarded-Encrypted: i=1; AJvYcCV9sHdhokkRLK/FsGdS0SqSI5VwpZ1W7tC/Kd8hotPaND1YHxQqAOVXrzsBPs4cJet4piEQ7ndjXXo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5k4i8174X56tvAuc6YrZJBxZmV+SdGJ1QmuqX9n3ev2U4/T6E
	o2x3OXV5q1ONnKL4xsSPAVAyOk5zyuEOYIz9JwTPBonA6fXrq3Tgti3Y5zF/7w==
X-Google-Smtp-Source: AGHT+IEdgmitL3IcBvapPtsSmvpIk6mLIlHM4LijL4Yb8SIiuL9ql/MS8X9LuvF8Lkd2R48WJW9GNA==
X-Received: by 2002:a05:6402:51cd:b0:5c4:2b0f:feea with SMTP id 4fb4d7f45d1cf-5c72074ff30mr1790182a12.30.1727277148874;
        Wed, 25 Sep 2024 08:12:28 -0700 (PDT)
Message-ID: <9256b42d-fc9d-4a4a-b2b6-799da107bdbf@suse.com>
Date: Wed, 25 Sep 2024 17:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen: move per-cpu area management into common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
 <e573f9d46e7af0806381f6a41af00dc415bf87bb.1727185495.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e573f9d46e7af0806381f6a41af00dc415bf87bb.1727185495.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 18:42, Oleksii Kurochko wrote:
> --- a/xen/include/asm-generic/percpu.h
> +++ b/xen/include/asm-generic/percpu.h
> @@ -10,7 +10,14 @@
>  extern char __per_cpu_start[];
>  extern const char __per_cpu_data_end[];

Afaics the only users of these two are in the new common/percpu.c. These
decls want to mover there then, I think, to limit exposure.

>  extern unsigned long __per_cpu_offset[NR_CPUS];

The definition for this moves to the new common/percpu.c. Hence this
declaration wants to move to xen/percpu.c.

Overall with the generalization you do I'd expect asm-generic/percpu.h
to go away altogether. That is, ...

> -void percpu_init_areas(void);
> +
> +#ifndef PARK_OFFLINE_CPUS
> +/*
> + * Do we, for platform reasons, need to actually keep CPUs online when we
> + * would otherwise prefer them to be off?
> + */
> +#define park_offline_cpus false
> +#endif

... this, for example, would likely also better be put in xen/percpu.h in
the new model.

Jan

