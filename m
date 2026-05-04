Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNjoIuv4+GkG3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 21:52:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3754C35C0
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 21:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300152.1574704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJzJy-0004Qx-HV; Mon, 04 May 2026 19:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300152.1574704; Mon, 04 May 2026 19:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJzJy-0004Od-EG; Mon, 04 May 2026 19:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1300152;
 Mon, 04 May 2026 19:51:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 1wJzJw-0004OX-SP
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 19:51:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJzJu-00HGra-Np
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 21:51:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f8f890-bab6-0a2a0a5309dd-0a2a450a8fc8-42
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 21:51:10 +0200
Received: from [79.135.106.103] (helo=mail-106103.protonmail.ch)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f8f8ae-56b3-0a2a450a0019-4f876a67b98f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 21:51:10 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777924268; x=1778183468;
	bh=2cNEIrg6yvrC6l7wVPRLypp8fTO1uZhpKDrUZobMLno=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=je26RxX8WUbwpdqO4benbbu3niagzNZxdal6hZUfoNbf2QqxO+it9fe6mLE2LQpeg
	 XEGS00Knl0otLtrx2TpBhMVxr3S88H+EPNzpSoxaL+Hnl8EMMZNeahhFgpcWBmBNAF
	 DkxQsQ/penOwSNE+q7qjYje4DmR4C+hMMdXuY8yDhQtxw1n1wxMhoKChmlPex7MVDE
	 UNQaA4mNSTtyTyT9cGuMMkZyGpkIJcFLrFU4l+vTO8UpTdNs9MwMAf2FdzFqneJBUc
	 zyfaOj7uUTX9jh27/4PcHCvdxpnC92PWkMT7OjxZBP2O+bYGNu7fqc4ClHNGNz90VW
	 IBCPT8JmnzmJA==
Date: Mon, 04 May 2026 19:51:02 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: "Samuel.Montgomery61" <Samuel.Montgomery61@protonmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Skip boot memory scrub on platforms with full-memory encryption
Message-ID: <ZYwseRBKWS_aeuKq6CUZBrH7n0zXfIMqN-vpOWEc-auwg3TkKHLNmVc02q36wINrsxNFHeKU56TQaiZupVoxJhBitWqcb8v5nae4hi2UWTY=@protonmail.com>
In-Reply-To: <b94777e1-4f4e-4468-8320-ed622cde0bf1@citrix.com>
References: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com> <8c619af2-0dbd-468f-aa17-c1224d315304@suse.com> <v8BgcMuI474dKhLADWT2nMnQYi_m5b1mw7vAZIbRv2ffDY0bh2h_d9Qst_Q-4HUT3DOyYk8WHVpyih_2wlIgvVkbYoLsHY5_jYUPgQnkC1g=@protonmail.com> <b94777e1-4f4e-4468-8320-ed622cde0bf1@citrix.com>
Feedback-ID: 16446063:user:proton
X-Pm-Message-ID: 75318f11224ff374b7543e77aabf6c69a2df8c65
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1777924270-4757C8B7-531F4C19/0/0
X-purgate-type: clean
X-purgate-size: 1220
X-Rspamd-Queue-Id: 2C3754C35C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:dkim,protonmail.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[Samuel.Montgomery61@protonmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Samuel.Montgomery61@protonmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]

On XX.05.2026 XX:XX, Andrew Cooper wrote:
> One part of it says "make sure after a crash
> we don't have old guest data around in memory", and encryption is
> specifically irrelevant for this case; the ephemeral key doesn't change
> on warm reset.
=20
Could you clarify this? My understanding is that firmware re-runs on a
warm reset and re-initializes TME with a new key. The key would only
persist across kexec, where the CPU is never reset and firmware doesn't
re-run. Am I wrong about that?
=20
> Something relevant to QubeOS is that for DRTM (Anti Evil Maid), it is
> required (by the TXT spec at least) that Xen scrub memory between
> receiving a shutdown request and actioning it.
=20
Agreed, but that's shutdown scrubbing, not boot scrubbing. A separate
problem.
=20
> Another aspect is to populate Xen's free memory pool with ready-to-go
> memory.
=20
I don't think "ready-to-go" requires zeroed pages. bootscrub=3Doff
already hands out unscrubbed pages, and the debug build specifically
poisons pages with a non-zero pattern to catch code that relies on
them being zeroed. So the functional requirement is that pages are
safe to hand out, which encryption satisfies, right?
=20
Sam

