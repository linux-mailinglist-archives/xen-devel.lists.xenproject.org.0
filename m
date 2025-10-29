Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B05C1B455
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152811.1483318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7IT-00088c-ST; Wed, 29 Oct 2025 14:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152811.1483318; Wed, 29 Oct 2025 14:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7IT-00086p-Px; Wed, 29 Oct 2025 14:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1152811;
 Wed, 29 Oct 2025 14:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE7IS-00086h-JS
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 14:37:08 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be74d50a-b4d4-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 15:37:07 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso32535895e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 07:37:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm27385697f8f.24.2025.10.29.07.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:37:06 -0700 (PDT)
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
X-Inumbo-ID: be74d50a-b4d4-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761748627; x=1762353427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/yRRIrGcuncnY6hx1gaZybkKlleGbq7IYTzn47DtTQ4=;
        b=YpeBe6gBrDrQ0Ck7vzIYiz0ddvKJJYw3N4JDWMnxIcPUqxQEBBNB2HZUdRhKclHUUd
         EwZyDGMLRefJbLflOxfcFPt+TYIcQbS21juRqYx2MKx5+CnO93Dewu6nb4SvSGVwA3Y5
         PqxFkZPG4nrMoz9vwow6rmJX/WED0p0xk8dM8ljUACZgV9dj9L8dazR7+hVAwpkF6Y/p
         hwag7Z5UQxOszVgSkXQag9F/GHDm4oTsI83wR9jPCG362gI7WtQvri5VG4uMXctlwuwc
         tAUE0maXHfXa5NraCzAaX2y7jmrsPkZuXyzae3fPakDCyHg8BWcL838RIISfNhaiveSc
         rQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748627; x=1762353427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yRRIrGcuncnY6hx1gaZybkKlleGbq7IYTzn47DtTQ4=;
        b=AM/t3DKHjW5MuOdLWcMgy6NyhkprtIaa/go4H3YNrwURJfNPVmSmdFUHQTwgvgsaDZ
         HUuFPU1veAcT7EmIeGCSCl5HTqTIpH8wOe8ZvaxWTczwQlbM1Pa9zdhtUhkz7QuIZkw5
         BfzU0bYpXOV+ODocBPrU/rrjDUGvfCQlrLRISqR5HBw05ewisNpvAdiIvjAHuNdEELJQ
         s3hVpXVsME6F51RgFBTvrQRnfnZDiESvwyw7umRscU83/liDsufRTSmJWq3NQR/oFPB0
         65+mpoSwdjCUUMf3YQr2yzq0NaRqRgk5PNmOPrhHCJQD/IA3juFqx51ccrFC0hUpxJdl
         brJw==
X-Forwarded-Encrypted: i=1; AJvYcCXVJxXv2CYo47YzoiBPm7vehhMfgp0dfTepDxj8bfzRncSTCQdu5BqyFuASAQnKzai2v6aeUkZ23Yw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3gciTyOab51gh8Y9ErxKNqoXtrM/UopEaRWiRvBFdsnDVlWKe
	QwtR0KCf4H+2g+uwSJYxs4w5AM6MB/EH/Ti5uMBrp2OAMATtd8DV1V4k+0JcXp/6dA==
X-Gm-Gg: ASbGncvhiNUH4X+CnAhwf3GYUTtK5NRtxWuDw4RP3o3bFs70hyoF1RbaylNchBw+yXN
	WwtczLOqs+7CGkkhb2iJXzxu5phOqKtUqXzt5bkmW7jEf+XL/bF8buozGODi1jZfp808M2IwM4f
	bJkXuoIs2DIP4WZWrfvwdR/cWLqctffyscShRxJ++EQYdQjApeszgQUVHGx5IJR79iAmbaHlLUY
	PQntLJUnZQFmcWPu1L+xXPYkBthoxB0ooN8x9B3As2NzdgZfJ3dYDIWtvp2270gjgo6ZcOjnzqI
	PyHSP258OAgc3Ge9KYkp6HMSq7dhoqUqRlIBQm8yxo15Bn2UbwOgQZPn8EpqUZ4JdmkwO1VET0A
	HakybZ1Uzb9KcnaOfaPGb7E2RgPSKrKsgl4e6z47HQI1aGK+GHBa4zP4AUkcG+oyQPRrAX9nrSC
	27lp2Y+W0oyzGJjZRNGo9gINK9o7nrYKEFMtPb9qpaIM6k/hUO1HtHYCgOVi1Z+7Lry4c+rZs=
X-Google-Smtp-Source: AGHT+IECboWfekSlJOPwdpPVbvq3vlLqpPKhPvqic3lNk1Jgyk8ILrerJWqrwxUfYPfLyhjpWFDbrQ==
X-Received: by 2002:a05:6000:26ca:b0:3ee:1586:6c73 with SMTP id ffacd0b85a97d-429aef83dbcmr2322046f8f.19.1761748626682;
        Wed, 29 Oct 2025 07:37:06 -0700 (PDT)
Message-ID: <ed2dcaac-4434-4f21-aa75-f33a5f66d83f@suse.com>
Date: Wed, 29 Oct 2025 15:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/28] xen/domctl: make MGMT_HYPERCALLS transiently
 def_bool
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> In order to asist in reviewing/developing disabling domctl-op patch serie,
> we will transiently make MGMT_HYPERCALLS def_bool. And it will become
> optional at the last of domctl-op patch serie, where common/domctl.o's
> building as a whole becomes dependent upon that setting.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

While in principle this is what I have been asking for, I don't think it can
sensibly be ack-ed before being re-based onto current staging, where ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -649,8 +649,7 @@ config SYSTEM_SUSPEND
>  	  If unsure, say N.
>  
>  config MGMT_HYPERCALLS
> -	bool "Enable privileged hypercalls for system management"
> -	default y
> +	def_bool y
>  	help
>  	  This option shall only be disabled on some dom0less systems, or
>  	  PV shim on x86, to reduce Xen footprint via managing unnessary

... a "depends on" has (re)appeared.

Jan

