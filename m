Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCtBFw9cEGqDWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:37:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142C5B5480
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316847.1586187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ3s-0005ap-1l; Fri, 22 May 2026 13:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316847.1586187; Fri, 22 May 2026 13:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ3r-0005ZW-V1; Fri, 22 May 2026 13:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1316847;
 Fri, 22 May 2026 13:37:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe77034000f373@swg.vates.tech>)
 id 1wQQ3q-0005Yb-B9
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:37:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQQ3p-00FDyM-Jj
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:37:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe77034000f373@swg.vates.tech>)
 id 6a105c02-2eae-0a2a0a5409dd-0a2a4509b67c-6
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:37:09 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe77034000f373@swg.vates.tech>)
 id 6a105c05-2497-0a2a45090019-b9ff1c22851b-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:37:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fe77034000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:37:08 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 821E386324;
 Fri, 22 May 2026 15:37:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Vzyzof6M049MglgyGphYvxr9S5Eyzuvw6mtrmcugws0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bM2pk8/73M0VdwinuOodlIBSl8kEe44D4dtqxQ9MAG2UuyiGakSWbUuiLW30Qrx45UwVD3eh8
 WSdIwhrkWrQWP6xPhtGdt1s9cDNKJjGlIAov0k1/1eGBKP5SjNHpq36sEPCuhD5fjW4qPHb4YMt
 shbcNnz8OLSbpCHdVz6uBFqlB9K+hXTvK5R98KR9rLDD43EZVyMswSXBDylVMaLQUD3ZFpKJYV6
 Z4vZZNjwn/ZLvOL7+2RB5ZmjwjSHYwEtiSwazuCUCFMmpe46OcIF93mBPUFWCGnDDoUg0Nq0906
 s9JrjvlgmjuRqRWmYmuC2J3BGYCetQAQ8gcteQVbVtfg==
X-Zone-Loop: 3a749b1756884997b4b7a64080d702b6af34166d5b1a
x-campaign-type: default
x-transaction-id: 9b7fe5ca-9582-4bbe-af5e-7b612cb0683f
x-swg-uid: 01-a3fb1e17-4a7a-4d2f-99c1-3f7fa9b504bd
X-Mailer: Sweego
Message-ID:
 <1779457028.8631fc262581453bbf619ec5b2062170.19e4fe77034000f373@vates.tech>
x-swg-bid: 1779457028.8631fc262581453bbf619ec5b2062170.19e4fe77034000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:37:07 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 09/13] Add trigger-test job, to run test on a Linux
 built from a branch/tag
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <4fdfa09a7ff699f5d51ab9beb95b18ccbd0c0be3.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fdfa09a7ff699f5d51ab9beb95b18ccbd0c0be3.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1254.5aa55d87213b6ca.19e4fe76e39.b14198c9c2ecbe7e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779457027641
X-purgate-ID: tlsNG-bad1c0/1779457029-88572A53-ED8689D0/0/0
X-purgate-type: clean
X-purgate-size: 1437
X-Spamd-Result: default: False [-0.17 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 1142C5B5480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1254.5aa55d87213b6ca.19e4fe76e39.b14198c9c2ecbe7e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:48PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> When scheduling pipeline in test-artifacts repo, it can get also
> TEST_TRIGGER_REPO and TEST_TRIGGER_BRANCH variables, to trigger relevant
> pipeline to test just built artifacts=2E
> Pass ARTIFACTS_REPO+ARTIFACTS_BRANCH to the child pipeline to ensure it
> fetches artifacts from the right job, but avoid xen test pipeline
> inheriting other variables, as they might have unintended consequences
> (for example REGISTRY one)=2E
> For example, to build linux-next and test Xen staging on it, the
> pipeline could be triggered with:
>=20
>     LINUX_GIT_URL=3Dhttps://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/=
next/linux-next=2Egit
>     LINUX_GIT_VERSION=3Dmaster
>     TEST_TRIGGER_REPO=3Dxen-project/hardware/xen
>     TEST_TRIGGER_BRANCH=3Dstaging
>=20
> The triggered xen test pipeline will skip most build jobs=2E
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
---=Part.1254.5aa55d87213b6ca.19e4fe76e39.b14198c9c2ecbe7e=---

