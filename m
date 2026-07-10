Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 18uYJVP6UGp89QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC573B817
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=dDidt1d5;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359406.1612997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjP-0004j1-4E; Fri, 10 Jul 2026 13:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359406.1612997; Fri, 10 Jul 2026 13:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjP-0004hB-0V; Fri, 10 Jul 2026 13:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1359406;
 Fri, 10 Jul 2026 13:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c518bf5000edb5@swg.vates.tech>)
 id 1wiBjN-0004g1-J6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBjM-00FOqr-W3
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:57:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c518bf5000edb5@swg.vates.tech>)
 id 6a50fa48-2eae-0a2a0a5409dd-0a2a450aa75a-0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:28 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c518bf5000edb5@swg.vates.tech>)
 id 6a50fa48-ec7d-0a2a450a0019-b9ff1c22a2c3-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c518bf5000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:57:20 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id ABC20820B8;
 Fri, 10 Jul 2026 15:57:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=l8lXziu6+jnxnY050LpOjs1ccr9tt/9Lbrp1Dc/EtGg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dDidt1d5ZWR7cMJG+BNgos1S9++MArXtjjl6mLDxg8aOu3w7eUR4SBV2lCA7k3RMdTiUxbV5O
 /1AcFtEHhQHJdWpFvCL3L8d5UW0rXhhHMiVcbtGA6i5sV38cVbGYcDe36DRAn7CbcmjstHqyg9v
 crfuTM4owFb9vYzSf855inS/nkj7QbnMa8QXsvZ07/UZ4Wb0IKCtN8zoxSsMnAr9MZ4dDpej+dH
 JJ/3W8UbckqlPb9SzO/QZcA4iBEdmETYQMagj9keufW9/IlNbfMMJQ9bjD0+3QSQ9PuiDziP+sO
 BptKN6Ydsg6uLywE7VJA5iTAeooBVMUL617CMXh9PmxA==
X-Zone-Loop: e02953b81318053b3744d2cdaa42db0bc05e7ca1ed57
x-campaign-type: default
x-transaction-id: b02d21c7-7bbf-4e28-8224-ca97d2d1e2b3
x-swg-uid: 01-c8c45f15-cfba-4052-a185-71e4c078887d
X-Mailer: Sweego
Message-ID:
 <1783691840.8631fc262581453bbf619ec5b2062170.19f4c518bf5000edb5@vates.tech>
x-swg-bid: 1783691840.8631fc262581453bbf619ec5b2062170.19f4c518bf5000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 2/6] ARM/sysctl: Expose the supported guest GIC modes in physinfo
Date: Fri, 10 Jul 2026 15:57:07 +0200
In-Reply-To: <20260710135711.301993-1-julian.vetter@vates.tech>
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.634.2b000471eaa9bb0e.19f4c5189f9.ac1dba2105c365c7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691839993
X-purgate-ID: tlsNG-4011c0/1783691848-3D379248-B2201A0D/0/0
X-purgate-type: clean
X-purgate-size: 2693
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EDC573B817

---=Part.634.2b000471eaa9bb0e.19f4c5189f9.ac1dba2105c365c7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 xen/arch/arm/sysctl=2Ec       | 26 ++++++++++++++++++++++++++
 xen/include/public/sysctl=2Eh |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/sysctl=2Ec b/xen/arch/arm/sysctl=2Ec
index 32cab4feff=2E=2E3b0edf4cec 100644
--- a/xen/arch/arm/sysctl=2Ec
+++ b/xen/arch/arm/sysctl=2Ec
@@ -12,7 +12,10 @@
 #include <xen/dt-overlay=2Eh>
 #include <xen/errno=2Eh>
 #include <xen/hypercall=2Eh>
+
 #include <asm/arm64/sve=2Eh>
+#include <asm/gic=2Eh>
+
 #include <public/sysctl=2Eh>
=20
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
@@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
=20
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+    /*
+     * The GIC version(s) we're happy creating guests with=2E  Right now =
for
+     * simplicity it is tied to the active hardware version, but this wil=
l
+     * cease to be the case if/when the compatbility modes are enabled=2E
+     */
+    switch ( gic_hw_version() )
+    {
+    case GIC_V2:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
+        break;
+
+    case GIC_V3:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
+        break;
+
+    case GIC_INVALID:
+        /*
+         * Running a control domain without having the GIC sorted yet?
+         * Something's broken, but there's nothing we can do about it her=
e=2E
+         */
+        break;
+    }
 }
=20
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index c7cd9b4eb0=2E=2Ed20ebf3644 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -106,6 +106,8 @@ struct xen_sysctl_tbuf_op {
=20
 #if defined(__arm__) || defined(__aarch64__)
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
 #endif
=20
 struct xen_sysctl_physinfo {
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.634.2b000471eaa9bb0e.19f4c5189f9.ac1dba2105c365c7=---

