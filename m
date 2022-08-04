Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B7589E29
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380517.614704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPM-0001sR-Gg; Thu, 04 Aug 2022 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380517.614704; Thu, 04 Aug 2022 15:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPM-0001pb-CE; Thu, 04 Aug 2022 15:05:08 +0000
Received: by outflank-mailman (input) for mailman id 380517;
 Thu, 04 Aug 2022 15:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMPZ=YI=citrix.com=prvs=2084bc4d8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oJcPK-0001pR-Nw
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:05:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d120dfde-1406-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 17:05:04 +0200 (CEST)
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
X-Inumbo-ID: d120dfde-1406-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659625504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+XvSPGhkSE1Z7JYIaZw7tOFI2h+V4kO6R6kgf5+xW64=;
  b=aDfuyZ4eBB4NvKyWNWOS3qP5o2MY0Dz31i3wV/Z2bXSWcT9XflGDiApc
   f604ymhx7kFf4V4s0tpzVimiiHtYp6zD/p2kDeZjsYKEiUIy7afwZK3on
   psOXWIa85qS4ez7fN+2hpBleU/67T6U3PlmzqTkyQVpBT+1CwHWm9JTX9
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77380020
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ANMr33qhHPO9XXKvyR54p6DOKX17brhtdeKXEu?=
 =?us-ascii?q?qucoGZYitEo9fiigw3rTHB/vMu+OsBzOTSeNSnCs4IU2YTIz8AWJWPuvmb4K?=
 =?us-ascii?q?X+F6BLaQgz51FdQzqpjf+ZYVAVlHC8VHgAGJ+35Y8rt69mUOzoU6eggX3v0m?=
 =?us-ascii?q?CFpCDCP66c4sovqSAV1PuGqrraWgiiC9H6id5H5IOZwQnV82SAENY+Qq4nIJ?=
 =?us-ascii?q?dfZm8s9Z26+9B2O6qwbCFlEw/pozTzRAV9PdtnNiWPQrmYfwXFTBGXwwWqXI?=
 =?us-ascii?q?uRPBXvHZhialCZjxd56C9cfvPKD5cNkWiqjbo0jV+RqaHO5+BFRwOiweYsRS?=
 =?us-ascii?q?VCrvW530EeQeRkUXs51Zjvskyief97OlHOIOVsq/EIBO5lKuCA9y9BFUDNk0?=
 =?us-ascii?q?uJ6IgBgEGjXLpfmtSZ9kwE0jxrELnwQ3rl/zmVFJrzr1FIZuYZUWNeJrnpq/?=
 =?us-ascii?q?DzMrUpjBx4vH8cEpj6M7wb8aB2UMy3R/R4et5Mzp+Z9yoHsWIqjTwKW2ggUk?=
 =?us-ascii?q?eQwD7kkzPdjaNC7YaSuPaQSvQyO8qBs67QVgNOBaHKFw+Mb37P5EgbmEiNUd?=
 =?us-ascii?q?g7QrVfPCQSpH9POnafnwvTy0ZPuQTgDd2501tPP8A4rbOQ/VkPviWrwpomZb?=
 =?us-ascii?q?p2PlvKehhPiL+IFR1o0oe+S4oNXGqlJaWjyDkuC9pQlh+a/XdEjJXUxvurvK?=
 =?us-ascii?q?n7NnCi2yGP25bVhDFvkcmkFZ29Od8xGqZGTomlQ4L+H5jQb28aeVgAlUQYfm?=
 =?us-ascii?q?Di1Cw/uv6LbctgI8unj1LsHykm6iyjGJdlh/t107ybMEv/JPPjPh0zHtIkk4?=
 =?us-ascii?q?oUQlzSrT4mue6o8wSeYKDmzpi7EjT1K2AYWI575WoucbdK55uu7aPgjVT6Ao?=
 =?us-ascii?q?dsDdKUAwyvAWEMpeOqtkhwCx6HntlUbwxigTU93ilcH8j3NUKtu1mLaf8JzZ?=
 =?us-ascii?q?kXHAvTtN5//KtUP94z5r0yQrX+ukxN0mLB2fnrFTWBwnf/rRxXDXhZZZOabh?=
 =?us-ascii?q?enUHZIjqwb1ZBA5QFeXfUvMdl+W/kTNROu1RIieKf9uDMCZ7xVpRUTuHLmZc?=
 =?us-ascii?q?lRDh9BcFVsilMHRTX/c4cXvy0c5Eh6VhU539T5Xg+2F+Xdw6OkrchK4rs1I7?=
 =?us-ascii?q?HEgD8YHRvV0PtFKgTbImom2PGaRHQ25/ixctgP2dXzuqOytZHUWyZCQHgrlB?=
 =?us-ascii?q?3c6fAxcLuHLqnLqFD3pvARMopzuRllSo6AI49/kNHXNYmVqZSyWenpkysTjB?=
 =?us-ascii?q?EFJdt2KGbA4nU46Qy/KhLBkihw6U1a2LcqoJVAbaaefEQWD0f0uswa8xKAhh?=
 =?us-ascii?q?iWq6RuPhhPIcfausd8mjSyZS3r7ohA6EqgVKSuI0MYLVKjEfvhYWPRBmzJ4t?=
 =?us-ascii?q?RczDpuV+xnu6pjzAsDlRrPrrTxaK3Q2Y/iBcUBdeXqe0e7w8m+X4G8lVwRhq?=
 =?us-ascii?q?f0tssQSX3BN3u3ZdUL5gAoLXK4dVc1r0Z/Ir0hAq5HVAE1A6q2tcBc+inbjT?=
 =?us-ascii?q?Ld3g1nF7PBKMSMPvyjb+/rHdKJcTG1zQEopU+l8mksaNfbN9C8LRuspvd7/7?=
 =?us-ascii?q?q/9Qq5zBteBL+ldihvhu4NSxHe8qvCJPzd9vKTIAil4JrqCbgfLS8mJJlIgM?=
 =?us-ascii?q?TGQMAa6B+eofn81jAel4OtJx8BhM0ZnZHmf4lS5Qr2vqY6xZ+N1IUKcOg2vc?=
 =?us-ascii?q?t7WRtgiHA4JLGMa29qEXPImi8ZKu4dges4QpQbQ0eVpIQF8cuiqJvN8K9Th8?=
 =?us-ascii?q?LL9eb37jjP/68V3kOJ9uriSjOdk+Z+mBQNPJ9740Srb2EIDAvki9Bdo9t03r?=
 =?us-ascii?q?r/8bdBPcINSOJHyAyZ8GQb/Q6/6t9/e20HPLIiw5esvpOGdW4WqHo6inmgFj?=
 =?us-ascii?q?JycmiGgZlJKEtQdxFX1OzbS4qrlobqdJuqknL+NEeG8y35SXx5bPiXvkDaak?=
 =?us-ascii?q?sAi3weIQKjfH1VY3c8o86glbmiP7A+dpcFlnedoF5LtlWiEaZpBiVWwRHd1L?=
 =?us-ascii?q?mkfp0kCND/DlTgki+V/9YEOI8UPwPxUOctWLjBElxZjG922RZPHjx/AXSzvW?=
 =?us-ascii?q?mpw1eora2w8Hk3uA6e8pqcW+BWe5g25h+sxmFF0+gctMpMtiq8b4zrk7yyka?=
 =?us-ascii?q?Cbd/RhO4TbjKt1Jk4ObUFfFTf3wcttJbQ81tfpI5W0dOuk7nxPlryLxz32Ei?=
 =?us-ascii?q?JvYK3xkvFWB9yVWy7EAx8f+LcWDuEcJk+t/BPX57nbtVCV86H7drNJmgqfsf?=
 =?us-ascii?q?kgECcgsuqQwmQxvj8KNz2bOKao/4ST3mh2sIxIwv7FqWJuHARGcyLvH8THMx?=
 =?us-ascii?q?qNSmV4rV4W/e6q4VspUHvzP6IO2s5R/z0zSwnFezE9fCoj55QtXA/Q4+bkiC?=
 =?us-ascii?q?sD0cqv7sr/+4pSOFleVZzWKkkUAYuybUt+whvTmzilDkaetH2nMQn6pDyQfx?=
 =?us-ascii?q?nXA6JKNVBxP2DrP0j11IYDXIn5CdhiB/PcXRtzRF5ThM5Lsg3IyY1w5N/Vpa?=
 =?us-ascii?q?b3525FLx4VaH0nTDmhXtFA797l5z8hK4HMh6KATcUdeLuqk3A9ugAeZY64gd?=
 =?us-ascii?q?4FAYnwggIX1JpzRkOE+kLGKbW5JgKjw6XJSXhiH2IdRjAq+rTa+SUFrm8Bpy?=
 =?us-ascii?q?Y3j636/H0/tj+e2t5QChflL6QGh7kR1p6MojxNgAMdc8AY2gWCLYnbEyT717?=
 =?us-ascii?q?+JvmngLQOiI2BjKBEJRv6B3JPFylOe/SS8NIeRR7OCZ/ZTcu0UBYeUM1jgGx?=
 =?us-ascii?q?CCcB2V0LQ/WGq0ujgxP?=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77380020"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 1/4] x86/kexec: Add the '.L_' prefix to is_* and call_* labels
Date: Thu, 4 Aug 2022 16:04:21 +0100
Message-ID: <20220804150424.17584-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220804150424.17584-1-jane.malalane@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These are local symbols and shouldn't be externally visible.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 89316bc3a7..f4842025eb 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -40,10 +40,10 @@ ENTRY(kexec_reloc)
         movq    %rsi, %cr3
 
         /* Jump to identity mapped code. */
-        leaq    (identity_mapped - kexec_reloc)(%rdi), %rax
+        leaq    (.L_identity_mapped - kexec_reloc)(%rdi), %rax
         jmpq    *%rax
 
-identity_mapped:
+.L_identity_mapped:
         /*
          * Set cr0 to a known state:
          *  - Paging enabled
@@ -70,14 +70,14 @@ identity_mapped:
 
         /* Need to switch to 32-bit mode? */
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
-        jnz     call_32_bit
+        jnz     .L_call_32_bit
 
-call_64_bit:
+.L_call_64_bit:
         /* Call the image entry point.  This should never return. */
         callq   *%rbp
         ud2
 
-call_32_bit:
+.L_call_32_bit:
         /* Setup IDT. */
         lidt    compat_mode_idt(%rip)
 
@@ -102,41 +102,41 @@ relocate_pages:
         xorl    %edi, %edi
         xorl    %esi, %esi
 
-next_entry: /* top, read another word for the indirection page */
+.L_next_entry: /* top, read another word for the indirection page */
 
         movq    (%rbx), %rcx
         addq    $8, %rbx
-is_dest:
+.L_is_dest:
         testb   $IND_DESTINATION, %cl
-        jz      is_ind
+        jz      .L_is_ind
         movq    %rcx, %rdi
         andq    $PAGE_MASK, %rdi
-        jmp     next_entry
-is_ind:
+        jmp     .L_next_entry
+.L_is_ind:
         testb   $IND_INDIRECTION, %cl
-        jz      is_done
+        jz      .L_is_done
         movq    %rcx, %rbx
         andq    $PAGE_MASK, %rbx
-        jmp     next_entry
-is_done:
+        jmp     .L_next_entry
+.L_is_done:
         testb   $IND_DONE, %cl
-        jnz     done
-is_source:
+        jnz     .L_done
+.L_is_source:
         testb   $IND_SOURCE, %cl
-        jz      is_zero
+        jz      .L_is_zero
         movq    %rcx, %rsi      /* For every source page do a copy */
         andq    $PAGE_MASK, %rsi
         movl    $(PAGE_SIZE / 8), %ecx
         rep movsq
-        jmp     next_entry
-is_zero:
+        jmp     .L_next_entry
+.L_is_zero:
         testb   $IND_ZERO, %cl
-        jz      next_entry
+        jz      .L_next_entry
         movl    $(PAGE_SIZE / 8), %ecx  /* Zero the destination page. */
         xorl    %eax, %eax
         rep stosq
-        jmp     next_entry
-done:
+        jmp     .L_next_entry
+.L_done:
         popq    %rbx
         ret
 
-- 
2.11.0


