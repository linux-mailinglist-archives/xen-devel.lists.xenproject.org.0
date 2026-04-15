Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPFzOkqB32mcUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:15:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62C40427A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282378.1564979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCz8Z-00046v-EQ; Wed, 15 Apr 2026 12:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282378.1564979; Wed, 15 Apr 2026 12:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCz8Z-000450-BL; Wed, 15 Apr 2026 12:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1282378;
 Wed, 15 Apr 2026 12:14:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df7d05.v1-915fc230090640e9a53f57400ec0dcc2@bounce.vates.tech>)
 id 1wCz8Y-00044u-BS
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCz8X-00CW1w-OU
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:14:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df7d05.v1-915fc230090640e9a53f57400ec0dcc2@bounce.vates.tech>)
 id 69df8125-2eae-0a2a0a5409dd-0a2a450ca6aa-0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:14:29 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df7d05.v1-915fc230090640e9a53f57400ec0dcc2@bounce.vates.tech>)
 id 69df8124-f40c-0a2a450c0019-c602bb01cb3a-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:14:29 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fwfks5LG6zBsXrPp
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 11:56:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 915fc230090640e9a53f57400ec0dcc2; Wed, 15 Apr 2026 11:56:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776254213; x=1776524213;
	bh=w7uZ9Pb+etRnkvD6kyJuXnCt2Zq8CjZnHSza/rI5GdI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CQHqUMsCz6G6y5IuNR+Sj2zG5LEwONvitxLNgNI3QhjufdiqpbMwzc4UTFkcenuda
	 dx3c/4uuYk90YHErDBqBXdJCaLGvbejQThiZRslsskyUIBIkKLprHOiXK3M7KqA+uI
	 RbfLLPJSF2Alse9HnaspqiJPPQxAaGa7kd8KmXHoWcXbhw57aFrGSG8wQgUHJhljTt
	 E+Bw3wM9919AcSdt8x0BCbRJAnuUWP07LshEYguQoJ13Grmd8GWafXCPvZ2I8CkoIh
	 YmIBLvanAbLcMImEg4cgCwizpY/CSrZz57eXtM1FRSDZNGVEGpFE9ncOqGoEUi6k/z
	 5Rv3wBa+hny7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776254213; x=1776514713; i=anthony.perard@vates.tech;
	bh=w7uZ9Pb+etRnkvD6kyJuXnCt2Zq8CjZnHSza/rI5GdI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T0S1DsUYhLnqa9/Yv0iIocuwYGYX60zgSFOAlpTVSXUEvtT7ih44ubaytqKwM9Vjj
	 4hNt43RfQ/gNA3zeF32qqP3pUp832EDW+7UGb1paN/bteN7g7LmewWxYmx/UT2VBqq
	 FGQHEMyVHQAPEai+595Fkhj+6aia1GOiKwVvtWT0N+AAOAiDDbCs7gBqAI7IbjxYH3
	 crBRKgBpJPkOO7V8zUSlAFuOofZSh5YV3vs0dpuB6Yfsi1AH0mE0R5Ty/MQcW7Jl5A
	 L3oulOXdlcLiqCx7Ij1IU+7s0/wVah8mteTWg3jvAZjthzD9o6svPnfR/zDKtplQeP
	 c0Poy23ZtRFjw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2004/13]=20Add=20linux-6.12.79-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776254212591
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ad99BL-v7fOAdqH8@l14>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com> <b53df707293f8907f5bb28a6d7380c28236b2637.1774999132.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <b53df707293f8907f5bb28a6d7380c28236b2637.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.915fc230090640e9a53f57400ec0dcc2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 11:56:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1776255269-FE350A3D-D26C1ADC/0/0
X-purgate-type: clean
X-purgate-size: 480
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.372];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C62C40427A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:21:54AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> +linux-6.12.60-x86_64:
> +  extends: .x86_64-artifacts
> +  script: ./scripts/build-linux.sh "6.12.60"

I've got:
    $ ./scripts/build-linux.sh "6.12.60"
    LINUX_VERSION must be set

Linux version want's to be in a env variable, not an argument.

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



