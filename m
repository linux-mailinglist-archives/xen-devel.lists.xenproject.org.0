Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9EA105FB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871290.1282323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfVL-0003Kg-0M; Tue, 14 Jan 2025 11:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871290.1282323; Tue, 14 Jan 2025 11:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfVK-0003IH-T6; Tue, 14 Jan 2025 11:54:42 +0000
Received: by outflank-mailman (input) for mailman id 871290;
 Tue, 14 Jan 2025 11:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7Sb=UG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tXfVJ-0003IA-0d
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:54:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b07885-d26e-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:54:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso38629945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:54:39 -0800 (PST)
Received: from localhost.localdomain (158.79.208.46.dyn.plus.net.
 [46.208.79.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436ed48f4b2sm160187495e9.24.2025.01.14.03.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:54:38 -0800 (PST)
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
X-Inumbo-ID: 55b07885-d26e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736855679; x=1737460479; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y85RMcDcdplXx55rxPoCT7LP+dU+Acd11R/HOfjnmew=;
        b=U5+VzOgxIFUKQkrgqDsuudGX7tycZLaHUh6wvdrJ487yLOMbnBk6lUTtJS9MdNe9PT
         1lboh+TP8sC6BTMkHeEF9v2dtQLPcgirWC7/42k0v7my2KUF+fBj+8VKD/OgPAM5MJwh
         qv/yBbP+lQsWa18PJeetFuh4CrYEIi3Flc6FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855679; x=1737460479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y85RMcDcdplXx55rxPoCT7LP+dU+Acd11R/HOfjnmew=;
        b=UeOFlpM3lUZOv6RaIQlnca1rRpJlG9gSdfdkOPYmzFtN8LCY4hL0LxtFOWLlLz29fi
         q2iKOGlr1qlRIz5ga1WA7WqyAz/BpZoEbPv8BeUFxUk1M9qyFrIRVRYs74ZsZSjlT9N3
         8AfRjwiuHzLuvy0QsFxu2/NMyrKOEV0T1grDKDL1Dnl47RRCPPqMljDk9ftdAxNMkdCm
         0Xw3z5l6AUp+DLeoPCSChYx/suFOh7pTrZ8Dkb3Xx0rgrlhzUFfIb9xCTM1hrfXKey7E
         EyGs4S8BiX70Zv00NtNUezjMJhx2g0iwEWk3G4J7CfX6iRGcdPodF4y6jXBGUAd3kdAi
         DAGg==
X-Gm-Message-State: AOJu0Yz2Nogm2Hl0ckLgcTbcCGfvamBZGWXj8bnJnOsVP2f6u4IWLU8Z
	f2s8nYRsOY4EmF+LgqJnjCMoJQ0V3EtjlsmQbPpIsd3K7m3Osj16XEAD9QX2G4BRPQg5Rz3MjZE
	8
X-Gm-Gg: ASbGncvK48/egECfh51tlTSqF9kHYLoaudLM9ha4ioUU0bRxGH1eX7uQjmHu1TxrZCf
	ho192sKc+vxw08Xm/yD3zAZ8qr13VZZ1IYu7y5U/0gTcOyn+1Ekxq9qbA2ZvAegrQc5/zU4Z8Xh
	To1XJo+naXGZJaf90J2rK5ACkB7wnAtacEg3zeSRHFNPXe2w0lygLV9ZJ+7TP5kRHxtmjZgNfVx
	KEBFFdCThIHMxfGDPeGaPvy/kkVm762sU8uCAgKhPCTmEuArw1XTC39Qa2JyZMg0shoLhejG9bL
	bnEgj2wHJWSgzH+GzrZhz9ajteg=
X-Google-Smtp-Source: AGHT+IGATqBTzThg/NHUDRGkbKgnJSwL/iLwQrLZqisIJB9AcK6h2aIzUMRL6BFym81BO7yJ2o+PVA==
X-Received: by 2002:a05:600c:4713:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-436e26970bcmr230811895e9.12.1736855679019;
        Tue, 14 Jan 2025 03:54:39 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] x86/boot: Handle better alignment for 32 bit code
Date: Tue, 14 Jan 2025 11:54:30 +0000
Message-Id: <20250114115430.104084-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Output file didn't have correct alignment.
Allows alignment into data or code up to 2mb.
Intermediate object files are kept in order to copy alignment
from object produced by the linker and final object (produced
by combine_two_binaries.py script).

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile        | 12 ++++++++----
 xen/tools/combine_two_binaries.py |  7 ++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

Changes since v1:
- Improve comments and description.

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 13d4583173..a56d8a7e0f 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -40,8 +40,12 @@ LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 # are affected by both text_diff and text_gap.  Ensure the sum of gap and diff
 # is greater than 2^16 so that any 16bit relocations if present in the object
 # file turns into a build-time error.
-text_gap := 0x010200
-text_diff := 0x408020
+# As gap will affect the output section size it should not be huge to avoid the
+# creation of huge files.
+# The sum of gap and diff will affect the possible alignment so should be a
+# multiple of the possible alignment.
+text_gap := 0x01c240
+text_diff := 0x7e3dc0
 
 $(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
 $(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DAPPLY_OFFSET
@@ -69,7 +73,6 @@ $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
 	$(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=o) $(filter %.o,$^)
 	$(NM) -p --format=bsd $(@:bin=o) > $(@:bin=map)
 	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
-	rm -f $(@:bin=o)
 
 quiet_cmd_combine = GEN     $@
 cmd_combine = \
@@ -80,6 +83,7 @@ cmd_combine = \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
               --map       $(obj)/built-in-32.base.map \
+              --align     $(shell $(OBJDUMP) -h $(obj)/built-in-32.base.o|sed '/text.*2\*\*/ {s/.*2\*\*//;p;}; d') \
               --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
               --output    $@
 
@@ -90,4 +94,4 @@ $(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin
                       $(srctree)/tools/combine_two_binaries.py FORCE
 	$(call if_changed,combine)
 
-clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
+clean-files := built-in-32.*.bin built-in-32.*.map built-in-32.*.o build32.*.lds
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 581e57cbc0..8e587c24fb 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -26,6 +26,10 @@ parser.add_argument('--text-diff', dest='text_diff',
                     required=True,
                     type=auto_int,
                     help='Difference between code section start')
+parser.add_argument('--align', dest='align',
+                    default=2,
+                    type=auto_int,
+                    help='Alignment in power of 2')
 parser.add_argument('--output', dest='output',
                     help='Output file')
 parser.add_argument('--map', dest='mapfile',
@@ -93,7 +97,7 @@ if size1 > size2:
     file1, file2 = file2, file1
     size1, size2 = size2, size1
 if size2 != size1 + gap:
-    raise Exception('File sizes do not match')
+    raise Exception('File sizes do not match %d != %d + %d' % (size2, size1, gap))
 del size2
 
 file1.seek(0, 0)
@@ -219,6 +223,7 @@ print('''/*
  * File autogenerated by combine_two_binaries.py DO NOT EDIT
  */''', file=out)
 print('\t' + args.section_header, file=out)
+print('\t.p2align\t' + str(args.align), file=out)
 print('obj32_start:', file=out)
 output(out)
 print('\n\t.section .note.GNU-stack,"",@progbits', file=out)
-- 
2.34.1


