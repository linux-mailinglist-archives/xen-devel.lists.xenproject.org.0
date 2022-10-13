Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E195FDA24
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422141.668001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy4P-0004Nk-OD; Thu, 13 Oct 2022 13:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422141.668001; Thu, 13 Oct 2022 13:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy4P-0004Kl-Kg; Thu, 13 Oct 2022 13:16:17 +0000
Received: by outflank-mailman (input) for mailman id 422141;
 Thu, 13 Oct 2022 13:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuQ-0002ig-ME
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3cfa8c6-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:53 +0200 (CEST)
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
X-Inumbo-ID: c3cfa8c6-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yZl8f6nskAbfIqIwFywI0ObjvI50ZytLF896MN4MC2E=;
  b=XxnQtvS0tflVy8S9caQQJq0chyqtNj67qLALNnpgj5bkpjD4MxgqS4p/
   GCncRIlG0i5MpNi/3C9iraubyGQqk7MF7Fil1ZuHaBFWxK65ZqKI76oM0
   NWU5HNWe9oLBs81ntKSHoALZaKVJDu9JUL86kOpeqbx9sQX2o/6p8QFTA
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83071574
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g4V3VKB6T0bjpBVW/zTjw5YqxClBgxIJ4kV8jS/XYbTApG4kg2ZRy
 mseWDuDPvqDN2egetp+Ydiw/EpXusXUm9VrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2p4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k8B4s9q8dORlgR3
 u0pNDYJQEyuvMuflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oi2aIWMJ4PWLSlTtn7Fh
 D3roEP+OR0hJv+v22a37UCLm/CayEsXX6pNTeblp5aGmma73GsIAgcRUli9ifa8g0+6HdlYL
 iQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iIsJiDeeb+8kKfGen+zpHzXen
 x2xhQFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzhVyyflnY
 cnEKJzE4ZMm5UNPlWPeegvg+eVzmnBWKZ37H/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpLSoyizpcWkPUE7B6ZPcg1RRZX6bLiqw/Fqmhmre1Y2RT5wVaGLnNvMueVNxsxoqwsBx
 VnlMmcw9bY1rSCvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:pjK8NKspIVwuF3I4bWluNzSI7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="83071574"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework gengotypes.py and generation of *.gen.go
Date: Thu, 13 Oct 2022 14:05:12 +0100
Message-ID: <20221013130513.52440-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gengotypes.py creates both "types.gen.go" and "helpers.gen.go", but
make can start gengotypes.py twice. Rework the rules so that
gengotypes.py is executed only once.

Also, add the ability to provide a path to tell gengotypes.py where to
put the files. This doesn't matter yet but it will when for example
the script will be run from tools/ to generate the targets.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---

Notes:
    v5:
    - released-acked to fix occasional CI build issue
    
    v4:
    - new patch

 tools/golang/xenlight/Makefile      |  6 ++++--
 tools/golang/xenlight/gengotypes.py | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 00e6d17f2b..c5bb6b94a8 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -15,8 +15,10 @@ all: build
 
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
-%.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
-	LIBXL_SRC_DIR=$(LIBXL_SRC_DIR) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
+# This exploits the 'multi-target pattern rule' trick.
+# gentypes.py should be executed only once to make all the targets.
+$(subst .gen.,.%.,$(GOXL_GEN_FILES)): gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
+	LIBXL_SRC_DIR=$(LIBXL_SRC_DIR) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(@D)/types.gen.go $(@D)/helpers.gen.go
 
 # Go will do its own dependency checking, and not actuall go through
 # with the build if none of the input files have changed.
diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index ac1cf060dd..ff4c2ad216 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -723,7 +723,13 @@ def xenlight_golang_fmt_name(name, exported = True):
     return words[0] + ''.join(x.title() for x in words[1:])
 
 if __name__ == '__main__':
+    if len(sys.argv) != 4:
+        print("Usage: gengotypes.py <idl> <types.gen.go> <helpers.gen.go>", file=sys.stderr)
+        sys.exit(1)
+
     idlname = sys.argv[1]
+    path_types = sys.argv[2]
+    path_helpers = sys.argv[3]
 
     (builtins, types) = idl.parse(idlname)
 
@@ -735,9 +741,11 @@ if __name__ == '__main__':
 // source: {}
 
 """.format(os.path.basename(sys.argv[0]),
-           ' '.join([os.path.basename(a) for a in sys.argv[1:]]))
+           os.path.basename(sys.argv[1]))
 
     xenlight_golang_generate_types(types=types,
+                                   path=path_types,
                                    comment=header_comment)
     xenlight_golang_generate_helpers(types=types,
+                                     path=path_helpers,
                                      comment=header_comment)
-- 
Anthony PERARD


