Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF797D6DB1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622899.970147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveIJ-0005si-Sp; Wed, 25 Oct 2023 13:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622899.970147; Wed, 25 Oct 2023 13:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveIJ-0005qU-Pt; Wed, 25 Oct 2023 13:51:35 +0000
Received: by outflank-mailman (input) for mailman id 622899;
 Wed, 25 Oct 2023 13:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNCc=GH=citrix.com=prvs=655f6113c=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1qveIH-0005qO-K2
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:51:33 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e16191-733d-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 15:51:31 +0200 (CEST)
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
X-Inumbo-ID: 98e16191-733d-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698241891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nWlfqUZNWWkypZXn/me9OvdRKuV0M++1ZoJRq6eCasg=;
  b=WeYoS4RQm8wnP2AS+cA762Xc4N8nCnvewUu1S+vcQR6C+rp1sKLZqO9T
   S3H2v4h8RQo7pi3bVP1oRYj0zNgmPCjR5rTMG5lpAzpchYgsX1YHpMJpK
   7bXl1uTxCkd38ph8xr0vbBfDik35h0es5iScCWNIqJRoH7tfS+T6xXEC8
   w=;
X-CSE-ConnectionGUID: 2Icqk/O5RjiY7a073aoa5A==
X-CSE-MsgGUID: qJ2EsNZNQ/2Uhsfy5qXu3A==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125845632
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:rgh4va7H7uw4ixDPYCOQjAxRtFbHchMFZxGqfqrLsTDasY5as4F+v
 mocUW7VPvbZMWP3Ltt3aI6//EJSvZXTzYIwGQFuqyFmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgR4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 90TMTNKSU25heOHn7vjFbJlgc1+BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAi3XhcjsetFWPoqkf6GnP1g1hlrPqNbI5f/TTH5gFwhvG/
 TiuE2LRGzNAGce5+xy8tSiRhvTBjH7iaJ9JPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l90bPy1/HXC5eFGcHMYF38pBuLdA36
 rOXt4nIDiVs95rIc3Ccx+id9WzpMC8ccEZXMEfoUjA5D8nfTJAb10yeHow7TP/k0LUZChmqn
 WrW8nJWa6E7yJ5Tjfvmpzgrlhr2/vD0ohgJChI7t45Pxih+foehL7ew81nd4u0owG2xFQLZ4
 yFsdyRz9okz4XCxeM+lGrxl8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ265O
 RCJ414Av88OVJdPUUORS9jvYyjN5fG9fekJq9iONoYeCnSPXFTvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUsn5VBc5GPuHY81iOZ3rh3SMEuPHfgXOTz7i+vBDJNUIJ9ZWGazghcRtvzd/FmPr
 4oEaqNnCXx3CYXDX8UeyqZLRXhiEJTxLcyeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:D4egK6ARMFboNYDlHei4sseALOsnbusQ8zAXPh9KJSC9I/b0qy
 nxpp4mPEfP+U4ssHFJo7C90dq7MAjhHP9OkMEs1NKZN2bbUQSTXeVfBOfZrQEIXheOj9K1tp
 0QOJSWaueAamSS5PySiDVQUexQpuVvmJrYwts2pE0dLj2CHpsQijuRfTzrcHGeKjMmObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/HbiZ78ZhYCJhg/rC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3Pfx19dZA8SIq84NbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZrA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69M5kWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jNiuMolGfFsRL4kjQNo+aQ7bWHHAUccYa
 tT5fTnlbdrmJWhHjXkVydUsZiRtz8Ib227qwA5y7GoOnFt7Q9EJ0d0/r1iol4QsJ06UJVK/O
 LCL+Bhk6xPVNYfaeZnCP4GWtbfMB27ffvgChPmHb3cLtByB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCtkmlehT1YR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR/XjMWztE4BU2BCWYeglFVAOFMkO/torUVOHpczGboXsq+zAaf7WYKHgFD41M1mPcE
 frnAKDV/mownrbKkMQ2iKhJU8FUnaPjK5NLA==
X-Talos-CUID: 9a23:nYLp821f5ExvxWeDP4fP9LxfQOEua36a6yrqIU6JVm8xF+acTlbN0fYx
X-Talos-MUID: 9a23:6qsXFwRoGCyoWxqORXT1pmtPL+FaxZ3pUn0NipsX5tC0KHdZbmI=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="125845632"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xenstored: do not redirect stderr to /dev/null
Date: Wed, 25 Oct 2023 14:50:54 +0100
Message-ID: <87fbae122fd2d75852026d621358031c72c9a36d.1698227069.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

By default stderr gets redirected to /dev/null because oxenstored daemonizes itself.
This must be a left-over from pre-systemd days.

In ee7815f49f ("tools/oxenstored: Set uncaught exception handler") a workaround was added to log exceptions
directly to syslog to cope with standard error being lost.

However it is better to not lose standard error (what if the connection to syslog itself fails, how'd we log that?),
and use the '--no-fork' flag to do that.
This flag is supported by both C and O versions of xenstored.

Both versions also call sd_notify so there is no need for forking.

Leave the default daemonize as is so that xenstored keeps working on non-Linux systems as before.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 433e4849af..09a1230cee 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -52,7 +52,7 @@
 # like "--trace-file @XEN_LOG_DIR@/xenstored-trace.log"
 # See "@sbindir@/xenstored --help" for possible options.
 # Only evaluated if XENSTORETYPE is "daemon".
-XENSTORED_ARGS=
+XENSTORED_ARGS=--no-fork
 
 ## Type: string
 ## Default: Not defined, tracing off
-- 
2.41.0


