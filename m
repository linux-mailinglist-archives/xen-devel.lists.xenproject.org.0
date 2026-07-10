Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FX3kGlz6UGp/9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE373B822
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=LP2gHFIP;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359408.1613014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjX-0005Np-Mo; Fri, 10 Jul 2026 13:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359408.1613014; Fri, 10 Jul 2026 13:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjX-0005Ln-JP; Fri, 10 Jul 2026 13:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1359408;
 Fri, 10 Jul 2026 13:57:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@swg.vates.tech>)
 id 1wiBjW-0005GW-5N
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:57:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBjV-00HA2i-I7
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:57:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@swg.vates.tech>)
 id 6a50fa48-5cb7-0a2a0a5109dd-0a2a4508be1e-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@swg.vates.tech>)
 id 6a50fa51-ee29-0a2a45080019-b9ff1c228949-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c519a02000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:57:24 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 57F8A820B8;
 Fri, 10 Jul 2026 15:57:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=eAaLaXlpBauEL4r5P7aIi0dp5PRbO/R+qCiYFdB+CdM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LP2gHFIPKmCYdOgDYBIvA2p+SeOnMF6brUCYnQD7AdsJkqkPpJs7cZnBFJutKRMyQxIr11CUA
 3L9rRaFpPQSmlBawLWGQ1lobi2mOpTg+iZx4S15WRUbcj6HfKrDCNiBXvygPTPte2wnIGg3uvdc
 XcRE9vIk6DacG+AK2FdEtI6ftLoq1IKJtkPqURkeOdbNbHcTn/9SMZsLFw1DbLvHP82+OI6wyO+
 hkDNHg8CRQlzUH5Ci0vFO/NSbAZJX8XQrJ6UvXLFM4tpQIgaWE/KYhTCfbIzwN51//ENvjcWaRu
 MbvBu/ZrM1ZB//3g0X5TJP3klzdyfXjYjHN42snhu/zw==
X-Zone-Loop: 3c0e5d21878ce0d047bbbe7f94d0d927fc1facacecd3
x-campaign-type: default
x-transaction-id: 2de40a2b-346e-4036-8796-11ccf513b9b4
x-swg-uid: 01-65c0f6b8-9696-4d48-a4ca-aa66e27d7d64
X-Mailer: Sweego
Message-ID:
 <1783691844.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@vates.tech>
x-swg-bid: 1783691844.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5
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
Subject: [PATCH v2 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
Date: Fri, 10 Jul 2026 15:57:09 +0200
In-Reply-To: <20260710135711.301993-1-julian.vetter@vates.tech>
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.636.de11ae9dddd797a1.19f4c51983e.163d8b81b304f109=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691843646
X-purgate-ID: tlsNG-c1860d/1783691857-7A02C01C-D85BB92C/0/0
X-purgate-type: clean
X-purgate-size: 2192
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 1ACE373B822

---=Part.636.de11ae9dddd797a1.19f4c51983e.163d8b81b304f109=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Now that nothing resolves or relies on GIC_NATIVE (the previous patch
moved that decision entirely into the toolstack and Xen's own dom0/
dom0less builders), drop it from the public ABI=2E Every caller must
now request a concrete GIC_V2 or GIC_V3=2E

This is an incompatible change for any toolstack still passing 0
(formerly GIC_NATIVE) expecting Xen to auto-select a version, so bump
XEN_DOMCTL_INTERFACE_VERSION=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 xen/include/public/arch-arm=2Eh | 1 -
 xen/include/public/domctl=2Eh   | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/arch-arm=2Eh b/xen/include/public/arch-arm=
=2Eh
index 7d6f87e8b2=2E=2E6987f5bdf4 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
@@ -319,7 +319,6 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
  * struct xen_arch_domainconfig's ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION=2E
  */
-#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
=20
diff --git a/xen/include/public/domctl=2Eh b/xen/include/public/domctl=2Eh
index 510300bb67=2E=2E4ca8a2d7ca 100644
--- a/xen/include/public/domctl=2Eh
+++ b/xen/include/public/domctl=2Eh
@@ -30,9 +30,9 @@
  * fields) don't require a change of the version=2E
  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
- * Last version bump: Xen 4=2E22
+ * Last version bump: Xen 4=2E23
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000019
=20
 /*
  * NB=2E xen_domctl=2Edomain is an IN/OUT parameter for this operation=2E
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.636.de11ae9dddd797a1.19f4c51983e.163d8b81b304f109=---

