Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F2AA0AF5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972221.1360643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jeO-0005qE-Kd; Tue, 29 Apr 2025 12:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972221.1360643; Tue, 29 Apr 2025 12:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jeO-0005nj-Hb; Tue, 29 Apr 2025 12:01:24 +0000
Received: by outflank-mailman (input) for mailman id 972221;
 Tue, 29 Apr 2025 12:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9jeN-0005mG-Id
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:01:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab094230-24f1-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:01:22 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5bc066283so10526909a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:01:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f70354632bsm7261240a12.57.2025.04.29.05.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:01:20 -0700 (PDT)
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
X-Inumbo-ID: ab094230-24f1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745928082; x=1746532882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zP9+7bCC+w4gqi+QE6Bg1Rwd6ocdr+MM4e/OlpnSnxo=;
        b=PGzMxXnInUA0fE6g+W8OT+HoBAatkb7JnB1JKc0oP04J7XcW1HMMl47y/3bnhiC+fm
         K6mjYQ1H3MaBhR9CG1GjSgcHVkifSEmk8t5KvI2dzMZ2afvBCHBUdYa/urdC+SbuRZnS
         b8RXmRo9fcYHK5Ro2jOfHo9saIfiUee7khYgC6IxvN2z6NwJk1Di0HsUuNh5JBs24mgr
         dOOwkafCCHedBI8GHpIz0nAKt8Bt118S5lYa6bDVtfWfa37eLeDGmNlz4gYmC8Pwe/FF
         LL2u9/4pZllKiGP4J/8MqOe8b1OqwwWdbP/FhFNI0QkMe7bTvWDRospAqEJIsnfuPCMp
         cvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928082; x=1746532882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP9+7bCC+w4gqi+QE6Bg1Rwd6ocdr+MM4e/OlpnSnxo=;
        b=FC8kbHI1MjnVYqO6MGfaZeCfocD7oMMoInFWE8dRAbn3PV+zk/JjsAJM/96PkWELZe
         Uq/Rz4MZP6MzqFzDTJVnSQZeuy5pXyI1y1u3o6m495sK1S6qnyDPdqcZJZ+HCvWsr6Jt
         SdrSObrz8QyORDKJg6mnAoa8b5+3nwXhvYVfEiuHeVmjrMFnTwsmg/LNO9oJysxb2E8K
         4CFtCBOz1osxFVBJ6So/gYwXTktRHiX9x/pvV9Woul9xUA8vBF9KViWzkNAcY2LxTDyo
         1h0I3Ra6UA8A85RxcZdTCaF8/YfRQED+smimq6puH9loEEKThKNqhjpfT45n0UP3FDN3
         Nu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwPueKFhb7lr1z+ZmJgsYGxp+KKFaQLa/AotC6ZuLfeo7m/xwZd65zVXzvdKgTh5jHrKkngwVZZSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9WEsZuxMohG0lgkJLI3Bz0I+HMbI/MnuV5pcR4VeBXJ58CNhT
	XNXe3JMIim1mwNcfdn+JDo/o31ualBv6HJt0e2FVaXYNw+aYWV66P3lBhX/s6w==
X-Gm-Gg: ASbGncuzFzCK4pkenh43+SBMpVRl6YgyE5qrSC8NBCx60/cm8ujxmDL56ZbSWYpCuDD
	Q595lgxSQNFzG5vo8i7kKTnew7JDMo92y0/t8uUIgKN/tndM3Q+lkmQuZ92kiZhKwpGub2I9+JC
	ydMOXxiv1Ab9i0OkeHZDkSmGskDdpzayxdcGUodqGJ9o5h73ebQblQ2KhaVV7+xsA/qezZrDjfi
	gweTvBEulZZEiFuQ2/e1urYViq0gWDhekWcae2V3iC/W5MCqgf12dZ3drLU1LKY699rDa/f9jW7
	13e9wG1YoYmUUH6J3EgYqZ75+MOH1GKAnRhakDZWph3e7YCE8XBrolLTMh+Y0xfYJ0524Vp8q6t
	MYPbl4lcy1h/ccz816+HYmIPnng==
X-Google-Smtp-Source: AGHT+IFK7WmynnrU0mYPHUFJjCnKxm5QO+IrHy/2KkAVjTMz66Ce0YXNhZ+9wEihrGP2r8iIcEuoCQ==
X-Received: by 2002:a05:6402:5243:b0:5f4:d5d2:dd47 with SMTP id 4fb4d7f45d1cf-5f8388909b8mr3295561a12.25.1745928080590;
        Tue, 29 Apr 2025 05:01:20 -0700 (PDT)
Message-ID: <b51b142f-d534-48f3-b506-c949ed535623@suse.com>
Date: Tue, 29 Apr 2025 14:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com>
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
In-Reply-To: <20250429110636.30518-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 13:06, Juergen Gross wrote:
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -59,6 +59,7 @@ OBJS += optionroms.o 32bitbios_support.o rombios.o
>  CFLAGS += -DENABLE_ROMBIOS
>  ROMBIOS_ROM := $(ROMBIOS_DIR)/BIOS-bochs-latest
>  ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
> +DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c
>  endif

To be resilient to a random DSDT_FILES in the environment, I think you want to
use += here as well, just like ...

> @@ -76,7 +77,7 @@ rombios.o: roms.inc
>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>  
>  ACPI_PATH = ../../libacpi
> -DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
> +DSDT_FILES += dsdt_anycpu_qemu_xen.c

... you have it here, and set the variable to nothing yet further up.
Then
Acked-by: Jan Beulich <jbeulich@suse.com> # hvmloader

Jan

