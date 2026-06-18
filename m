Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJRCKRQHNGrxLQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B36A10C9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=hZ4al051;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341266.1601758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEA8-0008SR-R8; Thu, 18 Jun 2026 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341266.1601758; Thu, 18 Jun 2026 14:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEA8-0008Pv-NS; Thu, 18 Jun 2026 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1341266;
 Thu, 18 Jun 2026 14:56:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@swg.vates.tech>)
 id 1waEA7-0008K1-BC
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEA6-002Mio-OD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@swg.vates.tech>)
 id 6a3406fe-2eae-0a2a0a5409dd-0a2a4502e5c8-46
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:10 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b3fcc000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:53 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1A5B786345;
 Thu, 18 Jun 2026 16:55:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Pv2yJwAGt5eCc1X5/3pBlouN6NinACU1qQspgZdulnw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hZ4al051c1+cdjEOzXgnrU1/UqV7oqNJmDp+/iR0JNjQcniTHVeFE6L5C1cgPn10lISWAelr1
 cE7yqcEIgDaNrcQOVarQqBMWUx0/rZmIDUImTnOIsgWi8cbRSYxrJSMLDKOiCo9on0bWnuFl+RR
 XOyyTjONy+MSF/BfsMsPr+ZxdFdEzAR33nCbsM9/4/3LcHzomAxfsEfeSVes8skg6EYG2SMpgf9
 65d5kqvd0JOVs/3VnTDmFsiICO7IC7uITVyWnWUT/s29gCP3Vj7ONl5cgkGbScEsfrVER+EKYip
 4ivoGL26FcvpQaQ8zKCXDjYH1PDyWu23MUlagei2Muzw==
X-Zone-Loop: 6784ace32865b80b1df9a0aeca55aa5831c1e067f1a3
x-campaign-type: default
x-transaction-id: 1f59fb53-37ae-4154-a4b1-8089f5ccb38f
x-swg-uid: 01-21705c0f-d806-43b0-94fa-fc658e3398f1
X-Mailer: Sweego
Message-ID:
 <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@vates.tech>
x-swg-bid: 1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/15] pci: Allow ommiting func when parsing with parse_pci_sbdf()
Date: Thu, 18 Jun 2026 16:50:29 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.68c.fdb7e6fd05dd5aea.19edb3b3ddb.38dcfe762cbd444=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794553307
X-purgate-ID: tlsNG-720697/1781794570-4D66B3F3-101BD06A/0/0
X-purgate-type: clean
X-purgate-size: 2731
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 190B36A10C9

---=Part.68c.fdb7e6fd05dd5aea.19edb3b3ddb.38dcfe762cbd444=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Allow parsing PCI SBDF with the function part omitted (i=2Ee XXXX:YY:ZZ),
in such case, the parsed PCI function is zero=2E

That allows us to now use parse_pci_sbdf() in parse_phantom_dev()=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/pci=2Ec | 10 +++++-----
 xen/drivers/pci/pci=2Ec         | 12 ++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 7b09c9a7cd=2E=2Ef222da8879 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -148,7 +148,7 @@ static unsigned int nr_phantom_devs;
 static int __init cf_check parse_phantom_dev(const char *str)
 {
     const char *s;
-    unsigned int seg, bus, slot;
+    pci_sbdf_t sbdf;
     struct phantom_dev phantom;
=20
     if ( !*str )
@@ -156,13 +156,13 @@ static int __init cf_check parse_phantom_dev(const c=
har *str)
     if ( nr_phantom_devs >=3D ARRAY_SIZE(phantom_devs) )
         return -E2BIG;
=20
-    s =3D parse_pci(str, &seg, &bus, &slot, NULL);
+    s =3D parse_pci_sbdf(str, &sbdf);
     if ( !s || *s !=3D ',' )
         return -EINVAL;
=20
-    phantom=2Eseg =3D seg;
-    phantom=2Ebus =3D bus;
-    phantom=2Eslot =3D slot;
+    phantom=2Eseg =3D sbdf=2Eseg;
+    phantom=2Ebus =3D sbdf=2Ebus;
+    phantom=2Eslot =3D sbdf=2Edev;
=20
     switch ( phantom=2Estride =3D simple_strtol(s + 1, &s, 0) )
     {
diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index 1d06cb035b=2E=2Ea2b49f1b26 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -179,18 +179,14 @@ const char *__init parse_pci_seg(const char *s, unsi=
gned int *seg_p,
         seg =3D 0;
         *def_seg =3D true;
     }
+
     if ( func_p )
-    {
-        if ( *s !=3D '=2E' )
-            return NULL;
-        func =3D simple_strtoul(s + 1, &s, 0);
-    }
-    else
-        func =3D 0;
+        func =3D *s =3D=3D '=2E' ? simple_strtoul(s + 1, &s, 0) : 0;
+
     if ( seg !=3D (seg_p ? (u16)seg : 0) ||
          bus !=3D PCI_BUS(PCI_BDF(bus, 0)) ||
          dev !=3D PCI_SLOT(PCI_DEVFN(dev, 0)) ||
-         func !=3D PCI_FUNC(PCI_DEVFN(0, func)) )
+         func !=3D (func_p ? PCI_FUNC(PCI_DEVFN(0, func)) : 0) )
         return NULL;
=20
     if ( seg_p )
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.68c.fdb7e6fd05dd5aea.19edb3b3ddb.38dcfe762cbd444=---

