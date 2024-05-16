Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D08C750F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723164.1127760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Z5l-0001um-Pe; Thu, 16 May 2024 11:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723164.1127760; Thu, 16 May 2024 11:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Z5l-0001qN-Mn; Thu, 16 May 2024 11:16:09 +0000
Received: by outflank-mailman (input) for mailman id 723164;
 Thu, 16 May 2024 11:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Z5k-0001qF-4P
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:16:08 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe0ff66-1375-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:16:05 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-571c2055cb1so920788a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:16:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ea5d755bsm3343542a12.51.2024.05.16.04.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:16:04 -0700 (PDT)
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
X-Inumbo-ID: afe0ff66-1375-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715858165; x=1716462965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVGuElW2+RdLtsUoiSqvoN2DvuwbqRicQPDBXdv6SCI=;
        b=HRh0P4O/DH9g2GmGbZEhdQET9GHbbGQt+iYnlniZnSQuN+W0yCvec545RMys1bOOjY
         xztwwj3Ild9D9HQzDuK89rHZQytfOiigCOmrmyOUaWrVS1sO1uw+p+4xPK9rGqQJCpyD
         6xzA1GvgnnMBj056Z05ihijTSXxq+o+6K1TH+dLzVK9fwTWtaUtXxv2exRK7WPFF8wlV
         DVuP2Eyhrx/3Qb+9E2LuUhJFGkvsc/B+hsCv8neLNWroDC58AHAAv+LgyETtvgaJvN3u
         eOVx63vRmHxMGh2gQ2A7GCilm64KFuWS7G5Bv2bgkMNk2aiDrPx4UnmANSxvfk8wCIa0
         d3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858165; x=1716462965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVGuElW2+RdLtsUoiSqvoN2DvuwbqRicQPDBXdv6SCI=;
        b=NcELTBbYcMlLDAm8wHhghDuLjO4P5OyabgbeKLmoYTfLdK+EFBWX2QhNSyO4vAaW8y
         l4XNlcFKLnaXjn9Lw1s2UDS+KAJzeEAQpLYus0L47PJkqONmlwNfQDAaBpK5dwS9YOAm
         t+okjBfVjzJtvJDbdZv5I2BK2w6WhzBnOkebHZi3l5ibSyHNXhQFpSv5Y9SP0ECC9tTy
         fmIcRAM4IIccfuShjDn6fvLd/28NavREkFr8mB+XoZttLzoTT3YaO0jr0abP4A84pKDu
         tPjxcCVcyodBdCLjJ5zASlgsHananCkpgDyCTmm0LtBWbLyNrSOxonW77WNmi/jXkY6e
         hwAg==
X-Forwarded-Encrypted: i=1; AJvYcCUhGYW15FtCA5868Xt34CtfRz/6NJdOMHUFXw0nmJ1M2nIEgGfJfjfaRWTer5unRzo3n9Si+jcPkauk0LlcZdmyzNhp1esmJoVyg41XulM=
X-Gm-Message-State: AOJu0YyCB1mvnmdlaR/AjY13LqhSma/WfQNnko4876JqExwEKMVgqY75
	RV+8qKwsaZQGUMq7xK2Kk26XtvuKCqwAUPWIgcIZ0Uo9XrQwkI3h3onZANH89+cBSngjvzVMHTI
	=
X-Google-Smtp-Source: AGHT+IHI36nNeKI9stQGcSG/sERMn7XS+KrkIa5iDGhC+hZzw9m42rfl6qDe2/sId3Kp4Jin7N2K/g==
X-Received: by 2002:a50:9f06:0:b0:572:67d9:6c3b with SMTP id 4fb4d7f45d1cf-5734d67f864mr16295577a12.26.1715858165048;
        Thu, 16 May 2024 04:16:05 -0700 (PDT)
Message-ID: <cf8cfb82-7a69-4690-8afb-d971dbe8b7e3@suse.com>
Date: Thu, 16 May 2024 13:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 13:07, Alejandro Vallejo wrote:
> Bring test_x86_emulator in line with other tests by adding
> install/uninstall rules.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

I'd expect such a change to come with a word towards what use the binary has
on the installed system. Imo we should not randomly put binaries in place
when there's - afaict - absolutely no use for them outside of development.

Jan

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -269,8 +269,15 @@ clean:
>  .PHONY: distclean
>  distclean: clean
>  
> -.PHONY: install uninstall
> -install uninstall:
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
> +
>  
>  .PHONY: run32 clean32
>  ifeq ($(XEN_COMPILE_ARCH),x86_64)


