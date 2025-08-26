Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE26B356D0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094090.1449421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp1j-00041T-Oi; Tue, 26 Aug 2025 08:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094090.1449421; Tue, 26 Aug 2025 08:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqp1j-0003zk-LF; Tue, 26 Aug 2025 08:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1094090;
 Tue, 26 Aug 2025 08:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqp1i-0003xb-BJ
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:27:34 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8319f385-8256-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:27:32 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61c51f56fc7so2821475a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 01:27:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe97a4b200sm189985566b.72.2025.08.26.01.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 01:27:31 -0700 (PDT)
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
X-Inumbo-ID: 8319f385-8256-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756196852; x=1756801652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vk9oEXQUuuCqS+5OcX6u6YR4jfHfn6PX0VzBM94cGp8=;
        b=FZ9aO+H2aZv6eJpC2dXVRVxWXa/cVQtcnXKrMyd9avnpAOnXwTMTzARgT6B/HnMtvA
         QE7KrvkNS0TBppuGpZBiOMniAzOeSnzVACe5AOtDbVYBaGj/KHdCXX2i8akEimKuK23U
         6H7xrJPcQd0FOJZk2e4Llj6+KIXPuBzLTp7ecr2NWuzxlC61a5pjfFfduvO3jzXwQQQq
         sZZkp2dp+Jqnl+IUuY4z2Q/kTBoB4CCTvVlZuTFL+yPlz7F57f8QFPRcMfq7j6emtIG3
         kU2z4xTJjPMWV3RNY+Jofm1tCNkiuHpbJ/TDvEh3J9YSdIbx/UHfqF99WLoWSyPERwCc
         /VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756196852; x=1756801652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk9oEXQUuuCqS+5OcX6u6YR4jfHfn6PX0VzBM94cGp8=;
        b=n3rbS5yxTe8LXiuNHXLNPeABMQKxKDBL+aaqq3ABDkl77ecfTqYgLvKpc9MflVr2Qz
         TK7Fb3nIqZMbTj4YXtq3+/HYtgQf0F7YFViikYS0p0w4iq5K+B4+V6GNOTAKJeCZyyFU
         IuZu/bbc5CfwjlteA9wFkTxSfafpLlHs/KxHhyG43mSc4Cz/r8JVxCKljvQt4gGFa+G3
         YPnMNANkZq2xzcRkjzyxK9C6hHy4AhdglzPMsg3Iqoxd/yWhudz0sV98jRRnOQm5bbup
         auK+QYBoZivN1Q0ctd9ZxyMK+N6nibgmc8VF6t6HgAah5AFYQLcHFNQS9rMXQF2qclgS
         Vwcg==
X-Forwarded-Encrypted: i=1; AJvYcCX5rH8tKtSEfV5G3Wern0435eKd3du/ubBBH+jsibftns8Z0eeBwPtVhohmOQmv/lxRhdjlaF8LlFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBev/q6BXR8IiDNp37hYqfKUo94RmckhztWw/YHQy6S8X9FgSP
	2t8TAIn2MpmUpy5ZwGrfoNfqdtgmKikIxiu2+rSWV3sxb8buE94PCrtFarqhcH9kcA==
X-Gm-Gg: ASbGncu7nh6+JsuJZRqkw93ftvqqc3fRn5PMmmT5VsLMODy1+8bhiYzPbrMaQQLTb4F
	OgsvCBF64LCob37Pnw6BzgCM8j3OSKZnRIBDRBd3T/iXRPLPxVSZt+FACaiiSt0UbPLOzmolkuE
	VCFzOTx13j7wexWR85D1uKLAqHDZ+p2eWVRkGkkTW/UwRkvS5eQtTZzlTRHOoMToOzm4R6CQkJh
	tHvyZ2+oqJe8XZ+O/B6Ja9o5BL28bN48ToHXF79KmwJq0PsQMWjQJQQHn1hfWl6U/mNZfRcQfuw
	LaSCnnsf+9dk0eKvlkHJ13CPnIv8rwujzElIGUYE3QexwLTyY+QHqmHfudtfiQtUqlzJ/EXN2as
	KJPPugHgXdmlPdLu6xMIqUCvMPJv7WhEYld4DylQU1CUQJZ3aa+W0F/1fvs395LDrzre5iqPKs7
	iMfDsfIJY=
X-Google-Smtp-Source: AGHT+IE3gbmh5auHGW9r7ADjolIWFSGzSTdqqdzis36582LDZbPYalJl4TilDs/A1YEQoBRQUyGXtA==
X-Received: by 2002:a17:907:e98b:b0:afe:85d5:a318 with SMTP id a640c23a62f3a-afe85d64d09mr483718566b.36.1756196852176;
        Tue, 26 Aug 2025 01:27:32 -0700 (PDT)
Message-ID: <9670e760-c2b1-4988-84a5-ac55086a39b4@suse.com>
Date: Tue, 26 Aug 2025 10:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/page_alloc: Add static per-NUMA-node counts of
 free pages
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
 <b74a6a61209e37c2126dd1171b64c12264754f2e.1755341947.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <b74a6a61209e37c2126dd1171b64c12264754f2e.1755341947.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2025 13:19, Bernhard Kaindl wrote:
> The static per-NUMA-node count of free pages is the sum of free memory
> in all zones of a node. It's an optimisation to avoid doing that operation
> frequently in the following patches that introduce per-NUMA-node claims.
> 
> ---
> Changed since v1:
> - Added ASSERT(per_node_avail_pages[node] >= request) as requested
>   during review by Roger: Comment by me: As we have
>   ASSERT(avail[node][zone] >= request);
>   directly before it, request is already valid, so this checks
>   that per_node_avail_pages[node] is not mis-accounted too low.

Okay, this addresses Roger's comment. What about mine, though?

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Apart from similar concerns as for patch 2, these come too late. They
wouldn't end up in the commit message, due to the earlier --- separator.

Given the problems with the first three patches I'm going to stop review
here, expecting a tidied v3 to be submitted with all prior review
comments addressed (verbally or by respective adjustments).

Jan

