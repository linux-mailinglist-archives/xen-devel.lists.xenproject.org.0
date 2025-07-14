Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41601B044ED
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042966.1413080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLdF-0001Fr-PX; Mon, 14 Jul 2025 16:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042966.1413080; Mon, 14 Jul 2025 16:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLdF-0001EN-MH; Mon, 14 Jul 2025 16:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1042966;
 Mon, 14 Jul 2025 16:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubLdE-0000zO-7O
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:02:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb6fb08f-60cb-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 18:02:19 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3054539f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:02:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c30069171sm13388086a91.16.2025.07.14.09.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 09:02:17 -0700 (PDT)
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
X-Inumbo-ID: eb6fb08f-60cb-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752508939; x=1753113739; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=34lvXd+I64gKgoouOMnuASedFY7Apt36xfMEZnf2g/o=;
        b=JLlMP/56D7d7mitWtP6MOIZXiOfJ9ndqlTgPLVc1YK8EerV4CU9lMBcFgUjYMRBjFR
         oSQOJO3FLkPzfSlzfbAL4twMrPqhmnGZVbA73cUxmgiLiakOpajA73IAaM2qiqMk7TTs
         DNzyEovo5/EYtyF//e0YqIp9YvVDVLtp0+2Xxt2TYZcg7+9m25OieMxLw11fiipT4UoB
         ol+9rQFo7o1tpC0xoD8x8+5OYKVleWuAKzzMCnJCg8CtvQJcmgSARlt96Imq3ueekm8m
         s/ek8VkuMhbxKvhDxRBsMBaRi8EVvsPL3860oh47Dzk3e+dTZ2TWRLSVKe7ZOHz0PSn9
         bPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508939; x=1753113739;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34lvXd+I64gKgoouOMnuASedFY7Apt36xfMEZnf2g/o=;
        b=qjhSvK5fCGv4NbjED+kDUwndWaprJFMfn5LwHY/qRNYxkYrxm5wCYj28MuazHRk23r
         oGpSYqEvUWcZAFOivjgTM8lJudZtz7yxde7kO518cpDdbG6ZOClvLb6pS4BDzoVP7h/T
         bMOXm+AIxKW76vPyOX5Or40bkb+Q72DetUKVWH+BxbFc+STQaGuqRLlKb5H00piw+vyb
         ZoFGBUQ0VFXXiqTzdatVhWhtBu8/b58/FmSFwYyDZstPEQ66uR9kpw9FYJmGfAciyJoR
         rKwjtgsRWAYjtJoPKtFcitgY/ROKOuT5p5rI0EDUiYjXqVrIgm2Iu0yY+WImU7KFVukz
         Ne1g==
X-Gm-Message-State: AOJu0YzfTx7XeE56BbTZreCHc1oPfKhRxrwzTpOQvAYPzC7Uyt+cL6BJ
	h9kUo2RYX86KosyUJX1EhOWtjFZWBi0uEYO+AW2oSl5eYkrpv5ZQx8CJp/qW3VpgRELyAtIOhN7
	4aJA=
X-Gm-Gg: ASbGncv/fmzP3ozE8Zi4KQNqyksLsy1uv13Jkrh+dVcRl/Vkm++VtU/I4sHPLfofdCP
	exxSWOSZdMG4cgA27J6/VmQpXtQjW5oLIr8lD+pgecztXpQnbsAFnymH/LsbIqxBWp/sU8QmPDK
	bffHTD6YuuJ/7TbWUY2qaqXqwHpS3pTIF4snn1lJ99V1jP/OfzcbG1IwZguyiu9NR9OTIqC6PzH
	/86yc/f5OkpaDUEIz5ZLZomGVZ1YTkcFdIx4tIylJLTVukS15KeWSFSjWoww+ekq0OEHIH0SGam
	2qtXHkRNKhAMiBCQ3HaNrycCTJFKasix+H3p3/qFfW/QmJ71sKt/v+ORovTIdUGmmHBHUaC7kVX
	mm4mQW4sxtgl83eREloXmfqrQq/8PuoC4hj6y1vsdS/Aw0Ir1mUau/7oXcU2uu+U3nJd+DHlQ7r
	fq1rHE5GE=
X-Google-Smtp-Source: AGHT+IEiB6LB5NN3QDiztePhgOFsbfQHBSzo4R8r4dJn6rYrSQYRjvs11E6dlkr0/8waaSbTsRdugA==
X-Received: by 2002:adf:9c91:0:b0:3aa:ab93:c7de with SMTP id ffacd0b85a97d-3b5f2dfd709mr8266915f8f.34.1752508938634;
        Mon, 14 Jul 2025 09:02:18 -0700 (PDT)
Message-ID: <8c4df1bc-4fdc-4e96-ae67-ea23870d2725@suse.com>
Date: Mon, 14 Jul 2025 18:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul: adjust BSF/BSR/LZCNT/TZCNT behavior as to EFLAGS
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

SDM revision 087 points out that apparently as of quite some time ago on
Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
Because of the inconsistency (and because documentation doesn't look to
be quite right about PF), best we can do is simply take the flag values
from what the processor produces, just like we do for various other
arithmetic insns. (Note also that AMD and Intel have always been
disagreeing on arithmetic flags other than ZF.) To be both safe (against
further anomalies) and consistent, extend this to {L,T}ZCNT as well.
(Emulating the two insns correctly even when underlying hardware doesn't
support it was perhaps nice, but yielded guest-observable
inconsistencies.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use emulate_2op_SrcV_srcmem() also for {L,T}ZCNT.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5270,62 +5270,26 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0xbc): /* bsf or tzcnt */
-    {
-        bool zf;
-
-        asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
-              : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : "rm" (src.val) );
-        _regs.eflags &= ~X86_EFLAGS_ZF;
-        if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
-        {
-            _regs.eflags &= ~X86_EFLAGS_CF;
-            if ( zf )
-            {
-                _regs.eflags |= X86_EFLAGS_CF;
-                dst.val = op_bytes * 8;
-            }
-            else if ( !dst.val )
-                _regs.eflags |= X86_EFLAGS_ZF;
-        }
-        else if ( zf )
+        if ( vex.pfx == vex_f3 )
+            emulate_2op_SrcV_srcmem("rep; bsf", src, dst, _regs.eflags);
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
-        if ( (vex.pfx == vex_f3) && vcpu_has_lzcnt() )
-        {
-            _regs.eflags &= ~X86_EFLAGS_CF;
-            if ( zf )
-            {
-                _regs.eflags |= X86_EFLAGS_CF;
-                dst.val = op_bytes * 8;
-            }
-            else
-            {
-                dst.val = op_bytes * 8 - 1 - dst.val;
-                if ( !dst.val )
-                    _regs.eflags |= X86_EFLAGS_ZF;
-            }
-        }
-        else if ( zf )
+        if ( vex.pfx == vex_f3 )
+            emulate_2op_SrcV_srcmem("rep; bsr", src, dst, _regs.eflags);
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

