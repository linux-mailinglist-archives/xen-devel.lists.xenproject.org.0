Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AECB9DB40
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129955.1469635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fff-0005Pc-HG; Thu, 25 Sep 2025 06:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129955.1469635; Thu, 25 Sep 2025 06:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fff-0005Ml-EN; Thu, 25 Sep 2025 06:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1129955;
 Thu, 25 Sep 2025 06:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1ffe-0005Mf-Ew
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:41:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeaf3d30-99da-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 08:41:36 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so99447266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:41:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a98300sm98485866b.106.2025.09.24.23.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:41:35 -0700 (PDT)
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
X-Inumbo-ID: aeaf3d30-99da-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758782496; x=1759387296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMkb/XBISukaOBYe2gqGsOGKEi6LHXY5IpwYrRA0BPg=;
        b=EaHybm54TldGV8RW2LUKF53QuyKzxDh5jRLNZNjRjte+CtpA8WPS1lIZ6y6zayr37e
         xc/ROO0G868dhCEe8mOPgd57D5sRJ7e8HwJfFllIMxZwzU0sY+O7T0sofRK1Orr7Ql84
         0mW0m2CU4JKRMehGV8u/v/aPokhrHhULur8G/7MeF5tYDg5FjuKLZpg0GjJwP4iG7j/R
         R0NsAdqVkfaF54Ef/QYbb6WYTKyGTa4Rsjfix7/r/iFF8ULO4Vef+GmlrGn7YipRIlrJ
         Uw4i8nVJWeFeJl9X62e7KuftJyE7FvyEDBb8KPgowS5lXObbBBE/v94f13NJjblcAzWu
         V30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782496; x=1759387296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMkb/XBISukaOBYe2gqGsOGKEi6LHXY5IpwYrRA0BPg=;
        b=uQdmc6lJvUePt7ONiyhfbbXAq0f7c74gnkNUZriJTcHWisgxsLImEUdkm0/AZ8vIJz
         uPDFDPprO+Wk+ypWBdp9NtMh0Sf8E+jcBE+wndsWGd94CnxM+QDfbEpK6xW4v2UwlNmU
         vEm4ZpTIeA+NTiWy77dKT/aGVqM/dxX2L+crlrJsK9Eh+KNKTzEHrUNfWcyJWBa3kRqs
         zBVXR/8BU1V4ICriik1JbDNmWyptUjDwmScwfFIONKN/gK7CBsbLSXo+ilrg24gf2g23
         D7iC3wGeTuEmQU5g9maTYHBKaDABFdsove0A3jKq+SVDF/eEnxd6IJJuIF2ZEPfC7yGT
         GHCw==
X-Forwarded-Encrypted: i=1; AJvYcCVLo3VOZeIAHVIelHuvdVmQHQAG64By2BzqikxLOvuChtok+tNW6+E6aPHu0Og7w2LLZL+p70ElZRw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwniKv159Is+MCMF4mxDGW3kp/Wj6S3MtTEGz1Gr5BQ0x0thsVn
	/5Yq8tD8IVvddhoVSlHnUezo+E7Rbhv/AYmzg9jziEMfYS5AN6jSTB0KtQSrvinhMQ==
X-Gm-Gg: ASbGncunhPmd1xGQ9ECi9Pfra7ok2z903JBesUK+kEARzSYuHDeYusn/AcdbmQ7fESA
	bggJ+//Eu/9axL/ptAziQA1Rpaa/E8CrWv4ZGwCZC2oNEo2eYh9j6p5prm4vo1a5/ukOjlFPbKu
	oqt0PgssjGhbupVXgpP8ky23vwrkZS3IsaN6SMZQR4ZKlUQh3mxGfEsh+Qi57nA9d3Fm5aLRTr3
	xr6HuJKoSxosmzX4tTr3sucVnLcJ2d9QqZCFwS+/lGAG74+go/fk2t7toGR54MY+cMA0hSKRC+G
	FItODWPXu8UWVjJ/RfNxAlIRnP+fiFfTWlY4rrVrEGUmXfG5U0iwF99LSnhdQZQQaFisMY4DpWG
	+JO6zPxY6ESW5/BZEYxakZ2n7MXGY3pHXHxKMBGCC+zjbm7WGRKGuUtFNhlyfEjsUWtYFc7MVLy
	sy4VyWfQ8=
X-Google-Smtp-Source: AGHT+IEh/iREEYFeuR6RUeuim7C4uEtzhEZ+Zn2ukY4ZuMk63D/1oFARHpvFfTEApT2WXxJBXp4uMg==
X-Received: by 2002:a17:906:6a0a:b0:b04:85f2:d272 with SMTP id a640c23a62f3a-b34bc97172cmr242016366b.49.1758782495589;
        Wed, 24 Sep 2025 23:41:35 -0700 (PDT)
Message-ID: <5ca4c3e6-4dd6-4de3-a7cc-4070ab3e1d41@suse.com>
Date: Thu, 25 Sep 2025 08:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: address violations of MISRA C Rule 2.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <620eb8fe22204e204cb471e93d2ea789f879d854.1758744144.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <620eb8fe22204e204cb471e93d2ea789f879d854.1758744144.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 22:35, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> In certain  build configurations the following functions 'prepare_acpi()'
> and 'gicv3_its_setup_collection()' are defined as inline functions and
> contain the macro 'BUG()'. This resulted in violations due to these
> functions became non-returning.
> 
> To ensure compliance with MISRA C Rule 2.1 remove inline function
> implementations and their 'BUG()'-based unreachable code. Provide
> unconditional function declarations for 'gicv3_its_setup_collection()'
> and 'prepare_acpi()'. Rely on the compiler's DCE to remove unused function
> calls in builds where these configs 'CONFIG_ACPI' or 'CONFIG_HAS_ITS' are
> not enabled.

Imo it would have helped if you had stated the respective predicates which end
up compile-time constant. (Likely the two changes also could have been done
separately, as they're entirely independent of one another afaict.)

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

