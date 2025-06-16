Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88043ADA883
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016569.1393496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3dx-00052I-77; Mon, 16 Jun 2025 06:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016569.1393496; Mon, 16 Jun 2025 06:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3dx-0004zz-4R; Mon, 16 Jun 2025 06:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1016569;
 Mon, 16 Jun 2025 06:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3dv-0004zt-9N
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:48:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ce6659-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:48:30 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-604f5691bceso8546927a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:48:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a5b6fdsm5648284a12.43.2025.06.15.23.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:48:29 -0700 (PDT)
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
X-Inumbo-ID: e9ce6659-4a7d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750056510; x=1750661310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Eqz34ir83h+BPyKXu5kxE5u5V/uMIpX5Jbo0LuRxs8=;
        b=Y/6nwRQB9J/2viXU73sWJL/xcKf8OJqqYvwJ95EhoWRRgluNw6J0cT2Ndm4yuC5Y8L
         t1q2VRCf47aNmMmZVRNPLvPf4SuiqKgUbDQoF3miy92/jfKwHw/yTie3VI4YlkeZcrX0
         BE9JH0Uh7Swc2s1ExVUn9WE938pCr2sXm2i+FcOvOlgaq44x8lkCCzg95QMrNNYqw+mF
         9QvJ8FGUcW9KP6vku2/aBa+TcBMPTsTRlnvXfqmbEWOHKLoJokft8X785RyBHTrXEaBo
         EU3aSHMQlDzjuBcjThKDf5Dh3W81nOtbFAK4++3Usc5u7bPjU14KsaGT7Cf8ilfNwPcX
         B5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056510; x=1750661310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Eqz34ir83h+BPyKXu5kxE5u5V/uMIpX5Jbo0LuRxs8=;
        b=dwISCaBZ0serWzQjcuOdk5OijcZ1xr8QWd0RAwSXkCVNKEpSzeaCT3yixgZX/LMSw6
         58FUGCTuk3nDvGZZ65vy/BNC5IpxGu/L8R4DbLSwcgpYvtjk8YLlVSQbYozduMOorDCK
         rEfQNAW0Ik/q2+CC8ma+qjtKnUkJPpv1phv+9Gk4hcu3diQlqtiWsx+ZsAiLsQrZFKOE
         qDjyttoduUNjOoZn4V+nf7EEWR0r9f5GLE3r8g9dtbVfpygFxiYwWDnLQucGLzjOqwtV
         uda14CuXUozzsW1uI0ok8OYBj34YYjzvj9DK8V2Y3sjd6rTq7qrbaXrrKvmgYLPFYTdL
         wa4w==
X-Forwarded-Encrypted: i=1; AJvYcCW9QI3gCcBoK6+LjPKb7M71ay8pocg/cWGaa3ESK9T03z/gB/lQK2b9sDpEoIpJmxnoSEVZTVeByi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+7+oxhqBvS2eY2iUArO86wlLviBNwJhRbT2t1E2tX6zLH80um
	5GISQAjqHoVmJFOn1E60UUW+t0togAy2kneVUdOm24m1IVhz1zMn6ksS+7IprXcUyw==
X-Gm-Gg: ASbGncuelT2J29vUPPkQloKdEgydwO8HWYpSLsnqxwZ8JTqBRbA93JuPkFvLmT/+4on
	jtXzxPa/4D08adTWhTRk+yr51FTtJSV9PT8DC5+UnKxsAKhNUd/IJ3jX68EU2oJ0kJHKTPnG3Hw
	0rx9qkusMOCS+0UCPLo4ovK85cA/N7aZ7VGmJVxvJoPQg33aFL/AI4xlN43UJD0tm1tc+8lmkIp
	YiKNbPrSccilXtxPhgdA4rJylE78/vl1ZFjioK1QLgsJEUHr3GEJZi4CVDnuY7G8k13D8mtxWnY
	hN3LKqd6UGgSDdTLe2KgF2RaJNp5374V0vflpLwklWxrUBLwv2RHwVQSqSEO8fVcax3gmfsAm6R
	TdygGIdWz4NtEqPXuB2obIyXyeWBCwL9mqt+iSKbTAh+2wrE=
X-Google-Smtp-Source: AGHT+IEgwZzxWAg+/xOcZxXgMaOMBfQjS/yCouKzxlecEf0qfKaS2DhinQpLv4n4rbE0lKgli3H2zg==
X-Received: by 2002:a05:6402:210b:b0:602:4405:777b with SMTP id 4fb4d7f45d1cf-608d09bb6fdmr7135068a12.24.1750056509665;
        Sun, 15 Jun 2025 23:48:29 -0700 (PDT)
Message-ID: <c0ba289c-e0cc-4ca3-84b1-4c8a263ffbe1@suse.com>
Date: Mon, 16 Jun 2025 08:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] CODING_STYLE: Custom type names must be
 snake-cased by word.
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-4-agarciav@amd.com>
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
In-Reply-To: <20250613151612.754222-4-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:13, Alejandro Vallejo wrote:
> There's the unwritten convention in x86 of splitting type names using
> underscores. Add such convention to the CODINNG_STYLE to make it
> common and less unwritten.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  CODING_STYLE | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 5644f1697f..e91ef7b3ca 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -126,6 +126,9 @@ register).
>  Especially with pointer types, whenever the pointed to object is not
>  (supposed to be) modified, qualify the pointed to type with "const".
>  
> +When defining types, split its words using underscores (e.g: prefer my_foo to
> +myfoo).

Why's this being put in the Types section? This is about identifiers, and
ought to not be limited to the names of types.

Jan

