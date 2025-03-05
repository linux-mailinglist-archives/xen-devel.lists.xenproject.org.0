Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6655A501E8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902352.1310303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppiX-0004iT-Bp; Wed, 05 Mar 2025 14:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902352.1310303; Wed, 05 Mar 2025 14:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppiX-0004gC-8a; Wed, 05 Mar 2025 14:27:25 +0000
Received: by outflank-mailman (input) for mailman id 902352;
 Wed, 05 Mar 2025 14:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppiV-0004g6-TZ
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:27:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f353db81-f9cd-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 15:27:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so6161025e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:27:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844adfsm21301021f8f.62.2025.03.05.06.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:27:19 -0800 (PST)
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
X-Inumbo-ID: f353db81-f9cd-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741184841; x=1741789641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9sIw2UWz4vdVdKiu9aIpEhwlEcPnMCoW/Yp+dEHOPmQ=;
        b=LftfVcDefidEOep0HBydxZs3MDrpQGxG5Xpzzd8H2FzyP88Q+vQVmtnEy6ftChnvz0
         Mgf9zzBofAx1g0apcygU2wm6kauYvuITiumuVod5O6jhr4pHabSZm9kieNp6qH5Q1Xm/
         5aelnAqaaaQkigRChVZVFek/LwdbsUYOLTSBYH0ux1n8XzpbMaaYn9ey5+pFd4RJSL+s
         3M0qty1GPwomWFQLnjeLh3Ok/vFVN911gzA22IO5atC17udfz5WX5fiaf8pPnp84yCHc
         4tui1FmsfbyES1hcutsnNQpdjSeeRRb8Rdw7cBP1+kyzEXwZ0AVnmtr/396m5yw2t1S5
         DqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184841; x=1741789641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sIw2UWz4vdVdKiu9aIpEhwlEcPnMCoW/Yp+dEHOPmQ=;
        b=NxsrFwLHLoSpiXyfR0ag9kAdNtUF+pSZ8l8OxgCcSUXN3Gv41U88m01FHIvAEidGDD
         A3dx9IPIphwBY9wklls9o2UPKmEXnjAxz39s6r+CdKWpiIJwxxR4vPqu2zG9tefMk/J5
         qlv1aPIcdUnOUMqw9Z8EeghtM7t9JPy1veK6zPsU4Jl8GMxSKLdWsrIXDGImD9wKtoCy
         O4TT2u9R+Zzm4aBfMvmGFvGRORhoksygPm/xB0hrzZYIoqFx8ijBcbqPzIo2J1hXh/me
         2tI8JkhutyUoQMBOpRpQSer23+oLp7U5iDfatlseIHE1MUWZQIFluKIwvNxXQQvcce2X
         czVA==
X-Gm-Message-State: AOJu0YwqCv75epbfsW/vkDkakQJS/WtiTd5yej2By+IhehMlET8XfZaz
	foIQsP8pjv8Ts5XzHwP/N5FKDcxhG9IEOs024ClDTY7cX+B9iwl3PX0+apdYHw==
X-Gm-Gg: ASbGncvVaBNiu0+TaBNRVprs0V6PlnmE7HD5mjxSvLqUa1jzjLSmq+Nr4NsxVL+4eSm
	PK7QKsKmVOrFvY/UM4U+I9cH184B1T2hrD0zteZ41xrPoLfaxjdL//sq+novYpRcObCdGmuzq98
	XD729uqv75veD7BEpv7lBbD2zo9bRRwBG0rDV220/H5aXoDEPkKsit8KU/68BWOLkjscDZk6Ygk
	DozXDFWZzwPKzvRUXr7jwiREQjVMBHTYzio7pv5MK6+HC2Gknzd560Nx0+2YNok+8//4/l0H22+
	I0fi/WNUlEztKlE+hA0Qob2uqXRgivMtH8pK2OqUbn1mvteusRrNLWyHNpEP9iXN+voMFbssieg
	tbM5FAfi8dJDdkhY3O8C07PbqKjNVBw==
X-Google-Smtp-Source: AGHT+IEKF0Hz52aBLt1Z1EEzQ5bERkeRnhMQfHK4nS+CMQclD62q151O7xkZmdKFQO/NSYf43tgHNg==
X-Received: by 2002:a05:600c:310d:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43bd20b5147mr27975415e9.7.1741184839775;
        Wed, 05 Mar 2025 06:27:19 -0800 (PST)
Message-ID: <db3113a1-4cae-4d2b-8840-645f56af3c51@suse.com>
Date: Wed, 5 Mar 2025 15:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
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
In-Reply-To: <20250219164840.94803-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 17:48, Roger Pau Monne wrote:
> Hello,
> 
> First two patches are preparatory changes to reduce the changes required
> in patch 3.  I would have wanted those to go in 4.20 to fix the issues
> on Lenovo Thinkpads, but it's too late now.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
>   x86/iommu: account for IOMEM caps when populating dom0 IOMMU
>     page-tables
>   x86/dom0: be less restrictive with the Interrupt Address Range

I'm uncertain whether to take this and "x86/pvh: workaround missing MMIO
regions in dom0 p2m" for backport. The sole Fixes: tag is in patch 1 here.
Thoughts?

Thanks, Jan

