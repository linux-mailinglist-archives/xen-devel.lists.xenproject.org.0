Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB05873585
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689070.1074013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpN1-0005tM-VP; Wed, 06 Mar 2024 11:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689070.1074013; Wed, 06 Mar 2024 11:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpN1-0005ro-Re; Wed, 06 Mar 2024 11:23:35 +0000
Received: by outflank-mailman (input) for mailman id 689070;
 Wed, 06 Mar 2024 11:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhpN1-0005ri-AG
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:23:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f804ad58-dbab-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:23:34 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56682b85220so10672608a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:23:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v19-20020aa7dbd3000000b0056761c83bdesm2891297edt.93.2024.03.06.03.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 03:23:33 -0800 (PST)
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
X-Inumbo-ID: f804ad58-dbab-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709724214; x=1710329014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdPVuAV/bnXM4zPS4UOW1zskdaUODxvqiUt5UKkCVJw=;
        b=DG343bFdoMhogQcIgDGSdGfy1q+4hbRiQATmdcd5QxbIPx+7QimUJ4iQ8bMKS8Z8w1
         XeR8NVMme0T/pfCnxGDybn3CmGL/vFPymbq8Zcn/5f9k0U5fEgkr8Tp+SRBtWUEeAqC+
         0Kv0KZPAid4Zhf9eR21rDgiiRF+WNLdPPATN5k5jOEz4ezAWZ+umcTlkTtxmp+N1sUjy
         WsGNfyJwqFe3GTPWkYLKVrc1UlJG7yD0kdJvedJ3Pt3T+EL0by8dBwqKjFkqHFY0EoK6
         qaafOMx+Ukxcnn9NEW/0biFIcH3KphUxfVjZu07Nrq9tI7eR8rt8M7VCo43v8LYPksx9
         4dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709724214; x=1710329014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdPVuAV/bnXM4zPS4UOW1zskdaUODxvqiUt5UKkCVJw=;
        b=JNXcsf6ka19AJnYn1sS0YgwTl6fRbZI1scOEi3rbf0VK3av3tt43TqT/jMWBUOd8lA
         IBDPE8jqXkCX5D5vsVlLRtrb7yLLqc/AkVbBtCnGxLg4u50rSa5Zq+Pg6lh2ekFGxdnF
         /3cJ5RltIQrX1z9g1586bYggs4qgCkQua+yPcg8ymJBAFJ89alk2bBvHY/tB1CEO8HW4
         PA+LDStvBkT+eq/jcEAzjv0rLi+632+0fojTpL/gKseSToj2z4bhmqQMrRKQQuLk2E+c
         o1yt3Nl4tmDKGqpQXDBnkpKrPo+neQWTFKgex+b9dBhl2IEw5++beJr3B+u/hC4Jy1B3
         nnmA==
X-Forwarded-Encrypted: i=1; AJvYcCWfE2lGTgpaMIFpR3YPY1mEAuPf+IGZ3dDuufpmDF0oe9qzPTvnXf1xV+ZIhHESlPdb2Elh2zKPRMsAr/xU73DlQ2NVFHnY4/SbTOsYkF0=
X-Gm-Message-State: AOJu0YwJzoqCNxTrw61mfMa3e6WXcL1K1OcektEl9tOmfx6vOOu84OA6
	J+rdGbOJVO6adVqbTJ4papjQjbLL+BMHKyXkf7zyS3sEwKxCO4BHLV1UYawdyQ==
X-Google-Smtp-Source: AGHT+IHfolM8TWg8b9BATTlJNhOWWx/VDw+QDtXGfY2NcezgTx662VcxdzeSCQFIRZtcRa3t+HVD6Q==
X-Received: by 2002:a50:cc4d:0:b0:566:418d:7ba9 with SMTP id n13-20020a50cc4d000000b00566418d7ba9mr9185606edi.1.1709724213743;
        Wed, 06 Mar 2024 03:23:33 -0800 (PST)
Message-ID: <56270f54-d86d-4849-9964-ae94318215b8@suse.com>
Date: Wed, 6 Mar 2024 12:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add an entry for tools/9pfsd
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240306111631.1696-1-jgross@suse.com>
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
In-Reply-To: <20240306111631.1696-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2024 12:16, Juergen Gross wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -206,6 +206,12 @@ Maintainers List (try to look for most precise areas first)
>  
>  		-----------------------------------
>  
> +9PFSD
> +M:	Juergen Gross <jgross@suse.com>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
> +S:	Supported
> +F:	tools/9pfsd

This wants a trailing slash. Can pretty certainly be taken care of while
committing.

Jan

