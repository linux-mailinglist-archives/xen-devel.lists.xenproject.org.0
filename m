Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244978BCCC2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717568.1119913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wQ6-0001vV-Qb; Mon, 06 May 2024 11:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717568.1119913; Mon, 06 May 2024 11:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wQ6-0001t0-Ny; Mon, 06 May 2024 11:22:10 +0000
Received: by outflank-mailman (input) for mailman id 717568;
 Mon, 06 May 2024 11:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3wQ5-0001su-G2
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:22:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df577d81-0b9a-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:22:07 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ebso12756965e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:22:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0034d9e5411ebsm10519637wrc.45.2024.05.06.04.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:22:06 -0700 (PDT)
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
X-Inumbo-ID: df577d81-0b9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714994527; x=1715599327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyYOXV41CuLhX/Vi5skclwIvLF4VyHxTMCAtmuC7KmA=;
        b=OwOG2TnCtKyEB9bv6Wa+TLEyO0+de5CNGDX/q5IQWvgR73JHz+/BFbXtE6g73Z2jBV
         dEoW5DIReSaqZvzLlmfa1tFEkoBdGMvMis0QoCAXNaVn+toexWvDdtCw1nN//WQzXn6k
         bWSQYI8eawuAfQSkeX4vs0a176IFXr5972ZWPq3pGSn8p8cPkdQs6dpne/0D4maqa0I9
         voz4zGe/BRvzz3ibjCITnmGigh7gcisBS2sHYYxni5ysyUCnPZW+NBPsdVSf7FlyO5/g
         LsSqjtDyH3D/oJRHT4gBo5hhMSuy0OBI9VZYnipVWSGZQm1KPnJO8NqGyXubkmuEJWik
         51RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994527; x=1715599327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyYOXV41CuLhX/Vi5skclwIvLF4VyHxTMCAtmuC7KmA=;
        b=juaucPUCgu0e83BoZM80tKhexnbRr7LojM5S/Z0T7eMg+PlsMCLGquG3Q6gYGlAK4u
         +u7NTd14uhyZdntx2h3WJu5oJtJZdW7PEC6J1NDwjuVOrTp9lT1rXj4GNmMI5GpHCsP3
         i7tGXVuZtIclHDx1Cws9LkiNCnECcT2MVNmFhB1XdEKvn/qOVVgVHxF9IYjAnXU43Pxv
         t4LriHhGNedYV359bSDOIwEb2gCbjlAhlGgEGnx54PkFM4bWxUaXOXXAl2/l+N5nX+Uo
         UK3pJnOcNmdMUutDEO7iZESjmikBcBiWbqKtdeTRa0d6+z+NUxt7ddIHwQjug4klZQEv
         Ulkw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3nB4DHXAiajXtxX9r2SihpBaHU1EMYNHuGbo4MluLmw2HjY/l4wORKgZDR04wxfKc8FUiPbkTiWEb3gTnUQ1eHt1n1tbl5ouL6oyidE=
X-Gm-Message-State: AOJu0YytS+LqsIS8POR5gUoiqsQuPpZG6KVgRtZS0FAErSUJgljDgq07
	N7GMEC/vldgQq0OdcdRxGUPEAqs41TWx8PKlRU4ldlL03JjeCHoIG9+gVTIdPg==
X-Google-Smtp-Source: AGHT+IGdkcSjykiRn7ClIHtiPYhkfyim0yWkgLhyNWQMRTA14P3YuTKF+QU8prc+np//z52GRyPM8Q==
X-Received: by 2002:a05:600c:1d24:b0:41b:fea6:6526 with SMTP id l36-20020a05600c1d2400b0041bfea66526mr8305217wms.33.1714994526874;
        Mon, 06 May 2024 04:22:06 -0700 (PDT)
Message-ID: <30a55580-2ebc-47ca-8e62-a518c1aca2d3@suse.com>
Date: Mon, 6 May 2024 13:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/5] x86/MCE: guard {intel/amd}_mcheck_init() calls
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <ef74d26d98cb533d148fcc83c354919443ebaa74.1714640459.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ef74d26d98cb533d148fcc83c354919443ebaa74.1714640459.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 11:18, Sergiy Kibrik wrote:
> Guard calls to CPU-specific mcheck init routines in common MCE code
> using new INTEL/AMD config options.
> 
> The purpose is not to build platform-specific mcheck code and calls to it,
> if this platform is disabled in config.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Once again with the same remark and the same constraint as on patches 1 and 3:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

