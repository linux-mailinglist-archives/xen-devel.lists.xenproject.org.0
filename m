Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMLrLdPjR2qChAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 18:31:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AA704404
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 18:31:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=KBFtbqOX;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353525.1609372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfgmL-000624-Au; Fri, 03 Jul 2026 16:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353525.1609372; Fri, 03 Jul 2026 16:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfgmL-000608-7r; Fri, 03 Jul 2026 16:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1353525;
 Fri, 03 Jul 2026 16:30:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@swg.vates.tech>)
 id 1wfgmJ-000602-M3
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 16:30:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfgmI-00Ahc5-LF
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 18:30:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@swg.vates.tech>)
 id 6a47e388-2eae-0a2a0a5409dd-0a2a4501817a-22
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 18:30:10 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@swg.vates.tech>)
 id 6a47e392-400f-0a2a45010019-b9ff1c22976d-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 18:30:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f28d0d9fc00080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jul 2026 16:30:03 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id D6F3680A50;
 Fri,  3 Jul 2026 18:30:02 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=RQjEcU4YXGqI5p2avl7VVKfWwfVX8xlmY4b9mgjYYxQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KBFtbqOX3yP+ftlSrP90Ur7znTycsqg4wcYWQDUyx3D1j8iUaI2So3d5hq6Wpd2UBiRBwtYuS
 8sKvVDpKQRNQkd4PuNlBVX77aN+F2MdKJn5+Upmau3Z2AQ4EKWW+yhndyzTsWWwVn7bhelLAOay
 0TmV6sOT/HUET3rBK/FbXD3XN7r68PVK0FphoAepag/yrOt8hpxDIY2wddnnioXBEyfNluY2B4R
 d6o114Zh6bGm62yctZZ+gK1B3jt28um2+j7qdznUQDcpHD4EDVxNM95iI0Yd6C4x3JG+PAeZym7
 GiR1/nQ5C0KwAZ/5o+pXWRQE+T+nyS9fzY0npVkG+6Mw==
X-Zone-Loop: df28dea631562b212faec0e426749e529d3a5150216c
x-campaign-type: default
x-transaction-id: 7633c826-ec20-4c9e-a44b-1d67d7966408
x-swg-uid: 01-5c2e9b72-ea6d-43d9-8898-0e6cde5ab358
X-Mailer: Sweego
Message-ID:
 <1783096203.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@vates.tech>
x-swg-bid: 1783096203.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3.1 02/18] pci: Use pci_sbdf_t in pci_add_device()
Date: Fri,  3 Jul 2026 18:29:06 +0200
In-Reply-To: <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
References: <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ef.f30dce182e3a6b24.19f28d0d76b.198041397edd7b15=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783096203116
X-purgate-ID: tlsNG-d62444/1783096210-80CD61E0-BAD80866/0/0
X-purgate-type: clean
X-purgate-size: 8407
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB0AA704404

---=Part.ef.f30dce182e3a6b24.19f28d0d76b.198041397edd7b15=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v3: Don't adjust adjacent code=2E
v3=2E1: Remove slot variable and move func down to its user=2E
---
 xen/arch/x86/physdev=2Ec        |  6 +++---
 xen/drivers/passthrough/pci=2Ec | 37 +++++++++++++++++------------------
 xen/drivers/pci/physdev=2Ec     |  3 ++-
 xen/include/xen/pci=2Eh         |  4 ++--
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/physdev=2Ec b/xen/arch/x86/physdev=2Ec
index 5bbcf3b530=2E=2E60c02076d6 100644
--- a/xen/arch/x86/physdev=2Ec
+++ b/xen/arch/x86/physdev=2Ec
@@ -472,7 +472,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
         if ( copy_from_guest(&manage_pci, arg, 1) !=3D 0 )
             break;
=20
-        ret =3D pci_add_device(0, manage_pci=2Ebus, manage_pci=2Edevfn,
+        ret =3D pci_add_device(PCI_SBDF(0, manage_pci=2Ebus, manage_pci=
=2Edevfn),
                              NULL, NUMA_NO_NODE);
         break;
     }
@@ -503,8 +503,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
         pdev_info=2Eis_virtfn =3D manage_pci_ext=2Eis_virtfn;
         pdev_info=2Ephysfn=2Ebus =3D manage_pci_ext=2Ephysfn=2Ebus;
         pdev_info=2Ephysfn=2Edevfn =3D manage_pci_ext=2Ephysfn=2Edevfn;
-        ret =3D pci_add_device(0, manage_pci_ext=2Ebus,
-                             manage_pci_ext=2Edevfn,
+        ret =3D pci_add_device(PCI_SBDF(0, manage_pci_ext=2Ebus,
+                                      manage_pci_ext=2Edevfn),
                              &pdev_info, NUMA_NO_NODE);
         break;
     }
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 0adf573150=2E=2Ed7e60e6fbb 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -662,12 +662,10 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsig=
ned int pos,
     return is64bits ? 2 : 1;
 }
=20
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
-                   const struct pci_dev_info *info, nodeid_t node)
+int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, node=
id_t node)
 {
     struct pci_seg *pseg;
     struct pci_dev *pdev;
-    unsigned int slot =3D PCI_SLOT(devfn), func =3D PCI_FUNC(devfn);
     const char *type;
     int ret;
=20
@@ -680,17 +678,17 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         type =3D "device";
=20
-    ret =3D xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | de=
vfn);
+    ret =3D xsm_resource_plug_pci(XSM_PRIV, sbdf=2Esbdf);
     if ( ret )
         return ret;
=20
     ret =3D -ENOMEM;
=20
     pcidevs_lock();
-    pseg =3D alloc_pseg(seg);
+    pseg =3D alloc_pseg(sbdf=2Eseg);
     if ( !pseg )
         goto out;
-    pdev =3D alloc_pdev(pseg, bus, devfn);
+    pdev =3D alloc_pdev(pseg, sbdf=2Ebus, sbdf=2Edevfn);
     if ( !pdev )
         goto out;
=20
@@ -701,16 +699,15 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         pdev->info =3D *info;
         if ( pdev->info=2Eis_virtfn )
         {
-            struct pci_dev *pf_pdev =3D
-                pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn=2Ebus,
-                                            info->physfn=2Edevfn));
+            pci_sbdf_t pf_sbdf =3D PCI_SBDF(sbdf=2Eseg, info->physfn=2Ebu=
s,
+                                          info->physfn=2Edevfn);
+            struct pci_dev *pf_pdev =3D pci_get_pdev(NULL, pf_sbdf);
=20
             if ( !pf_pdev )
             {
                 printk(XENLOG_WARNING
                        "Attempted to add SR-IOV VF %pp without PF %pp\n",
-                       &pdev->sbdf,
-                       &PCI_SBDF(seg, info->physfn=2Ebus, info->physfn=2E=
devfn));
+                       &sbdf, &pf_sbdf);
                 free_pdev(pseg, pdev);
                 ret =3D -ENODEV;
                 goto out;
@@ -729,14 +726,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             if ( !pdev->ext_cfg )
                 printk(XENLOG_WARNING
                        "%pp: VF without extended config space?\n",
-                       &pdev->sbdf);
+                       &sbdf);
         }
     }
=20
     if ( !pdev->info=2Eis_virtfn && !pdev->physfn=2Evf_rlen[0] )
     {
         unsigned int pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID=
_SRIOV);
-        uint16_t ctrl =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTR=
L);
+        uint16_t ctrl =3D pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
=20
         if ( !pos )
             /* Nothing */;
@@ -750,18 +747,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; )
             {
                 unsigned int idx =3D pos + PCI_SRIOV_BAR + i * 4;
-                uint32_t bar =3D pci_conf_read32(pdev->sbdf, idx);
+                uint32_t bar =3D pci_conf_read32(sbdf, idx);
=20
                 if ( (bar & PCI_BASE_ADDRESS_SPACE) =3D=3D
                      PCI_BASE_ADDRESS_SPACE_IO )
                 {
                     printk(XENLOG_WARNING
                            "SR-IOV device %pp with vf BAR%u in IO space\n=
",
-                           &pdev->sbdf, i);
+                           &sbdf, i);
                     ++i;
                     continue;
                 }
-                ret =3D pci_size_mem_bar(pdev->sbdf, idx, NULL,
+                ret =3D pci_size_mem_bar(sbdf, idx, NULL,
                                        &pdev->physfn=2Evf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i =3D=3D PCI_SRIOV_NUM_BARS - 1)=
 ?
@@ -772,7 +769,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         }
         else
             printk(XENLOG_WARNING "SR-IOV device %pp has its virtual"
-                   " functions already enabled (%04x)\n", &pdev->sbdf, ct=
rl);
+                   " functions already enabled (%04x)\n", &sbdf, ctrl);
     }
=20
     check_pdev(pdev);
@@ -818,14 +815,16 @@ out:
     pcidevs_unlock();
     if ( !ret )
     {
-        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &pdev->sbdf);
+        unsigned int func =3D sbdf=2Efn;
+
+        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &sbdf);
         while ( pdev->phantom_stride )
         {
             func +=3D pdev->phantom_stride;
             if ( PCI_SLOT(func) )
                 break;
             printk(XENLOG_DEBUG "PCI phantom %pp\n",
-                   &PCI_SBDF(seg, bus, slot, func));
+                   &PCI_SBDF(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edev, func));
         }
     }
     return ret;
diff --git a/xen/drivers/pci/physdev=2Ec b/xen/drivers/pci/physdev=2Ec
index d46501b884=2E=2E46735a5fc9 100644
--- a/xen/drivers/pci/physdev=2Ec
+++ b/xen/drivers/pci/physdev=2Ec
@@ -50,7 +50,8 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         }
 #endif
=20
-        ret =3D pci_add_device(add=2Eseg, add=2Ebus, add=2Edevfn, &pdev_i=
nfo, node);
+        ret =3D pci_add_device(PCI_SBDF(add=2Eseg, add=2Ebus, add=2Edevfn=
),
+                             &pdev_info, node);
         break;
     }
=20
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index ade882caee=2E=2E26c0c6e449 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -229,8 +229,8 @@ void setup_hwdom_pci_devices(struct domain *d,
 int pci_release_devices(struct domain *d);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
-                   const struct pci_dev_info *info, nodeid_t node);
+int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info,
+                   nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.ef.f30dce182e3a6b24.19f28d0d76b.198041397edd7b15=---

