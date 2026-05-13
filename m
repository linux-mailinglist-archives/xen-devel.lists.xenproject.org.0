Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKzGLQSCBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 15:52:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44C534675
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 15:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308014.1579547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA03-000497-4f; Wed, 13 May 2026 13:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308014.1579547; Wed, 13 May 2026 13:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA03-00046U-1w; Wed, 13 May 2026 13:51:47 +0000
Received: by outflank-mailman (input) for mailman id 1308014;
 Wed, 13 May 2026 13:51:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@swg.vates.tech>)
 id 1wNA01-00046O-CX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:51:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN9zy-00CFuB-PL
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:51:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@swg.vates.tech>)
 id 6a0481f0-2eae-0a2a0a5409dd-0a2a4505a4d4-0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 15:51:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@swg.vates.tech>)
 id 6a0481ef-aaa8-0a2a45050019-b9ff1c229251-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 15:51:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e219b849d000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 May 2026 13:51:40 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 028F782EAC;
 Wed, 13 May 2026 15:51:39 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=c5mn0R3cSrwYsFzqCU6S4JzSDzyRSIJQ1FFNjRhpbGo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=k2OZtpIOa+Cvjn/Pw1h+MqfoXKkLG4azhejXuaTQMfXKAb3BRvCC0jFiJnByXx5fXy/lRsGwO
 n0awKnImfYnMLEb0E/aZCIfWQW8aicndzusiN4qeS67YLcNcGurGcMlK0wC7tBvQ10zWoDPUwKq
 QAbc5HOUPnUAiKa6opBz5rY1pwZuo4uvCWMVPr0W3GODdWj9e7M+/S4c+BPH/MoiEVQxQpYqGPY
 6z/SLSVVE31z7cmfImaJtcbwvwNOyFcVa1/s8iOycZnrh9+Wf9duzGGk2r4XitL1SWQ8gevN0RH
 R6FDyXBjSPxJ44ZZC0ioxGm+5uhaxTR+meUGF4Q74oSQ==
X-Zone-Loop: 6fef3e81695edb80aa42e09278e61849d45f6577c01f
x-campaign-type: default
x-transaction-id: 28d12be7-15c9-4204-8ce3-43febf1818e0
x-swg-uid: 01-387a348c-9a6b-4dc4-bd5c-c000351858da
X-Mailer: Sweego
Message-ID:
 <1778680300.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@vates.tech>
x-swg-bid: 1778680300.8631fc262581453bbf619ec5b2062170.19e219b849d000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 13 May 2026 15:51:39 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8] xen/domain: introduce DOMID_ANY
References: <20260507202840.293269-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507202840.293269-1-dmukhin@ford.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b6f.f50e21ee35a0dab2.19e219b8280.d8cc0075e210b33e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778680300161
X-purgate-ID: tlsNG-c201ff/1778680304-E0063443-6E85778E/0/0
X-purgate-type: clean
X-purgate-size: 1568
X-Rspamd-Queue-Id: 3A44C534675
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

---=Part.b6f.f50e21ee35a0dab2.19e219b8280.d8cc0075e210b33e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 01:28:40PM -0700, dmukhin@ford=2Ecom wrote:
> From: Denis Mukhin <dmukhin@ford=2Ecom>=20
>=20
> Add a new symbol DOMID_ANY to improve the readability of the code=2E
>=20
> Update all relevant domid_alloc() call sites and harden the domid_alloc(=
)
> input value check=2E
>=20
> Also, fix problem with passing invalid domain IDs in
> XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> uses 0xffff as domain ID=2E
>=20
> Fix failing tools tests too=2E
>=20
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford=2Ecom>
> ---
> Changes since v7:
> - aligned the DOMID_ANY comment with another patch sent separately to
>   unblock xenstore series: https://lore=2Ekernel=2Eorg/xen-devel/2026042=
9120619=2E1013440-2-jgross@suse=2Ecom/
> - added fixups to mem-claim, paging-mempool, resource and tsx tests=2E
> - Link to v7: https://lore=2Ekernel=2Eorg/xen-devel/20260408234046=2E131=
4021-1-dmukhin@ford=2Ecom/
> - Link to full CI: https://gitlab=2Ecom/xen-project/people/sstabellini/x=
en/-/pipelines/2508345752

For the tools part:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.b6f.f50e21ee35a0dab2.19e219b8280.d8cc0075e210b33e=---

