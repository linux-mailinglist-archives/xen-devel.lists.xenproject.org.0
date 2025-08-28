Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36BCB39CD0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098640.1452645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbaj-0002uh-6m; Thu, 28 Aug 2025 12:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098640.1452645; Thu, 28 Aug 2025 12:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbaj-0002tD-42; Thu, 28 Aug 2025 12:18:57 +0000
Received: by outflank-mailman (input) for mailman id 1098640;
 Thu, 28 Aug 2025 12:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbai-0002sx-2I
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:18:56 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a8c9730-8409-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:18:55 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso1382025a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:18:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cbabf816dsm2846910a12.21.2025.08.28.05.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:18:54 -0700 (PDT)
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
X-Inumbo-ID: 2a8c9730-8409-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756383535; x=1756988335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5/IgVI9LIXTuqwP0pjMkgoXDdOYNSaGQGfB3D+ISpG4=;
        b=WQE1gUactPwCLCFD9yb4yofyxCSme+M+YfLpMeHc8q2F31ax5dQwND7UwrxaMigXgz
         amWbfsGzsyCq2vRgT2hbwUx3R6lh4CrY3A4kPgoF6cNgNdyX2LYzcg1ar0RItZymNXRK
         iMTVotleNKce7W0eTYK3tjuhmlZEG12f7nxMUbjVFgtO05BomYX4VmXfuUWqanOxesFB
         iwYV5qMABCQvRstOeLvbi1HQpLlL6Olfgeip6z7puL9ajjKwKgOAnZeypsoKZ3gyh0cw
         JZlrroBAw3jj0r0DDnOIAuBStBY7DdVZBbqtslL3I9NeIqWD3S8kp29xTcsJ6UQJvJwg
         Tobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383535; x=1756988335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/IgVI9LIXTuqwP0pjMkgoXDdOYNSaGQGfB3D+ISpG4=;
        b=TjsOICR0KTspfAEvN6Smq4/xHD5NJZixFgEhv07Z1bNIIQz9Ys/dBnnRwdKRtwp939
         yOkF+uWBGfDfM8lJV4Jgjcz5bTzkUDcxh7q88uKm0AuBJEqv+W9dHhEevsD7HNxFwEw+
         hS3E0EsgJxPV1DM2XWlZK7Jol32y9MIqDW9+UIyLxNeXfxt13EKVgtjo4pnuzJl4shTC
         +J5NQNWgtvZtqhCipvI4QQJGNIMaAe3SKTjUY2kaMtpDSK7RqOBpTMqXsd4khQhF8E8j
         EaBv3uHsWGe+C3X4O3af6yi57eAWTwRWL9I4qEcIGMVfWZgnHPFfdcsCKyA4PH5kRFbX
         2TuA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ga4iNOxZ9HYVgCsQJSb+MBHy2Iq90bnPwZnwMsqO2VedxJdYBi0vUEgSGDP5XpUvCKFbfm5HXdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGugRZGyABA64iXixgARlSv9rEy3WNInOcQSocuf5b7B16XVqP
	3SzKJ/BU0QN1jBz0+tFLkVlBlsXMDIVkd6JV7AhCal4+wtDF5RXAOG4G8GhFEgdFfw==
X-Gm-Gg: ASbGncu3+Zm56YVWs96yeI2cBwEcOjuy1f2Jjl51BHbdgHktlUebNsoWVSScLvD4Gau
	BuiMyas1Dz/JIT4H3YMzl3qyse1oGMOmzcTLK1VdttR+DiE8eYoMbs1rpFCepvFO/uy/KuaObsG
	X8YwmGlO8oWJ/SlEReh+XZXaQpnysCEB5MnXfYVjlnAnF/C3R575cDKF0rNKnfezQjQi9cx0zCP
	UFtDTjRO2KWOYYNrdT+uznug0+5WIT/6EnH2phsSI4CfGzwXgR6A9vf0PieO623jpcSns92kSPu
	CZ2h9vABrPsW4qUpcT+2/2VVf36jsZiu2oypq7L78olCnz3hvkKEEyVkG4tL+wiaxuTp9T0ZeSn
	5zKdbHBPIlYi1XI51AUV+OrPnRoOomGXcuNPZQCwwTYNgFzMKOI90B93D2vOinxEVNJPkvsrsVH
	WpLnXza5TxmA1tWk2PLQ==
X-Google-Smtp-Source: AGHT+IHJW0YcvbMS3ZjUUSmcnQX1eEVseNdd8tXdVSlhMaOjAYHhXPGEpo+eSyFg2OgYFi9YEBt5DA==
X-Received: by 2002:a05:6402:358a:b0:61c:6fb9:c83d with SMTP id 4fb4d7f45d1cf-61c6fb9d0c6mr10762379a12.7.1756383534649;
        Thu, 28 Aug 2025 05:18:54 -0700 (PDT)
Message-ID: <0354ddce-6607-4921-bb16-809322f3792f@suse.com>
Date: Thu, 28 Aug 2025 14:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/9] common: Isolate XENVER_get_features into a
 separate function
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <0bbc0f2df1853bb60f4e93c55d1a0953c6a72496.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <0bbc0f2df1853bb60f4e93c55d1a0953c6a72496.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> Make do_xen_version more readable by moving the main XENVER_get_features
> into a separate function.

I can't spot much of a readability gain, to be honest.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -569,6 +569,50 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return sz;
>  }
>  
> +static long xenver_get_features(struct domain *d, uint32_t submap_idx, uint32_t *submap)

Why "long", when you only return "int" -errno values?

Speaking of "long", why such long a line?

Jan

