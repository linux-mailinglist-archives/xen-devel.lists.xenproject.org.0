Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC04C488B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279290.477018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKu-0002IP-Hi; Fri, 25 Feb 2022 15:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279290.477018; Fri, 25 Feb 2022 15:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKt-00028j-Hb; Fri, 25 Feb 2022 15:16:47 +0000
Received: by outflank-mailman (input) for mailman id 279290;
 Fri, 25 Feb 2022 15:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIV-0006fy-S4
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98a8c4b6-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:16 +0100 (CET)
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
X-Inumbo-ID: 98a8c4b6-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3vyVdZEIG+4X/H2vZhQNrYK/eTmrh5e09O/takxxz8Q=;
  b=DJphRGFJ4yDCMBd+gcJQLTpHLXrTJaTLHWPKpv+yPEwPMxiVYmiLrKhT
   YQVIeY8QMZ2luy/87Bly72XIaqSXqxpt7BN6CIeHEHnq1qUNKnJHjpNQt
   KUSvs4IX8r2hRfWAY/UVzG4I82oxmRM6Aepj6qditrl0XM7Gvv2Xgyv10
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998429
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:R+nmIqAPGP9/ehVW/xbjw5YqxClBgxIJ4kV8jS/XYbTApDInhTUCy
 TEYXjyCP/iIN2TyeNB/boW38UNV68fWm9NjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhK1
 dxysYyLQzs7EfThp7QmFDBeAXFXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4STKeOO
 5BIAdZpRCrgZz5TH3MvM6MRzNfx1yDVWTx4pWvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FrKi8eVxqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAGUzpAZdoOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqXjINcg8V2NPfsq5qoy2fdZFKFrzlp4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNvBFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gMsVmSx28za67onAMFh
 meJ6Gu9A7cJYROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTywzxR1zfxnY
 c/DGSpJMZr8If42pNZRb71AuYLHOwhknT+DLXwF507PPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAV7SOyA7Nei2Bs4XQLBSFXVEAGtEEkMLOe6HhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:TrvJb6mEGxZLBNc4akvo38aCA0LpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998429"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH v2 23/29] .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
Date: Fri, 25 Feb 2022 15:13:15 +0000
Message-ID: <20220225151321.44126-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - move new .gitignore entries to the one in tools/libs/

 .gitignore            | 26 --------------------------
 tools/libs/.gitignore |  2 ++
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3da56594c5..7a04dc3a89 100644
--- a/.gitignore
+++ b/.gitignore
@@ -105,26 +105,8 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/toolcore/headers.chk
-tools/libs/toolcore/xentoolcore.pc
-tools/libs/toollog/headers.chk
-tools/libs/toollog/xentoollog.pc
-tools/libs/evtchn/headers.chk
-tools/libs/evtchn/xenevtchn.pc
-tools/libs/gnttab/headers.chk
-tools/libs/gnttab/xengnttab.pc
-tools/libs/hypfs/headers.chk
-tools/libs/hypfs/xenhypfs.pc
-tools/libs/call/headers.chk
-tools/libs/call/xencall.pc
 tools/libs/ctrl/libxenctrl.map
-tools/libs/ctrl/xencontrol.pc
-tools/libs/foreignmemory/headers.chk
-tools/libs/foreignmemory/xenforeignmemory.pc
-tools/libs/devicemodel/headers.chk
-tools/libs/devicemodel/xendevicemodel.pc
 tools/libs/guest/libxenguest.map
-tools/libs/guest/xenguest.pc
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -144,21 +126,13 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/light/xenlight.pc
-tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
-tools/libs/stat/xenstat.pc
-tools/libs/store/headers.chk
 tools/libs/store/list.h
 tools/libs/store/utils.h
-tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
-tools/libs/util/*.pc
 tools/libs/util/libxlu_cfg_y.output
 tools/libs/util/libxenutil.map
-tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
-tools/libs/vchan/xenvchan.pc
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
index 4a13126144..1ad7c7f0cb 100644
--- a/tools/libs/.gitignore
+++ b/tools/libs/.gitignore
@@ -1 +1,3 @@
+*/*.pc
+*/headers.chk
 */headers.lst
-- 
Anthony PERARD


