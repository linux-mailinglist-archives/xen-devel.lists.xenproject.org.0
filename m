Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5WtbCgH6UGpZ9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:56:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B073B7B0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=euy1hHuz;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359398.1612979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBhx-00041K-I8; Fri, 10 Jul 2026 13:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359398.1612979; Fri, 10 Jul 2026 13:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBhx-0003yc-FI; Fri, 10 Jul 2026 13:56:01 +0000
Received: by outflank-mailman (input) for mailman id 1359398;
 Fri, 10 Jul 2026 13:55:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5034ae000edb5@swg.vates.tech>)
 id 1wiBhv-0003yV-AK
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:55:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBhu-00F36p-NI
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:55:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5034ae000edb5@swg.vates.tech>)
 id 6a50f9d4-bab6-0a2a0a5309dd-0a2a4507a808-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:55:58 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5034ae000edb5@swg.vates.tech>)
 id 6a50f9ee-ac46-0a2a45070019-b9ff1c238b6b-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:55:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c5034ae000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:55:52 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AD8D1820AB;
 Fri, 10 Jul 2026 15:55:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YGzIC8DFv3AcfD2nvL4tjjOdDOqJRfgBCsf3p5fTo9c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=euy1hHuzBRLuIYuholcj1Gp7W+As2VDipVmh0hUNRb85F3JdcAE/ES5CqNvPeymcIWe3dbwdK
 ovQ4s/QUcGXGKL7eqfSkdwh0FTIrzOOjJuKf0Jui6u0MMSFCm6DXd+diW+qnmtKOIJbzORrrxgq
 D7L2rV3LVlvSyWuubgSlvW2GJSyDFwWcVbDmgjK71wKB2sDFiSym6NPGt+grgLWL6EsIssyDUal
 n9GHb0gc/7NCGTsrFBFaKQ44jA20wgkJej7gqF7MeyB0bYRGU0rSNzLDRSULtDAjEH/mjQ+g9ag
 DAY6JAG7tGmXnjgut6YhlQmo1oYN9WoVhvZO/OxSmUQA==
X-Zone-Loop: 48d887abb84af2a0aadde9ee0e8ea12dbe0cab011000
x-campaign-type: default
x-transaction-id: 501df9d0-3cba-44af-9a20-377aec980aca
x-swg-uid: 01-d067762b-07b5-47e7-b21a-9798e1dcca34
X-Mailer: Sweego
Message-ID:
 <1783691752.8631fc262581453bbf619ec5b2062170.19f4c5034ae000edb5@vates.tech>
x-swg-bid: 1783691752.8631fc262581453bbf619ec5b2062170.19f4c5034ae000edb5
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
Subject: [PATCH v2 0/6] Fix ARM domcreate
Date: Fri, 10 Jul 2026 15:55:03 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.632.960184aa63f693ee.19f4c503258.e86d886d4e64a6d9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691752025
X-purgate-ID: tlsNG-ef75cf/1783691758-1FB61201-1E2762C7/0/0
X-purgate-type: clean
X-purgate-size: 3659
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A3B073B7B0

---=Part.632.960184aa63f693ee.19f4c503258.e86d886d4e64a6d9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Andrew and Teddy,
thank you for your feedback=2E I have looked into your branch and the
feedback you gave me=2E I have added 5 patches on top of my original one=
=2E
One of your patches I kept as is, and the other 2 I filled in the gaps=2E
Then I added 2 patches on top, which ensure that the GIC version is now
properly reported via XEN_DOMCTL_getdomaininfo and the frequency
reported via sysctl physinfo as you suggested=2E And a final one which
makes the config argument to arch_sanitise_domain_config const=2E

I'm only wondering about two things=2E The uint32_t pad in
xen_sysctl_physinfo can I simply use this for the clock_frequency? And
second, in your patch "arm remove native", you removed the
XEN_DOMCTL_CONFIG_GIC_NATIVE but didn't bump the
XEN_DOMCTL_INTERFACE_VERSION=2E Do we actually need to bump the version?

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- Added 5 new patches to address the remaining problem that
  DOMCTL_createdomain on ARM is sneaking out some parameters back to the
  toolstack (i=2Ee=2E, GIC version and timer frequency), where the config
  parameter is supposed to be just an IN parameter
---
Andrew Cooper (3):
  ARM/sysctl: Expose the supported guest GIC modes in physinfo
  xen/arm: choose GIC version explicitly instead of GIC_NATIVE
  xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI

Julian Vetter (3):
  xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
  xen/arm: report clock_frequency via sysctl physinfo, not createdomain
  xen: make config argument const

 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 21 ++++++++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 28 +++++++++++++++---
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 +++++++++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 +-
 xen/arch/arm/domain=2Ec                         | 29 +++++++------------
 xen/arch/arm/domain_build=2Ec                   |  3 +-
 xen/arch/arm/domctl=2Ec                         |  2 ++
 xen/arch/arm/firmware/sci=2Ec                   |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec              |  2 +-
 xen/arch/arm/gic=2Ec                            | 16 ++++++++++
 xen/arch/arm/include/asm/firmware/sci=2Eh       |  6 ++--
 xen/arch/arm/include/asm/gic=2Eh                |  6 ++++
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         | 29 +++++++++++++++++++
 xen/arch/arm/vtimer=2Ec                         |  4 +--
 xen/arch/ppc/stubs=2Ec                          |  2 +-
 xen/arch/riscv/domain=2Ec                       |  2 +-
 xen/arch/x86/domain=2Ec                         | 16 +++++-----
 xen/include/public/arch-arm=2Eh                 | 17 +----------
 xen/include/public/domctl=2Eh                   |  4 +--
 xen/include/public/sysctl=2Eh                   | 15 +++++++++-
 xen/include/xen/sched=2Eh                       |  6 ++--
 26 files changed, 170 insertions(+), 68 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.632.960184aa63f693ee.19f4c503258.e86d886d4e64a6d9=---

