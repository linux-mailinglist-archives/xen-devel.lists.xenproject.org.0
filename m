Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E917A97EE90
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802196.1212381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslOC-00075H-44; Mon, 23 Sep 2024 15:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802196.1212381; Mon, 23 Sep 2024 15:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslOC-000736-1R; Mon, 23 Sep 2024 15:54:16 +0000
Received: by outflank-mailman (input) for mailman id 802196;
 Mon, 23 Sep 2024 15:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sslOA-000730-A1
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:54:14 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 139b2c1d-79c4-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:54:12 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so6314959a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:54:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bc88d02sm10469094a12.80.2024.09.23.08.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:54:11 -0700 (PDT)
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
X-Inumbo-ID: 139b2c1d-79c4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727106851; x=1727711651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f2la0fBgsVVhRNpMvguxzU4ifvH20zv0Kd3AdL+2cdM=;
        b=X+zcCCgbNqRiR4GTyImjx/Vc01ZQYBh6Zf4t/hXZynPfqT73IsO/z0g/CHw4vXtVgG
         gPas34sLeim1tpxtgYIJn6OWzW8lZLXv/KvUj17twxr0WclIAzFuN49aPotRrDfmohcu
         BvnNvS73cl2qzkAWdS4alsH7cpqeCr+CCyPyFIcrJqEjErvA9wtPxSmDU966kGbKfg3P
         QuH4g1GkUijLQFuieVcBFhlh1yhpW4aK8tcB1AgsofFbxM4colci+0ToDI7D+abkQDC6
         0ZuMAz0+xY0GVza9r+qC0rTZEcFSYRkBEe8Yx30OVt05Fj0MW7AYzOD0ss++Mel//fF4
         +HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106851; x=1727711651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2la0fBgsVVhRNpMvguxzU4ifvH20zv0Kd3AdL+2cdM=;
        b=vyQVcQT7o4vpuVFOxu/EKcbGyDPpkRY0mH9UR/MnWVz1jRkiuIp6W3WHSsHd9DDm0d
         6G+iUEHG2blSpyjC48ygBuLSIGMHw9MGnDEsgSVq5PNL+veK1F2Ca6EzalhSTez4QhqR
         HKMuVJFDwX6yu3EE8ea3CxbFcUg2YRonT3TzAphpEYHKOI9+3wHE/wnZXeNC05lDm8ib
         i3j6qq2Ksf/FILYR/QsVVdgAuZJ/QNYWp6208IWzl+T6YD8nbe+Awat6CtwmobRb47nY
         n/hCudww2L0BgCkln4ekJAW4m2s/1zwS9XLa9sw59uAwWVU2yimGpfp9YxpjeM3vBGS8
         NgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLUTRFYnhhCsgVEMgze19/DInTU3sNRdbUWUWNahro8WyhB95rRZG6Ef6DB06JchHMHoMIbP/xiuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw94/qcHAHZT4Q1YXDQ3XVC/H0GsMouKj7KXpzGIS0DkMVl8NcG
	X/ZiPfmkafN5RZ4NJNBMyr0CLzeXygdcUDmj6WP0ApJLELQVIOyCgGMjIyGfsQ==
X-Google-Smtp-Source: AGHT+IE6e9Sl7hUEkR/m2DJ2s7WKnIJtm+MDXNYtio3gbWSWdVfWjcwqCckaffdfSQ01LyFiFwvKwA==
X-Received: by 2002:a05:6402:2353:b0:5c5:c059:63ba with SMTP id 4fb4d7f45d1cf-5c5c0596470mr4726866a12.35.1727106851529;
        Mon, 23 Sep 2024 08:54:11 -0700 (PDT)
Message-ID: <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
Date: Mon, 23 Sep 2024 17:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240919080021.20155-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 10:00, Frediano Ziglio wrote:
> All loadable sections should be page aligned.

What about .buildid? .reloc otoh is discardable, and hence presumably okay
if mis-aligned.

Jan

