Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098ABB00057
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 13:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039356.1411208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpGa-0004Dm-E4; Thu, 10 Jul 2025 11:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039356.1411208; Thu, 10 Jul 2025 11:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpGa-0004Am-B8; Thu, 10 Jul 2025 11:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1039356;
 Thu, 10 Jul 2025 11:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZpGY-0004Ag-V5
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 11:16:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e31466-5d7f-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 13:16:36 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so507262f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 04:16:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4347d82sm18729395ad.197.2025.07.10.04.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 04:16:35 -0700 (PDT)
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
X-Inumbo-ID: 57e31466-5d7f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752146196; x=1752750996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FoJRJcfQC6lTZDtEs4NCF6zdRTJ3COx3tyNq9uaifrY=;
        b=NEWS3LsgBOtESfJtUp9aDzG0uWpj3bDiD7j1RJ0N1trhVFj2/FOwSCXSdarHKwU34N
         yxKyZcSCqxIWhTo4LFwkdPgFPWxfpukwu1+EU6IlljwVThcpQt09htA2U9sbcNbADdXY
         hwjgpVgUQtAuBWkChEcw/8OIew1uAmP7p5K1erAlLO4nQ59A3uskwCDSYsOrcbxHkNMe
         ze9ykY4WqO5dSClXg0Bu15Inm471eF6Id9eEZ26fRCLJr4y3Klv7TlVLsb8fDB1QlZrj
         7qMbt1CkTElnUvoKjZwNJKu02Vom3F7fiCLjkiSBOQl2H2nK9TS1bnVhkCdlm+BhF/9k
         rCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146196; x=1752750996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoJRJcfQC6lTZDtEs4NCF6zdRTJ3COx3tyNq9uaifrY=;
        b=OVzxZNBVDA5WuQ81Q8RXeltHPVexvaI/PM7Ns1Vdx6+oh73uAFZ82tcszYAhbCPPYF
         n6hb6xypwnipe/e6LarqUxZTupPBVvRyghOjjw6jejEVWA9Lao/HvFSQfhnVTcBwESHA
         /GWr5khla8K4haO1XVxfye6sMqH/aUz/DFLjOZsyrwUOv/dTwVXxTtLsKz+i2XBHuCTH
         IdlgGsRbmTYnwlhKF2J1R3Z1dZ7d3MNx5iAdMxy2VecytOFUzhbIP57IQFZ2CXjESD8D
         0Ie9bDcCMvv6cG9FkQ6TQV1xB2rrjLOclkgwuekXPTqnSNI0sEp1IjeCpKBZLY1J2veJ
         MdIw==
X-Forwarded-Encrypted: i=1; AJvYcCU0dO7FiTMc8c2YENcpywZo8Te9tdWFLUqia9EHyCgYhOsJxypFIdz5+KUX97BIJU1u/odQbZvWqTo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvqlKncA9sssIhIa8CdqvR4j48sCXCenqKvCtGcWSKqr46QKhv
	0jj5lIPF2Y67Pfhwxf9h3YjQEUgb3amzyzh6Prg/kA/DCFQkDGDXh9NE+VOKZi4Ryg==
X-Gm-Gg: ASbGnctJvSruvhDZKI2/pNtZ4DyehHUMyxGoKfKUcz7kWawV9fORnq4ClNQ4geDZ8wN
	J5vGtCCqHzamtY2eQcU9hT0rduWbi8J/WEb8sOIQWf1PflOchbKzHcEyoIS5jTYMSna6Gm5p4c6
	aQo2PCzN4zD3DD48u70v7qBTIpbgMTErzKDd7j8k4TKgsbSdIhI9RQxSb0fcpUnIdmyoJrJBB0L
	/ltNrwQQZXQ+eo+Bl5L768GOKmON+q7eQZv0KttLyakZcKgKox3ly/QYAUU4L3JWp6R3um8H0U9
	EmONtX7eve0WuHBIAFDza2SybwpRW8IMGbOPWVtwe5ct35KVNqpE8BvcWZr9aozsYIsLf7lJnET
	6wp6SRfzs4IGkQUI541QNAT2wlh+ms4psNHSwRFjpGPTDGIo=
X-Google-Smtp-Source: AGHT+IHjyvrJ5X9E1CFnGKHSQAkiwS69nefxm7BE1g6WUmGrlIoaWRKCOw4u0E2i/goLmRpaljrYvg==
X-Received: by 2002:a05:6000:4b19:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3b5e4545b8dmr4298570f8f.58.1752146195981;
        Thu, 10 Jul 2025 04:16:35 -0700 (PDT)
Message-ID: <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com>
Date: Thu, 10 Jul 2025 13:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250710013421.2321353-1-dmukhin@ford.com>
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
In-Reply-To: <20250710013421.2321353-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2025 03:35, dmkhn@proton.me wrote:
> @@ -877,6 +873,16 @@ struct domain *domain_create(domid_t domid,
>  
>      /* All error paths can depend on the above setup. */
>  
> +    BUILD_BUG_ON(DOMAIN_CONSOLE_BUF_SIZE <= 0);

While the "equals 0" case can in principle happen, the "less than" part
is dead code (and hence this needs checking differently): The type of
DOMAIN_CONSOLE_BUF_SIZE is an unsigned one, so wrapping through 0 will
yield huge positive values.

> +    err = -ENOMEM;
> +    d->console = xzalloc_bytes(DOMAIN_CONSOLE_SIZE);

As previously indicated, new code ought to use the xv*alloc family of
functions, which deliberately doesn't include any ..._bytes() forms.
Note how instead there is xvzalloc_flex_struct() for situations like
the one here.

> @@ -371,6 +373,26 @@ struct evtchn_port_ops;
>  
>  #define MAX_NR_IOREQ_SERVERS 8
>  
> +/*
> + * Domain console settings is the dynamically-allocated data structure.
> + * Using an even multiple of a cache line size may help to optimize the
> + * allocation overhead.
> + */
> +#define DOMAIN_CONSOLE_SIZE     ROUNDUP(256, SMP_CACHE_BYTES)
> +#define DOMAIN_CONSOLE_BUF_SIZE (DOMAIN_CONSOLE_SIZE - \
> +                                 sizeof(struct domain_console))

But you're aware that there's allocation overhead, which consumes part of
a cacheline? I simply don't understand why this struct is so different
from others that such cleverness needs building in. Yet if it's relevant,
it really needs doing correctly.

> +/* Domain console settings. */
> +struct domain_console {
> +    /* Permission to take ownership of the physical console input. */
> +    bool input_allowed;
> +
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    unsigned int idx;
> +    spinlock_t lock;
> +    char buf[0];

Iirc recent gcc warns about the use of this historic gcc extension, since
there has been the better form using just [] for quite a long time.

Jan

