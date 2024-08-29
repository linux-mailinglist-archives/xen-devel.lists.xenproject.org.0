Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2C964838
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785929.1195475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjg6e-0003ST-5u; Thu, 29 Aug 2024 14:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785929.1195475; Thu, 29 Aug 2024 14:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjg6e-0003QA-2o; Thu, 29 Aug 2024 14:26:36 +0000
Received: by outflank-mailman (input) for mailman id 785929;
 Thu, 29 Aug 2024 14:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjg6c-0003Q4-Uf
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:26:34 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1329753-6612-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 16:26:34 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5bec87ececeso790593a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7cfdasm768979a12.58.2024.08.29.07.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:26:33 -0700 (PDT)
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
X-Inumbo-ID: b1329753-6612-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724941593; x=1725546393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NtyUbmcf+TaZt4jF4n1fZqLl9i9eG/bJ7xH4Jvx94HA=;
        b=RiB3sKZngcPR7M1HdcyXqDPYbcLT6W1CppIWRHcF7WAgRDmkMvptYjmV0AcE3mzhfK
         PqpJhFHYDX1+pRMaLkxuRNJa0F/iefV8b+4SXa+mZzadUV2egBkTu8A5syTIjS1TvcqU
         piU238J9+FBm3RMnhsNK78L+aimUyHCOhosugomdThNq8Fi7iwN8f58SEG9uEVNVXD5x
         MwaTNXpGRVP/59xOb5W9hOB9vi5O8E8GYfjuSvHSrwSNqIXlwGgcg6FJVoH1HKS23jnW
         L1MtjMQbikFja+LYmpUTp1BYRX2mVQVEpfjuBDmCexE4HRFxnZAPMzyP85UivLwhJACs
         68OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724941593; x=1725546393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtyUbmcf+TaZt4jF4n1fZqLl9i9eG/bJ7xH4Jvx94HA=;
        b=icFwkHOUv8WUnrFMZONf8Xc8VEZwiIACyiOxXxl3WV5s6Pf5wAyXTLirtKNrHsYMUd
         PQV4nRbc0nRZzyZ2xgGoyPowYlzvTknr8Rd2EPpAD9B3uA8P8tJjijQ3fybYScnoSUWk
         fbuf/hsQWzncmBHKLHN+Hs10Uh52H6B45HelqFxvhPv27aDY5q0JiH2g4key1lEYO7D+
         0atg1dVURYjzwm2CYYi9NqeRvQcBKYozecSquVJxHiJy4YDJhE2k8GevFWY/y9MYjHeD
         KLJRdKGLrXWqHikDgI3x18OwUOfzvHyPMWoVq2QoEkt5CSavXOiu/GPegIwWcYs5KqNs
         Xc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3GcsKCecrhoGXoTVA3pZuYQ9yg/B+WI5R5qYT6OL14649ryUddqhAY135qxNlaxP9sAgEsrmybQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwotMq3Jw1f2tbbdiYD58p/hzaNEotlfNRt4ujTtI+AbEv28UbW
	WsIwjC4BJsa684QYPp4EGWrf+nRytL8WNGRx/75J3wwaK05fD0VyDGwD0nQXFw==
X-Google-Smtp-Source: AGHT+IEjsECHk0l+GNxCaulIUZh+3PejoqfbJof12GRRpchY3qJlf6vhQbWWtm6wC5CjPlkMYf4KPw==
X-Received: by 2002:a17:907:7e9a:b0:a86:8524:2558 with SMTP id a640c23a62f3a-a897f7895d4mr306151566b.12.1724941593338;
        Thu, 29 Aug 2024 07:26:33 -0700 (PDT)
Message-ID: <ed4265dc-b9a7-4c0c-8587-5b2fe2b90c5b@suse.com>
Date: Thu, 29 Aug 2024 16:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/bitops: Implement hweight64() in terms of
 hweight{l,32}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -331,6 +331,14 @@ static always_inline attr_const unsigned int hweight32(uint32_t x)
>      return hweightl(x);
>  }
>  
> +static always_inline attr_const unsigned int hweight64(uint64_t x)

Same remark here as for the previous patch.

> +{
> +    if ( BITS_PER_LONG == 64 )

This can be >=, can't it?

With the adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Without:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

