Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o5U1BePHHmouVAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BC62DDB2
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:09:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=jR00COIh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1324859.1590349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNvR-0003p1-2z; Tue, 02 Jun 2026 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324859.1590349; Tue, 02 Jun 2026 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNvR-0003n5-0J; Tue, 02 Jun 2026 12:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1324859;
 Tue, 02 Jun 2026 12:08:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@swg.vates.tech>)
 id 1wUNvO-0003my-Ev
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:08:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNvN-00B626-PN
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:08:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@swg.vates.tech>)
 id 6a1ec7bf-e002-0a2a0a5209dd-0a2a4509e478-36
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:08:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@swg.vates.tech>)
 id 6a1ec7d1-2497-0a2a45090019-b9ff1c12add7-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:08:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e883c7714000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 02 Jun 2026 12:08:44 +0000
Received: from [192.168.1.97] (unknown [82.67.211.29])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id B5E0E86DF4;
 Tue,  2 Jun 2026 14:08:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=w1JLD++tNFJ1ZcJNQtJsak2cS/yy5vu4rUKf6VqF9v4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jR00COIhzFLmsbj8HEAi2eiC3J8J4pUOv18T1SPMleY7yjJy30Fpl1V3NPBKu1AsrIVjF0HRo
 vPq2YckynNJnzjjglRd0UmsfoGeyzxB7SLNLv7HsVTJ2jYBIp1Q7XVb2aPmPYiDBNJis7lVufrv
 jwgjQ0E5UYXP/iEKZPymTZIACxNMNn7svQO1NvdOguBwwhsx20uy9zF+N7srCs32kRAeNR8QD6S
 gnoq7I9Bvhypie0joSKqOaw4ZHWXk1An+ZXEj2vOluVaZ+QaVUnd4/w7pxRfVtkF/uV3En5rCAr
 8gCGmDkrDkYfZlRXYyp10XAFt3u412fOIEI5lnRuGqew==
X-Zone-Loop: dbbb8aa0b7dfe156f489a5e59c8bb73e4bddf6b7e131
x-campaign-type: default
x-transaction-id: c9c78e01-3ea0-4eff-805e-edc1fa30b1d8
x-swg-uid: 01-1f43129e-f5d4-4ac7-9163-ed48811e8d3e
X-Mailer: Sweego
Message-ID:
 <1780402124.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@vates.tech>
x-swg-bid: 1780402124.8631fc262581453bbf619ec5b2062170.19e883c7714000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 2 Jun 2026 14:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] x86/hvm: Add Extended MSI destination ID support
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1b18.bc89048f0ad40111.19e883c74c7.d3ea7f7554ff5be7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780402123976
X-purgate-ID: tlsNG-bad1c0/1780402129-89174A53-E9CCEFB7/0/0
X-purgate-type: clean
X-purgate-size: 4997
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:from_mime,vates.tech:url];
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
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 567BC62DDB2

---=Part.1b18.bc89048f0ad40111.19e883c74c7.d3ea7f7554ff5be7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you Teddy for your feedback on the patchset=2E Jan and Roger do you=
=20
have any additional remarks on the patchset? Is the new structure what=20
you had in mind Roger?

Thank you=2E

Julian

On 4/27/26 15:54, Julian Vetter wrote:
> Thank you very much Roger and Jan for your feedback! I have addressed
> your feedback, see below=2E For me there is only one question, I'm not
> sure if this is what you had in mind Roger when you wrote:
> "Retrofitting the new interface into the old one seems weird=2E  I would
> do it the other way around - implement the old bind domctl on top of
> an interface that's more suited for the new DM op=2E"
> It requires some preparatory work=2E But I tried to make the
> restructunring diffs as easy to review as possible by splitting the
> refactoring into mutliple steps=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - Replaced the v3 approach of extending the XEN_DOMCTL_bind_pt_irq
>    gflags ABI (XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK / VMSI_X86_FULL_DEST=
)
>    with raw MSI addr + data storage throughout=2E pt_irq_bind_msi() now
>    accepts the raw address + data values and decodes the destination
>    internally=2E No public domctl ABI changes
> - As suggested by Roger, replaced XEN_DMOP_enable_ext_dest_id (v3 patch
>    6, a separate call before domain start) with a flags byte from the
>    existing pad[3] field of XEN_DMOP_create_ioreq_server=2E The new
>    XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag lets each server signal suppor=
t
>    at registration time and allows the feature to be levelled across all
>    servers before arch_domain_creation_finished()
> - Redirect xc_domain_{update,unbind}_msi_irq() in libxenctrl to use the
>    new DM ops, and reject PT_IRQ_TYPE_MSI in
>    XEN_DOMCTL_{bind,unbind}_pt_irq (as suggested by Jan)
> - Add three preparatory no-functional-change commits (patches 2-4) that
>    wrap the restart block in braces, extract pt_irq_dpci_setup(), and
>    extract the PT_IRQ_TYPE_MSI case body into pt_irq_bind_msi(), making
>    the interface change in patch 5 reviewable as a clean diff
> - Rework ioapic_check() to validate named fields (base_address, APIC ID
>    width, ioregsel range) instead of rejecting any non-zero reserved
>    bits, which would have falsely rejected RTEs carrying extended
>    destination IDs
> ---
> Julian Vetter (9):
>    x86/vioapic: Add ioapic_check() to validate IO-APIC state before
>      restore
>    x86/passthrough: Wrap pt_irq_create_bind() restart block in braces
>    x86/passthrough: Extract pt_irq_dpci_setup() from pt_irq_create_bind(=
)
>    x86/passthrough: Extract PT_IRQ_TYPE_MSI body into pt_irq_bind_msi()
>    x86/passthrough: Introduce pt_irq_bind_msi() as canonical MSI bind
>      path
>    x86/hvm: Support extended destination IDs in virtual MSI and IO-APIC
>    x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM ops
>    hvm/ioreq: Negotiate extended destination ID support per ioreq server
>    x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID when device model opts
>      in
>=20
>   tools/include/xendevicemodel=2Eh          |  34 +-
>   tools/libs/ctrl/xc_devicemodel_compat=2Ec |   2 +-
>   tools/libs/ctrl/xc_domain=2Ec             |  52 ++--
>   tools/libs/devicemodel/core=2Ec           |  41 ++-
>   xen/arch/arm/ioreq=2Ec                    |   5 +
>   xen/arch/x86/cpuid=2Ec                    |  13 +
>   xen/arch/x86/domain=2Ec                   |  10 +
>   xen/arch/x86/domctl=2Ec                   |  10 +-
>   xen/arch/x86/hvm/dm=2Ec                   |  68 ++++
>   xen/arch/x86/hvm/ioreq=2Ec                |  37 +++
>   xen/arch/x86/hvm/irq=2Ec                  |   9 +-
>   xen/arch/x86/hvm/vioapic=2Ec              |  50 ++-
>   xen/arch/x86/hvm/vmsi=2Ec                 |  54 +---
>   xen/arch/x86/include/asm/hvm/domain=2Eh   |   9 +
>   xen/arch/x86/include/asm/hvm/hvm=2Eh      |   4 +-
>   xen/arch/x86/include/asm/hvm/irq=2Eh      |   4 +-
>   xen/arch/x86/include/asm/hvm/vioapic=2Eh  |  12 +
>   xen/arch/x86/include/asm/msi=2Eh          |  18 +-
>   xen/common/ioreq=2Ec                      |  13 +-
>   xen/drivers/passthrough/x86/hvm=2Ec       | 396 ++++++++++++++--------=
--
>   xen/include/public/arch-x86/hvm/save=2Eh  |  21 +-
>   xen/include/public/hvm/dm_op=2Eh          |  53 +++-
>   xen/include/xen/iommu=2Eh                 |   3 +
>   xen/include/xen/ioreq=2Eh                 |  27 ++
>   xen/include/xlat=2Elst                    |   2 +
>   25 files changed, 703 insertions(+), 244 deletions(-)
>=20



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1b18.bc89048f0ad40111.19e883c74c7.d3ea7f7554ff5be7=---

