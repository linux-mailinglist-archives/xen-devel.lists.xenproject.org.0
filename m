Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EFA951701
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776928.1187129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9jr-00050N-O0; Wed, 14 Aug 2024 08:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776928.1187129; Wed, 14 Aug 2024 08:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9jr-0004y8-KP; Wed, 14 Aug 2024 08:52:15 +0000
Received: by outflank-mailman (input) for mailman id 776928;
 Wed, 14 Aug 2024 08:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9jp-0004KL-Ty
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:52:13 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe3f71e-5a1a-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:52:13 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so7488325a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:52:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411b51esm146202866b.134.2024.08.14.01.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:52:12 -0700 (PDT)
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
X-Inumbo-ID: 7fe3f71e-5a1a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625533; x=1724230333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=epU0ZOLYsb2TVwBzTh4j8VJ21d047ETTJ0/sMnsI36o=;
        b=euev4sRlzvo/3U1B0Z6J5hcm8elyNt+fN7cKd3SIpVXO5A68F71nka9bIbWST+BIbw
         8ds1Uw7+vmWV6QdgXD9ubUdvMsY0ll0DaMCiW6bhaGkjf5yCiOxRuXxxBsKfo7SQLj1k
         bkHrd6dpnTqbnpUFDzxJArXVfH7ilQYWrsltCqI3srm9D+v1GUTHuSdtgWbc7tdVYwjg
         XA7MFGe8VX6nIqR7QGfAsnrdpt++/dYz6GHDMj8PdBPXC1ik87wIYA06Pr1R6CJ2bF8E
         wVJQU30eAtI241sbAcK2bx7F2YE/KunTvo9EhirvsBGV0asLVFVtZSbfjcFMRMFTc4Xg
         7PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625533; x=1724230333;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epU0ZOLYsb2TVwBzTh4j8VJ21d047ETTJ0/sMnsI36o=;
        b=HCOlXFCmsuaWX7PYliVozewsR1LmnTJKunrmOf2b5LDPzLXXDW0Me0mC/F0E9ODGfh
         xrGQaVM0oQUbweBvw09y9c+DPviaAxbvzMwuVs6FwazjqvuJ6xmzDEjY64nN19o8Kn/L
         9vHn1wpfSvOmuSDqv88cbk/qIo+kobv2II9YWGdMxDLwSNCdVb9znoEoltE3PZCMQlGr
         rCa4l5RgDPwO/0rts6NJl7VvbAhCiPacgxCeOQoBIt/v5B7NFQJJ36Rol8ixpjYJQ4Ld
         3U+ofZlXt24n2UGHvVq1ICKSJO17DsHHm43eJ5rgWAJYX+DPA4ZZ8b8MrnRxaoSsM7dM
         6mRw==
X-Gm-Message-State: AOJu0YyVzyjFRLc+5O1qrCb5wSFOHIIx3TF81S8udPX/kNJ+EokeQmXf
	3lpPRU+LsoSjigjvE2//1HMzAuZb1fuECPmsuqOD2sAgvo8FszIT3E2EsZKaIfhR2FML+1mH5z8
	=
X-Google-Smtp-Source: AGHT+IEMzoReuqi0utbQg5qkXqyHBm3v6Ltb9DfmhfM32yKkfb6Qx7OyLw8wcUlhaIBG8tUm7K+XYw==
X-Received: by 2002:a17:907:e6aa:b0:a77:c583:4f78 with SMTP id a640c23a62f3a-a8366d8c571mr136222666b.39.1723625532791;
        Wed, 14 Aug 2024 01:52:12 -0700 (PDT)
Message-ID: <f6b15171-a49e-4d85-a605-8770077249d7@suse.com>
Date: Wed, 14 Aug 2024 10:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/9] x86emul: introduce a struct cpu_policy * local in
 x86_emulate()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
In-Reply-To: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
@@ -3074,7 +3075,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if(cp->x86_vendor == X86_VENDOR_INTEL &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               X86_EXC_GP, 0);
 #endif


