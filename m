Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C6559E01
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355612.583454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnk-000859-7W; Fri, 24 Jun 2022 16:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355612.583454; Fri, 24 Jun 2022 16:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnk-00080y-0r; Fri, 24 Jun 2022 16:04:56 +0000
Received: by outflank-mailman (input) for mailman id 355612;
 Fri, 24 Jun 2022 16:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lni-0004qc-I8
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617cdfd6-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:04:53 +0200 (CEST)
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
X-Inumbo-ID: 617cdfd6-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cq0Zb+dmEm/n03sfWJhUW4S7VwgI0ziQPkbqQdTYp0c=;
  b=ecyKfyyNpERVin3i8JpZ9G9/a46aAs6QSPH/5+dxdZJ3dyFBbQFXUmQL
   GhaII6EC9QFMMOXn1TqVyWd9T5Q2JmBt8E588ZX+SKeqG9GmXXGQMyJ3Q
   RldhOumZ+ei3RF02NSa/GM70jDZO60CTUTbZ8hnlPmEifNU/1b3e7HG9l
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74208110
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xdIZRq9B1i9W19uAfT4hDrUDnX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zYZWD2APPaIMGP2ct1/ad6+9hwBucfXy9A2QQs+q3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbauGD8uJ/bBo/smXAdqTxNzN4Je9YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JZDMWo2NUyojxtnMxQ5WK1jmv+RmnzRUyJd8g6TlIFo2j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZoj0eU3Xc7EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMv/Yjbp5hogynQddl9IvKHg9faATzJl
 mXiQDcFu1kDsSIa//zloA6f2G/0+cihoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoJiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa9S4y9B6mLMoIWPfCdkTNrGgk0PSZ8OEi9+HXAbIllY
 cvLGSpSJSxy5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l7WqGIn+9+Ktc790mX/8+Rl
 kyAtoZj4AKXrRX6xc+iNhiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:bQzovqOcWgvRKMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74208110"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH v3 12/25] .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
Date: Fri, 24 Jun 2022 17:04:09 +0100
Message-ID: <20220624160422.53457-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
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
index 8b6886f3fd..1de28c833c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -106,26 +106,8 @@ tools/config.cache
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
@@ -145,21 +127,13 @@ tools/libs/light/testidl.c
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


