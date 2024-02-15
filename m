Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B6855EDB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681467.1060246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYiP-0007be-3a; Thu, 15 Feb 2024 10:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681467.1060246; Thu, 15 Feb 2024 10:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYiP-0007Yo-0I; Thu, 15 Feb 2024 10:11:37 +0000
Received: by outflank-mailman (input) for mailman id 681467;
 Thu, 15 Feb 2024 10:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYiN-0007Yi-0j
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:11:35 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a0865d-cbea-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:11:33 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-511ac701428so761169e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:11:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c1c0400b004120537210esm2448089wms.46.2024.02.15.02.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:11:33 -0800 (PST)
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
X-Inumbo-ID: 98a0865d-cbea-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707991893; x=1708596693; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwzZFR6sa3lUvrnWiTVsUEQMXzcywTGe8DNCW4tzka8=;
        b=EGtBQBSqhxmoFd4bhTZLwhV/oBT9S11gBNjAl8vcpXf/7Zz8GYl+eMMpIjHE3H1dyh
         ovEhY7ULkYO3JJ52kAcyCYf3yFp9ZKQuuClT1Te7A8E0hMz+tZfwUxl96wr2wf+rGQ7l
         6CmBPYgYvXKZyXw6lNk0/k9QRjkOj8vWBVwTnRRFogexmTQe9Fx8D5mdJHQq6bESNJLe
         ESPDTskdBUdGSixvrJV8+JDLfnjSaFOXpwcfoVMgxNl+zejsWF7SmW/miKQdt5RatMV/
         CaAWSyOVaLI2MbfEbeaMQcNl77ERyYwPbLrHWZSvOM6KPvbzHMSyH3d4zBHPj4D/zw8B
         e/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707991893; x=1708596693;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwzZFR6sa3lUvrnWiTVsUEQMXzcywTGe8DNCW4tzka8=;
        b=L8mfYN1p/TjaTWxvex6+kpkfi4E5BkHcPLrxuZy0F3oVn++UVne4EMegptHXp/gGgK
         kymgwF3E1jFRdCImjbe7W+J6MW+nR2o1CKlnNFiIvjQTCjqufGfSXXid6b2dYuTF3xK5
         1HwaUZnsYRDHSFbEIA60VpTTo+wD54a23338Gx1Xrl3ZUs4ybBHV3wpvzruFelcOtx8u
         30lIHmNRxf6ze9HdF7cO8NLJTKfVQ6iY+ENvCH4sBF5r+xU5FP1M1lgYRS38JpV4NZSA
         wz6UDwlrVKKr54QNARxN72pX3uR52oLWWjxJgpV9rdPyGBR/b6i8EcSExZLShrTrtdWP
         5g2g==
X-Gm-Message-State: AOJu0YyvES9xB9oDhV3Fzg3c790MSGLFhKUv0m2Tp6JEzinwRsgvTeH1
	i0CjlYMavX8mhWnuaXc3XU5v6YeNnsr53oQUpFl8B72epVQSQgD+HNxVW0K1K+6mUHwInF4yus4
	=
X-Google-Smtp-Source: AGHT+IH6B92B0cHZFgY2cjeJdM5Dm805rozF/wMA1iYSrj1ucGizwEwHh4LQOqsPBxOwqNVRtgYA2Q==
X-Received: by 2002:a05:6512:447:b0:511:9e20:5fd with SMTP id y7-20020a056512044700b005119e2005fdmr832251lfk.59.1707991893434;
        Thu, 15 Feb 2024 02:11:33 -0800 (PST)
Message-ID: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Date: Thu, 15 Feb 2024 11:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/12] VT-d: SATC handling; ATS: tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On a Sapphire Rapids system I noticed a line in the serial log
indicating a DMAR entry type we're not recognizing. While arranging
for it to be both recognized and respected, I noticed some further
potential for cleaning up.

01: VT-d: correct ATS checking for root complex integrated devices
02: VT-d: tidy error handling of RMRR parsing
03: VT-d: parse ACPI "SoC Integrated Address Translation Cache Reporting Structure"s
04: AMD/IOMMU: add helper to check whether ATS is to be used for a device
05: IOMMU: rename and re-type ats_enabled
06: VT-d: respect ACPI SATC's ATC_REQUIRED flag
07: VT-d: replace find_ats_dev_drhd()
08: VT-d: move ats_device() to the sole file it's used from
09: VT-d: move dev_invalidate_iotlb() to the sole file it's used from
10: VT-d: move {,un}map_vtd_domain_page()
11: VT-d: drop flush_dev_iotlb parameter from IOTLB flush hook
12: PCI/ATS: tidy {en,dis}able_ats_device() a little

Jan

