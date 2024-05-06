Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAD8BC975
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717301.1119364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tbM-0007jc-Ha; Mon, 06 May 2024 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717301.1119364; Mon, 06 May 2024 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tbM-0007hH-EY; Mon, 06 May 2024 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 717301;
 Mon, 06 May 2024 08:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3tbK-0007h9-Us
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:21:34 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5830ae7-0b81-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 10:21:32 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso27067431fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:21:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i15-20020adfb64f000000b0034af40b2efdsm10059143wre.108.2024.05.06.01.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:21:32 -0700 (PDT)
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
X-Inumbo-ID: a5830ae7-0b81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714983692; x=1715588492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTGGRFlH0AZmaLfikDiNRxLL7Y55HnvFSN6jh6IGiwk=;
        b=UwSE30QGHozCUSZX4sCOPVTzpITmh+SB+MWSf/WmKrI3Hwk+QHTWahPCPS/QRm36hf
         ygN7rY6NEkuPs605zNHn89HXhDXIqjQIoC7LQ4zdnl/0OviHSNFWkmsoJw0iXsnoviXD
         m8YwZQF5daChe3Y3v+pC+kw0xB60BgTefDWwRWUy/z2GE5Jv1SbN1R6LbZrKv/3/e8ti
         vlNMHsqqsHxaXuv7fF8utB27Kv0Qvu4NqcMzB9szgvyU1v6Hwybs4rw2bueYqgTPnVbO
         4p2OglYgY7VOnmSurjJYjIlEyOdeK79fZw7CNDKi7UXSmY4O6LpoFDCynW56g6UgdlpC
         ot0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983692; x=1715588492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTGGRFlH0AZmaLfikDiNRxLL7Y55HnvFSN6jh6IGiwk=;
        b=eBeiBvLLxaViYnpZvQTF4ASuy+pMHAkFCsly12XVzoQ9pdPuCCCJvlHsebOB2EKfiN
         IMWaJCTHFvoK6F45iFqMtTfzYR71OsBbJwjixKlez9eeAyJ7rLYEJ/Iey/nf0lkkkYfV
         nnFferdTbgj0F3Hqu095WBeq5pZZy+RelRX/bhEhGvIPwKLL5qG+NDd9bLoebkHwUqfI
         dFL60m9S+iX6PMJtaCBUPZ0FJwOZOqSXc7oGOdLxYmK+mGZf65vdVB0tWWWr17NdADaV
         iRsKgAWgA8UMiIiXch9yqhVPb6TmzD5InDIBAl6/nI1I5MWUbsffQz8oV85suMVRAKiQ
         q9nA==
X-Forwarded-Encrypted: i=1; AJvYcCUjocIiKtbw5H3AXERN6UdGNdzdbswk5xmFG43vpan9iM3+jsNNVgo9JqnJzA2NsdQvtMhCs+OEF+lbGEyosa5XqfD4EPd33o/jyij6te8=
X-Gm-Message-State: AOJu0YyMvDDVh8AeSXdJX1Np6Z2002idpUrLKIxLUiuYSoQwWugAOJuq
	z1aKDG+Hn6UWephE0gDIAYHfQn5E5TYfXZ6Rin87u22P2cyeZLeXLy9zgwXxg53pBer5k3wwR3E
	=
X-Google-Smtp-Source: AGHT+IE9k99HxbRquyraMmYVMixXRU4J+AVLJ+zF+y+Wjem1E4i6e+g82tl0CO6qCBjO5Gji+PaWAw==
X-Received: by 2002:a2e:f02:0:b0:2e2:9842:a9d3 with SMTP id 2-20020a2e0f02000000b002e29842a9d3mr5644533ljp.46.1714983692468;
        Mon, 06 May 2024 01:21:32 -0700 (PDT)
Message-ID: <fc0c86f5-837a-45e8-807e-6861063be85f@suse.com>
Date: Mon, 6 May 2024 10:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] x86: Use getopt to handle command line args
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-5-fouad.hilly@cloud.com>
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
In-Reply-To: <20240430124709.865183-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 14:47, Fouad Hilly wrote:
> Use getopt_long() to handle command line arguments.
> Introduce ext_err for common exit with errors.
> 
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

Nit: Neither subject nor description make clear ...

>  tools/misc/xen-ucode.c | 45 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 12 deletions(-)

... what tool is actually being touched.

Jan

