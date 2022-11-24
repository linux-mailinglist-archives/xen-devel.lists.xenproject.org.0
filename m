Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF6637DB0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 17:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448004.704750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFJu-00059Y-MB; Thu, 24 Nov 2022 16:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448004.704750; Thu, 24 Nov 2022 16:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFJu-000577-Hk; Thu, 24 Nov 2022 16:43:26 +0000
Received: by outflank-mailman (input) for mailman id 448004;
 Thu, 24 Nov 2022 16:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EC/E=3Y=citrix.com=prvs=320cd9450=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oyFJt-000571-Em
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 16:43:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b54ad42-6c17-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 17:43:23 +0100 (CET)
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
X-Inumbo-ID: 1b54ad42-6c17-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669308203;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=65nK8wEs6tGHvEng34CrzXajvfyLyoM+LOPRulqvbS0=;
  b=iJH75i424ImQi81hWX5Ch7TqUADRQ/pWM4bykvjZlehTp2oCZPSANafc
   6itWbDyd7zq4EJctziWhiaZgyyS/Da/+0fDcpXq8fHIupHhGC3yTQAV3z
   yinolKpLuvIreV9T1MazhvI0jMDO0K96iVU2ZzVOrmnhjNvmNEfLOf8pv
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85079088
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BIXIAa4ZeYjVrrd7R2dARgxRtEvHchMFZxGqfqrLsTDasY5as4F+v
 mtOX27QOa2CNmGjfIp3YYvk/E5XuJSBmNFjT1Nl+XxnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 9E7ES0JShu5lu+K2byQTNU2oP8aFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Fwx7H9
 zqWrwwVBDkQatq722GK0UuXodXzxyneYrxCFuOBo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80gojq7IjsnOiSNbVVge95nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0ccSAw9UA8h6OPyrb0qgDnJcoxFK5eM24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9g4DNJWfh0B3iM4RNMRS
 BWP0T69HbcKVJZqBIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHZrXs0NRLAjzu3yCDAdJ3T3
 r/CIa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAWLtiFu9z
 uuzwOPQlUoHAbOkOXOGmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQQnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:1ISy96z6NEpYLabfbXPHKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZAmPH7P+VAssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyGJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85079088"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework COPYING for installed Xen public header
Date: Thu, 24 Nov 2022 16:42:54 +0000
Message-ID: <20221124164254.33476-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use actual include directory used to install the public header in
COPYING file.

Also, move the input file out of "tools/include/xen/" because that
directory is removed on `make clean`.

We can't used ./configure because $includedir contain another
variable, so the change is done in Makefile.

Fixes: 4ea75e9a9058 ("Rework COPYING installed in /usr/include/xen/, due to several licences")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    For 4.17 inclusion:
    
    Doing `make clean && make` in the root dir is going to fail as make
    isn't going to find the COPYING file while trying to install the
    includes.
    
    If that patch is too much, we could replace the `sed` by `cp` and just
    move COPYING instead of changing it.

 tools/include/Makefile                        | 1 +
 tools/include/{xen/COPYING => xen.COPYING.in} | 2 +-
 tools/include/.gitignore                      | 1 +
 tools/include/xen/.gitignore                  | 2 --
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename tools/include/{xen/COPYING => xen.COPYING.in} (93%)
 create mode 100644 tools/include/.gitignore
 delete mode 100644 tools/include/xen/.gitignore

diff --git a/tools/include/Makefile b/tools/include/Makefile
index f838171e8c..d69aeb54bf 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -24,6 +24,7 @@ xen-foreign:
 xen-dir:
 	mkdir -p xen/libelf acpi
 	find xen/ acpi/ -type l -exec rm '{}' +
+	sed -e 's#@includedir@#$(includedir)/xen#g' xen.COPYING.in > xen/COPYING
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/
 	ln -s ../xen-sys/$(XEN_OS) xen/sys
diff --git a/tools/include/xen/COPYING b/tools/include/xen.COPYING.in
similarity index 93%
rename from tools/include/xen/COPYING
rename to tools/include/xen.COPYING.in
index fe3f9b7557..25513fe529 100644
--- a/tools/include/xen/COPYING
+++ b/tools/include/xen.COPYING.in
@@ -1,7 +1,7 @@
 XEN NOTICE
 ==========
 
-This licence applies to all files within this subdirectory ("/usr/include/xen")
+This licence applies to all files within this subdirectory ("@includedir@")
 with the exception of "sys/" which may include headers under different
 licences.
 
diff --git a/tools/include/.gitignore b/tools/include/.gitignore
new file mode 100644
index 0000000000..be14e3632d
--- /dev/null
+++ b/tools/include/.gitignore
@@ -0,0 +1 @@
+/xen/
diff --git a/tools/include/xen/.gitignore b/tools/include/xen/.gitignore
deleted file mode 100644
index 0628b2daf1..0000000000
--- a/tools/include/xen/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-*
-!COPYING
-- 
Anthony PERARD


