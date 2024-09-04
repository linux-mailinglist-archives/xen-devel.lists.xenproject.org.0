Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC096B3D4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 10:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789881.1199538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slkyq-0006qW-LO; Wed, 04 Sep 2024 08:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789881.1199538; Wed, 04 Sep 2024 08:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slkyq-0006p1-Ic; Wed, 04 Sep 2024 08:03:08 +0000
Received: by outflank-mailman (input) for mailman id 789881;
 Wed, 04 Sep 2024 08:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slkyo-0006of-Dv
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 08:03:06 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cd4f903-6a94-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 10:03:04 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-533488ffaf7so8567452e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 01:03:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891db42fsm767943466b.184.2024.09.04.01.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:03:03 -0700 (PDT)
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
X-Inumbo-ID: 1cd4f903-6a94-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725436984; x=1726041784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4QuLAkOQvFGPRbyFTe0uWisoxMW1Q1XbefCobjkWkUc=;
        b=N3YEb2J0uQY1EcjnPetTP9PvT6UICMk38lcbp4j7csisL8LofiWAaRvfRrUnR+Ahcz
         Dk2a50p10wj6voohrHhfi+XMka5QaMT18GzZdRanSFgfSlkqwNohtAypRVR7Kp4r0MMF
         pkhra2ZNYIXWeNiXcc7bsyHzRRbuIT8myQWcg0LL2yKWNnZU15Hg2SQ3diQM+1rafoLW
         tdbafrI36jkxSQ1WugsA242YOrf6gfkyxPcRZz9gm6LXMsYm3NGfQdNwRz0Sin8Hb5BG
         /krYgqmBdcacq+SX3vg+9YhjDeaZJBDcXFi2eNRuTsyNm1kMZN8mBdMbrWXG0U9hrm61
         9QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436984; x=1726041784;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QuLAkOQvFGPRbyFTe0uWisoxMW1Q1XbefCobjkWkUc=;
        b=I/FAwV/IpfCs75ci7pb4bma1MI6LgVuEvXbKOHsybcv6qmv+2MSgSsTDHLn/qDQidU
         s6eQP7ONt7ca96po9IeRdOnOR//5RTm+WqICIKpEBxRFKv1FJXpC2OTUgomqmpcoMRR3
         coyoXPk4kW8A1ATmSD5RnNtOhMmwekxZ9idkzh1nml5cg4LhTUXV53rSHnowD2NIP6uK
         6L4pKPQQcAj33Q0+CicCLAB3i6WVhiyreftJARuQgAipuHZ3ncE2QrFgzzohOSjJQDmg
         wzrdM4Fr6ZjgOFhbsnhFxWs118YZwygJRba/B1DW3h7M1Imf6rW1szO6MMe90JwYNs/S
         RtYw==
X-Forwarded-Encrypted: i=1; AJvYcCXJaALaM71imHJIXhjtW5NmMWGyB/Yr/M/ww0zXFLrL6ToOCf8jbL3K9pLfeAFsf6veKLN5DzUDEz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhYXZNmxolblXZi3L0lYewzwLwU/tULFg1Gh3F3w3yujdBD9Xh
	z7q3YVbJAyqhhwsM+6Dn+3OIJ9W/J4Z73c9UHPzN0C/b1a+6UEYkfoJ06LQlTw==
X-Google-Smtp-Source: AGHT+IHKcFQuq5fPyV9e64yOoB8fpb+cPVk9uXa9O8Nr1nzPa61BBLz1M4rY9ubRcvrHJ1EhgdEKtg==
X-Received: by 2002:a05:6512:118a:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-53546b4b08cmr13151976e87.35.1725436983701;
        Wed, 04 Sep 2024 01:03:03 -0700 (PDT)
Message-ID: <cee8e1ed-c462-48e8-9559-d8064c8aa0f2@suse.com>
Date: Wed, 4 Sep 2024 10:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v3] SUPPORT.md: split XSM from Flask
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
Content-Language: en-US
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
In-Reply-To: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 09:44, Jan Beulich wrote:
> XSM is a generic framework, which in particular is also used by SILO.
> With this it can't really be experimental: Arm mandates SILO for having
> a security supported configuration.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Add explanations. Another terminology adjustment.
> v2: Terminology adjustments. Stronger description.

Are yet further adjustments needed?

Jan

> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -769,13 +769,21 @@ Compile time disabled for ARM by default
>  
>      Status, x86: Supported, not security supported
>  
> -### XSM & FLASK
> +### XSM (Xen Security Module) Framework
> +
> +XSM is a security policy framework.  The dummy implementation is covered by this
> +statement, and implements a policy whereby dom0 is all powerful.  See below for
> +alternative modules (FLASK, SILO).
> +
> +    Status: Supported
> +
> +### FLASK XSM Module
>  
>      Status: Experimental
>  
>  Compile time disabled by default.
>  
> -Also note that using XSM
> +Also note that using FLASK
>  to delegate various domain control hypercalls
>  to particular other domains, rather than only permitting use by dom0,
>  is also specifically excluded from security support for many hypercalls.
> @@ -788,6 +796,13 @@ Please see XSA-77 for more details.
>  The default policy includes FLASK labels and roles for a "typical" Xen-based system
>  with dom0, driver domains, stub domains, domUs, and so on.
>  
> +### SILO XSM Module
> +
> +SILO implements a policy whereby DomU-s can only communicate with Dom0, yet not
> +with each other.
> +
> +    Status: Supported
> +
>  ## Virtual Hardware, Hypervisor
>  
>  ### x86/Nested PV


