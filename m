Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A726838A9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487849.755610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC8-0001VX-8o; Tue, 31 Jan 2023 21:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487849.755610; Tue, 31 Jan 2023 21:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC7-0001PN-UY; Tue, 31 Jan 2023 21:29:35 +0000
Received: by outflank-mailman (input) for mailman id 487849;
 Tue, 31 Jan 2023 21:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC5-0000Nm-Kb
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58685249-a1ae-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 22:29:31 +0100 (CET)
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
X-Inumbo-ID: 58685249-a1ae-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6fomBGSmJOQ8kYSoARFYZfJ7J0cbqAWh1IAdPyYhsE=;
  b=JYEzherDJoTOePts40n4Aw3VyqbG07cKdW3/nIiXhQDQl4rtz2h72RNi
   PL75zCAHkKhjEVHCL41hn6+/1ve1Xfp2v5iOkk7UP2tD4wymOE25Z025/
   vQcXVrnvZa+PdpAgj8BOfli07zt620i73jBCXIWNkrrA5xeZQaVIQjE/c
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499181
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:UaIn26Dp78IZrxVW/yjjw5YqxClBgxIJ4kV8jS/XYbTApG8ghmNWy
 TcbCG+EOvyDYmOgL4t1O4Ti9RsHuZ/Wm9M1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpD5wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0/5SWVMJ1
 +IhMTkAYjTY28uE8qOCY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4HWFJQMzh/wS
 mTu2zrFWkslF8Wl8BWZ8m6QivTwwy3UcddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHKNoBM0QddbFOw+rgaXxcLpDx2xXzZeCGQbMZp/6ZFwHGZxv
 rOUoz/3LRV3leWnDlCDz66doD+WYnQ8H10TXAZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pnzv55p0xWG2zaD+qXNEBzzk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvVJlznPC4TYm/DK+8gj9yjn9ZLV/vwc2TTRTIgzCFfLYEzsnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Tq7eHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnKOrdBIcg1WdyhT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:6YTmlaFIAcvJGvc6pLqF8ZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdoZJkh8erhBEDyewKmyXcV2/hZAV7MZniDhILFFu9fBM7ZskTd8k7Fh6ZgPM
 VbAs9D4bTLZDAX4voSojPIderIq+P3k5xA8N2uqkuFOjsaCZ2IgT0ZNi+rVmlNACVWD5swE5
 SRouJBujqbYHwSKuirG3UfWODHhtvT0LbrewQPCRIL4BSHyWrA0s+xLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjPMymPJ6JxSud35jv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6xmxLY0IDEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnR76+8PDW3hR5wWJSDsZ4KAuZk5kIMsjgYxq3M8iFYRuYdU99RfBmcEa+S
 9VfYThDbhtABenhjvizxNSKZSXLwkO91G9MwU/U4WuokRrtWE8wE0CyMMFmHAcsJo7Vplf/u
 zBdr9ljbdUU6YtHNZA7co6MLmK41b2MGfxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3IivVeLuz9YwO9gqITHS2XDzrxM0b759luqfkTL6uNSGYUlghn8apvv1aCMzGXP
 S4Po5QHpbYXBzTMJcM2xe7V4hZKHEYXsFQstEnW0iWqsaOMYHuvvyzSoehGFMsK0dVZorSOA
 pzYNGoHrQ+0qmCYA6HvCTs
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499181"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 4/7] tools/ocaml/evtchn: Misc cleanup
Date: Tue, 31 Jan 2023 21:29:10 +0000
Message-ID: <20230131212913.6199-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Remove local integers when all we're returning is Val_int() of another
   variable.  The CAMLlocal*() can't be optimised automatically, as it's
   registered with the GC.
 * Rename "virq_type" to "virq" and "_port" to "port".
 * In stub_eventchn_pending(), rename 'port' to 'rc', to be consistent with
   all other stubs that return xenevtchn_port_or_error_t.
 * In stub_eventchn_unmask(), check for rc == -1 to be consistent with all
   other stubs.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 45 +++++++++++----------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index d7881ca95f98..34dcfed30275 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -98,17 +98,15 @@ CAMLprim value stub_eventchn_fdopen(value fdval)
 CAMLprim value stub_eventchn_fd(value xce_val)
 {
 	CAMLparam1(xce_val);
-	CAMLlocal1(result);
 	xenevtchn_handle *xce = xce_of_val(xce_val);
 	int fd;
 
+	/* Don't drop the GC lock.  This is a simple read out of memory */
 	fd = xenevtchn_fd(xce);
 	if (fd == -1)
 		caml_failwith("evtchn fd failed");
 
-	result = Val_int(fd);
-
-	CAMLreturn(result);
+	CAMLreturn(Val_int(fd));
 }
 
 CAMLprim value stub_eventchn_notify(value xce_val, value port)
@@ -131,37 +129,34 @@ CAMLprim value stub_eventchn_bind_interdomain(value xce_val, value domid,
                                               value remote_port)
 {
 	CAMLparam3(xce_val, domid, remote_port);
-	CAMLlocal1(port);
 	xenevtchn_handle *xce = xce_of_val(xce_val);
 	xenevtchn_port_or_error_t rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_bind_interdomain(xce, Int_val(domid), Int_val(remote_port));
+	rc = xenevtchn_bind_interdomain(xce, Int_val(domid),
+					Int_val(remote_port));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
 		caml_failwith("evtchn bind_interdomain failed");
-	port = Val_int(rc);
 
-	CAMLreturn(port);
+	CAMLreturn(Val_int(rc));
 }
 
-CAMLprim value stub_eventchn_bind_virq(value xce_val, value virq_type)
+CAMLprim value stub_eventchn_bind_virq(value xce_val, value virq)
 {
-	CAMLparam2(xce_val, virq_type);
-	CAMLlocal1(port);
+	CAMLparam2(xce_val, virq);
 	xenevtchn_handle *xce = xce_of_val(xce_val);
 	xenevtchn_port_or_error_t rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_bind_virq(xce, Int_val(virq_type));
+	rc = xenevtchn_bind_virq(xce, Int_val(virq));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
 		caml_failwith("evtchn bind_virq failed");
-	port = Val_int(rc);
 
-	CAMLreturn(port);
+	CAMLreturn(Val_int(rc));
 }
 
 CAMLprim value stub_eventchn_unbind(value xce_val, value port)
@@ -183,35 +178,31 @@ CAMLprim value stub_eventchn_unbind(value xce_val, value port)
 CAMLprim value stub_eventchn_pending(value xce_val)
 {
 	CAMLparam1(xce_val);
-	CAMLlocal1(result);
 	xenevtchn_handle *xce = xce_of_val(xce_val);
-	xenevtchn_port_or_error_t port;
+	xenevtchn_port_or_error_t rc;
 
 	caml_enter_blocking_section();
-	port = xenevtchn_pending(xce);
+	rc = xenevtchn_pending(xce);
 	caml_leave_blocking_section();
 
-	if (port == -1)
+	if (rc == -1)
 		caml_failwith("evtchn pending failed");
-	result = Val_int(port);
 
-	CAMLreturn(result);
+	CAMLreturn(Val_int(rc));
 }
 
-CAMLprim value stub_eventchn_unmask(value xce_val, value _port)
+CAMLprim value stub_eventchn_unmask(value xce_val, value port)
 {
-	CAMLparam2(xce_val, _port);
+	CAMLparam2(xce_val, port);
 	xenevtchn_handle *xce = xce_of_val(xce_val);
-	evtchn_port_t port;
 	int rc;
 
-	port = Int_val(_port);
-
 	caml_enter_blocking_section();
-	rc = xenevtchn_unmask(xce, port);
+	rc = xenevtchn_unmask(xce, Int_val(port));
 	caml_leave_blocking_section();
 
-	if (rc)
+	if (rc == -1)
 		caml_failwith("evtchn unmask failed");
+
 	CAMLreturn(Val_unit);
 }
-- 
2.11.0


