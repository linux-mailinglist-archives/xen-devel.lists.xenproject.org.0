Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHnrLuYx6mkCwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA29453E4E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 16:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292216.1570772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOT-0006lr-Mo; Thu, 23 Apr 2026 14:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292216.1570772; Thu, 23 Apr 2026 14:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOT-0006iX-Fx; Thu, 23 Apr 2026 14:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1292216;
 Thu, 23 Apr 2026 14:51:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@swg.vates.tech>)
 id 1wFvOS-0006gd-K9
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:51:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOS-00F6TN-0q
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:51:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@swg.vates.tech>)
 id 69ea31cb-5cb7-0a2a0a5109dd-0a2a4507892a-38
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:51:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@swg.vates.tech>)
 id 69ea31d7-229c-0a2a45070019-b9ff1c2288dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:51:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad2a232000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:50:59 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 049C786015;
 Thu, 23 Apr 2026 16:50:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Z1+eytwSMTKXppL/bkeDgKPsP7+rKwCxiKHDiZ0OLRs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=alK7gqYGRD+HqkxLviBMDg+XTAToMGJ0ZzJFEK03pnOlIpiM5UyHAYHjDYW4SXKwBvTN9Yodn
 uGnH11u28ynt9a4jAwuuD5cYd0gxwkwjoeyYvJ+ybEeUyPJcEFqOtcVvBZ0wa3GH6RhBul/6dMR
 CkHF0y0tj/9HTvvsgNzALNXc0UFYIaZ+tIWpVUXPnDCcLnvr4qsLE89V4n8iEiWAWVpRuDECOab
 YzZOXYiBVFIvBsa4DfoAy94d+0nvssebwUoupPDPt/Yh2Rs8X81+X4J6G8LEDtcB01P780VLw0Q
 zROQ3+Od2J3hCHe0CYci2M5p3qxI6dQAacq7PvtgZCMg==
X-Zone-Loop: 6538666f2d8b81dc348812ba600f25a9bba8957c5f5e
x-campaign-type: default
x-transaction-id: f53b331b-f1f9-4a35-91a8-33d1289c8542
x-swg-uid: 01-c33a206f-094b-4b05-a72d-b019a2809139
X-Mailer: Sweego
Message-ID:
 <1776955859.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@vates.tech>
x-swg-bid: 1776955859.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373
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
Subject: [RFC PATCH v4 5/6] libxl: Allow PCI device passthrough using -device Qemu command line
Date: Thu, 23 Apr 2026 16:50:30 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2741.19abcf34cab5d289.19dbad2a0c7.3e37f28d3be2e66=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955859143
X-purgate-ID: tlsNG-ef75cf/1776955863-AE36CC48-15548791/0/0
X-purgate-type: clean
X-purgate-size: 5173
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0FA29453E4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.2741.19abcf34cab5d289.19dbad2a0c7.3e37f28d3be2e66=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This change makes use of the new option 'hotplug' for host PCI devices
passthrough'd to the guest=2E If hotplug=3D0 is used in the pci device
configuration table, the device will be attached to the guest using the
Qemu command line as '-device xen-pci-passthrough,hostaddr=3D=2E=2E=2E'

The host device configuration is passed to the -device option as a json
array, just like it's done for hotplug using QMP=2E The json array is
created by using libxl__device_pci_get_qapi_json() introduced by the
previous patch=2E

Then, instead of sending the 'device_add' command, the device_add
callback is called to perform the 'query-pci' check to make sure the
passthrough'd device is present=2E

In the same way at shutdown, the device is not removed using QMP and
only the pci_remove_done() function is called=2E

As with QMP, the use of the 'hotplug=3D0' option honors the 'seize' option
by adding the PCI device to the assignable list if needed=2E This mimics
what is done in libxl__device_pci_add() with regards to seize option and
the assignable PCI device list=2E This allows to display a proper error
message if the device is not assignable before Qemu starts=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
Changes in v2:
 - Add support for YAJL json parser

Changes in v3:
 - Move code block for device command line parameters creation to a
   correct place=2E
 - Better handling of PCI device assignation check to display the correct
   error message if the device is not assignable=2E

Changes in v4:
 - Move function refactoring parts into their own patches
 - Use libxl__json_object_to_json() that can now return plain json strings
---
 tools/libs/light/libxl_dm=2Ec  | 33 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_pci=2Ec | 13 ++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm=2Ec b/tools/libs/light/libxl_dm=2Ec
index 511ec76a65=2E=2Efb0aeea640 100644
--- a/tools/libs/light/libxl_dm=2Ec
+++ b/tools/libs/light/libxl_dm=2Ec
@@ -1798,6 +1798,39 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
             break;
         }
=20
+        if (guest_config->num_pcidevs) {
+            libxl_device_pci *pci;
+            libxl__json_object *qmp_json;
+            char *json_str;
+
+            for (i =3D 0; i < guest_config->num_pcidevs; i++) {
+                pci =3D &guest_config->pcidevs[i];
+
+                if (pci->hotplug)
+                    continue;
+
+                if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pci=
)) {
+                    rc =3D libxl__device_pci_assignable_add(gc, pci, 1);
+                    if (rc)
+                        return rc;
+                }
+
+                if (!libxl_device_pci_assignable(libxl__gc_owner(gc), pci=
)) {
+                    LOGD(ERROR, guest_domid, "PCI device %x:%x:%x=2E%x is=
 not assignable",
+                         pci->domain, pci->bus, pci->dev, pci->func);
+                    return ERROR_FAIL;
+                }
+
+                qmp_json =3D libxl__device_pci_get_qapi_json(gc, pci);
+
+                json_str =3D libxl__json_object_to_json(gc, qmp_json, fal=
se);
+                if (!json_str)
+                    return ERROR_NOMEM;
+
+                flexarray_vappend(dm_args, "-device", json_str, NULL);
+            }
+        }
+
         if (state->dm_runas) {
             if (qemu_opts->have_runwith_user) {
                 flexarray_append_pair(dm_args, "-run-with",
diff --git a/tools/libs/light/libxl_pci=2Ec b/tools/libs/light/libxl_pci=
=2Ec
index 5004ca47d9=2E=2Ef5216f6b33 100644
--- a/tools/libs/light/libxl_pci=2Ec
+++ b/tools/libs/light/libxl_pci=2Ec
@@ -1148,7 +1148,10 @@ static void pci_add_qmp_device_add(libxl__egc *egc,=
 pci_add_state *pas)
     qmp->domid =3D domid;
     qmp->payload_fd =3D -1;
     qmp->callback =3D pci_add_qmp_device_add_cb;
-    rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    if (pci->hotplug)
+        rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    else
+        pci_add_qmp_device_add_cb(egc, qmp, NULL, 0);
     if (rc) goto out;
     return;
=20
@@ -1830,6 +1833,14 @@ static void do_pci_remove(libxl__egc *egc, pci_remo=
ve_state *prs)
     libxl_domain_type type =3D libxl__domain_type(gc, domid);
     libxl_device_pci *pci =3D &prs->pci;
     int rc, num;
+
+    /* Passthrough'd device has been passed to Qemu command line so there=
 is
+     * no need to remove it via QMP */
+    if (!pci->hotplug) {
+        pci_remove_done(egc, prs, 0);
+        return;
+    }
+
     pcis =3D libxl_device_pci_list(ctx, domid, &num);
     if (!pcis) {
         rc =3D ERROR_FAIL;
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.2741.19abcf34cab5d289.19dbad2a0c7.3e37f28d3be2e66=---

