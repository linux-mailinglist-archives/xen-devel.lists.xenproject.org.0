Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92483C0EB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 12:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671461.1044814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxzo-0006w3-H2; Thu, 25 Jan 2024 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671461.1044814; Thu, 25 Jan 2024 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxzo-0006tb-Dv; Thu, 25 Jan 2024 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 671461;
 Thu, 25 Jan 2024 11:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSxzn-0006tV-L3
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 11:34:11 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b71640-bb75-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 12:34:09 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5102188d2aeso79070e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 03:34:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r5-20020a056638130500b0046e8d86f2a7sm4552010jad.57.2024.01.25.03.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 03:34:08 -0800 (PST)
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
X-Inumbo-ID: a7b71640-bb75-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706182449; x=1706787249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDK+TQjGK0IDvgftstzM4aabFGqeqgzPyGYiIDlulLA=;
        b=D69K53V7IXDHL8nva2Y1tI6P5rc5y7B3/VMmNPqOunZOnFDLABNGddRmDw7Oy+hjMP
         xcLg/1L/bEFA9Ngq5XdU4gxgMAnoXP4MRzFStVsozt6IX7kTK6xSO4A95L12OEcpUrEW
         pPCbZqUDnY3InnTkj9xXw+ExwigNf7/tGwpLQIPVALqO9f1903kG11eKWnKy8l8kgzIq
         mpsLTjutPaRTDIO+abmAST3yaKnZpodJYLtB0g8vHlridezCmBswbrBUuEPqyu10Gyzj
         CMOaGBjafnzIt+PdYcyW/qZg8LzMuyCU3jdFVu0MvjOGKDgkO0XL3JL7752ki5eO6g+i
         1tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182449; x=1706787249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDK+TQjGK0IDvgftstzM4aabFGqeqgzPyGYiIDlulLA=;
        b=pgR0GsMy+dUhnZ1n9QSJTKgTczyyD1BMFNhCiSAkP0gKWnjXYGn/Rqwz3MG7rbNGRx
         32ZXd4dF1rUM2SUGUGpL3UdvuWruRyqOc4AwXZCBOw2OhfRQ0To/H8nxJWi9TurtUDOt
         TbIbZDngwsUiQRvxMLr4z3U3wFYmRzXdGsZoAbTXRMja35hvr53aV09EmTK0ieP7jacT
         SEXVIRWlc9Mx3cQkztiLgCb/Bai3YZM8gvgkmH/Zx9eclEFT6+/rkw3hqs9lT3T+9gox
         OCQgAiKAqRNBx2Oq9cCo60xViVSX5Ql4KwecFxy4f+ZcsEp4kR4BwMWraIyvJsBMYwMF
         U9uw==
X-Gm-Message-State: AOJu0YwyTJ7Nymedi1f6BT/y8180Bm0oUUrFia0VgEVlkUTvnMA4GsN0
	DOJswfEDyfWQ1tQX00dZYHZEsFCPOZYy3DYMWD7NGnDHBcuQRudDoVylErujbw==
X-Google-Smtp-Source: AGHT+IEKGpSBF/TEMIakWipI9tlCmqwK9XsKak5MO4g1dycJHsJFaw1SzDcOGVWJyZQAqDLiyvJ9eA==
X-Received: by 2002:ac2:485b:0:b0:50e:6d96:4b32 with SMTP id 27-20020ac2485b000000b0050e6d964b32mr351903lfy.71.1706182449027;
        Thu, 25 Jan 2024 03:34:09 -0800 (PST)
Message-ID: <5337f0ad-d709-46a8-b973-5bceef961d6b@suse.com>
Date: Thu, 25 Jan 2024 12:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: Avoid register spilling in cr4_pv32_restore()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240124154928.2147423-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240124154928.2147423-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 16:49, Andrew Cooper wrote:
> cr4_pv32_restore() needs two registers.  Right now, it spills %rdx and
> clobbers %rax.
> 
> However, %rcx is free to use at all callsites.  Annotate CR4_PV32_RESTORE with
> our usual clobber comments, and swap %rdx for %rcx in the non-fatal paths
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



