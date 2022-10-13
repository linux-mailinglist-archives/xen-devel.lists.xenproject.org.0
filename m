Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216675FD9D4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422025.667860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu6-0003Fy-Ig; Thu, 13 Oct 2022 13:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422025.667860; Thu, 13 Oct 2022 13:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu6-00036z-9N; Thu, 13 Oct 2022 13:05:38 +0000
Received: by outflank-mailman (input) for mailman id 422025;
 Thu, 13 Oct 2022 13:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu3-0002ig-Oe
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b87e2103-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:34 +0200 (CEST)
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
X-Inumbo-ID: b87e2103-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4HJ6zZu2n6v+FIEsm8kbGG2N7wL5T8JT/E4hq3TeoGM=;
  b=PGxxjbx5qpDybNK83Kf/YmGlUbwdBv2nbj4HLTmIRbcY2Nwzp+NZ5lhO
   wWhNAttnBwZdUcvOoOMLC7fi02Ke5Jy0pRXndYagw7MaKC8DX3bLqgBjw
   lpTBSdHjJVaryl24B+wOdd+i4C/FX243/vgjGIrzg0x7IT35ms2xvO0Zf
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82635803
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:26+T5aOR6jYbhSnvrR2gl8FynXyQoLVcMsEvi/4bfWQNrUpw02MDz
 TYZCGrSOPeKZ2vwfNl1a9nj9B8Ou8CBz4JqGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr42tB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eGM5Gy81YIkx33
 N84DxEVYR+p2OWc+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZC9aoSOJ4zSHq25mG61j
 VOd80HFWCg8G9fF0hm08GmTv/P2yHaTtIU6S+Tjq68CbEeo7m4cEhoNTnOgvOK0zEW5Xrp3N
 Eg86ico668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q4temlhhyRFBE8Dk8lRDcLQiFa5PPa9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/02wMH83oJrW7FF5ufkWd4sVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4q4CKiMNoIQPcErHONiwM2JTRfJt10BbWB2yf1vU
 XtlWZzE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa3GI+Cc+ePHPBaopUItagTmghYRsPzZ+204M
 r93a6O39vmoeLSiMnSIoNBNdw1iwLpSLcmelvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:kYHX/6jxO7tncbDcChcbUVRMyHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82635803"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 07/17] libs/light/gentypes.py: allow to generate headers in subdirectory
Date: Thu, 13 Oct 2022 14:05:03 +0100
Message-ID: <20221013130513.52440-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This doesn't matter yet but it will when for example the script will
be run from tools/ to generate files tools/libs/light/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/light/gentypes.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 9a45e45acc..3fe3873242 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -584,6 +584,9 @@ def libxl_C_enum_from_string(ty, str, e, indent = "    "):
         s = indent + s
     return s.replace("\n", "\n%s" % indent).rstrip(indent)
 
+def clean_header_define(header_path):
+    return header_path.split('/')[-1].upper().replace('.','_')
+
 
 if __name__ == '__main__':
     if len(sys.argv) != 6:
@@ -598,7 +601,7 @@ if __name__ == '__main__':
 
     f = open(header, "w")
 
-    header_define = header.upper().replace('.','_')
+    header_define = clean_header_define(header)
     f.write("""#ifndef %s
 #define %s
 
@@ -648,7 +651,7 @@ if __name__ == '__main__':
 
     f = open(header_json, "w")
 
-    header_json_define = header_json.upper().replace('.','_')
+    header_json_define = clean_header_define(header_json)
     f.write("""#ifndef %s
 #define %s
 
@@ -672,7 +675,7 @@ if __name__ == '__main__':
 
     f = open(header_private, "w")
 
-    header_private_define = header_private.upper().replace('.','_')
+    header_private_define = clean_header_define(header_private)
     f.write("""#ifndef %s
 #define %s
 
-- 
Anthony PERARD


