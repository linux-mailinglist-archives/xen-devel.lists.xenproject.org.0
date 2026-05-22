Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAXvNepbEGqDWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:36:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3065B5443
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316839.1586178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ2S-00057r-PB; Fri, 22 May 2026 13:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316839.1586178; Fri, 22 May 2026 13:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ2S-00055b-Lw; Fri, 22 May 2026 13:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1316839;
 Fri, 22 May 2026 13:35:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe6177b000f373@swg.vates.tech>)
 id 1wQQ2R-00055V-DL
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:35:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQQ2Q-002T5P-Pr
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:35:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe6177b000f373@swg.vates.tech>)
 id 6a105ba9-2eae-0a2a0a5409dd-0a2a4502bd78-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:35:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe6177b000f373@swg.vates.tech>)
 id 6a105bae-af86-0a2a45020019-b9ff1c229abb-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:35:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fe6177b000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:35:39 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3AA2A86A02;
 Fri, 22 May 2026 15:35:39 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pml0ddqtmQbrG50VXhUuTXy9ZFiIej+5i7PFP6V2CN4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=n1cbVyOSrZCIkU9Y9q9eWBeSNPK8CkgQJyJNgLCABmrsONBS0cLVdHpofVrPCAQCs1XH8TKHe
 dBJ6GErx/ie2DapdjZUXUumUBykkW9SNUi1us/wIFeHgGjnzPQO6PUBmZC2fmvCUtyiVT1syMQJ
 Me5weEVRilS7ZP35l0bvwOKlD1dOti/2hy9q8hK0M409T3eGOBfSNY3AAkLiXKqzepxNj6hc/3Z
 QOyuEsjubODCijRhRHHcuHjpbkJPO6HK9g11Sy7/S2lnS9DecgtjaRq6qdhP1JcDP50/fiB67WI
 8uImk3XFT/56Z4tY9NLAJMTBPJXrs1qfP/VmQbPPv01Q==
X-Zone-Loop: c623cb006f08736b6b2288b3ef629211bb5a36a0dd49
x-campaign-type: default
x-transaction-id: 0c6d37d6-eec4-4ed1-8572-a32b4158c1ca
x-swg-uid: 01-4a1ad561-b75f-4b7f-bdb3-27bceecf6aa6
X-Mailer: Sweego
Message-ID:
 <1779456939.8631fc262581453bbf619ec5b2062170.19e4fe6177b000f373@vates.tech>
x-swg-bid: 1779456939.8631fc262581453bbf619ec5b2062170.19e4fe6177b000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:35:39 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 06/13] Support building arbitrary Linux
 branch/tag/commit
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <9440095275dd9313f7f8e2a41384e1275be0fcaa.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9440095275dd9313f7f8e2a41384e1275be0fcaa.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1253.60ef3f67f9fe3725.19e4fe6155a.3f18c0cee08e0c1d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779456939355
X-purgate-ID: tlsNG-720697/1779456942-81971161-6B9A3FC3/0/0
X-purgate-type: clean
X-purgate-size: 1463
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7A3065B5443
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1253.60ef3f67f9fe3725.19e4fe6155a.3f18c0cee08e0c1d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:45PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Change how kernel version is given to the script - use arguments, to
> avoid confusion between pipeline level variables and job level ones=2E
>=20
> The build-linux=2Esh now can take either just the kernel version (used t=
o be
> LINUX_VERSION variable), or git branch/tag/commit name + git URL (new fe=
ature)=2E
> Go with "git init" + "git fetch" instead of "git clone" to support any
> of branch/tag/commit=2E
>=20
> This also defines optional linux-git-* jobs which will build the thing
> if LINUX_GIT_VERSION and LINUX_GIT_URL variables are provided for the
> pipeline=2E
>=20
> The idea is to define separate CI schedules for the test-artifacts repo
> with LINUX_GIT_URL/LINUX_GIT_VERSION pointing at Linux trees to be
> tested (for example linux-next), and then trigger matching pipelines in
> the xen repo for testing with that version=2E
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1253.60ef3f67f9fe3725.19e4fe6155a.3f18c0cee08e0c1d=---

