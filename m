Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE85A54D62
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903588.1311545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqC21-0005vt-UX; Thu, 06 Mar 2025 14:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903588.1311545; Thu, 06 Mar 2025 14:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqC21-0005tc-QW; Thu, 06 Mar 2025 14:17:01 +0000
Received: by outflank-mailman (input) for mailman id 903588;
 Thu, 06 Mar 2025 14:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqC20-0005tW-Mr
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:17:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a880e1e6-fa95-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:16:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so4978215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:16:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01567fsm2152204f8f.41.2025.03.06.06.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:16:54 -0800 (PST)
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
X-Inumbo-ID: a880e1e6-fa95-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741270615; x=1741875415; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXNPxGh0f85FevIbwDeNuYgVjPjGWi8Vu0UlDZ7rI40=;
        b=Uq1gFcIl2USjiUQTuiRPRRD8xU9ZLVmUdDxgIdJ1WieETmLcEE3E7Mte20G7eycleR
         Ef65ZKgkEtfF+AauZ3AP4/cxkq8O6Xk/uL5/gVxHNzwL7kj5ze2JEYXA91OHO5eYb1Yr
         gsuflJHBKt56Y5PSfOwKjHFLKqKaHzSWpBAr43c3hhQRfnWolnYzZWmQXOrkh7gh12iK
         tyGYUf4cxB6YKwCBng8sRpAOfDxRdZhXiUFG7YrkoIEsDj4Rw2UYlg8ERzAMgJE27HUP
         Ghl4d+Jt9OHt6Ibhi00hrd9XLM4vVaBjvNoxgAIYAPkzpIsGB07kJQEi1fBkoyx/bkF5
         DABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270615; x=1741875415;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXNPxGh0f85FevIbwDeNuYgVjPjGWi8Vu0UlDZ7rI40=;
        b=MeckKad8Ipn+I0FnHAU/FUe8pUDofVMJtPTbQhqDf3M2sodP2kFTALFH3iJFjWSiEi
         p1c70FP2uMf3Fyta5jqvkAX0hvR1HU3Pryd/TF/PPZc2150cHO2VJ+t++0nQy3yNPFwt
         XXXNX7EECkw+biD+yCfskzBDbzOqXJsGITYah8s8+RJy04jL71ZlRK3zPS3CuEhWVA0X
         wBr6Mj3T75GmdwCPvC4CMdFK5iGmkMm3G5p6qNg1MWlJ42u6lzui/mtAeXIPF48ezUXR
         dLSgcAsoXaBzR1D8Tn8AmIBtB1ntTKzpJxzFHiSYRuopIUYX8u92/j79K8E2rDTuls9I
         zLQA==
X-Gm-Message-State: AOJu0Yw/edtJYWA4StFBEHCTvSQKVo9XpRp7EA3BFFHs1rcIJOk0TzxS
	KCXhAvUO2BdmudS9ploPSrVWCrl531+sU/x9n4Vd/yF/awE3KP8kBnG35I1l5EkFD++IJjdFQyQ
	=
X-Gm-Gg: ASbGncuVtYgiHiC1mMqPvZCEtPdE90Wj2HZJ4p/SrPUvxzeDnkDRo4VNVuILJYKHgY+
	q4ci9gUXjcaEDVBnXrpOh3hBB1dMHIe1z+Buv4g8aAlfDHD5qx2ZwVtBvhC8Y8S8KNNWCBA8cPa
	GEhrlBDJSiYGtF4a0/S+pyWOrjuN/Fr0oOJobIUuFHW20NmRInv5OwkwsbUlUt9SNgGFjOfvv2I
	PFMwrYrnoiJgcnmPBZAvrzvDUlwUFKbUFODqbPOEheeTZ03KH7drZig9XX2yndHcaWFO0i6DFS0
	A2pvOElu+I6EFPyrQ/LvwxpuO+B5stvZsyn1aNvT4GV+th+OKZcIr9DtHX3Nr2gDCX9uKeLwUCi
	560rReVK921KWE0vGNZBl/wCYHajkRA==
X-Google-Smtp-Source: AGHT+IHzopqhJ5ZeK5zsuRlVCJSLtCIASCjEQgqjaIT7LZtrXOHdxQser7rfoCzjwZjLQH+DJqc2BQ==
X-Received: by 2002:a05:600c:3657:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43bdb368d0emr29025675e9.1.1741270615033;
        Thu, 06 Mar 2025 06:16:55 -0800 (PST)
Message-ID: <dbc6907e-e23b-4216-828a-ce7c4b581a20@suse.com>
Date: Thu, 6 Mar 2025 15:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] XSM: correct xsm_get_domain_state()
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

Add the missing first parameter and move it next to a close relative.

Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -231,6 +231,11 @@ static inline int xsm_getdomaininfo(xsm_
     return alternative_call(xsm_ops.getdomaininfo, d);
 }
 
+static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
+{
+    return alternative_call(xsm_ops.get_domain_state, d);
+}
+
 static inline int xsm_domctl_scheduler_op(
     xsm_default_t def, struct domain *d, int cmd)
 {
@@ -775,11 +780,6 @@ static inline int xsm_argo_send(const st
 
 #endif /* CONFIG_ARGO */
 
-static inline int xsm_get_domain_state(struct domain *d)
-{
-    return alternative_call(xsm_ops.get_domain_state, d);
-}
-
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT

