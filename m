Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5A8B5293
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 09:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713904.1114813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Llu-0002JQ-LJ; Mon, 29 Apr 2024 07:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713904.1114813; Mon, 29 Apr 2024 07:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Llu-0002HM-IY; Mon, 29 Apr 2024 07:49:58 +0000
Received: by outflank-mailman (input) for mailman id 713904;
 Mon, 29 Apr 2024 07:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Llu-0002HG-1v
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 07:49:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 122406ea-05fd-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 09:49:56 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41bab13ca80so16782235e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 00:49:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c510e00b00419f572671dsm31984850wms.20.2024.04.29.00.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 00:49:55 -0700 (PDT)
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
X-Inumbo-ID: 122406ea-05fd-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714376996; x=1714981796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JgvybAhrntlCozf7Di/B+Io0NuFabaXNWGYE3SQzOs=;
        b=VE11DK50TFSSt8PrWUFIMog9sUFOqxH8cddS/pWTBdtF46x2S5rgddATJpUAJF2n8U
         xSQEU15oFcZpVUYj4N70xGDrc/mplgkb+YPUu9rLb7LtOcz+pMRq4UJnNQQndiZ75zeG
         oaHutA50zQhvW/HjNCGajT5JvZ0RkKQXpKQryuYLd01uYMhM/VZCUopLjHMGcfZbCIdS
         w3XwlpK8us3uNIL6L9pMTzpn3gnt+YgbmIj4XWLyGRtdMq8vycatR8FEO/4cyO8BDP4I
         h9YUBPyc/eqSj5l1797ewtc/4OwYnurdQPbvBpQmQgGL8JpJaYVhm+uljSqON5WI5F9M
         kxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714376996; x=1714981796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JgvybAhrntlCozf7Di/B+Io0NuFabaXNWGYE3SQzOs=;
        b=uv2fNuPK2w29YGzJvGhCqAX4C23tOomoAkJHKJ3nURE9CGytIxNp6iyv1IyoZH2xkB
         UA9yfJFoFcrZii6GDZU6rPQ7UfgQZ1p7qoo+u/fBZe30L/sjIvzMnbMdVNDma47GUsvV
         AZ3zrv2QogO86rQrr0ClWNN9CtogZYAbMiIrdxGgh6NiD/YoRMTtALees6egsfj5gynv
         1oYNYBOd/MPW+ywwDi5lhl8O8hlgSGaSfqUcOzSgy2RbKdk7u4zxxgUh6M4hawpBa/gt
         VZmwAJU+bIpwme0U34lyP1mhNY3siYZMkwGvihhLsVwIxEVf/PsvihM+slgV4vZNy1bZ
         a9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVeKxzYb+8guo5baAcuTToPrHYp8JjTNWzmQ7P8773eW26cyR9sITHeuCY6bNVzRD0fD+sKsKfHqKNBrFs4wusBEpRBAZ6ANG9uwwNemuY=
X-Gm-Message-State: AOJu0YwrB/Ttk/VgpO+6HwReUPDQKXmsjRl8ifuc5yx5SnKrvWxOOdP8
	MQhS88QX/Ob0b5NbREGk0hld3V2EGN0Uo/HZm8uBJLXHAhoRrk8HhjOrGRNEAKtFK5rzYAMiI9k
	=
X-Google-Smtp-Source: AGHT+IEbsGfEbI36UypPzBuxNv8pKfQNxFkyGjLcY7RInwQpv/eu8KgTvFFWFWgivcDTQuk/zqF50g==
X-Received: by 2002:a05:600c:314a:b0:418:fb6f:5f59 with SMTP id h10-20020a05600c314a00b00418fb6f5f59mr8608099wmo.2.1714376995720;
        Mon, 29 Apr 2024 00:49:55 -0700 (PDT)
Message-ID: <e7810e1a-f688-48ea-bfdf-dfc22582f06e@suse.com>
Date: Mon, 29 Apr 2024 09:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Annotate the accumulated features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240426160859.565438-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240426160859.565438-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 18:08, Andrew Cooper wrote:
> Some features need accumulating rather than intersecting to make migration
> safe.  Introduce the new '|' attribute for this purpose.
> 
> Right now, it's only used by the Xapi toolstack, but it will be used by
> xl/libxl when the full policy-object work is complete, and until then it's
> still a useful hint for hand-crafted cpuid= lines in vm.cfg files.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

The one feature you don't annotate such that I'm not entirely sure about is
NO_FPU_SEL: On one hand it tells code not to rely on / use the selector
fields in FPU state. That would be a reason to mark it here. Otoh the
specific behavior of storing zero of course won't occur on older hardware,
being an argument for having things the way you do. Perhaps a sentence or
two could be added to the description?

Jan

