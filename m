Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A8A97EF6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963937.1354830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TMs-0008NR-Q7; Wed, 23 Apr 2025 06:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963937.1354830; Wed, 23 Apr 2025 06:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TMs-0008KW-N5; Wed, 23 Apr 2025 06:13:58 +0000
Received: by outflank-mailman (input) for mailman id 963937;
 Wed, 23 Apr 2025 06:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7TMr-0008KQ-Az
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:13:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8ae8d2-200a-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 08:13:47 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so43691555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:13:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2331dsm13121285e9.12.2025.04.22.23.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:13:48 -0700 (PDT)
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
X-Inumbo-ID: 1d8ae8d2-200a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745388829; x=1745993629; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adX12jlWSKSON4g0n3hQbCmdhkZU5r8cRx47tHlYEvo=;
        b=VaN2uqLd6Hg1knbj467tPUKkTE5BDCaVjKwpjfSHLwcRux1T7Ul/dWithImwpIQQwT
         TRp2/gfQa3hGxdy9OBbC53uH1V8lMuQ01aKXLuu73JNJujrg23dwUH0uuNXm/ucHL8Bx
         oQzI40hpdBp5dYcIKDXlXRSzzj84rfIjGYI1lr5rPfpG5Yc4E8dUv+9DaOliQsD2dDaS
         hj78H/zqA4rR/6ubvFksNvcRR5oNDiyDogghgA2O8H837bTZAga1NVB8Cx73liJ3oZD3
         juMThuHQL8BrksJ6DhOlj143o9TF5kEkOahvbkeXu6nhe7GTb2/h2gqF9y/ziEvp3frN
         diKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388829; x=1745993629;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adX12jlWSKSON4g0n3hQbCmdhkZU5r8cRx47tHlYEvo=;
        b=G4lvUc7xCWfILz5EzdN/MHBzNVv/tWAp6ZkppnQIWesvlxkPR9R2F2OqwOBG7qkg5Z
         H68qN5M2w1BbcZ0idITQLTaDpL39gUnI3fkbejh126ma1l3quVfiC7k9c1EQvOC1TPNf
         pAam04opp6uFX/tKwbLEFocmCCjgTtR1/7NF+wmCkWDUZUqiS6Ho6hdfzds8HhuGhP/d
         gD0WbxNLkX1n/DerT+5tCLNpE66cLzgw8IkPLP0fky1lagk1RK6ljJ/rZP7vAe9UGLVs
         SfZJm/s29oeccmejbC0uZ5nzKWhRPylzH1ijKLAhWRnLE74Tn3opCk9M9bEGjXrKN5K1
         J/+g==
X-Gm-Message-State: AOJu0YzH5yTDte/SvP73OpT1422yz9V7c1EQGzIhAZwFvct9TABRNzmv
	BwRBqgb822GKIN4+2H9mt0uP6jxYi0GPtuuh4MxtDwNNNyGH3Oe6HWsOsQaac16M58Inj8VNHEI
	=
X-Gm-Gg: ASbGncvTKeM+7L+PuVFH1oGAAtVFqmcQdUpZfjvWIM+Ah1TnRqiW6YWA4YxeuC17vwE
	c3QpupdrvPXkLoZkhq5CkdZqEt4H1wqYW8ocISmov0acI5sFnQjxfVgLxCTN+fkfwQD0Hp6lUDp
	BmtWYnttGB8c+2TfVd9b37mJf4uSv5gA160620RaYfoMnY8fVgvvBtJryhsSxFlS7o8PamMeqv6
	lF3A3GtxAw84v0dxV3u0tgPcyap302LxJOLEzCAoUmsf/35KkSjhKGjfMbfl2+5rgDl+owOr80X
	BoV6Flh8BDzWUzlbNiwVNRb5otvf05YXI05xAgUc7ZFFWpEu9+ybhcUBaUh/HmE7DSdILKoOT+e
	Vi3wiwl/ICeJU4PKqBjltwi+W5g==
X-Google-Smtp-Source: AGHT+IHVFNiRIY2pSKSrj/i944mGtlmwW80r9lswaaMETBIonkr1Lm+VQr8LE4dF0Lrj1bM0q2sKxA==
X-Received: by 2002:a05:600c:3acf:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4406ac2040dmr169959325e9.30.1745388828948;
        Tue, 22 Apr 2025 23:13:48 -0700 (PDT)
Message-ID: <df3f3203-d660-4b7d-b771-871d16a8ec43@suse.com>
Date: Wed, 23 Apr 2025 08:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: adjust BSF/BSR behavior as to EFLAGS
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

SDM revision 087 points out that apparently as of quite some time ago on
Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
Because of the inconsistency (and because documentation doesn't look to
be quite right about PF), best we can do is simply take the flag values
from what the processor produces, just like we do for various other
arithmetic insns. (Note also that AMD and Intel have always been
disagreeing on arithmetic flags other than ZF.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Since I happened to look at it, I wonder whether for e.g. SHLD/SHRD we
wouldn't be better off using _emulate_2op_SrcV_nobyte() as well; we
already do so in x86_emul_rmw(), after all.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5268,16 +5268,14 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0xbc): /* bsf or tzcnt */
-    {
-        bool zf;
-
-        asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
-              : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : "rm" (src.val) );
-        _regs.eflags &= ~X86_EFLAGS_ZF;
         if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
         {
-            _regs.eflags &= ~X86_EFLAGS_CF;
+            bool zf;
+
+            asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
+                  : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+                  : "rm" (src.val) );
+            _regs.eflags &= ~(X86_EFLAGS_ZF | X86_EFLAGS_CF);
             if ( zf )
             {
                 _regs.eflags |= X86_EFLAGS_CF;
@@ -5286,25 +5284,23 @@ x86_emulate(
             else if ( !dst.val )
                 _regs.eflags |= X86_EFLAGS_ZF;
         }
-        else if ( zf )
+        else
         {
-            _regs.eflags |= X86_EFLAGS_ZF;
-            dst.type = OP_NONE;
+            emulate_2op_SrcV_srcmem("bsf", src, dst, _regs.eflags);
+            if ( _regs.eflags & X86_EFLAGS_ZF )
+                dst.type = OP_NONE;
         }
         break;
-    }
 
     case X86EMUL_OPC(0x0f, 0xbd): /* bsr or lzcnt */
-    {
-        bool zf;
-
-        asm ( "bsr %2,%0" ASM_FLAG_OUT(, "; setz %1")
-              : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : "rm" (src.val) );
-        _regs.eflags &= ~X86_EFLAGS_ZF;
         if ( (vex.pfx == vex_f3) && vcpu_has_lzcnt() )
         {
-            _regs.eflags &= ~X86_EFLAGS_CF;
+            bool zf;
+
+            asm ( "bsr %2,%0" ASM_FLAG_OUT(, "; setz %1")
+                  : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+                  : "rm" (src.val) );
+            _regs.eflags &= ~(X86_EFLAGS_ZF | X86_EFLAGS_CF);
             if ( zf )
             {
                 _regs.eflags |= X86_EFLAGS_CF;
@@ -5317,13 +5313,13 @@ x86_emulate(
                     _regs.eflags |= X86_EFLAGS_ZF;
             }
         }
-        else if ( zf )
+        else
         {
-            _regs.eflags |= X86_EFLAGS_ZF;
-            dst.type = OP_NONE;
+            emulate_2op_SrcV_srcmem("bsr", src, dst, _regs.eflags);
+            if ( _regs.eflags & X86_EFLAGS_ZF )
+                dst.type = OP_NONE;
         }
         break;
-    }
 
     case X86EMUL_OPC(0x0f, 0xbe): /* movsx rm8,r{16,32,64} */
         /* Recompute DstReg as we may have decoded AH/BH/CH/DH. */

