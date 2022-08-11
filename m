Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF359054B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384948.620544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXK-0001PI-Q3; Thu, 11 Aug 2022 16:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384948.620544; Thu, 11 Aug 2022 16:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXK-0001Mx-GB; Thu, 11 Aug 2022 16:59:58 +0000
Received: by outflank-mailman (input) for mailman id 384948;
 Thu, 11 Aug 2022 16:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNY-0003s9-9v
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e0c3d0a-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:51 +0200 (CEST)
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
X-Inumbo-ID: 9e0c3d0a-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMqBsfjjVcDOSywKpK4KZmm9RxQrPRiX94KjnGLwZeE=;
  b=esTkBMLnON8KtvMQ3/n6wFy9M4/npNXoli3R94UK5sINyCSX9+kESmXw
   S82pSQwVOHtrYXE5Lu2XpCN12NZ0I3dMip4mzKBl2y5vk9t6O8B6Pxktw
   F8TRFewuXEBqkSl1js95wHkzcZPXeOmdfjOAODYAfV/EVjQTgH5y+q/AW
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80449107
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kjmebK+uz0G2F9aJnS2zDrUD7H6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WVOXGmHMqmNM2ukctAnOd++ph4EvJCDn9ZqQAA4pSk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM25ayo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGM0BtPpVB3cFLUV5Ur
 90yGitTSgnZvrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQhiOSxYYONJbRmQ+1Ou22At
 lnJz1jJPVIAHdCwljmD21+V07qncSTTB9tJSezQGuRRqF+c3GsIEzUNSEC25/K+jyaWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWqSCme7u6zig/iBjJPDEUwfnEgVFE8toyLTJ4Isv7fcjpyOPfr0IWtSG6pm
 m7iQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvwjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGN4VsOvMYCbCbwN8ebhr5d7Ox0pZUM6Py/DqyEBjawSsEZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGfuR4YIhIf0+lFKeGrZCuYLHMwhkmgs/s7inkEn8uVdfDVbJIYo43KymMrllsP/Z+1WJq
 r6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:uu/C96y800x41J2pz9j0KrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80449107"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 29/32] libs/light: Rework generation of include/_libxl_*.h
Date: Thu, 11 Aug 2022 17:48:42 +0100
Message-ID: <20220811164845.38083-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Instead of moving the public "_libxl_*.h" headers, we make a copy to
the destination so that make doesn't try to remake the targets
"_libxl_*.h" in libs/light/ again.

A new .PRECIOUS target is added to tell make to not deletes the
intermediate targets generated by "gentypes.py".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/light/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 4a8b0f7bcf..9329055c98 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -215,6 +215,8 @@ libxl_internal_json.h: _libxl_types_internal_json.h
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
 $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
 
+# This exploits the 'multi-target pattern rule' trick.
+# gentypes.py should be executed only once to make all the targets.
 _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
 	$(eval stem = $(notdir $*))
 	$(PYTHON) gentypes.py libxl_type$(stem).idl __libxl_type$(stem).h __libxl_type$(stem)_private.h \
@@ -224,8 +226,10 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
 	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
 
-$(XEN_INCLUDE)/_%.h: _%.h
-	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
+.PRECIOUS: _libxl_type%.h _libxl_type%.c
+
+$(XEN_INCLUDE)/_libxl_%.h: _libxl_%.h
+	cp -f $< $@
 
 .PHONY: acpi
 acpi:
-- 
Anthony PERARD


