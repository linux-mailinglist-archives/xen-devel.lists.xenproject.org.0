Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA61C2114
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUehm-0001Av-7x; Fri, 01 May 2020 23:04:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUehk-0001Ad-J0
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:24 +0000
X-Inumbo-ID: 1779f240-8c00-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1779f240-8c00-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 23:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HdmjgF6D28Zm4TcRg1rdSfUjLRRQBlEC1IznYRSCjQ=;
 b=KNNp+gbapOKdSfOCeWRD8NK8qtexsKixwsdTUuELxQEIqnupsNlkQm8B
 s2/ML2342gRREcHTI4Ug26K3Wqq5Bgy34C7OMTLxUolB97dCUFn6Y/yKo
 r5Ut1BEpY/VkrTj8DiP54+Cedw1PBRkIB/xmyZW2UTa4zPFnxdHmiTsWV g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V6SFzoHHkY51sW4Cww8TJ2Z4t6bksd+bmW8hNop1qzs5IfwqLPCX6DhPY3lmIO4x0k91u4Tl+5
 Q3yoaFOFI0bDWvpc32p3mXv5uDq36txwkI9u615vvf/bN1cNXNfwcPigtV6yFhjOMFAV2pO115
 n4jaEypIRuhd5AWjfYWhhCqj9LDNIec9PegiXvJibGt14RJ7+WgjbN/mSkWS5TWN3IPYSGVjlt
 HBlgtPNhSyM8R20u8iLCWAqHq5Ie0BNsDykjyE9S22fSt13dz4BDZ4gra6gkaC2dbpsA5IVtbj
 CXo=
X-SBRS: 2.7
X-MesageID: 17294146
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="17294146"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
Date: Fri, 1 May 2020 23:58:37 +0100
Message-ID: <20200501225838.9866-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The SYSCALL/SYSEXIT paths need to use {SET,CLR}SSBSY.  The IRET to guest paths
must not, which forces us to spill a register to the stack.

The IST switch onto the primary stack is not great as we have an instruction
boundary with no shadow stack.  This is the least bad option available.

These paths are not used before shadow stacks are properly established, so can
use alternatives to avoid extra runtime CET detection logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/compat/entry.S |  2 +-
 xen/arch/x86/x86_64/entry.S        | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 3cd375bd48..7816d0d4ac 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -198,7 +198,7 @@ ENTRY(cr4_pv32_restore)
 
 /* See lstar_enter for entry register state. */
 ENTRY(cstar_enter)
-        /* sti could live here when we don't switch page tables below. */
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
         CR4_PV32_RESTORE
         movq  8(%rsp),%rax /* Restore %rax. */
         movq  $FLAT_USER_SS32, 8(%rsp) /* Assume a 64bit domain.  Compat handled lower. */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 06da350ba0..91cd8f94fd 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -194,6 +194,15 @@ restore_all_guest:
         movq  8(%rsp),%rcx            # RIP
         ja    iret_exit_to_guest
 
+        /* Clear the supervisor shadow stack token busy bit. */
+.macro rag_clrssbsy
+        push %rax
+        rdsspq %rax
+        clrssbsy (%rax)
+        pop %rax
+.endm
+        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
+
         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
         movq  32(%rsp),%rsp           # RSP
         je    1f
@@ -226,7 +235,7 @@ iret_exit_to_guest:
  * %ss must be saved into the space left by the trampoline.
  */
 ENTRY(lstar_enter)
-        /* sti could live here when we don't switch page tables below. */
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
         movq  8(%rsp),%rax /* Restore %rax. */
         movq  $FLAT_KERNEL_SS,8(%rsp)
         pushq %r11
@@ -877,6 +886,14 @@ handle_ist_exception:
         movl  $UREGS_kernel_sizeof/8,%ecx
         movq  %rdi,%rsp
         rep   movsq
+
+        /* Switch Shadow Stacks */
+.macro ist_switch_shstk
+        rdsspq %rdi
+        clrssbsy (%rdi)
+        setssbsy
+.endm
+        ALTERNATIVE "", ist_switch_shstk, X86_FEATURE_XEN_SHSTK
 1:
 #else
         ASSERT_CONTEXT_IS_XEN
-- 
2.11.0


