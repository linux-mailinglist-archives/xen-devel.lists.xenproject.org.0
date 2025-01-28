Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919AA20DC6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878594.1288777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnxH-00059D-34; Tue, 28 Jan 2025 15:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878594.1288777; Tue, 28 Jan 2025 15:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnxH-00057o-03; Tue, 28 Jan 2025 15:56:47 +0000
Received: by outflank-mailman (input) for mailman id 878594;
 Tue, 28 Jan 2025 15:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcnxF-00057g-IK
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:56:45 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7824990b-dd90-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 16:56:43 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so12082993a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:56:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e63187sm819086466b.54.2025.01.28.07.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 07:56:42 -0800 (PST)
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
X-Inumbo-ID: 7824990b-dd90-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738079803; x=1738684603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+Jc7LX022C3BYlmGfVU8QtvBWEmBStKt5P8xHN9Qic=;
        b=OMxQHpD+32FCUJE2EPe5fQlSPX6DR+jvncdZU/LBMMS38wN2hXKWpUPU9EdaPNsJsL
         dIgQynCLAf4MX2VAsfNJzF7htCLdBvsNbaxQKsfvpxzO/xumeVuqInu0E1DDe/89QRsB
         OsjpXrC+DKo3Y9jvy1MspA/i3moA198s4iCRgDEi7r5T8CD3Yc3BaC6RyMf6pqVC9X/U
         yX922I+Vd69tg0rdGucxgS3Zn2u7EBXNhAkLGy5VT1H0jkYuq6AcQ7ATmBU6CzpM2CPh
         AHQ4Tjzf1rVuCsKtsIw/p0kNVM8GdJrohHK/piROqWuXeIYDc98ZguZSaV9ocw/MHxJH
         i7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079803; x=1738684603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+Jc7LX022C3BYlmGfVU8QtvBWEmBStKt5P8xHN9Qic=;
        b=tmjhPwjCLqvlXmEQE/gcOAbIB1rQ/uP6y7QyUm6/F/5bb6K1qFJ0wEgKTtDKukk7mI
         blrjo/wv0OVLfLiThiOxCWNSS6qF6JXDwt5DoahhKxBZ2KDn3j1LZ1T4aUn4bHPndlW0
         nAeLvUuyYV9cZOt78DeJQeWGv1UZIymYj6eOxYR7hXX00RgtEl5DBP6v2TIXD7ZDkZYg
         7RRnrWrBvRN502Dc/32Hd8cXVfMe364QINaEHDEwtaUi8FzQVxfnxMCfNS5GMDTWFesc
         4x1a4+rCDtoJW+aUsOQfG4FViK88oG2DmOnXai5jRUt9EYU/R/hhvyssUdEQ7Y2dFkuo
         w+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUsnxiuuK1PFDfhxXgCbJceV+BWUsBIIyKRXTD2RXcx3ew/XvxZzZDFUwEHrvASrZsh5usAs9kvg48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsR0xbqwH87er7EmTiek97oFgWyhbCbq0EjZ9zruQq07/spj4x
	/kPJ9A2tGy0mZOgvrZgQbiLEe7uk+cD+FGgoMepoBs43gL9Rv1Y2jkyJyrkEnQ==
X-Gm-Gg: ASbGncvZJ7HXjnB0y9RN08mJmh2pr5+6dBgLG4cyOAsLbNMjuhHHpageReI2DVjfc9f
	1LsVkwEHIv6T+ryRuyr2SmPMgHHKZ51mXi33kpn3XztDZtSEtga1kzKSII78Y5SxjTHsvEZwY50
	A3SEt/8ZlyiORJc7NDVhPSNyhKNJYtrSvGMq+6eqtKWE1MVGoEza4ZMJ4Vzs6GSv3BxmI9A66uh
	os4VPI9XbujwLhS1zK2joGMK9yy5MlqP7Nq4uUAA/HxM5CSwnfQHPTgfM9g/hR0SaH98KGGq0YH
	hjRsIZgC53eStDMWDvOSDuh+2p17NMBQZOW9hCmoacDVhEYumYSU8+It4BQIkbnZgQibdIjButO
	J
X-Google-Smtp-Source: AGHT+IHj//euB364E2sx2WN8+ni21ZMA0mHu/ZQYZEb6ibuK+tS/EZIcVdQIwdwECM0OHIdeGo2PdQ==
X-Received: by 2002:a17:907:2cc5:b0:ab2:c78f:e4ae with SMTP id a640c23a62f3a-ab38b12a246mr4463393666b.20.1738079802689;
        Tue, 28 Jan 2025 07:56:42 -0800 (PST)
Message-ID: <1297dd85-631b-45dc-9839-6488744aed34@suse.com>
Date: Tue, 28 Jan 2025 16:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/24] xen/console: introduce hwdom_crashconsole=
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-13-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-13-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> The new command line switch `hwdom_crashconsole=BOOL` allows to switch serial
> console input focus to xen for machine state inspection using keyhandler
> mechanism after the hardware domain crashes.
> 
> The new command line switch is aliased via `dom0=...,crashconsole` knob.
> 
> Such functionality can be useful while debugging dom0 bringup.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

First, going back to what was said on the earlier version of the series as
a whole: Is this really strictly related (i.e. in preparation of) adding
the vNS16550 driver? As previously indicated, it would help if the series
focused on its main goal, with less tightly related stuff kept for later
(or submitted independently where possible).

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -822,6 +822,7 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> +                crashconsole=<bool>,
>                  cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
>  
>      = List of [ sve=<integer> ] (Arm64)
> @@ -855,6 +856,10 @@ Controls for how dom0 is constructed on x86 systems.
>      information during the dom0 build.  It defaults to the compile time choice
>      of `CONFIG_VERBOSE_DEBUG`.
>  
> +*   The `crashconsole` boolean instructs Xen to switch input console focus to
> +    the hypervisor when dom0 shuts down and avoid performing dom0 domain
> +    destruction.  Should only be used for debugging purposes.
> +
>  *   The `cpuid-faulting` boolean is an interim option, is only applicable to
>      PV dom0, and defaults to true.

With this, ...

> @@ -1491,6 +1496,15 @@ Specify whether guests are to be given access to physical port 80
>  (often used for debugging purposes), to override the DMI based
>  detection of systems known to misbehave upon accesses to that port.
>  
> +### hwdom_crashconsole
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +The `hwdom_crashconsole` boolean instructs Xen to switch input console focus to
> +the hypervisor when dom0 shuts down and avoid performing dom0 domain
> +destruction.  Should only be used for debugging purposes.

... do we then need this? We're kind of trying to limit the number of new
top-level options.

Then: Please prefer dashes over underscores in new command line options.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -286,6 +286,8 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>          opt_dom0_cpuid_faulting = val;
>      else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
>          opt_dom0_msr_relaxed = val;
> +    else if ( (val = parse_boolean("crashconsole", s, e)) >= 0 )
> +        opt_hwdom_crashconsole = !!val;

No need for !! when the lhs is of type bool (as can be seen in two
examples in context).

> @@ -1162,7 +1169,12 @@ int domain_shutdown(struct domain *d, u8 reason)
>      reason = d->shutdown_code;
>  
>      if ( is_hardware_domain(d) )
> -        hwdom_shutdown(reason);
> +    {
> +        if ( opt_hwdom_crashconsole )
> +            console_set_owner(DOMID_XEN);
> +        else
> +            hwdom_shutdown(reason);
> +    }

And how will the rest of the system be halted? Keeping Xen alive
is one thing; keeping domains alive is another (and imo not
acceptable). You don't need to destroy them, but you want to pause
them all.

Jan

