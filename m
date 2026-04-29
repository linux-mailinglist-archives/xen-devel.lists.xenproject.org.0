Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHFvOvAW8mljnwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:34:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36710495DE4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297429.1573458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI5zA-0008RL-DQ; Wed, 29 Apr 2026 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297429.1573458; Wed, 29 Apr 2026 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI5zA-0008PZ-Am; Wed, 29 Apr 2026 14:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1297429;
 Wed, 29 Apr 2026 14:33:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@swg.vates.tech>)
 id 1wI5z9-0008PT-D7
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI5z8-004Pgp-Oy
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 16:33:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@swg.vates.tech>)
 id 69f216c8-2eae-0a2a0a5409dd-0a2a4501b6da-24
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 16:33:54 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@swg.vates.tech>)
 id 69f216d2-c1f2-0a2a45010019-b9ff1c228517-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 16:33:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd9a915bc000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 14:33:50 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9CEF480B82;
 Wed, 29 Apr 2026 16:33:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=6Qpd3RUXpDK/WhkTTfIF7opv94F9vdzKhd0m8iunY8A=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=PW4JqyYdsFlXyh8WHq6+5PeWW6GxnbngUzHRrNPfcxeWtlgcyCIwwwQv3iK+FEew6aPu896i4
 Ls2M7dpdtR0dJWCNVnctOdr9h6UaOCc8JkzVzg+ABIO2eieUYNXAyClkjsVsbpGARfWRmlp9IUK
 P9sguhnXeiYhhkyGc8epK9aiza3dNKlwthn11G/GtJby+pQdCjlQ2L5NLPlhOcNDGFrIYXVFJ9X
 4B0AHmGNtDxOXChVrL7OJH4Rw66ZfQT06smQZTRyzkBTgGZVeybazJ4gogTdvDr/2PhLr6OA3Y1
 CP8ldMWYcNN9R8twv/pC2OE0YdUCd10+4aVaEuwENtvA==
X-Zone-Loop: 795a9e550284621f493acc2b30d84560a4b4629f629b
x-campaign-type: default
x-transaction-id: c4e82e4f-89c1-452e-97d0-36364208eb2a
x-swg-uid: 01-57d22118-7835-4d11-afdc-5b02a6c55fa5
X-Mailer: Sweego
Message-ID:
 <1777473230.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@vates.tech>
x-swg-bid: 1777473230.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Apr 2026 16:33:45 +0200
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.231.4aedd74cac3a3672.19dd9a9040f.4e3261a16981b028=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777473225743
X-purgate-ID: tlsNG-d62444/1777473234-BC016FF4-4D7C287D/0/0
X-purgate-type: clean
X-purgate-size: 2805
X-Rspamd-Queue-Id: 36710495DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
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

---=Part.231.4aedd74cac3a3672.19dd9a9040f.4e3261a16981b028=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 08:22:32AM +0000, Mykyta Poturai wrote:
> On 4/16/26 09:49, Jan Beulich wrote:
> > On 15=2E04=2E2026 16:51, Mykyta Poturai wrote:
> >> On 3/30/26 15:32, Jan Beulich wrote:
> >>> This looks wrong to me=2E There are x86-specifics in that file, whic=
h shouldn't
> >>> be built on Arm=2E And the name of the file also doesn't indicate an=
y relation
> >>> to CPU management=2E
> >>
> >> xen-hptool requires xg_offline_page as it has both CPU and memory
> >> hotplug commands=2E Without building xg_offline_page it fails with
> >>
> >> xen-hptool: symbol lookup error: xen-hptool: undefined symbol:
> >> xc_mark_page_offline, version libxenguest_4=2E22=2E0
> >>
> >> when trying to do memory ops=2E
> >>
> >> Is it an acceptable behavior?
> >=20
> > I don't think so, no=2E The tool wouldn't, aiui, load at all then if b=
uilt with
> > "bindnow" enabled=2E
> >=20
> >> If so I guess we can build xg_offline page only on x86=2E
> >=20
> > We still need to, imo=2E But the tool still needs to be usable no matt=
er how
> > specifically it is built=2E It should avoid referencing xg_offline_pag=
e=2Ec
> > functions when built for non-x86=2E
>=20
> As I understand, the usage of arch-specific compile time checks is=20
> heavily discouraged in tools=2E So I don=E2=80=99t think it would be app=
roved by=20
> tools maintainers=2E Do we really need to omit this file if memory ops a=
re=20
> already getting blocked by Xen on Arm anyway?

So you are trying to modify a library and introduced untested
functionality just to be able to build a different tool? I don't think
that a good idea especially in this case where it's more than just glue
code between a binary and xen=2E

We could change the library to provide the missing symbols, but it is
probably best to keep it that way for now=2E

So, how about changing `xen-hptool` to have reduced functionality on
other platform, and keep the 'mem-*' command on x86 only? You could move
the function that implement the 'mem-*' command into a separate file,
that compile only on x86 (or more specifically when CONFIG_MIGRATE is
set) and just have a "#if defined(__i386__) || defined(__x86_64__)" in
the `main_options` array=2E

They are compile-time arch-specific check everywhere in tools=2E Arch
specific are often implemented in separated source file, this mean we
can limit the #ifdefs to a minimum and keep the code readable=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.231.4aedd74cac3a3672.19dd9a9040f.4e3261a16981b028=---

