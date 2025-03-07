Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ECA562E9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904716.1312557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTNS-0001WZ-Gn; Fri, 07 Mar 2025 08:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904716.1312557; Fri, 07 Mar 2025 08:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTNS-0001V6-Ct; Fri, 07 Mar 2025 08:48:18 +0000
Received: by outflank-mailman (input) for mailman id 904716;
 Fri, 07 Mar 2025 08:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqTNQ-0001Uy-Tn
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:48:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84fe521-fb30-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 09:48:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso9543765e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 00:48:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01d2cdsm4713729f8f.57.2025.03.07.00.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 00:48:13 -0800 (PST)
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
X-Inumbo-ID: e84fe521-fb30-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741337294; x=1741942094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ5OfCOYBCvZ31XgUnkpoIj0cS9VWUrAYcOq9/eRpyI=;
        b=SOSvhfwhr00xsl1GeiqiaxMYgUQyeA/WaySaBECumyq2/+EzfEcAzUPd+U6HWIE6qa
         2DqfnWuqTjNJbb0eN3Ptdr2k80qhEHTHzv32aXf1ZGnRMjXuxHIN/zoI4DFZDR0EuYUA
         458qibmGsJcwIZ6n40Sn5RKB8irR90RxzyC0wNtZfDktR6ceRnL4KMB7+9jSXrtimz7z
         1Gn4qrdtkshKS1GS119gy3RJVdDkR5x0Coz0Fgyo/7dnjQXDl2+W/mIs9MnHziytJoPB
         7x+8BhVRSrNovJ8MkDcGYPbC7JkHtDtVjXj/oiv3vV63r5Nh+qrcWUgMVdCYk7bigmCR
         Vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741337294; x=1741942094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ5OfCOYBCvZ31XgUnkpoIj0cS9VWUrAYcOq9/eRpyI=;
        b=NWDvOE06O78ZHebcJfSsUPntn+5YBCxtrlZjbfL+p8XiGZmUdQ6NjEM+BbZXu3+t11
         Y5+SdJiLCLJylApXmSbm5yU+9rxkUe4jfCKXA9LUXhB70dh8mst53l9cO+Eiwd2J3E8a
         mg084AWbZjjgoqExpxH1E7siVkts0aKRjVGH/VREM0t/8fp9VraPrW8u35XXk8dtgk5T
         zyC/uypZ9RXWBzicVcppyoumoEjZPQVHE4KedLIdHklfxBW35QvdVf0GvAzEgQT25kbn
         YNhAwQB6Wcl3G5mJaX3+o67iX5607tCde4N/tUqCgcqCnsi9dadZcHOCoU8CmQo3hVrr
         IRbw==
X-Forwarded-Encrypted: i=1; AJvYcCWq3jdp+uD5xxpHoJmjtos+r1/0nf/+cVF2EQWoEu7OCnWyi/WuW5kNYc2F2u7VZf6ZHGrUl+kAwVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzp52fSrvZmexoUrYQAdZqUgRD4QSWL+pt+ffCtlVYO86g+3ZxE
	Czl5SOTPwYJEJNSH6lNH0yfTKVcFEYm3GU8y/qmy/ua0Euy8JqV7+4TpRit3oT9qYeXlYV6/Fuw
	=
X-Gm-Gg: ASbGnct9oQ+foezwvU4+fFOcZ1zMfwL6d/KyNDsVKP2fFiiGNpeNEV01IYtgddRwNq9
	IXehi8oo1/2o1PKpCEyss9mGigJrKtn5XXeeNccaToKLg98gIIRLW1F2NN6g1PXGPFmcL7N/QYL
	OLcx8itXHvY6DMiqSx4/nbtCJARWmX/U5wS0+pEfMu0W0tJGJmXh/iJd26Er8vlKo25N1QxzJp+
	5VS/r3QOyvllD+mtyNsBVi530ELmyQR00wkFE/ggVU8FcvEDDQ3H0oPfd4PjcG5OQ+T6+gLN/Vo
	Wd6Ns087Vm7OK51NC7YDv43X0Z0LubJuvGbP4SLZemb7E38ndxmXdR11+0gPrx1ADL74rJ3dfXj
	WutsBNkl7FpaQUMhqWt95eBtISVZhbQ==
X-Google-Smtp-Source: AGHT+IF/LcDJ8PB7xf4fl9jUXKvSIJpol9mVlnHmz2jSj8B36NKbI43TnfRMxbLM9ddixvdxjwcIjA==
X-Received: by 2002:a05:600c:45cc:b0:43b:ccfe:eee5 with SMTP id 5b1f17b1804b1-43c601e188bmr16785725e9.17.1741337294119;
        Fri, 07 Mar 2025 00:48:14 -0800 (PST)
Message-ID: <1f5bf9e0-4f88-4d00-8b44-cc4e666aeea5@suse.com>
Date: Fri, 7 Mar 2025 09:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/e820: Remove opencoded vendor/feature checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250306233519.3006560-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250306233519.3006560-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 00:35, Andrew Cooper wrote:
> We've already scanned features by the time init_e820() is called.  Remove the
> cpuid() calls.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Backporting.  Not sure it's worth backporing, but it is safe (just) to
> backport past commit 365f408339d3 ("x86/boot: Load microcode much earlier on
> boot").  That commit was the last one to reposition early_cpu_init().

At least I wouldn't consider such cleanup to be an obvious backporting
candidate.

> I'm pretty sure that all 64bit CPUs have MTRR, but I'm less certain if
> dropping the check is wise given the variety of VM configurations that exist.

We did consider exposing PAT-only configurations to guests, so I don't think
we should be implying MTRR from being 64-bit (unless we know cpu_has_hypervisor
is false).

Jan

