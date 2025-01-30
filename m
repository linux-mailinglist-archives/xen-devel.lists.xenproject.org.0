Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E0A22C4E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 12:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879475.1289684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSSj-0003pl-Rg; Thu, 30 Jan 2025 11:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879475.1289684; Thu, 30 Jan 2025 11:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSSj-0003o2-Nk; Thu, 30 Jan 2025 11:11:57 +0000
Received: by outflank-mailman (input) for mailman id 879475;
 Thu, 30 Jan 2025 11:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdSSi-0003ns-Bq
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 11:11:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0315f54e-defb-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 12:11:54 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so131566366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 03:11:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a31624sm101957666b.142.2025.01.30.03.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:11:53 -0800 (PST)
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
X-Inumbo-ID: 0315f54e-defb-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738235514; x=1738840314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0w1JF4p7h94nIJk2NabC//AHND+3+d+3/7CjsRj7Sxo=;
        b=TKCaCnyrZnQuGXW3jpNTl1R6z2WyIMkXHhgZd1uxxj5Bnoa1swBMZwJccqwW45ua3O
         fUekULt+rN3HHIIuPrT8ot2JaJU4q9E0Qxcap690XaHY+NY1UWBnFyHI8XFSTzbvSie5
         6zMSnOYHkJpuBmeKH0BjnD+Jc7NNsZMqJG7bv6eUo7pEy0xB+FbJ+JesHdX2UQaxUD+A
         zPvAO1895EW5UvWh8ajMVUTdPt0yuUcho91dZD5mix4rlLgHYfsEYiBs13TA27nOM3Uj
         KmaHY3YDuU3k4qB/WJqXrN4Gml44dRM31FlsuXV0M8Yz4IdVnhwQLEP4e4qv0ptS18Lv
         Riwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235514; x=1738840314;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0w1JF4p7h94nIJk2NabC//AHND+3+d+3/7CjsRj7Sxo=;
        b=LgwRtRxPzwFklWYeKcapCSOfT2Y9VpC/bVdVUNR95Q9asR9uW4nBTgimmebNvXy0VK
         OAokZN3s899Z0VjJlKDHKYC+gY+RFG/U37BzT42hTyJ9GBU1PeIWnkdTd+4dq4+XQw7X
         z6YNX5dWTXqBwQXmHkY84LKHJ78btnULuTwVBuZbfmgrdfjnDaJx4S+7HGARfQdG6mzs
         PF1e8AYHlJGjZQNfFGPi+N3beF3gItb0XUdGW9N0mXiVG5Fn/LKsGqVP+5yR3FgoPXkO
         bCrD3yt2mRk1J9BYtaWE3vTOBQjeJlXQ8qMlsjcsfwHWXLRAjS5bR0oGpLy+YH49/4iX
         ByWA==
X-Gm-Message-State: AOJu0YwotOgXoZnkC2C7IdVsCjjt8sJCe1nVXQcm4sucKsAbs/d4XR10
	twhES9lw9Tzv1HGPLID+V2MXogjJ8s2zhhex2x9W3+lL1XeJzfXIQ5Hps9/4pjknLVtL6POOrIQ
	=
X-Gm-Gg: ASbGncsqqte87PH2fyfnBYrl7tXaYNKQ8tHJ8LB5mzOcZro3aOJTTC2n4ClUrDhuepj
	aFbw0mjAz6ezcFNO0Tc71OHYowSj6BfHJB+NMWcJjcPwHqDx6pIFoPV5AE5uALAP2p7Z1l7lC5N
	ZZuAE+zlXIe69IfhmU1JrhIkFVdwg9gthVT6OCKlN5qUFnhRwGayoNVRtnqmXEcbeVQfCo2dFgK
	PoSiv7HB6nxkFuPwcZYmbIiwePzLdfWcgZ+5g0mJphJMn8kNdd383N6WQwDq6/4fXEjcLRcztzl
	WBc/5iicok13slLp5kOQwNNpCTlK5ospN+acmzVkBGFDwMB50ebagOJnjCluq19KcCHmOnBa2kN
	h
X-Google-Smtp-Source: AGHT+IFBDvZ66DWdAAmAmk4KyfLL2Qa8+TPR1j79CGG4gE3r/O6ytBYMUTFeyVJc1LdUiHU255s6SQ==
X-Received: by 2002:a05:6402:2399:b0:5dc:735a:f0a1 with SMTP id 4fb4d7f45d1cf-5dc735af29fmr2823976a12.8.1738235513679;
        Thu, 30 Jan 2025 03:11:53 -0800 (PST)
Message-ID: <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
Date: Thu, 30 Jan 2025 12:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
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

While the 2nd of the commits referenced below should have moved the call
to amd_iommu_msi_enable() instead of adding another one, the situation
wasn't quite right even before: It can't have done any good to enable
MSI when no IRQ was allocated for it, yet.

Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
         }
     }
 
-    amd_iommu_msi_enable(iommu, IOMMU_CONTROL_ENABLED);
-
     set_iommu_ht_flags(iommu);
     set_iommu_command_buffer_control(iommu, IOMMU_CONTROL_ENABLED);
 


