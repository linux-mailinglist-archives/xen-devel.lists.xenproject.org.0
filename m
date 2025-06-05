Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFFACE9FF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006251.1385439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3w7-0005zE-G2; Thu, 05 Jun 2025 06:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006251.1385439; Thu, 05 Jun 2025 06:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3w7-0005ws-DB; Thu, 05 Jun 2025 06:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1006251;
 Thu, 05 Jun 2025 06:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN3w5-0005wm-OD
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:18:45 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef099f64-41d4-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:18:44 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so291569f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:18:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb96f74sm9592303a12.62.2025.06.04.23.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:18:43 -0700 (PDT)
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
X-Inumbo-ID: ef099f64-41d4-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749104324; x=1749709124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jC4eir56QUeDqUtrV3PuuzEGAU9maPN452N8Yr+PYs0=;
        b=Y5M4oERtV7xJKfH9I2SN8pn4svHpYdkF+6+5EoYvXOOQdaIDw/Jfy4FluwKc7d4X9o
         FNEzvh16F9pkxK/uEU6OFOdto4Qp4pSq/lDDie3KZzx6C12m6vWUD5wRFRe4dyhbhNxR
         /TIndb5dRcsKtD5dCLKgMvH+C9FJ7wsUV2eQlZn40aaPHJJoeAZ7npvMCF2m5uaiEKc/
         kZ894I7d4cmNzTGJwNSCuKtpo+Emd7T2BtRIO4uEtdK4vC0/iGHFhHwwAAm7mwi6BgpF
         OaP+whPH1I2y/IeDui8yedcFXpA7o0ieZJaiq1V2U36KZU4zIMLUIwm+N1KJzx9Q3cgc
         ro6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104324; x=1749709124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC4eir56QUeDqUtrV3PuuzEGAU9maPN452N8Yr+PYs0=;
        b=pN29U5RqgYa8eFiuuOmIekvKyysrXhA3RfTQVphGJQh1tQbLM+nqJF59VEFAMABxgK
         v/i2gz6anMuPw9p7Gk8nrnWvSZfmTRajGqUc81EkJdtqETVXyy/4Zv0meUKnmGYe4oWU
         Et9QW4dmSVJ39KOg3aLSXp+k2noftCiKP4VTQlWEmvf5P8rpZIhjVHm6LST4CTX35tNs
         BQabNn2BmnBUeMafq98BEQAQ0XQKo/2RRgAH9aFqA8MEotMu6OlGLJIwZgsqJEFRLCFV
         QCCc3ropP3f73evGHESpntnXZ6CfetmN1RAO/uH7n4+wWP3te79DmHV1n7z+k52MNDTg
         FsqA==
X-Forwarded-Encrypted: i=1; AJvYcCUiEdci6cQ6vUwyYOufoqBwKYHjQBTOoaA4aASlPBj630HzUkkTrG2fIwOo7FunlRSsBVLp7FpyI04=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz/rffRBJKumvpS05JQm9XXe5CzNjqNov6e2RdetX9FjHacSUT
	SZD0HzGUP+o2xgdEj9Yn5yCT2kftn6k2C+iytXYwKrcmv9T3UX9xLiqul03PjeUanA==
X-Gm-Gg: ASbGncvHS+D5ikDDlq0V+5GcQdDKc0IRonveknDIcQi/Y6jv7bXuy0AlcBRB68tHXXf
	LWhrjdCYhYXz8jTq2FtGKYfDe+S6O8ELWUzCMd4XdYO83164CiMebUwNNmj8pIMRT9jpXSdXwm3
	8HOm0nuo5P94seR6uj4yCDPY3gxjB1iFxnqwrAUYcHaIZzBe4/IxmbnR3EGwcOMHDzsb/nqrQNG
	qBwOWJ40trCc9TFkq+RKPDDA031DN67N3VEaEWUlr83I9P8yB9RTHHY+djrGfK/8Pz1VRUDDNK4
	xp1b78YRvUuIj9J12xwmZcxUkkJvTouHWWoQrM10TeTFO6Q1GAxp/A59J7raxLLcaBGpidQlfPQ
	+P7sJ0W+ZAhcl1qhQV2ltiL2GyV1X6ROJJVw2
X-Google-Smtp-Source: AGHT+IHadoUCl0ZXvlEzsufjYXp42virJcyCAo1Zop8+VZRJYrXMrTD7eD3GVj+WdeXFegM/HBJA9g==
X-Received: by 2002:a5d:64c6:0:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a51dbb5fbfmr4402134f8f.8.1749104324264;
        Wed, 04 Jun 2025 23:18:44 -0700 (PDT)
Message-ID: <842528df-d0ba-4ab2-b182-b6f824c82dc1@suse.com>
Date: Thu, 5 Jun 2025 08:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250605004601.1142090-1-dmukhin@ford.com>
 <20250605004601.1142090-3-dmukhin@ford.com>
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
In-Reply-To: <20250605004601.1142090-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 02:46, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> If virtual UART from domain X prints on the physical console, the behavior is
> updated to (see [1]):
> - console focus in domain X: do not prefix messages;
> - no console focus in domain X: prefix all messages with "(dX)".
> 
> Use guest_printk() without rate-limiting in all current in-hypervisor UART
> emulators. That aligns the behavior with debug I/O port 0xe9 handler on x86 and
> slightly improves the logging since guest_printk() already prints the domain
> ID. guest_printk() was modified to account for console focus ownership.
> 
> Modify guest_console_write() for hardware domain case by adding domain ID to
> the message when hwdom does not have console focus.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop/
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped change for debug port and for HYPERVISOR_console_io hypercall

Yet then what about ...

> --- a/xen/arch/arm/vuart.c
> +++ b/xen/arch/arm/vuart.c
> @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
>          if ( c != '\n' )
>              uart->buf[uart->idx++] = '\n';
>          uart->buf[uart->idx] = '\0';
> -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
> +        guest_printk(d, "%s", uart->buf);
>          uart->idx = 0;
>      }
>      spin_unlock(&uart->lock);

... this dropping of XENLOG_G_DEBUG? In fact I'd have expected such to
be _added_ where presently missing.

Jan

