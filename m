Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B582CB25C5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 09:09:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182621.1505475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFFm-0007LX-Ql; Wed, 10 Dec 2025 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182621.1505475; Wed, 10 Dec 2025 08:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFFm-0007Ib-NN; Wed, 10 Dec 2025 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1182621;
 Wed, 10 Dec 2025 08:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTFFl-0007IV-AL
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 08:08:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c22f68-d59f-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 09:08:52 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso86458395e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 00:08:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d31ec4sm33199785e9.8.2025.12.10.00.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:08:50 -0800 (PST)
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
X-Inumbo-ID: 76c22f68-d59f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765354131; x=1765958931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JNXbZaDeBpgc9tYHDpHn8IZKj42FUVxc8vTWzAxDpNA=;
        b=PJXvzl0Ab9Y0GQ1Hfp+3U5UdVix71JfiZeXCQi5yZhlFvU2iN/gS3uLroFzxwKUW4F
         LoLjY6wDDh2Vnl6u2rgZOU4xWFWJ3inTIA/7GeVTkWvMzr5wPfhwIxsAXbWwWv9fZCTs
         saUryVStylLcGgbSgPph9S8Bf6On1JsWKLrFPmHW70sYMb/GaZl8v3QqvUO6odNIynmA
         hLztUtzfDyVSf1rijMvT8wwup8Eied5SK0fjEY2sRaKhMSQN7TNJmKFM+2dulMbiBB5E
         ISxxX6ghVAHZs46W6Lz/S1oMvUIJ+mZoTAYanpdp+lzs2qSVEzHcf86J6ieCVN7MrhZ+
         CxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354131; x=1765958931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNXbZaDeBpgc9tYHDpHn8IZKj42FUVxc8vTWzAxDpNA=;
        b=g9z/ImKtehDpGgJX522yFEVFt6NLIbco/FLurCmyVAUgES6owwObjr5tl9ZVCo0vwJ
         UiOYD1pg5cLBoSIkT3o+hf8Nthyk+X5ha9pL6L/MGrcny8lwxY3t1p8wI2xGXuqJgBc+
         asA88rG9E9svNvt1Imvhia4xsGkx3SZNA66FbG4+/jnEfdQF38cUs+3lZw9zKqh223NO
         S5hRBZhSJVD5ZfQQK9pu2KWIqUAC17r4rhoqI2EV2Pf/Zn3j/PraAGWhNvX7Qq7qaNOZ
         EH2vU3E8eEBvx8IkxXh1vvYkO/qOpBEnTiqBTpYvp9Z0q3RJR+DpXuseG8zEGKjiOqG8
         m2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5WrwOYEu2R/XyM2V8NJKX8WOluAEZDON4Sx/RhMpexk4wdEFBVnnlgZyWnibzo1+BfSwLlWL9t0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkRi7QBfBrNbKxQjSnpxXbNCh79qKn+MMFi2xYQNrJEYMjWt+j
	YaVQJEH2Z80Py4LXwO85JHyf+hKd9XChEny6SMWBzkY6qd1iQ8PstIDtiQzq9Ps83w==
X-Gm-Gg: ASbGncsPHx60E1+NM1n+szH7mezofYEqI7E9UjysyOfls6GmjgbtgnC44qAsdtD5d8D
	/zqNhSnBH3c8iHFP5Pv+ZJhaFLcC69wrpy9HiSpMPBwISPbwqwIDo1xn8L7JlQH1zykRIfNWAJp
	Om+zqIY8cds+nXXgyDHKSL+WTFSHjQq0Cf5176ckJ8zrw2UeSEB9DLUzYKNSaT3Jmg+YRy3FBpR
	RFyJX1iWBjsUws/Rv5zEGCBsGau/KQARAcbVlof2xbTkSRa3HDYH5IrYhCa9lQ+9LK/rLSoTjE3
	o68Sw7mFJYfCSqBXUxibkNDGWGM7wWBnF1o2sthKEQ9Cja+AxJDHlRDT9kP26jF51ViSBcggLZ/
	XJq5bBAzkBYLaJG2YAfYGaurFVOR9nHsCId55DMyO6K01xFq8qcih87HR9SBbRsN2IOZ+f+8tx/
	Kf18tZ7UMGCMJbUzk4ztIPKYaEp7yWqJPQSQye/zdnXx9uunucdhimcdNiKVV3fYNXLHHUjVVkd
	6E=
X-Google-Smtp-Source: AGHT+IEUjcYotY6UOFqB6o5l1b4WriFQWSShXOxvF34d9OdO7ULVObrFG4O2ya3wPrYpII4/wp0xuw==
X-Received: by 2002:a05:600c:530e:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-47a8380b068mr13664125e9.5.1765354131292;
        Wed, 10 Dec 2025 00:08:51 -0800 (PST)
Message-ID: <be7e41df-992a-408e-ad45-c29b4666cb9e@suse.com>
Date: Wed, 10 Dec 2025 09:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: Centralize scheduler linker definition
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-2-jason.andryuk@amd.com>
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
In-Reply-To: <20251209214728.278949-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 22:47, Jason Andryuk wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -173,6 +173,12 @@
>         _edevice = .;        \
>    } :text
>  
> +#define SCHEDULER_ARRAY              \
> +       . = ALIGN(8);                 \

While indeed it was 8 in all original locations, I question that for Arm32
(and a possible future RV32, for example); imo it wants to be ...

> +       __start_schedulers_array = .; \
> +       *(.data.schedulers)           \
> +       __end_schedulers_array = .;
> +
>  #ifdef CONFIG_HYPFS
>  #define HYPFS_PARAM              \
>         . = ALIGN(POINTER_ALIGN); \

... exactly like this. Preferably with that change (happy to carry out while
committing, alongside a respective addition to the description, so long as
there's agreement):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

