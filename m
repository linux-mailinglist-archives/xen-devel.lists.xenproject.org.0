Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fw0WMjSqQmqU/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB96DDA8B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=XIbWuIwr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347823.1605748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi9-0002Xj-4a; Mon, 29 Jun 2026 17:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347823.1605748; Mon, 29 Jun 2026 17:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi8-0002Sz-QP; Mon, 29 Jun 2026 17:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1347823;
 Mon, 29 Jun 2026 17:23:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@swg.vates.tech>)
 id 1weFi7-0002Aj-0V
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi6-00FsUc-De
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-22
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1468731b000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:37 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C67FB80C54;
 Mon, 29 Jun 2026 19:23:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BrRNZZbFpJbTHGFgqo4cVNk445TpPETMAxylKljcmHY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XIbWuIwrMaINkb9EERY4qEPzjGaaDdIlRNfr+QpfTh3aqpxNbuxsLcESBDKJZoWESGuPB9aKg
 1cvGsOg9s8dc4ZonJsmMCuFeVsfL7UQmbqM0ueQhUMvPBil0+dAHvVceFUZOUm298WMboW9vqM1
 e7Gn6nMrBOOBQqMAKtvpR4oGshtabbLO2i2UjWHWhajxfmFTRm+w4uBiOOdaMdPIIzvp2HQ2Z0u
 9asPABgZBnnHqlCNYtDk0aPiCKsb4mtF4QheM8d4ZfkBPQ44TtTyZ7Yk5oe4eq50w+EF9iOpEgm
 XSGurKwxv/lZNkavi/LtiStQGrMdhT+ObkBtwSxL05tA==
X-Zone-Loop: 88a75c57f0cbd9f1ebe1ca43a439fec1573bd9f14688
x-campaign-type: default
x-transaction-id: 6553e941-bb4d-43dd-a293-7a800f50a76e
x-swg-uid: 01-98e5a6b2-2bad-4cfe-8440-06e69fca042b
X-Mailer: Sweego
Message-ID:
 <1782753817.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@vates.tech>
x-swg-bid: 1782753817.8631fc262581453bbf619ec5b2062170.19f1468731b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 10/18] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
Date: Mon, 29 Jun 2026 19:21:28 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.815.6b0422f8a679c078.19f14687173.dcd48205f5cf2af=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753816947
X-purgate-ID: tlsNG-42698a/1782753834-3B33C220-CF4DB121/0/0
X-purgate-type: clean
X-purgate-size: 11576
X-Rspamd-Action: no action
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76DB96DDA8B

---=Part.815.6b0422f8a679c078.19f14687173.dcd48205f5cf2af=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a dedicated pci_sbdf_t struct that we update instead of recreating
one each time we need it=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/dmar=2Ec | 90 ++++++++++++------------------
 1 file changed, 36 insertions(+), 54 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 8db9591a36=2E=2E21649fa892 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -306,11 +306,11 @@ static int __init scope_device_count(const void *sta=
rt, const void *end)
=20
 static int __init acpi_parse_dev_scope(
     const void *start, const void *end, struct dmar_scope *scope,
-    int type, u16 seg)
+    int type, uint16_t seg)
 {
     struct acpi_ioapic_unit *acpi_ioapic_unit;
     const struct acpi_dmar_device_scope *acpi_scope;
-    u16 bus, sub_bus, sec_bus;
+    uint16_t sub_bus, sec_bus;
     const struct acpi_dmar_pci_path *path;
     struct acpi_drhd_unit *drhd =3D type =3D=3D DMAR_TYPE ?
         container_of(scope, struct acpi_drhd_unit, scope) : NULL;
@@ -322,7 +322,7 @@ static int __init acpi_parse_dev_scope(
=20
     if ( cnt > 0 )
     {
-        scope->devices =3D xzalloc_array(u16, cnt);
+        scope->devices =3D xzalloc_array(uint16_t, cnt);
         if ( !scope->devices )
             return -ENOMEM;
=20
@@ -332,29 +332,28 @@ static int __init acpi_parse_dev_scope(
=20
     while ( start < end )
     {
+        pci_sbdf_t dev_sbdf;
+
         acpi_scope =3D start;
         path =3D (const void *)(acpi_scope + 1);
         depth =3D (acpi_scope->length - sizeof(*acpi_scope)) / sizeof(*pa=
th);
-        bus =3D acpi_scope->bus;
+        dev_sbdf =3D PCI_SBDF(seg, acpi_scope->bus, path->dev, path->fn);
=20
         while ( --depth > 0 )
         {
-            bus =3D pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn=
),
-                                 PCI_SECONDARY_BUS);
+            dev_sbdf=2Ebus =3D pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS=
);
             path++;
+            dev_sbdf=2Edevfn =3D PCI_DEVFN(path->dev, path->fn);
         }
=20
         switch ( acpi_scope->entry_type )
         {
         case ACPI_DMAR_SCOPE_TYPE_BRIDGE:
-            sec_bus =3D pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path=
->fn),
-                                     PCI_SECONDARY_BUS);
-            sub_bus =3D pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path=
->fn),
-                                     PCI_SUBORDINATE_BUS);
+            sec_bus =3D pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS);
+            sub_bus =3D pci_conf_read8(dev_sbdf, PCI_SUBORDINATE_BUS);
             if ( iommu_verbose )
                 printk(VTDPREFIX " bridge: %pp start=3D%x sec=3D%x sub=3D=
%x\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn),
-                       acpi_scope->bus, sec_bus, sub_bus);
+                       &dev_sbdf, acpi_scope->bus, sec_bus, sub_bus);
=20
             dmar_scope_add_buses(scope, sec_bus, sub_bus);
             gfx_only =3D false;
@@ -362,8 +361,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_HPET:
             if ( iommu_verbose )
-                printk(VTDPREFIX " MSI HPET: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " MSI HPET: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -374,9 +372,7 @@ static int __init acpi_parse_dev_scope(
                 if ( !acpi_hpet_unit )
                     goto out;
                 acpi_hpet_unit->id =3D acpi_scope->enumeration_id;
-                acpi_hpet_unit->bus =3D bus;
-                acpi_hpet_unit->dev =3D path->dev;
-                acpi_hpet_unit->func =3D path->fn;
+                acpi_hpet_unit->bdf =3D dev_sbdf=2Ebdf;
                 list_add(&acpi_hpet_unit->list, &drhd->hpet_list);
=20
                 gfx_only =3D false;
@@ -386,17 +382,14 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
             if ( iommu_verbose )
-                printk(VTDPREFIX " endpoint: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
=20
-            if ( drhd && pci_device_detect(PCI_SBDF(seg, bus, path->dev,
-                                                    path->fn)) )
+            if ( drhd && pci_device_detect(dev_sbdf) )
             {
-                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->f=
n),
-                                    PCI_CLASS_DEVICE + 1) !=3D 0x03
-                                    /* PCI_BASE_CLASS_DISPLAY */ )
+                if ( pci_conf_read8(dev_sbdf, PCI_CLASS_DEVICE + 1) !=3D
+                     0x03 /* PCI_BASE_CLASS_DISPLAY */ )
                     gfx_only =3D false;
-                else if ( !seg && !bus && path->dev =3D=3D 2 && !path->fn=
 )
+                else if ( dev_sbdf=2Esbdf =3D=3D PCI_SBDF(0, 0, 2, 0)=2Es=
bdf )
                     igd_drhd_address =3D drhd->address;
             }
=20
@@ -404,8 +397,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
             if ( iommu_verbose )
-                printk(VTDPREFIX " IOAPIC: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " IOAPIC: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -414,9 +406,7 @@ static int __init acpi_parse_dev_scope(
                 if ( !acpi_ioapic_unit )
                     goto out;
                 acpi_ioapic_unit->apic_id =3D acpi_scope->enumeration_id;
-                acpi_ioapic_unit->ioapic=2Ebdf=2Ebus =3D bus;
-                acpi_ioapic_unit->ioapic=2Ebdf=2Edev =3D path->dev;
-                acpi_ioapic_unit->ioapic=2Ebdf=2Efunc =3D path->fn;
+                acpi_ioapic_unit->ioapic=2Einfo =3D dev_sbdf=2Ebdf;
                 list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
=20
                 gfx_only =3D false;
@@ -432,7 +422,7 @@ static int __init acpi_parse_dev_scope(
             gfx_only =3D false;
             continue;
         }
-        scope->devices[didx++] =3D PCI_BDF(bus, path->dev, path->fn);
+        scope->devices[didx++] =3D dev_sbdf=2Ebdf;
         start +=3D acpi_scope->length;
     }
=20
@@ -516,7 +506,6 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
         acpi_register_drhd_unit(dmaru);
     else
     {
-        u8 b, d, f;
         unsigned int i =3D 0;
         union {
             const void *raw;
@@ -530,18 +519,16 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
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
-            if ( !pci_device_detect(PCI_SBDF(drhd->segment, b, d, f)) )
+            if ( !pci_device_detect(sbdf) )
                 printk(XENLOG_WARNING VTDPREFIX
                        " Non-existent device (%pp) in this DRHD's scope!\=
n",
-                       &PCI_SBDF(drhd->segment, b, d, f));
+                       &sbdf);
         }
=20
         acpi_register_drhd_unit(dmaru);
@@ -570,17 +557,14 @@ static int __init register_one_rmrr(struct acpi_rmrr=
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
-        if ( pci_device_detect(PCI_SBDF(rmrru->segment, b, d, f)) =3D=3D =
0 )
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
@@ -764,15 +748,13 @@ static int __init register_one_satc(struct acpi_satc=
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
-        if ( !pci_device_detect(PCI_SBDF(satcu->segment, b, d, f)) )
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
@@ -1195,8 +1177,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
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
@@ -1233,7 +1216,7 @@ static int __init cf_check parse_rmrr_param(const ch=
ar *str)
         do {
             bool def_seg =3D false;
=20
-            stmp =3D parse_pci_seg(s + 1, &seg, &bus, &dev, &func, &def_s=
eg);
+            stmp =3D parse_pci_seg(s + 1, &sbdf, &def_seg);
             if ( !stmp )
                 return -EINVAL;
=20
@@ -1242,12 +1225,11 @@ static int __init cf_check parse_rmrr_param(const =
char *str)
              * Segment will be replaced with one from first device=2E
              */
             if ( user_rmrrs[nr_rmrr]=2Edev_count && def_seg )
-                seg =3D PCI_SEG(user_rmrrs[nr_rmrr]=2Esbdf[0]);
+                sbdf=2Eseg =3D PCI_SEG(user_rmrrs[nr_rmrr]=2Esbdf[0]);
=20
             /* Keep sbdf's even if they differ and later report an error=
=2E */
             dev_count =3D user_rmrrs[nr_rmrr]=2Edev_count;
-            user_rmrrs[nr_rmrr]=2Esbdf[dev_count] =3D
-               PCI_SBDF(seg, bus, dev, func)=2Esbdf;
+            user_rmrrs[nr_rmrr]=2Esbdf[dev_count] =3D sbdf=2Esbdf;
=20
             user_rmrrs[nr_rmrr]=2Edev_count++;
             s =3D stmp;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.815.6b0422f8a679c078.19f14687173.dcd48205f5cf2af=---

