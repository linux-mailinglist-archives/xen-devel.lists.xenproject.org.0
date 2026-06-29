Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7vMyCzSqQmqO/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6266DDA74
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=BvB7ep9x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347815.1605712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi2-0001PW-D8; Mon, 29 Jun 2026 17:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347815.1605712; Mon, 29 Jun 2026 17:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi2-0001MU-8e; Mon, 29 Jun 2026 17:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1347815;
 Mon, 29 Jun 2026 17:23:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686677000701b@swg.vates.tech>)
 id 1weFi0-00015v-Io
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFhz-00FsUc-Vk
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686677000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:47 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686677000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14686677000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:34 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D84B86BB9;
 Mon, 29 Jun 2026 19:23:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=QoErcVxzANF0JtfExbCLAwt3gh3GsZ7o2RGnxqphLiM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=BvB7ep9xfWOwxaLnOzS6BmB0KoLV/GkhsSfyW+l0qS2uV+3NCjStkhVv1FQCPQpOFvqCwNODO
 rPRv3RJToVPkHox6vU+IJa2NjRyIuTIOFPnJJsJVJLdZD+louDlMNTDt/6uFh5Ii7vNfPo9CBzV
 2WZKveErRDUYYyKttJjE7Nq5Po4Facn/d8i3+spaH8I5UbHqCrWllu+JbfU/J+1V8frS57Ul0HS
 fcRcr+1dY8drBOwtLkVTh9yN5bI0+zyIW3IdoUltUtm9CAkg9XlGrZfWgWc4sbTqPdbS/iV93/5
 IfQPAnYoutNurC9L3cu4f2jXBQwRdZ0qp0NisUrc3+Tg==
X-Zone-Loop: b33fc1ef30cb8c86b12850b946169f6be8a76ac5314b
x-campaign-type: default
x-transaction-id: 5cb7299b-c494-42de-a564-6a1f001138de
x-swg-uid: 01-8ec05f05-9d74-40ef-9012-5906685b720b
X-Mailer: Sweego
Message-ID:
 <1782753814.8631fc262581453bbf619ec5b2062170.19f14686677000701b@vates.tech>
x-swg-bid: 1782753814.8631fc262581453bbf619ec5b2062170.19f14686677000701b
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
Subject: [PATCH v3 06/18] pci: Use pci_sbdf_t in pci_hide_device()
Date: Mon, 29 Jun 2026 19:21:24 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.811.e9b873507167dbea.19f146864d4.2eb6d4ec73f1346=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753813717
X-purgate-ID: tlsNG-42698a/1782753827-A6939220-CA24DC91/0/0
X-purgate-type: clean
X-purgate-size: 4138
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F6266DDA74

---=Part.811.e9b873507167dbea.19f146864d4.2eb6d4ec73f1346=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No functional change intended=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
 xen/drivers/char/ehci-dbgp=2Ec  | 2 +-
 xen/drivers/char/xhci-dbc=2Ec   | 2 +-
 xen/drivers/passthrough/pci=2Ec | 7 +++----
 xen/drivers/video/vga=2Ec       | 2 +-
 xen/include/xen/pci=2Eh         | 2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index 2a58213cab=2E=2Eab1e3c6de4 100644
--- a/xen/drivers/char/ehci-dbgp=2Ec
+++ b/xen/drivers/char/ehci-dbgp=2Ec
@@ -1376,7 +1376,7 @@ static void __init cf_check ehci_dbgp_init_postirq(s=
truct serial_port *port)
=20
     ehci_dbgp_setup_postirq(dbgp);
=20
-    pci_hide_device(0, dbgp->bus, PCI_DEVFN(dbgp->slot, dbgp->func));
+    pci_hide_device(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func));
 }
=20
 static int ehci_dbgp_check_release(struct ehci_dbgp *dbgp)
diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index 7a56dca6dd=2E=2E3f41aa7022 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1202,7 +1202,7 @@ static void __init cf_check dbc_uart_init_postirq(st=
ruct serial_port *port)
                    &uart->dbc=2Esbdf);
         break;
     case XHCI_SHARE_HWDOM:
-        if ( pci_hide_device(0, uart->dbc=2Esbdf=2Ebus, uart->dbc=2Esbdf=
=2Edevfn) )
+        if ( pci_hide_device(uart->dbc=2Esbdf) )
             printk(XENLOG_WARNING
                    "Failed to hide %pp used for XHCI console\n",
                    &uart->dbc=2Esbdf);
diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index e4357b84a4=2E=2E8c574926cd 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -476,18 +476,17 @@ static void __init _pci_hide_device(struct pci_dev *=
pdev)
     write_unlock(&dom_xen->pci_lock);
 }
=20
-int __init pci_hide_device(unsigned int seg, unsigned int bus,
-                           unsigned int devfn)
+int __init pci_hide_device(pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
     struct pci_seg *pseg;
     int rc =3D -ENOMEM;
=20
     pcidevs_lock();
-    pseg =3D alloc_pseg(seg);
+    pseg =3D alloc_pseg(sbdf=2Eseg);
     if ( pseg )
     {
-        pdev =3D alloc_pdev(pseg, bus, devfn);
+        pdev =3D alloc_pdev(pseg, sbdf=2Ebus, sbdf=2Edevfn);
         if ( pdev )
         {
             _pci_hide_device(pdev);
diff --git a/xen/drivers/video/vga=2Ec b/xen/drivers/video/vga=2Ec
index b577b24619=2E=2Eb2b9c3680a 100644
--- a/xen/drivers/video/vga=2Ec
+++ b/xen/drivers/video/vga=2Ec
@@ -147,7 +147,7 @@ void __init video_endboot(void)
                 {
                     printk(XENLOG_INFO "Boot video device %02x:%02x=2E%u\=
n",
                            bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
-                    pci_hide_device(0, bus, devfn);
+                    pci_hide_device(PCI_SBDF(0, bus, devfn));
                 }
             }
     }
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index d038217607=2E=2E03ae389cb7 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -233,7 +233,7 @@ int pci_add_device(pci_sbdf_t sbdf, const struct pci_d=
ev_info *info,
                    nodeid_t node);
 int pci_remove_device(pci_sbdf_t sbdf);
 int pci_ro_device(pci_sbdf_t sbdf);
-int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devf=
n);
+int pci_hide_device(pci_sbdf_t sbdf);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.811.e9b873507167dbea.19f146864d4.2eb6d4ec73f1346=---

