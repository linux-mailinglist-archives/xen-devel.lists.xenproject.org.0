Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB59BE5D4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830780.1245872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQI-0007ti-Py; Wed, 06 Nov 2024 11:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830780.1245872; Wed, 06 Nov 2024 11:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQI-0007qd-MC; Wed, 06 Nov 2024 11:42:06 +0000
Received: by outflank-mailman (input) for mailman id 830780;
 Wed, 06 Nov 2024 11:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8eQG-0007aw-QF
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:42:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23bce103-9c34-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:42:02 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so3793776f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:42:02 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7465sm18840783f8f.53.2024.11.06.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:42:01 -0800 (PST)
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
X-Inumbo-ID: 23bce103-9c34-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIzYmNlMTAzLTljMzQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkzMzIyLjU1MzQwOSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730893322; x=1731498122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqBG/ejxY0G3tcFASKQ8s4CSPdRpi1GybkGCC/y1PZI=;
        b=M0LKNKb4MzltoxZVOmCmo1FazkBchinZQZ1MkT22ddDEa2SVKMQJK9Okw2z3ngevdM
         42+G+Qm12FH3g773b+yfsU5kGNc4DksYon/DelUKmXXKK9dw2uCdfJzgyGyOIHqrIPw9
         EXvFk9yh7klEMrXEIvC0bJeoXgKXjocqZ4D9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893322; x=1731498122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqBG/ejxY0G3tcFASKQ8s4CSPdRpi1GybkGCC/y1PZI=;
        b=cMznNoGnkn38aZ5QNkSscRxFIXCzBM2ntLpuFe+s289RQF8S/dMAI/y1lhB3s6C9E2
         S8GazyjeC8OI9101hPS1/rWAYXAhMJzV4SArU04m6A3DzRCru94ZKTZDCu03BpOGf8gj
         UsOaZiUi05i/i0UKC38MtobQ5964ZjSDANFRdrFFIKkwRZjtsfa73PuUtY6TFeiUwUjG
         E4AwbItmVWn5v2+NmVw7KQbSm6RNBvOPpcE56lzQQPjZWkkQD9qY4gho0iLV6Y4ogTFS
         3ih3cBOgpg7azJUihvICq787TTC7stW1jhRZM8G0duniSJTEMdLpx6UUhHYpHW4XeYXn
         I1hA==
X-Gm-Message-State: AOJu0Yz7vSf9Zq/oY/oxI3wHTyWCsAwcYa/vpkCGe62B/1coat1rmqKp
	WwgPX+Zra4JhUPBiP8JlVGxfuwefTFcqzqbLHjOmrJqF1n8yCMK6QP86C7+WIoQsnJeYjx/OTrK
	umlY=
X-Google-Smtp-Source: AGHT+IFD0Xyd4TJ84//eoDdUUxQkCWpWoZGmc7QsnwCtLxo/N+BKH3P92x9UO8Aq7fy35wObAzOaEA==
X-Received: by 2002:adf:f204:0:b0:37d:39aa:b9f4 with SMTP id ffacd0b85a97d-381b708ae51mr18136525f8f.26.1730893321695;
        Wed, 06 Nov 2024 03:42:01 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] x86/boot: Uses nm command instead of map file to get symbols
Date: Wed,  6 Nov 2024 11:41:49 +0000
Message-Id: <20241106114150.1432512-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map file format is not standard making it code readind it
not portable and potentially hard to maintain.
Use nm command instead to get list of symbols; specifically
BSD format as it does not truncate symbols names like sysv one.

Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile        |  5 +++--
 xen/tools/combine_two_binaries.py | 28 ++++++++++++++++++----------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 777b4befeb..01100a4b72 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -67,7 +67,8 @@ $(obj)/built-in-32.tmp.o: $(obj32)
 # If possible we use --orphan-handling=error option to make sure we account
 # for all possible sections from C code.
 $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
-	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
+	$(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=o) $(filter %.o,$^)
+	$(NM) -p --format=bsd $(@:bin=o) > $(@:bin=nm)
 	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
 	rm -f $(@:bin=o)
 
@@ -79,7 +80,7 @@ cmd_combine = \
               --script    $(obj)/build32.base.lds \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
-              --map       $(obj)/built-in-32.base.map \
+              --symbols   $(obj)/built-in-32.base.nm \
               --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
               --output    $@
 
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 447c0d3bdb..db02494b28 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -28,8 +28,8 @@ parser.add_argument('--text-diff', dest='text_diff',
                     help='Difference between code section start')
 parser.add_argument('--output', dest='output',
                     help='Output file')
-parser.add_argument('--map', dest='mapfile',
-                    help='Map file to read for symbols to export')
+parser.add_argument('--symbols', dest='symbols_file',
+                    help='Nm command output to read for symbols to export')
 parser.add_argument('--exports', dest='exports',
                     help='Symbols to export')
 parser.add_argument('--section-header', dest='section_header',
@@ -65,15 +65,23 @@ exports = []
 if args.exports is not None:
     exports = dict([(name, None) for name in args.exports.split(',')])
 
-# Parse mapfile, look for ther symbols we want to export.
-if args.mapfile is not None:
-    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
-    for line in open(args.mapfile):
-        m = symbol_re.match(line)
-        if not m or m.group(2) not in exports:
+# Parse symbols file, look for symbols we want to export.
+if args.symbols_file is not None:
+    dummy_start = -1
+    for line in open(args.symbols_file):
+        v = line.split()
+        if len(v) != 3 or v[1].upper() != 'T':
             continue
-        addr = int(m.group(1), 16)
-        exports[m.group(2)] = addr
+        addr = int(v[0], 16)
+        if v[2] == 'dummy_start':
+            dummy_start = addr
+            continue
+        if v[2] not in exports:
+            continue
+        exports[v[2]] = addr
+    if dummy_start != 0:
+        raise Exception("dummy_start symbol expected to be present and 0")
+
 for (name, addr) in exports.items():
     if addr is None:
         raise Exception("Required export symbols %s not found" % name)
-- 
2.34.1


