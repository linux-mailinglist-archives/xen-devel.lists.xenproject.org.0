Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03217A89893
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 11:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952429.1347870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cup-0003fk-JN; Tue, 15 Apr 2025 09:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952429.1347870; Tue, 15 Apr 2025 09:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cup-0003dG-Ga; Tue, 15 Apr 2025 09:49:15 +0000
Received: by outflank-mailman (input) for mailman id 952429;
 Tue, 15 Apr 2025 09:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4cuo-0003dA-6Q
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 09:49:14 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e251591e-19de-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 11:49:12 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so4701397f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 02:49:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625592sm205418325e9.10.2025.04.15.02.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:49:11 -0700 (PDT)
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
X-Inumbo-ID: e251591e-19de-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744710551; x=1745315351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PpZHgBn5hw3UIf2qEEE8zreim0QjF0JCfQqrEIjsV9k=;
        b=AwOjLQS0lCkMN/EgdEJ0wuQA8tzQAiB341rtCWKXNvblXucCl1CFLXHrgexQzyJnxT
         dA+/oKbv20FxQfMRA8rTVZwQTTVQa7j0bvdj0pD800NlYMCAeO6J7YbMFeZG9EO8EYJ/
         0nPF4EE8Y/eZc1v3VC4aWgtEozl2MKUi0jIFdJrZAXGDfAWezUdRKHsEBq8/bQ+wUGYU
         5qUf/F3r/zSsnqHo4DfiFKjGxo39Hk5FDhW4k+oNBjlCVxZviqVv/a9tlwusCqBMprbk
         HDGYtUwxly+XNb/X+0y5TVF2WUYCx8zRU3FaUZ4KI7Nk6zpIhaZTkMMaDjggDC2KnNF5
         P+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710551; x=1745315351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpZHgBn5hw3UIf2qEEE8zreim0QjF0JCfQqrEIjsV9k=;
        b=A1Xh9bqFefRFYNePtRT3sforYmsNMZmbia/CP6BVJUFvNigvZqHC/KqkpoO9i0uDL8
         +x5/REgRMQvPJqjXpISPTllkXjwdQKpIi+J5BTWni3su1PX3NAI5ch/O7xmyIUbRCyCt
         zX795tpkGc2Jtxt/PHfqaZHu1YKCBos46t0M5x76cZTNnIw+ELbZKyhOtg9KU+e67l+n
         /chD6HDXT2EuF5vaByRUEeCzsMPl4S/fogGk878BSDKz3eI1EmyJ8IOo3zVv+YhtHDrB
         gdfy8C3efhWxcj0y4CXgPrmrZkARZ+f2IAKygLQI0JkNhBY4sa1P9a7c7jlV2UlOcjPd
         Mmvw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7B5F7Y5R0Ti3yytJ3HVKf5q/UdpHS6i8UahuYN/GyNGvrdG3DtqFzgqC2czWzbpiJrT5wNmX3f0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOUNleYLpDMzVoMg9kHpfaHHVwGpP0BzzEUo6+r8d30jfL4+sY
	RFTWqIYyvDF/Jn2ZsgpmrD0PrODs+FKzPHj3CLVMBwglpyXuAVT+ImRY1Cd3VA==
X-Gm-Gg: ASbGncsBdOcCi4K+qWdF/Up//aX6qS/XGvlhoDPL9oiJ8RMYTqv1VZFrJja7StQBLhF
	1UUAaY/0TxOkFqtab6bc4agyBb+M60xpKWJhnm/a2oAXWQYINWLCo28Ohqv5nZlp8W/BCKRhohP
	eaalrNDukb1QgXy0WUJqGrKApzb8wpqEb/B798kpvIiNwklh0/4r5DdYcA9lLaanOwnc1V3QfsS
	TID8ohJnYFfzRYtocShkY0S5YLO+JQDVFi5FwJmuSaYYRqdVLL9S769rIM6j3/3w22/yiM423V6
	RmmlyOLbbtnpWM3Hadax/7fQmMSjjXucuYALkWGkGZ0MPNGQTO7gsiSYJ6Xpz0x/5Gsy/uKX2FM
	j1HHx2y7NUQccW+AAZRXhGvxTtFPLzBXmn4LE
X-Google-Smtp-Source: AGHT+IH4qUe7Xw/UQuCk7ZMH7VCXJezvF8Ia9xlWeeMnwBBslrDwQ5qSWuy4J7ZnD/OYH5uTWRtfwQ==
X-Received: by 2002:a5d:64cd:0:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39eaaebab7bmr13205299f8f.43.1744710551425;
        Tue, 15 Apr 2025 02:49:11 -0700 (PDT)
Message-ID: <dd4dd741-b063-4619-a893-a9c02c0ca791@suse.com>
Date: Tue, 15 Apr 2025 11:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] vpci/header: Emulate extended capability list for
 host
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250409064528.405573-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 08:45, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -815,6 +815,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>      return rc;
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    int rc;
> +    u32 header;
> +    unsigned int pos = 0x100U, ttl = 480;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        /* Extended capabilities read as zero, write ignore */
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                               pos, 4, (void *)0);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    while ( pos && ttl-- )
> +    {
> +        header = pci_conf_read32(pdev->sbdf, pos);
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                               pos, 4, (void *)(uintptr_t)header);
> +        if ( rc )
> +            return rc;
> +
> +        if ( (header == 0) || (header == -1) )
> +            return 0;

I realize pci_find_next_ext_capability() also has such a check, but even
there it's not really clear to me why compare not only against 0, but also
again -1 (aka ~0).

Jan

