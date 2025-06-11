Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFFAD524E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011492.1389946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIvn-0002wg-VD; Wed, 11 Jun 2025 10:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011492.1389946; Wed, 11 Jun 2025 10:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIvn-0002uc-Sa; Wed, 11 Jun 2025 10:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1011492;
 Wed, 11 Jun 2025 10:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIvm-0001Tn-5i
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:43:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01e71ad-46b0-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:43:40 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-453066fad06so28232555e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:43:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313b200a0a7sm1123936a91.17.2025.06.11.03.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:43:39 -0700 (PDT)
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
X-Inumbo-ID: f01e71ad-46b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638620; x=1750243420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dP6hDUe7AN9OWz/Q1nOrRU/+ZWv62kuqoQ0JD4El1IA=;
        b=aGuiUjV3G2skVdBIgCp0v5B0OB5jA2AsbJ3uBZLO8n7ulYVxh0khjzJYHB4Q9/jmb7
         8QW1TLpAps/sH1IOtmY626cHZSW2Wd/G5HLatJmdzi4uCUVyVI2gP2Gb8T2eUK1E0xS+
         u0Bn5rft03bJ+iPOGS5CkVf/t0JeeOdCFvftjnwHdHL4LEZnLFDKt5XwGigxG2bRyYN6
         BSKBQkUCEnv0Rw3L1VmKSvqR4u+h7JeH/LUPsBORENZyhsrtHls7WcUihJ2XT5JzVIW/
         0V90qHu5NrjILvTixn6PitQ7/dv5j9gbfRMKjZt9tNQT3R1cKPWppbFTEhssoIcC5qJu
         pBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638620; x=1750243420;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dP6hDUe7AN9OWz/Q1nOrRU/+ZWv62kuqoQ0JD4El1IA=;
        b=tY7lF0IL32k8B7q0hg4kbDVmv2Duf808SVP7NVBXR43G0dLSf68VW64adUoKVcpZJp
         fVQMfNMMnaiN5dv6b9mM2oWgvSNi8YHt6WDeiTr6f185juzF/FrEwcZpR6fGv07D2EY8
         2bFy6fH9VYDfSuPFXjXJWM/c5bA1dPPnG5c2nS48jC01fas52ARUbitIIuPrQkKQWipr
         G18XRyZuXxM32fNvJPSjBdBzJe/mAQEqurAXUBiX66BFB4v5Lgi+HtWPRLkb3K73fvji
         6piylNXV5pqb73V3usoyoaqiMuc+HctOLWCI+y3B06lUhwUqPHJVKBOa7mVDbyATWDEY
         LJFA==
X-Gm-Message-State: AOJu0YwxvzIaQqTZzIbNcSJYfVGyXDemAoah0oHzzXdcmExhn/An39q4
	En3yZ79ONCRrVNHrSaZL4lwk6kh7C7I8vh4peEeq9nmEaeKhDa/Ke+lJe+R48qZBlDgLFtdNygm
	6HHk=
X-Gm-Gg: ASbGnctPQkM5v2EPF0DrM90m8uSGrbVOqfa201AK88vCgbOiqQnWL7LpfrJXaTAyfur
	ssxaO0UVJ8kqD6u+gtg+bRXFq+zdONBP872IlUqxZ1ve0P1AKOBmg4t29gFmopUuUBJal1SkGyt
	Ve8js1uqbaL0+mxh714DepAO7QRPHC1AsR0cPqBA5D8aPpxd/otnO7HGMgeeRqNDjSO4L8vFqIM
	BkXaHFKNTAmOPOlaQmxPL7YMPM4dPxsnW5Miq1SFWLulZhGrrkOw6f+uBvR/LzEDXjcSrwP0/vR
	SBSfGJtZP1IDqa3IPkOP/mjIyGDIrNOKUW2TImGbojZA/F0pKHt3J101NdynkCISTlCSOHKZDXW
	yfRV9HetEK6Zql183HbDIDG4CL74abeasHdG30D7jloOKN+Y=
X-Google-Smtp-Source: AGHT+IG22dD+FwAQwsHyCTwvPjP2pIoGvT0MDRP5r6xUVh7vRiys77Xs/z+s3UuvhnBlKVzRu0peMg==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:e6c6:b8b1 with SMTP id ffacd0b85a97d-3a55869b890mr1864074f8f.17.1749638620086;
        Wed, 11 Jun 2025 03:43:40 -0700 (PDT)
Message-ID: <7676b1fe-9881-4b4f-a7ad-fe811c4449aa@suse.com>
Date: Wed, 11 Jun 2025 12:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/6] vVMX: prefer hvm_long_mode_active() in decode_vmx_inst()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
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
In-Reply-To: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All affected VMX insns are invalid to use from compatibility mode,
and hence the more expensive vmx_guest_x86_mode() doesn't need
using here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -418,7 +418,7 @@ static int decode_vmx_inst(struct cpu_us
     }
     else
     {
-        bool mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
+        bool mode_64bit = hvm_long_mode_active(v);
 
         decode->type = VMX_INST_MEMREG_TYPE_MEMORY;
 


