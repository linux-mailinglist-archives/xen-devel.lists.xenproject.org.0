Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F091A9EF10
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:29:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970567.1359224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mfi-0004tP-4T; Mon, 28 Apr 2025 11:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970567.1359224; Mon, 28 Apr 2025 11:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mfi-0004r3-1P; Mon, 28 Apr 2025 11:29:14 +0000
Received: by outflank-mailman (input) for mailman id 970567;
 Mon, 28 Apr 2025 11:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Mff-0004qq-Qd
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:29:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 007d2ee7-2424-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:29:09 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso3283278f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:29:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5c68esm10768925f8f.82.2025.04.28.04.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:29:08 -0700 (PDT)
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
X-Inumbo-ID: 007d2ee7-2424-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745839749; x=1746444549; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mN3gNNgsaWkJoaA7AforPMWrjwvk0E5HAamOs0gAg/Y=;
        b=OIqtEo9SLBsF1XNs6WkjA3DKDnZlVUSH3QXwTYD9n12Yi4TgP35QiLxCKB7OEyS07n
         b7D7R65ulOM8hmb2fDDftvw1tWWvXaueXzl2p6NlBNUcP3J/BcEkSK3fc2YT6OJ3OLih
         VXILvVojefQ7u0fzn5s1loNbevZnGjpfQbmqshvoqtcpp0RFk5eUI9T1vm90MVySznS+
         omp7qygygDEW6FWyOTomTvWM0U2aHo2c0v6RhH1IXbGyEJ6B0Lyw6jQ05E54aa7YCX5d
         Gm2wOD08rOTUAIQ1Ld51T9LldW/0jBJGbyhHxsfEr85Ux2cfkITHq+TUbBfI5o4oMqJY
         hTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745839749; x=1746444549;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN3gNNgsaWkJoaA7AforPMWrjwvk0E5HAamOs0gAg/Y=;
        b=r3D/JUns1NANpSqSJCGf0qDH1mw4JvGBrFQAm49ey0sEeHf616DcdiKobkScEw5w/e
         l+K+B1U7VBqZRhIT8awYIqbBF4HAvt6zxw3Oyf5h2RHyarRfkvvt+gbPbjNg5s6fSEby
         QkbAueeL10WaZi/qvrwd1PlaF90oJZ3ykjpf0nT3pp7BXp6OKHedI2x1Ohitl0aiwBub
         cJy13V4I4jePZoSkXN/p88sXSvKLvDX4wcSEKTXHbFQ5QF8KKN7jXZQMRPNeUUFYwrMR
         go0P+CQOXe9GWyuBULsF5QN+8Hu8dOgQbFKVc1sg1MiPw94/lI5tJKAoy+dQGK364FhM
         /AAQ==
X-Gm-Message-State: AOJu0YwCPv9DboKu/SwCpyDzm4H/JhbZNQCGP7guge/799WlhdQcOTjv
	dmpouFKLFSmeW+68XQiN6FRaorpRzok70dZz3VU0OFOtPHVBBiNBFlBcf0YPL2Ri96gKqh5M4ao
	=
X-Gm-Gg: ASbGnctaDk7ckNKTPm4M2jV4oXO7rJilpppYnx7gJxRdUUjqk2SHDR3N/zFu1vMA734
	g4MrxA3VfkSJ2aygMnxmbH/6Kv9ZRirSGa3lygGjdERrGl1a2tAxN/hl1Jgb2c2ix8l5QnUKkWk
	oeETz5L2+iOCbjKqREnvyYcGnL1zTmsTAFSU9ejlz2CliBuOSZkehq4ThsrdS5/QNV8VyQm3EoO
	1Dljfl4o0JZsbPe4BZdxAb4eSA1tEPlRGHszkJaPLvJD0Q/RN/n4MDIOOHh0d5LOKj3aiW4T1up
	QYEJ91O3fAMZz5j3mw3Roe7unsHC24NVy5ZP1g1FEHf5Vmllca7QYlaViapH3UZenVpMPT5I2as
	+c5MGIU9IMoMGUoUs9DICyLOyIg==
X-Google-Smtp-Source: AGHT+IGF9RPUny99dJc5Lj9TPw36yCnwMnSIlvrPZkwN8T53DmLQZTIK3maTImuhR/FaAqPwSZKGkg==
X-Received: by 2002:a05:6000:1a8e:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a07adb1d30mr6994175f8f.54.1745839749085;
        Mon, 28 Apr 2025 04:29:09 -0700 (PDT)
Message-ID: <c8eaa6aa-d63d-471c-b66f-6a8c00e03ba1@suse.com>
Date: Mon, 28 Apr 2025 13:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Fabian Specht <f.specht@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid UB shifts in FLDENV/FRSTOR handling
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

16-bit quantities, no matter whether expressed as uint16_t or as
bitfield, will be promoted to plain int before doing any arithmetic on
them. Shifting such values by 16 will therefore shift into the sign bit,
which is UB if that bit becomes set. To account for all reads and all
writes accessing opposite members of the same union, introduce yet more
local variables to reduce the shift counts to 12.

Fixes: be55ed744ed8 ("x86emul: support FLDENV and FRSTOR")
Reported-by: Fabian Specht <f.specht@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -81,17 +81,19 @@ int x86_emul_blk(
             if ( !s->rex_prefix )
             {
                 /* Convert 32-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = fpstate.env.mode.real.fip_lo +
-                                   (fpstate.env.mode.real.fip_hi << 16);
-                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
-                                   (fpstate.env.mode.real.fdp_hi << 16);
+                unsigned int fip = fpstate.env.mode.real.fip_lo & 0xf;
+                unsigned int fcs = (fpstate.env.mode.real.fip_lo >> 4) |
+                                   (fpstate.env.mode.real.fip_hi << 12);
+                unsigned int fdp = fpstate.env.mode.real.fdp_lo & 0xf;
+                unsigned int fds = (fpstate.env.mode.real.fdp_lo >> 4) |
+                                   (fpstate.env.mode.real.fdp_hi << 12);
                 unsigned int fop = fpstate.env.mode.real.fop;
 
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fip = fip;
+                fpstate.env.mode.prot.fcs = fcs;
                 fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
+                fpstate.env.mode.prot.fdp = fdp;
+                fpstate.env.mode.prot.fds = fds;
             }
 
             if ( bytes == sizeof(fpstate.env) )
@@ -121,17 +123,19 @@ int x86_emul_blk(
             else
             {
                 /* Convert 16-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = env->mode.real.fip_lo +
-                                   (env->mode.real.fip_hi << 16);
-                unsigned int fdp = env->mode.real.fdp_lo +
-                                   (env->mode.real.fdp_hi << 16);
+                unsigned int fip = env->mode.real.fip_lo & 0xf;
+                unsigned int fcs = (env->mode.real.fip_lo >> 4) |
+                                   (env->mode.real.fip_hi << 12);
+                unsigned int fdp = env->mode.real.fdp_lo & 0xf;
+                unsigned int fds = (env->mode.real.fdp_lo >> 4) |
+                                   (env->mode.real.fdp_hi << 12);
                 unsigned int fop = env->mode.real.fop;
 
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fip = fip;
+                fpstate.env.mode.prot.fcs = fcs;
                 fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
+                fpstate.env.mode.prot.fdp = fdp;
+                fpstate.env.mode.prot.fds = fds;
             }
 
             if ( bytes == sizeof(*env) )

