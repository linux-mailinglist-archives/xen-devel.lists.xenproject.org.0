Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6RnJA0HNGrrLQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F036A10BE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=JJdY7eeZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341263.1601741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEA2-0007s7-Bs; Thu, 18 Jun 2026 14:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341263.1601741; Thu, 18 Jun 2026 14:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEA2-0007pm-8N; Thu, 18 Jun 2026 14:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1341263;
 Thu, 18 Jun 2026 14:56:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@swg.vates.tech>)
 id 1waEA1-0007oQ-3C
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEA0-002MfF-GB
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@swg.vates.tech>)
 id 6a3406fe-2eae-0a2a0a5409dd-0a2a4502e5c8-20
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:04 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b3983000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:52 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8860386962;
 Thu, 18 Jun 2026 16:55:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DBXVzWUdKqv4XO+RwbxBSOuwbDBuwHpdIwUWgwnpbuM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JJdY7eeZFydmv0w7QgIHKjGlfIfOeApOKh0LNFHUC3wm5w69T+yxHulzcZoSkSR02URZvuBp7
 Qph3J6SuV0wUyL5yL9CwdLIqLjWm8KxgfNI0Y6VLvEbhLiQc3Oz1P4IgwLQBZYzMurGY30jIoE0
 5zL63L9xG+NlVxnyz3YomYBh7YABxluL5Qh40cYYci9pws0TFcv3A41m/b/k9G8IwasGu0Okesm
 BnyPO1ldL98+qwfGkfN2FdfuooJiQC5IpXra8ohHNL9spq2BxHTUb89ZsTN/TUhYoMpMVr7P+UA
 mwT6VRACumlIyhXEmVEi/b7jroO8d0ABLyts7HpS61bQ==
X-Zone-Loop: b16db836eb1ae6115f66dcb0ab6af920c3d7b2e0f7d0
x-campaign-type: default
x-transaction-id: aa0583de-7335-47cc-b90c-e3fcac6fddce
x-swg-uid: 01-79444b43-3221-4b1e-91d1-54d754b22dc5
X-Mailer: Sweego
Message-ID:
 <1781794552.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@vates.tech>
x-swg-bid: 1781794552.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b
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
Subject: [PATCH v2 03/15] pci: Use pci_sbdf_t in pci_device_detect()
Date: Thu, 18 Jun 2026 16:50:27 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.68a.f1546dc533ada7c4.19edb3b37ce.ca02ebdabd7bb6a2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794551759
X-purgate-ID: tlsNG-720697/1781794564-3FFD33F3-565BE87B/0/0
X-purgate-type: clean
X-purgate-size: 10828
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 41F036A10BE

---=Part.68a.f1546dc533ada7c4.19edb3b37ce.ca02ebdabd7bb6a2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a single pci_sbdf_t instead of each of its part as individual parameter=
s=2E

ehci-dbgp will now parse a PCI segment (if specified), even if it's not us=
ed afterward=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ehci-dbgp=2Ec       | 33 ++++++++++++++----------------
 xen/drivers/passthrough/pci=2Ec      | 16 +++++++--------
 xen/drivers/passthrough/vtd/dmar=2Ec | 33 ++++++++++++------------------
 xen/include/xen/pci=2Eh              |  2 +-
 4 files changed, 37 insertions(+), 47 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index a5c79f56fc=2E=2E27bcff0a8f 100644
--- a/xen/drivers/char/ehci-dbgp=2Ec
+++ b/xen/drivers/char/ehci-dbgp=2Ec
@@ -681,16 +681,14 @@ static int dbgp_control_msg(struct ehci_dbgp *dbgp, =
unsigned int devnum,
     return ret;
 }
=20
-static unsigned int __init __find_dbgp(u8 bus, u8 slot, u8 func)
+static unsigned int __init __find_dbgp(pci_sbdf_t sbdf)
 {
-    uint32_t class =3D pci_conf_read32(PCI_SBDF(0, bus, slot, func),
-                                     PCI_CLASS_REVISION);
+    uint32_t class =3D pci_conf_read32(sbdf, PCI_CLASS_REVISION);
=20
     if ( (class >> 8) !=3D PCI_CLASS_SERIAL_USB_EHCI )
         return 0;
=20
-    return pci_find_cap_offset(PCI_SBDF(0, bus, slot, func),
-                               PCI_CAP_ID_EHCI_DEBUG);
+    return pci_find_cap_offset(sbdf, PCI_CAP_ID_EHCI_DEBUG);
 }
=20
 static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
@@ -704,20 +702,20 @@ static unsigned int __init find_dbgp(struct ehci_dbg=
p *dbgp,
         {
             for ( func =3D 0; func < 8; func++ )
             {
+                pci_sbdf_t sbdf =3D PCI_SBDF(0, bus, slot, func);
                 unsigned int cap;
=20
-                if ( !pci_device_detect(0, bus, slot, func) )
+                if ( !pci_device_detect(sbdf) )
                 {
                     if ( !func )
                         break;
                     continue;
                 }
=20
-                cap =3D __find_dbgp(bus, slot, func);
+                cap =3D __find_dbgp(sbdf);
                 if ( !cap || ehci_num-- )
                 {
-                    if ( !func && !(pci_conf_read8(PCI_SBDF(0, bus, slot,=
 func),
-                                                   PCI_HEADER_TYPE) & 0x8=
0) )
+                    if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE)=
 & 0x80) )
                         break;
                     continue;
                 }
@@ -1510,25 +1508,24 @@ void __init ehci_dbgp_init(void)
     }
     else if ( strncmp(opt_dbgp + 4, "@pci", 4) =3D=3D 0 )
     {
-        unsigned int bus, slot, func;
+        pci_sbdf_t sbdf =3D PCI_SBDF(0, 0, 0, 0);
=20
-        e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        e =3D parse_pci_sbdf(opt_dbgp + 8, &sbdf);
         if ( !e || *e )
             return;
=20
-        dbgp->bus =3D bus;
-        dbgp->slot =3D slot;
-        dbgp->func =3D func;
+        dbgp->bus =3D sbdf=2Ebus;
+        dbgp->slot =3D sbdf=2Edev;
+        dbgp->func =3D sbdf=2Efn;
=20
-        if ( !pci_device_detect(0, bus, slot, func) )
+        if ( !pci_device_detect(sbdf) )
             return;
=20
-        dbgp->cap =3D __find_dbgp(bus, slot, func);
+        dbgp->cap =3D __find_dbgp(sbdf);
         if ( !dbgp->cap )
             return;
=20
-        dbgp_printk("Using EHCI debug port on %02x:%02x=2E%u\n",
-                    bus, slot, func);
+        dbgp_printk("Using EHCI debug port on %pp\n", &sbdf);
     }
     else
         return;
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index d37ceb7b6c=2E=2E7b09c9a7cd 100644
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
@@ -1221,24 +1221,24 @@ static int __init cf_check _scan_pci_devices(struc=
t pci_seg *pseg, void *arg)
         {
             for ( func =3D 0; func < 8; func++ )
             {
-                if ( !pci_device_detect(pseg->nr, bus, dev, func) )
+                pci_sbdf_t sbdf =3D PCI_SBDF(pseg->nr, bus, dev, func);
+
+                if ( !pci_device_detect(sbdf) )
                 {
                     if ( !func )
                         break;
                     continue;
                 }
=20
-                pdev =3D alloc_pdev(pseg, bus, PCI_DEVFN(dev, func));
+                pdev =3D alloc_pdev(pseg, bus, sbdf=2Edevfn);
                 if ( !pdev )
                 {
                     printk(XENLOG_WARNING "%pp: alloc_pdev failed\n",
-                           &PCI_SBDF(pseg->nr, bus, dev, func));
+                           &sbdf);
                     return -ENOMEM;
                 }
=20
-                if ( !func && !(pci_conf_read8(PCI_SBDF(pseg->nr, bus, de=
v,
-                                                        func),
-                                               PCI_HEADER_TYPE) & 0x80) )
+                if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE) & 0=
x80) )
                     break;
             }
         }
diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 71e5a51a58=2E=2E61269c7e0d 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -383,7 +383,7 @@ static int __init acpi_parse_dev_scope(
             if ( iommu_verbose )
                 printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
=20
-            if ( drhd && pci_device_detect(seg, dev_sbdf=2Ebus, dev_sbdf=
=2Edev, dev_sbdf=2Efn) )
+            if ( drhd && pci_device_detect(dev_sbdf) )
             {
                 if ( pci_conf_read8(dev_sbdf,
                                     PCI_CLASS_DEVICE + 1) !=3D 0x03
@@ -506,7 +506,6 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
         acpi_register_drhd_unit(dmaru);
     else
     {
-        u8 b, d, f;
         unsigned int i =3D 0;
         union {
             const void *raw;
@@ -520,18 +519,16 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
         for ( p=2Eraw =3D dev_scope_start; i < dmaru->scope=2Edevices_cnt=
;
               i++, p=2Eraw +=3D p=2Escope->length )
         {
+            pci_sbdf_t sbdf =3D PCI_SBDF(drhd->segment, dmaru->scope=2Ede=
vices[i]);
+
             if ( p=2Escope->entry_type =3D=3D ACPI_DMAR_SCOPE_TYPE_IOAPIC=
 ||
                  p=2Escope->entry_type =3D=3D ACPI_DMAR_SCOPE_TYPE_HPET )
                 continue;
=20
-            b =3D PCI_BUS(dmaru->scope=2Edevices[i]);
-            d =3D PCI_SLOT(dmaru->scope=2Edevices[i]);
-            f =3D PCI_FUNC(dmaru->scope=2Edevices[i]);
-
-            if ( !pci_device_detect(drhd->segment, b, d, f) )
+            if ( !pci_device_detect(sbdf) )
                 printk(XENLOG_WARNING VTDPREFIX
                        " Non-existent device (%pp) in this DRHD's scope!\=
n",
-                       &PCI_SBDF(drhd->segment, b, d, f));
+                       &sbdf);
         }
=20
         acpi_register_drhd_unit(dmaru);
@@ -560,17 +557,14 @@ static int __init register_one_rmrr(struct acpi_rmrr=
_unit *rmrru)
=20
     for ( ; i < rmrru->scope=2Edevices_cnt; i++ )
     {
-        u8 b =3D PCI_BUS(rmrru->scope=2Edevices[i]);
-        u8 d =3D PCI_SLOT(rmrru->scope=2Edevices[i]);
-        u8 f =3D PCI_FUNC(rmrru->scope=2Edevices[i]);
+        pci_sbdf_t sbdf =3D PCI_SBDF(rmrru->segment, rmrru->scope=2Edevic=
es[i]);
=20
-        if ( pci_device_detect(rmrru->segment, b, d, f) =3D=3D 0 )
+        if ( pci_device_detect(sbdf) =3D=3D 0 )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
                     " Non-existent device (%pp) is reported"
                     " in RMRR [%"PRIx64", %"PRIx64"]'s scope!\n",
-                    &PCI_SBDF(rmrru->segment, b, d, f),
-                    rmrru->base_address, rmrru->end_address);
+                    &sbdf, rmrru->base_address, rmrru->end_address);
             ignore =3D true;
         }
         else
@@ -754,15 +748,13 @@ static int __init register_one_satc(struct acpi_satc=
_unit *satcu)
=20
     for ( ; i < satcu->scope=2Edevices_cnt; i++ )
     {
-        uint8_t b =3D PCI_BUS(satcu->scope=2Edevices[i]);
-        uint8_t d =3D PCI_SLOT(satcu->scope=2Edevices[i]);
-        uint8_t f =3D PCI_FUNC(satcu->scope=2Edevices[i]);
+        pci_sbdf_t sbdf =3D PCI_SBDF(satcu->segment, satcu->scope=2Edevic=
es[i]);
=20
-        if ( !pci_device_detect(satcu->segment, b, d, f) )
+        if ( !pci_device_detect(sbdf) )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
                     " Non-existent device (%pp) is reported in SATC scope=
!\n",
-                    &PCI_SBDF(satcu->segment, b, d, f));
+                    &sbdf);
             ignore =3D true;
         }
         else
@@ -1185,8 +1177,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
 static int __init cf_check parse_rmrr_param(const char *str)
 {
     const char *s =3D str, *cur, *stmp;
-    unsigned int seg, bus, dev, func, dev_count;
+    unsigned int dev_count;
     unsigned long start, end;
+    pci_sbdf_t sbdf;
=20
     do {
         if ( nr_rmrr >=3D MAX_USER_RMRR )
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index 7bfc59cd75=2E=2Ed816dcad05 100644
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
---=Part.68a.f1546dc533ada7c4.19edb3b37ce.ca02ebdabd7bb6a2=---

