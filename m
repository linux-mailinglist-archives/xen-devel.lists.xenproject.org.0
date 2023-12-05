Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A818056C6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647919.1011673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW5L-0004bo-Lv; Tue, 05 Dec 2023 14:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647919.1011673; Tue, 05 Dec 2023 14:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW5L-0004ZX-J3; Tue, 05 Dec 2023 14:07:39 +0000
Received: by outflank-mailman (input) for mailman id 647919;
 Tue, 05 Dec 2023 14:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAW5K-0004ZR-50
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:07:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4bd64c5-9377-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:07:37 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40bd5ea84d6so19487625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:07:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d4e85000000b0033333bee379sm11152615wru.107.2023.12.05.06.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:07:34 -0800 (PST)
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
X-Inumbo-ID: a4bd64c5-9377-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701785256; x=1702390056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EusjO1/skqkVA1DYhsgZo/RGjdoUKYpfCbONqIYTX3E=;
        b=HDrU/buroeuIrE0bBXeRH6Lv9cYmtKv2ONhZwbRPQal3M+znTBhSA8nByJ4iGQCJvy
         M2msJjbdS3MrNeQUFE3L37UOfmTdnzVUXhRKM9J5evuSbvHC3ccP/3nJck312ZGh8t1U
         kite7dcLTj8MXrd8nGBqIrGj+1A9LvW2SfJn6Ex1ge6eeWlTBJk7BaoB3b+wuhJP4fFb
         QH6yANjX4bihx8LjokNvvp7qV72cJ0gJXE+SxT4Tcg+uvpBE+zkLV7pRiBkiLGFbJsD1
         O30M6gZUk8cpY0ACtej24Agbw6B5j0QnEWkeBWDYrn9SejuZVvvtGBqJQxTG/sxziLBD
         aADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785256; x=1702390056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EusjO1/skqkVA1DYhsgZo/RGjdoUKYpfCbONqIYTX3E=;
        b=Ns7BJMsPPu/wGMUumUwPdIyuR5c5dbA9A5KCn9+HTRjMUhNAB2bbHeedlVe4QLpaYm
         aFkR9dQ4JunOg/agdeqmZlfeZVSiEp1Uskpeazhdc9L77lzkq9yA7As4im80jrnv9gRh
         yCavmjKNCR0gR/DPpyGfDCR2VqyJApoBUq250tmTiDKIAEI+tlKH4a7WbGMtBHE0s2gA
         D7PD08vdpQVJ4/gK8W1J06Q9x0/HB74KEexvue+pZJwIEEgfz63OrzUKJVnH7Pyaxbj2
         J0HykrDotLYvENl0vX08Th//T/SdqNwRBkZ9MDZzKlUdeISbfLnS+6wnAWPkdf03vnl/
         YlrA==
X-Gm-Message-State: AOJu0Yz03rVsvfaKD5Vw/QovgsYItdc+4+hZNR7p4ziJ9MW2ffTC44Xq
	GyeJc7TbW47ovbyrTjPWXmZw
X-Google-Smtp-Source: AGHT+IE75w9PCBkiNGidPmirrIk2RL0JlO5SKPV4pPAgabLNiDM3YXVX+02Oi/8Ggc+dvRdfhJe+Pg==
X-Received: by 2002:a05:600c:b47:b0:40b:5e4a:2353 with SMTP id k7-20020a05600c0b4700b0040b5e4a2353mr614692wmr.85.1701785256597;
        Tue, 05 Dec 2023 06:07:36 -0800 (PST)
Message-ID: <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
Date: Tue, 5 Dec 2023 15:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
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
In-Reply-To: <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 14:46, Luca Fancellu wrote:
> In my opinion, I don’t know of any tool that can address all the flexibility the Xen codestyle allows, yet the use of automatic
> checkers would improve the review time, allow more new contributors to approach the community without being put down by
> the amount of code-style comments,

Since this argument is being repeated: I find it odd. No-one needs to even
fear any amount of style comments if they simply follow the written down
policy plus a tiny bit of common sense. According to my observation, (some)
newcomers don't even care to look at what is being said about our style.
It's not like you and I haven't been through this. When I started working
with GNU toolchain, I had to adopt to their style. When I later started to
work with Linux, I had to also adopt there. And then for Xen. And all of
that already past closed source projects I had been working on before.

Jan

> consolidate the style across the codebase.


