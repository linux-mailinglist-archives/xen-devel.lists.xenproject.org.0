Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910E9BEF3A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831044.1246192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gGB-0003Ek-84; Wed, 06 Nov 2024 13:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831044.1246192; Wed, 06 Nov 2024 13:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gGB-0003D7-4m; Wed, 06 Nov 2024 13:39:47 +0000
Received: by outflank-mailman (input) for mailman id 831044;
 Wed, 06 Nov 2024 13:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8gG9-0003Cx-Eb
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:39:45 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93eb5d68-9c44-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:39:42 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d47b38336so5093344f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:39:42 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6ae615sm21785875e9.8.2024.11.06.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:06:32 -0800 (PST)
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
X-Inumbo-ID: 93eb5d68-9c44-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkzZWI1ZDY4LTljNDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwMzgyLjcyMTA5Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900382; x=1731505182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RoSBfLejw4Kcn3H7vZdus13EaC1lB3WlrWWJRCZVH0=;
        b=iZGUkX7BtDUqOw2+BfMNoVFcjs8zQzu5cuNEcEMphMpKYM6NKo4J6isqQNmSJjx7Vk
         lkHwkQuyGhi0qcZEMDcHHkNuEixyMWxp1Zv0epLeTaJzovr2b7LFd57B6daGMQ0LO7xG
         33HGICcxQkV3fEZ/jJaSUAi3/ZRDYQkgZivbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900382; x=1731505182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RoSBfLejw4Kcn3H7vZdus13EaC1lB3WlrWWJRCZVH0=;
        b=wUo0fJkNf2luE425yiUExdKvYGyjX9ykwaaXKjeWdex3NkNuvP3mJ8T+esXkwtFtPc
         VaaEDIuLKThbs1xpFiF8QLJDfnTTYwsRw8jmge3VNiZsZ0LXxRge3nd/Mr8OOSlQX8dj
         a7T1gIsEp3wTzBsRqCr/NBaYU7Bp6jUIW3ltBqygbgrJDF/p72zX4++6kM8kpUlYfgHb
         HlHOeNAnYPlfHZBTF3Whf+d3p4n4k+Mln6m9VwxW7hxIh/c8y9bPYe1GnarfxV+/DSiP
         sQPI1nIk0XSMiSvHFH33JFDXEYjVcLVwNkhJGr6cozLPSMYCA75KiHwEL96gVtPnhOLj
         hr4Q==
X-Gm-Message-State: AOJu0YzT4rWXtZW3Y1S6rq+5DLaeKBhmv20RIlUosflQ6cxkBeivQ9+X
	nlflykXDtaRsZSKa5lsM1dQPlpyFoOk7kqohLrrU6equj12WRxr+8/JkZQNAL1JSiBXmLA7m+WI
	YYOw=
X-Google-Smtp-Source: AGHT+IHl8SNz+vXul5B+T/K1yfYzQ7WCfeo1q0YW4/izx/tc4fDc7sq1uqFZ2b2EHSAAKLJJ0/pPNw==
X-Received: by 2002:a05:600c:3586:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-4319acac8dbmr368763935e9.14.1730898393076;
        Wed, 06 Nov 2024 05:06:33 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] x86/boot: Uses nm command instead of map file to get symbols
Date: Wed,  6 Nov 2024 13:06:19 +0000
Message-Id: <20241106130620.1928109-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
References: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

combine_two_binaries.py only understands GNU LD's format, and does
not work with LLVM's LLD.

Use nm command instead to get list of symbols; specifically
BSD format as it does not truncate symbols names like sysv one.

Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile        |  3 ++-
 xen/tools/combine_two_binaries.py | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 5f832c5896..d457876659 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -66,7 +66,8 @@ $(obj)/built-in-32.tmp.o: $(obj32)
 # If possible we use --orphan-handling=error option to make sure we account
 # for all possible sections from C code.
 $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
-	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
+	$(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=o) $(filter %.o,$^)
+	$(NM) -p --format=bsd $(@:bin=o) > $(@:bin=map)
 	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
 	rm -f $(@:bin=o)
 
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 447c0d3bdb..581e57cbc0 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -29,7 +29,7 @@ parser.add_argument('--text-diff', dest='text_diff',
 parser.add_argument('--output', dest='output',
                     help='Output file')
 parser.add_argument('--map', dest='mapfile',
-                    help='Map file to read for symbols to export')
+                    help='Map file (NM) to read for symbols to export')
 parser.add_argument('--exports', dest='exports',
                     help='Symbols to export')
 parser.add_argument('--section-header', dest='section_header',
@@ -65,15 +65,20 @@ exports = []
 if args.exports is not None:
     exports = dict([(name, None) for name in args.exports.split(',')])
 
-# Parse mapfile, look for ther symbols we want to export.
+# Parse mapfile, look for symbols we want to export.
 if args.mapfile is not None:
-    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
+    exports["dummy_start"] = None
     for line in open(args.mapfile):
-        m = symbol_re.match(line)
-        if not m or m.group(2) not in exports:
+        parts = line.split()
+        if len(parts) != 3:
             continue
-        addr = int(m.group(1), 16)
-        exports[m.group(2)] = addr
+        addr, sym_type, sym = parts
+        if sym_type.upper() == 'T' and sym in exports:
+            exports[sym] = int(addr, 16)
+    if exports["dummy_start"] != 0:
+        raise Exception("dummy_start symbol expected to be present and 0")
+    del exports["dummy_start"]
+
 for (name, addr) in exports.items():
     if addr is None:
         raise Exception("Required export symbols %s not found" % name)
-- 
2.34.1


