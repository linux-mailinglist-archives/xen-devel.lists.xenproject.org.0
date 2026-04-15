Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ1hMkmE32mNUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:27:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52B4043D4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282361.1564969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyt7-0000pl-2h; Wed, 15 Apr 2026 11:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282361.1564969; Wed, 15 Apr 2026 11:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyt6-0000n6-Vs; Wed, 15 Apr 2026 11:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1282361;
 Wed, 15 Apr 2026 11:58:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df7ce6.v1-9c3c2a7e817948e4aa5e830b2a7d3782@bounce.vates.tech>)
 id 1wCyt5-0000n0-M1
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:58:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyt3-00APm8-G7
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:58:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df7ce6.v1-9c3c2a7e817948e4aa5e830b2a7d3782@bounce.vates.tech>)
 id 69df7d5a-e002-0a2a0a5209dd-0a2a450ab282-24
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:58:30 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df7ce6.v1-9c3c2a7e817948e4aa5e830b2a7d3782@bounce.vates.tech>)
 id 69df7d65-ee98-0a2a450a0019-c602bb0eb902-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:58:30 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fwfkG6SFPz8XSLZn
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 11:56:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9c3c2a7e817948e4aa5e830b2a7d3782; Wed, 15 Apr 2026 11:56:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776254182; x=1776524182;
	bh=WIWJlCYAKOt0EHTWZdN0VepA2MSlrAv0igbJ3uBehFg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FQRaEMZspkHw0E7oZGKsLJ+X6cyXylXGT60UsrNzgQ06REGJXpWYIJInvadwoJ/UC
	 h3AfB4Omyb/RLVFOuV84MiQIO5bmNjIsuE8kQ/E1kNvw1m3bNCdXgQWqJ1V7kenffr
	 b/I08Cz1VOhLFVQQgoWYBWNxfrN80J7nde1xnqoYyi1zmAOBQYtoKKn4BRL9YW2k0E
	 CH/Mipav0KPQFFVUmprEi1DFnoGlp/PTxpPHcnNfVr74xJwRgE+3AZsIjW6d4RbK83
	 sm0cajmE+0fVYA1PfiEAm95tkk9BbvDHeU6njmXYRdgye70gx0YhCQ5DzAvDfoP/Hx
	 LwSNbijU1roig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776254182; x=1776514682; i=teddy.astie@vates.tech;
	bh=WIWJlCYAKOt0EHTWZdN0VepA2MSlrAv0igbJ3uBehFg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nfuSHcvY9Vpz4mWWc1r0kBUVcj772WAxm6nlGXzTIr7OlX64m0/76nn4JDzs26LvT
	 WGQgVt5Jt5vWuetfAQlEoQDOcDFYF4PW1tSd/g7k/wobvkltMWYvDunBYpcBwFR9Ps
	 dJ5hUIxof/4AL1hfLFe8Z1aCdcSz/kGmcVhGGL/i9rydsCdTC0ZGPx+ib9bhC/axAT
	 eSYuo9LTRnIcS0m/TpTnih2QLUbMIIGSPro6w2j+IPoGGi7AHDZTkf25/yfXM3Ehv1
	 4DtwumLfdVBTVQg6YqmRPWqKkVuy5aOvkyOhUILxUciZPDwhw4tOMp63mEH3aAkLX/
	 tYTg8AlzKv1yA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/6]=20xen/dt-overlay:=20fix=20double-free=20of=20rangesets=20on=20attach=20failure?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776254181615
Message-Id: <29f94a8b-1c5d-42b6-9887-4303ddf58bd0@vates.tech>
To: "Gyujeong Jin" <wlsrbwjd7232@gmail.com>, "Michal Orzel" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-2-michal.orzel@amd.com> <CANrF8CEDV5m1Jap0kBoa3sOXD2GV6PAYumfV9rgL2c70nZa=tg@mail.gmail.com>
In-Reply-To: <CANrF8CEDV5m1Jap0kBoa3sOXD2GV6PAYumfV9rgL2c70nZa=tg@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9c3c2a7e817948e4aa5e830b2a7d3782?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 11:56:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1776254310-BED4A0B1-88B86905/0/0
X-purgate-type: clean
X-purgate-size: 2554
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wlsrbwjd7232@gmail.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.416];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F52B4043D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 15/04/2026 =C3=A0 13:51, Gyujeong Jin a =C3=A9crit=C2=A0:
> Thanks for your efforts.
> 
> I=E2=80=99ve seen some advisories that received cve here.
> https://xenbits.xen.org/xsa/ <https://xenbits.xen.org/xsa/>
> 
> Can I receive a cve for this report?
> 
> Thanks.
> 

Device-tree overlay is marked as "Experimental", hence it's not Security 
supported so no XSA would be issued, even if it it has security 
implications for the feature.

I don't know regarding individual CVEs though.

> 2026=EB=85=84 4=EC=9B=94 15=EC=9D=BC (=EC=88=98) 20:37, Michal Orzel <mic=
hal.orzel@amd.com 
> <mailto:michal.orzel@amd.com>>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> 
>     handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
>     failure but leaves the pointers dangling in the tracker entry. A
>     subsequent handle_remove_overlay_nodes() for the same overlay will ca=
ll
>     rangeset_consume_ranges() on freed memory followed by a second
>     rangeset_destroy(), resulting in use-after-free and double-free.
> 
>     NULL the pointers after rangeset_destroy() so that remove_nodes() and
>     handle_remove_overlay_nodes() skip the stale entries.
> 
>     Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device
>     attachment to domains")
>     Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com
>     <mailto:wlsrbwjd7232@gmail.com>>
>     Signed-off-by: Michal Orzel <michal.orzel@amd.com
>     <mailto:michal.orzel@amd.com>>
>     ---
>      =C2=A0xen/common/device-tree/dt-overlay.c | 2 ++
>      =C2=A01 file changed, 2 insertions(+)
> 
>     diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/
>     device-tree/dt-overlay.c
>     index d184186c015e..6fa07dbf42a5 100644
>     --- a/xen/common/device-tree/dt-overlay.c
>     +++ b/xen/common/device-tree/dt-overlay.c
>     @@ -910,7 +910,9 @@ static long handle_attach_overlay_nodes(struct
>     domain *d,
>      =C2=A0 =C2=A0 =C2=A0if ( entry )
>      =C2=A0 =C2=A0 =C2=A0{
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rangeset_destroy(entry->irq_ranges=
);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->irq_ranges =3D NULL;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rangeset_destroy(entry->iomem_rang=
es);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->iomem_ranges =3D NULL;
>      =C2=A0 =C2=A0 =C2=A0}
> 
>      =C2=A0 =C2=A0 =C2=A0return rc;
>     -- 
>     2.43.0
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



