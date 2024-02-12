Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B9851783
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679623.1057147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXqd-0000Lk-Oh; Mon, 12 Feb 2024 15:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679623.1057147; Mon, 12 Feb 2024 15:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXqd-0000JH-LE; Mon, 12 Feb 2024 15:03:55 +0000
Received: by outflank-mailman (input) for mailman id 679623;
 Mon, 12 Feb 2024 15:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXqb-0000JB-KV
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:03:53 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef05e113-c9b7-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:03:52 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2151984f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:03:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0033b65818667sm7152688wrg.76.2024.02.12.07.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:03:51 -0800 (PST)
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
X-Inumbo-ID: ef05e113-c9b7-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750232; x=1708355032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDMVOYplVYaTemfb+geuyF7pUqmwx0HbxEjrQg17lM8=;
        b=UJAM06nzrwBObTvV+trEBmgdo6tAD2m/KUB7VNS/PBDrppdiyACJ7K0ZRSCBcSO5JG
         Fe188/kgoTsRH7HmTXxd9U3IEQ1Q9Go6u/qdxQi8fodFy1JBUqiYLl6HGx4mkXSjk5CM
         lFoJn9+M6OVlLjWM17euwjQT6PvwUfxvHiSGTMWxrp3PJoJEuY+Ny3GJK83fgIItSj8B
         2DMC5AqSzwwTRzoKAY1z/QCsT6wETiOj0ivi+onWdGiz1y7q6lAvCKF03O1fObQUSjEj
         WI2uO4hU3tU/Zfpf8DKUJDIeEM4mLgAwkv5GBkhQJXEdeG/J4Qn4uf95bFCv/Ctwv/ip
         iKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750232; x=1708355032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDMVOYplVYaTemfb+geuyF7pUqmwx0HbxEjrQg17lM8=;
        b=pl52iF9/blVOZNwrxQ2AgYNuNuKW8Lz6D33o2qLR8KS23SnHf6w0XZXnj8FXnWts7P
         6hHkGViY7AvAvxhu4C12mpXB7ZWvaFp6kQQyzSbNkFnupiG4HJRbopgE4Ba0kdYPZg/h
         YLizGmuFcNMQhfju1eoZIeioQNUMQYoeEDJmXlk4AkWzsAARuNbxPTUX6W6/DlO4+DX0
         yp7r25vfoI7+KPV4vCjdny/mKD41RlNA3bfKsIOX+4XIXnomA8R4ixrBKgKAKfM6lx1d
         2VdUdqhYbCiH1Q4UmsdpHiOh38XiOvcXHAaJhiRR6n5lTIpjzpWzjIV0rwnwbPDVs3fR
         vsew==
X-Forwarded-Encrypted: i=1; AJvYcCWCGKNx2iJ92zrgsKDuc6aZbGuXvZO7wRAhIQwgx7Y7Agj0VaVpvfGGvH9VYrJ+sQyIksEMrQZ5XOoidemreZhG7rBjFRcWHig+NHo9kXc=
X-Gm-Message-State: AOJu0Ywv4ep+M/BjsiLcasPLTbEcnt+/hfC897jEDxTSG8RkEEWt9+li
	Hflf1DK0Dka9ZxOJBp/k50eWiwPhm9B3gGHK6/IORp89D2i625Z/5qBB21ZyVQ==
X-Google-Smtp-Source: AGHT+IH4fSAMXTt/POP73CskPlVA8KKufGUmIGZ81uurJ1uoaJZSJbCtSlpoy+5d0pqjJgaSUZ1c4g==
X-Received: by 2002:adf:f40f:0:b0:33b:6dd9:a6a with SMTP id g15-20020adff40f000000b0033b6dd90a6amr5618089wro.22.1707750231754;
        Mon, 12 Feb 2024 07:03:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8VkbH/BnRylsn8L7ryl/KhrCVNiULvDzTc+kMwoxLHybWQShasYc6MKJ7Lfex4Do8SKOyGVn+z7hlMMg/UA7S18N/IweNVNOF0CcfQkmR35n6WP/+syWrWCJw3fT+rQ+9lJQJP+b+saBJtfIk6p/tojjnLKeZakAzZFAS8avOBGp21cNe2RSEL/WPLmm1JfrJCA9dLMgtyrDGkhA+T6vKPNyqGAvD53rMDynvaXXfEGPWqodgOAfYVoY1Jk60TMtxsWfv+WVwdzoTbnZgWLaCEXVPAWcZFd88WUhJZ7C0Df0kGwqxXEo=
Message-ID: <16baca98-44fe-42ba-b61d-ff1945e0d2b5@suse.com>
Date: Mon, 12 Feb 2024 16:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/30] xen/riscv: use some asm-generic headers
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Some headers are the same as asm-generic verions of them
> so use them instead of arch-specific headers.

Just to mention it (I'll commit this as is, unless asked to do otherwise):
With this description I'd expect those "some headers" to be removed by
this patch. Yet you're not talking about anything that exists; instead I
think you mean "would end up the same". Yet that's precisely what
asm-generic/ is for. Hence I would have said something along the lines of
"don't need any customization".

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>  As [PATCH v6 0/9] Introduce generic headers
>  (https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/)
>  is not stable, the list in asm/Makefile can be changed, but the changes will
>  be easy.

Or wait - doesn't this mean the change here can't be committed yet? I
know the cover letter specifies dependencies, yet I think we need to come
to a point where this large series won't need re-posting again and again.

Jan

