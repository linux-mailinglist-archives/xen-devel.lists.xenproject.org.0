Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BDA6DA31
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 13:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925443.1328317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twh2l-0000f2-P1; Mon, 24 Mar 2025 12:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925443.1328317; Mon, 24 Mar 2025 12:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twh2l-0000d4-MR; Mon, 24 Mar 2025 12:36:39 +0000
Received: by outflank-mailman (input) for mailman id 925443;
 Mon, 24 Mar 2025 12:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twh2k-0000cy-OI
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 12:36:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0b0cfb4-08ac-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 13:36:37 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so20583125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 05:36:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995611sm11026558f8f.15.2025.03.24.05.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 05:36:36 -0700 (PDT)
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
X-Inumbo-ID: a0b0cfb4-08ac-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742819797; x=1743424597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i2QPEFEj8na11C7CiVUp1zsnwI7vmYPI81WeNKe9qAc=;
        b=bEN2tZ5xjlnfP6RDM2nmqYeg2TsAun21nwTk+wLZPBtJwI6eOMKo0B9TRV9u9+y837
         KtE/xAOrP1XkeyJZUfFE1dH8Z0NdrHzsn00rkC3ICg4F1FlrKzFmCDL9ta3Kk4sQgBoG
         h5Qe6AUqQFjOyYalXQiHipEhQ5qfysqsJP3sZGa1V5ZfmrlmMhjMXuRlLjgDHjye+Tz9
         5G9AmRhmB6FzX2+om4Od4UV5UOQokNziOD4KsAMuR6l5OE2fRFEzW/ReVe6DxibTduVl
         4bZJx8vrYBXtK4kgGAzuq8sO4Zvrt66rPYtQRoCR5fvVRyctC5mFufl80mTrjtHWUa9y
         39Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819797; x=1743424597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2QPEFEj8na11C7CiVUp1zsnwI7vmYPI81WeNKe9qAc=;
        b=liozHPEnUDeFntHh1zddUqdBhbAKmwodzKfZh9sXm6bD9hKqKQvXNooynrLHLE4xtV
         DEQ4vFhd1F3oOTqk3Iy6p8krH/6bn3bWhSG5hGNfuZW1Mtxxr5Hhre3ofZESHDQo7dtM
         7AxgPI/EpJmzbFNgYHous6jy6V38HtwswV4D2IG5fJt3A843ZJCnBMuduUhCMtGFRTmo
         iyDSsZUFFWQ8dHJZVT4y+2bW+ZTXeDrF1SmGq0sg8Ll3kzLsGiG5NIT3UFvfGJOup0ef
         GUo1l5PfE2fWIBB2+MtINAEPxHI18r99k3MA1tztDVnVLw4y7OLG/2XmT54una0IjJtf
         K/4w==
X-Forwarded-Encrypted: i=1; AJvYcCW0LFD/U0W8EFgnr5Bwupau/4J6nA+KgPEc5ugvihFsapuTOj0TK8dZVWgBipvKxN6THlkOoUm/YKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOdwObaEmJfZ1O17FZe5aiGJZeGkakzk+H1iylkFQfTiv+BgH7
	u9pvtKQsE4qsfC7wre+XN5J3vmqSrpMLAmwIQ2LYOv31KE1FACmj7+RzmAUZnQ==
X-Gm-Gg: ASbGncuxIY6UVrWGkza3d5RIVzKdq9/biiqbdcAD7JV3pe1tzgboAqkFsVX4Uu653I1
	Okfv3O1Lud7vYdAW/CUQRfpQTxl84UzB+m6lmbfP0ewj18ganNs1/xiXZFqkOja6w82dDrTrasJ
	9+rWN8KVEQnRWfc39B+RuMP8uiua9c6nbG6gWJVTkMlOQvas1hLrRyZP/XqBACyD7Jg9i+BSUIs
	3ie7zIhosWvQreyEeTEXQvx9q46kB4VfVr5E3p0xEY6YsEj7ctk1SHSxTNaW242gp7uHA3HRhLU
	+UXopAQg4uEs0NFS4IBfF8DOfBk7Ay9h6ScW5MNFvjwU/UeYXbbVj9AwjkFTJrfNzk1CULaOs9X
	v5CZnZ4FrmZ8JfJ0p5vcYZyYmk+7d7g==
X-Google-Smtp-Source: AGHT+IFKDtkClCWzXrSjVLXdxdoV/LwefxqvZSITCYgWSGwRraZYtkvIh01GJU3FNThxCd88SYxkSg==
X-Received: by 2002:a05:6000:156f:b0:391:ffc:2413 with SMTP id ffacd0b85a97d-3997f92d5ccmr14406322f8f.40.1742819796487;
        Mon, 24 Mar 2025 05:36:36 -0700 (PDT)
Message-ID: <e24ec8f4-3320-4978-8deb-cefc3380a0ed@suse.com>
Date: Mon, 24 Mar 2025 13:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250320230339.3897874-1-dmukhin@ford.com>
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
In-Reply-To: <20250320230339.3897874-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 00:05, dmkhn@proton.me wrote:
> Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> range as per [1]. This macro replaces hardcoded checks against the
> open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> the code a bit.
> 
> [1] Intel SDM volume 3A
>     Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
>     Section "Valid Interrupt Vectors"
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/include/asm/apicdef.h
> +++ b/xen/arch/x86/include/asm/apicdef.h
> @@ -78,6 +78,7 @@
>  #define			APIC_DM_STARTUP		0x00600
>  #define			APIC_DM_EXTINT		0x00700
>  #define			APIC_VECTOR_MASK	0x000FF
> +#define			APIC_VECTOR_VALID(x)	(((x) & APIC_VECTOR_MASK) >= 16)

... line length restrictions respected here. I'll see about taking care of
this while committing, provided other x86 maintainers wouldn't prefer this
to not go in in the first place (so I'll also give it another day or two).

Jan

