Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4449F300B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857891.1270095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9pW-0005Mb-7C; Mon, 16 Dec 2024 12:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857891.1270095; Mon, 16 Dec 2024 12:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9pW-0005K1-3p; Mon, 16 Dec 2024 12:04:06 +0000
Received: by outflank-mailman (input) for mailman id 857891;
 Mon, 16 Dec 2024 12:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ylfk=TJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tN9pU-0004qr-2N
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:04:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7193a0d-bba5-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:04:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso16868615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:04:02 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801ace1sm7980759f8f.60.2024.12.16.04.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:04:00 -0800 (PST)
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
X-Inumbo-ID: d7193a0d-bba5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734350641; x=1734955441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/yoIKLroltRXpYfT9Moon8gt+naa50PDu8Vp+WUJzU=;
        b=lYyh8OgP82E5co/bqfleEz8ZPno5moWopavJxWLXJ4YlqS2fPgMUiO8/ejYr0nOelC
         AlZmbzXHMmN9QfFj7t9FDeVi3LbxdudpWNWquzrLQwpRgt+BbWBxcAnIKYSaoof6viFA
         hMZSPZO1nRWLwQ8RAwFNm4FV9Xti1fDMRzUQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350641; x=1734955441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/yoIKLroltRXpYfT9Moon8gt+naa50PDu8Vp+WUJzU=;
        b=HtwSPB2VEQXy/LPNukIvWCsBHU1kEcuegph1uSTcE6gus2NtubVeWCUsv6UudQGYYT
         ReaYqi7EHpkK7spj4pYgmQ8w8U2nB2ZPgZidZACE8MjRzg8YO+Tin3uwh2AwStodTjP1
         dAWXyQ6I7J8USp0KO5K/ZjgAmUhntBagXv7zX5JlkDtFLmgqLEkdxRVM6qCcwZH+t9F6
         DLOP9tRy9PGjrHS1tBf+P2Ugk6qK9fbU5yKhdxaePlfKnLwoh/Dd4BDuPQh5q7M8XPe2
         LA3OfEOGO/5RGAypbjYZfwDct5FeziDrnGp2AqXEqLEVa7/znskici2IpGK/wb5KTXc+
         weuA==
X-Gm-Message-State: AOJu0YxmsHeEbMnAzUs0jSAz+QDRH8RB1JNbvVyiDZAKwjS6vkxuQuiK
	2BT8TIpwhA57OJMo2wNnJyyjRsqIuzJxTCpHsfyMTA2FmxEx81dTjo5pnQPj7H+S3c+L9WIU6FK
	iDbM=
X-Gm-Gg: ASbGncsh+qA96XX/5gbGjFcQLAONfT1MwuCu9whmdhRnvXFEcc65OZ9mQJWqKcNTw06
	WqmUU6A/P+uxCX8hNN4flJ+8e+sARc6TqByucgxjzDXJBWCHykSRIcC+jqFjOwzCEeSxy8oW+mh
	Rc9+OGSPefk3TgGxgwklUA9nEvEkxcba8uSWIeDObWzpyCt3zgWLRepqjbA+m2ETzOjxfi69NE9
	I7Xx6/yFv7BesEmV1yc6PuNjLZJ9Ss4ObyA/PzxTjQGGj86tU7GFaSToUe44if3VLi2SIKkxudT
	S+KCu3vbpLrRuO0D00Q0Dsy2jbUfNHxf6AOG
X-Google-Smtp-Source: AGHT+IHfVHgP0OxPHXj1A3Ezf3u0VYmlcdRErHTOLjEvqMT0QjTOtv4zAbUkhBXLiOihKtSb07Cmbg==
X-Received: by 2002:a05:6000:1a86:b0:386:1cf9:b993 with SMTP id ffacd0b85a97d-38880ad9782mr10295762f8f.26.1734350641146;
        Mon, 16 Dec 2024 04:04:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH] tools/misc: Drop xensymoops
Date: Mon, 16 Dec 2024 12:03:59 +0000
Message-Id: <20241216120359.10469-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This script is not referenced by the build system, and has escaped all Python
compatibility work; it's still using print statements.

Also, the regex it uses ties it to a 32bit build of Xen, which was dropped in
Xen 4.3, 11 years ago.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 tools/misc/xensymoops | 118 ------------------------------------------
 1 file changed, 118 deletions(-)
 delete mode 100755 tools/misc/xensymoops

diff --git a/tools/misc/xensymoops b/tools/misc/xensymoops
deleted file mode 100755
index 835d187e9013..000000000000
--- a/tools/misc/xensymoops
+++ /dev/null
@@ -1,118 +0,0 @@
-#!/usr/bin/env python
-
-# An oops analyser for Xen
-# Usage: xensymoops path-to-xen.s < oops-message
-
-# There's probably some more features that could go in here but this
-# is sufficient to analyse most errors in my code ;-)
-
-# by Mark Williamson (C) 2004 Intel Research Cambridge
-
-import re, sys
-
-def read_oops():
-    """Process an oops message on stdin and return (eip_addr, stack_addrs)
-
-    eip_addr is the location of EIP at the point of the crash.
-    stack_addrs is a dictionary mapping potential code addresses in the stack
-      to their order in the stack trace.
-    """
-    stackaddr_ptn = "\[([a-z,0-9]*)\]"
-    stackaddr_re  = re.compile(stackaddr_ptn)
-
-    eip_ptn = ".*EIP:.*<([a-z,0-9]*)>.*"
-    eip_re  = re.compile(eip_ptn)
-
-    matches = 0
-    stack_addresses = {}
-    eip_addr = "Not known"
-
-    while True:
-        line = sys.stdin.readline()
-        if not line: break
-
-        m = eip_re.match(line)
-        if m: eip_addr = m.group(1)
-        
-        m = stackaddr_re.findall(line)
-    
-        for i in m:
-            stack_addresses[i] = matches
-            matches += 1
-
-    return (eip_addr, stack_addresses)
-
-def usage():
-    print >> sys.stderr, """Usage: %s path-to-asm < oops-msg
-    The oops message should be fed to the standard input.  The
-    command-line argument specifies the path to the Xen assembly dump
-    produced by \"make debug\".  The location of EIP and the backtrace
-    will be output to standard output.
-    """ % sys.argv[0]
-    sys.exit()
-
-##### main
-
-if len(sys.argv) != 2:
-    usage()
-
-# get address of EIP and the potential code addresses from the stack
-(eip_addr, stk_addrs) = read_oops()
-
-# open Xen disassembly
-asm_file = open(sys.argv[1])
-
-# regexp to match addresses of code lines in the objdump
-addr_ptn = "([a-z,0-9]*):"
-addr_re  = re.compile(addr_ptn)
-
-# regexp to match the start of functions in the objdump
-func_ptn = "(.*<[\S]*>):"
-func_re  = re.compile(func_ptn)
-
-func = "<No function>" # holds the name of the current function being scanned
-
-eip_func = "<No function>" # name of the function EIP was in
-
-# list of (position in original backtrace, code address, function) tuples
-# describing all the potential code addresses we identified in the backtrace
-# whose addresses we also located in the objdump output
-backtrace = []
-
-while True:
-    line = asm_file.readline()
-    if not line: break
-
-    # if we've read the start of the function, record the name and address
-    fm = func_re.match(line)
-    if fm:
-        func = fm.group(1)
-        continue
-
-    # try match the address at the start of the line
-    m = addr_re.match(line)
-    if not m: continue
-
-    # we're on a code line...
-
-    address = m.group(1)
-
-    # if this address was seen as a potential code address in the backtrace then
-    # record it in the backtrace list
-    if stk_addrs.has_key(address):
-        backtrace.append((stk_addrs[address], address, func))
-
-    # if this was the address that EIP...
-    if address == eip_addr:
-        eip_func = func
-
-
-print "EIP %s in function %s" % (eip_addr, eip_func)
-print "Backtrace:"
-
-# sorting will order primarily by the first element of each tuple,
-# i.e. the order in the original oops
-backtrace.sort()
-
-for (i, a, f) in backtrace:
-    print "%s in function %s" % ( a, f )

base-commit: 89dca886ac6be886f7a375612426f7661c80420b
-- 
2.39.5


