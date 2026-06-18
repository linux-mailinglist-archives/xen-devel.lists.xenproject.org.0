Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6/QnCxgHNGr1LQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8896A10D1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=VAR0Piqw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341271.1601776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAC-0000bD-JI; Thu, 18 Jun 2026 14:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341271.1601776; Thu, 18 Jun 2026 14:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAC-0000XM-Fp; Thu, 18 Jun 2026 14:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1341271;
 Thu, 18 Jun 2026 14:56:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@swg.vates.tech>)
 id 1waEAA-0000GF-Nk
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAA-008siE-48
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:14 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b4612000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:55 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 997BC869DF;
 Thu, 18 Jun 2026 16:55:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/sSo4Au5r9dkyrEMiFMLwpy0rleRYBMSvX7t8CF24Hw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VAR0Piqw9dSK4aa0jnnrLY2qI4U+PQkpocDgJFIgGPDwbHwVTbDx3+TEl3Qrgwe69zS+IJWIR
 DxD29JqynRhaJJw0Hq8IkHIPKKKogJyujzHAEvOLATbVHrrXDn/D/ersq/RAb7+dboctDPx35Jc
 /mEglwbDGxRIF3xvPVZTw6d5zrBDixb8nB07kBfko9k1gJIzO5Ie7S3alqRtdyK/lTbJxwUvnTm
 ohFchDsGFyTKZlbfJZpraBF4GXaQM8MuMZRHDvtN/XhHyK0oI/0GUm3ElxYEiluHCN2Ff0klpiu
 5zsP9hGYJP7nJtYpRYHeVKI2AexI1kBTt9EPzzx622Pw==
X-Zone-Loop: 370c4ea3741a5ed1ecfe201998b3d649c2e5eb82ac77
x-campaign-type: default
x-transaction-id: c97b9eea-4044-44e4-a845-5836067068d1
x-swg-uid: 01-ea0d8191-2168-4bb9-82c6-d8cf0df9b28a
X-Mailer: Sweego
Message-ID:
 <1781794555.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@vates.tech>
x-swg-bid: 1781794555.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 07/15] pci: Use pci_sbdf_t in pci_ro_device()
Date: Thu, 18 Jun 2026 16:50:31 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.68e.22d2c2611095fb49.19edb3b43ed.b5cd8cf27b43e361=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794554861
X-purgate-ID: tlsNG-720697/1781794574-47E773F3-8DDD6D80/0/0
X-purgate-type: clean
X-purgate-size: 5908
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8896A10D1

---=Part.68e.22d2c2611095fb49.19edb3b43ed.b5cd8cf27b43e361=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

That has the indirect effect of properly considering segments
other than 0 in xhci-dbc=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ns16550=2Ec                 | 3 +--
 xen/drivers/char/xhci-dbc=2Ec                | 4 ++--
 xen/drivers/passthrough/amd/iommu_detect=2Ec | 7 +------
 xen/drivers/passthrough/pci=2Ec              | 8 ++++----
 xen/include/xen/pci=2Eh                      | 2 +-
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/ns16550=2Ec b/xen/drivers/char/ns16550=2Ec
index fa2d0e5991=2E=2E8396e5fb84 100644
--- a/xen/drivers/char/ns16550=2Ec
+++ b/xen/drivers/char/ns16550=2Ec
@@ -450,8 +450,7 @@ static void __init cf_check ns16550_init_postirq(struc=
t serial_port *port)
                                 PFN_UP(uart->io_base + uart->io_size) - 1=
) )
             printk(XENLOG_INFO "Error while adding MMIO range of device t=
o mmio_ro_ranges\n");
=20
-        if ( pci_ro_device(uart->pci_device=2Eseg, uart->pci_device=2Ebus=
,
-                           uart->pci_device=2Edevfn) )
+        if ( pci_ro_device(uart->pci_device) )
             printk(XENLOG_INFO
                    "Could not mark config space of %pp read-only=2E\n",
                    &uart->pci_device);
diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index c7fd554be0=2E=2E3a8b086a93 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1196,7 +1196,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
     switch ( uart->dbc=2Eshare )
     {
     case XHCI_SHARE_NONE:
-        if ( pci_ro_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=2E=
devfn) )
+        if ( pci_ro_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to mark read-only %pp used for XHCI console\n"=
,
                    &uart->dbc=2Esbdf);
@@ -1221,7 +1221,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
                "Error while marking MMIO range of XHCI console as R/O, "
                "making the whole device R/O (share=3Dno)\n");
         uart->dbc=2Eshare =3D XHCI_SHARE_NONE;
-        if ( pci_ro_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=2E=
devfn) )
+        if ( pci_ro_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to mark read-only %pp used for XHCI console\n"=
,
                    &uart->dbc=2Esbdf);
diff --git a/xen/drivers/passthrough/amd/iommu_detect=2Ec b/xen/drivers/pa=
ssthrough/amd/iommu_detect=2Ec
index 94ee297424=2E=2Edf75d6fbc0 100644
--- a/xen/drivers/passthrough/amd/iommu_detect=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_detect=2Ec
@@ -136,7 +136,6 @@ int __init amd_iommu_detect_one_acpi(
     const struct acpi_ivrs_hardware *ivhd_block)
 {
     struct amd_iommu *iommu;
-    u8 bus, dev, func;
     int rt =3D 0;
=20
     if ( ivhd_block->header=2Elength < sizeof(*ivhd_block) )
@@ -210,10 +209,6 @@ int __init amd_iommu_detect_one_acpi(
     /* override IOMMU HT flags */
     iommu->ht_flags =3D ivhd_block->header=2Eflags;
=20
-    bus =3D PCI_BUS(iommu->sbdf=2Ebdf);
-    dev =3D PCI_SLOT(iommu->sbdf=2Ebdf);
-    func =3D PCI_FUNC(iommu->sbdf=2Ebdf);
-
     rt =3D get_iommu_capabilities(iommu->sbdf, iommu->cap_offset, iommu);
     if ( rt )
         goto out;
@@ -227,7 +222,7 @@ int __init amd_iommu_detect_one_acpi(
     if ( !iommu->domid_map )
         goto out;
=20
-    rt =3D pci_ro_device(iommu->sbdf=2Eseg, bus, PCI_DEVFN(dev, func));
+    rt =3D pci_ro_device(iommu->sbdf);
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (=
%d)\n",
                &iommu->sbdf, rt);
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index f222da8879=2E=2E94a86d3639 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -499,14 +499,14 @@ int __init pci_hide_device(unsigned int seg, unsigne=
d int bus,
     return rc;
 }
=20
-int __init pci_ro_device(int seg, int bus, int devfn)
+int __init pci_ro_device(pci_sbdf_t sbdf)
 {
-    struct pci_seg *pseg =3D alloc_pseg(seg);
+    struct pci_seg *pseg =3D alloc_pseg(sbdf=2Eseg);
     struct pci_dev *pdev;
=20
     if ( !pseg )
         return -ENOMEM;
-    pdev =3D alloc_pdev(pseg, bus, devfn);
+    pdev =3D alloc_pdev(pseg, sbdf=2Ebus, sbdf=2Edevfn);
     if ( !pdev )
         return -ENOMEM;
=20
@@ -520,7 +520,7 @@ int __init pci_ro_device(int seg, int bus, int devfn)
         memset(pseg->ro_map, 0, sz);
     }
=20
-    __set_bit(PCI_BDF(bus, devfn), pseg->ro_map);
+    __set_bit(sbdf=2Ebdf, pseg->ro_map);
     _pci_hide_device(pdev);
=20
     return 0;
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index d816dcad05=2E=2Ebc59010cbe 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -232,7 +232,7 @@ const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
-int pci_ro_device(int seg, int bus, int devfn);
+int pci_ro_device(pci_sbdf_t sbdf);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.68e.22d2c2611095fb49.19edb3b43ed.b5cd8cf27b43e361=---

