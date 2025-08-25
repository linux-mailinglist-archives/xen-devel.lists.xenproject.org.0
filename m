Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C72B34559
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093378.1448898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYuD-0003Mp-2H; Mon, 25 Aug 2025 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093378.1448898; Mon, 25 Aug 2025 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYuC-0003LM-Up; Mon, 25 Aug 2025 15:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1093378;
 Mon, 25 Aug 2025 15:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYuB-0003LE-LL
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:14:43 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36f585b9-81c6-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:14:37 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so6280320a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:14:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3172efb6sm5309605a12.42.2025.08.25.08.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:14:36 -0700 (PDT)
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
X-Inumbo-ID: 36f585b9-81c6-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756134877; x=1756739677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1ZaOG2tCwR76o19TFWRW8f8chzhrElxzF6DDBA//GE=;
        b=MVqOYdeBIzay+jT/RMnDi62JxUipIIxSOyO5yd7F1znLPzgd3ztIU54SpUyMCVbnAc
         itOBJqThI+MEfyvAh3w2vLZegsNevCY7W/q4sr9zYcsaXefmRDWP7OMdEgQnwV9g91Fv
         Y70KJpJhiHrld4CfkwnTz0xJ3LI7PgaxqQmSrK0qdpoTR9Ew7JykS4HAj3Logj4KXEMP
         fNHOLfwl5gmpAbO3Hqc46a+OLK+X3HrHcm8rRs5aHM6kMNDOi/fu2i9XAcgFN6U5gkDk
         d5atqRNs7R48+q04His4oHTg3naHVvRqftuA9IZcvXxBXtZfktT3xn3vYIDtWlc2K+j5
         nMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134877; x=1756739677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1ZaOG2tCwR76o19TFWRW8f8chzhrElxzF6DDBA//GE=;
        b=cRMO80RtbBfegU50YLc0FpiyYaeQKEZKeGIGqJQA3T9oFuflT0R9OzHDNtfBbyUcT7
         9btOPZllT653LIj74owMNRJKYIAWWgJs3keFMZ3uxxu+ltz6azojCxpLqj39e5KMtzMH
         DFnpIgzTxY7oyLlqkrg2vSpCfWOBQ7b5m3zBh4W5/USCQpVyJZKbVZ2pj5MI0zsKUl+N
         J09C3Fqkx9U+yQKbu4rGyLMmNhskxFP2jxwVzOEUmjG+z2GGiVZzZqxi5Cb405Y9OiaD
         0fuyZwpBnZR4yxbZVPfcstqWeVdAmP0LXbakCqG9Qg4ZTCwIzBL1lYCplJT48tnXqfir
         ptQg==
X-Forwarded-Encrypted: i=1; AJvYcCXhcMry4Nw32byXRNkZBghabsQMp2Hqpy11T721kOUCbFWnANo9g0UKhIDnS/FN+c0qHKCLxuhNpeI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsvwt3jp9jmTfNLFg+HG7jDlLT5iAgdfD3sJdfDHj7+6bN4C1i
	plO3wJitEYXsXVbO4le4SGhGI7YRPFUU5NPfoH+ltGdrXG+tc/3n3NSr99l20b3Qfw==
X-Gm-Gg: ASbGncvjswryFbzzQP4EmzmnFYzK6WUJiyOmWz7eKBtnSnUtwkEndPC3keGpMg9IWHx
	cQ85DdeGkZBnJRkVDjdBXF3mGXUjztN/K9rkq3YDSGcuhwDk+KnLPbt3z0xvrlvvzj2uVTYIdzr
	sm1WAczfzKBij3PjTrY5nYquR9x6pJ+cHn4HIMGjnFRO4VSmMdUhMdfupmC6hEbMzxTb5ovA20y
	YEywsQLJwUJ9wRerB05DBv/tjZDNzZwBdM9kFDd4Jx3MBWNFxV50I5pJ4b63oQPJiJx7J57wLet
	HLk1lIzwv3dfSqoRme6qrlXKApjIzLOknprxJyn5CegsZ7COnGMBh7xhWA7WqeYdyX9c/5PS3g8
	TfWw4Fh7UWbchUrE4K7TlCniYOz4WOPzZo2Gfjgg9tjKv4bUkOz9u8T+lum8hwz20m/iQiiNyA+
	PVPGBpGhKOTO5W3hDPKQ==
X-Google-Smtp-Source: AGHT+IEkhFkMeytnu/q7cH5uAVkpswua5bloWVLyHH0WMVRtSIvFGmZ2Xf/w29ihXVsFvPUfm5LKNA==
X-Received: by 2002:a05:6402:274b:b0:61c:5b44:b277 with SMTP id 4fb4d7f45d1cf-61c5b44ba38mr4315301a12.13.1756134876973;
        Mon, 25 Aug 2025 08:14:36 -0700 (PDT)
Message-ID: <53420012-589a-4776-b456-f3278fabd983@suse.com>
Date: Mon, 25 Aug 2025 17:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/13] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> @@ -50,10 +141,335 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an linear function passing by the 2 points:
> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + * Parameter freq is always in kHz.
> + */
> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
> +                                unsigned int freq, uint8_t *perf)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    unsigned int mul, div;
> +    int offset = 0, res;
> +
> +    if ( cppc_data->cpc.lowest_mhz &&
> +         data->caps.nominal_perf > data->caps.lowest_perf &&
> +         cppc_data->cpc.nominal_mhz > cppc_data->cpc.lowest_mhz )
> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;
> +
> +        /*
> +         * We don't need to convert to kHz for computing offset and can
> +         * directly use nominal_mhz and lowest_mhz as the division
> +         * will remove the frequency unit.
> +         */
> +        offset = data->caps.nominal_perf -
> +                 (mul * cppc_data->cpc.nominal_mhz) / div;
> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(MHz) as anchor point */
> +        mul = data->caps.highest_perf;
> +        div = this_cpu(pxfreq_mhz);
> +        if ( !div )
> +            return -EOPNOTSUPP;
> +    }
> +
> +    res = offset + (mul * freq) / (div * 1000);
> +    if ( res > UINT8_MAX )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value exceeds maximum value 255: %d\n", res);
> +        *perf = UINT8_MAX;
> +        return 0;
> +    }
> +    if ( res <= 0 )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value smaller than minimum value 0: %d\n", res);

The message text doesn't fit the if() condition anymore. Perhaps simply
omit the "0" from the text? Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

