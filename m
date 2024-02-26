Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A19866C8E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685320.1065853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWx-0007ZZ-MM; Mon, 26 Feb 2024 08:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685320.1065853; Mon, 26 Feb 2024 08:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWx-0007XF-JL; Mon, 26 Feb 2024 08:40:11 +0000
Received: by outflank-mailman (input) for mailman id 685320;
 Mon, 26 Feb 2024 08:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWWw-0006Aw-1F
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:40:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60c76d4-d482-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:40:09 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so4358112a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:40:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vx10-20020a170907a78a00b00a42eb84c7c2sm2177342ejc.142.2024.02.26.00.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:40:08 -0800 (PST)
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
X-Inumbo-ID: a60c76d4-d482-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708936809; x=1709541609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38iolUXu8UDvXTv0mMIgiesYrJRJVFliE1KdkpJliH0=;
        b=dI220B4piRsi803pbq/Zun4ih4Or/rOorsrQMqDSrKJEKHNzGr6BhHqyL8WSUDtBbu
         3BSg39lxozxO6YENiKBKXo6DX/t0JY2aUngDe98P36o27BCQW1AyDGnj7Iig3guWwc7U
         pAWw86JN3bkpRfAQ4tFQacTIsU7HqetVTrl7jOLcgsst7z2uaKLAsPgNCfmviMDfHwE/
         vlbZAGuub1DG8PveViPK18znzblJo7iiPoSGHUNRpLDcCsnZwAAKm/PtjlLI3ibxwttv
         q/sSmfYcg38a/y1jyzj770CafMZvaw0M/M+cdNs/3JSXLZzWOmo0X2+OQoavSi0RQAQz
         64ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708936809; x=1709541609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38iolUXu8UDvXTv0mMIgiesYrJRJVFliE1KdkpJliH0=;
        b=blhLivizcErrHVyveBiGKUx0LK4Ycq4HZGNFxfs0kVnhrwek64DUGr8iQRVm3+nWQ+
         CT+KgS1//b0MitZ1I1Rt6agMKX6cWj+li7UD3C2CkeioTtRnHmQNpgCc8gCc8Mw8DMVU
         XayIJ5/E/ff2GSEAntuabwLUysiWPj9iU5gaSQQxRzU/BjKZqh6WR+O9tlW2h8W2s6Wj
         HR/L1urIx5iFTeAyHXtnmBKajvHaT3P1qiQuoceSKNOaDsjNowvHAYnzN1Q3R2ycz9qH
         gwssyDgPsI1/8Xva9MmeGVVMfdba+XdyR1VBskpHO5Czgi0hdn2WrStoRBwOsA5eqZNq
         r75A==
X-Forwarded-Encrypted: i=1; AJvYcCWtdYbWHyShoErIjGgR8t09Wv6upoFCVrmwzjmmSb9eY6RRddS+/ChJazMbEDa5ET5WKyEFbBql1+s06W5UUDRj391MZfQUQh0xUcPdsjI=
X-Gm-Message-State: AOJu0YwM8UXv5LVDBrX8sn9XcrJzTbD3Qpjtv61Q4YCnEDpl9EqvgucZ
	nNG7HfDgbtJR1ryN5zNpd7rycdXVeu1Ewn+P4TkYf0Sp0crxojlCGHTJV8PKVA==
X-Google-Smtp-Source: AGHT+IGScEBY6a7w8BdWiRyzxrjYi6TjnBY2cS+lpDf5hg9zCxwXfy0s3UrvcfElqm063CEeAcZTog==
X-Received: by 2002:a17:906:1159:b0:a3e:feee:3a5b with SMTP id i25-20020a170906115900b00a3efeee3a5bmr5300441eja.3.1708936808854;
        Mon, 26 Feb 2024 00:40:08 -0800 (PST)
Message-ID: <217c07b8-25af-4f7a-81d8-09485d72fb05@suse.com>
Date: Mon, 26 Feb 2024 09:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/spec: fix INDIRECT_THUNK option to only be set
 when build-enabled
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-4-roger.pau@citrix.com>
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
In-Reply-To: <20240223120616.73503-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 13:06, Roger Pau Monne wrote:
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -239,6 +239,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>          /* Xen's speculative sidechannel mitigation settings. */
>          else if ( !strncmp(s, "bti-thunk=", 10) )
>          {
> +#ifdef CONFIG_INDIRECT_THUNK
>              s += 10;
>  
>              if ( !cmdline_strcmp(s, "retpoline") )

              if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
              {
                  no_config_param("INDIRECT_THUNK", "spec-ctrl", s, ss);
                  rc = -EINVAL;
              }
              else if ( !cmdline_strcmp(s, "retpoline") )

?

Also, while touching INDIRECT_THUNK, could I talk you into also adjusting
documentation accordingly? It presently mentions INDIRECT_THUNK, when
really it means CONFIG_INDIRECT_THUNK.

Jan

> @@ -249,6 +250,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>                  opt_thunk = THUNK_JMP;
>              else
>                  rc = -EINVAL;
> +#else
> +            no_config_param("INDIRECT_THUNK", "spec-ctrl", s, ss);
> +            rc = -EINVAL;
> +#endif
>          }
>  
>          /* Bits in MSR_SPEC_CTRL. */


