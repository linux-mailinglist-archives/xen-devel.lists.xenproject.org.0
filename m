Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11F8BCA9A
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717380.1119523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uc9-0002S3-OR; Mon, 06 May 2024 09:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717380.1119523; Mon, 06 May 2024 09:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uc9-0002QE-Lh; Mon, 06 May 2024 09:26:29 +0000
Received: by outflank-mailman (input) for mailman id 717380;
 Mon, 06 May 2024 09:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3uc8-0002PT-3e
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:26:28 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5e6fe77-0b8a-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:26:25 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34eb52bfca3so1148740f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:26:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b004186f979543sm19267940wms.33.2024.05.06.02.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:26:25 -0700 (PDT)
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
X-Inumbo-ID: b5e6fe77-0b8a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714987585; x=1715592385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2f1IgiICCuXTJTyRGcHrtMI1Jc3g5GHfO3/ktl7Cb0U=;
        b=NnfjD6wGO5zenuQbRksLBy+k7Qce93PkFdMQ0dhFZbAtfgdj67xJrPij+eb1UXOQFS
         /nPr6uv7xWfVdHFSkCK36bgym3xhWlpbD8hOkDFiaiqKbn3YzrBhbxuEhErg1SCXWoeg
         KvPXrOgh2i9yuaMgQQDPGNEYNKNBJwmspmiZ6btSI7N4MsQk6jOcgvnqZ16DR9K55RVO
         70iqEdhI6bDA62TRrqQaym/8OnXxM0qLwr41F0+BaHbZ6FsZsgMJ4Sd7bFOn4i52S3u+
         uBG3lMNs969+uTC3jWK0BYgwzY5FbCkGj9cg771LcyjT95cXWbeYHg/Bmv6TUFDktt+j
         Klkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987585; x=1715592385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2f1IgiICCuXTJTyRGcHrtMI1Jc3g5GHfO3/ktl7Cb0U=;
        b=Dx5n/7hnJR0ipHc5OJrHaX2sktNvEuyxkEzlVsfL4t9iKVI1z66oErGoeffRsjeYdN
         goG/XKeixQc+r/RRlZErtar1VcUupRi336oppbV1cYpkkwk5eecZi42NdfUypZNI/eBW
         Hi7D14okNR6i9A7WnJaQjX086mks3Bgtg+5WLegFiE4pN69oPZGFCGKZCvJyLjMBTHIH
         EQtvPgJtiUKu6/ha/pk+xVODmcqY2ocn1dRRUn9CShkmEr0wydJVLDL2Mbr00OPK4dv+
         iVhkl+yQ2ohf9eeO44RUHWGxPARaVXYbgiTEMeDDsfKNFZjzsyOwBsuVjBjAHzDTPjvz
         AGfA==
X-Gm-Message-State: AOJu0YyS4vAK/iFf8/ds+9yMj3TLP52SskmKeGDXCHWTu3NgnNPelSXB
	Gi2qPR4BUfCD5FEupLt/dYpCanq0qr0e1mfvGElYLDgQQUsS2aN98vqqgqo41A==
X-Google-Smtp-Source: AGHT+IFm2ui+kxSjbcy0zlfAfFGpR3j9IuhtqqHBe9w7/1HXb1U9Smk20ubMyI3jwiO1gHp6GccaYw==
X-Received: by 2002:a5d:4903:0:b0:34a:beb3:f6dc with SMTP id x3-20020a5d4903000000b0034abeb3f6dcmr9544930wrq.2.1714987585385;
        Mon, 06 May 2024 02:26:25 -0700 (PDT)
Message-ID: <08354db7-92ef-45ee-81a9-7162f770194e@suse.com>
Date: Mon, 6 May 2024 11:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform: correct #undef in compat checking
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <92e5df23-0bdf-42d4-9ab0-c668110174f0@suse.com>
 <Zjihaq9OIprv9EfN@macbook>
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
In-Reply-To: <Zjihaq9OIprv9EfN@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 11:22, Roger Pau Monné wrote:
> On Mon, May 06, 2024 at 11:06:07AM +0200, Jan Beulich wrote:
>> A stray 'p' was there, rendering the #undef ineffectual.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> No Fixes tag?

I didn't think it was worthwhile digging out the offending commit, as
there's no real bug here. Assuming that a colliding identifier might be
introduced elsewhere seems pretty far fetched to me. And Misra, which
might have something to say here, would want us to avoid #undef
altogether, iirc.

Jan

