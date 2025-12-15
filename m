Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7ECBD7C4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186858.1508276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6ez-0006eH-Im; Mon, 15 Dec 2025 11:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186858.1508276; Mon, 15 Dec 2025 11:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6ez-0006bD-Fx; Mon, 15 Dec 2025 11:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1186858;
 Mon, 15 Dec 2025 11:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV6ey-0006b6-Su
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:22:36 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa8f0e6-d9a8-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:22:34 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so39895805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:22:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf05sm14325637f8f.7.2025.12.15.03.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:22:33 -0800 (PST)
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
X-Inumbo-ID: 5aa8f0e6-d9a8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765797754; x=1766402554; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6ecNVDx5cKZgYNiucWxMmPj27MWUWFlvdwvFFUmg2Q=;
        b=ONcqOWqgQYs9aIrsybml/2wMpbKiwPRw06v2T39Bkv7+xQvNNukKNcN3JVbSLd2qOF
         xPK2NUIsshbA/S7e2xAXVho18cvF2TpQnTrTpboZXQMiM44azsZsa1Dw3y5uC+mpb87X
         BKfz3MB4UQ+vgEri/tox8+kJwo2kG3Ic2bL84fsPuY+F8jj1FSHw4d2Fwzb1czxuOsI1
         eVWyTNd0axnItv5fJ5uQxZwKtgsuE07XO2FO1KmhVk02DuNASPrZQl2gTvg/nTX/Z0eG
         ybD1T6gkykLfBS5DamnJmmZxIe6pDUvSuYfAb4WYNGrpjxOy0otQdzfsx6LZw8YbxZVA
         1rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797754; x=1766402554;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6ecNVDx5cKZgYNiucWxMmPj27MWUWFlvdwvFFUmg2Q=;
        b=htexOa2UFIzUwfAn3TAK1pu/eSQUrv5ppb+CaFjevPrrKd6i2NViRUaktbrTfO/VT+
         6yhUWRRhcVVg8XJoJtJl5fkOv2TMSnfIVF59T86c35JMPnaugLO4JiwsgQVvPI+G4zav
         Bin5VKUCRMlnPWj9a61RoIdCgd4ItmUjPjOJeb0Nbgr9XE1vnu6AYCzv9hvdZ3wvx3Nq
         Bobf7LS22tNqSXFvGy9/7ZZwacmCsGljSs+9yCjPwo1+N4rsddYzjDGiHUfC4zGFPGo1
         sca/aVU320u4RjjHeL3c4fTql+VXwnISgK76nVXcLHMW7oVGehSsz0OyVSScm9mPMZxn
         Dq+w==
X-Gm-Message-State: AOJu0YwOhMlXSMiwNiM3ji+71yQsMxxQ2Qb4f0k044frxss6qPRPkxBo
	LgII3H0QSwSABDoKcekb8M2H40H0Cd71OxcnXCBQUON9Jkm3kyOpnL0jdu6KbYknXWnBWUf5y6H
	IWl4=
X-Gm-Gg: AY/fxX6lzN6d6/frlt/EcKQFnRgWSv2Z6GZUS1FHNNNx6mDm/C/v3F7c1Sp4VTfLPo9
	2qT8LKUabBZYZmIL3B/0RsbZMUWl2hoc8NOupSppqSufQyKAfCdFUfqfBBwDsSMPTct/eOve/E8
	77fDdbffahFjk2ZfvSx5Hci8AbaXwTAheYxm2U5iIjAVboaVUYpq66Krw1uAtB1jx5Kq/mrs3mE
	8wXF4ikCa+G+JqKPELuStd3/2cvC1fEDFZDaBcNElVtJ2jm63z+rxWIJgAbp1wmC4pEe5KMLUqG
	flU1AwfSXTqqXeGpnbSp09KnmUmevB7PYpH1n+8rpEchyFhyEg1hJTEwYLP2uizU47ToYuikAVG
	i59BDcdeao/uxhnpE3slCTvfa86vB7AyFb8gvfkSsrwdDbQuCd8TIM3dPCL8BNBKHsMWYGo1YRJ
	k3EJzsVDDP8MEp0Px4pWL6T6SbfDWdiram81zRhYT6iEGHWKZ2oDAf2iZ/YXMM1RnN+DMKJ8CoA
	SI=
X-Google-Smtp-Source: AGHT+IGsfs18BTY962kdWMC9vUh322OWY14p+hlpUqhMB7W5BadHwwEkFjkJekg8hhu+t7fU1UbAIA==
X-Received: by 2002:a05:600c:6994:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47a8f90cb38mr95398455e9.26.1765797754221;
        Mon, 15 Dec 2025 03:22:34 -0800 (PST)
Message-ID: <7d254163-ac13-4c58-bcb5-aaff2e892e15@suse.com>
Date: Mon, 15 Dec 2025 12:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: overlapping XENMAPSPACE_gmfn_range requests
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

Overlapping requests may need processing backwards, or else the intended
effect wouldn't be achieved (and instead some pages would be moved more
than once).

Also covers XEN_DMOP_relocate_memory, where the potential issue was first
noticed.

Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course an alternative would be to simply reject overlapping requests.
Then we should reject all overlaps though, I think. But since the code
change didn't end up overly intrusive, I thought I would go the "fix it"
route first.

In-place moves (->idx == ->gpfn) are effectively no-ops, but we don't look
to short-circuit them for XENMAPSPACE_gmfn, so they're not short-circuited
here either.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -849,7 +849,7 @@ int xenmem_add_to_physmap(struct domain
                           unsigned int start)
 {
     unsigned int done = 0;
-    long rc = 0;
+    long rc = 0, adjust = 1;
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
@@ -884,8 +884,25 @@ int xenmem_add_to_physmap(struct domain
         return -EOVERFLOW;
     }
 
-    xatp->idx += start;
-    xatp->gpfn += start;
+    /*
+     * Overlapping ranges need processing backwards when destination is above
+     * source.
+     */
+    if ( xatp->gpfn > xatp->idx &&
+         unlikely(xatp->gpfn < xatp->idx + xatp->size) )
+    {
+        adjust = -1;
+
+        /* Both fields store "next item to process". */
+        xatp->idx += xatp->size - start - 1;
+        xatp->gpfn += xatp->size - start - 1;
+    }
+    else
+    {
+        xatp->idx += start;
+        xatp->gpfn += start;
+    }
+
     xatp->size -= start;
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -903,8 +920,8 @@ int xenmem_add_to_physmap(struct domain
         if ( rc < 0 )
             break;
 
-        xatp->idx++;
-        xatp->gpfn++;
+        xatp->idx += adjust;
+        xatp->gpfn += adjust;
 
         if ( extra.ppage )
             ++extra.ppage;
@@ -927,7 +944,10 @@ int xenmem_add_to_physmap(struct domain
 
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
+        if ( likely(adjust > 0) )
+            adjust = done;
+
+        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - adjust), done,
                                 IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
@@ -941,7 +961,7 @@ int xenmem_add_to_physmap(struct domain
         for ( i = 0; i < done; ++i )
             put_page(pages[i]);
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
+        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - adjust), done,
                                 IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;

