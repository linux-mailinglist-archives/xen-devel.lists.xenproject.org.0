Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E364895726
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700176.1092880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfL8-0007dz-66; Tue, 02 Apr 2024 14:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700176.1092880; Tue, 02 Apr 2024 14:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfL8-0007bN-2u; Tue, 02 Apr 2024 14:42:18 +0000
Received: by outflank-mailman (input) for mailman id 700176;
 Tue, 02 Apr 2024 14:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfL6-0007aw-CW
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:42:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32b1bf8b-f0ff-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 16:42:15 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-341ccef5058so3844148f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:42:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ce8-20020a5d5e08000000b003433e4c6d43sm10732204wrb.32.2024.04.02.07.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:42:14 -0700 (PDT)
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
X-Inumbo-ID: 32b1bf8b-f0ff-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712068935; x=1712673735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbtDSVkRJlTre2HCv5Rz7a7kCOdzj45aT4SH9es8O+U=;
        b=Ql1WcBZoO45o+QBS7rVMGsbgbDBjQhw6ov8o3nwuuoUso5ImZn1glLYvX11fDf8YcQ
         BWzV5ZaPfs4x2iLnJVXZI+aTF6jAmFVPkMHZP4k5ubo4XQqDuhYkqWjCoXvVyLYxeYel
         33NleS/QK1OC9FG9usjmNBRbWUa9o/3ILYBBg7F3bib4N4aJV3B9GLlkb+dvucY3OQxn
         tG3Gt31Noj2sraKFnMjE/ZBBqbeXXcV5DssWu3hq7+b/sO5/nHHRAlnFpnSbJcJTOxsF
         Fn1111YBD6quBi46yQoi4jHBfY5MZCNx/yF+qr3p7lyx6HkZawmQgsnkCXq+GY4H+d0K
         OTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068935; x=1712673735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbtDSVkRJlTre2HCv5Rz7a7kCOdzj45aT4SH9es8O+U=;
        b=AIpgiTLPZ6VrC8rhIdcX5vDXLJoqMepO3kFDQSR/uADIAYCXDP0w+IWAiMbn5OZK7T
         8DyvLteLcCvDIVgZZhitACm6LwVeV1BTEfuwipzNCuaTJ1Z30+yBrnqVpfGmdWOw6Fjw
         GgMBOdKc7GI/hhM5LKgSheEqSyhKcIdlZxdn3jIqmTcTT7eVljbl8dLon6EceSoYO8a2
         AQ3ZcdpCKlQP7E22pqSudEsqfYK4BNYAOrSWFpX4Zu5kPuLBMA/wuOxA4TBD8Sh6uYTQ
         gHrtirq51a4wBWcpp1X214BTsYZQG2vGEMx6UzybIieBBxvinBVOnxZLzqIWOQXeZOLz
         QAFw==
X-Forwarded-Encrypted: i=1; AJvYcCWssLi2tOEPoAcz/VsuJhfYgQnHPq9ABPopWUufmu8G+aIARyzzy2dd9JjSJKxJ52bsmC/ECanvcrn+0dc2M4t4fWrEjYHz+X0bLr2GoeU=
X-Gm-Message-State: AOJu0YwHmiuZB5S1jcW2fMS4eWTKwp0cnB5ITp8ANpmnk1aJjp/5LPc4
	+tkwp0OoNiH0lczBZ+2YfQp0UWz6u3fIaAxwK9l5ym5uQWEcFxmXxqSXcMRYqA==
X-Google-Smtp-Source: AGHT+IEl5Vb2LDHpesJ16PkNSA0VtjulmPcX0CQ4/5ycXuFN1A2d3zYWFnhGWXfGz48OYt0KWjm4sA==
X-Received: by 2002:adf:f306:0:b0:33d:269e:132a with SMTP id i6-20020adff306000000b0033d269e132amr8985241wro.15.1712068934915;
        Tue, 02 Apr 2024 07:42:14 -0700 (PDT)
Message-ID: <6b5316a3-2920-4589-9e91-2de148c482db@suse.com>
Date: Tue, 2 Apr 2024 16:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-7-jgross@suse.com>
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
In-Reply-To: <20240327152229.25847-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 16:22, Juergen Gross wrote:
> Allow 16 bits per cpu number, which is the limit imposed by
> spinlock_tickets_t.
> 
> This will allow up to 65535 cpus, while increasing only the size of
> recursive spinlocks in debug builds from 8 to 12 bytes.
> 
> The current Xen limit of 4095 cpus is imposed by SPINLOCK_CPU_BITS
> being 12. There are machines available with more cpus than the current
> Xen limit, so it makes sense to have the possibility to use more cpus.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I have to say that I'm not entirely convinced of ...

> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -485,7 +485,9 @@ bool _rspin_trylock(rspinlock_t *lock)
>  
>      /* Don't allow overflow of recurse_cpu field. */
>      BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
> +    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
>      BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
> +    BUILD_BUG_ON(SPINLOCK_MAX_RECURSE > ((1u << SPINLOCK_RECURSE_BITS) - 1));
>  
>      check_lock(&lock->debug, true);

... the two additions here: The two checks we had verify independent
properties, whereas the new ones basically check that struct rspinlock
and its associated #define-s were got right. We don't check such
elsewhere, I don't think.

Jan

