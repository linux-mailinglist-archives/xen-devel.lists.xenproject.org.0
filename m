Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE3C2040C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153697.1483984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESnW-0007jg-RW; Thu, 30 Oct 2025 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153697.1483984; Thu, 30 Oct 2025 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESnW-0007iF-Oj; Thu, 30 Oct 2025 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1153697;
 Thu, 30 Oct 2025 13:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vESnV-0007i8-9m
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:34:37 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c8d425d-b595-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 14:34:35 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so12036265e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 06:34:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728aa6b0dsm38569535e9.14.2025.10.30.06.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:34:34 -0700 (PDT)
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
X-Inumbo-ID: 2c8d425d-b595-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761831275; x=1762436075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LJTuo6nny/5nobMCx8JPRZyXWDVBTZKicRZfxupc640=;
        b=WKYDs+8DI5TPxMvGfyhNnHkTX5Msmy+pvI6KYIMOJJdJzrQaAiarHDV/fTi0JLJ4Xw
         MGenhf4NwYfjIjpYjRw3iEk7VDYQRZn2qBkwKByrg8B4eQGmMmf1hnlA8B9wiG/iUKtl
         6MdAMyxF322q6dE1A0tK/ifTFAZMgCNB84WHm0N9uOs5+Px4ngBqIXaG8oCuvxrynG/l
         nBKJMoCjFxmWdbQFKQ/Ov4arMAltNaayMnKQYl/6s54AAIhrNvPg6DsSpO1h9Sf9DamB
         PAqkmbYlYE347fQoYwqHdTuyRVGy0g8vTewITSHsj1PYZ9oxTtnBbiL5HU74a2FhmfOn
         rqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761831275; x=1762436075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJTuo6nny/5nobMCx8JPRZyXWDVBTZKicRZfxupc640=;
        b=HOvl+KteCHPveWzSUhIXIyS2LmYAWSPUCapfg1VfjKB28sZOOsFalHwvkRyQVcCn8X
         /TX4uWPQe401b42qox2nhIs/ZFK0CPmB4cJZnH6BSg/2ohNqgbGZDsDZyrIt/hU9GSSN
         d2c3LEsVXTCPu6zRy2H+WlSwaUk37XafK+YpsnYElTPwvyPaKmR6UiPjYe59XDZzByrz
         HlttcBxaBq2uImn1DKhtu1FJxvHuASs/j25v93Gv/56xpCrDawtjSrL70kpGCo56eMLX
         SP0T460+BgjyZbUZ69npvfg88aAW+qPft4AKTT00juJBzr337cOQTO8XY22R7G8l2KJn
         NnBw==
X-Forwarded-Encrypted: i=1; AJvYcCWpMpBjF1GSlbaPC4u5YCbgZ3tKH1ix9PiaOgsHX38cBRhaNkxC4CBSpusAuA+3zrYft1DCEIdJ57c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzcilnIN078Mej1eRpJA6ku19T5p7o4JwA0Am1tQKqiH4H4zF7
	eMe0P9qSykbU2A/4Xn3CjL/jzuUBh8TE2zghN+ckQS/zI9DB/luT37yJIQF/EGiLXw==
X-Gm-Gg: ASbGnctc1PZRpXnmK0UF7sVXF4zZjUvx5+EToVjk7lu6DS1jHbBOQgNZ50AVPa7KVM9
	yd7VB4cyIUx3b1HL4YDdp+01dqh4oIcgFtMjeBJdlmF1eIdp7xfggNJqj7N82swIOPC41A2Ncka
	lW+/SW/i091nbFNIHMBIYgzdtP1RlqsMVxD8vLpjuyzr0KteIBj0+9otJ6e4qxZV4l77rJ6le5U
	a71l8BA3772hrl0/f/fGX5odXH86amm2gIW5dEEaI+ABiZr0sxHsgWqOt90HzrQaAUY9lZqDJ3I
	yk4njokymCAEw4W83V/FbtMVs2q+ub8hrPo3xg5GU+TeJO6XPX4OGRHgLsQF1395C2904/oIeT/
	exhUUX0l6VpVJ8Ce3NUsVOrMzoBB69PhaKS5GsWMgZ72hBs9hUastkrwleMs7TW57hhZkex1OMO
	0qgUU67iUMQgtjZUlbMA8bUg6LWcd4XbGMiee9qtOUH1JCR5B6Exnmc+xblSWnhIep9jUqgfm2I
	anYk8Spwg==
X-Google-Smtp-Source: AGHT+IE2HLN3haaCFe5Jr9gHuBoZ+Yn0EXKsXSTen04RvJVu8ZKbMatcn4r+af5VTHkU7qA/FnxpDg==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-4771e1f1dc2mr66726645e9.36.1761831274602;
        Thu, 30 Oct 2025 06:34:34 -0700 (PDT)
Message-ID: <af8eb5b1-80fd-477c-9b50-29041ae93088@suse.com>
Date: Thu, 30 Oct 2025 14:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT conditional
 upon CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-28-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-28-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Helper domctl_lock_{acquire,release} is domctl_lock, which HVM_PARAM_IDENT_PT
> uses to ensure synchronization and hence being a toolstack-only operation.
> So we shall make HVM_PARAM_IDENT_PT conditional upon CONFIG_MGMT_HYPERCALLS,
> returning -EOPNOTSUPP when MGMT_HYPERCALLS=n.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

I fear this isn't quite what I suggested. The param get/set are XSM_TARGET, i.e.
can be used by DM as well. The particular one here shouldn't be used by a DM, but
that's a different question. Similarly in principle the PVH Dom0 building code
should be able to use this path; it doesn't right now in favor of some open-
coding.

What iirc I did suggest was that the serialization isn't needed when no domctl can
be used to otherwise alter (relevant) guest state.

Jan

