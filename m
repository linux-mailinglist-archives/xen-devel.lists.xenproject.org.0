Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7729BCE55
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 14:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830233.1245168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8K0I-0003DU-W1; Tue, 05 Nov 2024 13:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830233.1245168; Tue, 05 Nov 2024 13:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8K0I-0003Be-Rn; Tue, 05 Nov 2024 13:53:54 +0000
Received: by outflank-mailman (input) for mailman id 830233;
 Tue, 05 Nov 2024 13:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8K0H-0003BW-HV
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 13:53:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626cf26c-9b7d-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 14:53:50 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso34196295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 05:53:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947b2bsm226238665e9.25.2024.11.05.05.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:53:49 -0800 (PST)
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
X-Inumbo-ID: 626cf26c-9b7d-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYyNmNmMjZjLTliN2QtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE0ODMwLjU3NzA1Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730814829; x=1731419629; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s5Oyk6glvdzfHQG54DyWol8OjSSU1tTw/PKtjSzTSE=;
        b=NsQ8sAlmfS+KyQ5S1aH/CscENUIUsIdjsZCmtQcm1NSgNdWVXsGms3cgL+mscRdES7
         jra8KmJ2MS+FU0OKXL8KCGYzOm6rgmN/qfnAEhZYAR6nHe/ZCGtnl31DscoQ11yY0CGq
         4l0aI29Er1EdEQ2zTROZquna46ZTMjHjkQn+P7UMKeaGK5Oxe/QCRc8o+GrglKtMAXhE
         jt7R5ldZtBX8JsCLCPYCHnm8DS4tNmt+tFBbrX3UPvI7fP/Cb0a/T10GvD3AzDddVcmy
         6WUg+G6C6ACAhusYFTLn66SR5bWL91RKc4BnIfqlQyCDmORiDptHDzuXwxrTKkCHX94Y
         cGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814829; x=1731419629;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s5Oyk6glvdzfHQG54DyWol8OjSSU1tTw/PKtjSzTSE=;
        b=XQJfOJz6jRdTDpAudYPLimuzoEhP6PjIftjmSr0EIFE/GSekUaFEqQriblgPNoBHMt
         2XPo6fJwWIbq3qDUnm1wdHtjUk8DSjEhJFK9PSER06zkwHtPr9auWPQo8rGY3rfPwNd9
         QMmCvJNARiKjRw4NJoRMuvSW6WLY5M+7RaxumMeJ/STWXGNfBgYDuZajpyjSsvljxTAX
         H88vrD3Cp0LHBeN3fd7WUzsIrKuA5L6HAWPadYFono8dPxALaExEpgwMYIlp8EFpPNiN
         IiQN6RY+l+MDX2zoPnLxF69/tOgyBDs3f1v3qbVhuwWqkIUZa4rn1Jv7YjxtVZVUfe1M
         QdJA==
X-Gm-Message-State: AOJu0YwXeDrvozrBFIF3QazOW4uKDZ1aX3okkbs1/HuI5xZm0dP+oGJt
	vQS5iyax/6/S2zqGIWLk7H9nRxv8P2/rU20KmDCBe2nz+YTFeoNpr9vGapaH3G5goryHkRbJEx4
	=
X-Google-Smtp-Source: AGHT+IF6Tgcy2Z61oJhqMLroXYwmAHtT6llsqslYeomrwim/wrx7KOZ5+wVMNLuW8a4pseUpIcAm9w==
X-Received: by 2002:a05:600c:1382:b0:431:5475:3cd1 with SMTP id 5b1f17b1804b1-4327dacc373mr141077425e9.17.1730814829497;
        Tue, 05 Nov 2024 05:53:49 -0800 (PST)
Message-ID: <f1fc4064-a2dd-4287-81ba-a90ce5205e0e@suse.com>
Date: Tue, 5 Nov 2024 14:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: drop an undue conditional
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

Gating the main part of what do_test() does is wrong: As it stands, the
"memory" forms of BNDC{L,N,U} weren't tested because of this mistake.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2213,42 +2213,37 @@ void do_test(uint8_t *instr, unsigned in
                           unsigned int bytes,
                           struct x86_emulate_ctxt *ctxt))
 {
-    struct x86_emulate_state *s;
+    struct x86_emulate_state *s = x86_decode_insn(ctxt, fetch);
 
-    if ( !modrm || mem != mem_none )
+    if ( !s )
     {
-        s = x86_decode_insn(ctxt, fetch);
+        print_insn(instr, len);
+        printf(" failed to decode\n");
+        return;
+    }
+
+    if ( x86_insn_length(s, ctxt) != len )
+    {
+        print_insn(instr, len);
+        printf(" length %u (expected %u)\n", x86_insn_length(s, ctxt), len);
+    }
 
-        if ( !s )
-        {
-            print_insn(instr, len);
-            printf(" failed to decode\n");
-            return;
-        }
-
-        if ( x86_insn_length(s, ctxt) != len )
-        {
-            print_insn(instr, len);
-            printf(" length %u (expected %u)\n", x86_insn_length(s, ctxt), len);
-        }
-
-        if ( x86_insn_is_mem_access(s, ctxt) != (mem != mem_none) )
-        {
-            print_insn(instr, len);
-            printf(" mem access %d (expected %d)\n",
-                   x86_insn_is_mem_access(s, ctxt), mem != mem_none);
-        }
-
-        if ( x86_insn_is_mem_write(s, ctxt) != (mem == mem_write) )
-        {
-            print_insn(instr, len);
-            printf(" mem write %d (expected %d)\n",
-                   x86_insn_is_mem_write(s, ctxt), mem == mem_write);
-        }
+    if ( x86_insn_is_mem_access(s, ctxt) != (mem != mem_none) )
+    {
+        print_insn(instr, len);
+        printf(" mem access %d (expected %d)\n",
+               x86_insn_is_mem_access(s, ctxt), mem != mem_none);
+    }
 
-        x86_emulate_free_state(s);
+    if ( x86_insn_is_mem_write(s, ctxt) != (mem == mem_write) )
+    {
+        print_insn(instr, len);
+        printf(" mem write %d (expected %d)\n",
+               x86_insn_is_mem_write(s, ctxt), mem == mem_write);
     }
 
+    x86_emulate_free_state(s);
+
     if ( modrm )
     {
         instr[modrm] |= 0xc0;

