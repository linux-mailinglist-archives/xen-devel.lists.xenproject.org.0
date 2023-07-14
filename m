Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AE75391E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563566.880840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKGW3-0006wC-SP; Fri, 14 Jul 2023 10:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563566.880840; Fri, 14 Jul 2023 10:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKGW3-0006u6-P5; Fri, 14 Jul 2023 10:59:15 +0000
Received: by outflank-mailman (input) for mailman id 563566;
 Fri, 14 Jul 2023 10:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKGW1-0006ty-W5
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 10:59:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75efabed-2235-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 12:59:12 +0200 (CEST)
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
X-Inumbo-ID: 75efabed-2235-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689332352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DIB6Cy1+k9QGwvGHQUyNwfDEPpOlJOzj3JPEDXPcr1E=;
  b=bw30zUlALoD5rXcj2d8vHe6drves45S/bwRmSQqWD8A1O7r2GcYV6j7y
   +b8F1eZhhcmlyZ2iOjIIFT6/f9MtkR8+j2HqYEVQlgpI/dAdvMiQK+KJy
   cduZxNtY3vEw5vl0BRy0JYNQ9k2RWVNjboJyjoocmf1jaK1sejkOVQ/MG
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115517592
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:swkbS6DYawrdeRVW/8rjw5YqxClBgxIJ4kV8jS/XYbTApD9x3jIBm
 zFOWmuPbP6PNGTyKNEkPt/g9R8BvsPWzoJnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpsAoPWhh6
 /wjGTVXZy2/ldCKmaiaRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XXGJwKwxfCz
 o7A123AQU4ILICc8GCq7nC0o+/lkD7XRatHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiJs0hB/VUtElGqe6iNTvEBn63
 j+RoS4xwb4UiKYj0aSw+lTOxSyhuoLISA8d7BjYRW+j4UVyY4vNWmCzwQGFt7Aadt/fFwTf+
 iFewKBy8dziE7nRsnOxScoTHIqY4qyMDQHOs2I2BbguomHFF2GYQWxA3N1vDB43YpdfI2e5O
 BC7VRB5v8EKYibzBUNjS8foUplxk/C9fTjwfqqMBueidKSdY+NuEMtGQUeLl17gn0E3+U3UE
 cfKKJ38ZZr25EkO8dZXewv++eVxrszG7TmPLa0XNjz+uVZkWFabSK0eLHyFZf0j4aWPrW39q
 ogPZpHVkE0ADLOjMkE7FLL/y3hQdhDX4riv+6RqmhOreFI6SAnN9deMqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMxhehEfUdc8n9xoTZHV8VWtELlB/Oe5DGo9DLcpoFVTmncQ/pcNJo
 w4tJ5/YXKkQFmyeolzwr/DV9eRfSfhivirWVwLNXdT1V8cIq9DhkjM8QjbSyQ==
IronPort-HdrOrdr: A9a23:Q1L68K4gvkLjQbwxBgPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:L+C6VmyRostI8z+thkhHBgVIPJ8Ze1LDzEzhJhWxNFp7eoHMU36frfY=
X-Talos-MUID: 9a23:H5ckHAnq0wCxrQE62uChdnprDYQ38bzyC3lXvokEo+yEHyFtFyq02WE=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="115517592"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/common: Use const char * for string literals
Date: Fri, 14 Jul 2023 11:59:02 +0100
Message-ID: <20230714105902.2996620-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
it is undefined behaviour to mutate them.

Swap char *'s to const char *'s for variables which hold string literals.

This fixes several violations of MISRA Rule 7.4:

  A string literal shall not be assigned to an object unless the object's type
  is "pointer to const-qualified char".

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/gunzip.c                | 2 +-
 xen/common/ioreq.c                 | 3 ++-
 xen/common/libelf/libelf-dominfo.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index b810499be2b6..2c6eae167d54 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -52,7 +52,7 @@ typedef unsigned long   ulg;
 static long __initdata bytes_out;
 static void flush_window(void);
 
-static __init void error(char *x)
+static __init void error(const char *x)
 {
     panic("%s\n", x);
 }
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ecb8f545e1c4..7cb717f7a2a4 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -501,7 +501,8 @@ static int ioreq_server_alloc_rangesets(struct ioreq_server *s,
 
     for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
     {
-        char *name, *type;
+        const char *type;
+        char *name;
 
         switch ( i )
         {
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index fcaee2f7bcff..a13a5e4db603 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -100,7 +100,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
 {
 /* *INDENT-OFF* */
     static const struct {
-        char *name;
+        const char *name;
         bool str;
     } note_desc[] = {
         [XEN_ELFNOTE_ENTRY] = { "ENTRY", 0},
-- 
2.30.2


