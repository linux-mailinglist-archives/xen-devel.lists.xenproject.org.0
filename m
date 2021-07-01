Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAAC3B901A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148342.274201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRJ-0005wd-7l; Thu, 01 Jul 2021 09:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148342.274201; Thu, 01 Jul 2021 09:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRJ-0005su-2C; Thu, 01 Jul 2021 09:56:57 +0000
Received: by outflank-mailman (input) for mailman id 148342;
 Thu, 01 Jul 2021 09:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRH-0004XT-RY
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:56:55 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13d81159-b2fa-4d56-9e43-7e36d5b2af87;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uf5Mk
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
X-Inumbo-ID: 13d81159-b2fa-4d56-9e43-7e36d5b2af87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133402;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=w7dbe+kbBj9TSW8hk0eL96KxDDaP2dTnYnGMLgLRSqI=;
    b=SbESxQvE2mOzRcBik9DJArk5eOy7F3cFOwsCKAO0xVAbzKozcTyr7yCt2b8XIKrhvp
    Xc/2AXKIaE8g2517el7vNKDDYcoSVXWrA3tjowsgWUtH/OngnWswcKSg8PaSrx+fiR5L
    4yRhX2EsZQ1zVKqBbgdpB/vBBHHxtibQuWigSmEEQcykJQG574C3X/NXucFLBMVFwsqc
    YmInlN/HOO7a0dPfKtyunjZqtkBKWBTw4SEzAX7k8mF5vBlYnW2F98RP+6rORfNVMRwt
    D8vYCLwcc2rQ3GEa+8HjeB+O4HK5k45zu5fGzCi4mWLTli5Qq/O5mSFVKiO2vLcdVaar
    aggw==
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
Subject: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format string
Date: Thu,  1 Jul 2021 11:56:01 +0200
Message-Id: <20210701095635.15648-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the first element of a tuple for a format specifier fails with
python3.4 as included in SLE12:
    b = b"string/%x" % (i, )
TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'

It happens to work with python 2.7 and 3.6.
Use a syntax that is handled by all three variants.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/python/scripts/convert-legacy-stream | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index 9003ac4f6d..235b922ff5 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -347,9 +347,9 @@ def read_libxl_toolstack(vm, data):
         if nil != 0:
             raise StreamError("physmap name not NUL terminated")
 
-        root = b"physmap/%x" % (phys, )
-        kv = [root + b"/start_addr", b"%x" % (start, ),
-              root + b"/size",       b"%x" % (size, ),
+        root = bytes(("physmap/%x" % phys).encode('utf-8'))
+        kv = [root + b"/start_addr", bytes(("%x" % start).encode('utf-8')),
+              root + b"/size",       bytes(("%x" % size).encode('utf-8')),
               root + b"/name",       name]
 
         for key, val in zip(kv[0::2], kv[1::2]):

