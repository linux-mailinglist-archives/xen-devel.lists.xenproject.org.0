Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C97B27FEB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083353.1442979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtQL-0001V5-8r; Fri, 15 Aug 2025 12:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083353.1442979; Fri, 15 Aug 2025 12:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtQL-0001Se-5K; Fri, 15 Aug 2025 12:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1083353;
 Fri, 15 Aug 2025 12:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umtQJ-0001SY-F6
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:20:43 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42626df7-79d2-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 14:20:41 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b73bef3so3269158a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 05:20:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9e042fsm1381178a12.27.2025.08.15.05.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 05:20:40 -0700 (PDT)
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
X-Inumbo-ID: 42626df7-79d2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755260441; x=1755865241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IihHkFiwVS08R3oZ9R55usIUU0voPkzswi1Iu31kr/U=;
        b=IDPgRnoSOskhYWtU1yaeF3y1kf86s/45UC06UCpsEddUW4cVNtSnjEry1r0SLrO9Tu
         3aLiwtDfx9csjZeMTC3NpB/S1mLz3C3NoH1oCRp9wlFa0osQc1Df2qVfrSo4+gdhkkp8
         DZgUR8LlZGZY6UxqeUlJbv0UllgkmDkgBbP+q2MCxGh5+cTcgy1Yg207TCFmHIz4cQhB
         iHlTyNubgXkmWyGsq8RTZwYUoIlnwmtmwprXUPYqv47j5fOhJ9ByuFyUNGIui9R4Q0UP
         V3308AogjsSfAS2DAfXdTH/UHPKRSwypX5RwRijV7gJ7C6JQaUFbbKm/h9Nibvh16FR7
         vqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755260441; x=1755865241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IihHkFiwVS08R3oZ9R55usIUU0voPkzswi1Iu31kr/U=;
        b=FRcnBEpPfI1Y/v2xCu5OF8LR4g2tONaSW98thqUngByhcSBZI7J92MsbvffO3hcitc
         87qE2s+817AtZcusE147p2ijYz+Z0ZlLorUqVNPn3E9BzUKaLp57y1wwvDFqMtpsuz2l
         flGgGNILX8WNmLmv7uLgM3IuFkm9mVSjB6RzuuLJS3lEQmXSAV+mdFZ3lrZmm6DLFEL/
         leOIe2Cw69NJ5BlxzHoneDWd020Xv5R+cqq77a2kVZBv9LNHrkavf7ezOVHpE30rlN/X
         +iM1rXvWgHIZw+7a037w6Ooyovx2HZusw0YOePvIA48eFzFBw0KutgIdhFnwMVyPtLNX
         D+SA==
X-Forwarded-Encrypted: i=1; AJvYcCUhS67o3Y1irnm/aIsaLlrNZqoNr0q1OiPtRxJcblpBp7Fkm0BJj68vVDeonpwRQTYcWZ8KBRcQlPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwioSZJDNtOBNZTVIlRBlaLyChw+EH/qbPRbKSXv6XnwTDG+Gem
	cmtx5ES+KluvJ05BEUji8N0dTS3jq4+PaJp2ajBME97T3Qq/kIxZc9xIB73t+p5XwQ==
X-Gm-Gg: ASbGncvgnantnDKe1yblIZAFUvuE+vtLoG1h3wEtidQVn+g0i5rgHvR6SQxBMb2B7eO
	UnoEs2z5CwF7gxWUluru6cYQZtTzDPQzAbGeEbHLYWRAZsBh3FsbU5C6I9y52EjdwtxYICCljK2
	gSIVGWKlk/KPYNCgUeCt2LtK09P9BSZpaNrr2yhnrjM1sqYS/36WyWpsw0l+KEnPytpbFZJb2Zn
	RrOUZ8R/L1q8MCmqAOUtbmDPDh7HmaLGEfU10uzpL9N+4LrcnVhuezqBxWun8+ei3jJjtJTet+i
	wHewDGqR9NRj4a/eBKoj38LGLaANT4oVlzovX1qPD2UscDHQ9g2u6yIZbNxlCg6TyZKkPPZuHTw
	yeFPdOQbH1PBqOp1z0vGckQHmGm4tJKcTHC3IZRBNjaC9AFYdQi/ZkIyg84ch2LcXIrsatalhcE
	USkUcYc7E=
X-Google-Smtp-Source: AGHT+IGt02WTlqu32dUIC4+gQLzLODcKMxQkhh2uFGkz3/WzNh+0rbmtSNz/xeH2oYccB9hnSufxug==
X-Received: by 2002:a05:6402:3595:b0:618:1cc6:8e75 with SMTP id 4fb4d7f45d1cf-618b051058bmr1396098a12.14.1755260440780;
        Fri, 15 Aug 2025 05:20:40 -0700 (PDT)
Message-ID: <de3fa546-1ef8-46f6-85e9-4902379bd435@suse.com>
Date: Fri, 15 Aug 2025 14:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 12:23, Sergiy Kibrik wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
>  Specify a maximum amount of available memory, to which Xen will clamp
>  the e820 table.
>  
> +### avc_prealloc

In addition to what Andrew said, please prefer dashes over underscores in new
options.

> @@ -97,6 +99,9 @@ static struct avc_cache avc_cache;
>  
>  static DEFINE_RCU_READ_LOCK(avc_rcu_lock);
>  
> +bool __read_mostly opt_avc_prealloc = false;

__ro_after_init?

Jan

