Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIDfB4J212nTOAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:50:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0743C8B5D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276930.1562246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAm1t-0003pC-1F; Thu, 09 Apr 2026 09:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276930.1562246; Thu, 09 Apr 2026 09:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAm1s-0003na-UP; Thu, 09 Apr 2026 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1276930;
 Thu, 09 Apr 2026 09:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d77660.v1-831229dd307a461e977624eb355b0a9a@bounce.vates.tech>)
 id 1wAm1r-0003nU-99
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAm1p-004x8M-TE
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:50:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d77660.v1-831229dd307a461e977624eb355b0a9a@bounce.vates.tech>)
 id 69d77659-e002-0a2a0a5209dd-0a2a450ad9d6-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:50:25 +0200
Received: from [198.2.178.25] (helo=mail178-25.suw51.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d77660.v1-831229dd307a461e977624eb355b0a9a@bounce.vates.tech>)
 id 69d77660-ee98-0a2a450a0019-c602b219abdb-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:50:25 +0200
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-25.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4frwCh2Mzsz4f3s7p
 for <xen-devel@lists.xenproject.org>; Thu,  9 Apr 2026 09:50:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 831229dd307a461e977624eb355b0a9a; Thu, 09 Apr 2026 09:50:24 +0000
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
	s=mte1; t=1775728224; x=1775998224;
	bh=Xj62McjTPlXGlQsECLY2xvZ8K59wYl8t3c2Hd91Lmco=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bZC7crDeEsXLBdNXyj4y5/VHp5hkG8hm6JT5tnW6QML7DXjzeEjErbc+7Tdedx63X
	 gZ5taI3Xmu1ClfyMQDb6N9cDXQb2ePjzeNnM3jN48uEk3M1MuWOrFBENMCYGLVEu3q
	 P//TtEzMJxii6XckqMiRUSBbA4HfogPvIOGnTYpnhXLAstGL/HrjmYi2d36mXPa09Q
	 tsNxO27KeVT3QP2MZMGWXCo7NtJ4m8kMKGl9H28q4z4qIp12NfZDLPzxp7FJNfc4gc
	 SOqwG21x9APiOWHjISny1+1wJZ/SnCgPtb5YWfYI9Gp0mO/kByZu2vfV3xXjdtvSwl
	 JehHf5t6dDImw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775728224; x=1775988724; i=teddy.astie@vates.tech;
	bh=Xj62McjTPlXGlQsECLY2xvZ8K59wYl8t3c2Hd91Lmco=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oow2TDkoMeO5QTyWvP5BJ/U2WaRNbsgLwQp8u9S7IeYXPb8JNkBQ2iAlM5ZCMwgkK
	 dxfbJMYXF3CTPgHBmxcjx6e1sr+eDoiozLc2X5CvqgK+wPDuTRNlDYsDPmNnT+czuW
	 /oU/T/cquuy0M01xzQ3xrQ2YfMyLSDPXTDUjb/gS4W0DpKDvvPT4Fz/35KWuAWuzGw
	 Czio/9NQ01SzaWEsu9gCU1Wa5dvvzl6M5NftNXTXyq85cjYLp9txPCffDGar31T8Q3
	 G5zFew9MtH4LKrfGlEYBSmQVT7sJiy37hNi/WV9lpfpzDUZLoycbm6/hpFFhosSZ1v
	 c0feJYdXEv0zA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/pv:=20Adjust=20the=20save=5Fsegments()=20comment=20regarding=20MSR=5FGS=5FSHADOW?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775728223179
Message-Id: <60de1b7c-f11d-4f32-a84a-16eddc73b5ef@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260409091848.139077-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260409091848.139077-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.831229dd307a461e977624eb355b0a9a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260409:md
Date: Thu, 09 Apr 2026 09:50:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1775728225-BF5460B1-7E0970F1/0/0
X-purgate-type: clean
X-purgate-size: 1730
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,mandrillapp.com:dkim,suse.com:email,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.885];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF0743C8B5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 09/04/2026 =C3=A0 11:21, Andrew Cooper a =C3=A9crit=C2=A0:
> This is slightly stale mentioning SWAPGS and not LKGS.  However, take the
> opportunity to make the comment more general and less likely to bitrot.
> 
> It would be a serious vulnerability for operating systems generally if CP=
L3
> could modify GS_SHADOW at all.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/arch/x86/domain.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 1151997758c6..592530e53bcc 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1952,9 +1952,8 @@ static void load_segments(struct vcpu *n)
>    * changes to bases can also be made with the WR{FS,GS}BASE instruction=
s, when
>    * enabled.
>    *
> - * Guests however cannot use SWAPGS, so there is no mechanism to modify =
the
> - * inactive GS base behind Xen's back.  Therefore, Xen's copy of the ina=
ctive
> - * GS base is still accurate, and doesn't need reading back from hardwar=
e.
> + * Guests cannot modify the inactive GS base behind Xen's back.  Therefo=
re
> + * Xen's copy is still accurate and doesn't need reading back.
>    *
>    * Under FRED, hardware automatically swaps GS for us, so SHADOW_GS is =
the
>    * active GS from the guest's point of view.

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



