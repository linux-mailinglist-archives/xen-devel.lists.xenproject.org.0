Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD018A78538
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 01:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934955.1336498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzl89-00044A-Gl; Tue, 01 Apr 2025 23:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934955.1336498; Tue, 01 Apr 2025 23:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzl89-00042a-Do; Tue, 01 Apr 2025 23:34:53 +0000
Received: by outflank-mailman (input) for mailman id 934955;
 Tue, 01 Apr 2025 23:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzl87-00042U-Sj
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 23:34:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e672c5e4-0f51-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 01:34:48 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3663270f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 16:34:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a420bsm15112429f8f.82.2025.04.01.16.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 16:34:47 -0700 (PDT)
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
X-Inumbo-ID: e672c5e4-0f51-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743550487; x=1744155287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11+pzo1svboxI/YVj1ud4vGVrzsTT62DWsIKE6oIun8=;
        b=ar1Ve6vvFzijaqXpz68ICoek1masWhEIM4dDyofoAKu10AkSWuPquppDIyAeqbiajj
         RT7EC/Z0MjAlZlLw4+4L4ey0oUCpRpShBvI3UItVlqKHzgjrEagUZZanhkYAr7uoopAj
         HUiKKXEK9PrPs+EAz/0CKVeJhAEBWB2AqefnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743550487; x=1744155287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11+pzo1svboxI/YVj1ud4vGVrzsTT62DWsIKE6oIun8=;
        b=vAKeCu93TLCfrUyqEnq5ue+BI6wbD7Lk/v3/To5re4TrZ4npUT5FlHjFGEqnBCN9hX
         MOF7MvJCCae9IOOseo8mxu/j5VlWBPC/3lWWYcBJJC+1IK/TQY1kJdpndsmihEyi0Wcf
         NY8wuAOJsA2W+Dd6hpLn52lWbC393sfl1yunAgFwBzgtKVjzWumH+Hcp7eQhJoX+QJQt
         KY8adm66jC1D2RJ2T6HEZnPM/kI28xb6cEyTpMnGAyl9xwy/1OkLQmJMxZCVqoESW22i
         iLuC9q322obsu/iooWNYi7pBL2VDq9G8d03VhjzAH9qxSJIph4jsDUdGSgWZ4v9lS1DE
         yBRg==
X-Gm-Message-State: AOJu0Ywhv6lpOSFOaxw5fMdAOO68JmNkKOnrqTcpkyO5dM0PAebfZEzl
	/ES/22HhtkUHPALarapWVlaiSiI60jvh86CCvVgIlEZ7jLJcuhThduaNxkW8EtXJE3BDyM7dWoJ
	dPFY=
X-Gm-Gg: ASbGncv0BMjWLdjphy1SLyZ4rdL2roUx2XPIDeJXcFzZfqwus7/luDyffoF2vPRrUuI
	z239l89uWcY0XVgDQGZ+bockwsqMvr6Oc6Ue3QkmqFhtvh5bEzhhc6H4ZpPF9zut+m49ApWZN0f
	3M8eUlAMw70AIzpGxRw9MwJj7F8JSdIwBlsg/U1rF16hgH7DQwsj7dxyvOITmI4cv+K6ndhSjWS
	t5Do1k82NVFZrGqebXXrOehwglJJk1NUUIog24rhgnpBV/Qj/CmFmPToaRgrGNjqgguCqDM41SM
	yg21otwlMMQb0qalwBohoKbrwjeEBJMck80QuuT+gArt0yRcR7LIwSqAXZ2R4U8EPlkCOZJphby
	0K7moUtKvDoNcVcazyg==
X-Google-Smtp-Source: AGHT+IE9KXUXpXN32iC3blhVw9ysb6pqdH1yGnKrh++3/JIxyC04X2Q0pWjHmEQebhtOqwSQmruzJw==
X-Received: by 2002:a5d:6d8e:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39c120dd0e0mr10964903f8f.19.1743550487525;
        Tue, 01 Apr 2025 16:34:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	dmkhn@proton.me
Subject: [PATCH RFC] x86/vmx: Use asm goto() in _vmx_cpu_up()
Date: Wed,  2 Apr 2025 00:34:44 +0100
Message-Id: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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

RFC.  To be rebased over Denis' general cleanup.

In principle, we can split fail into fail_valid and fail_invalid, allowing us
to spot the VMfail("VMXON executed in VMX root operation") case from the
pseduocode.  However, getting that involves a VMREAD of VM_INSTRUCTION_ERROR,
and error handling in case there isn't a loaded VMCS, so I think the
complexity is unwarranted in this case.

Bloat-o-meter:
  add/remove: 0/0 grow/shrink: 1/1 up/down: 13/-32 (-19)
  Function                                     old     new   delta
  _vmx_cpu_up.cold                            2460    2473     +13
  _vmx_cpu_up                                 1803    1771     -32

The if ( 0 ) isn't terribly nice, but it's the least bad option I could come
up with.  It does allow the structure of the switch() to remain largely
intact.
---
 xen/arch/x86/hvm/vmx/vmcs.c            | 21 ++++++++++++---------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 19 -------------------
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 0ba65becec1e..98f56b636fb3 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -749,9 +749,16 @@ static int _vmx_cpu_up(bool bsp)
     if ( bsp && (rc = vmx_cpu_up_prepare(cpu)) != 0 )
         return rc;
 
-    switch ( __vmxon(this_cpu(vmxon_region)) )
+    asm goto ( "1: vmxon %[addr]\n\t"
+               "jbe %l[fail]\n\t"
+               _ASM_EXTABLE(1b, %l[fault])
+               :
+               : [addr] "m" (this_cpu(vmxon_region))
+               :
+               : fail, fault );
+    if ( 0 ) /* asm goto error paths */
     {
-    case -2: /* #UD or #GP */
+    fault:
         if ( bios_locked &&
              test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
              (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
@@ -763,17 +770,13 @@ static int _vmx_cpu_up(bool bsp)
                    "bootloader.\n");
             return -EINVAL;
         }
-        /* fall through */
-    case -1: /* CF==1 or ZF==1 */
+    fail:
         printk("CPU%d: unexpected VMXON failure\n", cpu);
         return -EINVAL;
-    case 0: /* success */
-        this_cpu(vmxon) = 1;
-        break;
-    default:
-        BUG();
     }
 
+    this_cpu(vmxon) = 1;
+
     hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
 
     if ( cpu_has_vmx_ept )
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
 

base-commit: cff389bca78885447c8cfa381e058c6fb983df9c
-- 
2.39.5


