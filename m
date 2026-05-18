Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIWBGtAuC2plEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111C56FD6E
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312033.1582221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznt-0002yb-1U; Mon, 18 May 2026 15:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312033.1582221; Mon, 18 May 2026 15:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzns-0002x2-TW; Mon, 18 May 2026 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1312033;
 Mon, 18 May 2026 15:22:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@swg.vates.tech>)
 id 1wOznq-0002k2-VT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznq-00AUfW-BZ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@swg.vates.tech>)
 id 6a0b2ec3-2eae-0a2a0a5409dd-0a2a4509caf4-10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-5
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3baea399000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:41 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id EA8E58109B;
 Mon, 18 May 2026 17:22:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DMsS6OuWI2swmoCfXAUejCXwpwezHtuCMEyc4nCO7IY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=F5vXHc9KMtWQnCfn3MmykSbPQQKZKXatP6jKygnpcbW8+R50HhMvU+qDGpILcU9m+PhSMzNkm
 HQnK4naQzhDPf5U353YSPLdaj+rQFKHBHyQT3ACUYXTSfraDj5ZNv2VS+FH+Qy0wp65TPmM9njJ
 9NTYD/inXqKe9DCIe5udF5ALxlMcI7s1sdo9EdslNVGGpOjyCthROciJnujK1G4k3Yt30B6yexl
 F6C36ce07g+quo1GzFLzRhfj/B6L3wyNphPZSY1cilV7rYUGzsxyvGbSx8Wtaegbvy5tVPCINJn
 0tNMvkoGIrwkDJCgbkEILcBjU4B+uaL90XE1b2p3hjwQ==
X-Zone-Loop: ff5ee602e1ae896fa8d348c55ce55d8e79f12edab487
x-campaign-type: default
x-transaction-id: 0bc51ccf-2099-41c9-a0df-6316906fcf66
x-swg-uid: 01-ea55e85e-ab1e-4dc9-8b5b-38b35974fd4b
X-Mailer: Sweego
Message-ID:
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
x-swg-bid: 1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373
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
Subject: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
Date: Mon, 18 May 2026 17:21:26 +0200
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e11.3c2322387242062c.19e3baea229.9e26cb71c0c8c4a4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117761065
X-purgate-ID: tlsNG-bad1c0/1779117766-40762A53-2671C2FB/0/0
X-purgate-type: clean
X-purgate-size: 6252
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2111C56FD6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.e11.3c2322387242062c.19e3baea229.9e26cb71c0c8c4a4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a dedicated pci_sbdf_t struct that we update instead of recreating
one each time we need it=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/dmar=2Ec | 42 ++++++++++++------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 2a756831a6=2E=2Ec36f4bbd7b 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -310,7 +310,7 @@ static int __init acpi_parse_dev_scope(
 {
     struct acpi_ioapic_unit *acpi_ioapic_unit;
     const struct acpi_dmar_device_scope *acpi_scope;
-    u16 bus, sub_bus, sec_bus;
+    u16 sub_bus, sec_bus;
     const struct acpi_dmar_pci_path *path;
     struct acpi_drhd_unit *drhd =3D type =3D=3D DMAR_TYPE ?
         container_of(scope, struct acpi_drhd_unit, scope) : NULL;
@@ -332,29 +332,26 @@ static int __init acpi_parse_dev_scope(
=20
     while ( start < end )
     {
+        pci_sbdf_t dev_sbdf;
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
@@ -362,8 +359,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_HPET:
             if ( iommu_verbose )
-                printk(VTDPREFIX " MSI HPET: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " MSI HPET: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -374,9 +370,7 @@ static int __init acpi_parse_dev_scope(
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
@@ -386,16 +380,15 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
             if ( iommu_verbose )
-                printk(VTDPREFIX " endpoint: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
=20
-            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn)=
 )
+            if ( drhd && pci_device_detect(seg, dev_sbdf=2Ebus, dev_sbdf=
=2Edev, dev_sbdf=2Efn) )
             {
-                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->f=
n),
+                if ( pci_conf_read8(dev_sbdf,
                                     PCI_CLASS_DEVICE + 1) !=3D 0x03
                                     /* PCI_BASE_CLASS_DISPLAY */ )
                     gfx_only =3D false;
-                else if ( !seg && !bus && path->dev =3D=3D 2 && !path->fn=
 )
+                else if ( !seg && !dev_sbdf=2Ebus && path->dev =3D=3D 2 &=
& !path->fn )
                     igd_drhd_address =3D drhd->address;
             }
=20
@@ -403,8 +396,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
             if ( iommu_verbose )
-                printk(VTDPREFIX " IOAPIC: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " IOAPIC: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -413,9 +405,7 @@ static int __init acpi_parse_dev_scope(
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
@@ -431,7 +421,7 @@ static int __init acpi_parse_dev_scope(
             gfx_only =3D false;
             continue;
         }
-        scope->devices[didx++] =3D PCI_BDF(bus, path->dev, path->fn);
+        scope->devices[didx++] =3D dev_sbdf=2Ebdf;
         start +=3D acpi_scope->length;
     }
=20
--=20
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e11.3c2322387242062c.19e3baea229.9e26cb71c0c8c4a4=---

