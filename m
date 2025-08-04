Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C643B19FA3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069034.1432878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisIg-0005R2-4b; Mon, 04 Aug 2025 10:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069034.1432878; Mon, 04 Aug 2025 10:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisIg-0005Ot-1j; Mon, 04 Aug 2025 10:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1069034;
 Mon, 04 Aug 2025 10:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uisIe-0005OZ-KP
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:20:12 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa0f61f-711c-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 12:20:11 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615c8ca53efso6590427a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6176052d163sm944386a12.48.2025.08.04.03.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 03:20:10 -0700 (PDT)
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
X-Inumbo-ID: 9aa0f61f-711c-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754302811; x=1754907611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ngxG24gtmdeLe70doGO2EN3TZL4REuYZqRMoH/TkfnQ=;
        b=V8Osc/80GIERpkWWkqlqEtV6OIyW4tGxZY3YtODKkpnyhDenZ5rP+53idveTlK4Tbb
         4x7h5J9266XrUwpUkLowV7Lm7gzhiQh2E6PQRygDC82f3ezXs85qxHHYvQNS6b4z6T8P
         gJztG3J6N87ZjAG2iXZBNCdCxHptfDbuKM2nEBkaxQsfBm8LhD9ic9cPfymCIsr4Jyu9
         aUUOjXwWVJFXlFx4W4zbyEVF6vgLbBoVRz0tmUsRfnQpP5Nz76IBQbbOkmCfdKefGoIA
         kfalp7doQZgiCWranWeB+eCCcHjLLXlxTMGrIZBpE6LZQ12o695oFj/u7uFjbNCpJjhG
         vCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754302811; x=1754907611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngxG24gtmdeLe70doGO2EN3TZL4REuYZqRMoH/TkfnQ=;
        b=tfpjz3mcRqgul3zhxe0EXkdgRY1nrvlvYpWlZu4d3nUSnXCnB5NxXHF/NEvxTN0Q5E
         lOV/SZJ146lAZKsK0Fxsz2i17WfwVQdNfOSxDnjHCFZC81W1hZal4JV0coigZ5qFdb5I
         hy92bUbwVfaA2wHg813kuRUSA882WaFjVRVSt1nJS2P++/cTf+rYIDfHT8ML17WiLcdP
         l8OzPyHdChjUCbzzntys/wGKHs0boOFho/i/8zMI2v/tbqXHApmxc9AnS3tbTA/Y2xnG
         7a+QltgZZ9xQ4ZIOBNV5UsrkyiRiAhHM+b+2zD7Dq4cWcLwmYgRjHsvm+RqcjpXY1H11
         r/mw==
X-Forwarded-Encrypted: i=1; AJvYcCUopoOJHgyFh1vjbYpsJl5gTRXk/dIkIaXqv5bJJpcSbXxDIIZuER57LD5rnQLzjUam9+X4s26lKIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBObLcd7iSXWdwNvMYKHs0gpLRU4oPxEWWosVBEotNYvDttPIX
	AAlLxukOUH8GaY2VgCMuiiToMRZT9RqPF301X4tfuqSTzaIq9fFgrygJzA3tM46J5w==
X-Gm-Gg: ASbGncuLoiTeIfqh2eS+1+Y8CP5mZmeiM2UZNW4dN4SjF6ySpDvGfjDL82XEg3pbSLj
	iuSb2aNvjT4ESt3uKpNm2udGLrdFcLo0fjBuPLZDm2A0cWBdpGyEQDq8OJnh9RqsPWOnlTHlBtE
	y90ternadShqSslHSAo0P4hjlf1OVbnKJPdjFH36+SxH93ijP6inC0+5YYlb8ErvnZw4wNFwado
	dx4IscJOnW21KQl/Sl9SZCaruq3tFuZUt4sPsmZJjHqeaSURfp97KnAn1W/lfZCPR8IGGgt7Zi7
	V6WcSDvnSCI5tcGU9QjyQTMEF+Veu4U3oMNYbaCjN1RJOaX8+GvES46klyowVviooWcKwzinS5k
	Ng63dgiwf5YcTebnrjGpaE5BZXlPBS63fk7/03KTpjrRLm5KtB1VGWv70T/13HVFBHHJF4rb9CG
	RxHowDx5Q=
X-Google-Smtp-Source: AGHT+IEKY1Av/KABrUK8QD+D0aWKj+S8xbai1oAZMCW8YOWW6VIcl5KKgUB5yuUthxXO86WmOfyI5g==
X-Received: by 2002:a05:6402:1d4a:b0:615:b9cf:ef3b with SMTP id 4fb4d7f45d1cf-615e71749cemr7354078a12.34.1754302810973;
        Mon, 04 Aug 2025 03:20:10 -0700 (PDT)
Message-ID: <032daad1-29a0-48ca-9f50-5234d42a3ea1@suse.com>
Date: Mon, 4 Aug 2025 12:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before
 arch-specific initialization
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-4-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:21, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> 
> That guarantees that arch-specific code could access those rangesets to
> register traps for emulation.
> 
> It is necessary for those emulators registering trap handlers and ensuring
> that emulated IRQs are not shared with the physical IRQs.
> 
> Move dom0_setup_permissions() call right after I/O rangesets are allocated.
> 
> Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the place
> where MMCFG ranges are initialized.

And this is just because you like doing so? I ask because first and foremost
I can't make the connection between this and the purpose of this patch.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
>      }
>  }
>  
> +static void __hwdom_init setup_mmcfg(struct domain *d)

Why __hwdom_init when ...

> @@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain *d)
>      if ( pv_shim )
>          return 0;
>  
> +    /*
> +     * MMCFG initialization must be performed before setting domain
> +     * permissions, as the MCFG areas must not be part of the domain IOMEM
> +     * accessible regions.
> +     */
> +    if ( is_hvm_domain(d) )
> +        setup_mmcfg(d);

... the sole caller is __init?

Jan

