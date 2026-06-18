Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qCIwNQ4HNGrsLQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669C6A10C1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=nr9GOOZv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341262.1601732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEA0-0007dA-22; Thu, 18 Jun 2026 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341262.1601732; Thu, 18 Jun 2026 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9z-0007aI-Ua; Thu, 18 Jun 2026 14:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1341262;
 Thu, 18 Jun 2026 14:56:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@swg.vates.tech>)
 id 1waE9y-0007MU-OO
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waE9y-002MfF-56
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@swg.vates.tech>)
 id 6a3406fe-2eae-0a2a0a5409dd-0a2a4502e5c8-10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:02 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b36a1000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:51 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E226686962;
 Thu, 18 Jun 2026 16:55:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Fly1gc7Vqv+BO0EYHJiZ8E3p8YnSNPkkXYEzHm0nrEA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nr9GOOZvgA3vzeU5qIkvQnTydxFJNsSDxHP0+IFYuf8+UvBCRA4eeV3fHHUVe89Xf7f6ZBTd+
 UPdcFL3e4AjXTP/C1dHVGqlErY8c3c6auhSV0slxGrFEbQ3mNILbIyggzYLG1odOgQJEOkqcQmr
 o7QNIUy+Iv2OYvCXmiUdKFfjitK0SHCMaFmtrA3ruVyuM+1QMVhO1Zo99RYXXwuUBc/qz4O9T2i
 8ZNKzK+qY3qUL83Hbxk4TCK9S68ZbAd0XEsADTOJpyQEUpUVnXL9Q9xevCAzQ6qlw2cpOEtFLMu
 e4Gl9Sl3/NVHFPzoEAVvOGmi2EVdiv+C4IeJ0Civmb4g==
X-Zone-Loop: 1c59d048eff1e2211a17efb08f5e69e462764e491163
x-campaign-type: default
x-transaction-id: 812e8221-129e-4c82-ab95-a72b3430ad4a
x-swg-uid: 01-aa097cc6-9803-4001-ad2b-2e2919e7b80c
X-Mailer: Sweego
Message-ID:
 <1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b@vates.tech>
x-swg-bid: 1781794551.8631fc262581453bbf619ec5b2062170.19edb3b36a1000701b
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
Subject: [PATCH v2 02/15] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
Date: Thu, 18 Jun 2026 16:50:26 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.689.de44f08d477252d.19edb3b350e.28553791433b515b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794551054
X-purgate-ID: tlsNG-720697/1781794561-4E4623F3-A8DD486C/0/0
X-purgate-type: clean
X-purgate-size: 6353
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 8669C6A10C1

---=Part.689.de44f08d477252d.19edb3b350e.28553791433b515b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a dedicated pci_sbdf_t struct that we update instead of recreating
one each time we need it=2E

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/dmar=2Ec | 43 ++++++++++++------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 2a756831a6=2E=2E71e5a51a58 100644
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
@@ -332,29 +332,27 @@ static int __init acpi_parse_dev_scope(
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
@@ -362,8 +360,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_HPET:
             if ( iommu_verbose )
-                printk(VTDPREFIX " MSI HPET: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " MSI HPET: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -374,9 +371,7 @@ static int __init acpi_parse_dev_scope(
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
@@ -386,16 +381,15 @@ static int __init acpi_parse_dev_scope(
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
@@ -403,8 +397,7 @@ static int __init acpi_parse_dev_scope(
=20
         case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
             if ( iommu_verbose )
-                printk(VTDPREFIX " IOAPIC: %pp\n",
-                       &PCI_SBDF(seg, bus, path->dev, path->fn));
+                printk(VTDPREFIX " IOAPIC: %pp\n", &dev_sbdf);
=20
             if ( drhd )
             {
@@ -413,9 +406,7 @@ static int __init acpi_parse_dev_scope(
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
@@ -431,7 +422,7 @@ static int __init acpi_parse_dev_scope(
             gfx_only =3D false;
             continue;
         }
-        scope->devices[didx++] =3D PCI_BDF(bus, path->dev, path->fn);
+        scope->devices[didx++] =3D dev_sbdf=2Ebdf;
         start +=3D acpi_scope->length;
     }
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.689.de44f08d477252d.19edb3b350e.28553791433b515b=---

