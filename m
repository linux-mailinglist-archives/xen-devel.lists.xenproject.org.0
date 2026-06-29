Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bcq7LzeqQmqa/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713AE6DDAA2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=knV8lD2A;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347829.1605763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiC-0003FN-3Z; Mon, 29 Jun 2026 17:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347829.1605763; Mon, 29 Jun 2026 17:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiB-00033N-P3; Mon, 29 Jun 2026 17:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1347829;
 Mon, 29 Jun 2026 17:23:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@swg.vates.tech>)
 id 1weFi9-0002k5-TL
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi9-00FsZ2-AE
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-30
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:57 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14687dc3000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:40 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6D0B280C54;
 Mon, 29 Jun 2026 19:23:39 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SOQFXCCvJVsp29T4zwS+OjIDZ6gbp/VMxIg74+MXrUE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=knV8lD2Akj7xvpd3hqOs36YNdEZ14zLQs5C6tNnqcJCKGTfXSa7UHnn8D3Xmt1V69h3+MqR9L
 x/bZs/NG/JCE3vK2ZG+m2noJnuU8Pl2QYXRUgIMloRiMS6tjOHSaToithi5nn7CaHXzY2EmKZ6S
 q+Pzxmm1aWpO5r44rDLwAKGQio9KK9nEZ1w0FbZP+Fkccaxxal9yBMV4q8lZ+EE7EsxxfbEXv9/
 Fw4v4R3u6K6iv8A5i5qFcBSWNGXiIu3Lqs5gaGgBETgid/4Y2LCOUYqxEq7p7pCnA8doPoWk+VV
 STVS9y/IFriPkpSe2JsOYUTapMiayyk9Lh2kCV2NtCFQ==
X-Zone-Loop: d81ec4dfee257cd2ec652cba7ca18ed9636e4c52536e
x-campaign-type: default
x-transaction-id: a17414f3-53be-4144-b46c-32a976e79ffc
x-swg-uid: 01-a7ea826d-8698-4a98-ba09-2db25ef73fcc
X-Mailer: Sweego
Message-ID:
 <1782753820.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@vates.tech>
x-swg-bid: 1782753820.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b
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
Subject: [PATCH v3 12/18] ns16550: Parse into pci_sbdf_t directly
Date: Mon, 29 Jun 2026 19:21:30 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.817.428ee3f3c98b9976.19f14687c02.29961d38624640ab=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753819650
X-purgate-ID: tlsNG-42698a/1782753837-A6125220-E62D458B/0/0
X-purgate-type: clean
X-purgate-size: 2747
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
X-Rspamd-Queue-Id: 713AE6DDAA2

---=Part.817.428ee3f3c98b9976.19f14687c02.29961d38624640ab=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ns16550=2Ec | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/char/ns16550=2Ec b/xen/drivers/char/ns16550=2Ec
index a3d6c46a73=2E=2Ecdc9122ff9 100644
--- a/xen/drivers/char/ns16550=2Ec
+++ b/xen/drivers/char/ns16550=2Ec
@@ -1571,22 +1571,22 @@ static bool __init parse_positional(struct ns16550=
 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
     {
-        unsigned int b, d, f;
+        pci_sbdf_t sbdf;
=20
-        conf =3D parse_pci(conf, NULL, &b, &d, &f);
+        conf =3D parse_pci(conf, &sbdf);
         if ( !conf )
             PARSE_ERR_RET("Bad port PCI coordinates");
-        uart->pci_device =3D PCI_SBDF(0, b, d, f);
+        uart->pci_device =3D sbdf;
         uart->ps_bdf_enable =3D true;
     }
=20
     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
     {
-        unsigned int b, d, f;
+        pci_sbdf_t sbdf;
=20
-        if ( !parse_pci(conf, NULL, &b, &d, &f) )
+        if ( !parse_pci(conf, &sbdf) )
             PARSE_ERR_RET("Bad bridge PCI coordinates");
-        uart->pci_bridge =3D PCI_SBDF(0, b, d, f);
+        uart->pci_bridge =3D sbdf;
         uart->pb_bdf_enable =3D true;
     }
 #endif
@@ -1670,22 +1670,22 @@ static bool __init parse_namevalue_pairs(char *str=
, struct ns16550 *uart)
=20
         case port_bdf:
         {
-            unsigned int b, d, f;
+            pci_sbdf_t sbdf;
=20
-            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
+            if ( !parse_pci(param_value, &sbdf) )
                 PARSE_ERR_RET("Bad port PCI coordinates\n");
-            uart->pci_device =3D PCI_SBDF(0, b, d, f);
+            uart->pci_device =3D sbdf;
             uart->ps_bdf_enable =3D true;
             break;
         }
=20
         case bridge_bdf:
         {
-            unsigned int b, d, f;
+            pci_sbdf_t sbdf;
=20
-            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
+            if ( !parse_pci(param_value, &sbdf) )
                 PARSE_ERR_RET("Bad bridge PCI coordinates\n");
-            uart->pci_bridge =3D PCI_SBDF(0, b, d, f);
+            uart->pci_bridge =3D sbdf;
             uart->pb_bdf_enable =3D true;
             break;
         }
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.817.428ee3f3c98b9976.19f14687c02.29961d38624640ab=---

