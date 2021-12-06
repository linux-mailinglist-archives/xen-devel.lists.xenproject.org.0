Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1746A26A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239525.415456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTr-0005kd-Qg; Mon, 06 Dec 2021 17:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239525.415456; Mon, 06 Dec 2021 17:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTq-0005bs-SK; Mon, 06 Dec 2021 17:08:46 +0000
Received: by outflank-mailman (input) for mailman id 239525;
 Mon, 06 Dec 2021 17:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOj-0005ta-0t
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d8bd62f-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:27 +0100 (CET)
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
X-Inumbo-ID: 6d8bd62f-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s3UfqkrJCrnPU+r8syU57IaF/HqfNRQQBSiB7nWPZBY=;
  b=GF/H/cQFUOq5+kGF3FD5MfbubV0i2pV7rNiTa2wwE8mKIZLl22cUosa0
   vsRj1HWRGzCTAlDabNG+QPVkTbpoGX9h9TH8gll+m29VNKwxjfi3uvGPi
   Aaj4fAM2aTUsll+9+T+4EGGfWoKceO6TKlldC/1ToTapiuQUx3pzVuAtX
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HYhPvvTleilbuF6X8DLTbabFZKcrRfFBG/XY4Mui4lz53nhgfaMq/YsdElTK5/anpFGDVc3Z/y
 pHiYx6Q1kDxW2rqRXjhQz1pURUtCw7uoI0CLC6cMpO283BM4GUsSlKWXbLT3uC3LvuyPcC17zQ
 bBlaApaUAVzsXZxyc+j/n3cQroxFZR8vlQ6GY6/dQvfLEVg4F8mppewlw7uaZR5RcHF5r5E5/8
 44XCTxsbvXTJKic1pK/IumRlLrplsbj5sHfc39o6oFSQxzGCHAJ+CwjAgWg2+qcmQqyEfW87zk
 fOnZsXQJ+Q3oh6Sh/lbUL0m8
X-SBRS: 5.1
X-MesageID: 61420628
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vVb2Zqn3Lf42Oa/bZd7wKzjo5gwrIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWmyBa/jeNzTwc9pyaonnpBgP7ZeBmoNgSlBt/ns8QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PFn8sSZTAMAApWPurggXzN/GnpxE6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6+CP
 ZJHM2oHgBLoaCVkY01KArgFu9y0oWLZS2F5tmjKqv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCjFSNy0QJBRYRVF/9puO24mahX/pPJ
 kpS/TAhxYA78lCrSd/sGQW1uneesjYTXtNRF6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZQoa4fHzrYcrlBXNQ91/VqmvgbXI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEgrKOFicw4izrZiGHsj51TqmsPIOG5g2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGgmfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVbvEMJGPxf4M4XRfK4Ey/tX1
 XCzK5nEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOleYATUP71jtv3b8G05F
 uqz0ePQkX2zt8WkPUHqHXM7dwhWfRDX+7iowyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwTEGmaoGpEMsGmxGGgHTzy7T+z0+OeSGBXV/Zdq8bhoLcIpyPjq3sDCDSZr8w7r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJncdsRLRjjxyeB0
 1rECxkvuuSQ8ZQ+98PEhP7Yot7xQfd+BEdTA0LS8a2yaXvB5mOmzIIZCLSIcDnRWXna4qKnY
 ekJnfjwPOdexARBspZmEqYtxqU7voO9q7hfxwViPXPKc1X0Ve8wfijYhZFC7/QfyKVYtA26X
 lO01uNbYbjZatn4FFMxJRY+arjR3/8jhTSPv+8+J1/35XEr8ePfA1lSJRSFlAdUMKBxbNE+2
 e4ktcMbt16/hx4tPorUhyxY7T3RfHkJUqFhvZAGGo77zAEszwgaM5DbDyb35rCJaslNbRZ2c
 mPF2vKaiuQO3FfGfloyCWPJjLhUipk5sRxXyEMPegaSkd3fi/5rhBBc/FzblOiOIsmrBw6rB
 lVWCg==
IronPort-HdrOrdr: A9a23:BelfVqyk0NFLBGIL0wFUKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420628"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [XEN PATCH 16/57] tools/ocaml: Remove generation of _paths.h
Date: Mon, 6 Dec 2021 17:01:59 +0000
Message-ID: <20211206170241.13165-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

_paths.h isn't useful anymore in systemd_stubs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore                            | 1 -
 tools/ocaml/xenstored/Makefile        | 7 -------
 tools/ocaml/xenstored/systemd_stubs.c | 2 --
 3 files changed, 10 deletions(-)

diff --git a/.gitignore b/.gitignore
index 111eb03b86..b42264e209 100644
--- a/.gitignore
+++ b/.gitignore
@@ -409,7 +409,6 @@ tools/ocaml/libs/xentoollog/xentoollog.ml
 tools/ocaml/libs/xentoollog/xentoollog.mli
 tools/ocaml/libs/xs/paths.ml
 tools/ocaml/libs/xc/xenctrl_abi_check.h
-tools/ocaml/xenstored/_paths.h
 tools/ocaml/xenstored/oxenstored
 tools/ocaml/xenstored/oxenstored.conf
 tools/ocaml/xenstored/paths.ml
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 89ec3ec76a..0b5711b507 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -30,8 +30,6 @@ systemd_OBJS = systemd
 systemd_C_OBJS = systemd_stubs
 OCAML_LIBRARY += systemd
 
-$(foreach obj,$(systemd_C_OBJS),$(obj).o): _paths.h
-
 LIBS_systemd += $(LDFLAGS-y)
 
 OBJS = paths \
@@ -100,8 +98,3 @@ genpath-target = $(call buildmakevars2module,paths.ml)
 $(eval $(genpath-target))
 
 GENERATED_FILES += paths.ml
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-GENERATE_FILES += _paths.h
diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
index 31a1a5d384..f4c875075a 100644
--- a/tools/ocaml/xenstored/systemd_stubs.c
+++ b/tools/ocaml/xenstored/systemd_stubs.c
@@ -27,8 +27,6 @@
 
 #include <systemd/sd-daemon.h>
 
-#include "_paths.h"
-
 CAMLprim value ocaml_sd_notify_ready(value ignore)
 {
 	CAMLparam1(ignore);
-- 
Anthony PERARD


