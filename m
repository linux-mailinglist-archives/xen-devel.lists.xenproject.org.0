Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932F7254C47
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpH-0005BC-IH; Thu, 27 Aug 2020 17:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpF-00056c-Vv
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:38 +0000
X-Inumbo-ID: b719676e-a99e-44f8-ae84-094ef0e20fb1
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b719676e-a99e-44f8-ae84-094ef0e20fb1;
 Thu, 27 Aug 2020 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wH4ZTnWLfQtQSCRp1fYnZ6Grjr9l6Pd0afiHDgqCHrM=;
 b=URk8jH4dLlIelqudu4rzRwNdeUQShG0rHY8NEepQE7oOKFOrW7SZrvCh
 mHgcuajCVDm9NJ3tc7yWw/+js24Pwq5w7mTLlZt+cTGDinY0NiLsgC8b7
 EShyN91dKluvuxgmViljII3t/ofUR17D8pc0ANCatTIT6hkJCLNNikF7Q s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Dp4eqhOBWYVeIn93VDxc06C/4brpxzFxj2HZtqYviwH00HLa1pwpPgLbcurwCoxtQFtDOd8OYt
 +7RzK/nCI8Esb42XURkJ/P0s/byN2IMIJJjBSYcxi4IO+/D9nBWjLQAvxH7TbMI2S62B/yPMHR
 0XHRIXVpocqoSHIl1LvZf2Ys41E8ut1zfFEnoE2r0h3xnTbQC8COMntlZIDvub1LMar0Sp7daJ
 KFNPm//L9jaDC+RQ5aZY+Ie3XsMXTO0ELSBW5PJwWW6XeUzOP3Tf9DUFNPgCMdVIomxjadqNhU
 x+M=
X-SBRS: 2.7
X-MesageID: 25595288
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25595288"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 2/9] tools/ocaml/libs/mmap: allocate correct number of bytes
Date: Thu, 27 Aug 2020 18:35:53 +0100
Message-ID: <5ca2e72eeb7cde0d8697051595c5aee5e9f667ba.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

OCaml memory allocation functions use words as units,
unless explicitly documented otherwise.
Thus we were allocating more memory than necessary,
caml_alloc should've been called with the parameter '2',
but was called with a lot more.
To account for future changes in the struct keep using sizeof,
but round up and convert to number of words.

For OCaml 1 word = sizeof(value)

The Wsize_bsize macro converts bytes to words.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index b811990a89..4d09c5a6e6 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,6 +28,8 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
+#define Wsize_bsize_round(n) (Wsize_bsize( (n) + sizeof(value) - 1 ))
+
 static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
                                int len, int offset)
@@ -57,7 +59,7 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 	default: caml_invalid_argument("maptype");
 	}
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+	result = caml_alloc(Wsize_bsize_round(sizeof(struct mmap_interface)), Abstract_tag);
 
 	if (mmap_interface_init(Intf_val(result), Int_val(fd),
 	                        c_pflag, c_mflag,
-- 
2.25.1


