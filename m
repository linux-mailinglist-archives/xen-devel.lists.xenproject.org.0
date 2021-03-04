Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5F32D3D0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 14:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93249.176011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHne6-0006Dy-Lt; Thu, 04 Mar 2021 13:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93249.176011; Thu, 04 Mar 2021 13:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHne6-0006Dd-Ir; Thu, 04 Mar 2021 13:04:02 +0000
Received: by outflank-mailman (input) for mailman id 93249;
 Thu, 04 Mar 2021 13:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHne5-0006DY-7j
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:04:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaf45cda-b1d2-4979-8a68-49fe884de5fe;
 Thu, 04 Mar 2021 13:04:00 +0000 (UTC)
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
X-Inumbo-ID: eaf45cda-b1d2-4979-8a68-49fe884de5fe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614863040;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=6yeqZ2hyEsOZnGmzk5/LzUrXnUcg/Pev2FcGRnugMjo=;
  b=NzQSDxipAIVOZwPzXyVQWWoJNJglScR8PpE12PIb5SMxdDFKJPAB87Sd
   EGYqXuIhuToI0k48uqUpil/z/fpv239LSfvA3H0Ln1fhCTxu7/VFnRpS2
   l1U+5a88Ftrbuj+L7UyS3s4EoqHEi/WZcHqQ2yANDk3Iu7UlHk1R+RF45
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HEPw8YoRK2tzwwUtRR+AO7OO7L8AUlhvzVTYqvR8/IwfCpDsVVJbaJ7jfe+6j3nLNtLZmd2xpQ
 AoPkfPeIyYKLbimGiUMPHYlZ68JOgGTgKINJZEhduVC/csrQmYzihgg7G7hA2ignlsCUDikp1g
 /GkO6KGny4u1Tam4hwFkkJ/CHZEj+mhkv2eUKeqFnMlZ7F93/bxmKtXm2fgsAMRVj8HfU1WAgY
 eAJVFIC6IjI+XSWq71XvvO/nK3pj3FX4pK5TjGNgS6scS8Y+72/qM45lnltUlFwWFYVQT3/v6M
 t34=
X-SBRS: 5.1
X-MesageID: 39936864
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="39936864"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard
Date: Thu, 4 Mar 2021 13:03:19 +0000
Message-ID: <20210304130319.10719-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This is inappropriate for the header file of a standalone library with stable
API and ABI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>

Discovered when trying to actually remove the use of unstable libraries from a
trivial userspace emulator.  Current users of xendevicemodel.h inherit
__XEN_TOOLS__ from libxenctrl.h (or equiv).
---
 tools/include/xendevicemodel.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 33698d67f3..797e0c6b29 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -17,8 +17,6 @@
 #ifndef XENDEVICEMODEL_H
 #define XENDEVICEMODEL_H
 
-#ifdef __XEN_TOOLS__
-
 #include <stdint.h>
 
 #include <xen/xen.h>
@@ -377,8 +375,6 @@ int xendevicemodel_nr_vcpus(
  */
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid);
 
-#endif /* __XEN_TOOLS__ */
-
 #endif /* XENDEVICEMODEL_H */
 
 /*
-- 
2.11.0


