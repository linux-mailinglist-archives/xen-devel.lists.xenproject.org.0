Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C18A25FD1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880785.1290870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezF9-0005Dc-RW; Mon, 03 Feb 2025 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880785.1290870; Mon, 03 Feb 2025 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezF9-0005B4-OL; Mon, 03 Feb 2025 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 880785;
 Mon, 03 Feb 2025 16:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezF7-0005Ap-V7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:24:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d8802f6-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:24:12 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so639089366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:24:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc72404acdsm8016800a12.39.2025.02.03.08.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:24:11 -0800 (PST)
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
X-Inumbo-ID: 4d8802f6-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599852; x=1739204652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ9duolnHM6ddzGDePvpNedWfdDKZvFMWubH+BUvdf0=;
        b=Wktjf3UQB068znMSpZl1CArqVUOV+y9YzEZ1t/yoSpYBnQdPOwPxNhtNfnSaz0pWTj
         fZdq7b8vtE5YLOHguasZwZv/rs1UwVatCSxp5SAX7oxDshjE6T2wkTc/RnxL1EPSoh+A
         daygOZKoB3UI0uJCFdHTX3OI8ictvCLewf0tFgiuL3MlSbascO3J15osLbzVU6tNbVSh
         JQWEUPyZ3zNUH9/d7FsJKCW1w2X4/u+eapR/bu0YmfOJMDBfKMHtJnIMNZpChptN7nuD
         oxt1wPjQZE/wq0NdnLOA8tC6CdgCX/faouKPvsYts8df8lMELUtc2Apn3z2QLJ6tLipg
         jeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599852; x=1739204652;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ9duolnHM6ddzGDePvpNedWfdDKZvFMWubH+BUvdf0=;
        b=MBMKPl1eGgaPUxc62I1+Z2KaJe+6CPVtWsJxiDXrXYqtyAMc1N7s3SrI7YdvV491FM
         /31jKwkbM4ve7funNJqIsvqP2a6jLReGai5Gwa0rmSPsoE1xwDtR4/JT2DuWFBlvOfBI
         geVwmnHmH4VMO30tiAr8RQcDx6rIA/M3yAUwatgnPqIReGfxKIKewBsu8Ii9kNKosqSV
         eVjBGRSkVizuNpFdn8g93DrL6hlbQ7F0d5Onn7yE5C/LWHPd8H0kW8oRR8wNvo8HeFma
         k2t8xNcW59pOAH2C0sEpTf201Y4/+wcDo2xxJsJp4HuwfBlom8mZbxXUQXLNu0+6GL85
         XcEg==
X-Gm-Message-State: AOJu0YzpRjfmh7+PJ3OzesGfPJzU1Vklvo+ljRURfVh4B0cp/rzDLGOq
	fL8yaBTCbrldcSOhn1Zk3EhvWM3wppfJUpmvEwrI/6/GWMyF2TF+T3KBaUv6TPjE7GPOXikBoy8
	=
X-Gm-Gg: ASbGncsm6oReZ+hxBHdN2qygOWBpXP+V4Rq6lpS+xRbtHHx/ws4SpiI/Ax0TmsFVGT+
	bC26ghkRY68sO4Bi0KYPKNCIxrsVRQV32ycYjzdleFYkqR3iN+fuU7sX9jyvJBSA3RaRwiXp6Vj
	yFxGK+Duy+DAQVbL7WeCFNKl5QYDYKhfFdtawvwTVZOzB39ZJX6771Vx6gfJH05fU8YNzbkqWpw
	ym++hVM6/wYs37FPC6NTgHllHwRlTR4RcAT22Q2cU81UHiVo0hXcR56pFQt2whfw68LGHtfbc8S
	fPoC83qLyYbjOxl2OHnh0H5qOiemJgPr4Z6C1KqESCxydE+t43eZmiIGIpD5MmYYzAi34OxPCJl
	D
X-Google-Smtp-Source: AGHT+IHE2NtMKdqIiZp1kqvSPvHTTGRFmVkbkIYRygmf9TyYKdcw+MjPLW/StSdV5Ewp/AABzg50oQ==
X-Received: by 2002:a05:6402:c4d:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5dc74fdad3emr44865856a12.15.1738599851748;
        Mon, 03 Feb 2025 08:24:11 -0800 (PST)
Message-ID: <a5fc316b-bcd6-4570-a997-0cd15273da9f@suse.com>
Date: Mon, 3 Feb 2025 17:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.20? 1/6] AMD/IOMMU: drop stray MSI enabling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
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
In-Reply-To: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While the 2nd of the commits referenced below should have moved the call
to amd_iommu_msi_enable() instead of adding another one, the situation
wasn't quite right even before: It can't have done any good to enable
MSI when no IRQ was allocated for it, yet.

The other call to amd_iommu_msi_enable(), just out of patch context,
needs to stay there until S3 resume is re-worked. For the boot path that
call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
done it already (by way of invoking iommu_msi_unmask()).

Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2: Extend description.

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
         }
     }
 
-    amd_iommu_msi_enable(iommu, IOMMU_CONTROL_ENABLED);
-
     set_iommu_ht_flags(iommu);
     set_iommu_command_buffer_control(iommu, IOMMU_CONTROL_ENABLED);
 


