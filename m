Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2EEB3FAD9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105965.1456776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNWG-000257-PA; Tue, 02 Sep 2025 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105965.1456776; Tue, 02 Sep 2025 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNWG-00022z-Lp; Tue, 02 Sep 2025 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1105965;
 Tue, 02 Sep 2025 09:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utNWE-00022a-UT
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:41:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a2b054-87e1-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:41:36 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61cb9e039d9so10303920a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:41:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc231561sm8984888a12.23.2025.09.02.02.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:41:35 -0700 (PDT)
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
X-Inumbo-ID: 04a2b054-87e1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756806096; x=1757410896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zEQL+Uo/M9ox57ZUOUa3u3QRFRTtHXaecTK3I/aVK40=;
        b=YC7g1SjSjV0dfukh94K5IZT2wy3ViDtUFY6l45De1s7AmMAAvLp5KG2efRWExuPMzX
         Oyey9RSCpYv/Pxcw5ZIvH0JyP0Iblfk1X8vQ65r1YAs11IdClxhgRiiCPsrmyGFCIRfo
         YoXHUKdS64oYwgTt92zv4macPSmnOqp5b9wJimMZJLWS9ENjKBETfs37rXI8eOzrNM/W
         ltZTGInyaXLbpZQNK/7g3GZ73WpbgywhlGwSTvDNpIPuCuMPFFWATGoUL+Pnyw/BPBk+
         Rb2SAWUvzXwOZYKG41W493mFkyY7c/+XfLtJE2XoMYoBLa28eRLSW6RbnFjula7Lkgkp
         LRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806096; x=1757410896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEQL+Uo/M9ox57ZUOUa3u3QRFRTtHXaecTK3I/aVK40=;
        b=q8yGRHqzE4pKQdqjm75LsJ112MqN4ySInsqUdCH2WCnl05pk5sP0jUakDPtk/BXyhR
         JjtrJesGD65NoK9UOr9Po/CrHkfvWNCPVc44vRnQOF74dJtifuUaE+rZ4lVitWSlVhAp
         CO2c5UT75tNNAVeO0HhD9pBWm1mR6qC4nDpA/Z1UnhrmRMM6N/2g7w1MerOzCjJerfPb
         Oey/mJVy/z8o0sT8uMeIF1XhTS3OwTs+iDXUkkbljclJ90yptV88FdkCWWipNZd6Dsr9
         O49ecqB1Kew6mXTm6Y92/xnaw+Fj+QUTXrJFL6DRtDZDQKxeaFAu0139TkEyLR7Z+8ly
         /RYw==
X-Forwarded-Encrypted: i=1; AJvYcCXV7Br2CMnCoEBnsJtWMCn/Wl9er/Gwb9B04JHmChYKZeRoV9WEidh3GSj4timlj1rAIZzXdfP35gM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd5v7LN6wMWxK3ctbZ9oHH3OD0wQmsa6sEvnyzYyieMrsvEqG0
	yUk1F+rCbNBZbVvukiBH36kX+GAm6ObXWyqP2uoVSnMu9WAZQSZUfNiICJjxza1dZg==
X-Gm-Gg: ASbGncvHRXgQ5GyhzwIywascoMzF8QDKtXDpEdvf3J+kw3UKk4VoUFoP3H0ZWeEj3Xv
	kck7PqcjgcKQylHcUlcTHK6cvrFASqEFwqTf7ryBaFnEdL5KaDh1l1qzworgt5HsGpZ5ZZ1c2Xt
	AtKTKajwtNZ6gBO1Vocbys6jRh1z6xU9QBxVT/Pn9ybHYkY6cjg5IIGHzBetffwaHXz2TE0+XpO
	wAFESgw7mtYl+VKNMJAyqPxtHvjUesY9WlQpnBv1e1OLZeNaOSxGcOT3ZiHrZf20oLGoS3ehoPW
	jr3e+fOrZIrVpBwIDo7pR4MvWaM5AeXtIbpUNGtEKjlEoIj23woGLGnqHupiXszPYWPXabeuCom
	3ckktU/eWQQOm29lXxiB7vZ1//4ZPoi6MlYbPGGLgK6OYAboElLE+tnuO890/AgkwjF+ap2Z8Ld
	SIJcDOpItX1FHP3dQpRQ==
X-Google-Smtp-Source: AGHT+IFRb2x3CvevL5Gwrhy8jIviwNwNZpgzybwQlErQkuf5EE6kYHdXvihRuXN0kSfGb3ufoGzEOw==
X-Received: by 2002:a05:6402:505c:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-61d26998f14mr10056049a12.7.1756806095406;
        Tue, 02 Sep 2025 02:41:35 -0700 (PDT)
Message-ID: <de8380a4-cad9-4589-ae46-8649036186b2@suse.com>
Date: Tue, 2 Sep 2025 11:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/flask: limit sidtable size
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 12:52, Sergiy Kibrik wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
>  
>  	  If unsure, say Y.
>  
> +config XSM_FLASK_SIDTABLE_ORDER
> +	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
> +	range 4 32
> +	default 32

When 32 is chosen (i.e. also the default when the prompt is hidden), ...

> --- a/xen/xsm/flask/ss/sidtab.c
> +++ b/xen/xsm/flask/ss/sidtab.c
> @@ -14,6 +14,8 @@
>  #include "security.h"
>  #include "sidtab.h"
>  
> +#define SID_LIMIT ((1UL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)

... for Arm32 I expect either already the compiler will not like this construct,
or the latest an UBSAN checker would object.

Jan

