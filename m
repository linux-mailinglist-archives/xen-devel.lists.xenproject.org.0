Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FBA81D00
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943338.1342112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Orm-0006Hk-3f; Wed, 09 Apr 2025 06:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943338.1342112; Wed, 09 Apr 2025 06:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Orm-0006FC-0w; Wed, 09 Apr 2025 06:24:54 +0000
Received: by outflank-mailman (input) for mailman id 943338;
 Wed, 09 Apr 2025 06:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Ork-0006F6-Ig
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:24:52 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5813bc8e-150b-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:24:51 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so62505105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:24:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm5551805e9.12.2025.04.08.23.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:24:50 -0700 (PDT)
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
X-Inumbo-ID: 5813bc8e-150b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744179891; x=1744784691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u3b6pw/VBcCbVgoI4N6yH6vHCYrc1+ixpm/H/ou6EoQ=;
        b=DIvO02DKvnw7bdMdvUCq09Dtn2PUt5cDZQMgfr8JNUf9HbpZPamkOvYK9QcyWKV8er
         5Mckj93Ifx2+7hlgPrH4j5m3oXKl4dT0TXdOwvNPRMZDLJpEx9jkuWq2yt56MF7kHAQm
         rPJPAbnX9qNl1VZUYWsIRhxzuu8gb+XsPo2xETrpNBQYz7elVWKWWT6d1Np225YrPkqO
         FJeR0kPMEsalVJWbVrS5fJUi93kGH6XfJF+aPaBs6+AqTG/dGhROXVrKXbSkocvkQRfq
         yITxamOjrLWxDHuTiVdRBT3y3IoXpju65TVWMA9Qw2NrvTQ2DSBnv0Fc2cYYh8jPm6f3
         bIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179891; x=1744784691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3b6pw/VBcCbVgoI4N6yH6vHCYrc1+ixpm/H/ou6EoQ=;
        b=bVaBphofdg5y7Aytz5X5V9U7si7RXuZ4FhmUvzIb6JxArfaw1YE5HQbOvFcwy8I6mm
         f/xeB5exIXXo4xMv9oU9kTYe1HDegf9xcIscOHrmuZrE+hxmc+migvL5RFzVeuSYKMyR
         5XW3IKsI44DDb/RUeYgatS2ZIVWOqwvIpwJNCS9vhwoYEA8BFGAYW8xU7NJl9CY+S/6o
         9hrHYiwefeU7Gyq1rO/0Q0PO9kJjrk1PyJs6xLlKLLIaIqKl7jK41GHlTypcJys4e0qn
         oXg5JWKf76ZccG+pPWikdzFUAh6j60mxkYlcRR0v/y2xVRHsxPhd3LBB6PxCGudWDomw
         SdQw==
X-Forwarded-Encrypted: i=1; AJvYcCUAYi4Za8dgJNODcRry6DU7SgID4sNwaENuISZ/xN+UuQTY256kGgZArjIczQNoEmUUDzZdLbAnYhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc01L0x/q1ClX/RYJqztRre7/sUkdR6ACIw7Ie3K3l4NaYSUzT
	lDjDim4z0xiVgIgaZWymcwAgSOCfGGAH6S0ihAXVIAcREzpGfFFerDjVoxS9bQ==
X-Gm-Gg: ASbGncu7e3vQ2FgfHrfATU2+A4L2GAznCUF5EAHK6gQoArWjqhix6lZsVtOQ+kWu4xC
	ifV2UyEvsawqkkdjgD0blfmMGMA+78ST+wXvUabD7NoKp2QiFrOfgZOy93yWVbeVeI9thWcEcBq
	MfEUAaDHRMfEoQS1zmGIdXH1c45E0Rz6PnRvyhVf65KjwRRG0gORpWU84OkC9mV1V5gnCfep7m+
	HFdEQYNqBsdbrvGD7XP2TkbNS/iyDmvNlDZ1JeaS+Ck/CQ2UnzFdpZUz/fs7bmxSiSp+5LQkJHN
	DMmSKJHCTZRhu+UT92j1OknR4jdX8gZRJ6kuQ2xAuWohZwxvQbQLWOzE/8N7Fupuo1lAu9OeEGB
	Emj2EAWP/qGOfeeHtqMibXKzmyw==
X-Google-Smtp-Source: AGHT+IGuD6vgVpseclADyY31fliCvb70brmZO11SDwWjsQmtNdG10RlHiyrg4I5xrbCvczrvTxMKfA==
X-Received: by 2002:a5d:5987:0:b0:391:2c67:798f with SMTP id ffacd0b85a97d-39d8856159amr867346f8f.41.1744179891091;
        Tue, 08 Apr 2025 23:24:51 -0700 (PDT)
Message-ID: <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
Date: Wed, 9 Apr 2025 08:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: Alejandro Vallejo <agarciav@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> To begin moving toward allowing the hypervisor to construct more than one
> domain at boot, a container is needed for a domain's build information.
> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
> struct boot_domain that encapsulate the build information for a domain.
> 
> Add a kernel and ramdisk boot module reference along with a struct domain
> reference to the new struct boot_domain. This allows a struct boot_domain
> reference to be the only parameter necessary to pass down through the domain
> construction call chain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + */

I wonder if the 2024-s here shouldn't have been amended by 2025 now. (I'm
also, more generally, unclear about the purpose of such, especially when
the file is really small and simple. It's only going to go stale, as we
can see from various other files having such copyright lines.)

Jan

