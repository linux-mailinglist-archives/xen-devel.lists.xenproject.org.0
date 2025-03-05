Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B026A50560
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902545.1310537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprp9-0007qn-Vb; Wed, 05 Mar 2025 16:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902545.1310537; Wed, 05 Mar 2025 16:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprp9-0007nl-Sb; Wed, 05 Mar 2025 16:42:23 +0000
Received: by outflank-mailman (input) for mailman id 902545;
 Wed, 05 Mar 2025 16:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tprp9-0007nd-C1
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:42:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cec9d80c-f9e0-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 17:42:21 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so6541215f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:42:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4848252sm21719647f8f.69.2025.03.05.08.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:42:20 -0800 (PST)
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
X-Inumbo-ID: cec9d80c-f9e0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741192940; x=1741797740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ehB1ZceNy94/D6w3ogxTzP8rb6moxGw5Enf4ASGso/s=;
        b=OdxzsbwlgRXVtKeo2Atn4ww/7DiqMpt3IqDZcNurza1buiWATHbQQ1ZeeOdBSxlPTY
         c3M3h/2L9v3YvSyTBPy2HWZ6q20LwSCJKC7D/cLQgItWjESLBCSahdTL9MFv0wDdHcEC
         0YvlHP89LrIbxUTmO/HQUeJljOAc0xVmbGeVioKaSqr2d6fN2Bvrvv1IKuf3L7ynEtTA
         dvVDKCwk3umcE5g4mSrr2ZadIoWZTu89+GBTjwV7megX+58RHNGqG81t60vgTxvogGV9
         HWetL63Z//i2lN62L3Dv4FsU50JPtEMVWAf9wI0lRa0wzbsBXiGh3nkLN41MhF3ToD/n
         5RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192940; x=1741797740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehB1ZceNy94/D6w3ogxTzP8rb6moxGw5Enf4ASGso/s=;
        b=PvCBotq0C7fw+yOzeEBsMAccCCw+pJUzHO2GbUVk2m0zWFzTpvGA/AGFNyuD7RhgW+
         jn7NFl4fZfdpK5gsRxK7PVeNW7XU5uR44T0Qvb0pf19GYoehA+Q0MmSpe5lNFYDoSskA
         3C5f7Tl4Dt7scjxYXgG9VQ1DU30RklBOhTs6b4WnFZQ38z44T1x33eRuDZyLO5RPjmz9
         kyzPHsCfOa3YwlFHOM23MJ6bkAOhbh3wzpSASMK7p6tt0j0WS/3tncyPs6rpWp7wKqAS
         2V+i5FP6OBo3ymwvnMTTQWsxw8nc63RdtK6bVQfEiuu/Q2Gcr/dxloSHcHPCc0So+Kjh
         NhaA==
X-Forwarded-Encrypted: i=1; AJvYcCW++Q0gPZHpSwxauPvm4xMhQiGKtHxyK1zl9u8lTAzZpbcNzljEOBy5QjvWDlYB/gD8sbNAH1srAGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa1tMt9rSRgUC+NZjx95nxhAadQ/dMs+/10K+Y7QlBTC+WYUQs
	0Cv2pDwFKARcNfgOwabli8uSGclTZZcsM3jdBPBqdGrIPqDrOIi0XsoBkJnOqw==
X-Gm-Gg: ASbGnctgr1SraSOGbe0JLnE50raoOhG9u+NNxVfA++rSIH6jnxco1ZRmul+7WcWLWvF
	XSki1KSvDcKX8+NYL+J7Qq4Y1eAXIk2EoXIawliefRy/dj2cY45u4XuD5kR0nLdjjW6BMb1zyud
	5xZXYc2UJzbODwJKkvMmoxCLbCtoRZ9FAwXZaVD91z3W5rmlHZOCZB8DoJ2c6DiYCg1tHrV9Jxt
	srV5F6ezBQFqEwJfeQdtBEKiQslK7tIXgFwzLGk4q4tqQUloqjtw8Q4QUK/nQqnZOzh+N+hQ80Q
	wRCRb8h3BgfE9mg54zEfGZ3ZZdv31jpVeq3TNkgL/OPIRsZcBtDRTOkD/rnCHIu7DbT+QQ8/jw8
	PgZ/ZIaaOkDLGp19CAJ5h912Z+7cE4Q==
X-Google-Smtp-Source: AGHT+IEvYsW7zt4lOgEkcyle3KxsIDh4kZrb0GleqBUjknSObR4qnTBlg3IyHtL5h7MkFoSk5rJOCg==
X-Received: by 2002:a05:6000:1acd:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-3911f7a957emr3953480f8f.43.1741192940491;
        Wed, 05 Mar 2025 08:42:20 -0800 (PST)
Message-ID: <acb0fd5d-0315-4a5a-9974-14556e497a03@suse.com>
Date: Wed, 5 Mar 2025 17:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/console: make console buffer size configurable
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250305011127.4079670-1-dmukhin@ford.com>
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
In-Reply-To: <20250305011127.4079670-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 02:12, dmkhn@proton.me wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -425,10 +425,13 @@ The following are examples of correct specifications:
>  ### conring_size
>  > `= <size>`
>  
> -> Default: `conring_size=16k`
> +> Default: `conring_size=32k`
>  
>  Specify the size of the console ring buffer.
>  
> +The console ring buffer size can be selected at build time via
> +CONFIG_CONRING_SHIFT.

And hence, if a value other than 32 is used there, the default above is
going to be wrong. IOW it is only the compile time default which is 32k.
The run-time default (which is what matters in Default: above) is itself
configurable, and hence wants documenting that way.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -96,6 +96,33 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SHIFT
> +	int "Console buffer size (power of 2)"

Would you mind adding the word "ring" here?

> +	range 14 27
> +	default 15
> +	help
> +	  Select the boot console buffer size as a power of 2.
> +	  Run-time console buffer size is the same as the boot console size,
> +	  unless overridden via 'conring_size=' boot parameter.
> +
> +	  Default value is 15 (32KiB).
> +
> +	  Examples:
> +	    27 => 128 MiB
> +	    26 =>  64 MiB
> +	    25 =>  32 MiB
> +	    24 =>  16 MiB
> +	    23 =>   8 MiB
> +	    22 =>   4 MiB
> +	    21 =>   2 MiB
> +	    20 =>   1 MiB
> +	    19 => 512 KiB
> +	    18 => 256 KiB
> +	    17 => 128 KiB
> +	    16 =>  64 KiB
> +	    15 =>  32 KiB
> +	    14 =>  16 KiB

I don't think an exhaustive list is necessary here. This way it's not really
a set of examples, but an enumeration of all possible values.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -101,12 +101,12 @@ static int cf_check parse_console_timestamps(const char *s);
>  custom_runtime_param("console_timestamps", parse_console_timestamps,
>                       con_timestamp_mode_upd);
>  
> -/* conring_size: allows a large console ring than default (16kB). */
> +/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
>  static uint32_t __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);
>  
> -#define _CONRING_SIZE 16384
> -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> +#define _CONRING_SIZE       (1UL << CONFIG_CONRING_SHIFT)

Imo this ought to be 1U only, seeing ...

> +#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>  static char __initdata _conring[_CONRING_SIZE];
>  static char *__read_mostly conring = _conring;
>  static uint32_t __read_mostly conring_size = _CONRING_SIZE;

... this use of the constant.

Jan

