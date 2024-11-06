Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E281C9BEE2A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830943.1246061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft2-0000cX-1M; Wed, 06 Nov 2024 13:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830943.1246061; Wed, 06 Nov 2024 13:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft1-0000aC-Sl; Wed, 06 Nov 2024 13:15:51 +0000
Received: by outflank-mailman (input) for mailman id 830943;
 Wed, 06 Nov 2024 13:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8fsz-0000Zv-VZ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:15:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2813688-9c3f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:13:24 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso52326685e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:07:48 -0800 (PST)
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
X-Inumbo-ID: f2813688-9c3f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyODEzNjg4LTljM2YtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk4OTEwLjIyMDcxLCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730898393; x=1731503193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RoSBfLejw4Kcn3H7vZdus13EaC1lB3WlrWWJRCZVH0=;
        b=ID41hzumXzLTv0l1N8kGFeugR5diwB+PC+Vlg8hXY8q3aqurp2Ux1+FR6JBkCGFRvq
         14EqxIC2U0ajsPcBATnK9+MqqjOe+8hlYaFpewuDozwIPhd4ZVoOl5HtQeuA1SGqbwXr
         TNlwMpi9G0QotMB5Toi4p503AN/uiK5VCuCaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730898393; x=1731503193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RoSBfLejw4Kcn3H7vZdus13EaC1lB3WlrWWJRCZVH0=;
        b=Sk6YS8qDeNFltMOLEVoUdljTeIiywo8QJr7sgSwUdxoYG8ZRkUrwtnI4fzqGCWuzIu
         Bl4TDiXUe8zUXkklH3+bEwSMOs0/ECJtUaMpkvNW0wCWr7PRxJndOCb7xSLg4Uvpke9l
         JsWhzbQJsD2FoGg8637SC3Nynfv/4l0v4TzOj4CZ3VQ/s3obpcteN1ZoXOwZU61Wt87Z
         wRk/dTK+Rtl5phqp/dAm9kWlQNoehiHwcQydHWDqJ/UnkNzFjyrgf5ct1pPgvYlgLGLT
         Dyd0xP9wNO0x4vsqlOC0o4ygZ/+rI/AtJnAhL8DY4vaqHpwrfUA6Y6sxVZhRToonVrXZ
         2PYQ==
X-Gm-Message-State: AOJu0YytL6EHAzG56LbViKL5nRQOwG04dLKL5bcJm4Kkd+Qkr8VO/ikS
	j1qjoKuxPJmHRA+v6k1rUW/7eUcQQXpt0eYILVVSp5117l1caAcqMUuxn1ZqJaJADl8zccUvkEZ
	C59A=
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


