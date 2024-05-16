Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1158C78D6
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723437.1128303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7cbM-0006SK-U1; Thu, 16 May 2024 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723437.1128303; Thu, 16 May 2024 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7cbM-0006Pm-Qn; Thu, 16 May 2024 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 723437;
 Thu, 16 May 2024 15:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7cbL-0006Pg-H8
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:00:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19893287-1395-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 17:00:57 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-574bf7ab218so3945861a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:00:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f78sm980320666b.133.2024.05.16.08.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 08:00:56 -0700 (PDT)
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
X-Inumbo-ID: 19893287-1395-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715871657; x=1716476457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc44owd5c/D2OxMYl0HxeeYTTxhG+6KI2hLgPGk6oxs=;
        b=Tj4deZd+xTv+Jj6mS2zLy4wU3iOoh5N7t6Chx7TnQgWyTSw438ZUggbrhzh5lNktu6
         Yu34qw5cL+mrL/4q9BbyI1D8hKDq5j6jrJNaeTyubfjCZ1zs+xrbEOxUWJqLvwvf0dSp
         PV54jHWg9zVEay/n67bkWx3dZRPZbFfp5mDUZVPC8w49843Kntv8uj9waguVzPvHdY/A
         bl1GoBi9xfm+DeDSh1RNOZ2SY6XCcspwsatm7jBM0iiJCJqp7/MMy2mUSYeJZE9GKFGd
         C3Fo0e7yuoQUXOueviq3TJ+91YKKuhm3mwYKYnFjJTUwLNlAh3oCdw09wi2E6kPMCnIr
         aGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715871657; x=1716476457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc44owd5c/D2OxMYl0HxeeYTTxhG+6KI2hLgPGk6oxs=;
        b=jlfYbuzJnUnu+yyUlLfvRb2kP0B0ddKakqeFpXogE9svqhaAgGGPOunj7ChbiLK7jz
         PV5jZ+MtT0TFBrlN0Yqo3Y8pFL+AM/DdMcoXWQQXbpY76sO5FQFuX4knhDHw/P8UMW/F
         p3edAhkddcr7yX/9WmzJZE8cSF+seArSmrxt4KVrdRXJpIPvTe8bAI4hZZ8yoonnqina
         Ye7nJexZK4CwI9E8Qm7D4esV/Sfa/Zqz2DLsKhcK5dK003vM2ionRyhtdzkJfgvB85ZX
         ElLcCZ8cRdGRlHM3FYcaEuR/jmMdfC8yGWQf5pG6m+rlXzVHUeZQw7NSrgBoEkyx0omR
         oY5A==
X-Forwarded-Encrypted: i=1; AJvYcCUlXJwc3JeHXVGN2bwnLzicW1BBt0O3tPPJmDjsBCdxrhpCtrCFg8srWGKYkIMJ6pnzVGgj+h2OSFk2li41Ddkg+cwxWE8TUoEn3OOz1sE=
X-Gm-Message-State: AOJu0YxGbQpb0RHQUQ/EDxh7ERt+/NPv3b3ebMNNbMokPloknvZL7WL+
	N3B4xZk8YQUbQHKUpEAxEHLNSt0IyKoKHRh9/WU4IBVjx1fwSnaBPfhpcspXaA==
X-Google-Smtp-Source: AGHT+IHq5qqWkWy9RKnJcvVn80s1LOCXbHvz8i0h4fo7ygXwskAR3puJy3aBHkjNphyGztQm8sa1lA==
X-Received: by 2002:a17:907:76d3:b0:a59:c7d7:8b0f with SMTP id a640c23a62f3a-a5a2d57a717mr1165649666b.29.1715871656707;
        Thu, 16 May 2024 08:00:56 -0700 (PDT)
Message-ID: <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com>
Date: Thu, 16 May 2024 17:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240516132224.86005-1-roger.pau@citrix.com>
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
In-Reply-To: <20240516132224.86005-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 15:22, Roger Pau Monne wrote:
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2527,7 +2527,7 @@ static int __init cf_check setup_dump_irqs(void)
>  }
>  __initcall(setup_dump_irqs);
>  
> -/* Reset irq affinities to match the given CPU mask. */
> +/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
>  void fixup_irqs(const cpumask_t *mask, bool verbose)
>  {

Evacuating is one purpose. Updating affinity, if need be, is another. I've
been wondering more than once though whether it is actually correct /
necessary for ->affinity to be updated by the function. As it stands you
don't remove the respective code, though.

> @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>                  release_old_vec(desc);
>          }
>  
> -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
> +        /*
> +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
> +         * that's all covered by the requested affinity mask.
> +         */
> +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
> +        if ( !desc->action || cpumask_subset(affinity, mask) )
>          {
>              spin_unlock(&desc->lock);
>              continue;

First my understanding of how the two CPU sets are used: ->affinity is
merely a representation of where the IRQ is permitted to be handled.
->arch.cpu_mask describes all CPUs where the assigned vector is valid
(and would thus need cleaning up when a new vector is assigned). Neither
of the two needs to be a strict subset of the other.

(It's not really clear whether ->arch.cpu_mask is [supposed to be] a
subset of cpu_online_map.)

If that understanding of mine is correct, going from just ->arch.cpu_mask
doesn't look quite right to me, as that may include CPUs not in ->affinity.
As in: Things could be further limited, by also ANDing in ->affinity.

At the same time your(?) and my variant suffer from cpumask_subset()
possibly returning true despite the CPU the IRQ is presently being
handled on being the one that we're in the process of bringing down. In
that case we absolutely cannot skip the move. (I'd like to note that
there are only two possible input values of "mask" for the function. The
case I think you've been looking into is when it's &cpu_online_map. In
which case cpumask_subset() is going to always return true with your
change in place, if I'm not mistaken. That seems to make your change
questionable. Yet with that I guess I'm overlooking something.)

Plus there remains the question of whether updating ->affinity can indeed
be skipped in more cases than it is right now (prior to you patch), or
whether up front we may want to get rid of that updating (in line, I think,
with earlier changes we did elsewhere) altogether.

Jan

