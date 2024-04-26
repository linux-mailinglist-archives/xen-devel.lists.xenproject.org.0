Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621B8B3005
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712416.1113096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0EfF-0002fY-Kz; Fri, 26 Apr 2024 06:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712416.1113096; Fri, 26 Apr 2024 06:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0EfF-0002e2-IE; Fri, 26 Apr 2024 06:02:29 +0000
Received: by outflank-mailman (input) for mailman id 712416;
 Fri, 26 Apr 2024 06:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0EfE-0002dw-22
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:02:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f00d4b8-0392-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 08:02:27 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso195030566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:02:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b25-20020a17090630d900b00a5875b34b6asm4414335ejb.14.2024.04.25.23.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:02:26 -0700 (PDT)
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
X-Inumbo-ID: 8f00d4b8-0392-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714111347; x=1714716147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Of/jVMt3nYb+ntFEQX3n98EQvA1ntwarPjHdelmljcw=;
        b=MEaGzeC2jyV3cUqWk3zRf01MeP+OmMFqzhAdZzvY3l1bCM5Bm47WSMPJ+3sB9p6LvN
         TKlGKQz8E79vcUebsyUSd+tcezDaO7H/wlb8SotOUtOBkCgVj0FrChpo7qNzrki9Qb5F
         QYv+WglYJcKtnTT2KU8Ljj5LKSPpBqHs8LazspQnxO2OUIhtin5Sm+R5thce84eaFEAK
         t59CQtb+dmUcBH3SqPp1cBVLZ+13uDwBn8j/PWG3ijkaMl8TC1s/Rv+H/+Q7/uVa3Fvg
         4jZGZ+IHuKiGohU0M789DSF2kdGNmNdlhHG/TcuMY3NAPqCbiQ3x/lOTc2K8uEvRns1R
         xOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714111347; x=1714716147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Of/jVMt3nYb+ntFEQX3n98EQvA1ntwarPjHdelmljcw=;
        b=XItugUqXhH+O2GVKx0E3lKsX6a38TjX4tQkic0VBBSYQvstARmcLjavdlWINnl7N7F
         wyaMte/cykI8EwnxGgYUHKzBofDmbujx7BDHL+E24GmtYJEUvuuHMRWIx3M1M+gcp76G
         HKuTqyerVGxJV80CywKm7o0C69hxLCg0QElPymfL5rdtI1lb3R/RGvrZ3KOHW03GIaNF
         2CMus9+oR/bS9w2H7ZJZVYYRkrO3H/nC1IZLGPjevHxu8w1mqrLifTITxK4Q/EnCuISb
         yH52nmGT+PzW32qWFkjT7mB4C9CtQtd65mOo0L/GrOgQRdzfE4g+WvmMk3WQ0Hh3jsdx
         ZznA==
X-Gm-Message-State: AOJu0YzDj2K6MlWSsh6P3+axsnR/heIlRZhuM1kReJdGfjGtYH06rrl0
	xGnxBlY2kTyAV/XqoH2o4S3wtXtqP1sxLDGTcrKmL2OtLzSBYUV/qhTxjL45ew==
X-Google-Smtp-Source: AGHT+IGCqDutoTekvzEDS7Re2J/JaW/Ee5YM2RKrfArAhXiyeTTgKuy7OqVh3IgeNlQMb9sDYTmURg==
X-Received: by 2002:a17:907:76c2:b0:a55:b2da:3e92 with SMTP id kf2-20020a17090776c200b00a55b2da3e92mr1525948ejc.68.1714111346718;
        Thu, 25 Apr 2024 23:02:26 -0700 (PDT)
Message-ID: <012320e9-c63a-450f-8e91-ebe13352e6d7@suse.com>
Date: Fri, 26 Apr 2024 08:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] xen/arm64: entry: Add missing code symbol
 annotations
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20240415231541.4140052-1-edgar.iglesias@gmail.com>
 <20240415231541.4140052-2-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 01:13, Stefano Stabellini wrote:
> On Tue, 16 Apr 2024, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>
>> Use the generic xen/linkage.h macros when and add missing
>                                         ^ when what?
> 
>> code symbol annotations.
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> 
> I am looking at the implementation of FUNC and as far as I can tell
> there is no change compared to ENTRY. So from that point of view we are
> good. I wonder if we should keep using "ENTRY" because it is nice to
> mark explicitely the entry points as such but at the same time I am also
> OK with this. I'll let the other ARM maintainers decide.

Just to mention it: ENTRY should go away (and hence why PPC and RISC-V had
it dropped already, while x86 has patches pending to reduce its scope
enough), not the least to finally allow the oddity near the top of xen.lds.S
to go away.

Jan

