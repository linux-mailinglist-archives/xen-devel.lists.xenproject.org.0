Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586D95F031
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 13:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783440.1192783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYJO-0003nu-Dg; Mon, 26 Aug 2024 11:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783440.1192783; Mon, 26 Aug 2024 11:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYJO-0003m3-AP; Mon, 26 Aug 2024 11:55:06 +0000
Received: by outflank-mailman (input) for mailman id 783440;
 Mon, 26 Aug 2024 11:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siYJN-0003lv-0R
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 11:55:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 074a2000-63a2-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 13:55:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so5176305a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 04:55:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c044ddbce5sm5560673a12.4.2024.08.26.04.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 04:55:02 -0700 (PDT)
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
X-Inumbo-ID: 074a2000-63a2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724673302; x=1725278102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Xu4kMaCNNhluCV+49KBp0xSgf/cU7UtPbALKpCZb28=;
        b=LBEGLVj47OLPKgKtrr5dwivyBfpO1OeDSyyYEGWX59VcAhHDvt9mgPikH6+k/eXbag
         VnTArm9lsecFpyHb6OCe4IjW3UjXkJIai1xCqlGa3l/cNxvI8HeiEqvq4BvthJUMTgzw
         930DxVSBqNms6H8JSdlHOw+Kh8MkUO9iQH+fQbw6Gk277NPMkMUVyjqkBAn+5tD8oSrV
         j8g9SvVXTPAwASOHW3zN9iJndQ9UiJdFSu1hI4v5ofRh/Hrd+hiORFOhVvgJrLoGYu8U
         d1SS/gE7GE5NPyagpPIC66lnFiU//99u0VkkolIhDcomZXsFPE6tJUaIFdo6/otdqW0L
         FSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724673302; x=1725278102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xu4kMaCNNhluCV+49KBp0xSgf/cU7UtPbALKpCZb28=;
        b=KzmeWi9lRhTGltSfAUqQsCwvt56m387DvFdvstJ2CbUdwExtMoU0nGhfGbXdvY9Dh8
         czDgWugK7P4CkEaJdshEiECGFZNr+oGYCMFGpWJR4F6fw03mjvzQAZWi6b9WDp/tO8Lx
         +P5bPfZ+O96+lw2cW7LmH5S9AkqFSBOC8MOV72rKI/HDX7JdIxx628Zo1jq80uc9mE4n
         s7Chawsne4DnAO7bW/MRmKzRDm8wNdMc/TutBzn+PiLLxEGZa5hLeDq596l1HXIDexsn
         edWvXIJ9b9qYG0MSUDsulFK51kNJgZXxyceEpQe/out3ksb3l6/GVWaqYLdOZgVr3twU
         Dk+w==
X-Forwarded-Encrypted: i=1; AJvYcCV9cOf7fo0EOPUI7Xj2Rg21cQrMjFfixP56r/uOg0hwvpS2LTOYlaSCsnH/2gaa+b6S5me/C1EluuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAuktMNXZNJFSV+haSpxLaOKVlCvR3eRfuzdSIMxKW3bj+2wg0
	uo3SD0gTYNgtgoPig5PWg7M1+sbfZ01tN5w4Vx/D37QP+nUiJ42c3S6UidSIlQ==
X-Google-Smtp-Source: AGHT+IHQYYCflXwElkaL2G/fEfFhqA0s0sV1/OUn33PBjh9LFemQHQ4alT0/tZ03HDeE0BGqAtNxnA==
X-Received: by 2002:a05:6402:50d2:b0:5be:f564:eb0f with SMTP id 4fb4d7f45d1cf-5c08915bc58mr6552258a12.1.1724673302529;
        Mon, 26 Aug 2024 04:55:02 -0700 (PDT)
Message-ID: <11da1350-095f-49c8-bdf0-f5c83e9f0d39@suse.com>
Date: Mon, 26 Aug 2024 13:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> ... and drop generic_hweight64().
> 
> This is identical on all architectures except ARM32.  Add one extra SELF_TEST
> to check that hweight64() works when the input is split in half.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -302,6 +302,14 @@ static always_inline __pure unsigned int hweightl(unsigned long x)
>  #endif
>  }
>  
> +static always_inline __pure unsigned int hweight64(uint64_t x)
> +{
> +    if ( BITS_PER_LONG == 64 )
> +        return hweightl(x);
> +    else
> +        return hweightl(x >> 32) + hweightl(x);

This assume BITS_PER_LONG == 32, which of course is true right now, but
doesn't need to be in general. Better add an explicit cast to uint32_t
(or masking by 0xffffffffU)?

Jan

