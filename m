Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOhnMAi2w2litgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:16:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A7322BBC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261887.1554631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LHs-00005c-Fg; Wed, 25 Mar 2026 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261887.1554631; Wed, 25 Mar 2026 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LHs-0008VL-CG; Wed, 25 Mar 2026 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1261887;
 Wed, 25 Mar 2026 10:16:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c3b5fc.v1-1ba30b6b94e04affa6ddb4cb77f9ed1d@bounce.vates.tech>)
 id 1w5LHq-0008V6-NT
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5LHq-004Hkx-3P
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:16:30 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c3b5fc.v1-1ba30b6b94e04affa6ddb4cb77f9ed1d@bounce.vates.tech>)
 id 69c3b5fd-2eae-0a2a0a5409dd-0a2a4507c86a-6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:16:30 +0100
Received: from [198.2.132.30] (helo=mail132-30.atl131.mandrillapp.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c3b5fc.v1-1ba30b6b94e04affa6ddb4cb77f9ed1d@bounce.vates.tech>)
 id 69c3b5fc-fd74-0a2a45070019-c602841e8ae4-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:16:29 +0100
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fgjVh24MBzP0Jw5k
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:16:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1ba30b6b94e04affa6ddb4cb77f9ed1d; Wed, 25 Mar 2026 10:16:28 +0000
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
	s=mte1; t=1774433788; x=1774703788;
	bh=T7EpgRybNoifMSgAfOLkhykpvzIx7aiilD5wr3qTGqI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Vpwp9jH0DQYWxQxudR41U1zHs0E0aqBJIJA1G2fsrQuPrc0cxh4vLpA4z4toZ+LyA
	 woMmkvB4HY/bwTyz/WezbixP9uJSeJ7ieKq6VlqQTgxgvRDABy4UWp9ke1eYzZWEYU
	 Lmln1IT4ZIPSykhliQ34CC3IMF8iE9l26bNNfN5Rnuud0exkMwygu/BtvYqXkKtNzk
	 dBh9pigm55wDLVUmlSx7LK7U9qL7nB9u5Tz8VwcLgLA9VvPvIb+2UhcBEZcWKpnKnC
	 Nme/o4qIu6268BpQV30PdIOqr4QpljJmDcJ0GELbxDkSoly3p+wKtqjsBjVNYxxJ1P
	 E3DYOaaITGreQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774433788; x=1774694288; i=teddy.astie@vates.tech;
	bh=T7EpgRybNoifMSgAfOLkhykpvzIx7aiilD5wr3qTGqI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UiZAw4qt0mNH6EWY8pl0deAMZjXuOmSH5c59gA6pKN5Rqp6ltIFUC/8fZ7twbxbf7
	 zZ2j1OFdx1MoOtc5RZl6MnbkpI7ryohDWg7QlgPHNDirccBGL/3KGXz6lZ6/p1JcvG
	 1VLhbaE2y8ujNm3dbbDKs3erjNekKSUfGr/Fjmkj9fS5qkhCh3dHW66dIhn2quC7sJ
	 IaP/M/rPwUnmp5kDTcMUoMH2wEVAv1IkpCmcupQTqZr/vG+lo8n2TjlBauWYWUgjMK
	 0xodiUqhKtOzvQm5aJD05DVQLd1CBiAIpMQWPL40TZ2jf6nYUV2s7mAno/Ypm2RLFe
	 e+9K6RQxOIRrg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/6]=20x86/vpmu:=20Expose=20PEBS=20and=20DS=20area=20in=20PV=20mode?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774433787291
Message-Id: <d382d9e9-8a3d-4e1f-a437-f15620887078@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech> <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech> <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
In-Reply-To: <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1ba30b6b94e04affa6ddb4cb77f9ed1d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260325:md
Date: Wed, 25 Mar 2026 10:16:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1774433790-5D386303-ED4D20C7/0/0
X-purgate-type: clean
X-purgate-size: 1496
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 704A7322BBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 24/03/2026 =C3=A0 10:14, Jan Beulich a =C3=A9crit=C2=A0:
> On 10.03.2026 17:44, Teddy Astie wrote:
>> I don't see any reason for them for not be available, especially
>> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.
> 
> This is really dangerous: You allow PV domains to control whether the are=
a
> is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
> result in a complete hang. I do, in fact, have been carrying a patch to
> completely disallow DS area use for PV, eliminating the misleading code
> you refer to.
> 

While PV case is particularly quirky (especially with L1TF), the issues 
still exists for HVM.
I suppose things may be a bit better with "EPT-Friendly PEBS" though.

Regardless, we already say that the feature is potentially unsafe to 
use, and it still needs to be opted-in, so this patch just allows the 
guest to use something we advertise (with its eventual quirks).

> Also note that VPMU_CPU_HAS_DS cannot be set for PV vCPU-s anyway.
> 

Why is that ?

`vpmu_set(vpmu, VPMU_CPU_HAS_DS);` made in core2_vpmu_initialise is 
called in either PV and HVM cases.

>> Fixes: 27c554198666 ("x86/VPMU: add support for PMU register handling on=
 PV guests")
> 
> Not just because of the above, I'm pretty sure a Fixes: tag is inappropri=
ate
> here.
> 
> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



