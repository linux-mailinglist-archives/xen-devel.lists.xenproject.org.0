Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35810B51B22
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118459.1464233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMVs-0008P6-3m; Wed, 10 Sep 2025 15:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118459.1464233; Wed, 10 Sep 2025 15:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMVs-0008Mj-1C; Wed, 10 Sep 2025 15:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1118459;
 Wed, 10 Sep 2025 15:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwMVr-0008Md-0S
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:13:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b79f7a89-8e58-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:13:34 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so1300650766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:13:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078304716dsm181620166b.12.2025.09.10.08.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:13:32 -0700 (PDT)
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
X-Inumbo-ID: b79f7a89-8e58-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757517213; x=1758122013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/ASnHQArI5LvrunbEBR5tVoOsDlVKT+G13H/FwoRxc=;
        b=Qr+++NF9JfRjTNkxXlc28mMIhVzlvKFycn8R7gKO4XYoRcEJSluoHlorCzMFP8zagE
         35ukuKxEh9veWAJfA3sD7Zj3+5KvIzsgxpitgVWTWH9CLQmP/ZneP39WJmVmOIJIjPQI
         gouOrHVLzq0RqXuKpc9ZgFMzyR9py4dJxPMy700RKlbA1q7B/pFY+E/F6B3tBRWPfC+9
         OqaN4WtSlvfp5BZxbeOm2NhRqNoOxaz3kEb5Q+w/abYJ/K30VbwefGaXEeh09wCXjsBY
         7fQfDDmyDJD8W2scfoEPK+Fked1NP6RaUyOPkce3Gznh+coOW2Gtcz52/NKglHdbwTkR
         /r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757517213; x=1758122013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/ASnHQArI5LvrunbEBR5tVoOsDlVKT+G13H/FwoRxc=;
        b=EBtCcilgoAgeN34AZ6ADcJpvRWVNbeE2PcrQKKnrI7kyrshTDiXUFeDPbBnSyO9IXH
         1dnkV+I6ODaMrzF6bTtANwn6K//ZuVNGL9AjL4uPvKo4HMqsooCoJpVUFVVNYddj1zCI
         CADLMAZcnOk1rXwjdEw+wbDddG2cLuM6f6lkW+jtsYBE+6SOsLtKSAbIlZpk8dcOucY/
         DQM4GJukl9egzZMILq4vvRSK+9s/ySS2KlfoJkRYuWsl12UaYweLJ7EqjVvgKzmTAkAH
         Vb7T/C7Wh/EhEq5uehKu0wBCCFgHYRxL3yY5KyXxyq17i4MJH/HhDCGV+pYtkJcJO1kU
         MT/A==
X-Forwarded-Encrypted: i=1; AJvYcCXGMVQmeAJMbq+4h19GG+NFdaAX6N/EvKT+4/KzE9T4lJupGSura9uc27udXhqDLk0wse9cYPd+KEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqCH2kqMAME+1hyl4svN8RtMnpi7bBXpt8f1XkgPTxjUmul5Nc
	Ey0Vo8qI8Kaq3+6Kdl20PjhRGf0d6Le62o5B+emz2K/O+gMbHCorB5S4b5FyewIrHw==
X-Gm-Gg: ASbGncvij7CVSxN2gwiqtXnRX2jeFl7yefCANHo8V4Ni2I3WIw1H2duGI2hMjXe9qhE
	KevpyUX+7eWedREIWzZVCIDYx+t22WAxX/YSJ3Fg7YepZZKhKD7nnXjCWYBc/c5vB9DX0RJn8RJ
	UBT4WxTLzzVmpyrw3yiyRVhHejpzvLTHJucJZWElVL4fKIsUX2EB08l4TK0Mb8DFAayze1yLp8P
	0reUD3ArfQWAL3dym+buGn7nf8qEoMhZ5Ak1y5CTv5N7cXlyT/wgjc5V3DFq0TRfwn6BWMBM1kd
	FbexECVO2M5E/9XC4gMSP82gW6OPTz0sirH4d/lftfIyYjABEmWvD5q71VjQzV/jiTbkoV0RlAV
	DcXFdtduilLnn49COLz2u6a0Ua/YEeVkkq/0JP5OBE2YjiDK1bLy6kHJOmSIsOgh51kBzNGLXYE
	nWv01CMG9aBVLkHVFAvQ==
X-Google-Smtp-Source: AGHT+IEmqT/lUXyiN8ceod6sU/U7EFtrMnM+e5fk6fD3+1ukT9mha5Hv4iZoX4ARNXq2o/UHiFp5jQ==
X-Received: by 2002:a17:907:970e:b0:b04:6858:13fb with SMTP id a640c23a62f3a-b04b1663673mr1575365666b.36.1757517213033;
        Wed, 10 Sep 2025 08:13:33 -0700 (PDT)
Message-ID: <4be69331-8002-47a3-a2e1-e34b12a5c5bb@suse.com>
Date: Wed, 10 Sep 2025 17:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Function domain_soft_reset() is responsible for domain soft reset domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS
> Tracking its calling chain, and the following functions shall also be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - grant_table_warn_active_grants()
> - argo_soft_reset()
> - arch_domain_soft_reset()
> Wrap XEN_DOMCTL_soft_reset-case transiently with CONFIG_MGMT_HYPERCALLS, and
> it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - remove unnessary wrapping in stub.c
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap XEN_DOMCTL_soft_reset-case transiently
> ---
>  xen/arch/arm/domain.c    | 2 ++
>  xen/arch/x86/domain.c    | 2 ++

What about PPC and RISC-V? They have the function in stubs.c, but not adding
the #ifdef there increases the chance that when the stubs are replaced by
real functions, the intended #ifdef might then be forgotten to add.

Jan

