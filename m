Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FDFACDC1C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 12:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005403.1384883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlfJ-0000NT-A0; Wed, 04 Jun 2025 10:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005403.1384883; Wed, 04 Jun 2025 10:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlfJ-0000L9-79; Wed, 04 Jun 2025 10:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1005403;
 Wed, 04 Jun 2025 10:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMlfI-0000L3-82
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 10:48:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662343f4-4131-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 12:48:07 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so1044976366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 03:48:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82ccedsm1075589066b.48.2025.06.04.03.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 03:48:06 -0700 (PDT)
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
X-Inumbo-ID: 662343f4-4131-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749034087; x=1749638887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fG3HJmUeDmAud3SYdcrzvH6XfWyeWXYbj4gkMX0vrTU=;
        b=ZQ9mXe7mMGbePcsNGB98A8slRVRv78o888UT7SpKBl8zh1VQrBMovPcNwsr4pm2Cx1
         fsX5cDNt+ZN5BEuCMipWeLFwIh5rmYdJp6gJ3Ow554ZnGHO+B573pzzgNwC+e/R7+pa1
         HP5kkn7wF+nosJiIw3RooNtAIykRpFdB8BWxNllO5aj+wTKm9DRvpdXPXumzowsjxUKL
         pz7lGKeaTnqMYuJxrDeUbygg3fg8vVCVJk4JHtPAuNAn5DOLeE1aPVvzUorLH9YSZ/6Y
         zT2TWCCZD/BNdfm1CZy69bdvEDWwtZbppawdrFJd46MLyvfX0Fs2wyC36y1pY0VX4bjW
         O8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034087; x=1749638887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG3HJmUeDmAud3SYdcrzvH6XfWyeWXYbj4gkMX0vrTU=;
        b=la11ZhOJa9WTmR4x0jHcJ08lQOnOOimQeH9RozfH1LGQXTQ9H6v6/1g+HSjLjtlzlE
         qgHt9AmLPBFY5nl1ApQGUZqg8FuNIqx6sHRgKksrhqQQr7EjhGZN3RhwqZ1osPqDJNF0
         C9WAMTFs/GjI4SyJN/zxlr4eZ7XdiiSNwyabh7R7EchnZPAQ5j8bLgwUnsckqFKNHOF8
         xoBVFuqoEBl1qj5/fBQZ46QIx870tXPAm1ya/u6rW75qZwxMsrNXEnuo8c8yy6QSLHfr
         pDyGPRPmKjqeH5j0DHTzyqZChr2bqghhQnKtv/xxbkGQD++L2rhvOH/gK4u42f/1Ux/U
         0ojQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK624ZBI9JKawy8VodCIoJ67Ppei3x6XkZrybDM+hjTKkBz+DOX8hTu4tifyp4nuUna4fdUQBe9cU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf9ciNEUJ5nbOtQmvIqLKL3iS5ubfgqN8tpSPEN96oSiGUd1qJ
	R3Y1pu7HQrkGzzxIKav28yE0jhlI2EbfqfKtyuS2OIe9GpnQ6BOJ/HoKU1IQGHs/1A==
X-Gm-Gg: ASbGncv5AtTCpvYTvFMcoeH+cnSfmwk44w2VQ1nOpPGn3RH/p82JkyVE7qX9HAv6VxP
	wo/kSAyb5QYE1Mk0PsTU8C4ojNq8mHwDPNlWBEiqqVmntYbjRGAHQI1UUYXnvyGRrs7BrQwMgb+
	38XQzitcOa76va5TzXbQzPNYRTFP47zyWbbkWnMV0eUr/eXdmLNX5VDKEvu6Nt2pFfkEs4SZfN+
	FMNn0iyXBZX1CcJatQeJrhY+jSPRCiaSCshURG4ByBjMljXODlsBDmwLoJ9b/6yTP86HC1W7Liy
	u+gHfTR4YGt9veDQk/NW7kGYvdJU6HX2PyHbPoucHEXEjExy9Zy1mUAMMJJU4j4aG/EId0lum/p
	YxHmGb3vXP3cyRJ42+coPIuu9aXv91f3er0n9tZ1qTFBN+cQ=
X-Google-Smtp-Source: AGHT+IFS6T++DZRcSRhV0nuL1AbAiV1mp0qSqBJmvvJsmTAN+nLpoYRCvT0Di+ZuryvlzPphIYpwrw==
X-Received: by 2002:a17:907:7e8d:b0:ad4:cfbd:efd0 with SMTP id a640c23a62f3a-addf8f256admr197566666b.36.1749034086681;
        Wed, 04 Jun 2025 03:48:06 -0700 (PDT)
Message-ID: <71318dd2-0724-4c2a-9786-40b676411e56@suse.com>
Date: Wed, 4 Jun 2025 12:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250531000417.81750-1-dmukhin@ford.com>
 <20250531000417.81750-3-dmukhin@ford.com>
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
In-Reply-To: <20250531000417.81750-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2025 02:04, dmkhn@proton.me wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -577,7 +577,7 @@ static int cf_check hvm_print_line(
>      if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
>      {
>          cd->pbuf[cd->pbuf_idx] = '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> +        guest_printk(cd, "%s\n", cd->pbuf);
>          cd->pbuf_idx = 0;
>      }

Why this and ...

> @@ -755,7 +765,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>              else
>              {
>                  cd->pbuf[cd->pbuf_idx] = '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
> +                guest_printk(cd, "%s%s\n", cd->pbuf, kbuf);
>                  cd->pbuf_idx = 0;
>              }

... this change? There's no compensation for it ...

> @@ -1013,12 +1023,21 @@ void printk(const char *fmt, ...)
>      va_end(args);
>  }
>  
> +/*
> + * Print message from the guest on the diagnostic console.
> + * Prefixes all messages w/ "(dX)" if domain X does not own physical console
> + * focus.
> + */
>  void guest_printk(const struct domain *d, const char *fmt, ...)
>  {
>      va_list args;
> -    char prefix[16];
> +    char prefix[16] = "";
> +    struct domain *consd;
>  
> -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> +    consd = console_get_domain();
> +    if ( consd != d )
> +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> +    console_put_domain(consd);
>  
>      va_start(args, fmt);
>      vprintk_common(fmt, args, prefix);

... here afaics, so it looks like you're undermining rate-limiting of
those messages.

Jan

