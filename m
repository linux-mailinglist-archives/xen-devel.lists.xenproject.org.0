Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1E93B46D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 18:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764416.1174860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeOu-0005EF-Jq; Wed, 24 Jul 2024 15:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764416.1174860; Wed, 24 Jul 2024 15:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeOu-0005CC-Go; Wed, 24 Jul 2024 15:59:36 +0000
Received: by outflank-mailman (input) for mailman id 764416;
 Wed, 24 Jul 2024 15:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWeOt-0005Bi-13
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:59:35 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8261a23-49d5-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:59:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a9a7af0d0so138699366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:59:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c95200fsm653153866b.225.2024.07.24.08.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 08:59:33 -0700 (PDT)
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
X-Inumbo-ID: b8261a23-49d5-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721836773; x=1722441573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uR6c8qhLsuCW8Q+NYk+tzRgXYtdBSPcu5ydfiSUPGsI=;
        b=HKb+n/7WLouLT9MpFL+5ZIaLLsArJu4CGjOu9E5OGTRHIZgKOSXAsxRgc8/L0+dSrt
         a7aARba2DgwfgDtyXGA+e3LeIR8hTOLcIPjoMWkr9yW1Lc4WhAMgey3hXgvtWopUWwiJ
         cs4zoHjgpfyTyOtQ9PdvRRYRNtrktNX3fxyYp0mBiBov3lSorlwaqLKtRFi+AdPGWKFQ
         vDM0iqxZinRRiMc+iwoH+YC/04dd5OKMTCTdQaO673HfbwHVr25bg7ZeUpf1wPJAnQyJ
         1f7L46h2/2KcPJm4TRiJSyTN4ja1g45ybMAtEDD3UxNr+/ZzkxVpf6JUX242mA3nP2Nt
         +x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721836773; x=1722441573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uR6c8qhLsuCW8Q+NYk+tzRgXYtdBSPcu5ydfiSUPGsI=;
        b=oHCG+VoLq0u4UcxLtr9NKgk8D4Z6BMbAAfd1qsWsia9qg6cBZr28bMUaZHbpUnOzJH
         wKq3bAz/aIvNzc8hkJ3wCtbQc2ZQIv50i2kF73Al3177njK2YrCW8uojcNlhtaEHpEUK
         St1YQQz2u6EoyaPVpPOJZ5D4j4s1p2pWgcY69x5cUP2ZgGcN6dXy+FVo8J1B6nhwLfqk
         m2dFf0QvupKmqdABFGd6LBQs+2soQUiT4Lr4xAMurs08B9CpB+Tm8CN5i5KQNmEKaDZx
         aEQSPj6JVkEKzjYpyTBn/K+vjpvAUOn4rvdDgqCJ2hL3PgkS7obGlAWHlD9geS1yTudx
         1UgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG0yiYusLhSR5UqZ2NglbGoP7NHiQ4mjjpSkNnN4lAlVrd3OhpjwfsPpBy6ZlPvHRaCfk47ZH/Vp9pQ0VqPd1J75j6xUAJhZClX/uckJA=
X-Gm-Message-State: AOJu0YxC6yOsGRTRoQlvf4h4a5av1qe2hy5/UjiZUgr47AaPX5UnzEHs
	27hEhk+gLAvE7GYleHOmmpnq2aXkhFtRVOwfntmoiiOyfVB+4SolftlyNVOZEw==
X-Google-Smtp-Source: AGHT+IEObHCbEkfq1IHfcbcJV7iHg1jQRtJcSRV/7DBzeezDVJH7nsYBRZGai7W9CEEVwnYqR+e5NA==
X-Received: by 2002:a17:906:dac4:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7a8378655fmr465130066b.26.1721836773561;
        Wed, 24 Jul 2024 08:59:33 -0700 (PDT)
Message-ID: <78539d78-6971-4cf6-a3b2-17911a6a5c48@suse.com>
Date: Wed, 24 Jul 2024 17:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 14/17] xen/x86: rename inclusion guards for
 consistency
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <dc082174b2a7feda3860bf8655180af90065e60f.1721720583.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <dc082174b2a7feda3860bf8655180af90065e60f.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:15, Alessandro Zucchelli wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Edit inclusion guards in order to make them consistent with the
> estabilished naming conventions.
> 
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Provided the description of the scheme itself goes in first:
Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> Changs in v5:
> - edit inclusion guards, according to feedback received

Same remark as on the earlier patch regarding the retained R-b.

Jan

