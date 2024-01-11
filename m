Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219782B193
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666355.1036936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwpP-0001Wp-IM; Thu, 11 Jan 2024 15:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666355.1036936; Thu, 11 Jan 2024 15:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwpP-0001U4-Em; Thu, 11 Jan 2024 15:18:43 +0000
Received: by outflank-mailman (input) for mailman id 666355;
 Thu, 11 Jan 2024 15:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwpN-00010p-M0
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:18:41 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e71d70-b094-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:18:40 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e60e13581so6505105e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:18:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:18:39 -0800 (PST)
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
X-Inumbo-ID: b2e71d70-b094-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986319; x=1705591119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjrQZ+IsckY64cqqmSStJXkQHtykH9VZpf2XCjIzkIA=;
        b=CneTUkdXxQdbklwimgJ6Dx9rH3GzcGWr3MLoHJR4AcJY4WKrvnYC5eGapz38OO0jhy
         hLI/nOkr+4V2r6sPeZFayNHZWGvLz7NtUXTiVA93tHsMmFiBLfuoMfEiRpZVtXeuIduj
         aUSoPRi9b6HbwGVTgXhET9wNXGXrZ07H/cOdQYntrmpH/WVLiifXdN2R6TXSclrKYuZ6
         TJ7GqONYB9GvDSXf0D2eqd+2hMWIfV8T5jXf5vH4lnM3PREUw9cQCNMn0g4Hfm5/1E2j
         Eo8Uw2Tb2DGbE6H9bcbhTwy6J9PJZIGP5L0bdrCwny8S5gSsFwrL+e6owO9i5s3N+IuO
         hLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986319; x=1705591119;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjrQZ+IsckY64cqqmSStJXkQHtykH9VZpf2XCjIzkIA=;
        b=NVaWSq498hrVHSf8doEpK4YETbQ9JG0+nbsYjexXI5CIiauzxJSKEHwzpy0qRQ/JaO
         say2VtTyIifn73Dt322h2mkMMigQXA5SHcIaq/Vx09tR2WkNOQE0CCfxq0tePqBO8ZR0
         M6FAisUPXePBiS1qk+/hS3Ja4KEpe/pXQS2gUUr8+LBMLQzK14UhF2mPCPdZC/rHhBsK
         iCGhWHBFI2EbDcLtanRe+bSvmLJdg4gvJnZq+FOYDo7R7+DnMclS9+DWeXPVkvYeham7
         vVZWzPDUybkjHD5uoQiS/NuwUfx+MhJYlYOHA/zbNheVeAYw51wY6vYe8uDtyeS7O4DP
         spwA==
X-Gm-Message-State: AOJu0YwbcGLOVU6hTZuUOziDm1cPxmfPHqd8MLOjgplImYubdjMiCYY6
	dzaIZlF30/PzgPKJHYOR7pimoEEzWsd5Ng4QkZYb3kkfoQ==
X-Google-Smtp-Source: AGHT+IFnImThCFYnDpLJSki0WavUX80bj8tvpqx7CELtzlxY1WQPu8e5QS3K0/ytcyW5rpNpx5vvCw==
X-Received: by 2002:a05:600c:470b:b0:40e:629a:b7c9 with SMTP id v11-20020a05600c470b00b0040e629ab7c9mr112013wmo.40.1704986319541;
        Thu, 11 Jan 2024 07:18:39 -0800 (PST)
Message-ID: <9a491a5e-1ba4-4e72-a341-c05ed1f1e9f0@suse.com>
Date: Thu, 11 Jan 2024 16:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] x86emul: introduce a struct cpu_policy * local in
 x86_emulate()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While of little effect right here, future patches (AVX10, AMX,
KeyLocker) will benefit more significantly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1232,6 +1232,7 @@ x86_emulate(
 {
     /* Shadow copy of register state. Committed on successful emulation. */
     struct cpu_user_regs _regs = *ctxt->regs;
+    const struct cpu_policy *cp = ctxt->cpu_policy;
     struct x86_emulate_state state;
     int rc;
     uint8_t b, d, *opc = NULL;
@@ -3101,7 +3102,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if(cp->x86_vendor == X86_VENDOR_INTEL &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               X86_EXC_GP, 0);
 #endif


