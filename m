Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0F5FDA18
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422109.667958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy3U-0002dW-IK; Thu, 13 Oct 2022 13:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422109.667958; Thu, 13 Oct 2022 13:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy3U-0002aO-Fb; Thu, 13 Oct 2022 13:15:20 +0000
Received: by outflank-mailman (input) for mailman id 422109;
 Thu, 13 Oct 2022 13:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuK-0001tl-Vq
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5ed4008-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:30 +0200 (CEST)
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
X-Inumbo-ID: b5ed4008-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMqBsfjjVcDOSywKpK4KZmm9RxQrPRiX94KjnGLwZeE=;
  b=QrKiHGYZ92LDbGYz8shrZVkph82U/Sz3sFrq66uN3CeOodLg3seSDeOn
   svXIqskoes0pwM+CUaI+HDzokBvIkgg4iVuNUo+xJxMJ0m3fmkDpapzoT
   yOBJVYY0pheZOIQWKt70War33hHpZU5nwy6OXnqhGIs58a8TzBin53Mdq
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82281658
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DAGtNqi4Qrx5uckmXImtJFX+X161ZRAKZh0ujC45NGQN5FlHY01je
 htvXz3XOfyKZDT2KYhwPImxpBkGsJDcmIBiHQc4/y48EXsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmPKsT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT1Q0
 uUfGGkGUgLdtum08qyDWsdmmf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZ8Pzh/G+
 zKuE2LRXhcwaM2mwjq+zlWvq/PqxSziXd8IC+jtnhJtqALKnTFCYPEMbnO5ruO+kVWWQM9EJ
 gof/S9Ghbc23FymSJ/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aZTYyNGgyPCQ4X1U06NvRvrkjoBjQd4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD327wk5JAVdoKiN2bGKuOGpdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QQP8YpLFffon43PyZ8OlwBd2B1yMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjWZJhcp9caQPmUwzMxPnbyOkj2
 4oAapDiJtQ2eLGWXxQ7BqZKcQBXcillW8qrwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:ZiwMNaFA3YzsrB6TpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82281658"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 13/17] libs/light: Rework generation of include/_libxl_*.h
Date: Thu, 13 Oct 2022 14:05:09 +0100
Message-ID: <20221013130513.52440-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
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


