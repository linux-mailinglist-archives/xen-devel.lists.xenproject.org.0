Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CB95CD61
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 15:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782343.1191824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shU3q-0007ik-TJ; Fri, 23 Aug 2024 13:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782343.1191824; Fri, 23 Aug 2024 13:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shU3q-0007gL-Ps; Fri, 23 Aug 2024 13:10:38 +0000
Received: by outflank-mailman (input) for mailman id 782343;
 Fri, 23 Aug 2024 13:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shU3p-0007gF-Cc
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 13:10:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1481e9f8-6151-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 15:10:35 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so227325366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 06:10:33 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f436322sm259382566b.117.2024.08.23.06.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 06:10:31 -0700 (PDT)
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
X-Inumbo-ID: 1481e9f8-6151-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724418633; x=1725023433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UW85lMy3eLQqGbmm6QqWXIyMK9LIJXV5KbNrmX3uSc8=;
        b=I6UYIJbbz0u4RDVGjwQ5xW1LFC1bzvH3mLF56bItwQOge6o/VR0FgsldFsppv3g90u
         brz4edwoFBS2jkHUKDwWwmBTKUjRfhIDAjyU8RoTq/MOUi6OXpXjOxSba842/1aUlB5c
         VTv1B7HTrIcRZvF5yK3UfkNY8DTC/SvTEBKGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418633; x=1725023433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UW85lMy3eLQqGbmm6QqWXIyMK9LIJXV5KbNrmX3uSc8=;
        b=uEGmM/ASE/CS1gJMqw+mPFwFQIIuIZovgYywGg1LuJiNZEDrfF96FWKHlIZNgsGHej
         eafDhLG4hylnK3W0CR0xv+XHuYqBjNSIqtubFX4jA3I9ndXg3za1wzF07Zs39z6VQCd4
         H05GwJDkgYE74eC1kaaN2QxYsB+6CYKQjzfivVmrtFWJVnnW5o2/JUUgZj6EpF3vPbTZ
         w6ee3TTsGU5cv2sgED1U+YEHCKgLJwtbdPyyY6giENnS18fZfSqcqBfbz3ddm+s/mxHu
         O/qNGbUYK91lxuCpxHiYVyHN0v2cMgzJNnZZvLRCV89cuB3pGLjIvLMeH39epiAuHuSY
         qWgA==
X-Gm-Message-State: AOJu0YzPvTzDJWDn9g4fNLJK7fPxKTrZwjVPPdOXGvgGDBYSp/dVA6PE
	w/Af2PkYEz38GciK5XykmAykY1zNH4uaIdb6Vl18GgyXJ6QxQt9UIVFVoiHVSiNh8ZjR2u1ztsR
	u
X-Google-Smtp-Source: AGHT+IF5Jv2uhbCVqySaIYOjBbU2IqNlpZqEyA63pgmRS5QFhGyO9e7Xi1DkxU8XFbqZ3yqs15660Q==
X-Received: by 2002:a17:907:d59a:b0:a86:91c3:9517 with SMTP id a640c23a62f3a-a86a52eb66bmr168805666b.35.1724418632091;
        Fri, 23 Aug 2024 06:10:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86/boot: Preserve the value clobbered by the load-base calculation
Date: Fri, 23 Aug 2024 14:10:29 +0100
Message-Id: <20240823131029.1025984-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Right now, Xen clobbers the value at 0xffc when performing it's load-base
calculation.  We've got plenty of free registers at this point, so the value
can be preserved easily.

This fixes a real bug booting under Coreboot+SeaBIOS, where 0xffc happens to
be the cbmem pointer (e.g. Coreboot's dmesg ring, among other things).

However, there's also a better choice of memory location to use than 0xffc, as
all our supported boot protocols have a pointer to an info structure in %ebx.

Update the documentation to match.

Fixes: 1695e53851e5 ("x86/boot: Fix the boot time relocation calculations")
Fixes: d96bb172e8c9 ("x86/entry: Early PVH boot code")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

v3:
 * Use plain MOV for preserve/restore.  It's easier to follow than pop/pop.
 * Update how-xen-boots.rst too.

Superceeds https://lore.kernel.org/xen-devel/20240822140044.441126-1-frediano.ziglio@cloud.com/T/#u
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 12 ++++++--
 xen/arch/x86/boot/head.S                    | 33 ++++++++++++++-------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index ca77d7c8a333..f1878ad7897f 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -96,6 +96,12 @@ Xen, once loaded into memory, identifies its position in order to relocate
 system structures.  For 32bit entrypoints, this necessarily requires a call
 instruction, and therefore a stack, but none of the ABIs provide one.
 
-Overall, given that on a BIOS-based system, the IVT and BDA occupy the first
-5/16ths of the first page of RAM, with the rest free to use, Xen assumes the
-top of the page is safe to use.
+In each supported 32bit entry protocol, ``%ebx`` is a pointer to an info
+structure, and it is highly likely that this structure does not overlap with
+Xen.  Therefore we use this as as a temporary stack, preserving the prior
+value, in order to calculate Xen's position in memory.
+
+If this heuristic happens to be wrong (most likely because we were booted by
+some other protocol), the calculation stills works as long as ``%ebx`` points
+at RAM and does not alias the currently-executing instructions.  This is
+reasonably likely, and the best we can manage given no other information.
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494db..994819826b01 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -414,17 +414,23 @@ __pvh_start:
         cli
 
         /*
-         * We need one push/pop to determine load address.  Use the same
-         * absolute stack address as the native path, for lack of a better
-         * alternative.
+         * We need one call (i.e. push) to determine the load address.  See
+         * __start for a discussion on how to do this safely using the PVH
+         * info structure.
          */
-        mov     $0x1000, %esp
+
+        /* Preserve the field we're about to clobber. */
+        mov     (%ebx), %edx
+        lea     4(%ebx), %esp
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore the clobbered field. */
+        mov     %edx, (%ebx)
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
@@ -460,21 +466,26 @@ __start:
         /*
          * Multiboot (both 1 and 2) specify the stack pointer as undefined
          * when entering in BIOS circumstances.  This is unhelpful for
-         * relocatable images, where one push/pop is required to calculate
-         * images load address.
+         * relocatable images, where one call (i.e. push) is required to
+         * calculate images load address.
          *
-         * On a BIOS-based system, the IVT and BDA occupy the first 5/16ths of
-         * the first page of RAM, with the rest free for use.  Use the top of
-         * this page for a temporary stack, being one of the safest locations
-         * to clobber.
+         * This early in boot, there is one area of memory we know about with
+         * reasonable confidence that it isn't overlapped by Xen, and that's
+         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
          */
-        mov     $0x1000, %esp
+
+        /* Preserve the field we're about to clobber. */
+        mov     (%ebx), %edx
+        lea     4(%ebx), %esp
 
         /* Calculate the load base address. */
         call    1f
 1:      pop     %esi
         sub     $sym_offs(1b), %esi
 
+        /* Restore the clobbered field. */
+        mov     %edx, (%ebx)
+
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 

base-commit: 8ffcf184affbc2ff1860dabe1757388509d5ed67
-- 
2.39.2


