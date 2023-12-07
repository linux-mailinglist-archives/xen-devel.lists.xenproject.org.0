Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B78808A71
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649925.1015068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFJm-0001Ez-DL; Thu, 07 Dec 2023 14:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649925.1015068; Thu, 07 Dec 2023 14:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFJm-0001CM-9t; Thu, 07 Dec 2023 14:25:34 +0000
Received: by outflank-mailman (input) for mailman id 649925;
 Thu, 07 Dec 2023 14:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFJk-0000sw-Ii
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:25:32 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a385845-950c-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:25:31 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c07ed92fdso10571065e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:25:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c3b0300b0040839fcb217sm2098214wms.8.2023.12.07.06.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:25:31 -0800 (PST)
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
X-Inumbo-ID: 7a385845-950c-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701959131; x=1702563931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LK3aU+IE74DBGiLYeMIGSywXdUlhtB3z4/TDWTSPskQ=;
        b=cyjy4vhWVXIfF+Whmpcx6gJ1Tj4UokFY9fSYhoceH38NJng2b/i16z4Wj1KsLA6EF7
         7U5nN2UatXVg1JZMaEAXjDGNBtJnmCLIllVUVFZ3DxoK0eFaicAwPl9xBlaiwjqcbxOV
         bfDsQitsVigS1BpDpPekfCYFon1O0TkCVcH0olInIAu8/4PPVYagGEzVqS1W0laUfR14
         OAnO4foxVmaXp1fh0i/S5PqvRhhsJiIA8AYPt3lHzQA/uwmOLs6a+SIpo+ZP86FEDf5f
         a/fLZhuODQlo7mMQqJiiNzNkBq41//Xegnpb1QLN/rC9E8lYuRRA5M8W8PXhynrALY2t
         atpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959131; x=1702563931;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK3aU+IE74DBGiLYeMIGSywXdUlhtB3z4/TDWTSPskQ=;
        b=f1k1mTYTxsKPT7Zd9U1y4aN6BHIq1XDksflXQ2t2PwO2YIywJ0Xjn4yRHdVmABIrKF
         G7+ucwhSQ/qzTrlcvOq7AMjo/GI9Ql5JJRrDAVQALLrGfywQGZtrA6rFyGLVLMBbAOUU
         CvrhT58L5nwVzymOXL1lpfaoGCpE752fQKe+8MbniZ4UO2mxJvXuEjtNhMLiGJN1bYyL
         UIil/DkGUDKrtpwPNZLEn7BMKNsk4Wpf1BaokX11jdIb5yZ5B/yzKRDJgf0Ny/9geuZU
         UnlZc6NWoM4t4ep/vYRieOFF4Cz9AzmHCCND0jBOtpCj9RW1/fRgfHg0zyR7kuoKONFC
         cjhA==
X-Gm-Message-State: AOJu0YzMz9TS8Hzb4b5vtm+odnWHxSOopuvqcIlR/RddcvHUTRdLURv4
	r/YiXYVd/Ebv9FUaMs4Xs0aP
X-Google-Smtp-Source: AGHT+IGO+7LOWmbKSIv/7mxeafLXyV/z0K/CY/EpYw584y4q038vgORasPs2Lx1o5mH3O4ocJPq97A==
X-Received: by 2002:a05:600c:502a:b0:40c:aa3:f6a with SMTP id n42-20020a05600c502a00b0040c0aa30f6amr1653651wmr.173.1701959131416;
        Thu, 07 Dec 2023 06:25:31 -0800 (PST)
Message-ID: <3f43ced8-9437-4e88-a84f-0dd4edcdf5aa@suse.com>
Date: Thu, 7 Dec 2023 15:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce asm/cpufeature.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b8fcdd22462ffa71a058e63dbf874dfc858264df.1700761381.git.oleksii.kurochko@gmail.com>
 <3959501d-9696-4791-bf04-d394af255bd2@suse.com>
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
In-Reply-To: <3959501d-9696-4791-bf04-d394af255bd2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 15:19, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually - with an SPDX header added. I only now realize that I
committed the earlier two patches without paying attention to this
aspect. I'd appreciate if in the next version you could include an
incremental change. And obviously in all other new headers such a
comment (and perhaps also a formatting footer) wants introducing
as well.

Jan

