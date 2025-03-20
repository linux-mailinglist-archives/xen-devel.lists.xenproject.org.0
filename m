Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA7A6AA28
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922719.1326570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI43-0006vF-Kw; Thu, 20 Mar 2025 15:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922719.1326570; Thu, 20 Mar 2025 15:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI43-0006s8-Hv; Thu, 20 Mar 2025 15:44:11 +0000
Received: by outflank-mailman (input) for mailman id 922719;
 Thu, 20 Mar 2025 15:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvI42-0006qN-EI
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:44:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f044df-05a2-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:44:09 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so475756f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:44:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3978f185c6esm20042287f8f.94.2025.03.20.08.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:44:08 -0700 (PDT)
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
X-Inumbo-ID: 29f044df-05a2-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742485449; x=1743090249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FwsTlabQX/jKFqzZ264zFXJpuqicZFWtaPzWhFaUWsQ=;
        b=LqQw9JyiQ/IWzwohfrbuTpblmPaiXbx6e+VTMY7sYZRUP2/ZEyyOjYtJqx7rr08nTz
         ukHE+57KCLvynDbhzpmulDcBjQ/uslar8Q42PdtxorVue71ESuvfmygkhL3Aw74UD0NF
         rb3pA+eCMjW/16mygtln5mlrjrGyed4LlvBlp+t5av4n4OXqy/jnBsW43n2wWQUa4f3J
         fMxjWAs9xn8S4pI09Hz2ncSop1hKV60aJBVdoCEg0agg/879R7cbK0cQsk3pziMglZY3
         0J+BnLQoo2M6rn3FjNGPh8NEP8LIZtongh+UCtixGGAWW1sXG4XmzMuxw5bF4WqyTlqn
         TRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485449; x=1743090249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwsTlabQX/jKFqzZ264zFXJpuqicZFWtaPzWhFaUWsQ=;
        b=mUU4kOO8CLvj8QWgGOBGdUTD93YaKK4Rp4IOp6U3b8UUWaiOCocw02STyTuKLVODCq
         r7Ru0T+XuipqIUwm0KudFTajMpknU1mgt8azA7XZIhsOhRw4y+t61Z1VGUyl3ycKHsMp
         bcgsJnYRqbikitzWjzpNhHfQrzt6gynGPZ6op7rvFbRuhxiA1mlMP408jv9psD0nAni8
         UEuLSeD4ophr0blefkfBsRugUL4B9DUGBGgn4WssxB20OuUu4IUl0UELXuo6Huc4dP6v
         TVcwRNMZ1rNbF4vDUoK/TzfGaKgiri7UvZ6TEQTbumvCQyeAZyX5ABXQMiCbILXB2ufW
         xuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9He6BAMdvSn3OPfm5QF8phGSD0VrPVa7u5PKxg0B1j8QGcqRJsmeahLiuPWbglMx4OPYb/cQlOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmKJiE2YLLympeKeYQXYuF2ncGHnY7L8BVe+4fiiXpOlS+Yi9C
	9HMqDEltrBPKWyw0MMgQVjTxuklj002zyp6gpsBjvpXozLrnWzicCHV2QdJbKQ==
X-Gm-Gg: ASbGncvWy+IiOFzCdqCcIEstLXVToqEAPlNcALpxrO2kOjQKP4+9IqUyh+35vbory2V
	tb6UJ1++zWra6wuJmZQVNVoFUJMecI434PkkvCrYsy+4TI+TvJI38bA7Zzu21Sx017D9sC0g6nd
	mwquuRmHCklReszdmqOO1d6ILna9HN/eq6IjeDmx5vitS9a7dEkzteJcDgTlQ8tBH2CtUA5pxKK
	/3xbpcTzFORVp2hvlkVp5W2c4xr05zpe0JjQvtIwb+cTEVXAixJr0QI3iS6/6UE3OLgqaA5yS3b
	Q9WgYtphit/vQBjkDH7pBAT5yiQOzbBc52HXTQ8BoBor8NHXGw1eeN30N2yS3jLmjkPpgIwJGRv
	AWkvr21bNDr/1PHlSgiNQbA3hvZ4C4A==
X-Google-Smtp-Source: AGHT+IH23pq7TTayMEwMsvV99SYAyLNZbqP4zzmwYJ8LBLmipuxOKipLCL696m9nnLyRP3aWfXYNsg==
X-Received: by 2002:a5d:6dad:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39973b0487bmr7623345f8f.48.1742485449017;
        Thu, 20 Mar 2025 08:44:09 -0700 (PDT)
Message-ID: <91027ceb-8396-4df5-83e5-11bcda9b2be1@suse.com>
Date: Thu, 20 Mar 2025 16:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250320153241.43809-1-andrew.cooper3@citrix.com>
 <20250320153241.43809-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250320153241.43809-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 16:32, Andrew Cooper wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
>  ### Changed
> + - The minimum toolchain requirements have been increased to either:
> +   - GCC 5.1 and Binutils 2.25, or
> +   - Clang/LLVM 11

Like for the previous patch, take the opportunity and mention RISC-V here
as well?

Jan

