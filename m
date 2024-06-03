Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3F8D7BB2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 08:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734709.1140789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE1LY-0000QE-Cm; Mon, 03 Jun 2024 06:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734709.1140789; Mon, 03 Jun 2024 06:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE1LY-0000OZ-9f; Mon, 03 Jun 2024 06:39:08 +0000
Received: by outflank-mailman (input) for mailman id 734709;
 Mon, 03 Jun 2024 06:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sE1LW-0000OP-2T
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 06:39:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83d07f6-2173-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 08:39:04 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4214053918aso1007565e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 23:39:04 -0700 (PDT)
Received: from ?IPV6:2003:ca:b724:4976:f1a7:a03d:19f7:6554?
 (p200300cab7244976f1a7a03d19f76554.dip0.t-ipconnect.de.
 [2003:ca:b724:4976:f1a7:a03d:19f7:6554])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm87334765e9.19.2024.06.02.23.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jun 2024 23:39:04 -0700 (PDT)
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
X-Inumbo-ID: f83d07f6-2173-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717396744; x=1718001544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+gwXNTmVLAa7vhmk1oIbqvl3xm4vuSNEUNLAMuUQKg0=;
        b=ggTGG4yyt3Ceo6eRSGyuYyrvhB57yfe5+ZWJ/ZW4nxJ8adMZT5JjRySlUcdFsfuvUS
         /wq9iOltQadKa6J4XGqYSmhFGDtxG37GgiEYhUIz0I8DuB8qjzbehNLWRYdb0xnQxtCK
         pbZfrxGh14MQFao1Ijld1x6Z5Omx+4XLPExmHl6BDMZoBYCgf+dyBvZM9cgI8mIWroNQ
         c3i0SuC3ODBLlLq6yu36prWc9Cl2KAk1OQ7neNhw2l2jLnh5cvyPXN48B+HoTI/fCBxB
         BSrpdXQs2gFDQhI68k2A5wb40Z6AQw1pbYBjm0quqTzk6eGZgEAKIUjqEM5+VKb31CTz
         FlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717396744; x=1718001544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gwXNTmVLAa7vhmk1oIbqvl3xm4vuSNEUNLAMuUQKg0=;
        b=Vb4BRh8lRKAr0RlCjDo+ltExa/nfSi8zwOZ3bEF5wnR3xeaOMBuR1aJT90+zE/NVRl
         2+6rU0+3/GRbbrxL1ssQUi9/qi4NOuoijfTBCd+OHkb3vQsf2VjU6eqx44xy3jqIwRQK
         B2mIHExOkmVFDNJ+gUzRH8Eg6Jf9/Vu/wwlRUaSlrNQvGnE3fariAnwS4eopTwwCcLOo
         r4QcRyJ1z/g5VBlvYifKbrB+hf3Af+LXZxAyFZ757oTfA+wPZc419lkrzBqUcz6X4nB/
         H6AwBmvPEyDhUQioomYwZbszctxbCZzir0qYu5M4l4PrBw9lxnEAJ46xOrgfHkhKTAai
         2N8A==
X-Forwarded-Encrypted: i=1; AJvYcCUYSJ1coR3xbkxhKYxYfzqlEbnLsOwBJHsL3okhx0hZNz06046vdx+u41Lq82PQHpbwdVWKP1dkIohn56akCAe3HoE44CaKH93eIqSlLlY=
X-Gm-Message-State: AOJu0YxWdxtcdeedIkv8K+eKEAG3O1Pro3Ii385YfGrC5shWATbsv+p5
	FQicfD6NkTawnIufCXDLIt9/oj/EkAY8iFfr+0ZKo3YJuWgJsvzttPoUOlVxKQ==
X-Google-Smtp-Source: AGHT+IErtBKJd+0Ba8/0fEpydosf1FEzPcjnkuwyuntfZLcwowk40vtqCu3DuSeGV2O6Cr8TnxqJXQ==
X-Received: by 2002:a05:600c:1d85:b0:421:2efe:5aa8 with SMTP id 5b1f17b1804b1-4212efe5bebmr63862185e9.18.1717396744231;
        Sun, 02 Jun 2024 23:39:04 -0700 (PDT)
Message-ID: <7e96b887-8fd3-4ecc-a23c-98a46ea1aa8c@suse.com>
Date: Mon, 3 Jun 2024 08:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/5] xen/domain: deviate violation of MISRA C Rule
 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <843540164f7e8f910226e1ded05e153cb04c519d.1717236930.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <843540164f7e8f910226e1ded05e153cb04c519d.1717236930.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.2024 12:16, Nicola Vetrini wrote:
> MISRA C Rule 20.12 states: "A macro parameter used as an operand to
> the # or ## operators, which is itself subject to further macro replacement,
> shall only be used as an operand to these operators".
> 
> In this case, builds where CONFIG_DEBUG_LOCK_PROFILE=y the domain_lock
> macro is used both as a regular macro argument and as an operand for
> stringification in the expansion of macro spin_lock_init_prof.

The shouldn't the marker be on the definition of spin_lock_init_prof(),
rather than ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -632,6 +632,7 @@ struct domain *domain_create(domid_t domid,
>  
>      atomic_set(&d->refcnt, 1);
>      RCU_READ_LOCK_INIT(&d->rcu_lock);
> +    /* SAF-6-safe Rule 20.12 expansion of macro domain_lock in debug builds */
>      rspin_lock_init_prof(d, domain_lock);
>      rspin_lock_init_prof(d, page_alloc_lock);
>      spin_lock_init(&d->hypercall_deadlock_mutex);

... actually just one of the two uses here (and presumably several more
elsewhere)?

Jan

