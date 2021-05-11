Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E65C37A3A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125666.236572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgw-0005fc-MM; Tue, 11 May 2021 09:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125666.236572; Tue, 11 May 2021 09:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgw-0005cJ-II; Tue, 11 May 2021 09:28:38 +0000
Received: by outflank-mailman (input) for mailman id 125666;
 Tue, 11 May 2021 09:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgu-0003CS-QI
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:36 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fd96fab-119e-4fd6-83c6-13902c1a4a75;
 Tue, 11 May 2021 09:28:21 +0000 (UTC)
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
X-Inumbo-ID: 4fd96fab-119e-4fd6-83c6-13902c1a4a75
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TXGPQaxHF3c+AxwdM2mzDWq6ZbvGPMF7pL7COPhMao=;
  b=F32S+JuxxduiyLWGxIjSgs3qZSInsnhqdubCEFjQMSLvzqzxQTtE/VsN
   +Qr7ZiK6h0g4PcPhudIBPtLBSm8WFiLo4RLn0pNp6LZ24e1EN5x0nvxlM
   yYhFFPqfcZLTCb42Vf4oiS+KGBgBFEfbTPnQzJiOhRbqnyRVfxxCFphnu
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HBhO1fWqAGziFPHWeyyUFF6jO7hf3HQe7A7T3q1IOe5SWxgUYYsyfYQx8zTSe7sywaO2gPQLDe
 YbU1yPtxsAaSA6T1D8AQKQE0jors2PYumZf4MrgWGppL+DKe6h1TdEquiqKuuKAwqwqMyHCjcn
 8ng/0YIQsU7gXOkY6y+YmfTFKkj3TYbZmyPubVGEQUQxWKZPvyJLKp9WDIWAWri09uxlswYpIp
 UiNneZeJ/9tFCLeFiL0AKR6FGEaaNW137sR7GnnX3ZR+wNVnUAnhjTMBEv5kwL/u3wR41KuMf7
 tfI=
X-SBRS: 5.1
X-MesageID: 43313593
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Jknn4q8tSUR0/Rfqx8duk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43313593"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 6/8] libxl: Export libxl__qmp_ev_qemu_compare_version
Date: Tue, 11 May 2021 10:28:08 +0100
Message-ID: <20210511092810.13759-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to want to check QEMU's version in other places where we
can use libxl__ev_qmp_send.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_internal.h | 8 ++++++++
 tools/libs/light/libxl_qmp.c      | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 44a2f3c8fe3b..0b4671318c82 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -492,6 +492,14 @@ _hidden int libxl__ev_qmp_send(libxl__egc *egc, libxl__ev_qmp *ev,
                                const char *cmd, libxl__json_object *args);
 _hidden void libxl__ev_qmp_dispose(libxl__gc *gc, libxl__ev_qmp *ev);
 
+/* return values:
+ *   < 0  if qemu's version <  asked version
+ *   = 0  if qemu's version == asked version
+ *   > 0  if qemu's version >  asked version
+ */
+_hidden int libxl__qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
+                                               int minor, int micro);
+
 typedef enum {
     /* initial state */
     qmp_state_disconnected = 1,
diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index d0967c9f029f..fb146a54cb9c 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -289,7 +289,7 @@ static int qmp_handle_response(libxl__gc *gc, libxl__qmp_handler *qmp,
  *   = 0  if qemu's version == asked version
  *   > 0  if qemu's version >  asked version
  */
-static int qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
+int libxl__qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
                                        int minor, int micro)
 {
     assert(ev->state == qmp_state_connected);
@@ -1073,7 +1073,7 @@ static void dm_state_save_to_fdset(libxl__egc *egc, libxl__ev_qmp *ev, int fdset
     /* The `live` parameter was added to QEMU 2.11. It signals QEMU that
      * the save operation is for a live migration rather than for taking a
      * snapshot. */
-    if (qmp_ev_qemu_compare_version(ev, 2, 11, 0) >= 0)
+    if (libxl__qmp_ev_qemu_compare_version(ev, 2, 11, 0) >= 0)
         libxl__qmp_param_add_bool(gc, &args, "live", dsps->live);
     QMP_PARAMETERS_SPRINTF(&args, "filename", "/dev/fdset/%d", fdset);
     rc = libxl__ev_qmp_send(egc, ev, "xen-save-devices-state", args);
-- 
Anthony PERARD


