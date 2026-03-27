Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCtbBYpixmm+JAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:57:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CF342F38
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265372.1556331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64ru-00048U-OW; Fri, 27 Mar 2026 10:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265372.1556331; Fri, 27 Mar 2026 10:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64ru-00045V-Lt; Fri, 27 Mar 2026 10:56:46 +0000
Received: by outflank-mailman (input) for mailman id 1265372;
 Fri, 27 Mar 2026 10:56:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c6626b.v1-335e150ddaf9412d935ee21057e6ff9e@bounce.vates.tech>)
 id 1w64rt-000459-GT
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:56:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64rs-0040gQ-RB
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:56:44 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c6626b.v1-335e150ddaf9412d935ee21057e6ff9e@bounce.vates.tech>)
 id 69c6626b-e002-0a2a0a5209dd-0a2a450ad8f0-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:56:44 +0100
Received: from [198.2.132.14] (helo=mail132-14.atl131.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c6626b.v1-335e150ddaf9412d935ee21057e6ff9e@bounce.vates.tech>)
 id 69c6626b-1772-0a2a450a0019-c602840ee423-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:56:44 +0100
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-14.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fhyJC2Q0pz8XRqqp
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:56:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 335e150ddaf9412d935ee21057e6ff9e; Fri, 27 Mar 2026 10:56:43 +0000
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
	s=mte1; t=1774609003; x=1774879003;
	bh=0dNJjQP7XjYEVS8VW5u2fwHRPOGEtTTyk4PN88fsd7A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cSMThih67oaojjLhWVOf8LFhjT5Irc6NckubycoVk1Bh0zBOoL2k0/0mcONVlh6mj
	 /LH7lKG+om8Wqw72lPYY5wug7MUwoh3PNIGPooeCWT0J/C9thEVUdK3pg24hgkZGCg
	 n042v2dfYRlDUexMw8JvkMTvINEDCu2YoWdKq1SS7iWJwcFC7DhpZio0iJG4hmBJQL
	 /sTFwh+nRPgMSxLkkXtn0yZCpNsKRX8FV+K172DsIvAWU0x12ZL+5/ekz1xAK62Ux9
	 mbkqyHFm0tyKgPjuyabDoOJvgaYTVxWUUZksAtVvdSBr/ekLX/yNyLH7C/clu7JqVJ
	 9O8m2c/JgLnkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774609003; x=1774869503; i=teddy.astie@vates.tech;
	bh=0dNJjQP7XjYEVS8VW5u2fwHRPOGEtTTyk4PN88fsd7A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cil0blbhSOIRp3B7bJKNB3lPWa/5UK9h7jT1iTDN8+wuJUoalq0PjB6s8MWpAl6+y
	 t2FD5gWvAxkJ02+Un49M7cQIwDLSh0wKk+ePmT6VzgEgaU7opJZAzYYnNSmkuliw1H
	 dXiMdqRT2CRVgCEmr2BbZ/Jk+GSBEUHrHHMoWDQFTAXyJ5pz1haPQC4uQP6c5L0PrB
	 hkV9BV1VKEsWQBJ7fR0ApSPJbg2C844mXwIwDak7m5fzbOeUbG/RGzmZAjzAgFbsFc
	 Qok3vTDs2Pjv1srG6otbI7h78b5b7vYIE4cwKfdZGcDGE1cNI+BA8XZbCwDfoeIW0D
	 mW8vUQVXDnbig==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20IOMMU=20faults=20after=20S3?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774609002527
Message-Id: <dc88adaf-401d-4585-b310-7647220a3739@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>
References: <acZZmGXIJlmN3KGm@mail-itl>
In-Reply-To: <acZZmGXIJlmN3KGm@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.335e150ddaf9412d935ee21057e6ff9e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260327:md
Date: Fri, 27 Mar 2026 10:56:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1774609004-52892900-4F5177FC/0/0
X-purgate-type: clean
X-purgate-size: 2326
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 121CF342F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 27/03/2026 =C3=A0 11:19, Marek Marczykowski-G=C3=B3recki a =C3=A9crit=C2=
=A0:
> Hi,
> 
> I noticed that on some systems, there are a lot of IOMMU faults after
> S3. I can see it also on a laptop with MTL, but it affects also the ADL
> gitlab runner:
> 
>      https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
>      (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:00:=
1e.6] fault addr 0
>      (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in context =
entry is clear
>      (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:00:=
1e.6] fault addr 0
>      (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in context =
entry is clear
> 
> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
> 
> The issue is present only on staging, not staging-4.21.
> 

Is there a 1e.0 device ? That could be a "phantom" PCI device.

> Bisect says:
> 
> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Thu Jan 22 14:13:35 2026 +0100
> 
>      x86/HPET: drop .set_affinity hook
>      
>      No IRQ balancing is supposed to be happening on the broadcast IRQs. =
The
>      only entity responsible for fiddling with the CPU affinities is
>      set_channel_irq_affinity(). They shouldn't even be fiddled with when
>      offlining a CPU: A CPU going down can't at the same time be idle. So=
me
>      properties (->arch.cpu_mask in particular) may transiently reference=
 an
>      offline CPU, but that'll be adjusted as soon as a channel goes into =
active
>      use again.
>      
>      Along with adjusting fixup_irqs() (in a more general way, i.e. cover=
ing all
>      vectors which are marked in use globally), also adjust section place=
ment of
>      used_vectors.
>      
>      Signed-off-by: Jan Beulich <jbeulich@suse.com>
>      Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> 
>   xen/arch/x86/hpet.c | 17 -----------------
>   xen/arch/x86/irq.c  | 12 ++++++++----
>   2 files changed, 8 insertions(+), 21 deletions(-)
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



