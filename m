Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F897ED86
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802139.1212303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskYj-0003Rf-H8; Mon, 23 Sep 2024 15:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802139.1212303; Mon, 23 Sep 2024 15:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskYj-0003OU-EV; Mon, 23 Sep 2024 15:01:05 +0000
Received: by outflank-mailman (input) for mailman id 802139;
 Mon, 23 Sep 2024 15:01:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sskYh-0003OO-Vs
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:01:03 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5de8b2d-79bc-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 17:01:01 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so602968366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:01:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a49sm1240894066b.166.2024.09.23.08.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:01:00 -0700 (PDT)
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
X-Inumbo-ID: a5de8b2d-79bc-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727103661; x=1727708461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=trqx0VK7m9+EYUWPOe2BgM76NUBJYL36HIyKPkyWgzc=;
        b=QTOclMi5TSVKs5lPxw7ADglVsTCqpHuqWSBDYQ3qwiKuPPPQF9GK+Y2hHWgaGJvadB
         /yLbTsSPVsTHPnHSNdKrog7EEnA0MQ6+teeFNN716Nm1OBJgTYmXJkMph7KPnioZ3xAk
         /bxmWSp5+nuFKEpr61XZsFWWneAQIz34te8qQ8KzI8uRh6l+dCj4qYLXj+lf65zhH0Gi
         NoX6IbMOEqG2PVs5ZxeqVryPwVxohjmTksoUCwwZM9an50naobcyAIQBnEi3qpChUj4+
         2Gp59N/w1zP6I7gVEFHYvm2qBaPr+N5Mirq52S7JS0PBEhnRT2790enXU+GSn+wKNWme
         ko2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103661; x=1727708461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trqx0VK7m9+EYUWPOe2BgM76NUBJYL36HIyKPkyWgzc=;
        b=gikJsQ/ACiK1FlQjDnckPFIx6m8HMGB/UP3u4DC88h0WBbfctD8S78Z5JMy9pNSc6N
         /kCF/piqaurYIxG2IkrpUwDV0dHIVS2lheR+iycdYpTyC/Gfd+TRVdy1EiO5hOqUw/IV
         L+9vEazB1wvgxQQnQFlJpscodwZXXr1x3PphEjebVnAVkkobLunwWJqtEC/tVmC4Gp7o
         1bANO4yvI+izl0aCr2JLyXO7tJ/Qmj6eUNFLqjp6X2w69NmsqUNkYia8S3uJQJbowbO4
         8OjLsLjlDSJ/9DNVuMD4Bu52WUfMbQ9E+fgYyclNu98pAk3YkmRzTI31bdshGPFvBTQi
         gJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6AkSyZHvMNggZQ2mvEF/YJeTeHVhEcsIoQndScbbezwbe6Tiu2KtDy21l9kFWf5ElRcprvKKSd5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXePc/XBTL/zMoBWd1nMupN4dPPtSjsAmqeOOcyHtuhoStGv4z
	+MqiaRNRSkgDlPb2NJyQq/JfYNCOToXw1isirWOTqljI6fnngXHpKlWuHgsNIg==
X-Google-Smtp-Source: AGHT+IG4zvwjbWpYsYvIN4oqF4zpZ/Pkuucz7+Qfkq2sRP8G9B7NR20XTuA+p89Keapz+SbUn7nJFw==
X-Received: by 2002:a17:907:f18b:b0:a8d:2e3a:5303 with SMTP id a640c23a62f3a-a90d508a9ddmr1112711066b.39.1727103661133;
        Mon, 23 Sep 2024 08:01:01 -0700 (PDT)
Message-ID: <27285031-3719-457f-bfd4-a888bc769be2@suse.com>
Date: Mon, 23 Sep 2024 17:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5] x86/intel: optional build of PSR support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240918091517.1200080-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240918091517.1200080-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 11:15, Sergiy Kibrik wrote:
> changes in v5:
>  - simplify psr_cmt_enabled()
>  - move PSR config option and add description

What you did is not so much add a description, but ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -231,6 +231,9 @@ config TBOOT
>  
>  	  If unsure, stay with the default.
>  
> +config PSR
> +	bool "Platform Shared Resource support"

... add a prompt. With a prompt, it also wants to have help text. And with
a prompt the question then is why ...

> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -13,6 +13,7 @@ config AMD
>  config INTEL
>  	bool "Support Intel CPUs"
>  	default y
> +	select PSR

... INTEL=y uniformly forces it on, while for INTEL=n (where it's useless)
it can be manually set to on. Imo, if you permit user configurability (as
was asked for), then it wants to be

config PSR
	bool "Platform Shared Resource support"
	default INTEL

Further: For an acronym like PSR I consider it reasonably likely that
something similarly abbreviated may appear in common code. I wonder if we
weren't better off naming this X86_PSR right away. (Likely this would
extend to various other settings as well that we gained more or less
recently.)

Jan

