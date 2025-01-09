Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0163CA07C30
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868837.1280343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuhk-0006Qd-07; Thu, 09 Jan 2025 15:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868837.1280343; Thu, 09 Jan 2025 15:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuhj-0006PA-Te; Thu, 09 Jan 2025 15:44:15 +0000
Received: by outflank-mailman (input) for mailman id 868837;
 Thu, 09 Jan 2025 15:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVuhj-0006P4-1t
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:44:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93ac9dd7-cea0-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:44:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso9062305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:44:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc0069sm60145395e9.11.2025.01.09.07.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:44:13 -0800 (PST)
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
X-Inumbo-ID: 93ac9dd7-cea0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437453; x=1737042253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZNVryZ2V3wnkRwb8LAQRPN50IYrgFAUD6O6S1spCEs=;
        b=I+Hq/JzkKMPF7IDVNkXDCXnnfjcKDcYNPnDQB2Y4iFM0m8nTUcqmyuXTvdinlxR/vD
         cPpwAPjTyGYo1F83fJ/lFyqgkdzey5Rw3RBX0OhfA/H4zGSSsrvUaxuDvpqFWO36WRs+
         I4vIWTyK6yXs1NN+Hxhq6exupweEReHi0nhjKYqMESQOd7wlsX86UazXbHVnxbBc2JLg
         CvmJT7kusdNOVNyMihcvcWztCIA6DrkCmxVRmBO6iq/PT7FDxZDxuN/oTsYDve+QUmFE
         gSg9PDqkSsQiA0k4g6tciBEsLjyki5oTrtsDEKK8xKJwg8B21+OkJYUAyOFsuCXA+wDw
         9IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437453; x=1737042253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZNVryZ2V3wnkRwb8LAQRPN50IYrgFAUD6O6S1spCEs=;
        b=epOWnzwU6fjdtSBBgFBQePZ4WgwWfL89owqbyHUL0JLSD3DKB4+qqjQ2B2mcRNCCwi
         JnndAw1fLH+KrG8zVgiGnopuMrUFNCgP9GI+2fRSypBXCWqS50GgW34oxd8Acsfch5b2
         8yIgmfzaKgnygYWj/mWz4qwdNC2SRItTOoSoll0hck4eYU2mly/QsQg96fTOO3VOx4q3
         gr0b9W6RqBRc7UaeZbdQp0aIHDdb3M0kcFZvmkKyJsS1ChrbA7JvyO/dJJBDfA8A/GDA
         4J3olS6S2WGGXNxUEbRNs3ewQOcGeEBRoD5Qa6Tfna7w4I+QWN5fK0Y5p6YXLbkSKVea
         83Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWp9lErlWQUz3HZM/eMKccbJXHxJlrpHyu/UZplarU1hNycJ8w4ip1usKuQ9tgzmzbo9/e0NPAb+3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxByEIrPV1wsLuohk94XOE+g1cIOI9IBFNvFwL7DZgunD6lA/ts
	Qpk9/kISf7aR4BUnFVgVTIVfV7l0q2/FDY5/jPmk65TbvqFwNup9lIZUQ7uAUg==
X-Gm-Gg: ASbGncvUzD85vQeWDrh3kynkMzdF175N2RyF/RvwWAbRjKPb10VQ2UHGKR4F+IGGV5P
	RCFONGkWB2NYL7DWhLJ4WQlfJnpI6koXp7H1L/vPXBzhQCQzVr9y7A+UwBDF9Z4AyUGyHxFHDad
	FRY23Q3YwRe6EAaArdMMvSkcqdIfrkMp7DNKZZ85jbil8AgBqsMiNXEwbAptah94v9lGsc1Ojnk
	bnpVzHAveA78hblAwb4N+9FEn0/pxPpDtLdcCKse16kWdeawYk89PQh6PBKpW7Q7HAYWl56EmHX
	zsXTd3gtfE+ZaSWKbTyDxXqpBg/V9r4bZrO3mQmoQg==
X-Google-Smtp-Source: AGHT+IGxxHi23askfoSi56FozuLIP9LXgYvqyMA+/SYq/1f2WGGFHdb2D19FrfFBE02xsL2M6RfUUw==
X-Received: by 2002:a05:600c:4ed3:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-436e26dda8cmr59490845e9.23.1736437453506;
        Thu, 09 Jan 2025 07:44:13 -0800 (PST)
Message-ID: <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
Date: Thu, 9 Jan 2025 16:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.20-rc
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
 <20250109153921.43610-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250109153921.43610-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 16:39, Andrew Cooper wrote:
> --- a/README
> +++ b/README
> @@ -1,11 +1,11 @@
> -############################################################
> -__  __                                _        _     _
> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> -
> -############################################################
> +#####################################################
> +__  __            _  _    ____   ___
> +\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
> + \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
> + /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
> +/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
> +
> +#####################################################
>  
>  https://www.xen.org/
>  
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>  
>  # Release Support
>  
> -    Xen-Version: 4.20-unstable
> +    Xen-Version: 4.20-rc
>      Initial-Release: n/a
>      Supported-Until: TBD
>      Security-Support-Until: Unreleased - not yet security-supported
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerated.
>  export XEN_VERSION       = 4
>  export XEN_SUBVERSION    = 20
> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)

Since we'd been there before I take it the .0 in here (which isn't in the
changes to the other two files) is deliberate now? Clearly I continue to
think it shouldn't be put there together with -rc.

Jan

