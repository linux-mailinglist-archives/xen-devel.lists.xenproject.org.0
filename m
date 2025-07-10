Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF89AFFC0F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 10:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039198.1411140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmXG-0003Y5-0M; Thu, 10 Jul 2025 08:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039198.1411140; Thu, 10 Jul 2025 08:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmXF-0003VG-T8; Thu, 10 Jul 2025 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1039198;
 Thu, 10 Jul 2025 08:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZmXE-0003VA-CK
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 08:21:40 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e67f8708-5d66-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 10:21:38 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so681074f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 01:21:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e06973sm1492521b3a.57.2025.07.10.01.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:21:37 -0700 (PDT)
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
X-Inumbo-ID: e67f8708-5d66-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752135698; x=1752740498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EkhhOvpqKV4CI7r/e3pAmglrTGUR1ToRLd5WYwpL0RY=;
        b=J/guMe0ApNMwzZAW8q6qnLfHvOR1SuE5UDmLU9A6Eoy9ottBqns2mpBfStT3ZSw/cZ
         h5x2ytuTYAN+q9aEOFOJyDtOtZ80fHbKqHpaY8qko9tfgk7oRBsbebYuJy9oITjHh13n
         nqZ/FLqs79myuTo3so+GpCfftX7DKovPWxta+Msru1rc9oHwuG4eLqm/6v6kk+YnbKoV
         kagDmBGkDhqjWQ3obkLXnzfj1VRdwWI84XkGqAhkMhssBA2KfK56JKVN0wl5vPk8C1mg
         SxzWy+2OkrDIMsopxjb1ViDmxRIF+iqFOUeiE/FCCRekvk+868SvPtXQXM+iDcHEaeW3
         6e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752135698; x=1752740498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkhhOvpqKV4CI7r/e3pAmglrTGUR1ToRLd5WYwpL0RY=;
        b=ss1c9KiK8C0ORgFD0eiO6izJUDL1CzHRY4Jgb644AHOwVYZxrXunYLsRCeK3db60Fz
         68Kk6rlTbMOttSeCwNS2UjlZSt1MbUl6sM3OIby0vhQigIoLHi3pQ+ZirK7/WwlV623P
         VIJUIpNfoFbyjwZ2Vj3UhzEG7S99B4qCIxfinA7Xp6/6kW4XajtEAwFjFHJEZbpZExtt
         +KYomosrKvWv2RwIXYyj5QXWXB1tCJ/aTZPsSu2Obw4eGuYHq8fgnZwWKML1VgWk7Htr
         6BRybLoTwCyd2jjkgYBoG+o1AaHgem1Ze2KStsokabgN70rkw4XiXXmU3y9iNUHdoICn
         IuHw==
X-Forwarded-Encrypted: i=1; AJvYcCXsdZJlOqMXA0Xa6bPNdZ57ZRJXfFO9+GyE3cgrERZZrHmgsiS3o/YUWZ5PuUvU0P4pDabmqh6R9qU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfnbseLOBYDXHmoOnfQBLhWSzQ2zcO3GDP3Rvi0k4fhYRFBlln
	jIGzli6h2MFCI0BOayTVJbsKx7eW1GQLHQBFzM+Wze83bQ/lQwcjSU3yeOAJHENpQK40jScX5yi
	bmfc=
X-Gm-Gg: ASbGnct7kZszl3Y53RXSg5IvDLowQ/MB7OsqfCspAl9w5gxMcFmH6fH3FEvMTUOLoGe
	43qtC+awFTdfi9QL+xsqtFBMFdInSCl3QELfSXhR9lh4EMJNAAZMdoEVtcJoZpVxBZgfBLPHpb0
	PHWxcgAKLFBQ1be0b63kL42Jz+iwoCHhmsO2VmrmgaVxDiqz7H2mB5KfL1nSMORl3H0NI3hvCx8
	oygXUfYf24ZQtUjnJ1ot+lP00Jem4ROBsO8+QTWL+8EqIUPKrN0RLrYgCGdyhF3zqrjK1EgX8nA
	3fxLimaw6yyKINNd8VU9dP1G+7STqwQOQzIWXrkPgvQqVdXxEgdDT415DXRUAsk/H6d7tBy3E1Z
	61iteM6KuYWHZ6U/5gUlIWeBNonjDdfQYofTlk3ymmIYwqgw=
X-Google-Smtp-Source: AGHT+IE13c5FxvTlclX0VtpMNE3mPbxyUZl3ZyvDZlnUYmfcFPWE0XGPCGVxpbsXeId3DBknCFOQAw==
X-Received: by 2002:a05:6000:48:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3b5e78fb067mr2874456f8f.53.1752135697868;
        Thu, 10 Jul 2025 01:21:37 -0700 (PDT)
Message-ID: <7fde4d6c-eadc-4c17-a88a-80714362bdca@suse.com>
Date: Thu, 10 Jul 2025 10:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <0a7a954cdf899845f51427fa6b44915f28b2cb90.1752096263.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <0a7a954cdf899845f51427fa6b44915f28b2cb90.1752096263.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 23:38, Dmytro Prokopchuk1 wrote:
> Address a violation of MISRA C:2012 Rule 5.5:
> "Identifiers shall be distinct from macro names".
> 
> Reports for service MC3A2.R5.5:
> xen/drivers/passthrough/iommu.c: non-compliant macro 'iommu_quarantine'
> xen/include/xen/iommu.h: non-compliant variable 'iommu_quarantine'
> 
> There is a clash between function name and macro.
> Add an 'extern' declaration for 'iommu_quarantine'
> under the same preprocessor condition (#ifdef CONFIG_HAS_PCI).

Perhaps s/Add an/Put the/ or some such? You don't add any declaration,
after all.

> This ensures that the declaration is consistent
> and only exposed when CONFIG_HAS_PCI is defined.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

With some suitable adjustment (happy to make while committing as long as
you agree):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

