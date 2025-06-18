Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02036ADE754
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 11:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019005.1395875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRpIG-0007tO-Qg; Wed, 18 Jun 2025 09:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019005.1395875; Wed, 18 Jun 2025 09:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRpIG-0007qJ-NW; Wed, 18 Jun 2025 09:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1019005;
 Wed, 18 Jun 2025 09:41:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRpIF-0007qD-MZ
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 09:41:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af4a96b-4c28-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 11:41:05 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so343231f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 02:41:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748e61679c5sm1211984b3a.84.2025.06.18.02.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 02:41:04 -0700 (PDT)
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
X-Inumbo-ID: 5af4a96b-4c28-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750239665; x=1750844465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SV7QTOB9IB/5KYixPXUSsCr0q60ZGrKFcI3Mfs64WIU=;
        b=dr1sqdiN0qhZ6kFmO55MuU3HvGBIr1fZ037mjhwUQdWXZ0fDgRhJeEy7cLkA2aMnUQ
         a1w08szNzYILmFbdCDAM9NKITgqON6Ljg7MzS52dS+l1GhQxx9xLVmRiIyGop0aggJ6p
         VQjjjamQbRWiFASFV0H+SGJ/T3NRCzD5zmpolwAw+3igL01BNH4dll4D/DQx1DTiFFpS
         pFkyEBj899Vnvei1flAIHKWhilhYJdOIS7rPfwAxWy85aep5yW5e9beAS264oIKiUaPb
         Jv4TpCLX18ywcSEtife9eXPX2qUbiNfJU1uOnOqkjKZ+mnyNt4MwEfVFz0/cdSqLsHO7
         cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239665; x=1750844465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV7QTOB9IB/5KYixPXUSsCr0q60ZGrKFcI3Mfs64WIU=;
        b=o2GwwLSIkUAIAlNCEiWTnlFQiJzxC+dILIXVtdf/hSy9gzTXrT0eG+0sbL5YZ9w3YO
         oA7x/DXvz4k0KY8HC2yG+jI6wncpLvRqU0RIBKhyHVqJqy+WHwY3LrISSuc9gD7rdFfo
         NUlxaIyggEKNXZXk/KPzr/jJZ+WhA2A4xu55bn5qgAmWA4o6V7CSPUyrYiplH/ykMxe+
         msQJq8DH+jrimAMC6kRg69iwafGd89NT5B4udy55gRBLOdA7AAmfaQjc2LxMjCi91GJA
         CPcJy25spVOY0y6quAq52FO+X2PpIqZ6yh3zUb2kzpKsL6AmZdw9bOlckqQ5eTw9VX2T
         G4GA==
X-Forwarded-Encrypted: i=1; AJvYcCUh0JefXOi4w0gJaEEb73SSQLJLlPdSOpTGR07k85jhWvsfKxp+YnrhP+8FIsFbrxC6GyZR78LPEKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6kKHoxTgMy++JHExynOt/QJ99vDG/tcB5XYPhJYbrxxNFVKoG
	9ZMpMYREr2V55oVJOnaMR62Nbb7Df5XRNm/P213CT48MURjvJDfSrdovKjb1BD3QKg==
X-Gm-Gg: ASbGncuye8GPLn2ispVHeaQPzWgiRA8luJpMddNOqjfTEAQ9uUkzn74q+Xn/jkHeTSH
	XTFEMrXt1YCi3Gb78dPXDFyBgLUgMIt36zlXLn8sRxo+NfrhqHoMejozJuF4aqZSto/HybRIdQv
	g+wKNqLvjOnJc7DxKAcxTgyfsrnI81Dw/faiNFj0ZtyJkXLU7KXDjbzfFINt9jVt3NQbRVKUqTM
	CVT2rEw3KmROxklD+UOVIzXVpLzKa7NGEBjCnjSMWhDKDcqVHMZvGoMk1tN4c2u8FOAM7XMbx+W
	BRDdA32Kk45nYQv9W7c155J5w8NWO2e6F1sH7jretFqgnRYkame+/iizE3tjDhp18Nat46x7xnE
	VegiB2MftipuCi61ntDQKOq5Vm+S7F+3VP0WEIAq/PATFxKI=
X-Google-Smtp-Source: AGHT+IEv/QrVTUnBd251BQDLimQBRKSx7cOjgm22JinTb5IdAD0WAuipPE9l7D+vG2I+bvNQa5hZqA==
X-Received: by 2002:a05:6000:2881:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a58e14562amr1472982f8f.8.1750239665219;
        Wed, 18 Jun 2025 02:41:05 -0700 (PDT)
Message-ID: <dd3adc7e-ad79-4397-90fc-d1f32220b950@suse.com>
Date: Wed, 18 Jun 2025 11:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move __ro_after_init section symbols to
 xen/sections.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1254ad9fd9f9fefc71ff8a5f5d23f5037d854943.1750237599.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1254ad9fd9f9fefc71ff8a5f5d23f5037d854943.1750237599.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2025 11:13, Oleksii Kurochko wrote:
> Instead of declaring __ro_after_init_{start,end} in each architecture's
> asm/setup.h, move these declarations to the common header xen/sections.h.
> 
> This centralizes the declarations and reduces duplication across
> architectures.
> 
> No functional change intended.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

It can probably go in as-is, hence
Acked-by: Jan Beulich <jbeulich@suse.com>
but ...

> --- a/xen/include/xen/sections.h
> +++ b/xen/include/xen/sections.h
> @@ -5,6 +5,9 @@
>  
>  #include <xen/compiler.h>
>  
> +/* SAF-0-safe */
> +extern const char __ro_after_init_start[], __ro_after_init_end[];
> +
>  /* SAF-0-safe */
>  extern char __init_begin[], __init_end[];
>  #define is_init_section(p) ({                           \

... I generally dislike this pattern of adding to the front, as if the
addition was more important than what's there already. But maybe that's
indeed just me ...

Jan

