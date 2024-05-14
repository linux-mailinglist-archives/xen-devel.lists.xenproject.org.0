Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D478C4EA6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721333.1124685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ogf-0003Do-Ne; Tue, 14 May 2024 09:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721333.1124685; Tue, 14 May 2024 09:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ogf-0003BX-Jr; Tue, 14 May 2024 09:43:09 +0000
Received: by outflank-mailman (input) for mailman id 721333;
 Tue, 14 May 2024 09:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oge-0002ef-Ps
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:43:08 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ead2d31-11d6-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:43:08 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51aa6a8e49aso7359082e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:43:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfde7sm7320571a12.48.2024.05.14.02.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:43:07 -0700 (PDT)
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
X-Inumbo-ID: 5ead2d31-11d6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715679787; x=1716284587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCIn8xBLTXn2biVgtxyZqDUw0oeSBP2s95BOkhXjPMY=;
        b=QRLo7bVjJfUkSdoFhlut5A0HNuTyo7qwOX5m82cgTY52TPinzl9w0jyEivO6XAQ2yl
         bVZEYpHzkWoK2fVLvaCQdqmlmpgaRpLX9/ep9dWC673uvKkqOw/Qi2dftiTFUF8uwKfq
         TUnBl8UvBGd2yj+edAh4KiHSUxdhgCKq2lVESPnOFGbBa0UAWrK0aV03lROnHDgEnqKp
         Gec4gVWBKSgS/b5VMhuZA9EwXwMt8Z3MB32xXW51zxbU6nsYq43THeXJ8UZDZCN3DYD9
         yN+ApDvtJig3zdLOW5tehbxYZEHz2CBbnJWoiPZC5QoKmZf9PeB5LVrH10TzMkwyuG+t
         rP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679787; x=1716284587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCIn8xBLTXn2biVgtxyZqDUw0oeSBP2s95BOkhXjPMY=;
        b=mWuVHJhtRMtZI1unLOuHi11fShpplf11rsbtIIOjDXRdVbHzgdcXCWEe7CEJHKep4s
         7yQzyTDs4IWvpPnB3rA51uskjs85u5eY4Gx432YZwNB92XzvHBuLgYYZL7ghRGN4HTcW
         LDJWJ4NEzrYfXIaNQvbWQyfZfTnxDoxfmbCuGvc/KvsypWD1wwvpBShRPbgFYv56FAkZ
         C94i38T5TeKwmGr1lg0OeU9tbaC3T3++EJ35bumARC2jVOExOJf8FTQK5HBLewQCVZO7
         0w0p4H/LWoBILPvCIXUafPNy7/J2KK2KsXdVG5wV6YCDrW9XhxYAl+A/rZxTuUVdgUkL
         BMNQ==
X-Gm-Message-State: AOJu0YwVr7Npzhct/+DvTiCUKr7aJJgzdgxP6BYuZ9Ky2S9cfNGAjFd5
	PSu29zFdlzFYMApV9gz9QGgCL4jI/PHXLPVjeS4MM0DqQIWMugkQVJwne2OSGg==
X-Google-Smtp-Source: AGHT+IHOzBLa/10digZoGTNiPwLkeJh/rgFERawkE0fMesKKOgC0YEkREvjI+3bmzWHmx7pQtq5gJg==
X-Received: by 2002:a05:6512:3a83:b0:51a:c8bb:fcf7 with SMTP id 2adb3069b0e04-5220fa7208dmr10148660e87.3.1715679787554;
        Tue, 14 May 2024 02:43:07 -0700 (PDT)
Message-ID: <87950da7-f765-4656-808f-6c63a29ced3d@suse.com>
Date: Tue, 14 May 2024 11:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com> <ZkMxgDPYgaKnmRRE@macbook>
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
In-Reply-To: <ZkMxgDPYgaKnmRRE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 11:40, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
>> @@ -53,6 +55,8 @@ enum fixed_addresses {
>>      FIX_PV_CONSOLE,
>>      FIX_XEN_SHARED_INFO,
>>  #endif /* CONFIG_XEN_GUEST */
>> +    FIX_PMAP_BEGIN,
>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
> 
> This would better have
> 
> #ifdef CONFIG_HAS_PMAP
> 
> guards?

That's useful only when the option can actually be off in certain
configurations, isn't it?

Jan

