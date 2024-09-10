Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1B972C7C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795106.1204241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwXd-000890-7Q; Tue, 10 Sep 2024 08:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795106.1204241; Tue, 10 Sep 2024 08:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwXd-000863-4Y; Tue, 10 Sep 2024 08:48:05 +0000
Received: by outflank-mailman (input) for mailman id 795106;
 Tue, 10 Sep 2024 08:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snwXc-00085x-2e
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:48:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c791ea-6f51-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:48:03 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso534238a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 01:48:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65c8asm450836366b.215.2024.09.10.01.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 01:48:02 -0700 (PDT)
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
X-Inumbo-ID: 63c791ea-6f51-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725958082; x=1726562882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J8Xj3DbuNVgx13+sRF3HGDEOLi0zDseW3LzCHDOd4jY=;
        b=ZfQ7ODqS8tF9VdWWJsrOBXpPN1843LUGaIoE0JRhMsmSFIwhjP+dxBpHE9v8199psf
         c2NwIsgCDJSrgGHdtKyTUUz2d+hORA+PRGephvg52Jg0zVYJn/VivsQFFc+kkeh5dNc6
         Q9ndKxrNsHVg3+L5PgkxCCSdFgfUd+Tfr8gsxNWRIZevIRP3fDwXwLtgZtGg4pYLHCPY
         fJsMEFpZ8EwRXC1z0GfJR6XPm+4KgKrb2M5a1wX5039FDV8xg4n6hcu+wSE9OmhanPfB
         M24ddRPAPUROJhgKMI5mCLMkYqiIV/5K64z6sdNPiL4e7Tkh8+GmPx1eWZfixzBoQf5t
         ynEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958082; x=1726562882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Xj3DbuNVgx13+sRF3HGDEOLi0zDseW3LzCHDOd4jY=;
        b=a8Z5buPjoBc8QshTnc1k7xjWd0OxIjhCohixhnbB0Ihbtqj4itWAzjpP55VD7L2yPL
         Kgn5fT81UvJLkAuy9QiMhFZVIiyK+qd8pgWgC/EQTTgwT0By6LXflG7CIZKgPGaDDQIY
         9rQe9POOFv485+TjobocjTHkagaomNeHTsjny2N0yZP2Q+R1wFAtcCGum3aBRzIw4Gm6
         0pfwMWy1XrpnMlMJLB1fsodRQLq3Tn64ko+nbuZJWcZEIiCcqOv4wF/mu9/JSakrfoHu
         e9h6Ms/iYhpTD8GObBm3t0j0rE9rzZJWWuC8GBfRmRyayNsDaAxpR2H9UDJ62c7/nDIn
         6FCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRLKBuHGIoQhO3FWFJCMM6gbi90lZqtZW2n0nu82jUyqMpBi2yeHIAUk0RjAgBTOiJjvi3yrf6OMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEIHLx3ksDHNQuzJaY8uC0LtgLBibBKhDbge8zN8aveBwsKrdT
	OStfYrwvcGMPXgC9mhJZZVuWrQ3x99gvOfzMbm2yOJB/NSlvksBmtHr2kEOYfLJjEncoZR+gVnc
	=
X-Google-Smtp-Source: AGHT+IHf/fMisyg5jzDRNS/TYG/27MCw2PeR03T60S3G7VD823gm7Lxgt5+5zNgAAtPO244npDvAqw==
X-Received: by 2002:a17:907:97d1:b0:a8d:28dc:9e2b with SMTP id a640c23a62f3a-a8ffadf8eb2mr1100066b.44.1725958082345;
        Tue, 10 Sep 2024 01:48:02 -0700 (PDT)
Message-ID: <3bb119f7-e99a-4b95-8bfa-f9eee7deb8f6@suse.com>
Date: Tue, 10 Sep 2024 10:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Remove __packed attribute
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240910071838.4545-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240910071838.4545-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 09:18, Frediano Ziglio wrote:
> The data are properly aligned in trampoline.S.

I think the attribute was added as a precautionary measure. I don't
really mind seeing it dropped, but I wonder if it's getting in the
way somewhere, or whether this is solely tidying along the lines of
personal taste.

Jan

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/cmdline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
> index fc9241ede9..aae5a1f04f 100644
> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -38,7 +38,7 @@ asm (
>  #include "video.h"
>  
>  /* Keep in sync with trampoline.S:early_boot_opts label! */
> -typedef struct __packed {
> +typedef struct {
>      uint8_t skip_realmode;
>      uint8_t opt_edd;
>      uint8_t opt_edid;


