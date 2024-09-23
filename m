Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4D97ED4A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802092.1212210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskHR-0004uh-4S; Mon, 23 Sep 2024 14:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802092.1212210; Mon, 23 Sep 2024 14:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskHR-0004rk-1V; Mon, 23 Sep 2024 14:43:13 +0000
Received: by outflank-mailman (input) for mailman id 802092;
 Mon, 23 Sep 2024 14:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sskHQ-0004re-B4
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:43:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27defeb3-79ba-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 16:43:11 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c5c3a1f474so1207466a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:43:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df770sm1250401766b.145.2024.09.23.07.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 07:43:10 -0700 (PDT)
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
X-Inumbo-ID: 27defeb3-79ba-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727102591; x=1727707391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFPnSU0vabVk/y37OkMkcIkeR3fWzq45iRbXxid0/cg=;
        b=COXNqgH4RXz9/Kva2rYFVj287C9r6xH/jFr0lg+9xM+9KlT0aTh13tSJVVWOCUXHFD
         +uf7vpQ3pgUsGhZ7uTUTunC+/L/I2Rq/onTCOdGxCdngCKWFEJYtJW+b6Vr47cTysOHo
         w/M3rMBC6fKXyl+PpzNjUQ/soZxUphWZwpcSoSq8yIkqXBu+iiGpLewqF9IDk0x/dHUw
         Tq20jYdVxLDfIfxkBzZymIXRizhg2jix1raN8vzXGED4ohExTXaWfEHIAjsV5FjkTXMq
         BJ7IdlwjBU3NlbbN0+Se50MfNdL+dd8B1KbvPtXe5q85F7xWvMUN6tLFcQGLskIXBNmG
         +A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102591; x=1727707391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPnSU0vabVk/y37OkMkcIkeR3fWzq45iRbXxid0/cg=;
        b=Rvo0f+x8ADknYKRoANgCeWH0jh8gqc9mdeMqoNw71Kwy7DI8wxxDmsrg8bX/TSFk0x
         yo7c+qs15AxOWm3AMWjdjW0WTsRPL4QuHYSqCiiAGUR+O/PYj5N0swslmaYTRSlngUhg
         O7hr4MfvHLjUKcjJnhl0/vKi6e2pKk8/acGArrpgZDSURiGw1BE5Q2uAKHnjLF5Co4sd
         EIMt83vqIlXmPcEcefxmpCrvQ5h6bCSwBKk+5xzmIWlhxNzcjTWnOF6/Cro+TC6caGhH
         hb4Jzn3lP2kDQ6L7JOUzNQviJQTs9k2U7qVWSt7sD5b26uDo9YKw7Jue48kvGDPplS08
         OvRg==
X-Forwarded-Encrypted: i=1; AJvYcCVRIX1QunM5VZajWY1x0XIOJAKmhesaG6UGRrSPLyhHRTgErDvzUTPsIqIeJ3CSW/eQEf1YTHFWAlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDVBgWYjaJQEGLNF+4XpRJfHcn8pW3EG9h95K4O0GhPnNY0/RF
	2VoBc0WNC11Lk88iEDR4bDAlpT0hspLkIAaXgvXbe9xEgEMAC6Si19+wHnHRjw==
X-Google-Smtp-Source: AGHT+IFmNuoWqUzVBXYHPqneggrgktJ2BdSMgMQ/JqVImDPgHDqdHgk/qk2HXYmTQBvhIlIDGktDHg==
X-Received: by 2002:a17:906:cae1:b0:a8d:2359:3160 with SMTP id a640c23a62f3a-a90d57720b1mr1073588466b.38.1727102590770;
        Mon, 23 Sep 2024 07:43:10 -0700 (PDT)
Message-ID: <13de4165-2df2-4481-974d-30d528dfd8cd@suse.com>
Date: Mon, 23 Sep 2024 16:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/common: move device initialization code to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <0b4d49742f58549ec644944ce1e02c98d7551845.1726579819.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b4d49742f58549ec644944ce1e02c98d7551845.1726579819.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2024 18:15, Oleksii Kurochko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,6 +12,14 @@ config CORE_PARKING
>  	bool
>  	depends on NR_CPUS > 1
>  
> +config DEVICE_INIT
> +	bool
> +	default !X86

This can simply be "def_bool y" as ...

> +	depends on !X86 && (ACPI || HAS_DEVICE_TREE)

... this enforces all restrictions. As indicated before I'd prefer if we
could get away without yet another Kconfig constant, which would then
also eliminate my concern about the expression not really covering for
the case where x86 would obtain DT support (and hence likely needing the
initialization here, too). What about ...

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> +obj-$(CONFIG_DEVICE_INIT) += device.o

obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o

? (Eventually we could then simplify this to just obj-$(CONFIG_ACPI),
to allow DT on x86, making sure the ACPI part of the file builds for
x86 but does nothing there.)

Jan

