Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA969E533
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499023.770050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwB-0007Fk-B5; Tue, 21 Feb 2023 16:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499023.770050; Tue, 21 Feb 2023 16:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwB-00076F-4S; Tue, 21 Feb 2023 16:56:19 +0000
Received: by outflank-mailman (input) for mailman id 499023;
 Tue, 21 Feb 2023 16:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw8-0006LK-QC
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d01d7f-b208-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 17:56:14 +0100 (CET)
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
X-Inumbo-ID: a6d01d7f-b208-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8cDiBnY23n4DTQU+8+mCfEObQrVGXl20gEs0zMV2ut8=;
  b=FbKAeuoIwXA5Xq2iAHHsD3ctE0MKa61tEp91ev9oh4dBSGPG+GL/vnmd
   HylyUvTULjXNo51XrBfJX/t3qLIgYXWSOp6faEr/IQ0nZOSCaf/y/Nxzj
   CbtiRr7bsZ9D1wVmXAEvine7NpZc8ymXNvxQhvuH7nKu+pGeoEykfwaBV
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97316298
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:EzTa/a5t624+VFfSXuMW0wxRtCLHchMFZxGqfqrLsTDasY5as4F+v
 jAfX2vQMqnbYGWgc9h3bNzlpB4GvJODm4JnTgo5+S41Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 cEUOG5WTw+/vriqmK+fa+5SoZxyI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxnD/
 zycrjSR7hcyH8Sv7xG393eXpu7Dny24fZwoLrSZ6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bki/DXog4MbGJt4fpQSzU4
 je0i3BviOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRfYuC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzv9uY
 MfDIZn1Vi5y5UFbIN2eHbp17FPW7npmmTO7qW7TknxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9Y7wfoPzbyQp
 ynVt40x4AOXuEAr4D6iMhhLAI4Dl74jxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:Mksvda/q9jL3N5+Te1luk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97316298"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 5/7] automation: Add more aliases in containerize
Date: Tue, 21 Feb 2023 16:55:40 +0000
Message-ID: <20230221165542.7642-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/scripts/containerize | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 9e508918bf..9b1a302d05 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,9 +33,12 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
+    _jessie-i386) CONTAINER="${BASE}/debian:jessie-i386" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
+    _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
+    _unstable-i386) CONTAINER="${BASE}/debian:unstable-i386" ;;
     _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
     _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
-- 
Anthony PERARD


