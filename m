Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNMxKNQuC2plEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798656FD7D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312034.1582231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznv-0003Ez-DX; Mon, 18 May 2026 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312034.1582231; Mon, 18 May 2026 15:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznv-0003D3-AL; Mon, 18 May 2026 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1312034;
 Mon, 18 May 2026 15:22:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@swg.vates.tech>)
 id 1wOznu-0003BM-3p
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznt-00AUfW-G9
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@swg.vates.tech>)
 id 6a0b2ec3-2eae-0a2a0a5409dd-0a2a4509caf4-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-6
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3baea7d1000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:42 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id EF3F98109B;
 Mon, 18 May 2026 17:22:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O6ocY0J81NVJcReSQBFthd8sYgfa3BLGnk02uzct2iw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZrZPJ3s/fleYX/xAysYJ6HoF8iTG+nxLxXGyBOyWze9EpmaheIRgzg7xUVJcAT7XpNRe7/Pvj
 nPqkPggKwizR6iCYMTUDzHaoWj9G8a4fGQx0U6Hzib+wWfiW6YhjRipYIzHaDUW6RpFl+SlE8EK
 cFqJciEuoyRIyo7AjMyOj3+7TjjvueZ7Og9t6kAawQjo+zZv9OeGQKHd4JNBP8FazAyKZiUQM+l
 0xTTl2bD6DVC3gFsdZLYqnkg7OMcPUD107ITIFkpgJirbPbP3lZ2ywfjZbx/vdD1vc5vymA4Lhj
 OPUEtYTXexGhN67R2ybkLpRKeU7tXgKj55l0X8p0gC2Q==
X-Zone-Loop: 2c2c7f5aebc096ebbb0e05f1a44c4488354743e3b1d5
x-campaign-type: default
x-transaction-id: 8e04ef81-ca38-477e-a597-392152684044
x-swg-uid: 01-acdefb6b-ad92-4dfd-a095-c0c107a09548
X-Mailer: Sweego
Message-ID:
 <1779117762.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@vates.tech>
x-swg-bid: 1779117762.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373
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
Subject: [PATCH 3/5] pci: Use pci_sbdf_t in pci_device_detect()
Date: Mon, 18 May 2026 17:21:27 +0200
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e12.78b7f5f2db119c52.19e3baea65b.9c8c7b9182c5f9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117762139
X-purgate-ID: tlsNG-bad1c0/1779117769-4015DA53-E145900E/0/0
X-purgate-type: clean
X-purgate-size: 10736
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4798656FD7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.e12.78b7f5f2db119c52.19e3baea65b.9c8c7b9182c5f9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use a single pci_sbdf_t instead of each of its part as individual parameter=
s=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ehci-dbgp=2Ec       | 35 ++++++++++++++----------------
 xen/drivers/passthrough/pci=2Ec      | 16 +++++++-------
 xen/drivers/passthrough/vtd/dmar=2Ec | 33 +++++++++++-----------------
 xen/include/xen/pci=2Eh              |  2 +-
 4 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index a5c79f56fc=2E=2E39a047eb3f 100644
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
-
-        e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        pci_sbdf_t sbdf =3D PCI_SBDF(0, 0, 0, 0);
+       =20
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
index 464bb0fee4=2E=2E7b2898bd5a 100644
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
index c36f4bbd7b=2E=2E9f9b639eba 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -382,7 +382,7 @@ static int __init acpi_parse_dev_scope(
             if ( iommu_verbose )
                 printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
=20
-            if ( drhd && pci_device_detect(seg, dev_sbdf=2Ebus, dev_sbdf=
=2Edev, dev_sbdf=2Efn) )
+            if ( drhd && pci_device_detect(dev_sbdf) )
             {
                 if ( pci_conf_read8(dev_sbdf,
                                     PCI_CLASS_DEVICE + 1) !=3D 0x03
@@ -505,7 +505,6 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
         acpi_register_drhd_unit(dmaru);
     else
     {
-        u8 b, d, f;
         unsigned int i =3D 0;
         union {
             const void *raw;
@@ -519,18 +518,16 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
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
@@ -559,17 +556,14 @@ static int __init register_one_rmrr(struct acpi_rmrr=
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
@@ -753,15 +747,13 @@ static int __init register_one_satc(struct acpi_satc=
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
@@ -1184,8 +1176,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
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
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e12.78b7f5f2db119c52.19e3baea65b.9c8c7b9182c5f9=---

