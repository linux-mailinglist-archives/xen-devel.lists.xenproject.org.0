Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CEA20C5E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 15:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878546.1288727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcn0N-00037m-Sw; Tue, 28 Jan 2025 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878546.1288727; Tue, 28 Jan 2025 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcn0N-00035O-QO; Tue, 28 Jan 2025 14:55:55 +0000
Received: by outflank-mailman (input) for mailman id 878546;
 Tue, 28 Jan 2025 14:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcn0M-00035G-4R
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 14:55:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7aded1a-dd87-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 15:55:51 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa66c1345caso271984666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 06:55:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbe92sm800028866b.131.2025.01.28.06.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 06:55:50 -0800 (PST)
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
X-Inumbo-ID: f7aded1a-dd87-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738076151; x=1738680951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7DKF9GhoQrHwtEPC7q2CRYlIVUo0o6yRv3V2OPPdXck=;
        b=Q325kpWwvBBVs7lKbGRGZ1WGWpH3GKe5c+Fqzvjd9prNxTWUDJzl8p9GCY6KazYIvX
         zppQvjkBYJ4B2r0OCMXhfFrsMZfX2iZgOnGOTQ2ZfsPia1PWvtqXBlWsN4xnwSggbziD
         1HyPSYJ6pSl4XR9wdTaIcKpGt4kkrP4zei0k+NIqENlxxMYLAtW5rosp+B44vbShPOHQ
         17DWwOtfs7kTazTWyxceZeRebz61j7cdJpVAZeeNnfQD4twwPj+slCYlMgaX/smxcelC
         1dlPYbKGshSARWaUF8+CMcsVhvo1vHEoOGUHBgn3awrZuHdKGDwA8kken62d7UZcs1pR
         LS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738076151; x=1738680951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DKF9GhoQrHwtEPC7q2CRYlIVUo0o6yRv3V2OPPdXck=;
        b=L20ItEesEP2Kx67mH6S+zSQwaQZiR+I5AxkVIB60rg4nGEfUtTolbasolsLsNqPFh8
         dqPrHR+zt5QpPwEWVTXHhb1IYfR2ZyRK0t2tIJOnYOiyG2Cls7ReliATsbWVhwZMSPnT
         YIaIz7SLYS5AonNcLtuMgbKjq4fujF9nkH+AkrWfkuMQjW2a8a25YsFeR/KCldQQsZmy
         ExODFV8MV0z4T52DRbCso96I8xd8SoPOluBdpIFq8bWdyLNpP0Hitq4IVzp+iCeUY1xK
         tF1H22Aun3uXw6OsxPXvwlQgWOP3vpnRW3drrcEZnhcoAWcULzOhA0K38J84xdEmg0r5
         PTug==
X-Forwarded-Encrypted: i=1; AJvYcCUygvnJT27L4+fKrcIrpa6jigDTv6mQSnBsrJbPYqE2S7TxC5GNHH7HCT35ZBAm0wn2yC5k8eZdoc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA3i4hRVF3M9B2FiTpL7l0fimh9g0jcf+WK33JNOagooYEG0eb
	NJHyxh0/juCHCBkSL+AFUX0zzQ6zEMoBG6md7sjVMrTcxM9m05r2yZkMrrzFLA==
X-Gm-Gg: ASbGncsYHKlsho4yDLEtne6kkxaXwQT+RMsJI/5xGM3b0B3+p09zaV74SBsAax6EWFK
	Em4I7NUKOB2AfR7a/cOBfks4926QfpSnToXWIBrTf1JTHSLcabOKSFbPgyWYy1zKHSpKy7ubK+1
	XwTTsp0TFSOPU75KD9hj67nJU0dHhG/uTQgQTP9QVAzCJm+/xOoPEcOqchXL7O3VOesAfhm0+GI
	sCEZ15X4t+gB/ptJwj7DCNu55acfZyD2Te44gnljEqGmyjXliDfSm/r6SEjWfgLUhlpfEzj9T+d
	mfbAL8aoJVAKhGBhZjk+F9nrjOVKVD+RfGSCCZmrPguZK+OJ+tA1mI/ErbAtLRsMQqbdHxCzggU
	r
X-Google-Smtp-Source: AGHT+IFyfu1kscEgbfSZwh3r0b3vQ4Lm/q180GZfN52ySA5lBJqKZPeCFMmF/zcD0kgfg2baN57tDg==
X-Received: by 2002:a17:907:7e92:b0:aab:eefc:92e5 with SMTP id a640c23a62f3a-ab38b1f33e1mr3987559866b.14.1738076151247;
        Tue, 28 Jan 2025 06:55:51 -0800 (PST)
Message-ID: <e899f63b-6182-4b53-9fb4-9a821e75648b@suse.com>
Date: Tue, 28 Jan 2025 15:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/24] xen/console: introduce use of 'is_console' flag
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-10-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-10-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>

First: The title gives the impression that the field is never used (read)
right now. That's not the case.

> The code inspects d->is_console flag to decide whether the console focus
> should move to the domain with console after administrator uses <Ctrl+aaa>
> key combination to switch the console focus.

It's unclear whether this sentence describes what is the situation before
the patch, or what the patch changes things to. (The impression I'm getting
is that it's the latter.)

> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -985,7 +985,6 @@ void __init create_domUs(void)
>              panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);
>  
> -        d->is_console = true;
>          dt_device_set_used_by(node, d->domain_id);
>  
>          rc = construct_domU(d, node);

The flag having an existing user, what's the replacement of the setting of
it that you drop from here? Same question then goes for the places where
you set the flag anew.

> @@ -562,8 +584,19 @@ static void __serial_rx(char c)
>          /* Deliver input to the PV shim console. */
>          rc = consoled_guest_tx(c);
>  
> -    if ( rc )
> -        printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
> +    switch ( rc )
> +    {
> +    case 0:
> +        break;
> +    case -EBUSY:    /* Loopback mode */
> +    case -ENOSPC:   /* FIFO is full */
> +        printk(KERN_WARNING "d%pd: failed to process console input: %d\n", d, rc);
> +        break;
> +    default:
> +        d->is_console = false;
> +        printk(KERN_ERR "d%pd: disabled console forwarding: %d\n", d, rc);
> +        break;
> +    }

Nit: Blank lines between non-fall-through case blocks please.

Jan

