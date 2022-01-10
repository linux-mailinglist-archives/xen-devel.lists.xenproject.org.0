Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD14898B2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 13:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255324.437486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tvD-0007TE-2J; Mon, 10 Jan 2022 12:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255324.437486; Mon, 10 Jan 2022 12:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tvC-0007Qo-V1; Mon, 10 Jan 2022 12:37:10 +0000
Received: by outflank-mailman (input) for mailman id 255324;
 Mon, 10 Jan 2022 12:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKLk=R2=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n6tvB-0007Qi-PZ
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 12:37:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05385c4f-7212-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 13:37:08 +0100 (CET)
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
X-Inumbo-ID: 05385c4f-7212-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641818227;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=QiSDjj7+GI3Fxbxh1Um918wvQhmdrNs4LAFfcFV+RBk=;
  b=HlRQQWQP9YPYqi5M4AWHjsulHsh8SYQEQe7qmY7AZojfnps4v8KUEvKq
   X95hFsdDgesukERz3kQc6yaChWNsvw09X05wJjA9S27diaV3HDGGZxOS+
   Uakq00L7Aq2xj/QXLWD4P+z0NpnLBrvSGeSrFIoX1d3r+Vb73wMR6m4D0
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 09cfJS3tF7aH7y7geQvXgHbxwnep3Y8Iu/OC9zBig6SZIDnoiV5An/SMHQKNufiOpQijFBa8gD
 FrpySETOCSEpQYqchOr5G16hdKRsrhdqXHoYYYSr98nGD7NtRaOWeDElR7m9+uIva+0KbbJa4Q
 WNBKBN74SP6g455G3SV5fn5fld5Z1qAhDXUT+bAniy/zLBOE5ClwE5l8PN7UabOMSrLdjWQsw8
 Aonuyjiwhshss6Ne6zEo2gdeW4eF94C0HjJFcfYoJ6yn5K8lbTjOPtHxZpNiAL+eCYdlH2hnsc
 yH2UXzCbtWxFypxwCrogFfcR
X-SBRS: 5.2
X-MesageID: 61642118
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aQe7Ga4ge6HOYj0aeB42CAxRtP7AchMFZxGqfqrLsTDasY5as4F+v
 jRMW2GFb/uDNmD9eN50aoTnoEtSusXTmN9rS1A9pXoyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 PJml6GpRx8QMJLGpuhFbwd1PCRABPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRKiCP
 ZNAOVKDajzQe01gNAonCKthkem030DtSyJ58FS88P9fD2/7k1UqjemF3MDuUt6FX8JOhW6Du
 3nLuW/+B3kyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSrafLfYgS2uEeKgRQiV4JsDcAV7T+0n/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tvoG7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNvjuk0djj8hu+cWGJDT9fxgbQ8xawQRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8B+qm/woCPzLNo4DNRCyKFBaZ9sldjBO
 h67hO+szMULYCvCgVFfPupd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6kmbeb7pDgNcDm3BvrUuOFMuT50n2jtKjiIu9FO1t3K2mNL5ptctpYWz9r
 r5iCid9404OD72lPHiGqN57wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:vQcH9KHRG35AbqwmpLqE/seALOsnbusQ8zAXP0AYc3Jom62j5q
 eTdZsgtSMc5Ax8ZJhCo6HlBEDjewK+yXcd2+B4Vt3OYOCPghrMEGgI1+rfKlPbdBEWjtQtt5
 tdTw==
X-IronPort-AV: E=Sophos;i="5.88,277,1635220800"; 
   d="scan'208";a="61642118"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libs/evtchn: Deduplicate xenevtchn_fd()
Date: Mon, 10 Jan 2022 12:36:54 +0000
Message-ID: <20220110123654.31423-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

struct xenevtchn_handle is common in private.h, meaning that xenevtchn_fd()
has exactly one correct implementation.

Implement it in core.c, rather than identically for each OS.  This matches all
other libraries (call, gnttab, gntshr) which implement an fd getter.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/core.c    | 5 +++++
 tools/libs/evtchn/freebsd.c | 5 -----
 tools/libs/evtchn/linux.c   | 5 -----
 tools/libs/evtchn/minios.c  | 5 -----
 tools/libs/evtchn/netbsd.c  | 5 -----
 tools/libs/evtchn/solaris.c | 5 -----
 6 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index c402d9393b65..de925fc9630c 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -120,6 +120,11 @@ int xenevtchn_close(xenevtchn_handle *xce)
     return rc;
 }
 
+int xenevtchn_fd(xenevtchn_handle *xce)
+{
+    return xce->fd;
+}
+
 int xenevtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
     return osdep_evtchn_restrict(xce, domid);
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index 7427ab240860..c4d075350b5e 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -63,11 +63,6 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
     return -1;
 }
 
-int xenevtchn_fd(xenevtchn_handle *xce)
-{
-    return xce->fd;
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index f27b6def39ef..e61b77ca618a 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -66,11 +66,6 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
     return ioctl(xce->fd, IOCTL_EVTCHN_RESTRICT_DOMID, &restrict_domid);
 }
 
-int xenevtchn_fd(xenevtchn_handle *xce)
-{
-    return xce->fd;
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index e5dfdc5ef52e..8f84048b11f0 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -112,11 +112,6 @@ void minios_evtchn_close_fd(int fd)
     files[fd].type = FTYPE_NONE;
 }
 
-int xenevtchn_fd(xenevtchn_handle *xce)
-{
-    return xce->fd;
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int ret;
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 1cebc21ffce0..0b223c4beb26 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -58,11 +58,6 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
     return -1;
 }
 
-int xenevtchn_fd(xenevtchn_handle *xce)
-{
-    return xce->fd;
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index df9579df1778..7fef88a73e79 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -57,11 +57,6 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
     return -1;
 }
 
-int xenevtchn_fd(xenevtchn_handle *xce)
-{
-    return xce->fd;
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
-- 
2.11.0


