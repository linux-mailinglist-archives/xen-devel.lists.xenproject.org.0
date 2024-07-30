Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527F94090A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 09:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767293.1177899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgqj-0006Hm-Na; Tue, 30 Jul 2024 07:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767293.1177899; Tue, 30 Jul 2024 07:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgqj-0006Fl-KC; Tue, 30 Jul 2024 07:00:45 +0000
Received: by outflank-mailman (input) for mailman id 767293;
 Tue, 30 Jul 2024 07:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYgqi-0006Ff-80
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 07:00:44 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb62d07-4e41-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 09:00:42 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7d638a1f27so135292666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 00:00:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590ce2sm6766210a12.26.2024.07.30.00.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:00:41 -0700 (PDT)
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
X-Inumbo-ID: 6fb62d07-4e41-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722322842; x=1722927642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VD46Z5ff3GZBwqie9LRLIXmPd9irkxsEFxkK+YXHWVw=;
        b=HgO4PywVPZf25f0bVX0mGgV84c3/QNP4uOuMX5+sjfnoM7uayfjx6+rxGJlyhAWMj0
         oZONSJNGUJEEkt3u4YuNAQtdkKWKql/3fXTEMpr+wOSM8jVPZ6u6p6s3J8v1e9pL7yr9
         40uUsoDFDmABftFxQt4hQcmQ8HIOue4KZVZBTwPBiFCyxw2FkByrtc6NpYt5MwiIffEm
         cWJZa3AMw2hCsHsXGApM4FKQiXYMxTP6sZ8MAnG8XdaOtEjl3FvvOVyvC42BzkgSvUSY
         5blqOuX165KXc6cD5u6/WwdluwKRA5h6/Ti3zumzohdK2YQgJvFWh0WA47fke7fJElFD
         e1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722322842; x=1722927642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD46Z5ff3GZBwqie9LRLIXmPd9irkxsEFxkK+YXHWVw=;
        b=qjg/38iCmxewLayjfjkZIGy+2/l1hdOTuCASGy+g5uyvR2uKiYg3xbE1kMeaQcxfRr
         yOjGltZFqtpxQZnWAM6N48hJ5NBprEBjZRBBz6w43AK/tMaNWLxi6JC0FrX2GtgJkAg3
         lZpv6TV6s9hybiRyZ6CPc2kOfIsc2FQPWIE1c0hlFSHDwc51sxXttx79Dm8VeDzInItk
         SCQytw9g0hFSWbcXOfzfjZAvis8+qWP/V/W94/xKPYGL62vmP8d5p6QS2/QfTojvH3uw
         VQTolMfOIUiL+iyIgQKuG4c6X4QpoDV9RSD3Z7VKfDDJT1wCaNskJUbgWqASKEwtaB0g
         CeyA==
X-Forwarded-Encrypted: i=1; AJvYcCWuhsrlkkgSJCYVDIbk+nvQREt0UTB0Q8l30PsFS9IdKL5Qp0UVZM8TaYtcbT6YMqCM6Tgw+2kTPbzAvCs6HkTt3Vb5IGoVp0U9U721shw=
X-Gm-Message-State: AOJu0YxG93BjbBvjMLeWU6wbYBuncjHkHeB8Jce/KgzNUolxJb8b8t/3
	FzM8OqaKVLGT6Ik8pDOY+I0u0/6RvnhweZum5vdfM8K7Yf2dTMThfFWPYF5eJA==
X-Google-Smtp-Source: AGHT+IEvPJO5Qrt8/7ERHr8auh2XD8NP31FHnbu9XztHgaNCIN9y8hB1OVJZW5nmJXYsuY3WjxcqVw==
X-Received: by 2002:a05:6402:268d:b0:5a2:65cb:7335 with SMTP id 4fb4d7f45d1cf-5b021d22bf0mr8709081a12.19.1722322842128;
        Tue, 30 Jul 2024 00:00:42 -0700 (PDT)
Message-ID: <ec446763-7e23-4f53-86d2-dab0df8a6c1b@suse.com>
Date: Tue, 30 Jul 2024 09:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XSM/domctl: Fix permission checks on
 XEN_DOMCTL_createdomain
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240729162651.571991-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240729162651.571991-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 18:26, Andrew Cooper wrote:
> The XSM checks for XEN_DOMCTL_createdomain are problematic.  There's a split
> between xsm_domctl() called early, and flask_domain_create() called quite late
> during domain construction.
> 
> All XSM implementations except Flask have a simple IS_PRIV check in
> xsm_domctl(), and operate as expected when an unprivileged domain tries to
> make a hypercall.
> 
> Flask however foregoes any action in xsm_domctl() and defers everything,
> including the simple "is current permitted to create a a domain" check, to

Nit: Double "a".

> flask_domain_create().
> 
> As a conseqeuence, when XSM Flask is active, and irrespective of the policy
> loaded, all domains irrespective of privilege can:
> 
>  * Mutate the global 'rover' variable, used to track the next free domid.
>    Therefore, all domains can cause a domid wraparound, and combined with a
>    volentary reboot, choose their own domid.
> 
>  * Cause a reasonable amount of a domain to be constructed before ultimately
>    failing for permission reasons, including the use of settings outside of
>    supported limits.
> 
> In order to remedate this, pass the ssidref into xsm_domctl() and at least
> check that the calling domain privileged enough to create domains.
> 
> This issue has not been assigned an XSA, because Flask is experimental and not
> security supported.
> 
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, a remark and a nit:

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -162,7 +162,7 @@ static XSM_INLINE int cf_check xsm_set_target(
>  }
>  
>  static XSM_INLINE int cf_check xsm_domctl(
> -    XSM_DEFAULT_ARG struct domain *d, int cmd)
> +    XSM_DEFAULT_ARG struct domain *d, int cmd, uint32_t ssidref)

Might be a reasonable thing to also convert type of "cmd" here and elsewhere,
as you're touching all relevant places anyway: The struct field passed in is
uint32_t, so the caller needlessly does a signed-ness conversion.

> @@ -248,9 +248,9 @@ static inline int xsm_set_target(
>      return alternative_call(xsm_ops.set_target, d, e);
>  }
>  
> -static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
> +static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd, uint32_t ssidref)

This line is getting a little too long now.

Jan

