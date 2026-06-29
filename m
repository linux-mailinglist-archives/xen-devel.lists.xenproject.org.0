Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OdXIKjSqQmqS/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3386DDA7B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=nKnWjo3Z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347822.1605739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi7-0002GQ-El; Mon, 29 Jun 2026 17:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347822.1605739; Mon, 29 Jun 2026 17:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi7-0002Ba-6m; Mon, 29 Jun 2026 17:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1347822;
 Mon, 29 Jun 2026 17:23:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686fec000701b@swg.vates.tech>)
 id 1weFi5-0001wT-Qs
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi5-00FsUc-7m
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686fec000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:53 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14686fec000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-11
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14686fec000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:36 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C04D180C54;
 Mon, 29 Jun 2026 19:23:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=OhMm3DpUM3f7E5ZWZzJ9d+UuHfDZ+IzTvLP3kCIcmFI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nKnWjo3ZAAPZ1qWdiu8NPGmsAfFSkZWPsOFaYjYT4inGh8lFUMH66uZrYOeTL29GVSfM9gZD9
 W/eNVcwy9ItVY9XFEjKHvvhfzO4JVDVC/0RcZx6Kicp2fWqB1vSIZqs1PECbpRp5/sUniTTrpfe
 g7aLdi4ibKqK35gx/I/ycqGo4xa/C5Eh85QHf0ggc6RA6fHOPgH0PzDAsVgXSlnkmLWPOKP2O/5
 BRQJWK3ERwv9pquTmIGXPYSZcbcjUNZjsPlgwv9bDQ5+TriKL999agw63rzth4X8s7vNkzVLoRK
 gbBvOPDBA+pJvu6s9vAlLDIGRwNCrYue9pB2GJxMulsw==
X-Zone-Loop: 4146f536951889a9500495ae35089fe379d5b2a25d92
x-campaign-type: default
x-transaction-id: 1bbb0c15-f27f-4c45-85c2-a894f8193da0
x-swg-uid: 01-9b7c790d-9cc4-4a69-b904-99e7af30e2a6
X-Mailer: Sweego
Message-ID:
 <1782753816.8631fc262581453bbf619ec5b2062170.19f14686fec000701b@vates.tech>
x-swg-bid: 1782753816.8631fc262581453bbf619ec5b2062170.19f14686fec000701b
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
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 09/18] amd/iommu: Parse into pci_sbdf_t directly
Date: Mon, 29 Jun 2026 19:21:27 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.814.b205fd5400880850.19f14686d84.5448df4a668d98dc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753815940
X-purgate-ID: tlsNG-42698a/1782753833-38942220-FA80735A/0/0
X-purgate-type: clean
X-purgate-size: 4228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[3];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,hpet_sbdf.id:url];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C3386DDA7B

---=Part.814.b205fd5400880850.19f14686d84.5448df4a668d98dc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/amd/iommu_acpi=2Ec | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec b/xen/drivers/pass=
through/amd/iommu_acpi=2Ec
index 39ae637959=2E=2E33c2c78bdd 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
@@ -682,8 +682,8 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
 {
     const char *s =3D str;
     unsigned long id;
-    unsigned int seg, bus, dev, func;
     unsigned int idx;
+    pci_sbdf_t sbdf;
=20
     if ( *s !=3D '[' )
         return -EINVAL;
@@ -692,7 +692,7 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
     if ( *s !=3D ']' || *++s !=3D '=3D' )
         return -EINVAL;
=20
-    s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
+    s =3D parse_pci(s + 1, &sbdf);
     if ( !s || *s )
         return -EINVAL;
=20
@@ -707,7 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
         }
     }
=20
-    ioapic_sbdf[idx]=2Esbdf =3D PCI_SBDF(seg, bus, dev, func);
+    ioapic_sbdf[idx]=2Esbdf =3D sbdf;
     ioapic_sbdf[idx]=2Eid =3D id;
     ioapic_sbdf[idx]=2Ecmdline =3D true;
=20
@@ -719,7 +719,7 @@ static int __init cf_check parse_ivrs_hpet(const char =
*str)
 {
     const char *s =3D str;
     unsigned long id;
-    unsigned int seg, bus, dev, func;
+    pci_sbdf_t sbdf;
=20
     if ( *s !=3D '[' )
         return -EINVAL;
@@ -728,12 +728,12 @@ static int __init cf_check parse_ivrs_hpet(const cha=
r *str)
     if ( id !=3D (typeof(hpet_sbdf=2Eid))id || *s !=3D ']' || *++s !=3D '=
=3D' )
         return -EINVAL;
=20
-    s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
+    s =3D parse_pci(s + 1, &sbdf);
     if ( !s || *s )
         return -EINVAL;
=20
     hpet_sbdf=2Eid =3D id;
-    hpet_sbdf=2Esbdf =3D PCI_SBDF(seg, bus, dev, func);
+    hpet_sbdf=2Esbdf =3D sbdf;
     hpet_sbdf=2Einit =3D HPET_CMDL;
=20
     return 0;
@@ -1399,13 +1399,13 @@ static int __init cf_check parse_ivmd_param(const =
char *s)
         }
=20
         do {
-            unsigned int seg, bus, dev, func;
+            pci_sbdf_t sbdf;
=20
             if ( nr_ivmd >=3D ARRAY_SIZE(user_ivmds) )
                 return -E2BIG;
=20
-            s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
-            if ( !s || seg )
+            s =3D parse_pci(s + 1, &sbdf);
+            if ( !s || sbdf=2Eseg )
                 return -EINVAL;
=20
             user_ivmds[nr_ivmd]=2Estart_address =3D start << PAGE_SHIFT;
@@ -1413,16 +1413,16 @@ static int __init cf_check parse_ivmd_param(const =
char *s)
             user_ivmds[nr_ivmd]=2Eheader=2Eflags =3D ACPI_IVMD_UNITY |
                                                ACPI_IVMD_READ | ACPI_IVMD=
_WRITE;
             user_ivmds[nr_ivmd]=2Eheader=2Elength =3D sizeof(*user_ivmds)=
;
-            user_ivmds[nr_ivmd]=2Eheader=2Edevice_id =3D PCI_BDF(bus, dev=
, func);
+            user_ivmds[nr_ivmd]=2Eheader=2Edevice_id =3D sbdf=2Ebdf;
             user_ivmds[nr_ivmd]=2Eheader=2Etype =3D ACPI_IVRS_TYPE_MEMORY=
_ONE;
=20
             if ( *s =3D=3D '-' )
             {
-                s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
-                if ( !s || seg )
+                s =3D parse_pci(s + 1, &sbdf);
+                if ( !s || sbdf=2Eseg )
                     return -EINVAL;
=20
-                user_ivmds[nr_ivmd]=2Eaux_data =3D PCI_BDF(bus, dev, func=
);
+                user_ivmds[nr_ivmd]=2Eaux_data =3D sbdf=2Ebdf;
                 if ( user_ivmds[nr_ivmd]=2Eaux_data <
                      user_ivmds[nr_ivmd]=2Eheader=2Edevice_id )
                     return -EINVAL;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.814.b205fd5400880850.19f14686d84.5448df4a668d98dc=---

