Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F1A3C093
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892956.1301894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkUv-0001VN-7H; Wed, 19 Feb 2025 13:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892956.1301894; Wed, 19 Feb 2025 13:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkUv-0001Tc-4l; Wed, 19 Feb 2025 13:52:21 +0000
Received: by outflank-mailman (input) for mailman id 892956;
 Wed, 19 Feb 2025 13:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkkUt-0001TH-VW
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:52:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bba91d16-eec8-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 14:52:18 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so1004420766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:52:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9b81aacdsm590566166b.104.2025.02.19.05.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:52:17 -0800 (PST)
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
X-Inumbo-ID: bba91d16-eec8-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739973138; x=1740577938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jxDYUj4rlErNGzn4np2Ksbn8WjmnkCZE9D6HiXz4s14=;
        b=ZK6OZEv1jzWamgJHQiY8zflBMe76aNuZDXsNNSezefsxww3/IL6R7oN7dcqt4lKuoD
         PkLlQX454Iac5sd62OIoAa0CWIKPxdrG8hXKDbImSbV89M13qGyGwHc3+0jbpUVfEsrW
         AGIQXDnRoE7MNnmB/Jwd/OLPTVwRexdFpOjm7/hekmgblgjP3LjzXl5rel95WQKTrWSC
         exQfCJDXPP8i6h9Z1+rWvgwHtlb7rryv4IH9B3zP85mloH4pkR8vF0l4z6fX8Ccx23GG
         wdPw/aiDj1yXI7cQP0lwiMUdq0aQEfKbGYBHyXWvFDUqRKl8m7Thz6muMmaHKIiHhJJs
         nqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973138; x=1740577938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxDYUj4rlErNGzn4np2Ksbn8WjmnkCZE9D6HiXz4s14=;
        b=QSxdCsrAow2U2NoavYNqalIzU3RsOHjVEe+uO+lXJwH2wFr7lHP/PmJi5sV0lnQfiM
         niWH/2vHlGhaBDVQT+5R8/g7WO4hGDPvLKb1WDzCv2CB2DTeRfgMQ/gb5/wcdJQw9rjo
         x7zwYkKleUu/TkI5IOXHuvsynHrrZ6YxD4+rnzDXcQOrADLqb3gdKkRO8SdyopCf7936
         +dx1eINAfupcUi/QnAUR1DhS6LEGyDGj+QbZYEA2Jgk0ltxJd75ylKMv3t0U5O43Rnv8
         oEfGgkauk5Dgna5c2BT2Tyo0omxg4yURN8JrOrYcbCi2hztwINLmFkBmPKVSHbspaaYD
         U4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Qa2gipLqcUvle1nDDxO4qBvYpn11CSwGYPi1Z8BnF/1lfDzpoYdPxgf0pwn0mJzOhXKLZqn1FeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+5XN7oYjk83Ei4xgLsrpllZluxKt30Y+53jAV5Hn806cv5YmK
	43kaW/VX4wr2udTSOlzHVCLdOqy+vgeAJmHWNfaU74H4euLx9wdmfjn9qxUYvw==
X-Gm-Gg: ASbGncucsQFGn10O+uNfWeA6rOgxPWYSLVka55jkLFAvKkPbb+hYXmDrfGqS9RTvT8c
	+xbSdtzmyxOT7Y3Xutld1mFFoFA7zep0oSMCDagW3lE/EfPsnMagBuMNLlHrTR8UxsUumj+F8ot
	l3S3Fna38e0hJuO1Jl2SmkWBPN7xoALGUdA4ZSzT9zL4hawXDMqr75HqV+6pekICw1PTJ3rtcAI
	miZIBav1tjX8TvrFzWb37JxjvlzVNubBrBh6FySnxFiNEnCFEZQUbDIRBvX9dRtHZg0np/jTMuW
	fck/d3I94OkwvL76K8hAYChRoDEwIJr12v4jy+XmNzklerjHs6cidLdlfmBWHZsdo30Cf/e9WfC
	p
X-Google-Smtp-Source: AGHT+IFWKF1rQXyhCym+nfn+HqJF4oEirj6sjOjO97h7l9dBPT3qx2YMNJgxpSgWX9Q7cns8sJFC8A==
X-Received: by 2002:a17:907:2da0:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-abb70b2f2d2mr1996425366b.29.1739973137667;
        Wed, 19 Feb 2025 05:52:17 -0800 (PST)
Message-ID: <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com>
Date: Wed, 19 Feb 2025 14:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250218083048.596012-1-dmkhn@proton.me>
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
In-Reply-To: <20250218083048.596012-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 09:31, dmkhn@proton.me wrote:
> @@ -546,31 +555,23 @@ static void __serial_rx(char c)
>           * getting stuck.
>           */
>          send_global_virq(VIRQ_CONSOLE);
> -        break;
> -
> +    }
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
> -    default:
> -    {
> -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
> -
> -        if ( d )
> -        {
> -            int rc = vpl011_rx_char_xen(d, c);
> -            if ( rc )
> -                guest_printk(d, XENLOG_G_WARNING
> -                                "failed to process console input: %d\n", rc);
> -            rcu_unlock_domain(d);
> -        }
> -
> -        break;
> -    }
> +    else
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
>  #endif
> -    }
>  
>  #ifdef CONFIG_X86
>      if ( pv_shim && pv_console )
>          consoled_guest_tx(c);
>  #endif
> +
> +    if ( rc )
> +        guest_printk(d, XENLOG_G_WARNING
> +                        "failed to process console input: %d\n", rc);

Wouldn't this better live ahead of the four shim related lines?

Also please correct the log level specifier here. I realize you only move
what was there before, but I consider i bad practice to move buggy code.
gprintk() already prepends XENLOG_GUEST, so instead of XENLOG_G_WARNING
is should just be XENLOG_WARNING. (Line wrapping is also odd here, at
least according to my taste. But since that's not written down anywhere,
I wouldn't insist on adjusting that as well.)

With both adjustments (provided you agree, of course)
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Given they're reasonably simple to make, I could once again offer to
adjust while committing (provided an Arm ack also arrives).

Jan

