Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9453AD0A2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144893.266636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHZs-0001pG-A5; Fri, 18 Jun 2021 16:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144893.266636; Fri, 18 Jun 2021 16:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHZs-0001md-6J; Fri, 18 Jun 2021 16:42:44 +0000
Received: by outflank-mailman (input) for mailman id 144893;
 Fri, 18 Jun 2021 16:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luHZq-0001mX-FO
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:42:42 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba8a0a5d-3007-41b7-8ba4-da2a522e30b6;
 Fri, 18 Jun 2021 16:42:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5IGgO510
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 18:42:24 +0200 (CEST)
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
X-Inumbo-ID: ba8a0a5d-3007-41b7-8ba4-da2a522e30b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624034544;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1FV4B93jd0TczXufcHJFMNxUzrlABxhY02e7UXDejuk=;
    b=pOZPcCtVDrI2SaWkL4Bt16nAID8t/HBfwwOxK/z8tKPhV8VmuHszSsPcTK40MACdh0
    nzwg5QcZWzXaz2cxPtvX/YoAfQ60eD6cmslSKhv/2fXkRSw/BNvpiwMUvr5sjsyjF7pl
    MNsFM0RZMflcZgLNPlSXlyl+eLblVfBa0dYG6Axo9UcLvab0GrW3xQLhyiHETzdaaHPm
    BnnJVSO5/93qf+CFQo2Ys5+ww/raASAS/d41gWkgwAx+AiKQi6eKeE8BhfkbA6aFtJ28
    tmN/tTrjm7YnobOm9NX4OlF8frbKwx5w6d7i+tiLMQ4nmOn8TVCn7dQ3n0nF9Lg31son
    MtJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] compiler.h: define CONFIG_GCC_VERSION
Date: Fri, 18 Jun 2021 18:42:07 +0200
Message-Id: <20210618164207.5111-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes commit fa5afbbc20ef3577c5338f9d0b24dad45cef59cd,
due to lack of commit 534519f0514f52007d504e0f2eeb714de7b2468d.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/include/xen/compiler.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 85cbd1ab00..e2b7193042 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -99,6 +99,13 @@
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
     (typeof(ptr)) (__ptr + (off)); })
 
+#ifndef CONFIG_GCC_VERSION
+# ifdef __GNUC__
+#  define CONFIG_GCC_VERSION (__GNUC__ * 10000           \
+                              + __GNUC_MINOR__ * 100     \
+                              + __GNUC_PATCHLEVEL__)
+# endif
+#endif
 #if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
 # define gcc11_wrap(x) RELOC_HIDE(x, 0)
 #else

