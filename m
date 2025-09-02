Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF85B406F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106663.1457300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS50-0007pq-B3; Tue, 02 Sep 2025 14:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106663.1457300; Tue, 02 Sep 2025 14:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS50-0007mo-82; Tue, 02 Sep 2025 14:33:50 +0000
Received: by outflank-mailman (input) for mailman id 1106663;
 Tue, 02 Sep 2025 14:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utS4z-0007mg-C6
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:33:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6597009-8809-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 16:33:48 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso1051865166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:33:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff12a6b404sm975059566b.88.2025.09.02.07.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 07:33:47 -0700 (PDT)
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
X-Inumbo-ID: d6597009-8809-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756823628; x=1757428428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fug8TST8D1TGIze0YJXLCGZTFH16x6VDhPpDNaS5GA=;
        b=Vp9t9fUiVvynF+IPsYLmXlEnmsIgifWv/h2M+ERMjlPPq1pN1iJgyYjb4GYXM+nOg3
         R69L6sNV3Ftf5bNHQa5HLXaikOUCuNVp1wtobkceGXIPRTo8XZNf/DLTCVwrtvdYuoDM
         7mCB0TvsICZ2zNhE2O1gGfBAkMcIpwF+Sus0CsfTFz+5gVsTOB/D5EbpBw1t4Pq+BHyr
         Bg0tskYOxBMlzI27un4iPL6BZuvVtWwTmgFnQrKRFclZwzKH6tQzuU5LX7JQWgz6xnZb
         DXAVGhc5MTB0IRci6yv8uVRxyNJJ5n9Ce4cUkCMQbmrCfmfp7C1taakZ5Uk/aQCTHHLX
         SsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756823628; x=1757428428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fug8TST8D1TGIze0YJXLCGZTFH16x6VDhPpDNaS5GA=;
        b=J3jajr/nDoADyEsBE8cony8UXkajrnjVo70D9Mo57XleHOACekyb2r4dsInvuRPAgc
         0q/sZ7Dsm82aL02hiLswGLXTj4gETWKwSLaxiXr3jRllvG2w7WPB961pmlpaj3LF5HeP
         nVGWKmV9a69vHKE7joZnY2+u9mwj7zRsNSl9AwwqxNGG1SsCMYPo+xE14xSOkcKfgHRC
         //2IzXGmegMo+IUb2fOBLF9ziM3k2ohglP7x+Lx3nPACG6yszzZE/xK7Dz+QMq2f/Z6n
         w12kub1/d8EEfIHTE9li8k03mWrKuwLkD0QGh18hoUAWRXdf7x93iZeJREWUyZkeqIBT
         YXXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMrf0atuOL+eUqKEzyEUKcn60y/blLTykc9CA7kjTweZqdNyza5/dLeLYZesY0flUUVcidWupZnwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/kDnUlDn96YSNbkeOL7TgH0d/9PxbJnMFUyrKbG2dp0eR4hBk
	AO3xE6hLge0NX96LU+BiGQUE7PLJMcbw4w0mqMR4GzBrGWTTXnmPfM2PnQiGC1m85w==
X-Gm-Gg: ASbGncs9MUVXte+jvj41CgRK/TVxRKQfMyNe9wURC4t6Z9KxS0dcYMX8TGPX1IrYlJB
	z3f23DTqsY8vKRGw+zqBk7VOB8swPhVikgut7QcBaicInWq2FlsvT2LCSjCG8T6boCpJby26iM5
	FUQtgU3nZhyWik/QVDtvda5C/aABXU1EAXp0EDD2r7+1SF9ZIh//2j8f8Nexsvd8EIKNV4tqMZk
	3wTBQWPJVh5iLhJwctCsklbLwWERI8Lyw/8Z/54iOYtc7dNiAAFYbmnuCo/NqpxfB3dA4mQzdyQ
	rMq+jQnMqxEw56DC0khhJSUBcDzJ71t9ddOWJY1BfR++ZqJViNTqKAuT+vvgKKskdAsTffLheWu
	Ro1Pv+8+S1Rf+WwEk1mFiJyBLvr6GeSJKDZiF/8dOrRQcSP7rN/Rhsw6N5lEPICRFAJK1mRbCjR
	X4Y3Qtk5s=
X-Google-Smtp-Source: AGHT+IGNLUoN+KqW8GbR6aVbQ7MW+h6iZmzXY8vHeCqg4KX2US57BqpyJYxb5P+nrSRkdsXKEV137A==
X-Received: by 2002:a17:907:3f26:b0:b04:4b0d:8e82 with SMTP id a640c23a62f3a-b044b0dc4c6mr294149166b.50.1756823627453;
        Tue, 02 Sep 2025 07:33:47 -0700 (PDT)
Message-ID: <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
Date: Tue, 2 Sep 2025 16:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
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
In-Reply-To: <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 00:10, Mykola Kvach wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reason)
>          d->shutdown_code = reason;
>      reason = d->shutdown_code;
>  
> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> +    if ( reason != SHUTDOWN_suspend && is_hardware_domain(d) )
> +#else
>      if ( is_hardware_domain(d) )
> +#endif
>          hwdom_shutdown(reason);

I still don't follow why Arm-specific code needs to live here. If this
can't be properly abstracted, then at the very least I'd expect some
code comment here, or at the very, very least something in the description.

From looking at hwdom_shutdown() I get the impression that it doesn't
expect to be called with SHUTDOWN_suspend, yet then the question is why we
make it into domain_shutdown() with that reason code.

Jan

