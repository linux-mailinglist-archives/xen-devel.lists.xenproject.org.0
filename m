Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D306DA22D65
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879540.1289743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUL3-0005Sz-81; Thu, 30 Jan 2025 13:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879540.1289743; Thu, 30 Jan 2025 13:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUL3-0005Qv-5Q; Thu, 30 Jan 2025 13:12:09 +0000
Received: by outflank-mailman (input) for mailman id 879540;
 Thu, 30 Jan 2025 13:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUL2-0005Qp-AR
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:12:08 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce057ddb-df0b-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:12:07 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so1521857a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:12:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a5635bsm115677866b.164.2025.01.30.05.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:12:05 -0800 (PST)
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
X-Inumbo-ID: ce057ddb-df0b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738242726; x=1738847526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hR3mxz4iO59pz8lIUOtj6Jo/T8UDytMT+govV4YAs08=;
        b=LmPhTg22UqeCeF9em9WQlEvTckkIBuD1xfRCBaHzDpIPSHCaLhAx+CyiS0/uwz7yxm
         /W0vJg4GFJVc3PJx533xyrjd4F3TKyaZ2k3TLEBow/qBvdljOHRgklkUmniB7yLbmKN9
         vYgRDs4K5Bh+svNpdJzthJ9Pjn8b5SRdqn+8AOCjrYssXmolF1xP7eGZsf8k0+4jOAcZ
         0ig+QUE6j6fjRvwQ0VByP6HsZl9g0xcRjh6EVlFMVBMqzDg9uTBcS+MhJdNeudLoo72p
         V846uCRQ1HvSXjyQJ9+JqK3rtvD8fe8G0HMqv48x9kRxgIwUVyi8SuEWneC2oUB4jJH8
         zVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242726; x=1738847526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR3mxz4iO59pz8lIUOtj6Jo/T8UDytMT+govV4YAs08=;
        b=XVAT4uutz8Pi7bC2yw6WVhmf+EyY+uGGKbM8CZun3l5CrLikYBMLbCl7lpanMNrNax
         N0wiLpsvFy74gVdnnEIPQqe/RrPC8X6ijFz2c4LzsO6+DLJy3Z2OkCPRzFUX6QAbMgQf
         vAUvXwqtgUlSKf34V4Y1l/pl8CjVPsznE1kLpKH94K00JGPSb/VMknHK+1xzRO4+DAju
         ZcOh16+Zq9H6zvDusfXDfdkF0+jGXlQ2d+rzm0lykoTcabY/DzMmhOYmiwwGZilD5AHd
         4KXQQzmwClArZIEQEBejwS5e4x4miyoNWe5TOPKFDebOZcbuXEwPEy+tIM5s5HPc7ab1
         5Tag==
X-Forwarded-Encrypted: i=1; AJvYcCVTkromfIFymatPXovxTSuzj4p+p4+wC9BUdImEgfz4CJ1k4hFo/FMQ1/SPgk1TIqEcmG5hgXqqIQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5bvDQlGXYAEsH+iBKh8BkoiSbETh5bogcaSerjfVr4baG64xZ
	oRd+lrZcKykj1Y0sGbGMH6TMFlId1tfuv9rphE2W4doeVvLBgofCxzc70bE2NA==
X-Gm-Gg: ASbGnctK8bFgK4ci4BRdZxRjadWpSXm1IA3ou8O8c9E+HvOMI1HOD1syzLshQNZWFb8
	CE1bLFFaAGvdI9X5ZFtkGEWCGWXHI93FvHUN1xK6uOiRErF35Fjj6M8WmYkFL7BHSTIJ4H+Top6
	RbfLt17trUOGfqJpWRP7XRkCsKVMNfdOgJK/2IuxrCy/HFT/abd6P9FM6DMVPd1tRD2ANnrYdSa
	SqxgPIEvcjU1fVIXeZFn7DyAQknkGbUtTxu8jeMk8u8y4XRT2jE8JyYeO3CE0MvDOfhsaW2F3Q6
	sIC75X6l0oQXQak9FPWXeUwBJ04jRMF6/lMeY9YDjZxEUDT65NxDGoGbKkgS31K70a9dlVdMABf
	U
X-Google-Smtp-Source: AGHT+IHIhWViDrziAW9ZWgePOKMwZianzDwA+AHPvcOJDJYDIElq/gkeSsMlF+uN5Cjs2xcmtxj+vQ==
X-Received: by 2002:a17:907:3dab:b0:aa6:7091:1e91 with SMTP id a640c23a62f3a-ab6cfcc6f11mr731449866b.11.1738242726072;
        Thu, 30 Jan 2025 05:12:06 -0800 (PST)
Message-ID: <f28c0573-8ded-431d-a6ba-b814755b3380@suse.com>
Date: Thu, 30 Jan 2025 14:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/24] x86/hvm: add HVM-specific Kconfig
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-20-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-20-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add separate menu for configuring HVM build-time settings to help organizing
> HVM-specific options.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Largely: Why not. Question is whether what is being moved now may
eventually require moving back, if support was extended to PV (MEM_PAGING
and MEM_SHARING). That doesn't look very likely though.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -30,7 +30,6 @@ config X86
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN
>  	select HAS_VMAP
> -	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF

I don't mind the movement of this line, but I'd like to point out that it
may be beneficial to have all selects of HAS_* in a central place. Views
of other maintainers (or of course anyone else) appreciated.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -0,0 +1,74 @@
> +menuconfig HVM
> +	bool "HVM support"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default !PV_SHIM
> +	select COMPAT
> +	select IOREQ_SERVER
> +	select MEM_ACCESS_ALWAYS_ON
> +	select HAS_VPCI

We strive to have such lists of selects sorted alphabetically, preventing
everyone to add to the end of the list (in turn reducing the risk of
patches conflicting).

Jan

