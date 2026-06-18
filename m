Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J5IeKiAHNGoALgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595856A10EE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Mrs0kavr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341279.1601818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAJ-0001rT-7D; Thu, 18 Jun 2026 14:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341279.1601818; Thu, 18 Jun 2026 14:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAI-0001kT-Sk; Thu, 18 Jun 2026 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1341279;
 Thu, 18 Jun 2026 14:56:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@swg.vates.tech>)
 id 1waEAH-0001WV-H4
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAG-008siE-TS
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-30
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:20 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-15
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b555d000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:59 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AB9B4869DB;
 Thu, 18 Jun 2026 16:55:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=uytFSNcEEVv/QYzksGHmSaUjvGJggN3QbN0/FKnR93Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Mrs0kavr0SjpVSM3swCWe2IzSn9uD7yu5o2zjL3vtYbybzTy74bAc7yD463JbvvkOdIdFhA0/
 DxdpbWqoJlxyQOZO145wkjJ3Gp0FJsOjWofoW9H3Jfb1W2qWoLjOARnK8PSLO4ONWJFSwlkKZiI
 Z6EDTx2dGA0oDQIfBpFsF3HxdhjDmbPfnQmgMbQEtJYnbFNOuOr+RDypP400phIQiTx8P28Fj8I
 ViyMY/RSQlVKG6G1x0xipoVqhZc1AQOHwtv4Kq4VBhIn+gGsiwugxxG8wIoLtVbyvTpHauvHEbe
 71IhkEHZWQpvbQY4M7OfR3b42TWFSzU/ay7Yf7N+bKAw==
X-Zone-Loop: 3ed76e2d851a1ce5cccca0528079876d22185c03eacb
x-campaign-type: default
x-transaction-id: 2d2e438e-e5a1-45c7-b2c4-3a547e6a9f0f
x-swg-uid: 01-7fdb5cdf-e4d1-430b-8f25-2f3a951e3c42
X-Mailer: Sweego
Message-ID:
 <1781794559.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@vates.tech>
x-swg-bid: 1781794559.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b
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
	Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 12/15] pci: Use pci_sbdf_t pci_check_disable_device()
Date: Thu, 18 Jun 2026 16:50:36 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.693.7d953f90ff09944a.19edb3b53c8.eaea940e34972e1f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794558920
X-purgate-ID: tlsNG-720697/1781794580-444123F3-98891D09/0/0
X-purgate-type: clean
X-purgate-size: 3538
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 595856A10EE

---=Part.693.7d953f90ff09944a.19edb3b53c8.eaea940e34972e1f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/amd/iommu_init=2Ec | 3 +--
 xen/drivers/passthrough/pci=2Ec            | 4 ++--
 xen/drivers/passthrough/vtd/iommu=2Ec      | 3 +--
 xen/include/xen/pci=2Eh                    | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init=2Ec b/xen/drivers/pass=
through/amd/iommu_init=2Ec
index e0c8925c33=2E=2Ec2d7201747 100644
--- a/xen/drivers/passthrough/amd/iommu_init=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_init=2Ec
@@ -575,8 +575,7 @@ static void cf_check parse_event_log_entry(struct amd_=
iommu *iommu, u32 entry[])
=20
         for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
             if ( get_dma_requestor_id(iommu->sbdf=2Eseg, bdf) =3D=3D devi=
ce_id )
-                pci_check_disable_device(iommu->sbdf=2Eseg, PCI_BUS(bdf),
-                                         PCI_DEVFN(bdf));
+                pci_check_disable_device(PCI_SBDF(iommu->sbdf=2Eseg, bdf)=
);
     }
     else
         printk(XENLOG_ERR "%s %08x %08x %08x %08x\n",
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 17a4931229=2E=2E41ba47ab1d 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -1174,14 +1174,14 @@ bool __init pci_device_detect(pci_sbdf_t sbdf)
     return 1;
 }
=20
-void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
+void pci_check_disable_device(pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
     s_time_t now =3D NOW();
     u16 cword;
=20
     pcidevs_lock();
-    pdev =3D pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
+    pdev =3D pci_get_real_pdev(sbdf);
     if ( pdev )
     {
         if ( now < pdev->fault=2Etime ||
diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index 3d6f787b3c=2E=2Eee848a6d7e 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -1072,8 +1072,7 @@ static void __do_iommu_page_fault(struct vtd_iommu *=
iommu)
         iommu_page_fault_do_one(iommu, type, fault_reason,
                                 source_id, guest_addr);
=20
-        pci_check_disable_device(iommu->drhd->segment,
-                                 PCI_BUS(source_id), PCI_DEVFN(source_id)=
);
+        pci_check_disable_device(PCI_SBDF(iommu->drhd->segment, source_id=
));
=20
         fault_index++;
         if ( fault_index > cap_num_fault_regs(iommu->cap) )
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index c065b2cd5c=2E=2E6b8fcd88dd 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -235,7 +235,7 @@ int pci_ro_device(pci_sbdf_t sbdf);
 int pci_hide_device(pci_sbdf_t sbdf);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
-void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
+void pci_check_disable_device(pci_sbdf_t sbdf);
=20
 /*
  * Iterate without locking or preemption over all PCI devices known by Xe=
n=2E
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.693.7d953f90ff09944a.19edb3b53c8.eaea940e34972e1f=---

