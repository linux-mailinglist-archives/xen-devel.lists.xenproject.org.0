Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A0CB2412
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182581.1505445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEkc-0001F0-NC; Wed, 10 Dec 2025 07:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182581.1505445; Wed, 10 Dec 2025 07:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEkc-0001DU-K7; Wed, 10 Dec 2025 07:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1182581;
 Wed, 10 Dec 2025 07:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEkb-0001DO-An
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:36:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f726fa45-d59a-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 08:36:39 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so72516305e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:36:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee66sm35676864f8f.11.2025.12.09.23.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:36:38 -0800 (PST)
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
X-Inumbo-ID: f726fa45-d59a-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765352199; x=1765956999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=go6ZHJrR9BM+SUNWAakTKe+S6zWt84zweh1afgbX1Y8=;
        b=UMWyUModvJW4tZ7k+roDh/QbML1DuDclnsg8VMKpYh1JQorbgEpzTM5lEam4CaLzwQ
         Ga727Xwsxpoz7iQRA2/7d+enAHgYEaZH+8DxrUv0whRXbSW6P8XK6JAS6iROsYQd11nA
         5mO2kmBXmF0h7kr9dDpi2GsNAK3MC3cXZiSGmL0PNJs9c7KiHPmVHMjm2ZF3DbbHxOny
         KRmyqFhDamZheT3xDVP+B7OdBkSMJPyDbYv/pfRJbYvut9bwipUdqmzyuKTUHUD3Bg+f
         5qAbnGBUQQhEsdAHnmKuQJOTGvYEaBndKEcu7RRfjtRnpmPPRrognuGw8FmyQR9VpR58
         lk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765352199; x=1765956999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go6ZHJrR9BM+SUNWAakTKe+S6zWt84zweh1afgbX1Y8=;
        b=Ok1W6jWQWw/5GtHTzK6U7w9Ta/kMpmvBX3+fnq9JmDMlMlhw5JJS+CU7vMh/B6sQJj
         EKqX0tN0dWiAv5DvIwlHbw1jgMb54sjViFcjhJwbWUe3KKa9ysI88LxyXb5t4wH58owW
         K4eZ+nsupSXs+OhU/cumVJYKm5icyrlPNvhk7b3A351DVlhy/aJNiPBssyGARkJiRVWC
         i3CUiuNayucY+TbRQNbDvslVPincy9wY7cmVUJWDl6r8MOeBIgvkxEnT4QKPuBCeiadC
         UX2zF7svQVzpm3C9EVgMVP3a7Dg3sOdwjEswoi8781jb92PXa2bifN9Mwb4aMPtpjlVx
         K+3Q==
X-Gm-Message-State: AOJu0Yyu9Sv/GcaZmVROejG2vKeVzXzCQ0+qFodk/dpZ9eCC94OAO0M+
	3P+AFL7RSfaU8oBjfDJcFmdGUNZmkd8F0AfBgORgYS9GXFOddpThRAMbWJ2N2Hy6kg==
X-Gm-Gg: AY/fxX4PlKX+53GUvs9+gcCsjEBeTHSNCG3J4Cx2lxm1OU8BetCC1XUmGaaT2xoUK9Y
	yNK8LGFA1a0048jkHx9ib7hb+fQLka7F52LWf13o0lNmXAHpPiuD2GIWGxIVreLuCSHA2K1sIne
	jPY6sLdaoAQ2mll1bmhWikK9VaVonAJr/UeDWZqiTAfmrEsjA8qnAYD1VbmKZjJN+Sgn2jU7YEp
	S3TlvCdTjiYOgVb4Dl4ilROtCBs/cqUNBcWsm6zWrLPh6kjPm+GcNGSZ+bImlZ4J5Q7tEsJO/pw
	xMmP+d49yA356pi2SDctM0qWnYb+/EOLqs1SpUGL2FrBkMy/pql0DIuMVtKLf0cJTcN/p44dBTb
	0QPiIOE0CLzBQHHlZtz3QLO7M3jarjn0fFmhqUBBi1a/MbY1kSW1l84NuGoLso7evjeWfH/VPZl
	4uzERi2J79DlTej9K7RAbBIHmzXiZyflVse1lYeKZnHNHDG1AslL6WQ+lFITythWEH8Ttuzj3BT
	mc=
X-Google-Smtp-Source: AGHT+IGiDoOpBqwDnEOB0JZCJbkuacc58dsm1orF+paDCoXD9sTkKfrJsTU05YSZjCzSr2DsUjeLjw==
X-Received: by 2002:a5d:5f50:0:b0:427:6a3:e72f with SMTP id ffacd0b85a97d-42fa3af8c1dmr1086727f8f.34.1765352199159;
        Tue, 09 Dec 2025 23:36:39 -0800 (PST)
Message-ID: <f5a7536b-32e5-44d9-b087-556559650fd8@suse.com>
Date: Wed, 10 Dec 2025 08:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: introduce DOMID_ANY
To: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250924030630.122229-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2512091704020.19429@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2512091704020.19429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2025 02:04, Stefano Stabellini wrote:
> On Tue, 23 Sep 2025, dmukhin@xen.org wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
>> of the code.
>>
>> Update all relevant domid_alloc() call sites.
>>
>> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The other day concern was voiced over aliasing DOMID_ANY with DOMID_INVALID.
I don't recall though who it was or where.

Jan

