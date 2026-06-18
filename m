Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1tqwHiMHNGoCLgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43856A10F6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=JgIHWLoC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341288.1601844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAO-00035c-MH; Thu, 18 Jun 2026 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341288.1601844; Thu, 18 Jun 2026 14:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAO-0002zp-6v; Thu, 18 Jun 2026 14:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1341288;
 Thu, 18 Jun 2026 14:56:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 1waEAM-0002fb-Un
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAM-002Mnm-Ah
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 6a34071a-2eae-0a2a0a5409dd-0a2a4502dd68-2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-18
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b5d89000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:56:01 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C5D1C869EE;
 Thu, 18 Jun 2026 16:56:00 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fRXMaPeHOTuWlIP0v2b1JaYKKB7FB37YvQSUSsGNDqE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JgIHWLoCu+O46wvh7+cHPSUv2hqzD4HiYSiDR4tJSe+TubtFoS54rcNjKdCKjxMMwwekrB4vd
 n8DyhBLK1NXqp7dAkgPIVZv6/SpKN+VDBhZAuxw6Df9NWPDK/JRGS1grHbiYlW+DSxdaA6u5MP3
 9BbqbTn+iTQrXgT8F4r/BjXlThztij0FC++iyIbUKWJyUntaW5Rt8r3x98jWbDb+PI9F3jg/z9c
 YJk608KRERkdgHdjablZevDeiPI+cm3K5FuxDQugzajFfkjuopUHT/72K2RJ1IaBkjTZhjOUy5p
 wtuKxMMWdGdnSIt5wSym7Lqezwjuel0lks7V2hIbhCtQ==
X-Zone-Loop: d2e82ef63d5983737220f029feb7452e993ba78d11bc
x-campaign-type: default
x-transaction-id: deb5d271-f86f-4b7c-82fb-2287fdbb1a19
x-swg-uid: 01-3293f81d-489e-47ef-83df-4fdd94796a0a
X-Mailer: Sweego
Message-ID:
 <1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@vates.tech>
x-swg-bid: 1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b
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
Subject: [RFC PATCH v2 15/15] docs: Document support for PCI segment in dbgp and comN parameter
Date: Thu, 18 Jun 2026 16:50:39 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794561011
X-purgate-ID: tlsNG-720697/1781794586-460643F3-C6F86228/0/0
X-purgate-type: clean
X-purgate-size: 3120
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
X-Rspamd-Queue-Id: E43856A10F6

---=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that we accept full PCI SBDF (with segments), update the documentation
accordingly=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
In principle, it's correct, but I don't think ECAM is usable
at the moment EHCI dbgp is initialized, which would prevent
the device from being probed correctly if it's not on segment 0=2E

Same remark for comN=2E
---
 docs/misc/xen-command-line=2Epandoc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line=2Epandoc b/docs/misc/xen-command-l=
ine=2Epandoc
index 1c711fa980=2E=2E3b35a1962c 100644
--- a/docs/misc/xen-command-line=2Epandoc
+++ b/docs/misc/xen-command-line=2Epandoc
@@ -349,7 +349,7 @@ ACPI indicating none to be there=2E
=20
 ### com1 (x86)
 ### com2 (x86)
-> `=3D <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<p=
ort-bdf>][,[<bridge-bdf>]]]]]]`
+> `=3D <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<p=
ort-sbdf>][,[<bridge-sbdf>]]]]]]`
=20
 Both option `com1` and `com2` follow the same format=2E
=20
@@ -371,10 +371,10 @@ Both option `com1` and `com2` follow the same format=
=2E
   registers=2E
 * `<irq>` is the IRQ number to use, or `0` to use the UART in poll
   mode only, or `msi` to set up a Message Signaled Interrupt=2E
-* `<port-bdf>` is the PCI location of the UART, in
-  `<bus>:<device>=2E<function>` notation=2E
-* `<bridge-bdf>` is the PCI bridge behind which is the UART, in
-  `<bus>:<device>=2E<function>` notation=2E
+* `<port-sbdf>` is the PCI location of the UART, in
+  `[<seg>:]<bus>:<device>=2E<function>` notation=2E
+* `<bridge-sbdf>` is the PCI bridge behind which is the UART, in
+  `[<seg>:]<bus>:<device>=2E<function>` notation=2E
 * `pci` indicates that Xen should scan the PCI bus for the UART,
   avoiding Intel AMT devices=2E
 * `amt` indicated that Xen should scan the PCI bus for the UART,
@@ -731,11 +731,11 @@ for the `all` value=2E If that isn't intended, raise
 the `sched_credit2_max_cpus_runqueue` value=2E
=20
 ### dbgp
-> `=3D ehci[ <integer> | @pci<bus>:<slot>=2E<func> ]`
-> `=3D xhci[ <integer> | @pci<bus>:<slot>=2E<func> ][,share=3D<bool>|hwdo=
m]`
+> `=3D ehci[ <integer> | @pci[<seg>:]<bus>:<slot>=2E<func> ]`
+> `=3D xhci[ <integer> | @pci[<seg>:]<bus>:<slot>=2E<func> ][,share=3D<bo=
ol>|hwdom]`
=20
 Specify the USB controller to use, either by instance number (when going
-over the PCI busses sequentially) or by PCI device (must be on segment 0)=
=2E
+over the PCI busses sequentially in segment 0) or by PCI device=2E
=20
 Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability=2E
 XHCI driver will wait indefinitely for the debug host to connect - make s=
ure
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=---

