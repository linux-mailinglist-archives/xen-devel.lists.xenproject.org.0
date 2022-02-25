Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D64C4889
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279292.477021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKu-0002Qc-IJ; Fri, 25 Feb 2022 15:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279292.477021; Fri, 25 Feb 2022 15:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKu-0002GR-2Q; Fri, 25 Feb 2022 15:16:48 +0000
Received: by outflank-mailman (input) for mailman id 279292;
 Fri, 25 Feb 2022 15:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIa-0007Bf-OF
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cda7daa-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:23 +0100 (CET)
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
X-Inumbo-ID: 9cda7daa-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kixkpefhBRjANCwQ7euq99oUP/7Tc6+q09WVcxZqwx4=;
  b=R1tdvDVn14vuC39rem7NsgwufwPpQyQkPWoLASSZ9/1rUzjnEDjSG0dx
   7yqF4yhlirsoOcTM/fAmzdArvwY0/KuSQtzp0GKv6ZLVkPOXr0ZGoNtkj
   f0g5pUqGQaIqWc6+YUEX3bfuAunR3LMD7oIAYW9Zed+5sy6QkQOV0fUcq
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000348
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3iVG06DMRirSzhVW/yDjw5YqxClBgxIJ4kV8jS/XYbTApDMqg2AAn
 zMaC22EPv+CN2T3Lt9wa4q39hkAsJ+Hz99nQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhoj
 /5TmL3uFjwgZIncl+UkXwAFPgdHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TRa6GP
 JZJAdZpRBnhSEFDCg1INMsnubu3tF2iWjcfpU3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5G38HxwecsCfyDCM73awruLJhmb/SYUUUrqi+ZZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILNpC2HK0laEQVIMvg2u84PSSV3+
 3mwyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi8XBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrIJrVil
 CJd8yR70AzoJcvc/MBqaL9QdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BKM5VoNuccLZCPCgUpLj2SZUZVCIU/IT4mNaxwpRoAWPsgZmPGvpkmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacidiBqVcir8JUMLoZu4GNOQQkcNhMY+pt5E6QNokifvrygE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:+l1Y0apOvw0CxQuxZb+GZqgaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000348"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 28/29] stubdom: xenlibs linkfarm, ignore non-regular files
Date: Fri, 25 Feb 2022 15:13:20 +0000
Message-ID: <20220225151321.44126-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When we will convert tools/ build system, their will be a need to
replace some use of "vpath". This will done making symbolic links.
Those symlinks are not wanted by stubdom build system when making a
linkfarm for the Xen libraries. To avoid them, we will use `find`
instead of plain shell globbing.

For example, there will be a link to "xen/lib/x86/cpuid.o" in
"tools/libs/guest/".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---

Notes:
    v2:
    - reviewed

 stubdom/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 1fa075b9ad..b312f710cd 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -345,7 +345,7 @@ define do_links
   mkdir -p $(dir $@)include
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
-  ln -sf $(dir $<)*.[ch] .; \
+  find $(dir $<) -maxdepth 1 -type f -name '*.[ch]' -exec ln -sf {} . \; ; \
   ln -sf $(dir $<)Makefile.common .
   touch $@
 endef
-- 
Anthony PERARD


