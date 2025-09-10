Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B37B5182F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118289.1464130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwL71-000896-PO; Wed, 10 Sep 2025 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118289.1464130; Wed, 10 Sep 2025 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwL71-000877-LL; Wed, 10 Sep 2025 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1118289;
 Wed, 10 Sep 2025 13:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwL70-00085n-R8
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:43:50 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7444f4-8e4c-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 15:43:43 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-625e1dfc43dso7409961a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:43:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078346526fsm162617066b.109.2025.09.10.06.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:43:42 -0700 (PDT)
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
X-Inumbo-ID: 2a7444f4-8e4c-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757511822; x=1758116622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vbwMiLvCK9iCoMikXzhNk8c+qVgPMbmENZwXNlWUKN8=;
        b=CrYXY6DoKUJBAXu0JlXOlTVE2sFTdhna2IdRSr2pOE8SWrE91C31ahloy19zJoziLS
         4oPFwXlM5gfZ5w8kGUDZhUWZMhG6caiZYlHU9oQ5OVd2y83b7BxAk7wDdNqdKR9h0cKi
         vV/pQ4P+HPlKh4BAxElivqzQ5DXMZF+tL8CKEJRdgZ9K/74VD2owNeT5Hh1q/SvBqXbL
         vWsqFYFYbG3Eoyl0JRi8hkqCCdPQO7wT5mSH0ck/EmEfcGQsKzH2i95X3dEE1wHW2leI
         BRK/dTxZ1vjGZz2yWiVbaOsW8p97544lRuKrLj172JWoU1gHwwEkZ/9E2R+dwhMmfefA
         8Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511822; x=1758116622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbwMiLvCK9iCoMikXzhNk8c+qVgPMbmENZwXNlWUKN8=;
        b=IvLYfHaqQ9sq/FLRpHmrK91DMGgHluP3KcDy64rUtwYA3wFjOK0VmSI5t55GZK0kQy
         9wfRJR5+IjFR3Z3sBHvU4j1doRI8RVfYkbgcx3uIM0jiBicG9EP//9tALx3I51Ur/wy4
         qvGel5MXdIc8D8W+bCdktL7T1rMEmhGPkNYRsCAip0iUqxmcfjKNaH0yV5iKK4BrIniB
         XYNmYEq6wXHnh0rzbUqwi1i9sOkyI55oHzUrK9MYs60iltVG8b1ZO4rxubfdzPr6vkMa
         gTN3M38m2rBlzAsO9IPdD3eAglUwADbJwyagQnbawQ8+fOBqOZXginiy+9A/+qfH8//d
         sf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT6Fnsle5UZL8+/Tk1vrjFuBzUoIho5bmBaNXAKahCjtRJ1lGak/E1xkW8ldzl7eRPC//pNOeAijI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk5Ksu3Ts7TpN2pTIeAFiJ0pR/YHcnysA+DNHp4HTovUJNmRvn
	PJEa+flqHsY28qKIw3gW3Ege36iWfDymwJHggfi2HxFZ4r7jJrtLTb29OSIqoxmtDA==
X-Gm-Gg: ASbGncvYxiAtn77R1+7zkdNYZwlj0qmuJZZVMh+pnULKJHzP1cky9TIU1SfxP0P0Y2t
	hXLbWAv1NS1yA8eIiUjGE49CizbncDZk5GaUqiQL5dc4kih4mD+Wv8U7t5LSlup6qzmVxRIOfnB
	qAuGdNykmJrGP/V1R8sP21wof41R9d5ZAUI2JzNSYn4K2Ot/MdHrLt6nY3d54/rPmJRXyR5trNk
	9FUYbP0W5ExkSfMxNN+4Z9UsHYnTz8Rir2/XFByemCV7pbsqHlhd7cSRsAJ7pS9xGxoYy9Kd8lE
	OqCYNgVpR6JKOAx5GdePAt4Fy/67zaZmwES+uYGwGbmlw09YVf0gBJ3mponfyrVZC73KwCnpZ/0
	MWfd94W58CTbI3DP2owwaUG8LcjxCD7N8w/I1lNUz+w7+chfOTk9Ae+4bQJhE5Hr+nzKfw0Scn3
	iugvn9emQsliEVvRdo/w==
X-Google-Smtp-Source: AGHT+IENTcR0ugA8owAojjjzpCJeEJjokdSTdokjtEuHsOcKeyTXZYGl91Kf+hnA08d3UZkaRA2P6g==
X-Received: by 2002:a17:906:7304:b0:b04:5b3d:c31f with SMTP id a640c23a62f3a-b04b1698bbbmr1416843266b.49.1757511822458;
        Wed, 10 Sep 2025 06:43:42 -0700 (PDT)
Message-ID: <5d639a3a-6f15-4d78-8f41-47a4f66820a5@suse.com>
Date: Wed, 10 Sep 2025 15:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-27-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-27-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Wrap domctl hypercall def and domctl.o with CONFIG_MGMT_HYPERCALLS,
> and remove all #ifdef CONFIG_MGMT_HYPERCALLS wrappings in common/domctl.c
> With MGMT_HYPERCALLS=n, we need to provide stub for
> domctl_lock_{acquire,release}(), as it may be invoked by hvm_set_param().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - remove stub in common/domctl.c
> - combine the original commit of "xen/domctl: provide stub for
>  domctl_lock_{acquire,release}"
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> ---
>  xen/common/Kconfig           |  2 +-
>  xen/common/Makefile          |  2 +-
>  xen/common/domctl.c          | 24 ------------------------
>  xen/include/hypercall-defs.c |  4 +++-
>  xen/include/xen/domain.h     |  9 +++++++++
>  5 files changed, 14 insertions(+), 27 deletions(-)

Please see all the removals of #ifdef-s below for why I was arguing towards
the Kconfig control wanting to (re)gain its prompt last. These #ifdef-s will
have been added by earlier patches in the series (which I didn't look at
yet), and that kind of churn could have been avoided.

Jan

