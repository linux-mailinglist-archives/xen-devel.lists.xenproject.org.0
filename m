Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B83B9022
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148357.274278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRd-0001Eb-MV; Thu, 01 Jul 2021 09:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148357.274278; Thu, 01 Jul 2021 09:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRd-0001Az-GG; Thu, 01 Jul 2021 09:57:17 +0000
Received: by outflank-mailman (input) for mailman id 148357;
 Thu, 01 Jul 2021 09:57:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRb-0004XT-Rv
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:15 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f72f25-cc87-4aca-9cb6-6f6e2dcd9778;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uf5Mi
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:41 +0200 (CEST)
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
X-Inumbo-ID: c2f72f25-cc87-4aca-9cb6-6f6e2dcd9778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133401;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=tMf89Ke5Bo6A5Pju27XJS58XTaKNVAzyOo/JUVzZcLo=;
    b=nWvRnJWLur55V1tgXMbgxhtwgiY/CRv+DqprRK4PbMxuavZgH5yfVh6Ft1q6K0pILK
    ukoX/5a8uZ1sWLc2Dl59Eo1P8rfuFG5CeX1tkPuaiO1Yp13sffMDQCoXL9BtIc88MGxC
    xaewNcFmtlO6jV0QGeHsyjupGZkh3fhdXtuAVgjL9vjObeMtg+zcORScKLD9Q3q0aIG8
    mWLyRU+I9vvlWbHwTxEK9ZiwmNdPdaf07uDSeTPf1nAr36mF38LC/W0irQXludbzbgZW
    6zJkmdBGWIhWfs1EdSfjDEE9mss+4Zk9z3hGYyssgufhn2QBpe2er1jvzpcmJYqZ+/2W
    oLhw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 05/40] tools: handle libxl__physmap_info.name properly in convert-legacy-stream
Date: Thu,  1 Jul 2021 11:56:00 +0200
Message-Id: <20210701095635.15648-6-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trailing member name[] in libxl__physmap_info is written as a
cstring into the stream. The current code does a sanity check if the
last byte is zero. This attempt fails with python3.4 because name[-1]
returns a type int. As a result the comparison with byte(\00) fails:

  File "/usr/lib/xen/bin/convert-legacy-stream", line 347, in read_libxl_toolstack
    raise StreamError("physmap name not NUL terminated")
StreamError: physmap name not NUL terminated

To handle both python variants the cstring is unpacked into the actual
string and the trailing nil.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/python/scripts/convert-legacy-stream | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index 66ee3d2f5d..9003ac4f6d 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -336,20 +336,21 @@ def read_libxl_toolstack(vm, data):
         if len(data) < namelen:
             raise StreamError("Remaining data too short for physmap name")
 
-        name = data[:namelen]
+        c_string = data[:namelen]
         data = data[namelen:]
 
         # Strip padding off the end of name
         if twidth == 64:
-            name = name[:-4]
+            c_string = c_string[:-4]
 
-        if name[-1] != b'\x00':
+        name, nil = unpack("={0}sB".format(len(c_string) - 1), c_string)
+        if nil != 0:
             raise StreamError("physmap name not NUL terminated")
 
         root = b"physmap/%x" % (phys, )
         kv = [root + b"/start_addr", b"%x" % (start, ),
               root + b"/size",       b"%x" % (size, ),
-              root + b"/name",       name[:-1]]
+              root + b"/name",       name]
 
         for key, val in zip(kv[0::2], kv[1::2]):
             info("    '%s' = '%s'" % (key.decode(), val.decode()))

