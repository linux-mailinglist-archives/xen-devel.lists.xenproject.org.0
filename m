Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476FA9EC59E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853898.1267236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHCY-0006pj-CC; Wed, 11 Dec 2024 07:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853898.1267236; Wed, 11 Dec 2024 07:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHCY-0006nR-9E; Wed, 11 Dec 2024 07:32:06 +0000
Received: by outflank-mailman (input) for mailman id 853898;
 Wed, 11 Dec 2024 07:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHCX-0006nL-1t
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:32:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04704712-b792-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:32:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so41322035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:32:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725ea154427sm5513039b3a.23.2024.12.10.23.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:32:03 -0800 (PST)
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
X-Inumbo-ID: 04704712-b792-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733902323; x=1734507123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TQj1Q/Dg1IBa6lfDQC9U5T3P7xWYQIqiU48W0LtOGq8=;
        b=Svv197jIIC0GEdFmhpdGPSCWeHF4cjPTfuAQDo6OLHcbeH/1f1lulUYxHyKfgew2qK
         XF/auASBOVHpf/KS6CJjiY78yfUZQ8WiUX8vEfTADTNGvLOLxHN7tKwDjq0+pbdAomfZ
         552TXBhFRYVMYKLSJmvkmN50+qsphHKsEsas6P4phvlW8LNoKLPoJhdgQGI8XAukFuQF
         vwAuq0mRLxv/+lVlc/vRG+YJcALQRWGb9ZEsF3UrBVkN37TFEwM4fRhz1FRTShkuGBtW
         WGL/PtbZl0sqRII620q4QWczBNuXmc/NCFOarXC6iwhxslG2khoGM0dlcK+pS6G6PJ5B
         RHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733902323; x=1734507123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQj1Q/Dg1IBa6lfDQC9U5T3P7xWYQIqiU48W0LtOGq8=;
        b=nSgkl7O/myw4sV3q/CCmUmqEalJyyqo4tZid6lLHnJRJHLNFDJWDXknOy90EmDkGIF
         goo80WhcwMGChOab1BHXTAcfEiTLQocWvS1QZTLVFcKyUL0pOHAld5E3Y4Xi0xoGuVQ5
         Og/0Lr3aqI8JY6WO1kk1R4KdQ85k7UuYSWVaQYKgwV4x414IuisnczO8WO01ikfcBf+B
         EZ7vhXMFyh4NLLG09r7V+XATU4BFC4voUhB84AZMm9x/XPMDd5DN32ml6mUOdwofLjDI
         p7Qd/9FfePt3WNOpljhh5IjnMmBWz9tsDktgtEckZJbN5a1W1Z0ptx10qnSFVoL2ubEj
         GYKw==
X-Forwarded-Encrypted: i=1; AJvYcCVxhZf9FHA/nfnFnZ5DhpX/Ilp15kjB9oNbw72MnovegyjVEWSPkgiFbEzOVsh5yHrJbRn6KJN9LyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIIgOI/w/9AVLqixD6M92FFmV01P1R9gr705saC8GkTylMrJ8M
	x1aVZ4WtNJxoLyuIa1YQ6y19dRUo5VnLn8QoAq5z2lUB7RvGu+J580ww3Bn2YQ==
X-Gm-Gg: ASbGncum50gsTczvk7lPJYEYhxXne4wEjRk5K/P/ck57PsAMUeZXvgz/Por9BqsWgiQ
	HRq1pyNIK43XsZVc2EGSeOectraaC9Z2WyNEOauXz074ri5Xx0fEgXTVG+cixzYQXzGrVLQ7q9M
	KI9fBM453c6zWKFQsgYLuhehWs8BPbk62GX7gPmpCy9xidMhVgosjr4JgwRRwxDQG5v1OvFTV4J
	o0Qi//pyWNW1myre8hX9o8ax2aOMA+L7Kogk1lJkqmmipZ/YCiixqVt/iGw3Wzhz2p0vlEwCP8+
	bkEQCqfZg7GGzEjo2TrWTStxFvAgHDm+gbfZYlc=
X-Google-Smtp-Source: AGHT+IFmYBh8Cq49+S6xL3YoRdA5+LNnvf/gnBwTyzN40NUvOv0ippOHJ3mgvl/VoRF0lg+EbdCnWw==
X-Received: by 2002:a5d:64aa:0:b0:385:e0d6:fb48 with SMTP id ffacd0b85a97d-3864ce894b6mr1313976f8f.7.1733902323515;
        Tue, 10 Dec 2024 23:32:03 -0800 (PST)
Message-ID: <be92d586-0185-4753-8f30-2c7fd92f01dd@suse.com>
Date: Wed, 11 Dec 2024 08:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/35] xen/console: introduce console_init_owner()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -554,6 +554,22 @@ static void console_find_owner(void)
>          console_set_owner(DOMID_XEN);
>  }
>  
> +static void console_init_owner(void)
> +{
> +    domid_t domid;
> +
> +    /*
> +     * If user specifies so, we fool the switch routine to redirect input
> +     * straight back to Xen.
> +     */
> +    if ( opt_conswitch[1] == 'x' )
> +        domid = DOMID_XEN;
> +    else
> +        domid = get_initial_domain_id();
> +
> +    console_set_owner(domid);
> +}

Is this function meant to gain a 2nd user? If not, what exactly is the goal
of introducing this new function?

If the function's addition is warranted, it wants to be __init, matching ...

> @@ -1160,8 +1168,7 @@ void __init console_endboot(void)
>      register_irq_keyhandler('G', &do_toggle_guest,
>                              "toggle host/guest log level adjustment", 0);
>  
> -    /* Serial input is directed to DOM0 by default. */
> -    console_find_owner();
> +    console_init_owner();
>  }

... sole caller.

Jan

