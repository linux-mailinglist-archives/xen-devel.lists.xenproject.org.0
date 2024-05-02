Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345A8B9B74
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715819.1117744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WJ1-00047o-Dl; Thu, 02 May 2024 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715819.1117744; Thu, 02 May 2024 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WJ1-00046H-9j; Thu, 02 May 2024 13:16:59 +0000
Received: by outflank-mailman (input) for mailman id 715819;
 Thu, 02 May 2024 13:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2WJ0-00046B-2W
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:16:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fb011f0-0886-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 15:16:56 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so67780295e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 06:16:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0041bc41287cesm1955755wmo.16.2024.05.02.06.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 06:16:55 -0700 (PDT)
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
X-Inumbo-ID: 3fb011f0-0886-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714655815; x=1715260615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqFPop1z8PxPmfrFqSXPCSC5YolOrRav4f99mOoojAw=;
        b=c5IqEtOWvrh10lo+E6vdI22DpXEcEY/aW9zPH2mT8+eK+SCJmrI7VGx2ja3l1TnpbH
         NjebAmFm1ZOv61lFbfUUL0Ppc+0YXDjhfQcpHLRo0GCDYRgcE2HWxoaks86j1gGzK0pq
         HPTAv291x75ENEwG3GL731DsX642C/qzTENIMbz5GMUXi8eITjJYvt24I9EfjPjWp+eJ
         7FtzrWPPBY55b76TBOU8IWIOOA+XQUI0gIkGWD8SpI9SiKhtg6YjNCxpQcQ1+YULNv/m
         c4wChkmhCj0zGnTiwmHz3JsF9INJKJpL/Y/ci+4H7+YZUPwwiwM/nmVbNZrylBRP++/r
         pi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714655815; x=1715260615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqFPop1z8PxPmfrFqSXPCSC5YolOrRav4f99mOoojAw=;
        b=bKan9ljsOU9XaAxsPcLZAEQtjQ4atYwHLuve9V++ZiaJ+bU+4BxM6j5NEuxdtb2ZSG
         gmXM9USzyer24TnkHWHZjcIgYToRKNknVeJxBaO2CPJuWcUuf1EE1iMWEENeGoFUwtkr
         wBd0TdJZCba15UTwE35eA9H5aOXZ5msvyZbjK0WhnSNFh8SlWTrv0znFnIOkq0gMDZwF
         pwzS03FS2oQjVbA+KttXJUmDa7jU/UfPOd7vriDXUouZ7+swHWCVgSvOv1MTGsrAM7/M
         F2UbKAvF1oLoxK+10Yvc9JKYijyigPx2qUuvawzekdH2F4wC6L2LHtUYO2HQHuUngPXe
         7GtA==
X-Forwarded-Encrypted: i=1; AJvYcCUYaSl5lPGZH1jm/VMb9i8k9CRaxBGNZ+/dYy9EYgcmYGSUXJkufMmIOculTeRrK4LhTgQIMhauPYpxXhAURWLLRRmwiFcf7EGbVQx54aM=
X-Gm-Message-State: AOJu0YzwMQCSt4N6lB/1kwOvRWGVQTbFvmirzL7Yw3rPdJeIpVeBVp5W
	qxbBH8rpqeHGFX8VWc5OqfRVUtIPzwfHQcX4QR8OEZp8c2K0D9hAyzLGmhrL+DR08lAChUJCgpo
	=
X-Google-Smtp-Source: AGHT+IEddnz0SBQ2g0qRwYCQa8V0am179NRP5IVIF5yGrgmAC8xSyhnzCAnXzZmFe4frEFx/rhAsEQ==
X-Received: by 2002:a05:600c:4748:b0:41a:47db:290c with SMTP id w8-20020a05600c474800b0041a47db290cmr4941137wmo.5.1714655815459;
        Thu, 02 May 2024 06:16:55 -0700 (PDT)
Message-ID: <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com>
Date: Thu, 2 May 2024 15:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] tools/xen-cpuid: switch to use cpu-policy
 defined names
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240502114922.94288-1-roger.pau@citrix.com>
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
In-Reply-To: <20240502114922.94288-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 13:49, Roger Pau Monne wrote:
> Like it was done recently for libxl, switch to using the auto-generated feature
> names by the processing of cpufeatureset.h, this allows removing the open-coded
> feature names, and unifies the feature naming with libxl and the hypervisor.
> 
> Introduce a newly auto-generated array that contains the feature names indexed
> at featureset bit position, otherwise using the existing INIT_FEATURE_NAMES
> would require iterating over the array elements until a match with the expected
> bit position is found.
> 
> Note that leaf names need to be kept, as the current auto-generated data
> doesn't contain the leaf names.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
except that ...

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -475,6 +475,32 @@ def write_results(state):
>      state.output.write(
>  """}
>  
> +""")
> +
> +    state.output.write(
> +"""
> +#define INIT_FEATURE_NAME_ARRAY { \\
> +""")
> +
> +    try:
> +        _tmp = state.names.iteritems()
> +    except AttributeError:
> +        _tmp = state.names.items()

... can't figure what this try/except is needed for. Hopefully someone with
better Python foo than mine can take a look.

Jan

