Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C89478D6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771960.1182390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauVr-000631-UI; Mon, 05 Aug 2024 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771960.1182390; Mon, 05 Aug 2024 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauVr-00061U-RK; Mon, 05 Aug 2024 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 771960;
 Mon, 05 Aug 2024 10:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sauVq-00061J-Ge
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:00:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8662abb0-5311-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 12:00:20 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso933950566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 03:00:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c12be2sm429934466b.89.2024.08.05.03.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 03:00:19 -0700 (PDT)
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
X-Inumbo-ID: 8662abb0-5311-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722852020; x=1723456820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CkNveMy+M0++asi1hycWjFaNcL8qXuh0CAOdJs61m64=;
        b=ABwG8x6tqxYDxOkHP/gCUvoVrgBqgNCXgWEBcHZfk5g0R/Rf/Z8vY/MNOHC4IhkGGf
         3XGWphFHD8RfTJ0kWBMyYZc/jkYwqFp6CPbJitShxle1EKhgJnSUVBQQ+x5kyIevR8c7
         AkX506USKVCEwLBh1vH4laYZPVvfazud/jr9Z5/VayG7GUv/yjgslDBri799/d+se+bN
         rhQwFtCR15PtA41dhV8o0EaQ9/eH6NrcCBdnvdzOvGB26JxDJ5uYPynX3eWQxcfaPLxf
         pMEQdvoLHnfDRR3rcvt+L6gUUMVXnYTeLGGqzeKd3Atz+OuurAbXtpJGtiR7d2aa1jcM
         LHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852020; x=1723456820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkNveMy+M0++asi1hycWjFaNcL8qXuh0CAOdJs61m64=;
        b=fdFzl8afqbJzdxDWidYI2X7n6LbhzW4DM2Fnbon60/5U4hS7JIiGgSxZafJLNMDTMR
         JDpeHq+Yras+5Vsf8eixlFh7oS0V1uRz54i1BcBXJ8jCmp5MjX7soJyX6UZIioIAnU20
         J/qyxxyUKwCDwtqIkdf93U5TMzTn1rIQ+DFtR0pt21l8FySy13R4klAXCxsOXMSnbwuy
         h7jacNGwcHJO+i5onZ6uwmyEH4IcN/1dSmskJ+Sv8hET51YaVMKcrK9o+6APQw4N62XJ
         A/wKCMGVDw0qmCmKKJUrDSNzTvbkB753NxGjHZnZ1A0sKjF8+/6VHDeBCOOHyi5yeCP8
         L2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU443HuMaz81xRURDri86E3VboQIMXOUteBCoSuDH3VKbTH80LfFmWQdGAHfSJ8OoQHwrcOl9N6LnTTLkiYhsI+eWE2jKf/7fIMSJ3K6Q0=
X-Gm-Message-State: AOJu0YyvtxOZPNJhsh8rhYGc6ii0vMF7NPu5KhYXgEUmII1o5igwXgda
	XlGijcbq/GfKrt0xeDysCi/Ahf1S9+jkD/4SywfCS/W57/8WQCJx2s5YW+aluQ==
X-Google-Smtp-Source: AGHT+IEsIPnc+76Sx6oI97rMS6CzYr7yAXMTFSn5uFbR96q8iLtB1nM4w5K9UmwN+OcB+xbVazYHVg==
X-Received: by 2002:a17:907:2dac:b0:a6f:586b:6c2 with SMTP id a640c23a62f3a-a7dc510131cmr769192266b.60.1722852019889;
        Mon, 05 Aug 2024 03:00:19 -0700 (PDT)
Message-ID: <5d96bb76-8204-422e-a584-ff9e699aef38@suse.com>
Date: Mon, 5 Aug 2024 12:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/shutdown: change default reboot method preference
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240802105613.99197-1-roger.pau@citrix.com>
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
In-Reply-To: <20240802105613.99197-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 12:56, Roger Pau Monne wrote:
> @@ -492,6 +494,15 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>              DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")),
>      },
> +    {    /* Handle problems with rebooting on Acer TravelMate X514-51T. */
> +        .callback = override_reboot,
> +        .driver_data = (void *)(long)BOOT_EFI,
> +        .ident = "Acer TravelMate X514-51T",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
> +        },
> +    },
>      { }
>  };
>  

Sadly this wasn't properly re-based over the introduction of DMI_MATCH2()
and friends. I guess I'll make a patch, hoping to find someone to ack it
before you return.

Jan

