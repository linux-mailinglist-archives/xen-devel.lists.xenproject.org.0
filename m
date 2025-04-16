Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D8A8B413
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955351.1349146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yJw-0006AO-Te; Wed, 16 Apr 2025 08:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955351.1349146; Wed, 16 Apr 2025 08:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yJw-00068Z-QH; Wed, 16 Apr 2025 08:40:36 +0000
Received: by outflank-mailman (input) for mailman id 955351;
 Wed, 16 Apr 2025 08:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4yJw-00067u-12
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:40:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7629091d-1a9e-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 10:40:34 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so67261945e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 01:40:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf44e9b6sm16175222f8f.101.2025.04.16.01.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 01:40:33 -0700 (PDT)
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
X-Inumbo-ID: 7629091d-1a9e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744792833; x=1745397633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jpgunm6uv52X3QNJzswTa4gAKlry5T3MKufXI5GqcgU=;
        b=guUMzU8EggZPpfAsegkKO6W6+ahT9Jo2QgCCPurFz1crAUQuRFnxje+aBh8VkeWKsS
         7awQfjxihHdpuWg04h2a77TqkNkHI0N1eD9KdY37CaVuooSXeRxUtp10JoWn6MP43RrO
         4gcnJCdKUj+ehpVWxm2ulUFg0QYSFS9A6lpRIe6JPdN2YTrRdbH5mkmpJFfK+ZyacMqN
         pTGaoceggnLuNIRdDqG0GtnkvclWErMAv3myBNV3VtHUzafYjdX4MIhdljFBxUnXQ9o1
         dWeZIhDxRtvytmHekKyt5AMrVCHw+DVJ3i+7MM77FM4Zn7nEglmQ+ynlbvwA+4SxPdUp
         N4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792833; x=1745397633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpgunm6uv52X3QNJzswTa4gAKlry5T3MKufXI5GqcgU=;
        b=ox8JSEpMijQMc7UB0a/dFZybrTbuPjHOHCSfAXT2hDx+5m85r/tEPd+h72s5r91ZGy
         bxEN/RZ5iTUdFSqIHjfFBE1eJRkbVF5fOe5wbs+Khv9/FwMbKSQbTdp3vPRMK794XscJ
         zrtyP+1y2jCMacMDrqWA8+aeYH8B4/H+sAmmrrhf6WhrF1b3A7tq/QCcOk3pNgJzAVGH
         kppCLtDzG12JeHTnF80amDP1dBEYbGX0wSTv0qZNoNcT5q123wMShJRD+dBe355CqV0e
         OGGlUjHWtgRTiOQorz8Cp9nivXCSoF4ge3Eqr5cFYl4HHMtg/AwlWBsWIBDCpnPn/F7/
         3wOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxZYbrCnG4vpYLRxhYX4S2OpEftj89YtgtoTgyOR/nFny2hx65bz7Lec+22ou3TB8S2M7E6pReEaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy06cf8U4BbYvbd0IaKvcTlVbJC0jqlTj/HAdELhCqwVrUbYL5x
	Cf6uMm/1rmCob8mZHPVGoHFgL5EdAfGeXCuqQcOlgyiTvknLSOai99sX+9JzXA==
X-Gm-Gg: ASbGncvvLFElGIENyXgv2KZTVhVtMIfKOArnrC3rYZq7aUPKyN0RnYtxdpQroyw/apS
	DzYvyah+5ebeBq6pL0AKdAbAaZasNVyaeEkDmz+Axn1Cd1GUlU7NW2cLsQR2s43AtI9KWpWpNQX
	U+K84+LUtnRzjNTZPxngTD2zPlgYg9W028KZLaKoKRQyphsKU/fcXyCqkAgzV/c40G9RabdMCrq
	qLBGfZ6S1xT4LCqL/ywbH9lPn2Q+xjRsEBYj1UYf/rvialrY2MQIit3aBC8CVIBHMYddxaNdZP/
	S3oNfcYecUmi/nOgrCxvtg3y7W83Qi5zdgNutsfM3YhggS/zef1KhQnEgypQx01CviqwxNyjzMv
	Wl9Qzkplc9HTAtykUv9cdnIFmCQ==
X-Google-Smtp-Source: AGHT+IGXl/ytS5yXZyL5QOgRdyvab4rP3ObRj6kipU+BmEptImjPdGkK+n3Slmoz671AuKvHJ+LiQQ==
X-Received: by 2002:a05:6000:18ab:b0:39c:1f02:44ae with SMTP id ffacd0b85a97d-39ee5b35dbemr1070834f8f.27.1744792833379;
        Wed, 16 Apr 2025 01:40:33 -0700 (PDT)
Message-ID: <ffec2189-dd44-45d2-ba63-992c3217438a@suse.com>
Date: Wed, 16 Apr 2025 10:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-2-roger.pau@citrix.com>
 <fdfed991-d95b-4290-ad98-025a789eecc2@citrix.com>
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
In-Reply-To: <fdfed991-d95b-4290-ad98-025a789eecc2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.04.2025 10:29, Andrew Cooper wrote:
> On 15/04/2025 4:32 pm, Roger Pau Monne wrote:
>> diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
>> new file mode 100644
>> index 000000000000..4495a04c403e
>> --- /dev/null
>> +++ b/xen/include/xen/io.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * IO related routines.
>> + *
>> + * Copyright (c) 2025 Cloud Software Group
>> + */
>> +#ifndef XEN_IO_H
>> +#define XEN_IO_H
>> +
>> +#include <xen/bug.h>
>> +
>> +#include <asm/io.h>
>> +
>> +static inline unsigned long read_mmio(const volatile void __iomem *mem,
> 
> void *__iomem.  (i.e. without the __iomem in the middle of the type). 
> It seems most examples of this in Xen are wrong.

Hmm, perhaps in turn because I don't see why it would need to be that
placement. The attribute describes what's pointed to, not the variable
(or parameter here) itself.

Jan

