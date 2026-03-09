Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIB9Kpi9rmlEIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B618238DC9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249406.1546871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlM-0005Yn-QG; Mon, 09 Mar 2026 12:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249406.1546871; Mon, 09 Mar 2026 12:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlM-0005V8-Mm; Mon, 09 Mar 2026 12:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1249406;
 Mon, 09 Mar 2026 12:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTqT=BJ=bounce.vates.tech=bounce-md_30504962.69aebd88.v1-d8fdfcace5ef4539a0100fc8b528ea67@srs-se1.protection.inumbo.net>)
 id 1vzZlL-0005Rg-08
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:07 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d741b392-1bb3-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 13:31:05 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fTxFN4WnPz3XY
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d8fdfcace5ef4539a0100fc8b528ea67; Mon, 09 Mar 2026 12:31:04 +0000
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
X-Inumbo-ID: d741b392-1bb3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059464; x=1773329464;
	bh=8FwzySD+VeRkqwNwwXfc+WPkvCmclVAnI84/IjWUKr8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DayO3pkTxMSxj2crN/XuedBvQAcLuCPvhClPTG8WAfDUCtOGC/0Uhs3lQULL2ALCk
	 nCo+5jUp8tdPdIgDkhJjlIk8jZS6GZNo8mptT+rSsgh8r1pG77NMw+/5/dmqdmYjLH
	 5epSZ6OYkbLMkW+ecNLu17v/etX31oB5QZTFWvPk/AHUI+Ywdy8hZHyD5NvAexgZGX
	 KtVV6KB0SgnkN40ah7ZP4+RCo5Lilyr6JEHC8Mo09zkDkymRWYoaq58TANQy/Q+gxp
	 YT98rVTFJPhpx/NF05GzpE8bxjCkG4UrURO2Jl6vt+PCNpQKMWQBrfCV6YWJ7m0mcY
	 ydm0h/nfB6HuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059464; x=1773319964; i=julian.vetter@vates.tech;
	bh=8FwzySD+VeRkqwNwwXfc+WPkvCmclVAnI84/IjWUKr8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HyiVpcp/2a1swNSndKKpodpq10hyD8LvqiN9/+/aa3P5tC9zEKyubtXVn7vOUj02F
	 oWNxLjQmYVaaXIiEdR6oMgpqbIkRzvDX18Cnlsw2rnsHuk2ihC0GgrGxOmhT1YIKuv
	 gmSVSkY3MOa1q7ON6mvhpRw2CT3z5//jcS9kGMYUQ3uR9ccDtQWBt7nXVLOY9a+DFu
	 lXijYXiQoJWTRWKIxmZZ0JBEz1/BcH5xtGE3pfJEmxUEckhoVwZZYqSHKN7EmLctbe
	 Fcej+8YS4Wx+61MI/SzjGdJTTVHOE3krefmTjZhYk1QI/nulZ5lFUfqafzbI3NsMRa
	 rhWYvAnhEl+Cg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=207/7]=20x86/cpuid:=20Advertise=20XEN=5FHVM=5FCPUID=5FEXT=5FDEST=5FID=20when=20device=20model=20opts=20in?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059463359
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-7-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d8fdfcace5ef4539a0100fc8b528ea67?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3B618238DC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.351];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Set the XEN_HVM_CPUID_EXT_DEST_ID bit in the HVM hypervisor CPUID leaf
only when the device model has called XEN_DMOP_enable_ext_dest_id,
signalling it will use XEN_DMOP_bind_pt_msi_irq for passthrough MSIs.
This guarantees that Xen will decode the extended destination bits from
the raw MSI address internally, so the device model does not need to
understand the encoding itself. This ensures that an old device model
that still uses XEN_DOMCTL_bind_pt_irq will not trigger extended ID
usage in the guest, preserving backwards compatibility. However a device
model that calls XEN_DMOP_enable_ext_dest_id then has to use
XEN_DMOP_{bind,unbind}_pt_msi_irq, and enables support for x2APIC
destination IDs above 255.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- Addressed feedback from Jan and Roger -> Don't advertise the
  XEN_HVM_CPUID_EXT_DEST_ID unconditionally
---
 xen/arch/x86/cpuid.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 5decfad8cd..c1f82f83ea 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -148,6 +148,18 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /*
+         * Advertise extended destination ID support only when the device model
+         * has opted in via XEN_DMOP_enable_ext_dest_id, making sure it will
+         * use XEN_DMOP_bind_pt_msi_irq for passthrough MSI (passing raw
+         * addr/data so Xen can decode extended bits). This allows guests to
+         * use bits 11:5 of the MSI address and bits 55:49 of the IO-APIC RTE
+         * for additional destination ID bits, expanding the addressable APIC
+         * ID range from 8 to 15 bits.
+         */
+        if ( d->arch.hvm.ext_dest_id_enabled )
+            res->a |= XEN_HVM_CPUID_EXT_DEST_ID;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels.
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


