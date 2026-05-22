Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A4wNQtLEGqmVwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 14:24:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7A5B3E05
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 14:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316724.1586072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQOvB-00057x-N0; Fri, 22 May 2026 12:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316724.1586072; Fri, 22 May 2026 12:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQOvB-00055Q-KK; Fri, 22 May 2026 12:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1316724;
 Fri, 22 May 2026 12:24:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@swg.vates.tech>)
 id 1wQOvA-00055K-3L
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:24:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQOv9-006ODu-Ej
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:24:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@swg.vates.tech>)
 id 6a104ad9-5cb7-0a2a0a5109dd-0a2a45039680-28
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:24:07 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@swg.vates.tech>)
 id 6a104ae6-672d-0a2a45030019-b9ff1c2292ed-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:24:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fa4847a000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 12:24:02 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B668786A30;
 Fri, 22 May 2026 14:24:01 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=8i7nULkws/S/u415AReAU6V5YZyWrzfJhGhmffEUBJI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=odlHCq05VRUp1R2kNjuYhFcO45q3J1ZuKA0BRIb4a79Q7Z5ABaGAEVcCCMoAdKqKthyF5a9Yf
 n1D3betJiY2Im8UwiElHWN9A8Zeu/nkXVyjq17LKIOow6wlK5oVQvicqAZ5pOaClJmo3HLPIDfd
 lH2U59HjUX4HqsEpmCNzBJLLD1SRXbaEotiQfT7vB7J6jN9BH0GAX6Nmz/B31+G5yN2CXwWUccn
 vuDEBwaJlbMtDf8712arZCvjWuYRj/3F3LzG99JDBVQE562k2L6XJVnyAtRETTgqM7netxkmTz8
 x6JtWKn3X4Nu7SMXzjMKxa5Lq60LgHWiymZFLoItYygA==
X-Zone-Loop: 1d18b5a0c1e15245d1999d450963cd0602742097590e
x-campaign-type: default
x-transaction-id: 2249cc6a-b8b6-4462-a299-47bd2dfe9dba
x-swg-uid: 01-5171774b-106b-4f75-b025-b1c6b60a906d
X-Mailer: Sweego
Message-ID:
 <1779452642.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@vates.tech>
x-swg-bid: 1779452642.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 14:24:01 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: edit rules for analyze jobs
References: <20260520225820.31550-1-victorm.lira@amd.com>
 <00d987d3-6a9c-440e-beb8-6587a3fd1d9b@citrix.com>
 <751c1684902e41fdd9d29b71670b49f0@bugseng.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <751c1684902e41fdd9d29b71670b49f0@bugseng.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.123a.871fb6907f276c21.19e4fa48259.1c9e4a2228e6831c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779452641881
X-purgate-ID: tlsNG-33051d/1779452647-4259D938-DC32CFAE/0/0
X-purgate-type: clean
X-purgate-size: 1080
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:andrew.cooper3@citrix.com,m:victorm.lira@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[192.237.175.120:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RECEIVED_SPAMHAUS_PBL(0.00)[82.67.99.167:received];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[195.190.135.10:received,37.26.189.201:received,10.42.69.3:received,185.255.28.34:received];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 68A7A5B3E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.123a.871fb6907f276c21.19e4fa48259.1c9e4a2228e6831c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 12:32:33PM +0200, Nicola Vetrini wrote:
> On 2026-05-22 12:20, Andrew Cooper wrote:
> > I'm afraid this still doesn't work=2E
> >=20
> > I pushed with ci=2Evariable=3DSELECTED_JOBS_ONLY=3D"/eclair-x86_64-all=
code/"
> > and still got the eclair-*-amd jobs started=2E
> >=20
> > https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/pipelines/2545=
988798
>=20
> Perhaps it's because the runner is marked as a safety runner?
>=20
>   rules:
>     - if: $ECLAIR_SAFETY
>       when: always


The variable isn't set in the runner (runners variable wouldn't be taken
into account here anyway)=2E The variable is set for the group
"xen-project/hardware", so for every repo under it=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.123a.871fb6907f276c21.19e4fa48259.1c9e4a2228e6831c=---

