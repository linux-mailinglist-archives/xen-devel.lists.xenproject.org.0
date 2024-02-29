Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E586CF77
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687310.1070610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjSn-0000CP-01; Thu, 29 Feb 2024 16:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687310.1070610; Thu, 29 Feb 2024 16:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjSm-00009r-Ta; Thu, 29 Feb 2024 16:40:52 +0000
Received: by outflank-mailman (input) for mailman id 687310;
 Thu, 29 Feb 2024 16:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjSl-00009d-UW
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:40:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba24ef8-d721-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:40:49 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1933921a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:40:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wb6-20020a170907d50600b00a3f0dbdf106sm838118ejc.105.2024.02.29.08.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:40:49 -0800 (PST)
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
X-Inumbo-ID: 4ba24ef8-d721-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224849; x=1709829649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66ED0Hu2okQ0qkhX0QsEVkNRBgSv+C3kCbNUGkI/Wxk=;
        b=PQ8j9O51NkBz772vYiGkxjJ5KBoIvvXf7xY4yw1j/YcM6R+oI4X3QnsvzjDu/O/iJI
         qxOgYeyYnOIoMonWEM8gS6uEv3FhNL4mER209V76STPnE+jRd8WJMt/kI0IpDkNBGY0N
         bs41ESfCRwyXAy05tj5QmBFr3ntE6FFuahlK0jiDU+s+8VXGKJ3FuK4bLVogv8W7XMp6
         wsiPAis425tboJ+xeEk8bZeMgCaVn/Y+jh+nvCKDr7o3huZYw65E5CzdE5CaHsvIu9pd
         Ja8whnNVL99cGs0BbOgzIaYFvXRBFu4OW3m2avdhUjuONXLwWn9tEbv0WhoOJcoFibVl
         t6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224849; x=1709829649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66ED0Hu2okQ0qkhX0QsEVkNRBgSv+C3kCbNUGkI/Wxk=;
        b=Kl3YDvK0KWwTob/QtW5dV1HKlA8cdCsRFqsW6MlLIcQrYLWqhmc7oAmbF4oKNJ02wK
         E3RpVgn8yQnOqLbYehh/JxUPm/NsX0MWXTIobNEQsQusaP40zAe2xTTNhiKg1+Erl+Ed
         +z0VG0AtFBlogTqMe97wbus68KxKKvpcsRM66X5FNjeQIbl2dLLVQxdPDPRQLxulMjOA
         R3ckYLUBOTUn5Iau6IwG3rfs4EmgdB6ETCRxgVS17xOmQhaczf893DoQ9GlDfMpSiODm
         7G7VyEsJCiUqXcV4pTQNZnzIF4VDa5MFANE/ouNdaxVjJTzYH1US3ZLD7OnQhLRFA496
         6uLA==
X-Forwarded-Encrypted: i=1; AJvYcCXKoaCnYPDowz7hUD2xBjQUkEsC0JaiLsxssot4VjwPjOfllCNrvq+tioqBRaTe1IhPBrZWmPHoLqjL6LZnCO42myvF5RmUC8Lcz10HoUQ=
X-Gm-Message-State: AOJu0YzCYE0V0a8P9NP9rsJRKJJVJFKj22m9bnJddRuYafz0diyHuoW/
	MNa8N3hSMpJTiSDlYprUuNgsFSmHbQSS1qtWZGKZX5zb6zA54QY1JTYbomqYrg==
X-Google-Smtp-Source: AGHT+IE9JgcOaTa+Q5MtayXrrNJgm7NLFr1BPYcaXBZ9t9AeNi0bY8sKYd4C+CfyFgonxQK1bsPAuw==
X-Received: by 2002:a17:906:46d9:b0:a44:4ee9:c560 with SMTP id k25-20020a17090646d900b00a444ee9c560mr1267938ejs.53.1709224849435;
        Thu, 29 Feb 2024 08:40:49 -0800 (PST)
Message-ID: <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
Date: Thu, 29 Feb 2024 17:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:27, Nicola Vetrini wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -988,7 +988,7 @@ typedef struct {
>        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                           \
>        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                           \
>        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
> -                e1, e2, e3, e4, e5, e6}}
> +                (e1), (e2), (e3), (e4), (e5), (e6)}}

Why? Wasn't it agreed already that long macro arguments passed on
(no matter whether to a function, a macro, or like used here) don't
need parenthesizing?

Jan

