Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD60A91F28
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957770.1350803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Pv5-0005rV-0A; Thu, 17 Apr 2025 14:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957770.1350803; Thu, 17 Apr 2025 14:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Pv4-0005oo-TQ; Thu, 17 Apr 2025 14:08:46 +0000
Received: by outflank-mailman (input) for mailman id 957770;
 Thu, 17 Apr 2025 14:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Pv2-0005oi-Ox
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:08:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 776623a5-1b95-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:08:41 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so804635f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:08:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308611d4af0sm4102287a91.3.2025.04.17.07.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:08:40 -0700 (PDT)
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
X-Inumbo-ID: 776623a5-1b95-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744898921; x=1745503721; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgX529j5b+Lb7JU1K1hcubFK9TGt4Tehfcy0+ymK3tk=;
        b=MDBVGBvvfxwgTir9Tvpk+RWLDgl0goaF0iG7pd8Ig8+mWQqLrOa93Rp+/aJylUC+eS
         JCTTWrNGT/o2NRNSb7MTHAgu2dDLHdPXFm7Qmc7Ry+L5AXXahKXDcO0PxnkCByKq7NHn
         uHl0ld4E41aoRgTS4xC30XulwoA9geN8q7WaLZKh8mwOhBGTvORkOuJjalZy4NyowAF1
         LfZQlrUxydNSuhcgwDjbbTOWNtiwj2k3EqaOf9VwsYUgLgB/n75KhMzWKnHgYhI3X1fm
         NMNZiCPlGT0XrBdVXQ4Aa5qPX3z4olGuuWUpxiwD5FOz7pp836/TAsnNpmi7RdbEAoAj
         yFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898921; x=1745503721;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgX529j5b+Lb7JU1K1hcubFK9TGt4Tehfcy0+ymK3tk=;
        b=a0B2adjXCqo8foYimfM1+YBp7McMdKlA451/8Ldu5aV+RKXAtaV/M4Emj7SE8OA+Sq
         NakCUp0Ao6VV7c/g9o8TixgCOoA73kwHh9EmxUut6T0hfE1qgIGbWrbpB/p6eM9y05sf
         1p9GqUjrzeVmOk5z3bZ52UNY/T0DcJydI51cXqRKxaRVx2e/ogB8ekvMUHRpulgxq4k+
         Q3TUcxza3l6BvUwH6FBveuflisZCkiknDMLQKIEVVdhoEHx4xy13VGPpKHA22W/zr1og
         h+6DvDzoXaNz9Cfo0BZPMcB1C1VEtRYW9HJqQH1f5FzLD3aUvyZ8sHWw3l+Esz5GYcAm
         xBtg==
X-Gm-Message-State: AOJu0Yxe/3t+6YQ64jcjWOjS4xERycmpRws90rZ6wsf4XGyYlr5c86DY
	e8cQjAk8DnKNH1kExAanSGRRPZeBxuNI+qMsDuL15fP+HgIx6ggGYwrvhbCDVwnD+LxpoCZcyks
	=
X-Gm-Gg: ASbGncsIiD/uMKTQFgWpbehCEqBLU4sMOADiTLZBeJmfU+PzbxfYWsiDCJOplfuT3UM
	viu13wfq2Sk9xkr8qMhQAR2PN2y4yqRTp7xWiqLBnR5UmpiGFyxfFjR4eTCJnlIeT6071bksFPT
	eP6QdKqwFs3fPM3wO1dDmeaPA67pNCY0SW8Y3pLCXOlcRQZ5Cm19migDgf/AHf4HiouWu9j+7j+
	mKtSpPNlQ0A+NVJOenrQ1m3LkmHEvJAEnEtXv1T2XuWB3pjsa1R9/16Jjv8uczn2naxxiVEjThJ
	Ycw+nWJ790YJSzJ8nhrVmt7tljt8Lp1n5idl2HiLrpx8e95jHSRIjFmezZWzrwP+70abaDjYV/N
	HpVoHdbtr9Ivjm6xQvr2kUVGRZ3NdtWR5huqz
X-Google-Smtp-Source: AGHT+IF+dNKiVdS/EPtBPS1zoGLMgU9KnhLC2eL1IdWJAcMW8jdTkgai/Lfbwvt4jENA0utArlKaFg==
X-Received: by 2002:a05:6000:2a01:b0:39e:e75b:5cc with SMTP id ffacd0b85a97d-39ee75b0961mr4039208f8f.16.1744898921181;
        Thu, 17 Apr 2025 07:08:41 -0700 (PDT)
Message-ID: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
Date: Thu, 17 Apr 2025 16:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Manuel Andreas <manuel.andreas@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] compat/memory: avoid UB shifts in XENMEM_exchange handling
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

Add an early basic check, yielding the same error code as the more
thorough on the the main handler would produce.

Fixes: b8a7efe8528a ("Enable compatibility mode operation for HYPERVISOR_memory_op")
Reported-by: Manuel Andreas <manuel.andreas@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -161,6 +161,11 @@ int compat_memory_op(unsigned int cmd, X
             if ( copy_from_guest(&cmp.xchg, arg, 1) )
                 return -EFAULT;
 
+            /* Early coarse check, as max_order() isn't available here. */
+            if ( cmp.xchg.in.extent_order >= BITS_PER_INT ||
+                 cmp.xchg.out.extent_order >= BITS_PER_INT )
+                return -EPERM;
+
             order_delta = cmp.xchg.out.extent_order - cmp.xchg.in.extent_order;
             /* Various sanity checks. */
             if ( (cmp.xchg.nr_exchanged > cmp.xchg.in.nr_extents) ||

