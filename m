Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uYyeOkCqQmqn/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98E6DDAD3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=N+IaYguF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347852.1605801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiJ-0004th-Oo; Mon, 29 Jun 2026 17:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347852.1605801; Mon, 29 Jun 2026 17:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiJ-0004pL-9X; Mon, 29 Jun 2026 17:24:07 +0000
Received: by outflank-mailman (input) for mailman id 1347852;
 Mon, 29 Jun 2026 17:24:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@swg.vates.tech>)
 id 1weFiF-0003zb-OD
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:24:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFiF-00FsZ2-47
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:24:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-40
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:03 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-19
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14688af5000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:43 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD03086C09;
 Mon, 29 Jun 2026 19:23:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UZ92k1P3mLLOLVJOvEs987fueI596maD+93tnRSm4SE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=N+IaYguF3dOiUunFVW/yhvxSX28MXbm40s+ZEqFLUV0ePFDa1+fhe/4CcnEqqUSzHt68aYSEI
 dCOumffFU12Hmtp0u7JLVvRZ5Fvhq5XlnZ4RFfArjoq4Z5YZ8/WGT6efGZZN219IXU40wUJjOOX
 CUxDc8eOViGnQ1m7mHKyk7xKRLGLJUEE/f/e1OoN2Iq9i+1COXJZ9LwY8A6/t+8obGw99yFNHT7
 21apjpLREX2Y7dmbrtI2yrdGA2DFrXgJ4BRbPRpE3GDjlZqoZXYCxBuuugm55xMugMZSOJZ4gEq
 RsW9jBbHWS4Bk2XwQcbXA+yhmykuo3SltnOo/TRyi++Q==
X-Zone-Loop: 55eb53bade8ef525b484a65db1b906e755d689381081
x-campaign-type: default
x-transaction-id: 6d8e18be-9f0c-489e-99fc-b051f30e0f6c
x-swg-uid: 01-577bbd92-f2f0-465d-adf8-565ec1e5f99d
X-Mailer: Sweego
Message-ID:
 <1782753823.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@vates.tech>
x-swg-bid: 1782753823.8631fc262581453bbf619ec5b2062170.19f14688af5000701b
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
Subject: [PATCH v3 17/18] pci: Drop parse_pci_split{_seg}()
Date: Mon, 29 Jun 2026 19:21:35 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.81c.9c4d7687c4cc0fa1.19f14688945.a92abee2baa2ae7a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753823045
X-purgate-ID: tlsNG-42698a/1782753843-A7B30220-B400EDD6/0/0
X-purgate-type: clean
X-purgate-size: 5088
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
X-Rspamd-Queue-Id: 9A98E6DDAD3

---=Part.81c.9c4d7687c4cc0fa1.19f14688945.a92abee2baa2ae7a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

No user of these functions remain, collapse all the logic into the
recently introduced pci_sbdf_t variants=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/pci/pci=2Ec | 43 +++++++------------------------------------
 xen/include/xen/pci=2Eh | 23 ++---------------------
 2 files changed, 9 insertions(+), 57 deletions(-)

diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index 793545ae49=2E=2E0db9ee51f0 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -151,18 +151,7 @@ void pci_intx(const struct pci_dev *pdev, bool enable=
)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
 }
=20
-const char *__init parse_pci_split(const char *s, unsigned int *seg_p,
-                             unsigned int *bus_p, unsigned int *dev_p,
-                             unsigned int *func_p)
-{
-    bool def_seg;
-
-    return parse_pci_seg(s, seg_p, bus_p, dev_p, func_p, &def_seg);
-}
-
-const char *__init parse_pci_split_seg(const char *s, unsigned int *seg_p=
,
-                                 unsigned int *bus_p, unsigned int *dev_p=
,
-                                 unsigned int *func_p, bool *def_seg)
+const char *__init parse_pci_seg(const char *s, pci_sbdf_t *sbdf, bool *d=
ef_seg)
 {
     unsigned long seg =3D simple_strtoul(s, &s, 16), bus, dev, func =3D 0=
;
=20
@@ -180,39 +169,21 @@ const char *__init parse_pci_split_seg(const char *s=
, unsigned int *seg_p,
         *def_seg =3D true;
     }
=20
-    if ( func_p && *s =3D=3D '=2E' )
+    if ( *s =3D=3D '=2E' )
         func =3D simple_strtoul(s + 1, &s, 0);
=20
-    if ( seg !=3D (seg_p ? (u16)seg : 0) ||
+    if ( seg !=3D (u16)seg ||
          bus !=3D PCI_BUS(PCI_BDF(bus, 0)) ||
          dev !=3D PCI_SLOT(PCI_DEVFN(dev, 0)) ||
          func !=3D PCI_FUNC(PCI_DEVFN(0, func)) )
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
-const char *__init parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
-{
-    unsigned int seg, bus, dev, func;
-    const char *out =3D parse_pci(s, &seg, &bus, &dev, &func);
-
     *sbdf =3D PCI_SBDF(seg, bus, dev, func);
-    return out;
+    return s;
 }
=20
-const char *__init parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bo=
ol *def_seg)
+const char *__init parse_pci(const char *s, pci_sbdf_t *sbdf)
 {
-    unsigned int seg, bus, dev, func;
-    const char *out =3D parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg=
);
-
-    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
-    return out;
+    bool def_seg;
+    return parse_pci_seg(s, sbdf, &def_seg);
 }
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index 8e2f8a1ab7=2E=2Ecb14b6a47f 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -274,27 +274,8 @@ unsigned int pci_find_ext_capability(const struct pci=
_dev *pdev,
 unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
                                           unsigned int start,
                                           unsigned int cap);
-const char *parse_pci_split(const char *s, unsigned int *seg_p, unsigned =
int *bus_p,
-                      unsigned int *dev_p, unsigned int *func_p);
-const char *parse_pci_split_seg(const char *s, unsigned int *seg_p,
-                          unsigned int *bus_p, unsigned int *dev_p,
-                          unsigned int *func_p, bool *def_seg);
-
-const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
-const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg);
-
-#define _parse_pci_split(a, b, c, d, e, =2E=2E=2E) parse_pci_split(a, b, =
c, d, e)
-#define _parse_pci_split_seg(a, b, c, d, e, f, =2E=2E=2E) parse_pci_split=
_seg(a, b, c, d, e, f)
-
-#define parse_pci(a, b, =2E=2E=2E)                                       =
     \
-    (count_args(__VA_ARGS__) > 0                                        \
-     ? _parse_pci_split(a, (void *)b, ##__VA_ARGS__, NULL, NULL, NULL)  \
-     :  parse_pci_sbdf(a, (void *)b))
-
-#define parse_pci_seg(a, b, c, =2E=2E=2E)                                =
     \
-    (count_args(__VA_ARGS__) > 0                                        \
-     ? _parse_pci_split_seg(a, (void *)b, (void *)c, ##__VA_ARGS__, NULL,=
 NULL, NULL, NULL) \
-     :  parse_pci_sbdf_seg(a, (void *)b, (void *)c))
+const char *parse_pci(const char *s, pci_sbdf_t *sbdf);
+const char *parse_pci_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)=
;
=20
 #define PCI_BAR_VF      (1u << 0)
 #define PCI_BAR_LAST    (1u << 1)
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.81c.9c4d7687c4cc0fa1.19f14688945.a92abee2baa2ae7a=---

