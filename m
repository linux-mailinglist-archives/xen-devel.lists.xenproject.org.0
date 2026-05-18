Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCDhDtAuC2plEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160AC56FD6C
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312032.1582213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznq-0002iq-QM; Mon, 18 May 2026 15:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312032.1582213; Mon, 18 May 2026 15:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznq-0002h9-MT; Mon, 18 May 2026 15:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1312032;
 Mon, 18 May 2026 15:22:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@swg.vates.tech>)
 id 1wOznp-0002Td-4j
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzno-00AUfW-Gz
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@swg.vates.tech>)
 id 6a0b2ec3-2eae-0a2a0a5409dd-0a2a4509caf4-2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3bae9f48000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:40 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id BECCD8661A;
 Mon, 18 May 2026 17:22:39 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=/FyGreLLDZbEabwd7OqmbT4bWYZZf0VxeD6lPMrr1B8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=BcCKEOtgVULL7qi/AO3T2kLuaIgj7GC3S6lEi4utsDyCIvqU8RbPh9shJYqfAmPd7PXwjCusW
 KIh+xjrGfScYZsQHUCn1PsgcQ00GMEcHfSQkXewV4cX0Nr+5YmYvuNnck9zkfsVUFozG5C2IF2E
 ihnj/WQnbZkAJ3F7Pt2sBygPvAyU2HMDxv7GQPOqVoJCjHu520cKSsvwYaZecCOWz2S0a4K9b6P
 s6L9hlB6WYaqaIek0u6aWOsHaj+gl+HqTqab0n3YT/jpdm4PHZOHQiYclGIb2PwAVTRN8lwuqi5
 hjwf6s7jslQECFwqwIHHU5hMHvhUprXlNYxVjVqeoA/w==
X-Zone-Loop: 66fe1ffa5720ae89efd99be211315247d6591409955f
x-campaign-type: default
x-transaction-id: 9b0951a2-0cc3-4bec-b8a0-4789a48a5dda
x-swg-uid: 01-bf7e5f9c-3c26-43c3-8d3b-2eed900cc024
X-Mailer: Sweego
Message-ID:
 <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
x-swg-bid: 1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373
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
Subject: [PATCH 1/5] pci: Introduce parse_pci_sbdf{_seg}()
Date: Mon, 18 May 2026 17:21:25 +0200
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e10.d9fc5c64d1b2dcab.19e3bae9dc2.30edf48ed9c9f35b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117759939
X-purgate-ID: tlsNG-bad1c0/1779117764-43B78A53-5C9ECE71/0/0
X-purgate-type: clean
X-purgate-size: 2325
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 160AC56FD6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.e10.d9fc5c64d1b2dcab.19e3bae9dc2.30edf48ed9c9f35b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In many places, we're parsing a PCI string into individual parts
(seg, bus, dev, fn) and then transform it into a pci_sbdf_t using PCI_SBDF
macro=2E Rather than converting from parts to pci_sbdf_t and vice versa,
introduce a new function that parses a PCI string into a pci_sbdf_t struct=
ure
directly=2E

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
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e10.d9fc5c64d1b2dcab.19e3bae9dc2.30edf48ed9c9f35b=---

