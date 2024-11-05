Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C617B9BCFCF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830380.1245367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kxn-0007TW-EK; Tue, 05 Nov 2024 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830380.1245367; Tue, 05 Nov 2024 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kxn-0007RL-BC; Tue, 05 Nov 2024 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 830380;
 Tue, 05 Nov 2024 14:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yqe/=SA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8Kxl-0007K3-VY
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:55:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f935b9f3-9b85-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:55:18 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so65741235e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:55:18 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd917fefsm217655855e9.16.2024.11.05.06.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:55:17 -0800 (PST)
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
X-Inumbo-ID: f935b9f3-9b85-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5MzViOWYzLTliODUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE4NTE4Ljc3NDMwNCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730818518; x=1731423318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA+yf6mA3UaqtqgegBX9AbB2F7eAE7dWMPKa4nk3rUI=;
        b=gBoXWZON9nUTgSgQ9bGzHDehVZygPzDPkyg24bpnJpGrnmSFpPaPa46y6662OYgftL
         IVi5cTYGzD+6Ce/RoQFPGce/804Mxj8ySM6+RKnj44B0NpSJM4G7LD6L2issNueukj0I
         gkIRPy4Xy1lHdj1CNDETiwnP76CmUV2ZeODtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730818518; x=1731423318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA+yf6mA3UaqtqgegBX9AbB2F7eAE7dWMPKa4nk3rUI=;
        b=O2/sc707QCehZPggPz3T4BgM9g1nomqB6VZrULQpnLcEwH9ttHHO/hsZAs2+/juSlq
         gukAU3BDoT8sZRepP9Fiq/BgM0wUPQvhVpM+5R4ZQITHC4caAP11vSy2oc0jk7C14+zp
         l/gC7P2GHfUYzhE9bAGoYJe2B6MFyrW5KOcm+B+ZYBsNHSSvHY+j9jDPIOZ/YF7Ev3GR
         Mp4NqidatJyQn1ZZalOjubb0Ae3eK0RIjQ8V9ZVE/wYNePWUU/FKqrhHftlYvBYnvFpT
         RXM5fF+2SB/Seo8xdSVKDweW9CIpwaX1pzUjw499oyxJDi4GxISCBvIrNfgwLPs4RM1g
         D/Wg==
X-Gm-Message-State: AOJu0YztrzXLRFTF+JuWz+bfE1GfdEUsgAVPWysLZwwhtORhBQSTaDXO
	oYzk+I7X3eNK5FuWsl9JBr4+akjrOnE3Hxl8G9nLTTDq6lvPj24CzKkOW5az3O7P0Bes7yfpClu
	6sxk=
X-Google-Smtp-Source: AGHT+IFvz2u+n9ZttcoxNUWJKA4cbObvSacG2uE5RJGfK/Wa8/ORoBU2jXSg2Sxt9Sl6m7P+yg+aGA==
X-Received: by 2002:a05:600c:3b04:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-43283242a2bmr164724875e9.6.1730818517876;
        Tue, 05 Nov 2024 06:55:17 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/boot: Fix build with LLVM toolchain
Date: Tue,  5 Nov 2024 14:55:07 +0000
Message-Id: <20241105145507.613981-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This toolchain generates different object and map files.
Account for these changes.
Added sections need to have special type so we put them in
separate sections as linker will copy type from input sections.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S   |  9 +++++++++
 xen/tools/combine_two_binaries.py | 17 +++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index f20fc18977..2e565180d5 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -66,6 +66,15 @@ SECTIONS
        *(.comment.*)
        *(.note.*)
   }
+  .shstrtab : {
+       *(.shstrtab)
+  }
+  .strtab : {
+       *(.strtab)
+  }
+  .symtab : {
+       *(.symtab)
+  }
   /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
   .got : {
         *(.got)
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 447c0d3bdb..79ae8900b1 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -67,13 +67,22 @@ if args.exports is not None:
 
 # Parse mapfile, look for ther symbols we want to export.
 if args.mapfile is not None:
-    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
+    symbol_re_clang = \
+        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s{15,}(\S+)\n')
+    symbol_re_gnu = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
     for line in open(args.mapfile):
-        m = symbol_re.match(line)
-        if not m or m.group(2) not in exports:
+        name = None
+        m = symbol_re_clang.match(line)
+        if m:
+            name = m.group(5)
+        else:
+            m = symbol_re_gnu.match(line)
+            if m:
+                name = m.group(2)
+        if name is None or name not in exports:
             continue
         addr = int(m.group(1), 16)
-        exports[m.group(2)] = addr
+        exports[name] = addr
 for (name, addr) in exports.items():
     if addr is None:
         raise Exception("Required export symbols %s not found" % name)
-- 
2.34.1


