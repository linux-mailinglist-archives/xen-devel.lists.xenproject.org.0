Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGUILeSL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED11433B20
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286512.1567702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBl-0008Dp-Lj; Mon, 20 Apr 2026 20:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286512.1567702; Mon, 20 Apr 2026 20:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBi-0007cK-Sq; Mon, 20 Apr 2026 20:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1286512;
 Mon, 20 Apr 2026 19:55:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEui4-0006Ux-SH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEui2-009FYh-NH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68476-2eae-0a2a0a5409dd-0a2a4503a5da-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:08 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683aa-672d-0a2a45030019-22cac1c5d9d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:07 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:56 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=JWYWRquuSTuhciHLqgYeswBxBv5VcCkgO9tLKcp9bU685iDQuLM/Vwga9hxf0HtCz1rnGyPnhqI2ROb2eGvcedsGtHDyiOcoqU5Yh/ueglfvyLjOG8n6WydAhTsfcrJloa5EWmFwwCKztE28l7gLqAyVn/baLQY3GzTiqqoUPR5JApcTV7kRZxz44xltCmE/ohAVlrCFdWo3aEh6QBEvw1ZMp25JFSS40fBahPK7+R7DYy9qs4Zb6yoYfHbrnvAmjDakXOPGBUv75Hxhbm7TZW1SAzRrxemzqUnpyih6f/YFfNi6ckXP16Ql5aeomQcBnEeVdpxcKWW+leamLbowtA==; s=purelymail1; d=purelymail.com; v=1; bh=cqbeVhxhas1SelZKmRR5Y1Q1CkbmNFmzg1IsVkQqEdU=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Sergej Proskurin <proskurin@sec.in.tum.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 22/43] arm/p2m: Introduce p2m_is_{hostp2m,altp2m}
Date: Mon, 20 Apr 2026 15:50:21 -0400
Message-Id: <20260420195042.207624-23-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-33051d/1776714667-2A567938-7BB031FC/13/0
X-purgate-type: clean
X-purgate-size: 1756
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.891];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AED11433B20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit adds a p2m class to the struct p2m_domain to distinguish
between the host's original p2m and alternate p2m's. The need for this
functionality will be shown in the following commits.

This is commit 11/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v4: Change return type of p2m_is_(hostp2m|altp2m) from bool_t to bool.
---
 xen/arch/arm/include/asm/p2m.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 62261d41e780..8ae0cd7ff589 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -32,6 +32,11 @@ struct domain;
=20
 extern void memory_type_changed(struct domain *d);
=20
+typedef enum {
+    p2m_host,
+    p2m_alternate,
+} p2m_class_t;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -111,6 +116,9 @@ struct p2m_domain {
=20
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
+
+    /* Choose between: host/alternate. */
+    p2m_class_t p2m_class;
 };
=20
 /*
@@ -424,6 +432,16 @@ static inline int get_page_and_type(struct page_info *=
page,
 /* get host p2m table */
 #define p2m_get_hostp2m(d) ((d)->arch.p2m)
=20
+static inline bool p2m_is_hostp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class =3D=3D p2m_host;
+}
+
+static inline bool p2m_is_altp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class =3D=3D p2m_alternate;
+}
+
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
     return true;
--=20
2.34.1


