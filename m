Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LgJBGzM2GktiQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:09:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D113D5702
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278637.1563403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8np-0006if-PP; Fri, 10 Apr 2026 10:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278637.1563403; Fri, 10 Apr 2026 10:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8np-0006ga-Mp; Fri, 10 Apr 2026 10:09:29 +0000
Received: by outflank-mailman (input) for mailman id 1278637;
 Fri, 10 Apr 2026 10:09:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 1wB8no-0006gM-1d
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:09:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8nn-00CX8f-CM
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:09:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 69d8cc4a-5cb7-0a2a0a5109dd-0a2a4506d2aa-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:27 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 69d8cc56-0df0-0a2a45060019-c602bb014028-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:27 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fsXb93mt8zBsTy7b
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:09:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 57e3b21e68b746dea0983682dfb4ce71; Fri, 10 Apr 2026 10:09:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775815765; x=1776085765;
	bh=kX9OrGYxdeKETyoInb6c8nVi60+Bkczuz40aX8nsNxw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=jW/774AQlEnpr/zmbDT/FiHmtZOCphtfXDEtEgA2+cLux61InUw2kX8oWHfCEtymA
	 Zl6eu1IKZzzXMJwzwcnJ1EN1gkbHtG3a/QY+fWetKivc+uX3NxMdO02377gaXV0DzQ
	 Z0HV4Id84mZNWpFiCj4ydJtEttV8nhM6F8YEd6VujttP+8Hkp3H0XPwqIi+t/QHgOd
	 I45NGrf/ghDPyJvTBaRh+w74o7Gka0Ml9fDYX+rXQhIlxOQeBUXPLtUG0Q9xAISu0F
	 hJgdRbazztS4NaELsLpkjL/kdf0egO7PGAbI5S/Kiyb4CrNmgKahQKIM9HisN2gi5M
	 MdtuQIb+djDVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775815765; x=1776076265; i=teddy.astie@vates.tech;
	bh=kX9OrGYxdeKETyoInb6c8nVi60+Bkczuz40aX8nsNxw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=YHzdK3/k8X0Ob3H5zG0tn51qchfOrsINDiwez1e08JrgcPXrCOaWbsvwblqhkHQ3z
	 a9uB8R20hiVn6OazO2pslsxPf/afluYNlJ+AS8feSbfOCEyQw780bZNiDTjAvydk+w
	 by733MWIrD9pv7OSR3Bcvz/UviB6A38nynLkaVEX6XoFocIBLMmdWU0whEzg3koOga
	 AsYBv0Idel79UOCwRTAjY7IfTacjEPyV5lj0PD6T0QVtgHIAhz1qqc6iPMXGEdzAAS
	 Q7yw6LzQqQo5ukQVVDFis8ncLwsz4VciA7jCVEEkAFiT0b6ZcK8aZ/SIxKsYx20k/w
	 d3SSZuxibFGfA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/2]=20vtd:=20Drop=20dead=20check=20for=20permissions=20in=20lookup=5Fpage?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775815764539
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.57e3b21e68b746dea0983682dfb4ce71?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 10:09:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775815767-5EF353D8-3686972D/0/0
X-purgate-type: clean
X-purgate-size: 1381
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 06D113D5702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`val` comes from `addr_to_dma_page_maddr()` which is a pagetable
paddr and doesn't leak the PTE flags in it.

Rather than returning entries without any permissions, assume they
are always r/w.

Fixes: dd93d54fef0b2 ("vtd: add lookup_page method to iommu_ops")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This doesn't really matter since the lookup ops are not used currently
(and not implemented on the AMD side), hence it's not a problem in practice.
Perhaps we want to drop the function for the time being, and reintroduce it
when it gets useful ?

 xen/drivers/passthrough/vtd/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 3d6f787b3c..cf97469957 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2293,8 +2293,8 @@ static int cf_check intel_iommu_lookup_page(
         return -ENOENT;
 
     *mfn = maddr_to_mfn(val);
-    *flags = val & DMA_PTE_READ ? IOMMUF_readable : 0;
-    *flags |= val & DMA_PTE_WRITE ? IOMMUF_writable : 0;
+    /* TODO: Populate flags from pte */
+    *flags = IOMMUF_readable | IOMMUF_writable;
 
     return 0;
 }
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


