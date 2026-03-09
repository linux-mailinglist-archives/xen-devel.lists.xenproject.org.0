Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHmjBwDermm/JQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:49:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44723ADEE
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249544.1547021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbuq-0002qa-Lq; Mon, 09 Mar 2026 14:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249544.1547021; Mon, 09 Mar 2026 14:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbuq-0002oa-Im; Mon, 09 Mar 2026 14:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1249544;
 Mon, 09 Mar 2026 14:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ioCo=BJ=bounce.vates.tech=bounce-md_30504962.69aeddd7.v1-67f678a8485b4c94828b135b77d45798@srs-se1.protection.inumbo.net>)
 id 1vzbup-0002oS-Of
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 14:49:03 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19846cf6-1bc7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 15:48:57 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fV0JR4fpJz2lV
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 14:48:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67f678a8485b4c94828b135b77d45798; Mon, 09 Mar 2026 14:48:55 +0000
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
X-Inumbo-ID: 19846cf6-1bc7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773067735; x=1773337735;
	bh=NWg12KnlU08APrJpMjl9dwlSxHpfdbJzVp82wdhFnM0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qwzk+FnWJqJ3nJAA0v1B+jnHniSkZNyFWRbsQZpna/NvCTijObnuQ9mBQs+MwaXY/
	 jzEp3Sv1+AC2zAESeiolKZdkKbHGasPFGFNlZpm+o3EyM/8VbRdEk/6t6MabWCnA7y
	 sxIuOPF+8FwsvFh2iOEPYAhDgrbNzwYQlpSf7ccQOG7W1doQxZ8rPMpC8yjmkciA0Z
	 hcGx/0bsIOOSvRuE9arBgvI5eIGWXdFbDlrVpspdDfZcUyAwdjBrg3YzoIiSckULZm
	 JPy9mGPBACv9O2N/3DmyZ4F4IayeviL+Bc7dHEHsRCUC5JQuDynzVw613+HwQltqew
	 62bHNYmJPFEew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773067735; x=1773328235; i=anthony.perard@vates.tech;
	bh=NWg12KnlU08APrJpMjl9dwlSxHpfdbJzVp82wdhFnM0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CECVm6uJAyQ6NaXVVuo7fMemNWA7A0z2fZc5vsFPCaHhHTbjWwM34I53qjeDu3JHm
	 iyp5/HS40pXiQTj9nA4tS/w/cis6hw/fPGbm0KvfgDgJY/gcmFEKNOGSo83jtMmPu2
	 JMoBLwvxOZk6gm/FMlPYnNSb9zYVxFgBXRNACPLB6zoYTIOURIvYeWiFRty7UBbDwj
	 63Z8BABtAIG6YXXy6Bw/CR3jf+IOA8gqq2SLJHeVYDeixgYzt7l4R4XUyodieQv8aW
	 7wQjEQFeaFpOnGexMTzkIWiooS3RARFeaWD8wXfnGJPsFIYjtvDgEe4M7ZLOH+DebR
	 +OFE8srOEIwpA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20libxl:=20Fix=20device=5Fadd=20QMP=20calls=20with=20QEMU=209.2=20and=20newer?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773067734786
To: "Maximilian Engelhardt" <maxi@daemonizer.de>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Juergen Gross" <jgross@suse.com>
Message-Id: <aa7d1kCW8HNejCgQ@l14>
References: <20251215135124.11410-1-anthony@xenproject.org> <92e6ecac-7a5f-4831-8116-0c34856f1175@suse.com> <aUAd_r3VN0kTVriG@l14> <2692705.Lt9SDvczpP@localhost>
In-Reply-To: <2692705.Lt9SDvczpP@localhost>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67f678a8485b4c94828b135b77d45798?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 14:48:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BB44723ADEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maxi@daemonizer.de,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.393];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 02:29:07PM +0100, Maximilian Engelhardt wrote:
> On Monday, 15 December 2025 15:41:02 CET Anthony PERARD wrote:
> > On Mon, Dec 15, 2025 at 03:11:53PM +0100, Jan Beulich wrote:
> > > On 15.12.2025 14:51, Anthony PERARD wrote:
> > > > From: Anthony PERARD <anthony.perard@vates.tech>
> > > > 
> > > > QEMU used to ignore JSON types and do conversion string <-> integer
> > > > automatically for the command "device_add", but that was removed in
> > > > QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
> > > > QMP device_add checking")).
> > > 
> > > And older qemu accepts integers as well?
> > 
> > As the QEMU document explains about the removed feature is that they
> > should. We already have two users of `device_add` which use integers for
> > some arguments. And just to be sure, I've just tested with QEMU 8.0, the
> > patch works fine.
> > 
> > Cheers,
> 
> Can this patch be picked for the stable branches? I'm in particular interested 
> in 4.20 which is in Debian stable.

Done, thanks.


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


