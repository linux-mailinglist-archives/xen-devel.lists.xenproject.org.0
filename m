Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27116805704
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647944.1011744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWFp-0004vE-9V; Tue, 05 Dec 2023 14:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647944.1011744; Tue, 05 Dec 2023 14:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWFp-0004rs-6f; Tue, 05 Dec 2023 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 647944;
 Tue, 05 Dec 2023 14:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAWFn-0004nk-FE
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:18:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26fc57fb-9379-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:18:25 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332d5c852a0so4523088f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:18:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b003333a216682sm9360488wrb.97.2023.12.05.06.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:18:24 -0800 (PST)
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
X-Inumbo-ID: 26fc57fb-9379-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701785904; x=1702390704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AotARsj+VFna1B6Y1dBKJsrGcJLPZmGGYp80tG8dyY8=;
        b=TCdZ/9n43D+g7GQ/PTC466GdZq6Oi6jL2wBa7y6U4PSlb8bFK/+3TPzuKhvYOnc9hZ
         v5/5clghgI86ydk6uL56CC7NThn9nst33nLL5FHGtdlh03Ibf/L/SUjZy3GkCxbp6mGq
         vth/qUVGF4UysrATLty28Psj7TWMYYjBXKwsMeSxEE3YyixmSLRd4kA2eaVRfiBSjUiM
         CtZV+YGA2Mmsw/q1yelp2rCIlk+o2LtoyiKwH4+SnIAErEStd+xQyXPuEhE6oEVnzAM4
         yatwb7VeKkHvaULA2zfYOq9j7PkWhmYbxman9N8EyeISmXIJrIE2HZpo1rg3cur9s0IW
         DzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785904; x=1702390704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AotARsj+VFna1B6Y1dBKJsrGcJLPZmGGYp80tG8dyY8=;
        b=OdVYh3vxoQM7b50jT2RsWB1WoYyCdrMmHmeUvp2DkM4IyCtA1xb3SCY3sjcK26hOUd
         lfn2KjJFZTxlfE6ST4ATQdprBP9omxp/x+xyQUV4hE2C5mpd0j+RRV7H7/dlMJnhEJxU
         ICd+j/BKYIzEQrBjHTuvg9HFzWlL3UKeTHjgWMjDWAMbes81sWvKkhu0sVdHt8mp9+z5
         bVAR3W6EJUEKY9m7w13bso7XKp6PLU5Sr9cYfjIh2/3hqCPhd9EeME+V0RLgWKuuRErf
         fUoL3xltKgiL9r2sbDz0VoHrnTmkvTUizKi8b5dhRJkSn0ntAfNu0IUoqFbe5jt9H7C3
         1moA==
X-Gm-Message-State: AOJu0Yyz/yTweWpt9VkmCaKu3A5s3GUlFGmandNz3Jh+WGo5qulUA6Ql
	VawlmqBtFSxBie2Qz10KGrPE4qLwOb0/8QnkgLMw
X-Google-Smtp-Source: AGHT+IFWbc3FD0birsYmOoLKb9NJIOd8apO5yYGotQCSFpy6juI7sMERnMvsZyIdFq62UwVF8lAv7w==
X-Received: by 2002:a05:6000:400d:b0:333:42dc:d42c with SMTP id cp13-20020a056000400d00b0033342dcd42cmr2621012wrb.80.1701785904557;
        Tue, 05 Dec 2023 06:18:24 -0800 (PST)
Message-ID: <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
Date: Tue, 5 Dec 2023 15:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
 <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
 <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
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
In-Reply-To: <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 15:14, Sébastien Chaumat wrote:
>  booting kernel with "dyndbg=file drivers/gpio/* +p"

I'm afraid this doesn't tell me anything. I'm simply not familiar with
Linux'es GPIO handling.

Jan

> [    1.997798] i2c_designware AMDI0010:00: using ACPI '\_SB.I2CA' for
> 'scl' GPIO lookup
> [    1.997804] acpi AMDI0010:00: GPIO: looking up scl-gpios
> [    1.997806] acpi AMDI0010:00: GPIO: looking up scl-gpio
> [    1.997807] i2c_designware AMDI0010:00: using lookup tables for GPIO lookup
> [    1.997809] i2c_designware AMDI0010:00: No GPIO consumer scl found
> [    2.007517] i2c_designware AMDI0010:03: using ACPI '\_SB.I2CD' for
> 'scl' GPIO lookup
> [    2.007521] acpi AMDI0010:03: GPIO: looking up scl-gpios
> [    2.007523] acpi AMDI0010:03: GPIO: looking up scl-gpio
> [    2.007524] i2c_designware AMDI0010:03: using lookup tables for GPIO lookup
> [    2.007526] i2c_designware AMDI0010:03: No GPIO consumer scl found
> [    2.343905] gpiochip_find_base: found new base at 512
> [    2.344408] gpio gpiochip0: Persistence not supported for GPIO 0
> [    2.344436] gpio gpiochip0: Persistence not supported for GPIO 61
> [    2.344458] gpio gpiochip0: Persistence not supported for GPIO 62
> [    2.344480] gpio gpiochip0: Persistence not supported for GPIO 58
> [    2.344502] gpio gpiochip0: Persistence not supported for GPIO 59
> [    2.344523] gpio gpiochip0: Persistence not supported for GPIO 2
> [    2.344546] gpio gpiochip0: Persistence not supported for GPIO 6
> [    2.344571] gpio gpiochip0: Persistence not supported for GPIO 54
> [    2.344646] gpio gpiochip0: (AMDI0030:00): added GPIO chardev (254:0)
> [    2.344648] gpio gpiochip0: registered GPIOs 512 to 767 on AMDI0030:00
> [    2.344650] gpio gpiochip0: (AMDI0030:00): created GPIO range
> 0->255 ==> AMDI0030:00 PIN 0->255
> [    2.357663] acpi MSFT0101:00: GPIO: looking up 0 in _CRS
> [    2.376188] mdio_bus fixed-0: using lookup tables for GPIO lookup
> [    2.376193] mdio_bus fixed-0: No GPIO consumer reset found
> [    2.401459] rtc_cmos 00:01: using ACPI '\_SB.PCI0.LPC0.RTC' for
> 'wp' GPIO lookup
> [    2.401464] acpi PNP0B00:00: GPIO: looking up wp-gpios
> [    2.401465] acpi PNP0B00:00: GPIO: looking up wp-gpio
> [    2.401467] rtc_cmos 00:01: using lookup tables for GPIO lookup
> [    2.401468] rtc_cmos 00:01: No GPIO consumer wp found
> [    2.659765] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660047] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660162] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660277] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660393] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660504] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660609] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    2.660726] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> [    5.445265] acpi FRMW0004:00: GPIO: looking up 0 in _CRS
> [    5.445396] acpi FRMW0005:00: GPIO: looking up 0 in _CRS
> [    5.448467] acpi PIXA3854:00: GPIO: looking up 0 in _CRS
> [    5.448483] gpio gpiochip0: Persistence not supported for GPIO 84
> [    5.452476] gpio gpiochip0: Persistence not supported for GPIO 5
> [    5.463304] gpio gpiochip0: Persistence not supported for GPIO 8


