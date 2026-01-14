Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5AD1E547
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 12:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202918.1518312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfynL-000519-1b; Wed, 14 Jan 2026 11:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202918.1518312; Wed, 14 Jan 2026 11:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfynK-0004yM-Ur; Wed, 14 Jan 2026 11:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1202918;
 Wed, 14 Jan 2026 11:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfynI-0004yG-Kb
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 11:12:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd10f9a6-f139-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 12:12:07 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso7038095e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 03:12:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee563ce3csm21910015e9.14.2026.01.14.03.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:12:06 -0800 (PST)
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
X-Inumbo-ID: dd10f9a6-f139-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768389127; x=1768993927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5DFX7CL5pzKbU8OxAPLYXRLBI4mQ8zHTwMB07f98xSI=;
        b=L1Lk3OAmRT6J4wMnYR+pBJCZ/oLmp/nPuw8UJqRCh6fsaKEtDrWrKaCi/jM0ltlTjR
         q8oJq0HEEXKU/EgldJKMM+MxlTRf9QvWTB59p1mrx8MJfDYmSMoeSFmMktqZfvkB45kK
         4GO+OdxbbWbO9FH2DKzHq5NuzC26WAChBN1lpXn19m2SkhMeqNwmGwQA2jAUqwQBDXtM
         oSUnUdmon2XH7oYS2cwxReA7+tftXYT97FANsob5lq4eAOUpRfKqLrsRSS8+Ose767Ru
         u2FPD3wiJqMlwwk3T0a/GDvP9HHyVfHHzSPaB4EXGkrI0LUfwO9uZBg5I7PYFvkXrugQ
         FR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768389127; x=1768993927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DFX7CL5pzKbU8OxAPLYXRLBI4mQ8zHTwMB07f98xSI=;
        b=pvEp8puZTTAEAO2v4Sr5a0VP7I6b2nmyiBsAhD/U72rC5fwKIv3kilW2CB9hATqPmk
         rAGBfuOgK4sEepnqSlgn2/47I+pWwzPg7R64jmJnzglDpN/JZVm3zYAdLAzUSaXZ7y+F
         hJHgKK/Qs3YfBaqz6FtTmf4OUz0h7aEi5wiFfFhZ4YTT7eU6JTazaux6OKvmdNy+aOOl
         DicfFrpMhCRQyt31/ub/Xwh5UI13NVx50FUxIV/vx39V41pqdIbqP9A2O9qLJWaW62Iq
         LxjABbOBCTbeyDSTtMUODTi8BNTSRC1p1HU8XHYmfRN7j+q9V8iMjP2sccw1unRdj+f6
         vxKA==
X-Gm-Message-State: AOJu0YxU+eMlHxpjoQECV68H0lxxehODLMdP9IZux7eO0KazxpiGGib8
	Pt7Hk5zx8VWxgwaqrAq4NyDjUv30xW6A5HoO7KiYUscDqlzJYDWUqPWdlH1GgAeolg==
X-Gm-Gg: AY/fxX5q89jIsGGxjQz6MTB9nOgbet96zjullEqK+W6nsdL3uFY0aQG59rMSh6xqa1Z
	r3pUsFbPE5b6SplFb1L7orYL/zeyTiJQPwJkItaXhtfRMY62DsaSKeT6a29N4LiBbhG+2kO2DZX
	j0PS/Y546OVljNEI4dr2sB7x7ydmDCd8kS/RBAFOrFPD8zIUCE7qdooRmBf6YM64RK97vyySrdb
	wcQCwW3eADUVpBoCveGcSl1Tmh+0Rb9g8U8WM8K2fZea5MQHinKdJHNP4/JiJgcdAlve17lDe75
	25DwXHO6o0XxsLytloANuej+J8qzLoWrMzSJ/7hAz3EAk/LbbpZ3ehabiYN29YoZhUXTyHRTFis
	VhKs5lmq27bg1puH7WiW8tvFWYB9AJvgaPCNovW2nMhve2oCFy9LR/JKiV1dYyjtSfh8gP2WBDR
	c2oP9I1CjT4PtNAlfzaNp4GNQE63iXBE6ZrnQFkq0t5wCHJsls90dPXkYCM+tFMyklLuqaBC7aQ
	2s=
X-Received: by 2002:a05:600c:548c:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-47ee331fea0mr22119775e9.13.1768389126817;
        Wed, 14 Jan 2026 03:12:06 -0800 (PST)
Message-ID: <c713530f-5f54-44e0-9f45-8df8329c7aef@suse.com>
Date: Wed, 14 Jan 2026 12:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me>
 <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
 <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me>
 <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com>
 <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me>
 <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me>
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
In-Reply-To: <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 11:58, Milky wrote:
> Just wanted to update this thread to say that now another T480 user (the T480 is a very similar model to my T480S) using the release builds of libreboot (as of 26.01 RC1) also has the entries missing from the ACPI tables. That discussion was here https://codeberg.org/libreboot/lbmk/issues/394. So this confirms that I'm running a standard libreboot, rather than a bad build.
> 
> Do you think there is any way to avoid the underclocking issue with Xen on such devices/firmware?

In principle there is, but in the absence of ACPI data that means holding model-
specific data in Xen. Which iirc is what the intel-pstate driver in Linux does
(using ACPI info nowadays only as "auxiliary" data). But I may be wrong there,
as it has been a long time since I last looked at that driver.

Jan

