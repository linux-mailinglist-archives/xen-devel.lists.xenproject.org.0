Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hw5BNgwHNGrqLQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4B6A10B9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Q2YDHqqA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1341260.1601714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9x-0007Bx-Jk; Thu, 18 Jun 2026 14:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341260.1601714; Thu, 18 Jun 2026 14:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9x-00079m-Gp; Thu, 18 Jun 2026 14:56:01 +0000
Received: by outflank-mailman (input) for mailman id 1341260;
 Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3061000701b@swg.vates.tech>)
 id 1waE9v-00079Y-Mi
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waE9u-00Cuxo-MH
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:55:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3061000701b@swg.vates.tech>)
 id 6a3406e3-bab6-0a2a0a5309dd-0a2a4502cae6-48
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:58 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3061000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b3061000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:49 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0C19C86962;
 Thu, 18 Jun 2026 16:55:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3HpuD8CbQNQzkNwb00qC62DDh6JfMa667VCsKxtkQno=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Q2YDHqqA8ilRpPols3SJBq5lHJWqDie7peiyjfjn5o/Ima0m09LN3cuiS8H3URjYzF/ggs/an
 WMtdkVCp4uBYkAmlJheZjP0Iv4+uQ1XQrgBA2YOMqhX0ihfqaMGoZuUdxG6ouWDiWQ231f8u68V
 Bqxkv+6b3Bhk88pe4gjLlRefm+tuwFi8TW63aQpunDZlAniHKESy+SprcATVMsTM1pKP4CqV00p
 p0M5GvRR23gPgWjTVCchkrpEmVaP4y6RcXWycLBa2XJs0+ZaXIl6I7dSxOLtNl0cHcICRKOb6MO
 lk5qIEAx9U67fNlisUEvu74724p3re60Qr1ttyeM/q2A==
X-Zone-Loop: 99f1e1665a08adf6df75a9ba7cf0e0458f3665ad176c
x-campaign-type: default
x-transaction-id: 2e5c8b1f-4d16-48b2-af6b-a83644719617
x-swg-uid: 01-45ff51fc-074f-441a-aa28-9fe15bb26d8c
X-Mailer: Sweego
Message-ID:
 <1781794549.8631fc262581453bbf619ec5b2062170.19edb3b3061000701b@vates.tech>
x-swg-bid: 1781794549.8631fc262581453bbf619ec5b2062170.19edb3b3061000701b
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 00/15] PCI SBDF Refactoring
Date: Thu, 18 Jun 2026 16:50:24 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.687.8fd8f7efaf5149fc.19edb3b2e2c.7974dafa3a696682=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794549292
X-purgate-ID: tlsNG-720697/1781794558-47E773F3-338C37C6/0/0
X-purgate-type: clean
X-purgate-size: 3592
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.17 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81A4B6A10B9

---=Part.687.8fd8f7efaf5149fc.19edb3b2e2c.7974dafa3a696682=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The goal of this series is to make some refactoring of some
pci primitives to improve codegen and make code less verbose=2E

A big chunk of it is converting many places where (seg, bus, dev, fn)
is split into multiples variables and into being just pci_sbdf_t,
in particular in some PCI function parameters to reduce parameter count
which usually translate into less registers to pass to the function=2E
Moreover, we also avoid translating back and forth between pci_sbdf_t
and individual (seg, bus, dev, fn)=2E

No major functional change, aside some parts of the codebase that will
now correctly handle PCI segment when parsed while it was previously
ignored (e=2Eg dbgp)=2E

---
CI: https://gitlab=2Ecom/xen-project/people/tsnake41/xen/-/pipelines/26118=
29865

v2:
 * Dropped "Migrate pci_mmcfg_{read,write}() to pci=2Ec", to be moved in
   a separate series
 * fixed dev_sbdf calculation in acpi_parse_dev_scope()=20
 * Updated documentation on ehci_dbgp now accepting segment parameter
   (but I'm not sure it suffice to allow this interface to use non-0 segme=
nts)
 * Introduced similar changes for pci_prepare_msix(), pci_ro_device(),
   pci_hide_device(), pci_remove_device(), pci_add_device()
   and pci_check_disable_device()
 * Use pci_sbdf_t in struct ehci_dbgp
 * Introduced "vtd: Rewrite igd device check in acpi_parse_dev_scope()"
 * Introduced docs change (RFC)

Teddy Astie (15):
  pci: Introduce parse_pci_sbdf{_seg}()
  vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
  pci: Use pci_sbdf_t in pci_device_detect()
  pci: Parse into pci_sbdf_t directly
  pci: Allow ommiting func when parsing with parse_pci_sbdf()
  pci: Use pci_sbdf_t in pci_prepare_msix()
  pci: Use pci_sbdf_t in pci_ro_device()
  pci: Use pci_sbdf_t in pci_hide_device()
  pci: Use pci_sbdf_t in pci_remove_device()
  pci: Use pci_sbdf_t in pci_add_device()
  vtd: Rewrite igd device check in acpi_parse_dev_scope()
  pci: Use pci_sbdf_t pci_check_disable_device()
  pci: Drop parse_pci{_seg}()
  ehci-dbgp: Use pci_sbdf_t instead of (bus, slot, func)
  RFC: docs: Document support for PCI segment in dbgp and comN parameter

 docs/misc/xen-command-line=2Epandoc          | 16 ++--
 xen/arch/x86/include/asm/msi=2Eh             |  2 +-
 xen/arch/x86/msi=2Ec                         |  4 +-
 xen/arch/x86/physdev=2Ec                     | 20 +++--
 xen/drivers/char/ehci-dbgp=2Ec               | 98 ++++++++--------------
 xen/drivers/char/ns16550=2Ec                 | 27 +++---
 xen/drivers/char/xhci-dbc=2Ec                | 12 +--
 xen/drivers/passthrough/amd/iommu_acpi=2Ec   | 26 +++---
 xen/drivers/passthrough/amd/iommu_detect=2Ec |  7 +-
 xen/drivers/passthrough/amd/iommu_init=2Ec   |  3 +-
 xen/drivers/passthrough/pci=2Ec              | 88 ++++++++++---------
 xen/drivers/passthrough/vtd/dmar=2Ec         | 81 +++++++-----------
 xen/drivers/passthrough/vtd/iommu=2Ec        |  3 +-
 xen/drivers/pci/pci=2Ec                      | 40 +++------
 xen/drivers/pci/physdev=2Ec                  |  4 +-
 xen/drivers/video/vga=2Ec                    |  2 +-
 xen/include/xen/pci=2Eh                      | 20 ++---
 17 files changed, 190 insertions(+), 263 deletions(-)

--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.687.8fd8f7efaf5149fc.19edb3b2e2c.7974dafa3a696682=---

