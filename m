Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9U2bBiEHNGoBLgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC06A10F1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Abp7lvEC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341281.1601831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAL-0002UP-RJ; Thu, 18 Jun 2026 14:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341281.1601831; Thu, 18 Jun 2026 14:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAL-0002Oe-Ff; Thu, 18 Jun 2026 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1341281;
 Thu, 18 Jun 2026 14:56:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@swg.vates.tech>)
 id 1waEAJ-0001qc-4Y
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAI-008slh-Go
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-32
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:22 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-16
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b5812000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:56:00 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 653B2869DB;
 Thu, 18 Jun 2026 16:55:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=shet2nKHFLHBuHFrixIZYpfg4VDrE3PTGUiLxJyKLZs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Abp7lvECbkJTvLhht1VvsP2d3iGR6HFZW0f0t6s80L+T7/emSNyJgTN9ErTbXCrcdbK1p5x38
 r04jOdB1c6+yTl22SMcJ8DOhIbMvSaMbV7hWmUnl4TVPSQPOKMzKoAExsf/9mQpVDMHMdBoYtYS
 jT4VB6GsUeyLz8dAqnlUa2h3OYCWyMF1pd9W+zHvACrA5j247LuEFLpUU5bb2F+wFpwL8sQwKQN
 /q5qEKy+eWqg5A605aajKatV9MWFyum3MODdkutlKLrWS6Ykixyd5vJ7HqnoCcQ6lkOkYuisbiP
 u+HrJ5y47IAlO4UIdK7mj7Wi4/tax+84E+DslZgnQj4w==
X-Zone-Loop: a020a24ac271c251d1d6e9843839da2ccb948e121839
x-campaign-type: default
x-transaction-id: 8dd321fd-5513-4ae1-b0c2-166091d75007
x-swg-uid: 01-68d85aef-df7b-4729-a02f-09a37270df07
X-Mailer: Sweego
Message-ID:
 <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@vates.tech>
x-swg-bid: 1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b
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
Subject: [PATCH v2 13/15] pci: Drop parse_pci{_seg}()
Date: Thu, 18 Jun 2026 16:50:37 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.694.cd9fdfc7f30dd984.19edb3b567e.269967fe9da2358b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794559615
X-purgate-ID: tlsNG-720697/1781794582-4DE673F3-A2831989/0/0
X-purgate-type: clean
X-purgate-size: 4133
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCEC06A10F1

---=Part.694.cd9fdfc7f30dd984.19edb3b567e.269967fe9da2358b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No user of these functions remain, take the opportunity collapse
the logic in parse_pci_sbdf{_seg}()=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/pci/pci=2Ec | 46 ++++++++-----------------------------------
 xen/include/xen/pci=2Eh |  6 ------
 2 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index a2b49f1b26=2E=2E4f274e8984 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -151,18 +151,7 @@ void pci_intx(const struct pci_dev *pdev, bool enable=
)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
 }
=20
-const char *__init parse_pci(const char *s, unsigned int *seg_p,
-                             unsigned int *bus_p, unsigned int *dev_p,
-                             unsigned int *func_p)
-{
-    bool def_seg;
-
-    return parse_pci_seg(s, seg_p, bus_p, dev_p, func_p, &def_seg);
-}
-
-const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
-                                 unsigned int *bus_p, unsigned int *dev_p=
,
-                                 unsigned int *func_p, bool *def_seg)
+const char *__init parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bo=
ol *def_seg)
 {
     unsigned long seg =3D simple_strtoul(s, &s, 16), bus, dev, func;
=20
@@ -180,39 +169,20 @@ const char *__init parse_pci_seg(const char *s, unsi=
gned int *seg_p,
         *def_seg =3D true;
     }
=20
-    if ( func_p )
-        func =3D *s =3D=3D '=2E' ? simple_strtoul(s + 1, &s, 0) : 0;
+    func =3D *s =3D=3D '=2E' ? simple_strtoul(s + 1, &s, 0) : 0;
=20
-    if ( seg !=3D (seg_p ? (u16)seg : 0) ||
+    if ( seg !=3D (u16)seg ||
          bus !=3D PCI_BUS(PCI_BDF(bus, 0)) ||
          dev !=3D PCI_SLOT(PCI_DEVFN(dev, 0)) ||
-         func !=3D (func_p ? PCI_FUNC(PCI_DEVFN(0, func)) : 0) )
+         func !=3D PCI_FUNC(PCI_DEVFN(0, func)) )
         return NULL;
=20
-    if ( seg_p )
-        *seg_p =3D seg;
-    *bus_p =3D bus;
-    *dev_p =3D dev;
-    if ( func_p )
-        *func_p =3D func;
-
-    return s;
-}
-
-const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
-{
-    unsigned int seg, bus, dev, func;
-    const char *out =3D parse_pci(s, &seg, &bus, &dev, &func);
-
     *sbdf =3D PCI_SBDF(seg, bus, dev, func);
-    return out;
+    return s;
 }
=20
-const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg)
+const char *__init parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
 {
-    unsigned int seg, bus, dev, func;
-    const char *out =3D parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg=
);
-
-    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
-    return out;
+    bool def_seg;
+    return parse_pci_sbdf_seg(s, sbdf, &def_seg);
 }
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index 6b8fcd88dd=2E=2E71689a2d6b 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -273,12 +273,6 @@ unsigned int pci_find_ext_capability(const struct pci=
_dev *pdev,
 unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
                                           unsigned int start,
                                           unsigned int cap);
-const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *b=
us_p,
-                      unsigned int *dev_p, unsigned int *func_p);
-const char *parse_pci_seg(const char *s, unsigned int *seg_p,
-                          unsigned int *bus_p, unsigned int *dev_p,
-                          unsigned int *func_p, bool *def_seg);
-
 const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
 const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg);
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.694.cd9fdfc7f30dd984.19edb3b567e.269967fe9da2358b=---

