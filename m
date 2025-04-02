Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B2A78B95
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935504.1336895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzupf-0007HH-JG; Wed, 02 Apr 2025 09:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935504.1336895; Wed, 02 Apr 2025 09:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzupf-0007EX-Gb; Wed, 02 Apr 2025 09:56:27 +0000
Received: by outflank-mailman (input) for mailman id 935504;
 Wed, 02 Apr 2025 09:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzupd-0007ER-S9
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:56:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc762b73-0fa8-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:56:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394a823036so60762905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:56:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fc1ab6sm15500745e9.1.2025.04.02.02.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 02:56:22 -0700 (PDT)
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
X-Inumbo-ID: bc762b73-0fa8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743587783; x=1744192583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2WgklV4aS+vL81IQKhOiZwM+XpHySTiTqu70gWfUIk=;
        b=eJHWsUuiaELBw/2f41nff6t//yOxacguNIKfgmAunG77Y5da5JxKefCa3dn5oKcBGO
         VlydRk9La1ZqzSzkUG04T1fT6+IZCZLHI3nQIkI24uqqOW/Qf4psMP+JFQnADoW0hST1
         MKkSKNEWmssAFTtIxNY63fIe1mYlXt+Pp6VVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587783; x=1744192583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2WgklV4aS+vL81IQKhOiZwM+XpHySTiTqu70gWfUIk=;
        b=GW7I5CvL8CERMEoWS9v/EuF+eojcd8vPVFza8DjalnZkSsL4GjK/ZcBRdg1KBo9cWL
         gX5la3Kwh6GOKUm3nSGpQTjS7VgVZUP/gyaUyJT9ZlbHD04yCp8tpcTkEb3NVY5S1e0r
         X4q16oue8IJL5dieWZaWpLBqv6KyV3bNiJBcoK+2Bw9H9Tbxebctpa8P8D7rhpayex9l
         3YGbiBH8e+xA3N/P7Ss7EER3HGEWqYgef1/jIMv7jNSJp1jN4JI4P2aKF97ik6WE8SgS
         cSQw+QnCZOhDZ5qGug299gpzf8hEKSec1orvcUkbYXtf4a0kOQCxnrkVb3v3kl75Zz0i
         4P2Q==
X-Gm-Message-State: AOJu0YxA+qojDhTIgWRV3V9piMK4cEatidrEcvl4QEnCYepzzIac9CzT
	smY0GUUUnS44q8kjwXXgrPikf5EQe6odah3l3Sm4mqYuDYuQ+QPo3qvaksPjEpva1lHowv2ej5D
	hejo=
X-Gm-Gg: ASbGncsayM3Aqar1i48ye/YXEoghWJ238QAwMUynFRZXxh1Y/42M1bHeciqZr3to6DM
	DSG3B2wIqPcIWbkoFWRCjSTobG3B5gLvOvWqq+qx7u8qYj397YMO1a7QD0xkYEtMu5T0sPtTqbi
	uXpV6VEV4QhucyG5zVCyApgH3TFhsc9uyCfSAAYH7q8PWX30/iAaBCXSX//ufM1vSHTa/4H6Qad
	NqsLBxq8FPV/GwzGKvo1EgLPn4poxeHL3W9uu4bXzdcpTM1KP0OYsWUm3OMQeETp7xnhv4EgjPU
	WOTZ1yOLTQUbaWbZ4/b8qEXznXDAci7HBtgwX7o9fUcBz+YXIb056UUgQwztJhoY0vn1w7/Jo2J
	Me69+dD4VJNOpLNXpjA==
X-Google-Smtp-Source: AGHT+IGSvV3p1yGdksYG8oWda9MkUImUK0jSBNaWq/jhqUjSd36YhX7uVI4mFRebNCGs0cnPXnNuxw==
X-Received: by 2002:a05:600c:470f:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43eb5c95bf9mr13879465e9.24.1743587783146;
        Wed, 02 Apr 2025 02:56:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	dmkhn@proton.me
Subject: [PATCH v2] x86/vmx: Use asm goto() in _vmx_cpu_up()
Date: Wed,  2 Apr 2025 10:56:21 +0100
Message-Id: <20250402095621.1278093-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the new toolchain baseline, we can make use of asm goto() in certain
places, and the VMXON invocation is one example.

This removes the logic to set up rc (including a fixup section where bactraces
have no connection to the invoking function), the logic to decode it, and the
default case which was dead but in a way the compiler couldn't prove
previously.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: dmkhn@proton.me

v2:
 * Move error block to the end of the function.

Bloat-o-meter:
  add/remove: 0/0 grow/shrink: 1/1 up/down: 13/-32 (-19)
  Function                                     old     new   delta
  _vmx_cpu_up.cold                            2460    2473     +13
  _vmx_cpu_up                                 1803    1771     -32
---
 xen/arch/x86/hvm/vmx/vmcs.c            | 50 +++++++++++++-------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 19 ----------
 2 files changed, 26 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 0ba65becec1e..8e99e6f73062 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -749,30 +749,15 @@ static int _vmx_cpu_up(bool bsp)
     if ( bsp && (rc = vmx_cpu_up_prepare(cpu)) != 0 )
         return rc;
 
-    switch ( __vmxon(this_cpu(vmxon_region)) )
-    {
-    case -2: /* #UD or #GP */
-        if ( bios_locked &&
-             test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
-             (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
-              !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
-        {
-            printk("CPU%d: VMXON failed: perhaps because of TXT settings "
-                   "in your BIOS configuration?\n", cpu);
-            printk(" --> Disable TXT in your BIOS unless using a secure "
-                   "bootloader.\n");
-            return -EINVAL;
-        }
-        /* fall through */
-    case -1: /* CF==1 or ZF==1 */
-        printk("CPU%d: unexpected VMXON failure\n", cpu);
-        return -EINVAL;
-    case 0: /* success */
-        this_cpu(vmxon) = 1;
-        break;
-    default:
-        BUG();
-    }
+    asm goto ( "1: vmxon %[addr]\n\t"
+               "jbe %l[vmxon_fail]\n\t"
+               _ASM_EXTABLE(1b, %l[vmxon_fault])
+               :
+               : [addr] "m" (this_cpu(vmxon_region))
+               :
+               : vmxon_fail, vmxon_fault );
+
+    this_cpu(vmxon) = 1;
 
     hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
 
@@ -785,6 +770,23 @@ static int _vmx_cpu_up(bool bsp)
     vmx_pi_per_cpu_init(cpu);
 
     return 0;
+
+ vmxon_fault:
+    if ( bios_locked &&
+         test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
+         (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
+          !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
+    {
+        printk("CPU%d: VMXON failed: perhaps because of TXT settings "
+               "in your BIOS configuration?\n", cpu);
+        printk(" --> Disable TXT in your BIOS unless using a secure "
+               "bootloader.\n");
+        return -EINVAL;
+    }
+
+ vmxon_fail:
+    printk("CPU%d: unexpected VMXON failure\n", cpu);
+    return -EINVAL;
 }
 
 int cf_check vmx_cpu_up(void)
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 843f8591b9cf..7c6ba7340744 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -559,25 +559,6 @@ static inline void __vmxoff(void)
         : : : "memory" );
 }
 
-static inline int __vmxon(u64 addr)
-{
-    int rc;
-
-    asm volatile ( 
-        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
-        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
-        "2:\n"
-        ".section .fixup,\"ax\"\n"
-        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
-        ".previous\n"
-        _ASM_EXTABLE(1b, 3b)
-        : "=q" (rc)
-        : "0" (0), "a" (&addr)
-        : "memory");
-
-    return rc;
-}
-
 int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
 
-- 
2.39.5


