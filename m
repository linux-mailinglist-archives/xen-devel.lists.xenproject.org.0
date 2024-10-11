Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60C99A4D5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817073.1231176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFZR-0005A4-Kw; Fri, 11 Oct 2024 13:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817073.1231176; Fri, 11 Oct 2024 13:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFZR-00058Z-IP; Fri, 11 Oct 2024 13:20:41 +0000
Received: by outflank-mailman (input) for mailman id 817073;
 Fri, 11 Oct 2024 13:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1szFZQ-00058T-Jp
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:20:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bdf0be1-87d3-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:20:39 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99422c796eso332920066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:20:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7ec56d8sm214867766b.17.2024.10.11.06.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 06:20:38 -0700 (PDT)
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
X-Inumbo-ID: 9bdf0be1-87d3-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728652839; x=1729257639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ljgHPZPEXMkzkKbmfctsNa/cE2HGjnK3cHNZtxkS5X8=;
        b=aWuwx6wBtgy04rfStV4T9TOT7jpVmnZ6cxVTgIaE0b4m5OxIqYj4qQ8D5S6cTgVrfd
         T2/hsmplXw8Ke1CnJIYlNsf47awc2+f03AgzlfyX81p9gtNRGDwO1WZtx3zAZR8OzcnR
         SjOtg8dagNqxoAF3K7QYQ5df7xBiYGEZZjdUAd+ejtr1HvmwonmOh83eDHIFxS777v/G
         JCVK+UhhzYFyrv6DWtJZeRIvdj4g9DZHOZPDVhije2ouKgTsLMVxXAmx3twiIaEVKn6R
         w6DAbAAWC1joCo2riW81P/O/qEKBxJdcWQguB9e1pb7NqHn6TIdIF44iLAuNWHwPwpWa
         esgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652839; x=1729257639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljgHPZPEXMkzkKbmfctsNa/cE2HGjnK3cHNZtxkS5X8=;
        b=CFatUZkal6O4BKgdJLrbizL+/5hzBZj2I6IzdB5vT79J0Cqy16IiB6L82fYcW2o5q0
         Foq5iyYTk5Wzj61GYKH1yweVtn8dh3ONzNorb3x5lr0zaoE/3n27snU7AE5qPwOTYgIW
         3ijlrT73BVJsheUTfkZ1KNKry54Bx9B+ZNR3oAWzjswiamyP4XisRaVMNvh2qXZlsUW+
         I2v16SdcSsuJigR81eSenBLwksuzJnG2ycVm4bcH5jSUZmU29hWBOeDW88FWTy2WeWnI
         viQz9gYoS5O3Adi+AjwX4ajPBzx4ON/kjFzejYl53YqJkeVIOCh2tBxDe3kIQJUCIdhN
         qgTw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFUFVCZdc5s9Tz23fh+63oZRd2ttoCSwXOAk6D+iiM9jBOGOhk+1EmzctmcCaDY5ki5Zlc9KKgZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyToo768NDtlrvk4lBHpDXHsuYF8LAcMVf9TIhrtKJnEJ42NsDc
	51XI7RP9Svl8E9tk3rEjCXe8aZ9gaKGyxgXjsxXbE7JIJZifKTMj6AfqycHBxQ==
X-Google-Smtp-Source: AGHT+IET7gb+na73nLpuD0xhdY8yvqJhGc262KTC+xl4RRmKYIVdQo0iVlEnB4fuWP4pE8rsD8n67A==
X-Received: by 2002:a17:907:7204:b0:a99:306c:cd75 with SMTP id a640c23a62f3a-a99b95f0d0emr199150066b.54.1728652838978;
        Fri, 11 Oct 2024 06:20:38 -0700 (PDT)
Message-ID: <1f9ea2e9-d2ce-4ae1-9a93-dffc856c1268@suse.com>
Date: Fri, 11 Oct 2024 15:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241011085244.432368-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 10:52, Frediano Ziglio wrote:
> diff --git a/xen/tools/combine_two_binaries b/xen/tools/combine_two_binaries
> new file mode 100755
> index 0000000000..ea2d6ddc4e
> --- /dev/null
> +++ b/xen/tools/combine_two_binaries
> @@ -0,0 +1,198 @@
> +#!/usr/bin/env python3

Nit: Such files, by convention, are named *.py, I think.

Jan

