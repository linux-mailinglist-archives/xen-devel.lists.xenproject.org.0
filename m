Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEF956618
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779381.1189120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfy92-0004f7-AW; Mon, 19 Aug 2024 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779381.1189120; Mon, 19 Aug 2024 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfy92-0004cO-7C; Mon, 19 Aug 2024 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 779381;
 Mon, 19 Aug 2024 08:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfy90-0004cI-WE
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:53:43 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e63b3b-5e08-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 10:53:40 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so512612966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:53:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cf97dsm607421466b.72.2024.08.19.01.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 01:53:39 -0700 (PDT)
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
X-Inumbo-ID: 87e63b3b-5e08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724057620; x=1724662420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PdCgoZv8il/gZtXvoe9qTIOAToZ6EcDXhQUYj6AcUak=;
        b=Hj0vYLs1+iyKI71BTEzs1abaIy2cB43NdfCRf7EMu/5Uho0SnOCrmEt2fnRrVTH2Pv
         8ZqqQbO8YqFHvH6D4Jxluy5RJ+vcKWAlUhhRUnYBpj3mT1C27UXp3VWgNs2K9gXfgWWX
         sBBW2SgI0aM1IaQaSoq9Hcy66uSatZrh20l42AdiKjGA4zX2zdQUVNb7Ifwkq++nQwJr
         IFFMnyRvdDJ/U32MbpwmiouRHiTVHkzZklwmb3Gbq7HroZraoXINBHyRrKehG/eqA1Je
         EyxkQ3KtuHOgQ3cs9Z2uuYer6MC1Dam8COIvQ678iwJ5BSP3t6Ite05VbIL1erdderLp
         fGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057620; x=1724662420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdCgoZv8il/gZtXvoe9qTIOAToZ6EcDXhQUYj6AcUak=;
        b=H9NXAH4jbTeeCphxx8S2CaAyu+RIkSkNt4klkXXPEn4nCqDN+bSk6RdaJeG+BuQO2g
         oiHLNLsdqF4ts2ya6ImfHhF7jlk3+d3NYgzVOvHRMXzSChMyOCdf0NAnfOIi4O4Hz6kr
         dGI73E6icvscl0HqG2nlf7JRJl/WJCSo7ELZXkxgKSzz1xfppZ0Yj0S7IXGpSoks6Rem
         R7hMYc8lci+VTsMr9baQDds3sxK/NCRmfLcTWt7KEkvHYvT2jFrW0avSgZsmVgO9/oGx
         vEh6K8zWz1c589POzd8W/Kc/uZNxowe2E9BM0qMicG8KTMjQGSDq262jiYhpr+6JKBh1
         k46g==
X-Forwarded-Encrypted: i=1; AJvYcCUDT52fmwJp6KROOKZ5787oMak7tYvMDK+YK5pr5FMil+idY5yRoVw9u+QlPTolc87I7hXaKVOjwjTeZf955mpADTo76qDUI3cHWir0+1k=
X-Gm-Message-State: AOJu0YzATPMs8BPX/Y4nPvSo0cXvKyn92gpS7qKaa9YI7uMrP59y4ZR/
	fQsS78LRF8moZE+wiJCLe+jFcVpdRNpS4ng9NmQR5VfBeZsfl//yVlmfvYfScg==
X-Google-Smtp-Source: AGHT+IFGBjJkr3iczjpGpPg3vgRyLWCBZEwqxr+YKqeRuKMOa7xHDtxeffAl/3IcpaPHFcuer9zt4w==
X-Received: by 2002:a17:907:da5:b0:a77:c314:d621 with SMTP id a640c23a62f3a-a83a9fb91c1mr568665366b.13.1724057619805;
        Mon, 19 Aug 2024 01:53:39 -0700 (PDT)
Message-ID: <5cd1fac5-bf4f-4a5b-b02f-e971d36581b0@suse.com>
Date: Mon, 19 Aug 2024 10:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/Kconfig: introduce CENTAUR, HYGON &
 SHANGHAI config options
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:10, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -10,6 +10,25 @@ config AMD
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on AMD platforms.
>  
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	default y
> +	help
> +	  Detection, tunings and quirks for VIA platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on VIA platforms.
> +
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	depends on AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on Hygon platforms.
> +
>  config INTEL
>  	bool "Support Intel CPUs"
>  	default y
> @@ -19,4 +38,14 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
>  
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Zhaoxin platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on Zhaoxin platforms.
> +
>  endmenu

Imo this re-raises the question of whether it is a good idea to leave out
"CPU" from the names: The more names there are, the more likely it'll become
that going forward we'll run into a naming collision. Andrew, iirc you
were the main proponent for omitting "CPU" - may I ask that you re-consider?

Furthermore I wonder whether "depends on" is appropriate here. This way one
won't be offered e.g. SHANGHAI if earlier on one de-selected INTEL.

Plus it is mere luck that the alphabetic ordering ends up with the dependents
after their dependencies (things would be somewhat odd the other way around).

Finally please check indentation of help text - there is one inconsistency
repeated for all three entries being added.

Jan

