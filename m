Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B478BC9EE
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717333.1119434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3u0c-0007Nk-Vi; Mon, 06 May 2024 08:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717333.1119434; Mon, 06 May 2024 08:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3u0c-0007MB-Sy; Mon, 06 May 2024 08:47:42 +0000
Received: by outflank-mailman (input) for mailman id 717333;
 Mon, 06 May 2024 08:47:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3u0b-0007M3-K9
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:47:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b34c599-0b85-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 10:47:39 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so11132855e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:47:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b17-20020a05600c4e1100b0041be3383a2fsm19105345wmq.19.2024.05.06.01.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:47:38 -0700 (PDT)
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
X-Inumbo-ID: 4b34c599-0b85-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714985259; x=1715590059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SM18yENDR0bUqzBoEPLR+Iws2RxetPS+i/++V2FfZRM=;
        b=NVnwkXK4RwsEN2alkgffIbe2jE5qefG4dz4n8W+8arsE/yeF5y4oI7AcgzvS0RQerk
         CCSR0OIr42jnawyqH5lNBKwPcpeb2VGKhRdr3VsgOqmqRGvvmF6m9142ZyDogEZa/XgT
         P/OGURiaBTb8EirS8ab9AHuwa8SLgUWKOG+h0uGmP5FMqH4XUhZcbRW2m2ynm5UJkXfm
         RLXZPLQSJ76daa5lvVvvTxJW0flLHcDg82JQW6AbiembdJ+Hja82yE+8SFIfkkxNxhq3
         C9dvql52KGpyBMGmE0X6rI2PsIV2AWszm0ryvJdQOcyTbXjQHMNFgeQb39+YF53d5VVi
         wKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714985259; x=1715590059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SM18yENDR0bUqzBoEPLR+Iws2RxetPS+i/++V2FfZRM=;
        b=Y7IdBzdI/3ygInmljCyUCk9P4TgBQ1+DNtDxYvfw/kQUT6oo5FywDBl5cOp+uET20s
         pHi8WsG7IMzLk6mt8vTOOhfZV2dyAZ3cfPOXDCGidyqdsYGeLPEra5vTac7iuFoB0xhD
         Tohu3VWVXt/XSepqRYnCVSoPzYw+c5MaOsfMNpBTyDQx9zH7jHZAbkrTsGbc2CcpxWqi
         1NMlfG/iT1G6Vbd1ormsT9rRo0SoOcpMJgVDWN9fuI8Xv3ZXhnBDs0NTdgJgXAHIGPuA
         P0PtS1rCo3OsPa1+LXQHov3xfxWjD31P0cp49ShtmcHXT943+nf/mIbad13ydDLjFajI
         /b3A==
X-Gm-Message-State: AOJu0Yyc+gqBU9mVVJxUoI3Nvv2jPC4LMUM7IzsoLn5l6h+NUWZv7Wp2
	8GpVf32wiCrDBf2kBbpFE0XYL8C42s2PGIv97TdgBIWIj4RSV2XyvdraA1aMwA==
X-Google-Smtp-Source: AGHT+IEAi8zI3a6GLf0OxXK+sowmFP5nqM6KmKxOfNk/Zenq1iOoyO7iLmPjApCEzx8ywfBHGzgt9g==
X-Received: by 2002:a05:600c:3109:b0:41b:9e4f:d2b2 with SMTP id g9-20020a05600c310900b0041b9e4fd2b2mr9924623wmo.2.1714985259029;
        Mon, 06 May 2024 01:47:39 -0700 (PDT)
Message-ID: <b892301a-0f45-4bc3-a117-b96672cc36a6@suse.com>
Date: Mon, 6 May 2024 10:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID
 constants
Content-Language: en-US
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>
 <ZjiWDMXFNmwSzAxQ@macbook>
 <1049993614.4894172.1714985159910.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <1049993614.4894172.1714985159910.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 10:45, Fonyuy-Asheri Caleb wrote:
>> From: "Roger Pau Monné" <roger.pau@citrix.com>
>> Sent: Monday, May 6, 2024 10:34:20 AM
> 
>> For basic leaves (0x000000xx) we support up to leaf 0xd (XSTATE).  It
>> doesn't mean there are no further leaves behind it, but we likely
>> still have no use for them, and hence they are not part of the policy.
>> The cpu-policy is used to store a (cpuid) policy object for guests,
>> so if the information exposed in those leaves are related to features
>> that are never exposed to guests is makes no sense to have space for
>> them.
> 
> So if I understand you well, you mean before extending this, we need to perform a study on the 
> leaves to confirm how useful they are to the guests depending on the cpu information they carry. 

It's not only question of usefulness, but of correctness. We can't blindly
expose leaves.

Jan

