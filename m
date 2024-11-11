Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD519C3ADE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833434.1248584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQjc-00020g-Jj; Mon, 11 Nov 2024 09:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833434.1248584; Mon, 11 Nov 2024 09:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQjc-0001xO-Gy; Mon, 11 Nov 2024 09:29:24 +0000
Received: by outflank-mailman (input) for mailman id 833434;
 Mon, 11 Nov 2024 09:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQja-0001xI-S4
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:29:22 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de88ccd-a00f-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 10:29:20 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so2786274f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:29:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970729sm12358151f8f.15.2024.11.11.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:29:19 -0800 (PST)
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
X-Inumbo-ID: 6de88ccd-a00f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkZTg4Y2NkLWEwMGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE3MzYwLjM3MTg4Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731317359; x=1731922159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi6YOGGHaSJ68ELlxR6Pnu4bytUl+QM5euAZv/m6ARo=;
        b=JRQ9k+nW3LfnHTlU/M2+fLgKROffKcaZ+iYlR5GDUtxd7JWFt/bCWZwMkewcahbtms
         xbpDtnWcP2T/OK1aYVE9N5R9AzklayOviKsK0YCJfNByRww7UJD0T/sgCv8xB0ACIGBq
         lx4QCprLMoMfswUBAoH/872rxznhhMe2MlZgjP7v5LFbAaxEBkSAyD3hTqSplZI8xAmU
         NGqhkSMyXGsN2//YFHsPMijEJon/9lfwAFL9wduVHF08FV0NdINCh6MNNZlmiOEdOh2F
         NL9DOIfzIu2jlisoqVnagpYeJ1UVZ+IRRxK1Br8ozvGupvsIolBCwKipkT14xFBD46Zo
         TC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317359; x=1731922159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi6YOGGHaSJ68ELlxR6Pnu4bytUl+QM5euAZv/m6ARo=;
        b=nMwOyTnCXdpKf8zBzl81qL10GzqfH7JzDdMvL1ecdWdcmrEMbXVionNvIbEfCG627/
         YkT1fKSXJ2iOkatRMBSlH7xSNeSmSdx5RgtwWo5BDVWBVn2q3KvyUEKzKfhGFqfWBC5B
         dxOPr+DIrMGCIrb8uPxSKnrtuFQnmTRpTcX/qIQTOUPpKME4TDARlJmxjyTmDozP6Skp
         dzEOr5H++pQPS4lUe10BQlExE2Bmo241HyfA1SA2Z6owUJrMmHcC8Ah9bMr9rDDpcCLk
         2hjFnjTNaPERholKLjln3EfmbB3QTmjLNSRv3tr/yGtX7Y131AIWgazxN8Ec0Pr+V7YK
         YuQw==
X-Forwarded-Encrypted: i=1; AJvYcCVeiWgddhof0gY32j6gcuZFylcew6j/S/6jiZI9iSpBh2gwzypuLM6S6foPd2BTbWwwXhx2biocSmo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFdc/vmlKWBoHZG3daL5rCTnXQp5ycux1/A/VGU37KY4BD1b7M
	2vWaQPsDhQqkkEmk7xGdG7fT9KpqcjRsnVsUhwcbChBLWEyrDIJSgGYK2J96rQ==
X-Google-Smtp-Source: AGHT+IFafj4yFrcvLIhVS6BJ2ac+sWY9dptO9VVSLg80Gd98ofRjhXR276sag2inkAe1zGj8H7cURQ==
X-Received: by 2002:a05:6000:2d11:b0:37d:4e03:ff8e with SMTP id ffacd0b85a97d-381f1823a63mr7273787f8f.28.1731317359559;
        Mon, 11 Nov 2024 01:29:19 -0800 (PST)
Message-ID: <05cf7373-453b-4aab-ae41-b8c85cf0c9fa@suse.com>
Date: Mon, 11 Nov 2024 10:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/wakeup: Fix code generation for bogus_saved_magic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241109003654.884288-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241109003654.884288-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.11.2024 01:36, Andrew Cooper wrote:
> bogus_saved_magic() is in a .code64 section but invokved in 32bit mode.  This
> causes a real encoding difference.
> 
> Before:
>   66 c7 04 25 14 80 0b 00 53 0e    movw   $0xe53,0xb8014(,%eiz,1)
> 
> After:
>   66 c7 05 14 80 0b 00 53 0e       movw   $0xe53,0xb8014
> 
> The differnce happens to be benign, but move the logic back into a .code32 for
> sanity sake.  Annotate it with ELF metadata while doing so.
> 
> Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



