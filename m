Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEEA75EDB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931855.1334040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8iB-0004G2-Q1; Mon, 31 Mar 2025 06:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931855.1334040; Mon, 31 Mar 2025 06:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8iB-0004De-NF; Mon, 31 Mar 2025 06:33:31 +0000
Received: by outflank-mailman (input) for mailman id 931855;
 Mon, 31 Mar 2025 06:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8iA-0004DW-3o
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:33:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e388f98-0dfa-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 08:33:28 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so27413135e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:33:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede5csm158920635e9.8.2025.03.30.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:33:27 -0700 (PDT)
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
X-Inumbo-ID: 0e388f98-0dfa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743402807; x=1744007607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cD+3FWHbgj6aXhi2nNpGHVFwuiiVLpjEYQ/gFvgRRYg=;
        b=K1nJS1KkeqXrmov8ZWJeD3nZOhUxeLqP1beMPmFUF6WnMBh6pa8n2ABzag8pGnE/2I
         hn2DeHZfy1g5GtBZoSww0XZ7buRyIVD5vkm+89LvMpLAnS53jhfFMTv44vLcszJly74G
         fAMRpsjOFs2pTX7AOz/IuDcnK0Q4BwJYX7jzCm1vm1SNM/XBMdBQTa5yDwfVKERwA5JD
         HEOxJ4gJIVfZeSRr6xhRhCfoQDLRzjqKty+DebqwF/8+sD4Hx2U4bPL1q5+mhOMEhklS
         pVlMSQRxQdH/PvX0Onk2tdTdxIMAwtg7/dkZ5O6baIfpvluW4aSoLm3NDLWcoB9NRPdy
         AaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402807; x=1744007607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD+3FWHbgj6aXhi2nNpGHVFwuiiVLpjEYQ/gFvgRRYg=;
        b=SfX+UmpNumCU7zwyPLtRqHO5fntzHrBmDjPjTEHJjeMKHODi1XJO4RsMmAVte/fZsC
         kLGpidTxJIv21CVylxXNjSy6Ui7Y6RPT3NKgN04DqOcOUKdTIkmuxngyqDUSAADOFBPj
         NYK+F8Sx1uOSwoIpgH8M59zqpk1y72LmGv7elsxYf2vBi0/1yebJ1cR+o/0uGbWHyC/E
         3QHQGsx+0nYItte7cgtG7XAhG6KvKVDJIQi5yj9s3mWKLujHyO7GXuC8i1Fb09p7f3TT
         eF+x6jCD6kEMkAKgExkuEr7kH+/AHck0kj04UWyOUdTY5ijUVAP82qt+w5l4WlCFutMl
         UNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6AFWk3Fh6mh6LZByhuK0LAbW4ViZEu8bJfrq989A6mxN9GPNKD3SFkybDDTGcmw5tOmTKw8Z4GLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpW+un3qnxi12IoV2/SsXnq5stAGOr+Cu6x4jexc+SOe8LMR27
	DFkFZzhJVVi2d4tRnwdf35QmW4x6PLuhe7VssK5HJFkG1NxR7i7hVx9Yys8HbQ==
X-Gm-Gg: ASbGncspkZ/ABs5NSf9rCw6Mq/jlbj6p0IisYtmtTTfS54v/J+hVdd/yOjS8DDQLqWM
	LhD0gQ3/Cmv6ZtTxFgjvD73NcqX8k0NXY59JsjoYs09XeDZodlqhsjqpvlQPGdXoBf4reuLlBQP
	JwNRG2sm0KVyok0uVpQ56y7LcCvy3Fp+3PgMecvU5uXHJXuFI+bZeLlPaK2EZNMjjBiDzU9jrHM
	i50u9TMVqqv/yxiCPgKO1d3TmAn+N2tlJbKOeLqLjmWRtOG0XcnqOp65gXbiejoh3GfntL3wRW/
	PjiuqF+qCOGdcHScvI5wQKIAQbifm7uQf2TIHJclgURGdxNB58hr6AZYYf3oTaS06PlIUM790Ub
	xUC9DBXMbnErnVOu3GAxuGB0qh1veHw==
X-Google-Smtp-Source: AGHT+IFVVVLnwzUrzIBwPxRpVlCMLrFuw/j/tWEnUDevU89HIajLS7PYauyBZk+mEgr8Mpdr97T0Cw==
X-Received: by 2002:a05:600c:34d0:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43db61d7785mr56470025e9.1.1743402807627;
        Sun, 30 Mar 2025 23:33:27 -0700 (PDT)
Message-ID: <b7227c78-8a5c-44b4-80d0-7a88c9f82651@suse.com>
Date: Mon, 31 Mar 2025 08:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] xen: make avail_domheap_pages() static
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
> so it could be inlined into its sole caller.
> Move up avail_heap_pages() to avoid declaration before
> get_outstanding_claims().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - let avail_domheap_pages() being inlined into its sole caller
> - move up avail_heap_pages()

With which both title and description are stale now.

Jan


