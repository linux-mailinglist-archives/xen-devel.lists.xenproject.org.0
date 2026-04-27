Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H2ONtJq72nEBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033F473D34
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294881.1571588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQA-00005h-Ho; Mon, 27 Apr 2026 13:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294881.1571588; Mon, 27 Apr 2026 13:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQA-0008VO-De; Mon, 27 Apr 2026 13:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1294881;
 Mon, 27 Apr 2026 13:54:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387bbd000f373@swg.vates.tech>)
 id 1wHMQ9-0008VH-8B
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:54:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQ8-00G6M2-JF
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:54:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387bbd000f373@swg.vates.tech>)
 id 69ef6a97-5cb7-0a2a0a5109dd-0a2a450a90a8-44
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387bbd000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf387bbd000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:38 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E2539865DE;
 Mon, 27 Apr 2026 15:54:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=0Ab05w3Cc3n+I13wVZW7ebdwmBh1B9H+TUWiPdGq5RY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=hUZJV/UxG/DXY7Q8EauK9ziJ/o9/vaV6aUCIfgtk68BL0l3v6s2/G1pEdAuXVPRdvdxJB159Z
 A6J+WWvEfq5RZ36PbaC1wVuiVi/IhFh1r4LaRc2nCZYdY0ctugGRkRiuaMpV2cloOG+H49gu8Gj
 65qzISNWtIegMzUBEAl9NoUTfwSo583o5GPGpGKWlCwJWrbI9sVg/6rknwDeYu5y/1GrSymbdej
 lOgSRKAH3RDrVKlVBt5EVayww+OC+O0Rj9DUYVtVPuxC0SdOuEjBtjNCztQ531SfVtbJSJsACd3
 IsR0z/WBrJl6hQ4a7ymOxZV0wNMgxFdeLFeppj3e63lw==
X-Zone-Loop: 56a54a6456f57479f343e5543d2972b35cf9f7d82bab
x-campaign-type: default
x-transaction-id: 1c3fc14c-551e-4a61-9226-e3a507f66146
x-swg-uid: 01-e1e72c33-c0fb-4343-b56d-cab55ec8025f
X-Mailer: Sweego
Message-ID:
 <1777298078.8631fc262581453bbf619ec5b2062170.19dcf387bbd000f373@vates.tech>
x-swg-bid: 1777298078.8631fc262581453bbf619ec5b2062170.19dcf387bbd000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v4 0/9] x86/hvm: Add Extended MSI destination ID support
Date: Mon, 27 Apr 2026 15:53:57 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2972.abfc823cf368011e.19dcf3879c2.a24ad5d5067271c8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298078147
X-purgate-ID: tlsNG-4011c0/1777298084-80A7F8B7-40F03E11/0/0
X-purgate-type: clean
X-purgate-size: 4541
X-Rspamd-Queue-Id: 9033F473D34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2972.abfc823cf368011e.19dcf3879c2.a24ad5d5067271c8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you very much Roger and Jan for your feedback! I have addressed
your feedback, see below=2E For me there is only one question, I'm not
sure if this is what you had in mind Roger when you wrote:
"Retrofitting the new interface into the old one seems weird=2E  I would
do it the other way around - implement the old bind domctl on top of
an interface that's more suited for the new DM op=2E"
It requires some preparatory work=2E But I tried to make the
restructunring diffs as easy to review as possible by splitting the
refactoring into mutliple steps=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Replaced the v3 approach of extending the XEN_DOMCTL_bind_pt_irq
  gflags ABI (XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK / VMSI_X86_FULL_DEST)
  with raw MSI addr + data storage throughout=2E pt_irq_bind_msi() now
  accepts the raw address + data values and decodes the destination
  internally=2E No public domctl ABI changes
- As suggested by Roger, replaced XEN_DMOP_enable_ext_dest_id (v3 patch
  6, a separate call before domain start) with a flags byte from the
  existing pad[3] field of XEN_DMOP_create_ioreq_server=2E The new
  XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag lets each server signal support
  at registration time and allows the feature to be levelled across all
  servers before arch_domain_creation_finished()
- Redirect xc_domain_{update,unbind}_msi_irq() in libxenctrl to use the
  new DM ops, and reject PT_IRQ_TYPE_MSI in
  XEN_DOMCTL_{bind,unbind}_pt_irq (as suggested by Jan)
- Add three preparatory no-functional-change commits (patches 2-4) that
  wrap the restart block in braces, extract pt_irq_dpci_setup(), and
  extract the PT_IRQ_TYPE_MSI case body into pt_irq_bind_msi(), making
  the interface change in patch 5 reviewable as a clean diff
- Rework ioapic_check() to validate named fields (base_address, APIC ID
  width, ioregsel range) instead of rejecting any non-zero reserved
  bits, which would have falsely rejected RTEs carrying extended
  destination IDs
---
Julian Vetter (9):
  x86/vioapic: Add ioapic_check() to validate IO-APIC state before
    restore
  x86/passthrough: Wrap pt_irq_create_bind() restart block in braces
  x86/passthrough: Extract pt_irq_dpci_setup() from pt_irq_create_bind()
  x86/passthrough: Extract PT_IRQ_TYPE_MSI body into pt_irq_bind_msi()
  x86/passthrough: Introduce pt_irq_bind_msi() as canonical MSI bind
    path
  x86/hvm: Support extended destination IDs in virtual MSI and IO-APIC
  x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM ops
  hvm/ioreq: Negotiate extended destination ID support per ioreq server
  x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID when device model opts
    in

 tools/include/xendevicemodel=2Eh          |  34 +-
 tools/libs/ctrl/xc_devicemodel_compat=2Ec |   2 +-
 tools/libs/ctrl/xc_domain=2Ec             |  52 ++--
 tools/libs/devicemodel/core=2Ec           |  41 ++-
 xen/arch/arm/ioreq=2Ec                    |   5 +
 xen/arch/x86/cpuid=2Ec                    |  13 +
 xen/arch/x86/domain=2Ec                   |  10 +
 xen/arch/x86/domctl=2Ec                   |  10 +-
 xen/arch/x86/hvm/dm=2Ec                   |  68 ++++
 xen/arch/x86/hvm/ioreq=2Ec                |  37 +++
 xen/arch/x86/hvm/irq=2Ec                  |   9 +-
 xen/arch/x86/hvm/vioapic=2Ec              |  50 ++-
 xen/arch/x86/hvm/vmsi=2Ec                 |  54 +---
 xen/arch/x86/include/asm/hvm/domain=2Eh   |   9 +
 xen/arch/x86/include/asm/hvm/hvm=2Eh      |   4 +-
 xen/arch/x86/include/asm/hvm/irq=2Eh      |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic=2Eh  |  12 +
 xen/arch/x86/include/asm/msi=2Eh          |  18 +-
 xen/common/ioreq=2Ec                      |  13 +-
 xen/drivers/passthrough/x86/hvm=2Ec       | 396 ++++++++++++++----------
 xen/include/public/arch-x86/hvm/save=2Eh  |  21 +-
 xen/include/public/hvm/dm_op=2Eh          |  53 +++-
 xen/include/xen/iommu=2Eh                 |   3 +
 xen/include/xen/ioreq=2Eh                 |  27 ++
 xen/include/xlat=2Elst                    |   2 +
 25 files changed, 703 insertions(+), 244 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2972.abfc823cf368011e.19dcf3879c2.a24ad5d5067271c8=---

