Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59288A31F81
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 07:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886137.1295822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti6cd-0005Ra-80; Wed, 12 Feb 2025 06:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886137.1295822; Wed, 12 Feb 2025 06:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti6cd-0005Q1-44; Wed, 12 Feb 2025 06:53:23 +0000
Received: by outflank-mailman (input) for mailman id 886137;
 Wed, 12 Feb 2025 06:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ti6cc-0005Pv-3o
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 06:53:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08b539da-e90e-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 07:53:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7e9254bb6so172346066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 22:53:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7cae13326sm458952566b.115.2025.02.11.22.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 22:53:14 -0800 (PST)
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
X-Inumbo-ID: 08b539da-e90e-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739343195; x=1739947995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zUdjh6v2wfB250eT8s3roIt8Qtd79xlup5Duj+e/Gc=;
        b=BLj0/UclEOkpX/gTefHoNAoGG9ijHLnJXTqAdc9bcTWeCTzazEW58ouASHlGiLPjGb
         f19S3fi1NW+3I2Cu5qCY77lkPsw71Cm+9hX52b7r5wa2iBzBuyn09thsgbdFTKwRRQUq
         QjxU9F2+T6St7La78CxDXuEk5QI0ab8J/+iNVm0S5mmv88lvdswlj7qCPUZRPK8ZLOzt
         KOoFfu4mxDqhzmV44+XsBPcSt2aC+2zBUPlFwMoLo0Pv7wDn0CUzZRVpkqRZSD0ijPfn
         joPWDyKadJKXuzFb/6CxIwMimtcnwH8nQ3X0uBVb+2C8ZUaDDeABNKX0oftGMD6j+c40
         8qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739343195; x=1739947995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zUdjh6v2wfB250eT8s3roIt8Qtd79xlup5Duj+e/Gc=;
        b=OwkdSgluIW1sUoHlFBvKdEZG1Ry/H/rvTp8Gx72udgxVb6zLayZka2gK9eACKAU+wR
         f8TkcnomC4XLC1HtO20dL1AKOBEtSZQV95pUkXYYhF4biwumEhiEWX4fxA+o5KNxm6EU
         X2U/r4zTXkNnnRZ31FFaljEZoHLsB0VUEqxJJ7j2bxCm3hV8n43WHE2KnWogaC2C221K
         hJQXEr1MsCooxbrjHrTB5pDyy5J5m+Jh/2FfXg53FLpctYXmJsuac8vIDchwLzVo+KoF
         HMCpxqd5iqH2ZYWfad+olOlINMJXYVJz69q7hGGBkrnlt05j4ti5fSJwm5nvXFY/dNzt
         saEg==
X-Forwarded-Encrypted: i=1; AJvYcCViYqzC3Uc/igMAWuEWmojvhcl6MyMQXy8+LhKhDwqgj5pvbd2bzxAdp+GJqhK/k6ckYpW+59yQCnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHNHEAmm/dYdu3y8BwHUYrIuFArheVKWFQRdTQpS50arLfFgLM
	CuHPgZ50qy11EHX9JMLQB4VIxfS6rYbYE5hUnVISe2bBkZCSkF199s2Ire1PuQ==
X-Gm-Gg: ASbGnctD0Rn0zZ53jYIESigLiUTEErbK9p1ZNZcaCdhgGKFFfX2y3bpz7KG3h66tnxs
	obUGts42nQ3DN1b95gAzOfjY3fo0CXFWniaeScVZGsfDAI3t3q7D+rhrQl69nFDLegIIYlbMDiF
	aVBHaPezCRq4KmW2Y7NJaRuq4kqfj7QRBMtCVYNddTvhV66LwbBLMMVx0qdKZCSshWfh1vDfyni
	8a/IAnzrQ4XvTSTHdy8V8IjSI9IqeAzPjfFic5npN1oa6OhXZ3WIWufN5OpbsslypK4HFjbYJ8f
	rWaTk6lzAbDwdRyBJYJHwtmEiAo+PlanYD081rdLpAVefqTLc74xETBWM2EFhRs7w33UOW3new7
	I
X-Google-Smtp-Source: AGHT+IH7szDJ7r/FLs7HCSZgQOG6ClTKkQlnfHrZmIaLFikv1S6Fh81Vo5LwUTuyR2T+FFP/nHdGEw==
X-Received: by 2002:a17:907:2da1:b0:ab6:f06b:4a26 with SMTP id a640c23a62f3a-ab7f33e0e2amr203666266b.34.1739343195217;
        Tue, 11 Feb 2025 22:53:15 -0800 (PST)
Message-ID: <5255102c-de9f-4cd8-8311-5d5b5eb26832@suse.com>
Date: Wed, 12 Feb 2025 07:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/swiotlb: relax alignment requirements
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-2-jgross@suse.com>
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
In-Reply-To: <20250211120432.29493-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2025 13:04, Juergen Gross wrote:
> When mapping a buffer for DMA via .map_page or .map_sg DMA operations,
> there is no need to check the machine frames to be aligned according
> to the mapped areas size. All what is needed in these cases is that the
> buffer is contiguous at machine level.

Is this really true in all cases? Can't e.g. compound pages make it here,
with the caller then still being permitted to assume higher than page
alignment? Alignment checking in xen_swiotlb_map_page() would perhaps
need doing with the base address of the incoming page, i.e. excluding
the incoming offset.

Jan


