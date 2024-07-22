Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33745938F9F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761929.1172001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVshl-0003yY-2n; Mon, 22 Jul 2024 13:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761929.1172001; Mon, 22 Jul 2024 13:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVshl-0003wi-04; Mon, 22 Jul 2024 13:03:53 +0000
Received: by outflank-mailman (input) for mailman id 761929;
 Mon, 22 Jul 2024 13:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVshj-0003vs-A0
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:03:51 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6db1d7f-482a-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 15:03:50 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso17839211fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:03:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa2420sm6096968a12.21.2024.07.22.06.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:03:49 -0700 (PDT)
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
X-Inumbo-ID: d6db1d7f-482a-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721653430; x=1722258230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=la/Ui8oPhbKdSzFW5XFA8OjidMb1oWsniS7p8jFjY7Y=;
        b=Na2aOStBvjcchNPmOarO09TYxrrCzwcF4GWodulhdDUFiI4AyKRly5UPeiwlOumRTc
         l+b3tCCXgmB7NOfSPEJnhXKapwGqFdmYUrojnwiOAiRki2rrITOBT2yru+8np1qEHT3a
         lsIdCrjRqLs2+DRmGF50PBeHeIgbsnDLnqGHEFAQ92guwglxC85ChH6quv6Hu/hnjN8w
         TPE+cUHyECD1wWyKTqPqSdhbGEMwg80WSdQF2VWMQQ4LGGV7ibjxlpp2wM7x3iEILXMF
         q6+f6ydN84ZhCBptwLIDqBF0iBiKCy+/adi3AAXUPvW7V0M4nRqBY6Ia17Y7Vx/kHTbE
         kHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653430; x=1722258230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la/Ui8oPhbKdSzFW5XFA8OjidMb1oWsniS7p8jFjY7Y=;
        b=PPMmO85IzD4kMnwFImzdGrZjCH3oX5PpUOb/uefufgg+sk2Te5FTEC4WVRHW5uOpp7
         N3sKXdBDBLvRI4WWOK1mwPJIW9TwhW4W/wdBt3DmIDACrLaLjuxUEbsiqiG7UCiAQApI
         +CGbTdRcTiggUQcAzKobQHlBQzob0JXTs/5shzy/rUz2U90xNBCFkczS0/ghRfm5XKBJ
         CoA/3LTr0eUMuL8lxg5nFvt1uZ7j7Y/jKUo87m0VucS6pj6iWgpfq3uw/uCmBeztxp3/
         kN6L6hLWDOE1abz0C7ipe9/ev35ZhVrXYCyZSHxj6Fm8ILFwCSUKXdPfeE1tJthtxXLk
         HaIA==
X-Forwarded-Encrypted: i=1; AJvYcCWHv+y+mUnV0Bq4W5Ka2oKgiUL84DqZTM9NxbbAqylPdRwfSE0/J3Bpire+Dba2496bBroW0/S29n9IVdlRQtUIHDw16QFuj3zqwnYq2Tg=
X-Gm-Message-State: AOJu0Yw9EMdHMmmXyfR4WJLAK1GN/dQRDQqW8P6ppqwQGxL6yANR7H9T
	jSW3uce1yA/7puXmAGVXybczsvRIX4AQwqSsilrWM1CAcwMSDFcFsUjWT4QI4g==
X-Google-Smtp-Source: AGHT+IHKKTfeIQ5jY2nXFGJNcIdDi+EBEnXt592KclOxVaTa8P7AEjXVjfbl0TFQCvXX0KYPEKMC6g==
X-Received: by 2002:a2e:9ecb:0:b0:2ee:7c12:7b36 with SMTP id 38308e7fff4ca-2ef16784929mr51249281fa.19.1721653429738;
        Mon, 22 Jul 2024 06:03:49 -0700 (PDT)
Message-ID: <fe42229e-be70-4d51-aca2-b1f874652d35@suse.com>
Date: Mon, 22 Jul 2024 15:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix the figlet banner
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722124842.4039445-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240722124842.4039445-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 14:48, Andrew Cooper wrote:
> 4.20 is just wide enough to cause figlet to split the banner onto two lines:
> 
>    __  __
>    \ \/ /___ _ __
>     \  // _ \ '_ \
>     /  \  __/ | | |
>    /_/\_\___|_| |_|
> 
>    _  _    ____   ___                     _        _     _
>   | || |  |___ \ / _ \    _   _ _ __  ___| |_ __ _| |__ | | ___
>   | || |_   __) | | | |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>   |__   _| / __/| |_| |__| |_| | | | \__ \ || (_| | |_) | |  __/
>      |_|(_)_____|\___/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> 
> Instruct figlet to use 100 column width, rather than 80, resulting in:
> 
>    __  __            _  _    ____   ___                     _        _     _
>    \ \/ /___ _ __   | || |  |___ \ / _ \    _   _ _ __  ___| |_ __ _| |__ | | ___
>     \  // _ \ '_ \  | || |_   __) | | | |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>     /  \  __/ | | | |__   _| / __/| |_| |__| |_| | | | \__ \ || (_| | |_) | |  __/
>    /_/\_\___|_| |_|    |_|(_)_____|\___/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> 
> While fixing this, also fix a rendering error in the non-figlet case; while a
> leading space looks better for figlet, it looks very wrong for the simple
> one-line case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



