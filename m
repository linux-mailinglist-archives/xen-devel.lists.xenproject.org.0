Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567049BE1AE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830621.1245693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byt-0002Ld-AP; Wed, 06 Nov 2024 09:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830621.1245693; Wed, 06 Nov 2024 09:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byt-0002Eo-4x; Wed, 06 Nov 2024 09:05:39 +0000
Received: by outflank-mailman (input) for mailman id 830621;
 Wed, 06 Nov 2024 09:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0tz=SB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t8byr-0001yg-Pp
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:05:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483db99a-9c1e-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 10:05:34 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.210.84.32])
 by support.bugseng.com (Postfix) with ESMTPSA id 651304EE0756;
 Wed,  6 Nov 2024 10:05:33 +0100 (CET)
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
X-Inumbo-ID: 483db99a-9c1e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ4M2RiOTlhLTljMWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODgzOTM0Ljg4NDk5LCJzZW5kZXIiOiJmZWRlcmljby5zZXJhZmluaUBidWdzZW5nLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1730883934; bh=etnDQcjFydFYuWuYvuYIRamKA/E4dTICXmJpGZ5Jwgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gblwzgjfOWd/OUhrCVpzeYtzQDSANzxfL+AAzVK2YZJ0wIUNCzAG1kzJTF7a1yxwj
	 0IGEmyWWSsWP39JNj78MA1bVwx73LxWrmbkrTzIFCo4Ik+Gdy1QGJbTrlQe/P9aHr3
	 evMCCxUOFGX+FBKLgoLoo/bXLXDERw2XJt+f15FZ1qrwkEGPsv4W5P6bmHTQG4Mi22
	 sBpMzsxNU6wIf6SOr5Z9bJPnmZTYY/BuKpydK/mzAV+AyR47q9xs8/SbXXClp2E76x
	 /WcU7dsJ11Q25MtttZAEnXPbLsQH50MEk889b/rdo7ztGsDzuIfTEqlwR/iLqpJa1R
	 NJosTV60UEzJw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/3] x86/emul: use pseudo keyword fallthrough
Date: Wed,  6 Nov 2024 10:04:46 +0100
Message-ID: <9be1812e391ce893afa028c05614b74cddb197b7.1730880832.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730880832.git.federico.serafini@bugseng.com>
References: <cover.1730880832.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make explicit the fallthrough intetion by adding the pseudo keyword
where missing and refactor comments not following the agreed syntax.

This satisfies the requirements to deviate violations of
MISRA C:2012 Rule 16.3 "An unconditional break statement shall
terminate every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_emulate/decode.c      | 6 ++++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 32b9276dc5..0a0751f2ed 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1356,7 +1356,8 @@ int x86emul_decode(struct x86_emulate_state *s,
                         --disp8scale;
                     break;
                 }
-                /* vcvt{,t}s{s,d}2usi need special casing: fall through */
+                /* vcvt{,t}s{s,d}2usi need special casing. */
+                fallthrough;
             case 0x2c: /* vcvtts{s,d}2si need special casing */
             case 0x2d: /* vcvts{s,d}2si need special casing */
                 if ( evex_encoded() )
@@ -1530,7 +1531,8 @@ int x86emul_decode(struct x86_emulate_state *s,
                         disp8scale -= 1 + (s->evex.pfx == vex_66);
                     break;
                 }
-                /* vcvt{,t}sh2usi needs special casing: fall through */
+                /* vcvt{,t}sh2usi needs special casing. */
+                fallthrough;
             case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
                 disp8scale = 1;
                 break;
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 30674ec301..c38984b201 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1460,6 +1460,7 @@ x86_emulate(
 
         d = (d & ~DstMask) | DstMem;
         /* Becomes a normal DstMem operation from here on. */
+        fallthrough;
     case DstMem:
         generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
         if ( state->simd_size != simd_none )
@@ -1942,6 +1943,7 @@ x86_emulate(
             break;
         }
         generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
+        fallthrough;
     case 0x88 ... 0x8b: /* mov */
     case 0xa0 ... 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
     case 0xa2 ... 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
-- 
2.43.0


