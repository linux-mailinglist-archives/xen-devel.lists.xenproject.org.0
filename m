Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOkoN9ox6mkCwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7737453E30
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292210.1570745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOI-0005tW-M3; Thu, 23 Apr 2026 14:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292210.1570745; Thu, 23 Apr 2026 14:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOI-0005rq-HK; Thu, 23 Apr 2026 14:50:54 +0000
Received: by outflank-mailman (input) for mailman id 1292210;
 Thu, 23 Apr 2026 14:50:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2753f000f373@swg.vates.tech>)
 id 1wFvOG-0005r9-Kf
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:50:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOG-00Bbvl-1M
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:50:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2753f000f373@swg.vates.tech>)
 id 69ea31cb-bab6-0a2a0a5309dd-0a2a450bc17a-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:52 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2753f000f373@swg.vates.tech>)
 id 69ea31cb-212f-0a2a450b0019-b9ff1c229aa9-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad2753f000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:50:48 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 80BBC86015;
 Thu, 23 Apr 2026 16:50:47 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=M4JVSGAFCQr9BGBfFiKi3POaf5wdzET+5BsITsVx5po=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JqaJMKPNH1YviJrycRVKp5fNbXqNKJjiwyZNJbjd2b8LCfhQJhFwPKaL3cLCsMg/EyhK2JxRF
 j7zY26MvTbPeCm68d5UEolMWCx8XLdKOX/hOPn64HXivTX5kHVj56AIkVdzo2GF0QaWg9RLdsp4
 F2YgRUSLFrUHgUS4zVAclHTZhGi8dULf29EHWn5JhImjd60FDEKpnOse3LRAncVJ8r8FwkpxdLZ
 5TAvaN9oCNEkO78Z4y2kEs9vmYltYq0qSCoGivPl4PrDlgxGjJ0sRc/MAz95NRlWWKKz2z5HoAo
 j/F0kOk2gHsT5ItNzrXcW7RZ4M3VqP7jXsxqdF+9U9Nw==
X-Zone-Loop: aaaeb6fda2177d8d3162e1ec5b3b614a674890ebc939
x-campaign-type: default
x-transaction-id: fbf8b3c8-c264-4d38-bb08-a34e8c008020
x-swg-uid: 01-1d701107-8de0-4714-af1e-fe5806389a5c
X-Mailer: Sweego
Message-ID:
 <1776955848.8631fc262581453bbf619ec5b2062170.19dbad2753f000f373@vates.tech>
x-swg-bid: 1776955848.8631fc262581453bbf619ec5b2062170.19dbad2753f000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Thierry Escande <thierry.escande@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Thierry Escande <thierry.escande@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v4 2/6] libxl: Refactor some PCI device handling functions
Date: Thu, 23 Apr 2026 16:50:27 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.273e.6a96a3d650ac5123.19dbad273e8.28185d46eb971784=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955847657
X-purgate-ID: tlsNG-42698a/1776955852-0415DF3B-4715CB71/0/0
X-purgate-type: clean
X-purgate-size: 5517
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D7737453E30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.273e.6a96a3d650ac5123.19dbad273e8.28185d46eb971784=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In order to support the new hotplug=3D0 option for PCI device passthrough,
3 functions used to manage the assignable PCI device list need to be
made available from outside of libxl_pci=2Ec=2E

This patch renames the function pciback_dev_is_assigned() as
libxl__pciback_dev_is_assigned() and make it available internally=2E
libxl__device_pci_assignable_add() is also exported internally=2E Finaly,
libxl_pci_assignable() is renamed as libxl_device_pci_assignable() to
match with other libxl_device_pci_*() APIs and exported in libxl=2Eh=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
v4: new patch
---
 tools/include/libxl=2Eh             |  1 +
 tools/libs/light/libxl_internal=2Eh |  5 +++++
 tools/libs/light/libxl_pci=2Ec      | 18 +++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/include/libxl=2Eh b/tools/include/libxl=2Eh
index 7c098edab6=2E=2Eefd2664a90 100644
--- a/tools/include/libxl=2Eh
+++ b/tools/include/libxl=2Eh
@@ -2666,6 +2666,7 @@ int libxl_device_pci_assignable_add(libxl_ctx *ctx, =
libxl_device_pci *pci, int r
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *=
pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *n=
um);
 void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int nu=
m);
+bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci);
=20
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* =
str);
diff --git a/tools/libs/light/libxl_internal=2Eh b/tools/libs/light/libxl_=
internal=2Eh
index b65e0064b9=2E=2Ee87500bf55 100644
--- a/tools/libs/light/libxl_internal=2Eh
+++ b/tools/libs/light/libxl_internal=2Eh
@@ -1729,6 +1729,11 @@ _hidden int libxl__device_pci_setdefault(libxl__gc =
*gc, uint32_t domid,
                                          libxl_device_pci *pci, bool hotp=
lug);
 _hidden bool libxl__is_igd_vga_passthru(libxl__gc *gc,
                                         const libxl_domain_config *d_conf=
ig);
+_hidden int libxl__pciback_dev_is_assigned(libxl__gc *gc,
+                                           libxl_device_pci *pci);
+_hidden int libxl__device_pci_assignable_add(libxl__gc *gc,
+                                             libxl_device_pci *pci,
+                                             int rebind);
=20
 /* from libxl_dtdev */
=20
diff --git a/tools/libs/light/libxl_pci=2Ec b/tools/libs/light/libxl_pci=
=2Ec
index 49d272d0de=2E=2E5551abe0a2 100644
--- a/tools/libs/light/libxl_pci=2Ec
+++ b/tools/libs/light/libxl_pci=2Ec
@@ -686,7 +686,7 @@ out:
     return rc;
 }
=20
-static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
+int libxl__pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
     char * spath;
     int rc;
@@ -755,9 +755,9 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_d=
evice_pci *pci)
     return 0;
 }
=20
-static int libxl__device_pci_assignable_add(libxl__gc *gc,
-                                            libxl_device_pci *pci,
-                                            int rebind)
+int libxl__device_pci_assignable_add(libxl__gc *gc,
+                                     libxl_device_pci *pci,
+                                     int rebind)
 {
     libxl_ctx *ctx =3D libxl__gc_owner(gc);
     unsigned dom, bus, dev, func;
@@ -798,7 +798,7 @@ static int libxl__device_pci_assignable_add(libxl__gc =
*gc,
     }
=20
     /* Check to see if it's already assigned to pciback */
-    rc =3D pciback_dev_is_assigned(gc, pci);
+    rc =3D libxl__pciback_dev_is_assigned(gc, pci);
     if ( rc < 0 ) {
         return ERROR_FAIL;
     }
@@ -913,7 +913,7 @@ static int libxl__device_pci_assignable_remove(libxl__=
gc *gc,
     }
=20
     /* Unbind from pciback */
-    if ( (rc =3D pciback_dev_is_assigned(gc, pci)) < 0 ) {
+    if ( (rc =3D libxl__pciback_dev_is_assigned(gc, pci)) < 0 ) {
         return ERROR_FAIL;
     } else if ( rc ) {
         pciback_dev_unassign(gc, pci);
@@ -1509,7 +1509,7 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t do=
mid,
     return AO_INPROGRESS;
 }
=20
-static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
 {
     libxl_device_pci *pcis;
     int num;
@@ -1572,13 +1572,13 @@ void libxl__device_pci_add(libxl__egc *egc, uint32=
_t domid,
     rc =3D libxl__device_pci_setdefault(gc, domid, pci, !starting);
     if (rc) goto out;
=20
-    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
+    if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pci)) {
         rc =3D libxl__device_pci_assignable_add(gc, pci, 1);
         if ( rc )
             goto out;
     }
=20
-    if (!libxl_pci_assignable(ctx, pci)) {
+    if (!libxl_device_pci_assignable(ctx, pci)) {
         LOGD(ERROR, domid, "PCI device %x:%x:%x=2E%x is not assignable",
              pci->domain, pci->bus, pci->dev, pci->func);
         rc =3D ERROR_FAIL;
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.273e.6a96a3d650ac5123.19dbad273e8.28185d46eb971784=---

