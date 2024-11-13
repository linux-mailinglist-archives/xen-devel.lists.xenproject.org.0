Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E919C6A77
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835090.1250940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8an-0002Zt-Bv; Wed, 13 Nov 2024 08:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835090.1250940; Wed, 13 Nov 2024 08:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8an-0002XH-80; Wed, 13 Nov 2024 08:19:13 +0000
Received: by outflank-mailman (input) for mailman id 835090;
 Wed, 13 Nov 2024 08:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFwE=SI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tB8al-00024i-7w
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:19:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f30f5970-a197-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 09:19:06 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [37.161.56.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 71BCC4EE0745;
 Wed, 13 Nov 2024 09:19:05 +0100 (CET)
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
X-Inumbo-ID: f30f5970-a197-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYzMGY1OTcwLWExOTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg1OTQ2LjM5NDQzOSwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731485946; bh=oa8iDxsjooS/dRqIrMyxI6lLIJn2LA0m/dddYZG8toI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RB0u3r6kzo5LIe57aVX4bTyj8GBJ5PgAsfoKMbuO+jRFFvsyqHD5Dny8qHXnWDxt5
	 QhWEIHg6A6hv8U1ahvvhqta+IOssIW+I5neanW3yWGfPO50+6IlEOiZZ5ufOAIRdT+
	 TUMI+bm9eO7RzK5+9ceLjfeAIj9T83lPslxVg2SL1U90i/9qOjRAem2rXfaCCIuIND
	 72kol/eBr8svobwXnfAkzv7Z6I4cyUxDwGfvMmvDavicY9bpcZTiRpDNK1jyV0nvH1
	 JaTiBmSdIv5aK2msv0K1Ju+3UjYAVn7CR/zuX3ROYzgYy6oWYjDuIEptHPgZCKRdiR
	 3RzKCVD5Gte/g==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/3] x86/emul: use pseudo keyword fallthrough
Date: Wed, 13 Nov 2024 09:17:27 +0100
Message-ID: <b8bf155274a31459cbaab9a435db105fc6372e4a.1731485149.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1731485149.git.federico.serafini@bugseng.com>
References: <cover.1731485149.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make explicit the fallthrough intention by adding the pseudo keyword
where missing and replace fallthrough comments not following the
agreed syntax.

This satisfies the requirements to deviate violations of
MISRA C:2012 Rule 16.3 "An unconditional break statement shall
terminate every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
No changes from v1.
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


