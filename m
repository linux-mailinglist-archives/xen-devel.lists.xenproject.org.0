Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKvcL4jbDWpN4QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:04:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783025916BD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314136.1584137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjP5-00024H-Rn; Wed, 20 May 2026 16:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314136.1584137; Wed, 20 May 2026 16:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjP5-00021h-Nj; Wed, 20 May 2026 16:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1314136;
 Wed, 20 May 2026 16:04:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@swg.vates.tech>)
 id 1wPjP4-00021U-TG
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:04:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjP4-004euV-8b
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:04:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@swg.vates.tech>)
 id 6a0ddb77-5cb7-0a2a0a5109dd-0a2a4506c1f4-24
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:04:14 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@swg.vates.tech>)
 id 6a0ddb7d-7371-0a2a45060019-b9ff1c229eef-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:04:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e46215cd2000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 16:04:12 +0000
Received: from bazzite.gpn.vates.fr (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 53E67867FE;
 Wed, 20 May 2026 18:04:11 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=XwTgf/QRiMFLHiS2rUGitIqoTNX+K/UmZ4oVh4h0AtU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=XUxsWo5EB5rg39+krIRUyo+yv+LMFg+YEdlymDzsx6yXZgRXy7Nk+iaaNdV9zVDW4DUfkNZN3
 UwxVK5XGoYzungnekj1KocC1/f4s2EgUEPpegAsutSSeTxL52/GZffS81+bxjjAA+xM86tsNUWP
 vr9k7RE9ZYRXp2NHXN7wJ6g6Tmzv5/PXZ+LFczk9FEihaUawMAwv/2zBwyK7jDl8gf1S9FNMtVw
 M1tYOEtH/tXA7yQc/a9aCuYJO2ifbg+2nLrRKKS0oC0yEO8i1BdaYlhDABuEkhdyoorlEtxgbjq
 1kS4GX2pDU/VC3LWgMY9xOxgaFS6LP3a/tv06r0/7Zog==
X-Zone-Loop: 4805e9105c4b156d5dfb6979429bbce12af117822890
x-campaign-type: default
x-transaction-id: c0c50a56-19a7-4768-8382-0746779003c1
x-swg-uid: 01-1e7a0ea8-032f-412d-80cb-89665e8560fb
X-Mailer: Sweego
Message-ID:
 <1779293052.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@vates.tech>
x-swg-bid: 1779293052.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373
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
Subject: [PATCH] docs: Update console=pv requirement
Date: Wed, 20 May 2026 18:03:45 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1072.4d949d962ea7e0dd.19e46215a78.4bbfb8025a971d63=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779293051512
X-purgate-ID: tlsNG-16d1c6/1779293054-86168D75-A274F77A/0/0
X-purgate-type: clean
X-purgate-size: 1591
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 783025916BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1072.4d949d962ea7e0dd.19e46215a78.4bbfb8025a971d63=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

PV console doesn't require Xen to be running as a shim and only
requires CONFIG_XEN_GUEST and running as a Xen guest=2E Update the
documentation accordingly=2E

Fixes: 4f6609d6a665 ("x86/guest: use PV console for Xen/Dom0 I/O")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 docs/misc/xen-command-line=2Epandoc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line=2Epandoc b/docs/misc/xen-command-l=
ine=2Epandoc
index 52d4ca0f2f=2E=2Ed46d5b2152 100644
--- a/docs/misc/xen-command-line=2Epandoc
+++ b/docs/misc/xen-command-line=2Epandoc
@@ -446,8 +446,9 @@ the converse; transmitted and received characters will=
 have their MSB
 cleared=2E  This allows a single port to be shared by two subsystems
 (e=2Eg=2E console and debugger)=2E
=20
-`pv` indicates that Xen should use Xen's PV console=2E This option is
-only available when used together with `pv-in-pvh`=2E
+`pv` indicates that Xen should use Xen's PV console=2E This option requir=
es
+Xen running as a Xen guest=2E and is only available if the hypervisor was
+compiled with `CONFIG_XEN_GUEST` enabled=2E
=20
 `dbgp` or `ehci` indicates that Xen should use a USB2 debug port=2E
=20
--=20
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1072.4d949d962ea7e0dd.19e46215a78.4bbfb8025a971d63=---

