Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB525894CF7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700031.1092572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYx4-0005b3-VC; Tue, 02 Apr 2024 07:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700031.1092572; Tue, 02 Apr 2024 07:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYx4-0005Yh-RI; Tue, 02 Apr 2024 07:53:02 +0000
Received: by outflank-mailman (input) for mailman id 700031;
 Tue, 02 Apr 2024 07:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrYx3-0005Yb-HZ
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:53:01 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0676245d-f0c6-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:53:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3436ffd65ebso98515f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 00:53:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b10-20020a05600003ca00b00341c563aacbsm13716092wrg.1.2024.04.02.00.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 00:52:59 -0700 (PDT)
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
X-Inumbo-ID: 0676245d-f0c6-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712044379; x=1712649179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Od4InG7X55PBBaAJX+yOmPV0hoy+I8x9/ye18meDsc=;
        b=WB7+M7oPnI+lkGhq+vJ1g1vweGSn6H0knfPdEiGfQsYXSD1t+pLfr4nK7jIPAEz2z2
         i8bZ87TdVAy4brPiDfBH/QMSCJrJY7IEm4e5gPAhwIz7oR9ASo9vUAHWZ9j12pGvb51A
         ADt2OoxVrPCfajLC23LAOas5sKvh3xuzUIeSd64Li/2lWVZQfkFu/REuhEgGZLVldAm6
         xW7fLFMRCKwMz49R3akwRfqgn1NuBVrzjOieTY2eCZFl7aoQMYVpRvcuF4q6IhdWi7uf
         /uuPb2y4+ETNLEiLIE3ToNCr92AXyluyoj/Q84Bjt4l/1VUvCCyw3NG4NY7hjcWQQwJV
         5tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712044379; x=1712649179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Od4InG7X55PBBaAJX+yOmPV0hoy+I8x9/ye18meDsc=;
        b=GrtUNbkYtiNGhHKn0Vb+n75AdCmxnOPXYoQyLYVOP9Wh/qZsd5HKd/z15kVCCNmKWF
         BfXJk1harlmxvtbGOpoQcMVMeOZiQQ14hjkDXvri+m5eoc82NWF36PGgRnkyBtSfP2zD
         +iaoCD7UmeeZHTLiNStFWNPF0iR5ArDF+5nZp3WwyZVH1gWwujR18GdlzGrZMdheOVFc
         YF37zHM86RX7T2/6uHNIKSl6h2AnQ6CIJBHlLBzCLVZ0g7kuWpFP+JdNw5AB2mwrLwBz
         8eGVG5mlHnlE2YNjNF93Jg+WOWNvkWoBRu2bdmXrGxhasCGtNreT0RwazJfx3RD/BQPn
         hRYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqcUQdsh/3vpcA3MBHaBtJwWJfCJe4Mpa+ZNQKxXJNE9cwdxIMb8jL7d/+Elei5bYd6G4fmET8JZckINuHRuresObZxtAu3ESaJjIhgcE=
X-Gm-Message-State: AOJu0Yw5ITfhGF9NWwvDWJ752UelHp1VdWfAkBsu9zPFZDMQaHg+o3TJ
	8eyJopFCaur1ZvEZvtJVk5lrtMG5gQ+8bcAxIx8kAdBXA5iqoDiEzpxnmYI3HQ==
X-Google-Smtp-Source: AGHT+IEyW612rhV4jmLKAE3nwpbYRwhUofQDdnb5LRcRoQyDVj0s1SWu0Cdzfju5uT9P/G8dWNKHTw==
X-Received: by 2002:adf:efcf:0:b0:342:2ea8:18fa with SMTP id i15-20020adfefcf000000b003422ea818famr8946120wrp.15.1712044379485;
        Tue, 02 Apr 2024 00:52:59 -0700 (PDT)
Message-ID: <f4ca7706-022f-4a55-aeef-32422b428f0d@suse.com>
Date: Tue, 2 Apr 2024 09:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 01:08, Volodymyr Babchuk wrote:
> Generic Interface (GENI) is a newer interface for low speed interfaces
> like UART, I2C or SPI. This patch adds the simple driver for the UART
> instance of GENI. Code is based on similar drivers in U-Boot and Linux
> kernel.
> 
> This driver implements only simple synchronous mode, because although
> GENI supports FIFO mode, it needs to know number of
> characters **before** starting TX transaction. This is a stark
> contrast when compared to other UART peripherals, which allow adding
> characters to a FIFO while TX operation is running.
> 
> The patch adds both normal UART driver and earlyprintk version.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/arch/arm/Kconfig.debug           |  19 +-
>  xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
>  xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>  xen/drivers/char/Kconfig             |   8 +
>  xen/drivers/char/Makefile            |   1 +
>  xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>  6 files changed, 439 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>  create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>  create mode 100644 xen/drivers/char/qcom-uart.c

This last new file wants mentioning in ./MAINTAINERS'es "ARM (W/
VIRTUALISATION EXTENSIONS) ARCHITECTURE" section, I suppose.

Jan

