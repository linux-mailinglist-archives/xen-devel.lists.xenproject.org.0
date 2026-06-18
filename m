Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M1D2GAsHNGrpLQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484F6A10B6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=iampVMjI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341261.1601723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9y-0007ON-Px; Thu, 18 Jun 2026 14:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341261.1601723; Thu, 18 Jun 2026 14:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9y-0007MT-NI; Thu, 18 Jun 2026 14:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1341261;
 Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 1waE9w-00079f-Kj
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waE9w-002MfF-1E
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 6a3406fe-2eae-0a2a0a5409dd-0a2a4502e5c8-4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:59 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b3411000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:50 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 29A5686962;
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
 q=dns/txt; s=selector1; bh=bkdOZqrvjqr6flE5BYOE/roewt3QGKdGV2l97nCiJjY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iampVMjIiFk6fpXi4g+lu0bmxgSdGj1vrd1B/9f6+cGBoZf46660SheSJbc29b69MYStadZ/S
 F805PuSkv7PxGVsrhYchGU+6dKzeSwfiUr8rXqVn23SqE78Bq/cFTLTCXhTy13j7AmQ3x6PTAOr
 9eqjHQoBWhK3pqBuZi54KkzIO77QZ83D5FEBHIArdZttoHrgDet0ZGS+mH8U3v8R/GJ+RKWoBjj
 pnTZSp1EIR+la1Pz29Znd2sbaThl3v+LU8NqsdG7GJ9n2HZG6VE9ayHUsl4yAowe7WOHlU+fiCG
 n50pCkoLt1nLnC5qSIEIS+l4gWG/eQ2y9QsMdfEf7txw==
X-Zone-Loop: cecc3d7d01b7eb8775fc467cccfc959236d52428ed3f
x-campaign-type: default
x-transaction-id: b826a65b-630e-429a-94c8-a87eddbcbf63
x-swg-uid: 01-75e6d2ec-825c-4c31-9421-3c10f4884461
X-Mailer: Sweego
Message-ID:
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
x-swg-bid: 1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b
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
Subject: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
Date: Thu, 18 Jun 2026 16:50:25 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794550368
X-purgate-ID: tlsNG-720697/1781794559-4F8783F3-F8589A63/0/0
X-purgate-type: clean
X-purgate-size: 2322
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
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
X-Rspamd-Queue-Id: 0484F6A10B6

---=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In many places, we're parsing a PCI string into individual
parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
using PCI_SBDF macro=2E Rather than converting from parts to pci_sbdf_t
and vice versa, introduce a new function that parses a PCI string
into a pci_sbdf_t structure directly=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/pci/pci=2Ec | 18 ++++++++++++++++++
 xen/include/xen/pci=2Eh |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index 084be3880c=2E=2E1d06cb035b 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsig=
ned int *seg_p,
=20
     return s;
 }
+
+const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
+{
+    unsigned int seg, bus, dev, func;
+    const char *out =3D parse_pci(s, &seg, &bus, &dev, &func);
+
+    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
+    return out;
+}
+
+const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg)
+{
+    unsigned int seg, bus, dev, func;
+    const char *out =3D parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg=
);
+
+    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
+    return out;
+}
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index afb6bbf50d=2E=2E7bfc59cd75 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -280,6 +280,9 @@ const char *parse_pci_seg(const char *s, unsigned int =
*seg_p,
                           unsigned int *bus_p, unsigned int *dev_p,
                           unsigned int *func_p, bool *def_seg);
=20
+const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
+const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg);
+
 #define PCI_BAR_VF      (1u << 0)
 #define PCI_BAR_LAST    (1u << 1)
 #define PCI_BAR_ROM     (1u << 2)
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=---

