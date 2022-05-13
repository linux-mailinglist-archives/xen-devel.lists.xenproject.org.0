Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C71526301
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 15:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328471.551491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npVSW-0007ZW-PD; Fri, 13 May 2022 13:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328471.551491; Fri, 13 May 2022 13:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npVSW-0007Wk-KL; Fri, 13 May 2022 13:35:56 +0000
Received: by outflank-mailman (input) for mailman id 328471;
 Fri, 13 May 2022 13:35:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K7m=VV=citrix.com=prvs=125a2c5b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1npVSV-0007We-K0
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 13:35:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6eef33-d2c1-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 15:35:53 +0200 (CEST)
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
X-Inumbo-ID: 9b6eef33-d2c1-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652448953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WRWK83Ad0gqdtXIb6eH1JRxvjxjGgMLq2Q+ZHpZWiwI=;
  b=aQQRI8JMCdCTj0A20leV4EFR1iyZSVgrx3Xvzq7PSHZsBezEXS5kc/3o
   F7BC2/rpDY3nyRoatMseZx6Xw0Ng0EN4OQ1dbAeSZmXPYakT5epw3Lmvl
   8yH8xENWDEOpAu+8VxHigURprx7qdfHy1zFuFwJdVUVqii6eHRds2JGt1
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71265582
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4Bkv2qC1Myr8FhVW/0/jw5YqxClBgxIJ4kV8jS/XYbTApDpz3zMEy
 WIYXWrQM/7bM2Pxeth2aong9x4Gu5fQydZgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhAw
 oRU6s2xTDsAGaPigcQHfhpzDi9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8XR6iDO
 ppDAdZpRDL6eAxhOhQ1MosVuMiJpUTwQxNo92vA8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1Zuj3DgTn8X+Bgjc7VfRJM/cX6yqQxJOBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG5+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrCZovm07vUr/t2uVgbJJgKTysTDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmCG2g43Q8Z5r271k5JGQWy3yGskTHqFz+5eIWO5C
 KMtkV05CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps04nfIVCqWdgDSvpXk0DWbJhjiFuBF1wckXZ
 MbAGe7xXClyNEiS5GfvLwvr+eRzln5WKKK6bc2T8ilLJpLEOiHPFedeYAvmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:3HJ+b6MtrLTlk8BcTsujsMiBIKoaSvp037Eqv3ofdfUzSL38qy
 nOpoV96faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQOTXeVfBODZrQEIdReTygck79
 YCT5RD
X-IronPort-AV: E=Sophos;i="5.91,223,1647316800"; 
   d="scan'208";a="71265582"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to build OVMF
Date: Fri, 13 May 2022 14:35:34 +0100
Message-ID: <20220513133534.88564-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recent versions of OVMF now need a version of NASM that is newer
than the one available on Debian oldstable/buster. They want to use
NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
need to use a newer version started with d3febfd9ade3 ("MdePkg:
Replace Opcode with the corresponding instructions.").

There is no backport package available but the nasm package from
Debian Bullseye can easily be installed on Buster as it has few
dependencies and are already satisfied.

[1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
    ("BaseTools: Upgrade the version of NASM tool")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-build-prep | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 67b3eae62155..38d4a8e79451 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -250,6 +250,15 @@ END
     if ($ho->{Arch} eq 'amd64' && $ho->{Suite} !~ m/squeeze|lenny/) {
         target_install_packages($ho, 'libc6-dev-i386');
     }
+
+    # Use newer version of NASM, for OVMF
+    if ($ho->{Suite} =~ m/buster/) {
+        my $nasm_pkg = "nasm_2.15.05-1_$ho->{Arch}.deb";
+        my $nasm_url = debian_mirror_url_suite_arch("bullseye", $ho->{Arch})
+                       ."/pool/main/n/nasm/$nasm_pkg";
+        target_fetchurl($ho, $nasm_url, "/tmp/$nasm_pkg");
+        target_install_packages($ho, "/tmp/$nasm_pkg");
+    }
 }
 
 sub ccache_setup () {
-- 
Anthony PERARD


