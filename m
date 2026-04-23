Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLZzH94x6mkCwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18909453E37
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292211.1570754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvON-0006B2-UB; Thu, 23 Apr 2026 14:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292211.1570754; Thu, 23 Apr 2026 14:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvON-000697-Ot; Thu, 23 Apr 2026 14:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1292211;
 Thu, 23 Apr 2026 14:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@swg.vates.tech>)
 id 1wFvOM-00068A-DI
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOL-00F6TN-QG
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:50:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@swg.vates.tech>)
 id 69ea31c9-5cb7-0a2a0a5109dd-0a2a450ab676-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:57 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@swg.vates.tech>)
 id 69ea31d1-56b3-0a2a450a0019-b9ff1c2297ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad285c5000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:50:52 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id B477A860B1;
 Thu, 23 Apr 2026 16:50:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KwW4d6fYi0KChvPkn7IffskRpGMBiOLh4S1NpTCLRGk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HE2coy3cU39TschWJRYdYq8wFbpLpp7h7EjePCUoWR0rV4oUOEoTjHY1F1hLx3ZX0I+TrptgP
 XA0G66L6CEBkO+Q1+Y0G6Ong8tZjL4GIBC97sd2Lrg8J0rPC/LXZtgBl0S8n9YDK9IMU3VEwPO9
 IG38nZWhW7OPBEwspGaKDcvTvj4PN02VOoNzMTq63ftvcs33D3u2MdAzAIGJOVY1lU8hSre4PAd
 TrziJSI8psId/HM8NyUYBY9Zw1smMaGAxuwFDED7Q4fHh0ua9FeAm58JkoFn+N/btW7BZb4wXfx
 yYkAqQ9X/JrZB53lB7GYo1k5x5CTgm+g7p1xsa89I/RQ==
X-Zone-Loop: 0eb424bdcabf1d73c22e5a825d30e8e81a2beb9141bf
x-campaign-type: default
x-transaction-id: ad9a1c9a-cb6a-4453-b392-fd440a969e31
x-swg-uid: 01-527627f9-4b39-4f05-b98a-58bfae657f9f
X-Mailer: Sweego
Message-ID:
 <1776955852.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@vates.tech>
x-swg-bid: 1776955852.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373
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
Subject: [RFC PATCH v4 3/6] libxl: Add libxl__device_pci_get_qapi_json() internal API
Date: Thu, 23 Apr 2026 16:50:28 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.273f.2e8038414fb5c485.19dbad2845c.4007b31644528610=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955851868
X-purgate-ID: tlsNG-4011c0/1776955857-8127B8B7-A442E7B6/0/0
X-purgate-type: clean
X-purgate-size: 3366
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 18909453E37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.273f.2e8038414fb5c485.19dbad2845c.4007b31644528610=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This function generates the qapi json object for a PCI device to be
passthrough'd to a guest=2E

With the new option hotplug=3D0 for PCI passthrough, device parameters
will be passed using Qemu -device command line option=2E Since -device
accepts qapi json string, this new function will be used to do so=2E

The code that generates the json object comes from
pci_add_qmp_device_add() which now also uses this new function=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
v4: new patch
---
 tools/libs/light/libxl_internal=2Eh |  2 ++
 tools/libs/light/libxl_pci=2Ec      | 26 ++++++++++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_internal=2Eh b/tools/libs/light/libxl_=
internal=2Eh
index e87500bf55=2E=2Eb6d764ad00 100644
--- a/tools/libs/light/libxl_internal=2Eh
+++ b/tools/libs/light/libxl_internal=2Eh
@@ -1734,6 +1734,8 @@ _hidden int libxl__pciback_dev_is_assigned(libxl__gc=
 *gc,
 _hidden int libxl__device_pci_assignable_add(libxl__gc *gc,
                                              libxl_device_pci *pci,
                                              int rebind);
+_hidden libxl__json_object *libxl__device_pci_get_qapi_json(libxl__gc *gc=
,
+                                                         libxl_device_pci=
 *pci);
=20
 /* from libxl_dtdev */
=20
diff --git a/tools/libs/light/libxl_pci=2Ec b/tools/libs/light/libxl_pci=
=2Ec
index 5551abe0a2=2E=2E5004ca47d9 100644
--- a/tools/libs/light/libxl_pci=2Ec
+++ b/tools/libs/light/libxl_pci=2Ec
@@ -1098,16 +1098,10 @@ out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
=20
-static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+libxl__json_object *libxl__device_pci_get_qapi_json(libxl__gc *gc,
+                                                    libxl_device_pci *pci=
)
 {
-    STATE_AO_GC(pas->aodev->ao);
     libxl__json_object *args =3D NULL;
-    int rc;
-
-    /* Convenience aliases */
-    libxl_domid domid =3D pas->domid;
-    libxl_device_pci *pci =3D &pas->pci;
-    libxl__ev_qmp *const qmp =3D &pas->qmp;
=20
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
@@ -1134,6 +1128,22 @@ static void pci_add_qmp_device_add(libxl__egc *egc,=
 pci_add_state *pas)
     if (pci->permissive)
         libxl__qmp_param_add_bool(gc, &args, "permissive", true);
=20
+    return args;
+}
+
+static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+{
+    STATE_AO_GC(pas->aodev->ao);
+    libxl__json_object *args =3D NULL;
+    int rc =3D 0;
+
+    /* Convenience aliases */
+    libxl_domid domid =3D pas->domid;
+    libxl_device_pci *pci =3D &pas->pci;
+    libxl__ev_qmp *const qmp =3D &pas->qmp;
+
+    args =3D libxl__device_pci_get_qapi_json(gc, pci);
+
     qmp->ao =3D pas->aodev->ao;
     qmp->domid =3D domid;
     qmp->payload_fd =3D -1;
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.273f.2e8038414fb5c485.19dbad2845c.4007b31644528610=---

