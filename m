Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6640AF45D9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031113.1404824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxAl-00077O-4j; Wed, 02 Jul 2025 13:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031113.1404824; Wed, 02 Jul 2025 13:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxAl-00075w-1m; Wed, 02 Jul 2025 13:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1031113;
 Wed, 02 Jul 2025 13:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWxAk-00075q-Gv
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:06:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670557fd-5745-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:06:44 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-453608ed113so44740895e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 06:06:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cd84csm14939452b3a.132.2025.07.02.06.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 06:06:42 -0700 (PDT)
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
X-Inumbo-ID: 670557fd-5745-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751461604; x=1752066404; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFkdPp72YIH3rhYlJ8fD4Z96TbRj9J+LAZaheMcRbno=;
        b=b0Utejz2fvHuliuDKTp/GAKLkdS1Z08RClumxcKenoEte6lrnpPydISB+kjxUVEZRj
         gDDze/Vv+cMov3BpgPotjqm2RhjJbygAUTfu4CqGt6pfySGVMvIIs5/BFLuVjh8nmnOA
         KMWUlBwgtlSVxqF5gkuBDUnCVPbLbNsBh2aOUkDP9e79tSyS0/UjjLbTON+ZFVZyrwex
         Z4W08hKCSc55v+EGf3BP8QuH/r0rfQHZGqGxPfgjIVxobzrAZMCncqTeOaLzLu8s0d6f
         MXPjEVLUvHPpInYP++w7Cisa6MciecqpuYsoqOUSg+hZX1a9cW4YCzV+vo+eQDVOFDvy
         c+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461604; x=1752066404;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFkdPp72YIH3rhYlJ8fD4Z96TbRj9J+LAZaheMcRbno=;
        b=qB1fEphcV8IBwr5g7ONxq3JM5P2YAIvPOrObFWPJdFw15PwETJeG/vnvvkoTyIqw5W
         KIgtXDjTv7BI4x/Ry9sZU6XtX0v7BB/xoTUvsh/yNFn+pR/3jUO9bJc6y5nsPAy8rulr
         9l7VEia0LBR0o5gA3xSznAypDvo3oCleOWL2ID4xQ06ay6wndg3FK0ODEuunGeKaUf+o
         nauyJEG8KEqPKb74OsHka8yLB4lytPzO5dCufSjK90vcgy5PaSyabA/aVk/G9GHV0CXK
         XEksMhRx5dlv1CBcLthqEgiL9gKLW9MZXTFpPN2Upu6vwh8+78s3dt/oyBkvdm/sPy/l
         TiSw==
X-Gm-Message-State: AOJu0YwRX97mbX3b6Rv4aQxDHjqxKtvgbG4J6spK19Eb3fVwimzVS9pv
	qp9P8PF/v3DKztV2yXtBrpitsh3nl87tieyxD/BKa25GVv8A/wHGEM6UD3q9wsPAg95h92fLFbB
	DnWE=
X-Gm-Gg: ASbGncuP5fDW1Gk3HlWONNP0dU8TdTctHljG5QfJ/BVTs1+cNQFM+TDytDaIUZJ8lav
	TJ+Dz98QUPQBRc52kR1w5Jakbx7pnLy9Cj6hR2+iK9km/xlWhzFTGLp2+T8iE7NsdrzaWsQ8RJx
	UCI16oLIzFt5GP957zwVPePIGATy6i6JV5n+KHCSaKkWQOi/O5GfK0UPd5pRd5ajlLYkN2BxS/B
	VDrhZO7pPJVi6APUcSfw+VX2MADspiHVDJ0gnWbYuaovrBy5EoV5eRKwJYF2D+lg5Sf/VIp5fCW
	/NO+7ffCmsxx6Isk90RuiL0kFsKggwzuqh7x18CyWAxoycknQjEI4X2HmUdf/OpDOA1qY7IQJlv
	2nt5g43TaQjPaXLZ+SqFv+UXPGGBuffYUf9j6vPkVKzoYUYc=
X-Google-Smtp-Source: AGHT+IEFhnoKDLPitK3gmUJD2vnHLwPB04RmC85Hgs6aBcOWbSCs61gRa4CgtuQB/Zu+mzkKgo9y6A==
X-Received: by 2002:a05:6000:4408:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3b2001aca24mr1554370f8f.32.1751461602531;
        Wed, 02 Jul 2025 06:06:42 -0700 (PDT)
Message-ID: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
Date: Wed, 2 Jul 2025 15:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
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

When the bumping by <nr> (instead of just 1) was introduced, a comment
was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
code path can in principle be taken (depending on configuration coming
from the outside), and we shouldn't assert anything we didn't check
elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Noticed while reviewing the RISC-V code copying this machinery almost
verbatim.

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -256,16 +256,13 @@ static struct domain *page_get_owner_and
 
     /* Restrict nr to avoid "double" overflow */
     if ( nr >= PGC_count_mask )
-    {
-        ASSERT_UNREACHABLE();
         return NULL;
-    }
 
     do {
         x = y;
         /*
-         * Count ==  0: Page is not allocated, so we cannot take a reference.
-         * Count == -1: Reference count would wrap, which is invalid.
+         * Count ==   0: Page is not allocated, so we cannot take a reference.
+         * Count >= -nr: Reference count would wrap, which is invalid.
          */
         if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
             return NULL;

