Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D4866CA7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685335.1065873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWZh-0000YN-9V; Mon, 26 Feb 2024 08:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685335.1065873; Mon, 26 Feb 2024 08:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWZh-0000WN-6R; Mon, 26 Feb 2024 08:43:01 +0000
Received: by outflank-mailman (input) for mailman id 685335;
 Mon, 26 Feb 2024 08:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWZf-0000WH-71
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:42:59 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2eab40-d483-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:42:57 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so2998902a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:42:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g11-20020a056402428b00b00563c63e0a13sm2142158edc.49.2024.02.26.00.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:42:56 -0800 (PST)
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
X-Inumbo-ID: 0a2eab40-d483-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708936977; x=1709541777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8XnJrbYiGVhwjiz9dh3tUKATEFLWFWO7YbGjz2i+8o=;
        b=LWpNWjlxeoegA0kuhmvKnCvmUDaot+mCmtbLlzd7ZdVs26txpItpyQCwlYsYcsrdDM
         Vu2iR6ZIRssyrAx8O3PBPWT0YP9LPKu7nS2cXJJ9S2Q9VThnJ73HHs1foA7ZYnQkdS2P
         x335/nUoRfJsN5XPChlesYtfPXygk8zFZiMYY9s8NIT3mFDJMMSFPcP4ynoVpstX3gWs
         WNnhWldwXG11J54aha4hVhSSYA+MPdkvulfvoKGolGNLZLFVbYM25qrpjfsErUNxrGfO
         yHufVc9/+sB1vIsUh6ubUccuVo2U68akqaV5HP7oczbfDu8upL1KB+9CxfiafYJN1LzN
         amYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708936977; x=1709541777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8XnJrbYiGVhwjiz9dh3tUKATEFLWFWO7YbGjz2i+8o=;
        b=KbL/eaYMHJPABMswCP1ikYd4UGK8YbqFaU/AQ+5sEX/QsduhB4lOqF+8AfihwgUq3j
         8JH05V6+mG2y5mQTqZOT/2y5GIRl8scQsgKov+9nukfsFhQc9aDdLaojN7fJ6AAI4p3a
         5lv6FoQjfGH+P5V1tEtQzUh27qZNZmbxhaHQcIfI5IcoESl8a2hCXXCKoHJrC7GZPD1X
         yC0bdDV6KwsfqWMdObjPkTmTLwc2G2N6uuXmRPbNSoJRJNjgPILoJp2v6eJQQlEBnqB8
         Hv2V/DFx4R7Ge+VquYh6s1ImiwXfNHSA5ou5KHcr3R/14hRC7je3kqygYcl2S3RVjQ81
         mlYA==
X-Forwarded-Encrypted: i=1; AJvYcCWtVbno0970fjgEG31fHr5jP5kny6eJ/1y6kHElUa2hhBfQYUHha3l4MCR66s6R++ykcQEOwS8p/QJETg5AdT8i+UUGUG0nWohDGN/70Vo=
X-Gm-Message-State: AOJu0Yz0q32iE6DwS47cmmArBjNnVUPmPGlq47GcYxntmxbpYqfZMjvg
	+mzhr0a/3TeDmThAZJVKX9UZiALO3Wqi2QgPeoSLNHPhD6+l0Ko5BKTxZ7rcsg==
X-Google-Smtp-Source: AGHT+IFRv4Y5Seek+nyh0tcj4ScD3OqFEvuSWi+Odih1gUvFMOSOg4nF7t/4ohr6O3FgE2DTc/DBZg==
X-Received: by 2002:aa7:d513:0:b0:564:aa72:78e1 with SMTP id y19-20020aa7d513000000b00564aa7278e1mr3839575edq.9.1708936976804;
        Mon, 26 Feb 2024 00:42:56 -0800 (PST)
Message-ID: <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com>
Date: Mon, 26 Feb 2024 09:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
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
In-Reply-To: <20240223120616.73503-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 13:06, Roger Pau Monne wrote:
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
>  int8_t __read_mostly opt_eager_fpu = -1;
>  int8_t __read_mostly opt_l1d_flush = -1;
> -static bool __initdata opt_branch_harden = true;
> +static bool __initdata opt_branch_harden =
> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
>  
>  bool __initdata bsp_delay_spec_ctrl;
>  uint8_t __read_mostly default_xen_spec_ctrl;
> @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
>              opt_l1d_flush = val;
>          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> +        {
> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
>              opt_branch_harden = val;
> +#else
> +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
> +            rc = -EINVAL;
> +#endif
> +        }
>          else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
>              opt_srb_lock = val;
>          else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )

While looking at patch 3 I noticed another inconsistency: Wouldn't
"Compiled-in support:" better also enumerate HARDEN_BRANCH then, just
like for thunks both CONFIG_* state and actual runtime choice are
logged? Or alternatively, should logging of thunk runtime choice be
suppressed when the Kconfig setting is off?

Jan

