Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2259A3A1E4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891953.1300959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPyI-0004vD-0u; Tue, 18 Feb 2025 15:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891953.1300959; Tue, 18 Feb 2025 15:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPyH-0004s3-U7; Tue, 18 Feb 2025 15:57:17 +0000
Received: by outflank-mailman (input) for mailman id 891953;
 Tue, 18 Feb 2025 15:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkPyG-0004rx-BZ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:57:16 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05308b42-ee11-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:57:14 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abb7f539c35so642749166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:57:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb961594absm454785766b.111.2025.02.18.07.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:57:13 -0800 (PST)
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
X-Inumbo-ID: 05308b42-ee11-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739894234; x=1740499034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A7N9A36/htFLzAYOHrv1EF02gvrGCDgUztfOt7BT75A=;
        b=BdCOXy5XjVy9uhfo1PspfkB+11t4fHdt0yoIvZzeVRLBkVpEMWz/hAbhHUQ7RdERGs
         iA51OuN0y0JVkIE8emtTa7HYx092A34xNKkwiEEsC+8yQVDcBhmLFxTIXC0qgfBNlP9h
         qyXLkPA6PRPQFWR9/N1jSAldZaSgsR2M2Case3WOSAOaXIgaG3S2hUYDQPr/45oVgm9P
         23IzzBiC85BT+UKtRIRERePlJoybz22yGBTAqgPP5fWD7PpvEK/B1Xa1conj4PMT3bF3
         6DQ8AehBz10WQhVJBi9Bx1YX3zZG+6h7qGGLxH68SfU0CZ5wn0o2rr5goewpSCOAOVB7
         LcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894234; x=1740499034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7N9A36/htFLzAYOHrv1EF02gvrGCDgUztfOt7BT75A=;
        b=YLoE3ryHwoIdVm/GX1Blh9GNIk8D++htZstItYByrARpXMyajRvQOWwLTktkwTLkgB
         uktyNAxhoVZxw0Dr/HFi5dRK0PpLRgLfARQ5Uy142oSaEoPYL5jzaRIj/IwpOByWnWfK
         zt2ivomIGh5doBh7jiYQgxZFuh3L1tCWcYvvZS08wTC8y0AiU1qJijZS1aakYJnL2qIS
         0QJviu4uAfODyVbQve7oly42mQnxMOtedQdpwUdOAOqlYwDjf5DKrCE9/cWnX9fKFSCJ
         8a40fvIQBRdvRQonmtNXNAwr64WLDo+57z7ECtupFjvqcJEjbuaYU8GxNsgooTOzsQcp
         rrLg==
X-Forwarded-Encrypted: i=1; AJvYcCXyBD68u+YKTAK4R1tVeT6OIIRQr4tSlT19eAZ6b8EM7E8kpSj7Li0AH6XldPdIgfjxli7P1Fg6KAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpdFrogJAMUkR7Thf7jFo8dUlqRXIdLi3klgE/zvA5WUjkFNWs
	41RIEVoysNvk9rEB9ntKLmLKKJmTtEO/D+DGJYzeWHnTCojw8FLEsgvOgvNdPw==
X-Gm-Gg: ASbGnctEQ656irycaRqnaiAOrtphsf/Cs24sP6QH9Bt2dxJ37jKyCh+U3LGhax/ovU5
	lgps2zNyWuWejzSKeMDc48OmGNPAsEjWzwBiqkZkefcqD75hqP0Zlwn5GLJB846rdWb1liWjvVE
	P5l5roxOUqHiUiI/i/KQMQqD29cjAO8jF4IG7OsUNGsTcMGplsnB8jzqbtpIM7+vBYBGJRMEAAt
	ZWCNBUGk83jeuzhl/qlRLA3n3XOX7dWy/+sG+XXedUezzS2gI6YDYBgTlwO5h6xwFc69YliuwHg
	vofAKqZp6lxWlOSWbhqcvZR3emcZ2ZRnO6dywMsJlGXrObShvPI151N6JCXkTH5BIrXy2jaXv+w
	P
X-Google-Smtp-Source: AGHT+IERSoj1bgThvpbHIp+crMSazmUYNPnM1+63KK0BnT3svP3xCr5+vlYdaYcPVxak7EDGcdiNJw==
X-Received: by 2002:a17:906:7312:b0:ab6:ed9e:9739 with SMTP id a640c23a62f3a-abb70d9ecc3mr1465601066b.42.1739894233578;
        Tue, 18 Feb 2025 07:57:13 -0800 (PST)
Message-ID: <dc48b962-b156-41b3-8951-af1df9c82ba0@suse.com>
Date: Tue, 18 Feb 2025 16:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250218143504.77638-1-roger.pau@citrix.com>
 <20250218143504.77638-3-roger.pau@citrix.com>
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
In-Reply-To: <20250218143504.77638-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.02.2025 15:35, Roger Pau Monne wrote:
> When building a PVH dom0 Xen attempts to map all (relevant) MMIO regions
> into the p2m for dom0 access.  However the information Xen has about the
> host memory map is limited.  Xen doesn't have access to any resources
> described in ACPI dynamic tables, and hence the p2m mappings provided might
> not be complete.
> 
> PV doesn't suffer from this issue because a PV dom0 is capable of mapping
> into it's page-tables any address not explicitly banned in d->iomem_caps.
> 
> Introduce a new command line options that allows Xen to attempt to fixup
> the p2m page-faults, by creating p2m identity maps in response to p2m
> page-faults.
> 
> This is aimed as a workaround to small ACPI regions Xen doesn't know about.
> Note that missing large MMIO regions mapped in this way will lead to
> slowness due to the VM exit processing, plus the mappings will always use
> small pages.
> 
> The ultimate aim is to attempt to bring better parity with a classic PV
> dom0.
> 
> Note such fixup rely on the CPU doing the access to the unpopulated
> address.  If the access is attempted from a device instead there's no
> possible way to fixup, as IOMMU page-fault are asynchronous.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


