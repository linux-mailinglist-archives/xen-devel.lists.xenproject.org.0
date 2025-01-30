Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476EA22C57
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 12:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879491.1289704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSTu-0004sm-Cw; Thu, 30 Jan 2025 11:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879491.1289704; Thu, 30 Jan 2025 11:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSTu-0004qi-9a; Thu, 30 Jan 2025 11:13:10 +0000
Received: by outflank-mailman (input) for mailman id 879491;
 Thu, 30 Jan 2025 11:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdSTs-0003ns-W5
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 11:13:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ea500ff-defb-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 12:13:07 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dc149e14fcso1138692a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 03:13:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724c94b1sm901543a12.66.2025.01.30.03.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:13:06 -0800 (PST)
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
X-Inumbo-ID: 2ea500ff-defb-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738235587; x=1738840387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9vwx/V7mW1SrRmfY7WrHmeRj0Uzde1i3C5utHUovTg=;
        b=Eyp0Fb3hTiOioLBxZbHEea6mCoN7cCQW51s4KY1cBmK78jjwcZMvP6Zo5+vcdghnJG
         CU9k4l7j+saxS5i8oZQcfq16GXwqs//ohtHYNQCKwKE9BAgsEF3k5Xr3gQcW0pkTjU7j
         zVr99dZ5Xr/1lHqHLYEAqyuQ4gFLHrAfPfjgDiNhfIhdmKl9WwQ5yeq2ztLnalP74IvR
         9xPFtQ3NpByDpCfCtVtMCgAEzj9A9Dl40PLIYe8LpUqk7/D1kN7dVejbt/JxfiBA+t71
         X97mrU50Pv3sLxweCOQarVKRj/YQGnFB+88AzUiktURG4RPRfwM6CBlXZnxQcdN+vy9A
         wCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235587; x=1738840387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9vwx/V7mW1SrRmfY7WrHmeRj0Uzde1i3C5utHUovTg=;
        b=kYA6AcBeyxgkkyS5HC6hD1nx7NW8c2+dhShIJlxXTel+ubJfXKkSarIH0v30igtWqv
         eP+ktYep3R2t9gSmteFaxdmZ/5w77DaZ87Uf8MzMNivjgejiOLhMQmU9yfVzBWvQSOLc
         rM5mStFTvcGU/gsoPtsPZbk4rFEKkEf+zy3mhbt4da6XM4kzA1ljakwsia93dwy6W98v
         Ml1elj8b1viLNe+Pwe0QbvhezoIFWlPrLYfsiCEhSc75QqRUPG7y6MjG5sdpvB9PEDfT
         MFAwHS0qZTtJIcexhqE2gVTGlCPkpL26fZizh7TTko6OMmVr9g5pyckKEjVK2izIgI3s
         PnjA==
X-Gm-Message-State: AOJu0YzmnW6ZVQeZNmrSca80hp2A04IG59uyH4LYf3TRKWFy5q9PkNwu
	oGMz8WIiArnJz5T99MedPxtSeSeCaAC2P68P6p+EbN8ymM+121j6d3Op72i2RMxwhwcM4/aaO88
	=
X-Gm-Gg: ASbGncuN2UpZFqroMrLQBMMrzzS2/IJmuxXF4Jw3aEWIq5crzojLo4R8zS7T6vQMYAZ
	tYpBejDKIrXe0TVPGUI4WIgDgmDiTiCb1n+7mush/U2TrwCdG/zHjVwKmdmNyrIiYioF/uS0qsW
	B1ZbPgEg4G4lum8iRAkuLGu1KoG7jRLn4JSwkI6yZVseQrHZv9kUMA7SGo0vJQMWuJR5q1ELj4D
	ea2HZ2Yf9F+Ivt0y1ZA0xa0myTiqkZoEyjZxXg+pNonixhVq6QMgnefNcEXlZRFnIM7JUGVJlGL
	+HjW7oSSTbxcIFR9o9Wck2MqrGAFMi/f83zsP94Y0a43mfQFb2x+p5DPcfV1I80CPMRQpJ4khw/
	x
X-Google-Smtp-Source: AGHT+IG6xC4jEPXW9L0hQq67LWsRj+B/KKoOd3P3KbafdpL1VtRAKMBlkhbx8oVSD7X2vc8QSlCJTQ==
X-Received: by 2002:a05:6402:51cf:b0:5d9:f042:dab with SMTP id 4fb4d7f45d1cf-5dc5efc4d4cmr7316347a12.18.1738235586818;
        Thu, 30 Jan 2025 03:13:06 -0800 (PST)
Message-ID: <b0b8c35f-5c88-46bb-a882-9ff737683367@suse.com>
Date: Thu, 30 Jan 2025 12:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.20? 3/3] AMD/IOMMU: log IVHD contents
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
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
In-Reply-To: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Despite all the verbosity with "iommu=debug", information on the IOMMUs
themselves was missing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -911,6 +911,11 @@ static int __init parse_ivhd_block(const
         return -ENODEV;
     }
 
+    AMD_IOMMU_DEBUG("IVHD: IOMMU @ %#lx cap @ %#x seg 0x%04x info %#x attr %#x\n",
+                    ivhd_block->base_address, ivhd_block->capability_offset,
+                    ivhd_block->pci_segment_group, ivhd_block->info,
+                    ivhd_block->iommu_attr);
+
     iommu = find_iommu_from_bdf_cap(ivhd_block->pci_segment_group,
                                     ivhd_block->header.device_id,
                                     ivhd_block->capability_offset);


