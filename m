Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D0DAFCC61
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036565.1408821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8cr-0001iD-Q5; Tue, 08 Jul 2025 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036565.1408821; Tue, 08 Jul 2025 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8cr-0001ft-Mk; Tue, 08 Jul 2025 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 1036565;
 Tue, 08 Jul 2025 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8cq-0001fg-1r
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:44:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6369676-5c01-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:44:47 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso47290875e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:44:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c220a59d9sm2307498a91.33.2025.07.08.06.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:44:45 -0700 (PDT)
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
X-Inumbo-ID: b6369676-5c01-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751982286; x=1752587086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H6voHdpCsalob4UodLZeldYJdDhUg9SyWX+UBamCpc8=;
        b=EQh8mJSOxyW8yibgxhbjVeJQq2fqO7JE1TwcYlS0C4VH3CNLWquMBsgLat2PWd+kve
         u5lakLSpZh47pRuiApD1dy6Pcjjb1Yomd3UIQIEeo0KqVg+g5kOnSeoO/DAw25IfXsXG
         ETOqFYYyQi7VGiuHgCQpQoO/tZrLLAcxMkuCHcoR0OjLnlmc5KOMpzW9rHPJmvJDw+9B
         M56XCDi/YKzniigKetcJ2wYyNosPUOUaWSZMDHzcSIGJcENMI8wZR3dkCp9vV0gRS3g4
         fOmioPbMWobK+3H5yIYDdeZPgykUn9+7ZqeNbaetRWCLYwe5jJNuJosh9sjSwmVz+/lU
         X2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982286; x=1752587086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6voHdpCsalob4UodLZeldYJdDhUg9SyWX+UBamCpc8=;
        b=vk+P4hemsROkGYlXPT6FX7gR4M0oEvNLMR23U7kqTgWHKYmCxu8S7Uum00Z2/hyQLJ
         RSfPFLq9l2fhuOKOqyy/Bu6NtW3g5wvxT/GslZ5MjSaSCvhv7iNsmJehAxOxKS8QzfMm
         U5/15+pTcfS4Gi8LAIxSdGafez+tlYUDYtZzkqu6CwMbQhzZp1UF+R5XoC5QqvCPoldm
         eG7kCpZhjrN3iNOcnkFVvoq4MbT+3zUebebOgJ+C58J5Pz691NDmReMnEvflqzstV1/e
         k0tbVcn9ljxebYGUP1uzHCrGRC+FTW4kQMOYtwqDwfERpm56Fe2SO9vgBiNdcf07t//p
         O+lA==
X-Forwarded-Encrypted: i=1; AJvYcCXfr8H/7om192CxEEGOx0OpyXvM+fZmg//g+bDOU+RZCVPSuBJD78IPUFT2F1EH65126GNhHb5hDqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWxLAYiHjdc8hFcCHQjIworboiuMCMYZ/hXeh+fKkUO8fFRAIu
	Hn9PxEVD0OiFnkb7pDZDYHiazOLYt3dZXdjR9gou+RFRmxHsZVuvnQhNRh3mEyOG3g==
X-Gm-Gg: ASbGncsQ9SoUADGU+aVinePWdVQ9KUKQ7C2Gs1njxngvs87xHK/1GHZjUqzCDRgxJS9
	xom+4dmXrYoIELb9RCZUrolIkQST4pXA2lZBuTLgRgE13iCRpoC9x5Sdt0uqdY9DF5CFDPOWBgm
	mVOoJUloY+G4fM57T9+KKAZcuKx6G8RVM8OyE8ZrrYS7I5sN7dkxntn8GaIAHuQ8V/T+wU0hDfV
	UYS/CLw50MkOKH6UEmsp7ZIV23gdb8NgXzCm40La5cvTMq076xL+94l+wiBTzUxRzIszDvo2IsY
	N8tY4sy3XSrynE7A+kcwOD3EqLDJy3Hp2O2ZFtsDB3bBRu1dtJsNgb/4qkg9McFIbfAI2yP9XwC
	4CdxduecMZ18HWcSeIhVtr/pWiPmS+mqiopf3UbQL+nC1uYfu8bQwhobN3A==
X-Google-Smtp-Source: AGHT+IFcKYsqQlK10Csw1phUw0AkX5A45/lYxlBgGT4Kz0ov0dbFMR7SX7Vc9l/tCV2Qfl3TrDbzIQ==
X-Received: by 2002:a05:6000:2209:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3b497038f95mr15122531f8f.48.1751982286427;
        Tue, 08 Jul 2025 06:44:46 -0700 (PDT)
Message-ID: <b4c2e9bf-6bd7-4e26-92bc-3ad5d83dd144@suse.com>
Date: Tue, 8 Jul 2025 15:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xentop: Add physical CPU statistics support
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
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
In-Reply-To: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 13:46, Jahan Murudi wrote:
> --- a/tools/xentop/Makefile
> +++ b/tools/xentop/Makefile
> @@ -15,6 +15,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  
>  CFLAGS += -DGCC_PRINTF $(CFLAGS_libxenstat)
>  LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
> +LDLIBS += $(LDLIBS_libxenctrl)
>  CFLAGS += -DHOST_$(XEN_OS)
>  
>  # Include configure output (config.h)
> @@ -25,8 +26,14 @@ TARGETS := xentop
>  .PHONY: all
>  all: $(TARGETS)
>  
> -xentop: xentop.o
> -	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
> +xentop: xentop.o pcpu.o
> +	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
> +
> +pcpu.o: pcpu.c pcpu.h
> +	$(CC) $(CFLAGS) -c $< -o $@
> +
> +%.o: %.c
> +	$(CC) $(CFLAGS) -c $< -o $@

As you mean to re-submit, you may also want to tidy (back) the above. You don't say
why you need to spell out both the explicit and the pattern rule here. And I don't
think this is actually necessary. All you ought to need is indeed the addition of
the extra prereq object file.

Jan

