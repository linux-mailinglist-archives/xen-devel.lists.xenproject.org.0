Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2E3B9451
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148949.275297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyzq-0008CW-NK; Thu, 01 Jul 2021 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148949.275297; Thu, 01 Jul 2021 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyzq-0008Ac-K9; Thu, 01 Jul 2021 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 148949;
 Thu, 01 Jul 2021 15:52:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyyzo-0008AW-Oa
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:52:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a85c2024-3b38-412d-90ee-51c082d3b1f3;
 Thu, 01 Jul 2021 15:52:55 +0000 (UTC)
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
X-Inumbo-ID: a85c2024-3b38-412d-90ee-51c082d3b1f3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625154775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y1e/4dsezIMJVg+0zwuh7zOhGcr3k456Pu74dnN3TXA=;
  b=e+AHZWVh+LwlAwwa4M+pHEYe7PyKqzGqjVMQr04nJC8NRCcTo3Lhb+Zp
   yp/REsdT2aK/Z2NYMmQwH+vgnvPdN4ZhPiwmJABxqpoSefS2HIBNaOCRW
   lEGlXqwon7KFoluPjV+pzvTZ+Wl/d4ODbEaHFrrGWhW7dWMqwswXW+8SH
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jX2BKWaZ/WBhxDFAMELTQV8xH2CfNJ9KXSV9dZET0cXK1d+bFtMJeTBJKkuKB/5kjeJ75IhsGo
 tlPU0JKCOQ7pal0SCRwUrliD3GLvoQrxxrSJE9GAVjN2vIS+1/Wr4nrAlkk5LsS2+7l0h2TQEi
 K1+JN3P4aIV8NYWn32U9/UiyfGcXjJk206IvAlakO4DRHUOilCRGEwKEL57o8C51B6s4iA1DpT
 WG5evNjBmDL/sdD1RRaHMZqGJydHOtapEw2fiZ3eapakYK0ayqpYryAdpgIXIuMGI/HAkckYHk
 C88=
X-SBRS: 5.1
X-MesageID: 47458429
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4aWhxa3v25HBFFW0JFs9yAqjBT5yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5OxoS5PwPU80lKQFr7X5WI3CYOCIghrQEGgP1/qB/9SkIVyFygc/79
 YgT0EdMqyJMbESt6+Ti2PUc6dC/DDEytHSuQ639QY3cegAUdAF0+4NMHf8LqQAfnggOXNWLu
 v42uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmf7HOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dY+xY4kuW3fRYzSTFcBcso65zXcISSaUmRAXee
 z30lId1gJImirsly+O0EPQMkLboUkTAjfZuCGlaD3Y0JbErXsBerp8bY41SGqp12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtprQc/tQ0WbWIlUs4bkWXfxjIjLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3Y7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPeHb0mLtBPB5vpke+53FwY3pDeRHU49upFpH
 2aaiIriYcbQTObNSSh5uw5zizw
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47458429"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH] MAINTAINERS: Updating after change to tools/include/
Date: Thu, 1 Jul 2021 16:52:32 +0100
Message-ID: <20210701155232.792978-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The LIBS section doesn't mention the headers associated with the
libraries, same for LIBXENLIGHT section.

They aren't any ':' in other section names, so remove it.

Fixes: 4664034cdc72 ("tools/libs: move official headers to common directory")
Fixes: f7079d7ef69f ("MAINTAINERS: add myself as tools/libs reviewer")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 MAINTAINERS | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a52a03969fe..56d16e4328cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -374,11 +374,25 @@ F:	xen/include/{kexec,kimage}.h
 F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
-LIBS:
+LIBS
 M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
+F:	tools/include/libxenvchan.h
+F:	tools/include/xencall.h
+F:	tools/include/xenctrl*.h
+F:	tools/include/xendevicemodel.h
+F:	tools/include/xenevtchn.h
+F:	tools/include/xenforeignmemory.h
+F:	tools/include/xengnttab.h
+F:	tools/include/xenguest.h
+F:	tools/include/xenhypfs.h
+F:	tools/include/xenstat.h
+F:	tools/include/xenstore*.h
+F:	tools/include/xenstore-compat/*.h
+F:	tools/include/xentoolcore*.h
+F:	tools/include/xentoollog.h
 F:	tools/libs/
 
 LIBXENLIGHT
@@ -386,6 +400,7 @@ M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
+F:	tools/include/libxl*.h
 F:	tools/libs/light/
 F:	tools/libs/util/
 F:	tools/xl/
-- 
Anthony PERARD


