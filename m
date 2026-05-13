Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ED0GvyDBGpwLAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B15348F8
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308029.1579575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA8G-0006iQ-AA; Wed, 13 May 2026 14:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308029.1579575; Wed, 13 May 2026 14:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA8G-0006fe-6h; Wed, 13 May 2026 14:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1308029;
 Wed, 13 May 2026 14:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e21a3491a000f373@swg.vates.tech>)
 id 1wNA8D-0006eW-V9
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:00:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNA8D-00549D-BN
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:00:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e21a3491a000f373@swg.vates.tech>)
 id 6a0483ea-e002-0a2a0a5209dd-0a2a4502dca8-24
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e21a3491a000f373@swg.vates.tech>)
 id 6a0483ec-af86-0a2a45020019-b9ff1c22abcb-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e21a3491a000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 May 2026 14:00:09 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 26A7486325;
 Wed, 13 May 2026 16:00:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=4F3qy5FshBiukcq6f2QlrscuPwKnV9FhFH3+nMgpNSY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Rmxc0A9jsG5q8HlhNsRFTReAL/SgfScTg9jlACQwLD9oevEO/vLR54dOHspQMh6PccLS0gNwx
 LaMqhdkdqAzNurXWWwdKQPFJY0NHRd8XE7wXQDK8RjxzYBrCeHISLJ4WYExsh+NKOZs8bE8FnP/
 DN2erlvC7i56JVKfyjV3lD4PJoOsDwmD88BVwe7b/Yodq8dfMHfGlfDNAfE4rf5e+2BXTI3yYZj
 1U1/Cd+6BCffibsN9fjTw2nTyCWvv569yAuknCBY4ErVbXY+fhNfsuks4q8ZsYC+Q4kp9nQH1io
 gW/Zx84Mxi48Jv9bDr0Fq5G9uFs50yo7bPyS3SEQDBUA==
X-Zone-Loop: 7fbc1c5f169fd20823d135b78d4f1fc5834e45c550d6
x-campaign-type: default
x-transaction-id: 5c87f954-506c-4ab5-9e1e-9361579faa6f
x-swg-uid: 01-cc9bee46-2cc1-4c02-8504-617014310f80
X-Mailer: Sweego
Message-ID:
 <1778680809.8631fc262581453bbf619ec5b2062170.19e21a3491a000f373@vates.tech>
x-swg-bid: 1778680809.8631fc262581453bbf619ec5b2062170.19e21a3491a000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 13 May 2026 16:00:08 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
 <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
 <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
 <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
 <1777473230.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@vates.tech>
 <d1c7d83c-debe-46bf-9bec-614c0a343a8f@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1c7d83c-debe-46bf-9bec-614c0a343a8f@epam.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b79.2671a3264dfd5530.19e21a34721.d489baf10e185a4b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778680809250
X-purgate-ID: tlsNG-720697/1778680813-AA76A161-08B26096/0/0
X-purgate-type: clean
X-purgate-size: 1680
X-Rspamd-Queue-Id: C05B15348F8
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Action: no action

---=Part.b79.2671a3264dfd5530.19e21a34721.d489baf10e185a4b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 08:52:29AM +0000, Mykyta Poturai wrote:
> On 4/29/26 17:33, Anthony PERARD wrote:
> > So you are trying to modify a library and introduced untested
> > functionality just to be able to build a different tool? I don't think
> > that a good idea especially in this case where it's more than just glu=
e
> > code between a binary and xen=2E
> >=20
> > We could change the library to provide the missing symbols, but it is
> > probably best to keep it that way for now=2E
> >=20
> > So, how about changing `xen-hptool` to have reduced functionality on
> > other platform, and keep the 'mem-*' command on x86 only? You could mo=
ve
> > the function that implement the 'mem-*' command into a separate file,
> > that compile only on x86 (or more specifically when CONFIG_MIGRATE is
> > set) and just have a "#if defined(__i386__) || defined(__x86_64__)" in
> > the `main_options` array=2E
> >=20
> > They are compile-time arch-specific check everywhere in tools=2E Arch
> > specific are often implemented in separated source file, this mean we
> > can limit the #ifdefs to a minimum and keep the code readable=2E
>=20
> Should I also do the same thing for SMT operations?

I guess it wouldn't hurt they are x86 only=2E So yes, looks like a good
idea to do it for the smt op as well=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.b79.2671a3264dfd5530.19e21a34721.d489baf10e185a4b=---

