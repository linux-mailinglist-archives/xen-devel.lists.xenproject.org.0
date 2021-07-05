Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67703BC303
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150631.278495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzh-00030l-5V; Mon, 05 Jul 2021 19:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150631.278495; Mon, 05 Jul 2021 19:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzh-0002yE-2S; Mon, 05 Jul 2021 19:11:01 +0000
Received: by outflank-mailman (input) for mailman id 150631;
 Mon, 05 Jul 2021 19:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tzf-0002tP-RL
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:10:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9903b4a-ddc4-11eb-8459-12813bfff9fa;
 Mon, 05 Jul 2021 19:10:56 +0000 (UTC)
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
X-Inumbo-ID: b9903b4a-ddc4-11eb-8459-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=MYgc+W0g6DOuwBi3YuCpQOetNiKzFhp4dnXvQBYWZnY=;
  b=HH9cqdAy9n6Uhe+FJ+vwwrspTBpDlgTzIaRaKE6BRFjQOn1ddQ7LaZLQ
   s2HgsLGA7Yx+Ly+dQQH9oA88L16QQrbCf8xkPpsUf+s2edMU5MNOIaOkK
   oEhgzYwsFyM4iiLJ1rhKDqIywBs5+m/jOviUPWCWWCCUgzO/8K3hEhWqr
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kL+M67rezHidGYQ6Vr9YydkTRy00f8MtKIghQVumW8qNZnK8NSA449qEQuOij4TiFUa+PoT51S
 X9ZXuoWbMdekZzyQ6WLj41ufMthLif2sgMw8mriqQ4/v2enKDxzKHSARXCgUu5KOUDzNNm9KOq
 6ZE6mMB5zzNxyzWTOG2S78ifqIGHlXmioZgv8eBmFEeuvynQFdpyDGuaSWVkYHMJRgf7ijzzbs
 zQhugJxMouo916tmFJjk7PQAs0D6wuO/OMpr/DiIX/wpF4TvJA4t7co8I1ZICGpoQ8pnRHTT20
 u3Y=
X-SBRS: 5.1
X-MesageID: 47662836
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VLwU6KzZNyrW7ofCxFmTKrPwOr1zdoMgy1knxilNoRw8SKKlfq
 GV7ZMmPHDP6Ar5NEtNpTniAtjlfZq/z+8X3WB5B97LN2OKhILBFvAG0WKI+Vzd8kPFmdK1rZ
 0QEZRDNA==
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47662836"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 1/5] tools/python: handle libxl__physmap_info.name properly in convert-legacy-stream
Date: Mon, 5 Jul 2021 20:10:23 +0100
Message-ID: <20210705191027.15107-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Olaf Hering <olaf@aepfle.de>

The trailing member name[] in libxl__physmap_info is written as a
cstring into the stream. The current code does a sanity check if the
last byte is zero. This attempt fails with python3 because name[-1]
returns a type int. As a result the comparison with byte(\00) fails:

  File "/usr/lib/xen/bin/convert-legacy-stream", line 347, in read_libxl_toolstack
    raise StreamError("physmap name not NUL terminated")
  StreamError: physmap name not NUL terminated

To handle both python variants, cast to bytearray().

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/python/scripts/convert-legacy-stream | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index 66ee3d2f5d29..227e1b5c3fd3 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -343,7 +343,7 @@ def read_libxl_toolstack(vm, data):
         if twidth == 64:
             name = name[:-4]
 
-        if name[-1] != b'\x00':
+        if bytearray(name)[-1] != 0:
             raise StreamError("physmap name not NUL terminated")
 
         root = b"physmap/%x" % (phys, )
-- 
2.11.0


