Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9CFA744C7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930238.1332898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4TO-0000TY-BN; Fri, 28 Mar 2025 07:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930238.1332898; Fri, 28 Mar 2025 07:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4TO-0000Rm-7h; Fri, 28 Mar 2025 07:49:50 +0000
Received: by outflank-mailman (input) for mailman id 930238;
 Fri, 28 Mar 2025 07:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty4TN-0000Rg-0G
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:49:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 381f7c49-0ba9-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 08:49:46 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso1067812f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:49:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d9172733csm9176715e9.3.2025.03.28.00.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 00:49:45 -0700 (PDT)
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
X-Inumbo-ID: 381f7c49-0ba9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743148186; x=1743752986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w43rttHxTt8yAi6uWl0TBMLcdEuCqMNaaQ2SAAZG3X4=;
        b=EBpir0v/VFAwP4RfCboBeiQz1ckkx0aYnw8BFOz7SaY+02SxOe15P7HRFxwqiI5jbc
         A98ju7CGrhO5sjtqz5WD4S39p0YAGUbY9Jmkz1ktm6JkS73722Kl1fVLO+Cwqo27w/Xs
         uTb41zoDASCSpj9NUq9nEnAeEjmY6gBAjaVnCYHZfLbvkKkSo/Ou5iCT45XEU8EaOxdS
         HBSr89UzW4VN3yBJswwbJNz+eFc8GCr5PXfnAjtiQN+oYn43wg+gtISFUaf4OsojnuC3
         E5ScC+YXHqEdFPa0/oeKLiev0J3X5qFJTD2scQSbzo48i/vsInBkpLO4OroTopwNzCGG
         /o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148186; x=1743752986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w43rttHxTt8yAi6uWl0TBMLcdEuCqMNaaQ2SAAZG3X4=;
        b=CfxicDkJiaTG+DSuLCf+liAD83TrCdeQBxje9u1O1iOo/yNSxcQzNHlWaxm78cHhPg
         RiEWgyxHRgmCQTcqZLf4foogx+iFEsUVTILejiooZgHEJJLCMqLFiZEsn1xQ6I0ZgSQs
         K4K9Fh6GsRrKtQSWm/viqP+2vWSXOMUABhXnNeQbiYGRam15ZTlu5FXxInEECBSVQGIa
         rZY0v3yt07TgKUZ1xlt95CMDJZNJopCH/5cZFPKJV4RzuN33MTnallQ+JjJ24yvs7/kt
         eDw60pgBdAZOQZSe89SFLOKcr6B404bHz3rgfxM3ssjdOQ2Ka+I+aAqSbY/4NE2ooWMh
         HK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCxXlnVSIzzKjF9hcOC+sj5AGnkKdf8Ly/oS6YlLPRIJOsj6k5ydPnZPHEzcaZ6iG7llstzCU0VE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUenGUNWjEGL38m8FUCkODmrrmDXtTaC6fbPTwH1i8pNbuTx1E
	dlQgE8CqCCIkwk7Jt9k7vnmlplBauqQ/9524WxU4A5Ci6N34a/VKLo346zyVtw==
X-Gm-Gg: ASbGncuEYxC60mT3aZkLB+Cgkf/MjynbICQJ/6sZdsP6xD7c54i2lSdpJNgGAuACP41
	dC1f3NMh37Xk9OGPwkJYROWFulAYLcsVaN8r2HWEdwR4HvqYfcHriDuoPeMyFSBNhaWAz1uuXjR
	is1qg4ggplXVTEs65ExDRN2b1RL5qdD9Gs5HWL8TzNX0IYL9ty5BTxq1kuWpo2ljYWJpMj7wdcP
	3vgAnIs69S/zgfEpuONrB+AT4dYcwVo4xheDQvPfHX8xcaw0+jhrIhJ1ZEVsN763AO8HgDp/qjT
	7OnOahsaqQ35vhetR3o8pM1RFmgSu/4v384Nn5L9ZiOAffnlCQhq2jK/W0BvgzrYCCqwLlJHjgI
	jzGIo2SFn5deIuYI120Ncb1y11gQoFQ==
X-Google-Smtp-Source: AGHT+IG8+/zf04nRczIFHrEYqpPZbBfZ2U6MNgQDn+Nnt7anEDh9Nn8p2Ki+1UtHYj/r+ZhGNatf8w==
X-Received: by 2002:a05:6000:2913:b0:391:3150:96ff with SMTP id ffacd0b85a97d-39ad17564camr4973268f8f.32.1743148186203;
        Fri, 28 Mar 2025 00:49:46 -0700 (PDT)
Message-ID: <404e86cf-740b-4613-8534-a18b3654f874@suse.com>
Date: Fri, 28 Mar 2025 08:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 18:33, Oleksii Kurochko wrote:
> BITS_PER_* values can be defined in a common way using compiler-provided macros.
> Thus, these definitions are moved to xen/config.h to reduce duplication across
> architectures.
> 
> Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
> directly from the compiler environment.
> 
> The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
> instead of a hardcoded value of 32.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -98,4 +98,14 @@
>  #define ZERO_BLOCK_PTR ((void *)-1L)
>  #endif
>  
> +#define BYTES_PER_LONG  __SIZEOF_LONG__

... I remain unconvinced that we actually need this (yet then not its sibling
for int). All uses I can spot could be replaced by sizeof(long). This (and its
sibling) would be needed only for #if uses, and there I would then wonder why
we couldn't use __SIZEOF_LONG__ directly, now that we assume its universally
available.

Jan

