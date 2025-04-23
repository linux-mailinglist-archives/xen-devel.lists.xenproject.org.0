Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C9A9823F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964102.1354972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7V8O-0006F1-Lq; Wed, 23 Apr 2025 08:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964102.1354972; Wed, 23 Apr 2025 08:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7V8O-0006CZ-Im; Wed, 23 Apr 2025 08:07:08 +0000
Received: by outflank-mailman (input) for mailman id 964102;
 Wed, 23 Apr 2025 08:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7V8N-0005iF-Ao
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:07:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f207dbd4-2019-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:07:05 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so4170338f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:07:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2e97dsm16476425e9.18.2025.04.23.01.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:07:04 -0700 (PDT)
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
X-Inumbo-ID: f207dbd4-2019-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745395625; x=1746000425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9EPSxuyRd01dx1UGB1aiX/96D5ARixBWeVTUGFCaaB4=;
        b=Ijob6dh74gOEUN2tfCYXCFpyiBVbsBvmEQXipacM2xLoB9m1X841cvavDWj4+I6QLF
         Q2bVxHmwuzrpEMf8W3mCGVaP0WcmYCum2fvh4WRjUGK5go8CIHvtEVWhVFbPWg/ylILS
         knu/eXKfTD1M73oD/7AEKJ+UuU22+W5OdeKUS5zqGnghS0BBM3ErNHwFDIItPOXpk0o1
         YjTZxhbcfGmzj2g0lbUgbyD3pRkzDxa3UjciqbWATS5u7wrppmEi+DSDOyiwxB/nd4/V
         ofeR+UzIdzscOIbvNbV28Odp961VrqOYls5iASazym3a0LP56neHO1G23fSkKLRlwXmZ
         Zbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395625; x=1746000425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EPSxuyRd01dx1UGB1aiX/96D5ARixBWeVTUGFCaaB4=;
        b=kfjBw/e5aDmaa1/+UHNq9fSYobxEOyLwzHjh2ISoQUrSwu5whVx4l0zuvhEhRWb8GA
         /w73HAqxAM0PEQtkxqbFQoGx6FRYy6XTadn/k5jnTpuhe8Xs8CJuLG8hWETobeoT+muQ
         zZDrhj31qc/06olJ8ZO8175rup5sET3oKj7oMLcAh/akPYJm/g3ObdFid4ONpP1a/IVM
         3gDg73Zc+Vj80VpSx5dc3K+yl/AhflnVu8nNLt27/6XMzZeV9Lgn7D+dQwIqlc5UNo6u
         /NV0RDwgZ8p9S6Gmehhb9UIgPId4N4JoJXKm6tTG/r7x7LcN2Xim2qFoSKmzLLXHmqYH
         QIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPnl5ZI4Ee7JONhuXLsBPKISOAwX7prxpr1EvNzzsq04vSwCpda1AjgH/nZi+dP2tDfHCFkvK5a8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpT5rHuV0RRHARSBViYU5y0fAvK4TaWRWqSyuSrZ1ICjsX1pUt
	84CY+awobu0SWix8xWhgugR/bYKOmXKVQgIgJH1U3xIOUqHAFttbEhHklDSkiqPIDEojdaYvEZU
	=
X-Gm-Gg: ASbGncsfYfJcePZYyYWZCebK1AQRViMeCraM803a1bORRjrdf8MQICgcOq6m872vQ4Z
	zJuMWUwuuiyPnx8A43BApGA4GQUV1jmVZ/b60A6MHpGAWXR2XstF5rPUYTTqSxE8wa7v3CjdMtK
	ENqGzmMYxvfKDi6pKY/OW9+Xx0bK8sP4sMRSvZwBY9pVi2gRoIxiumcXcweLc9mE7aLYk5EhCoe
	uhYKJkMUztr/wlDEhW0L64KwIzHEFd4nFHatK15rJgBDhueg/YT1kPQxY/+siFQJ4bdTmp+ZvpD
	Y8QSVWoz+GvY7Dxp/pW8ddlMBSaHJqAzq8iTFZD/9me8fuDjryVfSZukCsmzzPhfXmij0f/Gh5W
	RrN33wOAWEs6n8Ku2e1JZwgF5s/g8rvFtUztO
X-Google-Smtp-Source: AGHT+IEC1g6NhP3MQVaJekqhIdUPGbbKVPGYXr6N+13idrU4UAn0WFLi986FvirX7omuDZRUaevDJA==
X-Received: by 2002:a05:6000:4284:b0:391:3028:c779 with SMTP id ffacd0b85a97d-39efbae3ff8mr14923681f8f.45.1745395625163;
        Wed, 23 Apr 2025 01:07:05 -0700 (PDT)
Message-ID: <3dfbd78b-7660-4ee8-992a-e84b7af706f6@suse.com>
Date: Wed, 23 Apr 2025 10:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/alternatives: Factor seal_endbr64() out of
 _apply_alternatives()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> We are going to need to reposition the call in a change with several moving
> parts.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



