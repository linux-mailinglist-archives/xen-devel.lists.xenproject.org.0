Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60581D3B030
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 17:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208222.1520441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhrsi-0007CM-0I; Mon, 19 Jan 2026 16:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208222.1520441; Mon, 19 Jan 2026 16:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhrsh-0007Ay-SG; Mon, 19 Jan 2026 16:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1208222;
 Mon, 19 Jan 2026 16:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhrsg-0007As-E8
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 16:13:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c83ff6a7-f551-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 17:13:25 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso10396775e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 08:13:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428bb0b5sm255812685e9.8.2026.01.19.08.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:13:24 -0800 (PST)
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
X-Inumbo-ID: c83ff6a7-f551-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768839204; x=1769444004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+vUXsm6d9ywAGLhahwKO78cqkqQuhm3E6TBu40z0KA=;
        b=dhHXq9Ty4wsFgsxbwZZSXBhBGnPVRMKzp6Knsw+E7s/nQk2830ZqWe+qIGHVRcRI3d
         IjGfDkM7EGyWSPbu8Pm4tz0GjEpA4P8FCgZ0kcdDSbFg4z5BLdoNKybx3hIolScYzisN
         J0Fpnrkzp1aaL73sZPm7JGomXoua0vPIk1hl79VTjAXb0s3LTKkjHGekGyP7gb1Iymsb
         Wi56e0LKSFP57oc7/d9MW3e6d7UjLfHbEvmg3rqQ0XjEl+U+hEqJGJUdiWJMTiVRp3Ll
         EHjoxWxk1g9E0KW9fMq5fiTvYCqPRpX8/zLUuZzMB/wa77akAu2rXR96doJvXBVy+T2j
         SzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768839204; x=1769444004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+vUXsm6d9ywAGLhahwKO78cqkqQuhm3E6TBu40z0KA=;
        b=SNSdRDUYeqFuNcyonBsyA0oL0Cyz2LB8pLT3noBUVA0k319EXCeHZyZjplCJQ2qHzu
         H3t9r8lVtn20QQ1l+PTxSQLMNmtoY9ryMwb95BoEJMnBfE5/503WVNOnzGhYV37+fM6e
         Td8rlfvw/hiPJNQsDfIDKCTHa4iYC8dhIp6Vx3GK66aBX/tfhMgXKQg/ku30uIavF+3y
         g5fZGahK3IXHMX9aA7E1RocLsGK/6EKeM4bqSSCGc6xPWqn3yLYhkWFam6daDrC5fr2H
         50nfTHrecAMA3Rn/1pxggyKLUCiwNZ3eULnKLNiIJy0oRkVFIsQICH1BkvpedyZbnx7e
         LQKg==
X-Forwarded-Encrypted: i=1; AJvYcCV6JBJk7VqlLCttUTlIlugUgaGr1oYnLmUxsEa1kStndqW+7i1YkjCRMBvgKE3cwAhVqI303AijfMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgPJbUtg4rQzzQgRxxLclhJ4SMfyNOzSMNpsiKwFT+bCa1Ggsj
	MxfIQH6po0FZI1zprv7tXlup4jFWEUoxmF717Hzto6Ux5fAOLdGGjGYOyivqbX20Uw==
X-Gm-Gg: AY/fxX7z9K/+bnTaxM/tjRpKSRA0P2FKXiS+gSOYVuqjIBvZrwv4xu9E9cPvjXgg79F
	CqoeolKDai9esfzbb90F4IiNJcEl9RCtjzCQYnNlzC/uQ5bVdESGM1+rMzNMqwvFQ/jOywsG2On
	3zQaNrxNLe64NNwI1ZE2g/r/A4Xf9QnElmSAtRsPBo2w0I4VEWA500ddTf6vN+xSI0HURvPaYyA
	FjmKyxVTZgIx87TOahh3lj3e7qFGRSAExgr1LXxm+oxCywQACq8jNa0kC/gn7gBTlIoVPF9kKUu
	fJ5gkdOK0xGNugLJnbNcp/MlxS5oQ+a1bb/G+gYg/1TOkP/Y9fe9Z9HxCbCh8K7vSjwFTLt3G4I
	B7c6Fg7SkYsbcByNT/BNT9scLV1e3FVBMuRipHwoJkchJPOdbiiV2e45gE6XPXMuBE8hXZEgeni
	V+FGbsCdo0rW0iNpogRXigx42aASH5OTWqhMZCByjQMbkiNjLUxOiwJNCjnYqCJKWKd7aa9iglZ
	Ss=
X-Received: by 2002:a05:600d:6413:10b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4801e400518mr116115895e9.29.1768839204388;
        Mon, 19 Jan 2026 08:13:24 -0800 (PST)
Message-ID: <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
Date: Mon, 19 Jan 2026 17:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
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
In-Reply-To: <20260115111804.40199-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 12:18, Roger Pau Monne wrote:
> The current logic allows for up to 1G pages to be scrubbed in place, which
> can cause the watchdog to trigger in practice.  Reduce the limit for
> in-place scrubbed allocations to a newly introduced define:
> CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_DOMU_MAX_ORDER
> on all architectures.  Also introduce a command line option to set the
> value.
> 
> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Split from previous patch.
>  - Introduce a command line option to set the limit.
> ---
>  docs/misc/xen-command-line.pandoc |  9 +++++++++
>  xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)

If you confine the change to page_alloc.c, won't this mean that patch 2's
passing of MEMF_no_scrub will then also be bounded (in which case the need
for patch 2 would largely disappear)?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1822,6 +1822,15 @@ Specify the deepest C-state CPUs are permitted to be placed in, and
>  optionally the maximum sub C-state to be used used.  The latter only applies
>  to the highest permitted C-state.
>  
> +### max-order-dirty
> +> `= <integer>`
> +
> +Specify the maximum allocation order allowed when scrubbing allocated pages
> +in-place.  The allocation is non-preemptive, and hence the value must be keep
> +low enough to avoid hogging the CPU for too long.
> +
> +Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_DOMU_MAX_ORDER`.

This may end up misleading, as - despite their names - these aren't really
Kconfig settings that people could easily control in their builds.

>  ### max_gsi_irqs (x86)
>  > `= <integer>`

I also wonder whether your addition wouldn't more naturally go a litter
further down, by assuming / implying that the sorting used largely ignores
separator characters (underscore vs dash here).

Jan

