Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87459B19D05
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068876.1432739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiq4j-000674-Qd; Mon, 04 Aug 2025 07:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068876.1432739; Mon, 04 Aug 2025 07:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiq4j-000654-Nv; Mon, 04 Aug 2025 07:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1068876;
 Mon, 04 Aug 2025 07:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiq4i-00064x-6m
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:57:40 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0621242-7108-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:57:38 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so9047360a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:57:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8efffa5sm6352789a12.12.2025.08.04.00.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:57:37 -0700 (PDT)
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
X-Inumbo-ID: b0621242-7108-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754294258; x=1754899058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MfvF4myRl9OGefF3nwNHUkjGFs4EEnO3ZCbH4ezUxEQ=;
        b=KgUCICyk0riqk7Adt3Upxnp11gNKDscag1lfnSva08gnxyuTaMrupaUsZcAnsAfZ54
         hUedUBlgakGh8ctWVewo+8UAJqucOwqBRSO+zUDzMZTu/u9LVqbzFdlC1cwOP0MmwSqi
         ont+T7HnAVxkVsV2AnTJlFY2E6qD9c0ZEZ0gfDRO1sEvGrTMnRRQJh4iNswfwBTdYypH
         YQ/dhGN3GZKewii1bvhJckjq9wWRhkQiQjs1hlfLB9/dAhTy68ochcvY1/hdXMl8zekQ
         2DK5spbzzWs5flDv/Z7893PoFqKcSDtBkmZ4QBN60dir2MOI6mFp8ycFL4pdeaReEXi8
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754294258; x=1754899058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfvF4myRl9OGefF3nwNHUkjGFs4EEnO3ZCbH4ezUxEQ=;
        b=K8DeugOM6QRVh1CsPJnZfXQFgokfosLiszNWlvQfdRDLCrjxL1OnH8sRkqfh3Yp6D1
         kKXufQvyETqp3+nde3erdXl9PgDblJh3YCL4jVIUV0aPNGR5mLRcM3dZSdKLF8imgbi6
         HI4awwlPPxCpJNjHYOwxDOT4bmNAWjEYKL8LFbRDZdTYzCt7Y3otteez1+s0HONwNSLc
         OxhQQoMZyWU4Q9We2RAzC8+pBhbOO9dDgJbrnLA6sT6gHoYNkBd4YSyQBsnx2A9yCra1
         bVmC1S+DB5txFWS9Fo4308lwCafXopY0MGkLhBm0PvHwCmjojs3x6p0FaYpSZocPMKFx
         fQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqoDfYF9eIwgv4/NnM0eGXLrmWHA6dr62U21zhMHohcy/4kCeQJjuya16y1BbHhxYjvcZumkfaKck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxeOrAxF/N7rz8vL2vCruwyit7Ata6uJ0S85lWF0fAIaUbDkad
	uaJ/EgCwH1pxdhFgJAIUhnFKopQEAl+wiJGFiXx2YzcJZhsi9T/XqLeFl2GDdBhaPA==
X-Gm-Gg: ASbGnctSXIdS4ClcIm6ZEnfnLzEdybL3eUtKiTzHXigl2TyUd+e75e56Va/j/NF5BL4
	+chdU7wKzn/IwIuuTyZESCerzA+EL8LILeg2Q+39vcCeJKaAx36hWXmRi8/bjwTq6HM54UsDYjd
	alxa/L6Ndj8sb6f4hJAGEcV4ocmSWCkp9+fAfmidLA+29HQBUZhzS3Lm7jmfUZNzR6OzOYJTivl
	vZLHkKy0bW8ZWUs2XjlFXhTvbPVrCyn5gYNtqQoxGJyUcp2Gc3r1+439BEp+ZM419OocdMKzung
	G1sC/+f4+pzBt2UZ+Zf8VMP3vxXsSc2CHCep1rrSBNQrgH57f/hBmAiEadK0Oq9ewOIDtWD9zTZ
	xiIYvKwoblbsMKhX/6kT4eh9CpN3uBzq+I0t1NbayKuibuk2n9qhl0FnfxRmkmzagkjCnUMxyaV
	DIEwuntzc=
X-Google-Smtp-Source: AGHT+IFdwf6cdCV1zGsA2CO75h4I88SRacVtUGrg1YIQQuezJf4EcvFycoLvEMkKYUTXl1S9NKBfWw==
X-Received: by 2002:a05:6402:13c9:b0:615:8b65:bfb6 with SMTP id 4fb4d7f45d1cf-615e5e5237amr7783767a12.13.1754294257645;
        Mon, 04 Aug 2025 00:57:37 -0700 (PDT)
Message-ID: <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
Date: Mon, 4 Aug 2025 09:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250801202418.38977-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 22:24, Stewart Hildebrand wrote:
> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>  {
>      struct sched_unit *unit = v->sched_unit;
>  
> +    if ( !unit )
> +        return;
> +
>      kill_timer(&v->periodic_timer);
>      kill_timer(&v->singleshot_timer);
>      kill_timer(&v->poll_timer);

What if it's the 2nd error path in sched_init_vcpu() that is taken? Then we
might take this path (just out of context here)

    if ( unit->vcpu_list == v )
    {
        rcu_read_lock(&sched_res_rculock);

        sched_remove_unit(vcpu_scheduler(v), unit);
        sched_free_udata(vcpu_scheduler(v), unit->priv);

and at least Credit1's hook doesn't look to be safe against being passed NULL.
(Not to speak of the risk of unit->priv being used elsewhere while cleaning
up.)

Jan

