Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18AA590542
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384883.620436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWw-00051n-UB; Thu, 11 Aug 2022 16:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384883.620436; Thu, 11 Aug 2022 16:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWw-0004y2-PD; Thu, 11 Aug 2022 16:59:34 +0000
Received: by outflank-mailman (input) for mailman id 384883;
 Thu, 11 Aug 2022 16:59:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNQ-0003Aq-7B
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960c814e-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
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
X-Inumbo-ID: 960c814e-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4HJ6zZu2n6v+FIEsm8kbGG2N7wL5T8JT/E4hq3TeoGM=;
  b=Tb6q7swrxzxtJ1Hqz8dleyO9T/bahNe9tIt6Ou8aEos9pkaLzNXLAodY
   KjQF4q5MbBPrHa6JhYX2CAM8hB+QhzLzbbXhLng1t5nb4B3mv0rHkXVVP
   N096rtsMLn8Lynw8zIEFplh1qv9GFGY1IYw3004eY3FovBsNfJXEd1Q+b
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78334380
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hiIGY623NseRc55nxvbD5b9xkn2cJEfYwER7XKvMYLTBsI5bpzNVx
 jAcCmGEO/veYDShKot1Ydy39U8H7cSGmtZrQAJppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Uo35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/R/XHw1OKkcwL5uAmJsx
 9s9OCgGYB/W0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRB3Gfx1IPEZREJ8klf2krnL+bydZuBSeoq9fD237k1wqi+S2YIK9ltqiHtxXl3+Uj
 W38/WHhMDMLc8yd2CGO2yf57gPItXyiA99DfFGizdZoj0eU3Xc7EwANWB2wpvzRolG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHsazFdHGY0rOu9SqxOgonCkoSfSQKQl5QizX8m73fni4jX/46TvDt1oyqQGiuq
 9yZhHNg3utO1Kbnw43+pAma2Gz0+/AlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBho81XRdlFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 heL5lsItc8OZiHCgUpLj2WZVawXIVXIT4y5Bpg4kPIXCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mTCpYNl5DUPwP5GfnGI8gPUoDnH9WKZX7Gc+mlHxKENO2OBaodFvyGAfXMrxlsfjU/Fy9H
 hQ2H5Li9iizmdbWOkH/mbP/53hWRZTnLfgac/BqS9M=
IronPort-HdrOrdr: A9a23:LnNR96NTXvG3MsBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3/qy
 nOpoVi6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrJ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78334380"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 23/32] libs/light/gentypes.py: allow to generate headers in subdirectory
Date: Thu, 11 Aug 2022 17:48:36 +0100
Message-ID: <20220811164845.38083-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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


