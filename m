Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLrbINJq72nEBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A468473D2C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294901.1571669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQX-0002cp-TC; Mon, 27 Apr 2026 13:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294901.1571669; Mon, 27 Apr 2026 13:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQX-0002YI-O3; Mon, 27 Apr 2026 13:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1294901;
 Mon, 27 Apr 2026 13:55:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@swg.vates.tech>)
 id 1wHMQW-0002F4-9t
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:55:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQV-00E50B-MP
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:55:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@swg.vates.tech>)
 id 69ef6abb-bab6-0a2a0a5309dd-0a2a450acb6e-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:07 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf3888b2000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:41 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3D9FE8778D;
 Mon, 27 Apr 2026 15:54:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=cFmZgDov6GQgQw+msTvbp/qJT36OB/1WX31cUGs/5u4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pqFNpNBc07KVabu+s5g0EKJTcksP4bZdyHw5YLPIOGJvp4OveJmEmzA4mHMTNjI03yTBMDsNh
 NXIsVVO0EBwy88HokqacJoDeyJfU2ZhD9g5GGEw2Sr2tDNHojZlQ9oyJfk5AaR03Q4JlJhaNLqY
 jEHz/IcdTfk35TK4FWvmb7iqmqu19xg84MReEdvYQUngfuX7dX1WTtMNXtNcybcdXM7MjkFPv6/
 qpICBojmqwf1y344US+VMRpAmZFoob5onJVCBlH5g8vCNjBswq8Hza7kWfq1GPx889oqoSFzYsV
 JU/I7IU0UGxKSyjExdlMXGdN7uEaBuxzAMt5dtDEbFUg==
X-Zone-Loop: c197ce6d03032c6b3b21ca6b49b3eb05cfcbee729867
x-campaign-type: default
x-transaction-id: ccb19691-937d-4725-b0a4-113534b93343
x-swg-uid: 01-7472ba69-a9a1-4f87-a86a-6ab5022a5d8a
X-Mailer: Sweego
Message-ID:
 <1777298082.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373@vates.tech>
x-swg-bid: 1777298082.8631fc262581453bbf619ec5b2062170.19dcf3888b2000f373
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
Subject: [PATCH v4 9/9] x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID when device model opts in
Date: Mon, 27 Apr 2026 15:54:06 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.297b.fbc1bfd9f0ae3bc.19dcf3886b4.b9ec472d3f1c7cf3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298081460
X-purgate-ID: tlsNG-4011c0/1777298107-819868B7-9B2F6A6C/0/0
X-purgate-type: clean
X-purgate-size: 3537
X-Rspamd-Queue-Id: 3A468473D2C
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

---=Part.297b.fbc1bfd9f0ae3bc.19dcf3886b4.b9ec472d3f1c7cf3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Set the XEN_HVM_CPUID_EXT_DEST_ID bit in the HVM hypervisor CPUID leaf
based on the domain-level ext_dest_id flag, which is locked at domain
creation time by taking the AND across all registered ioreq servers that
set XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID=2E This guarantees that the bit is
only advertised when every active device model will use
XEN_DMOP_bind_pt_msi_irq for passthrough MSIs, so Xen can decode the
extended destination bits from the raw MSI address internally=2E

After creation_finished the locked d->arch=2Ehvm=2Eext_dest_id is used
directly, providing a stable and migration-safe value independent of
whether ioreq servers have been re-registered yet=2E Before
creation_finished the dynamic per-server check is used so toolstack
queries during domain setup reflect the current state=2E

An old device model that never sets XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID
will keep the bit clear, preserving backwards compatibility with guests
that only use 8-bit APIC destination IDs=2E A device model that opts in
enables support for x2APIC destination IDs above 255=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Corresponds to v3 patch 7, updated for the new negotiation mechanism
  introduced in patch 8=2E The bit now reflects the levelled result
  computed at arch_domain_creation_finished()
    - Before creation_finished(): the dynamic hvm_ext_dest_id_enabled()
      check is used (so toolstack CPUID queries during domain setup see
      the current state)
    - After creation_finished(): the locked d->arch=2Ehvm=2Eext_dest_id is=
 used
      directly for migration-safe value that does not depend
      on whether ioreq servers have been re-registered on the
      destination host yet
---
 xen/arch/x86/cpuid=2Ec | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/cpuid=2Ec b/xen/arch/x86/cpuid=2Ec
index 6e9b15c9c3=2E=2E828aaa9f5b 100644
--- a/xen/arch/x86/cpuid=2Ec
+++ b/xen/arch/x86/cpuid=2Ec
@@ -1,3 +1,4 @@
+#include <xen/ioreq=2Eh>
 #include <xen/sched=2Eh>
 #include <xen/types=2Eh>
 #include <xen/version=2Eh>
@@ -148,6 +149,18 @@ static void cpuid_hypervisor_leaves(const struct vcpu=
 *v, uint32_t leaf,
         res->a |=3D XEN_HVM_CPUID_DOMID_PRESENT;
         res->c =3D d->domain_id;
=20
+        /*
+         * Advertise extended destination ID support=2E Once domain creat=
ion has
+         * finished the locked domain flag is authoritative (ensuring a
+         * consistent view across migration, before the device model
+         * re-registers its ioreq servers on the destination)=2E Before
+         * creation_finished the dynamic per-server check is used so that
+         * toolstack queries during domain setup reflect the current stat=
e=2E
+         */
+        if ( d->creation_finished ? d->arch=2Ehvm=2Eext_dest_id
+                                  : hvm_ext_dest_id_enabled(d) )
+            res->a |=3D XEN_HVM_CPUID_EXT_DEST_ID;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels=2E
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.297b.fbc1bfd9f0ae3bc.19dcf3886b4.b9ec472d3f1c7cf3=---

