Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D4BF74A7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 17:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147434.1479744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBEB5-0002Z0-5G; Tue, 21 Oct 2025 15:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147434.1479744; Tue, 21 Oct 2025 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBEB5-0002Wa-1z; Tue, 21 Oct 2025 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1147434;
 Tue, 21 Oct 2025 15:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBEB4-0002WU-1m
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 15:21:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e8fb431-ae91-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 17:21:30 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso61228235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 08:21:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d9e8sm287748075e9.7.2025.10.21.08.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:21:29 -0700 (PDT)
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
X-Inumbo-ID: 9e8fb431-ae91-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761060090; x=1761664890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1nJPlPGSrWSl4IKFpXLLiSVT9QsusT6mVCDR8zmenkQ=;
        b=J8mVT6xGUcR55Cj0ZMiKJhM/I3qhpZ3iSvWQFPjxfdnQbyvFmIa/ZGWogQYbnBtuCU
         fB6Llk+58dRf9O28VjqzuZIK5cAclJ4JYdpyyCXgprkE9x9hce6NFxl/A8jAeTyRcWXE
         rh8eLsUUt3vNRKAxnZcp5wDxV17lGkqK/5mX8uKtHLSdWWrknPEd9mae1SgihdqGe7u5
         K5RFv9PcTuPOLIikrr647RFbZ4bkT3AlipytgRucFcSHlva7+sMUCsKZUQIWKzuzjuIz
         CWHMcFj5iRK7iNv/e66EDq5YjYBen8mLPjwqAPX6OCJFqjheROY4xZovNJRoDT60h+/U
         SWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060090; x=1761664890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nJPlPGSrWSl4IKFpXLLiSVT9QsusT6mVCDR8zmenkQ=;
        b=jvbbPQ2UHMuFWmTpcfffMi9UYq3o1yKaB1nHC6LWOqnIDxcwvtUfnreJrzZRFYaBza
         s2irBJrxL5Dxa4r+LK1o/cBMbmt9bMawqAnNzouFG3a8J5soNSB7wQsq3TqKJmdjG3SO
         3FFIqDFaJiRqYzyr4ExYgmGCsLrJFUSBED6+kr6yXvScUbU1/egxrSPK7/q5Lw/5Lmby
         Vp1f61x63A/VB9d3/XJZ/pQWcVFJwnoVKejGn8UauA6wh1x5XKcMyQlglX5OjaqXQXXN
         YMR/eEGRa3KfkqdHWLR+2UOwABePAvba9yoyOxVW0v8gBpMRiYmS4dhKOnWXahbWJNUT
         lukg==
X-Gm-Message-State: AOJu0YxM4k3Fw9Iay1zE1Rz/9faAz9JkCcdhJmls8yyc4pPu/Up/gwJ5
	Dbk1xjsl57n+SdJfbwr3WAXtTvAhHkaJhlaO/ZAtrkGMWrcRRInAFUD+slEaTjqpmg==
X-Gm-Gg: ASbGncuEQeBN9juGC8o8CVr68Kv0hlC3WkIwKRSmmX8h7cHx9C8/q93f1IxIPKeWjVD
	3a1dF5j5Do3qIVaBOcNnsdNUF0hNW7TSmRCvEyt452CqkDOKQ5+Jiootv0mWnuXtRYqYP4nZtQs
	BBlbr8daGd/NPQzF3nMLy4oaHlTGIk1jSYk7zEsrkLqsY1RxS0gx45j3gV2azRoqSViXrRTBXfc
	sjSE6dxMjRpzLNav4JWBZ345ClnyW2bjjnnptPG01zWhCCCzytNOtdF+3AtDT+tXpzBoZMZxu2a
	hKfOY4qNCIRFUHCIHXLGZv3gZ5ulte6kWmAmJeBOY9BrIZKHDNHGAGQKCYeXrSyhSvRR/JSkDFJ
	pdbeJTbOZBcR4wMmEbnX4KbXZgBNpi7Vs+Q/WOYSOV/qTxlxrGugVZK+l8ORwAWATZiBvwqfoyc
	dZI5NZrWB7iiNT/UVM+jZPVphCUQkkzvuEcdzySw63wrkKqrqAk4AMQBmZryfl
X-Google-Smtp-Source: AGHT+IF+cJICHOi+5LwFvC5HHmurjmaRKSS36U9UPqfMU8Lw1qMew38leshdRSR7yriCHOw/LE6Kog==
X-Received: by 2002:a05:600c:871a:b0:46f:b42e:e395 with SMTP id 5b1f17b1804b1-4711791ffbemr105825005e9.38.1761060089783;
        Tue, 21 Oct 2025 08:21:29 -0700 (PDT)
Message-ID: <19102e47-f14c-4e45-b8d5-3c9d02829e3a@suse.com>
Date: Tue, 21 Oct 2025 17:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] libxl: make gentypes.py compatible with Python
 older than 3.9
To: Anthony PERARD <anthony@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
 <aPeeBoE-VDf-FsNt@l14>
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
In-Reply-To: <aPeeBoE-VDf-FsNt@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.2025 16:51, Anthony PERARD wrote:
> On Thu, Oct 16, 2025 at 01:22:30PM +0200, Jan Beulich wrote:
>> removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
>> always going to be there anyway, switch to a less specific but more
>> compatible construct.
>>
>> Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks, but: So you prefer this variant over Jason's?

Jan

