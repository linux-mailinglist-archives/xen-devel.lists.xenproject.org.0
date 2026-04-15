Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLvZNnaT32kjWQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB728404D18
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282447.1565023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lp-00005h-J4; Wed, 15 Apr 2026 13:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282447.1565023; Wed, 15 Apr 2026 13:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lp-0008UH-GE; Wed, 15 Apr 2026 13:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1282447;
 Wed, 15 Apr 2026 13:32:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df935e.v1-1a795d0610064f5681462d6652086e28@bounce.vates.tech>)
 id 1wD0Lo-0008UB-Mh
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:32:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0Lo-00Ad2n-35
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:32:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df935e.v1-1a795d0610064f5681462d6652086e28@bounce.vates.tech>)
 id 69df9358-2eae-0a2a0a5409dd-0a2a450cbe98-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:16 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df935e.v1-1a795d0610064f5681462d6652086e28@bounce.vates.tech>)
 id 69df935e-f40c-0a2a450c0019-c602bb0e1bb3-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:15 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fwhrt474bz8XSCwc
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1a795d0610064f5681462d6652086e28; Wed, 15 Apr 2026 13:32:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259934; x=1776529934;
	bh=3eORvMGgdV2JgrkelULgZntYhi01D/h/hCD6psmBUzQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=15Gve7/aVyAjshyU9xqF45HVlaLk1cz2WuA1ckl8tNQwsy90JF/oFEeCrjj0xw276
	 R+XcfCczNFmqTM8hr8IBzKxkXui5UbNwCXO+NdoSiu70KgoMZjbZDEusRsVJrm8wdB
	 y/WGMjtAt2ZZ+o6oKt5xXHzhH0DbfbEggDD53sG20tR/+g1u3MMx15bcF8Gw0W88M8
	 4+AqL8+JdBeynymMfBd8N3O20FongqlicGGCdv1aEsB1FX/bqj9bQkYwWGwYtnPqXE
	 D/K5lsLZeFPFiDa5I6PvyCnV8gtvkHaeSgip9Rrkga3DFngA9FqHgUiua4S8Sio+m1
	 Jd0lhbd7Hl5Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259934; x=1776520434; i=teddy.astie@vates.tech;
	bh=3eORvMGgdV2JgrkelULgZntYhi01D/h/hCD6psmBUzQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aewLOIUc21gakTYdJKuHjfeDFOm3ibWen26ACcWO78RBFuXCYlAaocdFPenc56U8T
	 UsMH9fXjPDtKuvSiPrvyzmlXCpgsRi81mAu7lPxPl+Tp88Sg08b4Y4KpqR/Ukrvtav
	 JrxaNgimXczfB6bbpaajTnMUSs7DT96FcG+TEorDqKye7Qk2b2IrlkgVJodVhdL6rS
	 KlNux50R7fFsQhZ7BSDY7c0ai9tDLP+2ph7uTykQ0savGllAhYoDsRiSu/HjQQfMF/
	 BhY7X3BQN3Ez8sI8ov30Xdz/896wzIqVbwLDEtqLGlaIKX3Bmdx6C7jf67Qh0oE/2O
	 4Us0B80lMQMLw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=201/7]=20vmx:=20Introduce=20vcpu=20single=20context=20VPID=20invalidation?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259933722
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <50c96e2306538eb7cd28ddfcb21163c628fae0a4.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1a795d0610064f5681462d6652086e28?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776259936-FF547A3D-0EE0BC28/0/0
X-purgate-type: clean
X-purgate-size: 1506
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.909];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB728404D18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce vpid_sync_vcpu_context to do a single-context invalidation
on the vpid attached to the vcpu as a alternative to per-gva and all-context
invlidations.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index da04752e17..3524cb3536 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -452,6 +452,27 @@ static inline void ept_sync_all(void)
 
 void ept_sync_domain(struct p2m_domain *p2m);
 
+static inline void vpid_sync_vcpu_context(const struct vcpu *v)
+{
+    int type = INVVPID_SINGLE_CONTEXT;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
+        goto execute_invvpid;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    type = INVVPID_ALL_CONTEXT;
+
+execute_invvpid:
+    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
+}
+
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
     int type = INVVPID_INDIVIDUAL_ADDR;
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


