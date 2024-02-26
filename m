Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF986759A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685519.1066351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaRY-00047B-Ju; Mon, 26 Feb 2024 12:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685519.1066351; Mon, 26 Feb 2024 12:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaRY-00044J-GP; Mon, 26 Feb 2024 12:50:52 +0000
Received: by outflank-mailman (input) for mailman id 685519;
 Mon, 26 Feb 2024 12:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reaRX-00044D-Ug
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:50:51 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e4cfda-d4a5-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:50:48 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5101cd91017so4533679e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:50:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 un6-20020a170907cb8600b00a4386852da5sm178964ejc.83.2024.02.26.04.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:50:47 -0800 (PST)
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
X-Inumbo-ID: a9e4cfda-d4a5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708951848; x=1709556648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBTas/3RpNzz+26rSLwd9G+9VGB7QiBP7Uhl8rFm+kI=;
        b=VKtialhinaMzqOuXI6bx2yaMS9i+pq1vu1S25WhqkEnkBCebmjPBNah3aYf6HpiR76
         ncjyYWbkQZcI87fq7BrsC2g+p0CI8I4Egnf9Rd01jt3U/ECmNERQjv5hC781gf+b4DTZ
         sD7LFzfb3NbTvR7wzsoZq/zuaWtqKaRhABZgz9eDiB7mBwn8L/qmNVAC3kDH1yf6pl2g
         atKACOAspN0mvcAFUWf6nt0sKruuymeF1Dhos6iW+0obPmmKiawYsH3ok6LpD9pGQ14E
         9KyYjunGXpsxv+qLh6lB/BZrSC4rY8CCx9rvju8ja9ZHhdWX+zLUVMajph+S3o57O1Sm
         mYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951848; x=1709556648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBTas/3RpNzz+26rSLwd9G+9VGB7QiBP7Uhl8rFm+kI=;
        b=N9mGdCs44VqTP7PtKnpTq4Jaiu0QRKwerlT31wfcCPhSctz05gAnL0PnG+cCQ39v/E
         ayS2U2X5PN/LAlHc51vgZRsa1/w4UQyGCHIN9BD7trjOON5iTXUO7MIBGslAee3rU1pN
         1nHelK//DiklJhj7fwMtsSoSQ7GZMHASRu7NM0YzRhxiN/3JA/uNTCElIg1qL4YBp+WB
         Ao1DT7aPgCm85ePLu/U/N4sUA/8sgIye5HJURW+OSRgCZYrVXNIaFHczg0dznckUPGZ0
         kjFlLfdYmKWVcmFAn2JjmdcO9qIH807/aSCTQwif6SLfiUdmzLDgxBzK9wuMso+rnnX9
         MOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXdAAXzTGtvarbW4DZksj5yLNXHPx646C+CiyzQV0F9YJsEUQ4bOnaT/NHxNagW+Hk5e9GggK8WrSYx3KDQJbuAX+SW/dZKM+rQe3mia0A=
X-Gm-Message-State: AOJu0Yz4G72TwyivXUddLIvyKZ5o3ie8U821c2A251cZHGfNUayw/YhZ
	K2Tv1+NqoI38a1iZhNhssOkz05qivVnEDO0qqbahbL6XpfnXTq4I1aDWi5K0Rg==
X-Google-Smtp-Source: AGHT+IEbHhHtqh4/2TiRDB3MhcjqvVjDwBOa68IamUt1xVsH/8vQwazqYXB0+u3aCoYWxwkjS6p12Q==
X-Received: by 2002:a05:6512:a91:b0:512:ed78:a840 with SMTP id m17-20020a0565120a9100b00512ed78a840mr5425944lfu.61.1708951847802;
        Mon, 26 Feb 2024 04:50:47 -0800 (PST)
Message-ID: <81e32609-37cd-4c2d-ae27-6caafc7dab33@suse.com>
Date: Mon, 26 Feb 2024 13:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/spec: fix INDIRECT_THUNK option to only be set
 when build-enabled
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-4-roger.pau@citrix.com>
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
In-Reply-To: <20240226110748.80254-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:07, Roger Pau Monne wrote:
> Attempt to provide a more helpful error message when the user attempts to set
> spec-ctrl=bti-thunk option but the support is build-time disabled.
> 
> While there also adjust the command line documentation to mention
> CONFIG_INDIRECT_THUNK instead of INDIRECT_THUNK.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one minor remark:

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -241,7 +241,12 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>          {
>              s += 10;
>  
> -            if ( !cmdline_strcmp(s, "retpoline") )
> +            if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
> +            {
> +                no_config_param("INDIRECT_THUNK", "spec-ctrl=bti-thunk", s, ss);
> +                rc = -EINVAL;
> +            }
> +            else if ( !cmdline_strcmp(s, "retpoline") )
>                  opt_thunk = THUNK_RETPOLINE;
>              else if ( !cmdline_strcmp(s, "lfence") )
>                  opt_thunk = THUNK_LFENCE;

How about

            if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
            {
                no_config_param("INDIRECT_THUNK", "spec-ctrl", s - 10, ss);
                rc = -EINVAL;
            }
            else if ( !cmdline_strcmp(s, "retpoline") )

or (likely less liked by you and Andrew) "s += 10;" dropped and then

            if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
            {
                no_config_param("INDIRECT_THUNK", "spec-ctrl", s, ss);
                rc = -EINVAL;
            }
            else if ( !cmdline_strcmp(s += 10, "retpoline") )

conserving a little on string literal space (sadly, despite the function
being __init, string literals remain post-init due to living in .rodata)?

Jan

