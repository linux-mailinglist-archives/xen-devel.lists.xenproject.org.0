Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218CEA388FD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890629.1299771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3ou-0002fD-4Q; Mon, 17 Feb 2025 16:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890629.1299771; Mon, 17 Feb 2025 16:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3ou-0002c9-1p; Mon, 17 Feb 2025 16:18:08 +0000
Received: by outflank-mailman (input) for mailman id 890629;
 Mon, 17 Feb 2025 16:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tk3os-0002c3-Q9
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:18:06 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c42c6577-ed4a-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 17:18:04 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abb705e7662so398623566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:18:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53398364sm905259266b.128.2025.02.17.08.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:18:03 -0800 (PST)
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
X-Inumbo-ID: c42c6577-ed4a-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739809084; x=1740413884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6qttb6E1+vaxV7b553I7Jykq54aC5IObXNkwXrXX1NM=;
        b=DIed5z9a6IMiZsQwqKVLAP9pNkBxqqn7BLjC4D9ViS4nD34/8GnXcHMQhnEx1GH2zL
         Z0wWealK+BaBOF3BX11AGGCZafltX2ejRY1a1RXBfLXUFWbXuBm/n0oqQ2zFLwJzuH05
         yw30LvMzK30jIZBF3MKc0kUjJ3scwbK/nlRbSaKDJp1+QRrq2cVfjIkJc7ea5bLWrE6t
         sa1spVDIdVUF+lP0uCe/O7w8SnP+C65Q0HKddagOBeOPhY0StDP+v7YnVuG6lZcb+uVw
         oqIOLHSvtnFaPg2HBz1uXQyqbhzcxOTAnFAUZDTVGanpTN2C+/WnvUlqe80KxEUV2oZK
         CTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809084; x=1740413884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qttb6E1+vaxV7b553I7Jykq54aC5IObXNkwXrXX1NM=;
        b=kixrpPYZnW6sWFUKN1cgY/cE0BYa9eVykv1NzSxkgZCut+HcrbMytpz6Jbpdy14mGp
         NjGEq4joLgqZR36P0peUIC/Fy1G2sZnbcNzWA5T+LOhlLuoPfl2baeoOoQFR08XZ32CZ
         6IxABLj1rvnaOLHp4H7DzlkyvoSqABgtCdYBj6GQATacrceRQIF31GBN0oG0Mxjs36Pd
         RdjYyzNnvfdAZwQgz5vbqOImTS43BlKj0x4UXG930aueO6n3ZqqrqXkJjZrbXVQwyjiA
         Rpy5Oa5IcIbEnuFl/+ztZBpIZXtaEk6DOF7qYMlJFfPXK1KZ9YEVPI1hAGa94tfCEgMC
         TFqw==
X-Gm-Message-State: AOJu0Yyeo3A/FAl0m3y2zH8rjHGmFqOtExHEa8Uvrpdgth14APlFfAjL
	KmLDTGagzQh/R9P3NY21pAZvXpXbrgmaPXaX3yQns/0igZbVoudfgd6Y06ZY8xio9hBdKKcoDIA
	=
X-Gm-Gg: ASbGncuvsCPfSWW68+NhVfsM4kV/TTYAv16v1fuVkk+Tn/3VzUpmQCHHVrtuvOsgsGo
	nx55WOc7WV5yehjNRjAId1gOC78yUrf7B0Ak2O3l79Cz+AZGeYymGFGSFIIInuR2fVVsk5Eh7ZL
	XBm8Pr1+IYt9o+kWeuJiQV5WDpSWOOkfK+IXSW0vRm+kH3/yyVgnJybp0hOs6MwhxEem35XWL7Y
	PmAVC2uomItwry31Rxi50qaPBqznSUsofQ2Y+UYzq0ywwwC7tpu1+pAyQt64CLhO7EArQXkW73d
	YgMEgFWURXZzBE2G/Ip9JZNbkCaSd1+17worfWfUDa04I/OAxX2hJU9EWEJFOIqffSLW0Eo9bq2
	N
X-Google-Smtp-Source: AGHT+IELbZqn7QQuH9lJuVHNi6HfGS04LK+jIdpQ43acvdZG03ScoRkCcGEcVtkoRidf18hM/JWKeA==
X-Received: by 2002:a17:907:8326:b0:abb:b24d:c63e with SMTP id a640c23a62f3a-abbb24dc7e8mr62041266b.16.1739809084187;
        Mon, 17 Feb 2025 08:18:04 -0800 (PST)
Message-ID: <6cf4fc56-5798-468c-b1c5-9ca7c5398503@suse.com>
Date: Mon, 17 Feb 2025 17:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add option to scan microcode by default
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250217160844.3164003-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 17:08, Ross Lagerwall wrote:
> A lot of systems automatically add microcode to the initrd so it can be
> useful as a vendor policy to always scan for microcode. Add a Kconfig
> option to allow setting the default behaviour.
> 
> The default behaviour is unchanged since the new option defaults to
> "no".
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/Kconfig              | 11 +++++++++++
>  xen/arch/x86/cpu/microcode/core.c |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Please also update the command line doc accordingly.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -383,6 +383,17 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config UCODE_SCAN_DEFAULT
> +	def_bool n

Just "bool" will suffice.

Also can you please send patches To: the list, with maintainers Cc:-ed?

Jan

