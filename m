Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SjDFCTWqQmqW/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6D6DDA8E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=CulT1hfF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347809.1605667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhr-00007H-Qb; Mon, 29 Jun 2026 17:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347809.1605667; Mon, 29 Jun 2026 17:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhr-00004r-Mt; Mon, 29 Jun 2026 17:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1347809;
 Mon, 29 Jun 2026 17:23:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685405000701b@swg.vates.tech>)
 id 1weFhp-0008Vv-Vg
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFhp-002otI-CS
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685405000701b@swg.vates.tech>)
 id 6a42a9ff-e002-0a2a0a5209dd-0a2a450bdb1c-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:37 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14685405000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14685405000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:29 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B9EA786BC8;
 Mon, 29 Jun 2026 19:23:28 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=OpPIli9TxyFxDbIG2f/k1jSavRrBoXcHE7QatsqVtIU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CulT1hfFN7cd40YNFfU2dLhlJ7PcEibM0kNE1OlL3hAa6EVfgP7ggj0XMyZ3t+dftP+r+BqBi
 k6BUq4iHcXfnGNJOvak9+JNU6dKZvQkv/7pdTpTd5G1dQAR6xnmNfTyiqA5uDeWmPMi4Cffx/KY
 fpOPhemZF+I4ipXLsEJk4r+IizN5LzDH0dVt4nyRAQvb+GKarHj0rlqLtlgZ63KZtrSFqy3BPb5
 M3rrESjTK3ewtfQKJ8ht29bCOuL1ceWRQWar36qnlAYmA4n9U/tc0yfBMLJzFFMkZx7YOpAEgnM
 YUH5u8+Z92T9/Lui10PO3p9yU+3hK4vpb5hbc0ga53cg==
X-Zone-Loop: e8f865c9cd4a855f09733f9953b5c2ac450c059bfdfb
x-campaign-type: default
x-transaction-id: 169e2a28-1367-461f-b0eb-e6f6c647f4ef
x-swg-uid: 01-08c8a73f-f786-4215-beb0-38896eb4de90
X-Mailer: Sweego
Message-ID:
 <1782753809.8631fc262581453bbf619ec5b2062170.19f14685405000701b@vates.tech>
x-swg-bid: 1782753809.8631fc262581453bbf619ec5b2062170.19f14685405000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 01/18] pci: Use pci_sbdf_t in pci_device_detect()
Date: Mon, 29 Jun 2026 19:21:19 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.80c.29d522b80b190627.19f14685249.629e09b19ff126e4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753808969
X-purgate-ID: tlsNG-42698a/1782753817-39F26220-022F8239/0/0
X-purgate-type: clean
X-purgate-size: 5706
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C6D6DDA8E

---=Part.80c.29d522b80b190627.19f14685249.629e09b19ff126e4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a single pci_sbdf_t instead of each of its part as individual parameter=
s=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v3: Don't adjust adjacent code=2E
---
 xen/drivers/char/ehci-dbgp=2Ec       | 4 ++--
 xen/drivers/passthrough/pci=2Ec      | 6 +++---
 xen/drivers/passthrough/vtd/dmar=2Ec | 9 +++++----
 xen/include/xen/pci=2Eh              | 2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index a5c79f56fc=2E=2E2a58213cab 100644
--- a/xen/drivers/char/ehci-dbgp=2Ec
+++ b/xen/drivers/char/ehci-dbgp=2Ec
@@ -706,7 +706,7 @@ static unsigned int __init find_dbgp(struct ehci_dbgp =
*dbgp,
             {
                 unsigned int cap;
=20
-                if ( !pci_device_detect(0, bus, slot, func) )
+                if ( !pci_device_detect(PCI_SBDF(0, bus, slot, func)) )
                 {
                     if ( !func )
                         break;
@@ -1520,7 +1520,7 @@ void __init ehci_dbgp_init(void)
         dbgp->slot =3D slot;
         dbgp->func =3D func;
=20
-        if ( !pci_device_detect(0, bus, slot, func) )
+        if ( !pci_device_detect(PCI_SBDF(0, bus, slot, func)) )
             return;
=20
         dbgp->cap =3D __find_dbgp(bus, slot, func);
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index d37ceb7b6c=2E=2E0adf573150 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -1166,11 +1166,11 @@ out:
     return ret;
 }
=20
-bool __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
+bool __init pci_device_detect(pci_sbdf_t sbdf)
 {
     u32 vendor;
=20
-    vendor =3D pci_conf_read32(PCI_SBDF(seg, bus, dev, func), PCI_VENDOR_=
ID);
+    vendor =3D pci_conf_read32(sbdf, PCI_VENDOR_ID);
     /* some broken boards return 0 or ~0 if a slot is empty: */
     if ( (vendor =3D=3D 0xffffffffU) || (vendor =3D=3D 0x00000000U) ||
          (vendor =3D=3D 0x0000ffffU) || (vendor =3D=3D 0xffff0000U) )
@@ -1221,7 +1221,7 @@ static int __init cf_check _scan_pci_devices(struct =
pci_seg *pseg, void *arg)
         {
             for ( func =3D 0; func < 8; func++ )
             {
-                if ( !pci_device_detect(pseg->nr, bus, dev, func) )
+                if ( !pci_device_detect(PCI_SBDF(pseg->nr, bus, dev, func=
)) )
                 {
                     if ( !func )
                         break;
diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 2a756831a6=2E=2E8db9591a36 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -389,7 +389,8 @@ static int __init acpi_parse_dev_scope(
                 printk(VTDPREFIX " endpoint: %pp\n",
                        &PCI_SBDF(seg, bus, path->dev, path->fn));
=20
-            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn)=
 )
+            if ( drhd && pci_device_detect(PCI_SBDF(seg, bus, path->dev,
+                                                    path->fn)) )
             {
                 if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->f=
n),
                                     PCI_CLASS_DEVICE + 1) !=3D 0x03
@@ -537,7 +538,7 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
             d =3D PCI_SLOT(dmaru->scope=2Edevices[i]);
             f =3D PCI_FUNC(dmaru->scope=2Edevices[i]);
=20
-            if ( !pci_device_detect(drhd->segment, b, d, f) )
+            if ( !pci_device_detect(PCI_SBDF(drhd->segment, b, d, f)) )
                 printk(XENLOG_WARNING VTDPREFIX
                        " Non-existent device (%pp) in this DRHD's scope!\=
n",
                        &PCI_SBDF(drhd->segment, b, d, f));
@@ -573,7 +574,7 @@ static int __init register_one_rmrr(struct acpi_rmrr_u=
nit *rmrru)
         u8 d =3D PCI_SLOT(rmrru->scope=2Edevices[i]);
         u8 f =3D PCI_FUNC(rmrru->scope=2Edevices[i]);
=20
-        if ( pci_device_detect(rmrru->segment, b, d, f) =3D=3D 0 )
+        if ( pci_device_detect(PCI_SBDF(rmrru->segment, b, d, f)) =3D=3D =
0 )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
                     " Non-existent device (%pp) is reported"
@@ -767,7 +768,7 @@ static int __init register_one_satc(struct acpi_satc_u=
nit *satcu)
         uint8_t d =3D PCI_SLOT(satcu->scope=2Edevices[i]);
         uint8_t f =3D PCI_FUNC(satcu->scope=2Edevices[i]);
=20
-        if ( !pci_device_detect(satcu->segment, b, d, f) )
+        if ( !pci_device_detect(PCI_SBDF(satcu->segment, b, d, f)) )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
                     " Non-existent device (%pp) is reported in SATC scope=
!\n",
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index afb6bbf50d=2E=2Eade882caee 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -218,7 +218,7 @@ static always_inline bool pcidevs_trylock(void)
 #endif
=20
 bool pci_known_segment(u16 seg);
-bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
+bool pci_device_detect(pci_sbdf_t sbdf);
 int scan_pci_devices(void);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.80c.29d522b80b190627.19f14685249.629e09b19ff126e4=---

