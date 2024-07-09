Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9592B028
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755858.1164355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4O5-00011B-DT; Tue, 09 Jul 2024 06:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755858.1164355; Tue, 09 Jul 2024 06:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4O5-0000yw-Aq; Tue, 09 Jul 2024 06:31:41 +0000
Received: by outflank-mailman (input) for mailman id 755858;
 Tue, 09 Jul 2024 06:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4O4-0000yq-GL
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:31:40 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e574fe22-3dbc-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:31:38 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e9944764fso5318170e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 23:31:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a3fbf6sm8905835ad.115.2024.07.08.23.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 23:31:36 -0700 (PDT)
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
X-Inumbo-ID: e574fe22-3dbc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720506698; x=1721111498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctjoun68VmgCjTBQTj5iOOAFdO272n5VpUA4PVa6GDI=;
        b=BY+R4wp9Pe57EDkULxbeOl6hM9c0ekVGkSi4uCXHPWPrXzjQMfPvD40QLM7TXjOYua
         DSahU3fhjD9Paw2OxjlUf7Qohc5iQFuQikelicUN0YQMEO1hCbftZstXaoun4clMeeru
         ZGE76xnDAhKQ8cuZ0MPxNU0rLALnyLLpbmStYOVX9gpoWiYVQ5kAUwkJC9CiE7liKD6s
         5h2SH3q6KC5deEnCPhN+mAyCPUdHErT003+ZpPUfv6CB/6VNCiOSwbPMY1kWQfKISz0C
         4KF9Uf5rgBdqTCTEVbgbNx2VW1bXwnZUHfM9r6uRDOHKqFZBCPtayahQyZR7oAvvfMLL
         NScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720506698; x=1721111498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctjoun68VmgCjTBQTj5iOOAFdO272n5VpUA4PVa6GDI=;
        b=mG5eu0CB1oriPs01aS849m2ZU98lT9ApyNdWaslaWuuH6yd1I8VSn6CZ1zWYDQvJIq
         ds1fqZf4U/EZpJGL+vSkJBCafW/8SAWQmtKm7Kc+kGkNBE3XKJfzdqpCr0zb12+MARIg
         6ISNqp5dky93uEO/DsrS5Ec24plZypFHDwOT4E/rSzXQvdNxbWY64vPZ/zClAFbDerb9
         3bmLCFhAgs4StIJ2sBOJMSleeqBq9oT92+8c7aF0swf8Q/jZjuV1evRBP7DjmXUqGUUs
         j9bSFExOcCkN/HqjZESfspLPLsM8wXnVeqJo9xcunFQ4eFfwADwJ9PUdFwM8olm9vFAh
         D3qw==
X-Forwarded-Encrypted: i=1; AJvYcCVkLHRaNCnd8aZgemzwsbmLxu4AByIAdMzeiuAo8TpfoGC00RRd8UzWwwS18+mnDfg8a/94aJfGuK8y9Zangxvzqu6PIqcVOanIzCNKYhk=
X-Gm-Message-State: AOJu0Yzg2dqfIOQX6zyabF8EDh0sC/msLiaICEUDkR+0OOSyw9Z5m1Tl
	hmMptNEeDjpMtiE/SyBxpY7ilREOUCpY5yfwfmVoPAcHbtvCv6Dzr8gcepUazA==
X-Google-Smtp-Source: AGHT+IG7bxSzR6LPJr7zLfnr5NAaylx3cQAfiY0o419l3lxszvg+BLztAGNrNOTJ0mRiSv4lmjsYuw==
X-Received: by 2002:a05:6512:1256:b0:52e:97dd:327b with SMTP id 2adb3069b0e04-52eb9991677mr1010941e87.23.1720506696984;
        Mon, 08 Jul 2024 23:31:36 -0700 (PDT)
Message-ID: <0a661f4c-5701-4ed1-b15a-493da99e04d1@suse.com>
Date: Tue, 9 Jul 2024 08:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 0/4] CI: part 3 (improvments to PPC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 19:35, Andrew Cooper wrote:
> Here is a run with these improvements in place:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7277624801
> 
> Jan: I hope to backport this series to 4.18 so we can remove
> qemu-system-ppc64/8.1.0-ppc64 entirely.  This will simplify changes in the
> future by making the testing more consistent.

This being part 3 a relevant question would be in how far this is independent
of the earlier two parts? 

> Andrew Cooper (4):
>   CI: Fix CONTAINER_UID0=1 scripts/containerize
>   CI: Introduce a bookworm-ppc64le container
>   CI: Use bookworm-ppc64le for both build and test
>   CI: Refresh bullseye-ppc64le

The other question, seeing that the latter three patches being strictly PPC
only, would concern only patch 1: It not having a Fixes: tag and things
(supposedly) working okay right now makes me wonder whether that would need
to be part of the backport set.

Jan

