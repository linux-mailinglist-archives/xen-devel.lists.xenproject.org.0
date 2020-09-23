Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FC27556C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1s2-0004xW-Ss; Wed, 23 Sep 2020 10:19:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqyB=DA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kL1s1-0004wv-G5
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:19:29 +0000
X-Inumbo-ID: 34009931-22d0-4464-af33-10703de874a4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34009931-22d0-4464-af33-10703de874a4;
 Wed, 23 Sep 2020 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600856369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoxTOSLbppQSggVM84mRDkAxlcirs96DUaQyCMYGXiQ=;
 b=Lk+gKZabTUCo/f3XLSmhtDjEOJpnUqD6uq5/SG5Rsz3U0Wl+D8Pjftkf
 uY98CiN5uxwkP4doRdLOcSnzQVBxmr9GsAyQ58VC6U1l8SbF8sFKPgK2I
 tIhl6Y0zetnrV3/RtQg/tfe+gwg3y67VeRKeocuP39uICQYPlGBy0zyNH A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4FV3fJhKqTJhnEkWjTxLJiEpSXRI0njWyklJHE2HVuJ3ruednX+/9b6tVohLjMejcUZw4Gk7oT
 lm0oj1uTlDWGMyCKlI2bK6qDA7fdC9b40MG6JBUwW3An1pW3JF9Wn9IyKHJWjehONf4Kz0q7kM
 dhN0L6rW/+py3yFclO29X165XCtLML4M47aWV6RS+eMJWRltuoZdWG5YWP7hTqr5LbPW+ZRvGC
 c8oxWhESQV5wrnxyvN6ib67HEk5ZkzNTf3u7y5HtuALb5U8CTvytpzonqvc0qotopog8SBBNpX
 1PU=
X-SBRS: 2.7
X-MesageID: 27692696
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,293,1596513600"; d="scan'208";a="27692696"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>
Subject: [PATCH 2/3] x86/pv: Don't clobber NT on return-to-guest
Date: Wed, 23 Sep 2020 11:18:47 +0100
Message-ID: <20200923101848.29049-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923101848.29049-1-andrew.cooper3@citrix.com>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A 64bit IRET can restore NT - the faulting case is when NT is set in the live
flags.  This change had an unintended consequence of causing the NT flag to
spontaneously disappear from guest context whenever a interrupt/exception
occurred.

In combination with a SYSENTER which sets both TF and NT, Xen's handling of
the #DB exceptions clears NT before it is even recorded suitably in the guest
kernel's view of what userspace was doing.

Reported-by: Andy Lutomirski <luto@kernel.org>
Fixes: 0e47f92b0 ("x86: force EFLAGS.IF on when exiting to PV guests")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
---
 xen/arch/x86/x86_64/compat/entry.S | 2 +-
 xen/arch/x86/x86_64/entry.S        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 73619f57ca..3b2136b272 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -119,7 +119,7 @@ compat_process_trap:
 /* %rbx: struct vcpu, interrupts disabled */
 ENTRY(compat_restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
-        mov   $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),%r11d
+        mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
 
 .macro alt_cr4_pv32
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 44a110b9c8..000eb9722b 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -182,7 +182,7 @@ restore_all_guest:
         jz    iret_exit_to_guest
 
         movq  24(%rsp),%r11           # RFLAGS
-        andq  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),%r11
+        andq  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11
         orq   $X86_EFLAGS_IF,%r11
 
         /* Don't use SYSRET path if the return address is not canonical. */
@@ -213,7 +213,7 @@ restore_all_guest:
         movq  8(%rsp), %rcx           # RIP
 /* No special register assumptions. */
 iret_exit_to_guest:
-        andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
+        andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), 24(%rsp)
         orl   $X86_EFLAGS_IF,24(%rsp)
         addq  $8,%rsp
 .Lft0:  iretq
-- 
2.11.0


