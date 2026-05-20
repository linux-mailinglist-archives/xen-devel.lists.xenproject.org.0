Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AciFqfLDWqq3QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:56:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C534E590489
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314067.1584092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiKu-0006N0-5p; Wed, 20 May 2026 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314067.1584092; Wed, 20 May 2026 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiKu-0006LY-2z; Wed, 20 May 2026 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1314067;
 Wed, 20 May 2026 14:55:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e45e2b319000f373@swg.vates.tech>)
 id 1wPiKs-0006LQ-KO
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:55:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPiKs-00HWVb-0T
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:55:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e45e2b319000f373@swg.vates.tech>)
 id 6a0dcb56-2eae-0a2a0a5409dd-0a2a4504c920-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:55:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e45e2b319000f373@swg.vates.tech>)
 id 6a0dcb75-1dec-0a2a45040019-b9ff1c22b57f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:55:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e45e2b319000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 14:55:45 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B8E268689D;
 Wed, 20 May 2026 16:55:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=J4thoi6+2i6F5kP5g2a7F2mrA6Al+TU4PQ9gtuoo90g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HPxwPFIKrpKTgbtTq5TSMOSmojqPuFn2LbDPevPlg6KCfn6UiXSBWD0nq+ltKKai+EH8eDdhM
 hmDT856g6SxRCnLmnh0U6ZFrowNeijJ+stWniRgi4Ijw1u/8J8UOry5JsZXLkmniF7Q74M92Fh4
 t72Gp/rM4oTWGAKQi2YBQZyWMc9X9Wjx0cUimOLYrWhE99LGNQsM3pa39eAfSqkpQREh4wPD8Ue
 dsS62JDwSnAM2l4bkDACJaFq6gzF77UAPao8vKwBP8z4+SxBHdLVU+RYMmJA6sLvvVRt87SPoa6
 NbHPCx/iUr3pwbE0GQeBacgQoOpUH5v5joA4iTSznc2A==
X-Zone-Loop: 8e7c8da8a33fe498d3d25f4ea42dbfb55ee090293734
x-campaign-type: default
x-transaction-id: e3c1928e-4ce3-4eff-9549-054bad24269b
x-swg-uid: 01-c5f5b51e-4524-4bda-ae92-bfe90e5e74cf
X-Mailer: Sweego
Message-ID:
 <1779288945.8631fc262581453bbf619ec5b2062170.19e45e2b319000f373@vates.tech>
x-swg-bid: 1779288945.8631fc262581453bbf619ec5b2062170.19e45e2b319000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 16:55:44 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Fix helpers build
References: <7c5cdad207571e98ad324f07c7c754f79e8ce044.1779089580.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c5cdad207571e98ad324f07c7c754f79e8ce044.1779089580.git.mykyta_poturai@epam.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1063.84da57cda8e78332.19e45e2b0ba.77f21546638438cc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779288944826
X-purgate-ID: tlsNG-ebf023/1779288949-2BD6C3FF-A36AB71A/0/0
X-purgate-type: clean
X-purgate-size: 832
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C534E590489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1063.84da57cda8e78332.19e45e2b0ba.77f21546638438cc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 07:35:43AM +0000, Mykyta Poturai wrote:
> Init helpers sometimes fail to rebuild after switching branches,
> which results in runtime faults=2E
>=20
> Fix this by adding missing DEPS_INCLUDE to the Makefile=2E
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam=2Ecom>

That's not really a complete fix, but that will help, and that's the
best our current build system can do=2E

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1063.84da57cda8e78332.19e45e2b0ba.77f21546638438cc=---

