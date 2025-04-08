Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809CA80D66
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942306.1341512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29fy-0006GE-71; Tue, 08 Apr 2025 14:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942306.1341512; Tue, 08 Apr 2025 14:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29fy-0006EY-4D; Tue, 08 Apr 2025 14:11:42 +0000
Received: by outflank-mailman (input) for mailman id 942306;
 Tue, 08 Apr 2025 14:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29fw-0006EQ-Ut
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:11:40 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 632c39a4-1483-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 16:11:38 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so61006415e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:11:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300969e1sm15197980f8f.10.2025.04.08.07.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:11:37 -0700 (PDT)
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
X-Inumbo-ID: 632c39a4-1483-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744121498; x=1744726298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TFR7bLJQK+StzK2Zx9tv64FoY/SSEv2ju1LT2QLlUQc=;
        b=Knwm1WYrKCOqhQyZYo5V3TmhkyFYwotB0lo/bpTkU1u8npsHDJ1aqIKyukDiPMQkoF
         JHffl2foifFi61HTiyM8aZiGNQLgbjL0mw8OHdsk0Jb9Ft7rHyXYzxN/O4OmiSa/YEaV
         6j4eDed2AYJ6y8Aii2R1igHhYGy0sfKwJo3/rF/0Y7Nr2dHHcBRbOh9u/kQ4eDlm8T7m
         ZL/KDjreztBgvGZSdCuS4E9W1ISsVfjFPachkzxgD8iCxXTG/FoHe5/sEn644d8ipJr3
         T3U0AnSu2W5Ah7Xq+yd0qNsYpmvgYTj1AjJbXLgJo04t/sn0T1v4UIzW6lc9+Zy8V0XS
         RcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121498; x=1744726298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFR7bLJQK+StzK2Zx9tv64FoY/SSEv2ju1LT2QLlUQc=;
        b=mqAZLSvR8h8nzcTnBOtp7EurvygMda6/oZsQExx5G3G625eBRLmZYOIi+p7NPS2AWp
         VDs5E5YDrlqSDGkcaFg0QXLfHb13iHBLrudwysUpCyOToQdghyuSZ6EXHtqNG6/1duV4
         rCv15CUi1P0N5AyAjCG+ORsEeExD6SAwX5LGk+KLSZJZfJzESELLztUvUNZa3CISpraF
         IoLd8y2O8LMrDiLII1/OIAIrXUyw1ri3Sisc6f2diMcNMyrVqLTREjJKDOPj80MBjaKh
         KYERJLL9KBQvb3RSC6Wf67QbMOjrVl+qoOnT5ToIN06AYPW4XGo6ZaCiOlBulVlA0WhD
         Vdhw==
X-Forwarded-Encrypted: i=1; AJvYcCWXMwUVJ5u7/j27tM/fIaIWD8VYCS4HYV1fbz4zGu6rMVxU6I0ZBNkdHO/cUeE6sZB2ErFfz5Rh1Jw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWYHMCqDQe7nCNO5/v7O3ZMwpwahf+Ao9V4Kw2/u5uiiSnJOG2
	20RZdLwcMZT4hHL2F3Vf5bxuluztIW8lK8661NochYEbJ74i2gP4CcDNtP3mwQ==
X-Gm-Gg: ASbGncsib4QM//md8Mw+L9tzPWvN+M4SzcuKlavsX9Rerq56GCdtcwItM7tR1I3IZL9
	kehYcP6hlnE3nYtAczdmabhEr13UjFVHV/9pPN57LR71JPXp1ttkX/GrhfzFFTld0XGK4gD4W5a
	FPYlHlmVY0ZMjxrDOf3ADdsaOSid4tZy/yRyDfiBbxSg1hUUpSLqIhQBVaseePELmuS02DM41qX
	DDxO72qxJACjifKaZHQqSHOe8wMTsWSY8y7stuCfyoXGtEARa5qVBbGwUQw2ARb51brc4T0CYdQ
	up8g+PwWLBl+HwkL8H4Mukj/X4ZJkiKMjLNvGHIl93bBUmS2OIXfn+TZgOJH4PbNoZqx5XwjXCB
	cleZvjgyK1H1iG51tVfsDETdg0FLI8Q==
X-Google-Smtp-Source: AGHT+IFb8h8dEXofnHgnO7bJA8h7GXQunqad9s1qyIs1fbBhQzCjWEY/uSRdeVQLKd0IINm7a0sAUQ==
X-Received: by 2002:a05:600c:a4d:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43ee3e9d55dmr106113795e9.7.1744121498144;
        Tue, 08 Apr 2025 07:11:38 -0700 (PDT)
Message-ID: <7c8cfe6d-6d61-44e5-b1ba-8a7795424977@suse.com>
Date: Tue, 8 Apr 2025 16:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 15:23, Marek Marczykowski-Górecki wrote:
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -173,6 +173,7 @@ void pci_setup(void)
>          switch ( class )
>          {
>          case 0x0300:
> +        case 0x0380:
>              /* If emulated VGA is found, preserve it as primary VGA. */
>              if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
>              {

Unlike here, where vendor IDs are subsequently checked (and the sole question
that arises is whether any of the combinations can actually come as Display
rather than VGA), ...

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2575,7 +2575,8 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>  
>          if (sysfs_dev_get_class(gc, pci, &pci_device_class))
>              continue;
> -        if (pci_device_class != 0x030000) /* VGA class */
> +        if (pci_device_class != 0x030000 && /* VGA class */
> +                pci_device_class != 0x038000) /* Display class */
>              continue;

... there's no such checking here, and instead very much VGA-specific things
are being done then. Is that really in line with permitting Display class
devices here as well?

Jan

