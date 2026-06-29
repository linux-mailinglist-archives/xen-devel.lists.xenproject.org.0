Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dEtjJzqqQmqd/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832986DDAB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="V9JNa/9d";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347831.1605770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiC-0003Lg-UQ; Mon, 29 Jun 2026 17:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347831.1605770; Mon, 29 Jun 2026 17:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiC-0003Et-BY; Mon, 29 Jun 2026 17:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1347831;
 Mon, 29 Jun 2026 17:23:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@swg.vates.tech>)
 id 1weFiA-0002or-Bz
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi9-00FsZ2-Om
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-32
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:57 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-15
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1468806b000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:40 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2BC4080C54;
 Mon, 29 Jun 2026 19:23:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ab9AB7C5WC2ZZnVWc91w9gDAEjg6Vk421+s+qdyG+Hc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=V9JNa/9dMLcXzl4jgPhuGDA+y1AlHvVrdmMtJPxFFfnVAE+FZV8PQaqo0GCNgUs///5Qb6XLC
 rNqm7epq+YzKkjD0TPbKjuNwogqY4AzU8P/KYlZXi50foyBW0ewA118+r9iiiX8B83RNWS5Mdu2
 kv9byuDB8D3ddXVgVyqQSIOdzDXIjop8wwc+CMiRUEwp0jE2YKsxDhMik2QQ1dl5FYk/0mo/sMi
 yPwsI08DlbjfhkrLaZOLU+pWrL3NZHHZ8i01dZp12mIzObEeUXWxEQTdJ7IMO687AqvY3OMEO8u
 Cwyf73UCI3Qkk+MPCCQzrbAMTubDjo7sRD2hRMrIgwlA==
X-Zone-Loop: 079b8f176202655a8104e5c7fd8869c0d70ac93e5177
x-campaign-type: default
x-transaction-id: 48095f4e-7f81-4560-bf71-c95bba21e9d0
x-swg-uid: 01-3172a962-c582-40fe-80cf-24f84f32f60a
X-Mailer: Sweego
Message-ID:
 <1782753820.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@vates.tech>
x-swg-bid: 1782753820.8631fc262581453bbf619ec5b2062170.19f1468806b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 13/18] vtd: Rename acpi_ioapic_unit.ioapic.info to acpi_ioapic_unit.bdf
Date: Mon, 29 Jun 2026 19:21:31 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.818.2b0ce42458fb1e60.19f14687e94.3f647ebc1023f1ee=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753820308
X-purgate-ID: tlsNG-42698a/1782753837-A512D220-53A5AE35/0/0
X-purgate-type: clean
X-purgate-size: 2682
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 832986DDAB3

---=Part.818.2b0ce42458fb1e60.19f14687e94.3f647ebc1023f1ee=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is actually the bdf, collapse the redundant "ioapic" struct
and rename "info" to "bdf" to avoid confusion=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Suggested-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
 xen/drivers/passthrough/vtd/dmar=2Ec     | 2 +-
 xen/drivers/passthrough/vtd/dmar=2Eh     | 6 +++---
 xen/drivers/passthrough/vtd/intremap=2Ec | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 21649fa892=2E=2Ec4243c747b 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -406,7 +406,7 @@ static int __init acpi_parse_dev_scope(
                 if ( !acpi_ioapic_unit )
                     goto out;
                 acpi_ioapic_unit->apic_id =3D acpi_scope->enumeration_id;
-                acpi_ioapic_unit->ioapic=2Einfo =3D dev_sbdf=2Ebdf;
+                acpi_ioapic_unit->bdf =3D dev_sbdf=2Ebdf;
                 list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
=20
                 gfx_only =3D false;
diff --git a/xen/drivers/passthrough/vtd/dmar=2Eh b/xen/drivers/passthroug=
h/vtd/dmar=2Eh
index 47e6918b45=2E=2E5ab95c68bc 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Eh
+++ b/xen/drivers/passthrough/vtd/dmar=2Eh
@@ -29,13 +29,13 @@ struct acpi_ioapic_unit {
     struct list_head list;
     int apic_id;
     union {
-        u16 info;
+        uint16_t bdf;
         struct {
             u16 func: 3,
                 dev:  5,
                 bus:  8;
-        }bdf;
-    }ioapic;
+        };
+    };
 };
=20
 struct acpi_hpet_unit {
diff --git a/xen/drivers/passthrough/vtd/intremap=2Ec b/xen/drivers/passth=
rough/vtd/intremap=2Ec
index dd2788efd7=2E=2E3aa8babdfd 100644
--- a/xen/drivers/passthrough/vtd/intremap=2Ec
+++ b/xen/drivers/passthrough/vtd/intremap=2Ec
@@ -98,7 +98,7 @@ static u16 apicid_to_bdf(int apic_id)
=20
     list_for_each_entry ( acpi_ioapic_unit, &drhd->ioapic_list, list )
         if ( acpi_ioapic_unit->apic_id =3D=3D apic_id )
-            return acpi_ioapic_unit->ioapic=2Einfo;
+            return acpi_ioapic_unit->bdf;
=20
     dprintk(XENLOG_ERR VTDPREFIX, "Didn't find the bdf for the apic_id!\n=
");
     return 0;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.818.2b0ce42458fb1e60.19f14687e94.3f647ebc1023f1ee=---

