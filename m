Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCwHIGsK4WnoogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 18:12:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C84116E2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 18:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283778.1565912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDPKA-0005jp-IQ; Thu, 16 Apr 2026 16:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283778.1565912; Thu, 16 Apr 2026 16:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDPKA-0005hj-F8; Thu, 16 Apr 2026 16:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1283778;
 Thu, 16 Apr 2026 16:12:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e10a5a.v1-29f48fc9630b48479eb5a8e27dd77473@bounce.vates.tech>)
 id 1wDPK9-0005hd-Ke
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:12:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDPK9-001gvg-11
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 18:12:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e10a5a.v1-29f48fc9630b48479eb5a8e27dd77473@bounce.vates.tech>)
 id 69e10a5a-5cb7-0a2a0a5109dd-0a2a4505ad1a-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 18:12:12 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e10a5a.v1-29f48fc9630b48479eb5a8e27dd77473@bounce.vates.tech>)
 id 69e10a5b-aaa8-0a2a45050019-c602890b0dcd-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 18:12:12 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxNLy6fNZzDRdWn3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:12:10 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 29f48fc9630b48479eb5a8e27dd77473; Thu, 16 Apr 2026 16:12:10 +0000
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
	s=mte1; t=1776355930; x=1776625930;
	bh=9i1GohdlhXVzP2qyrLIucgM92vxUqV6Buaznl+/iM9s=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lcoaFPZ3bBVHTyQ0+HUak4HRfq8HYs2+BI5Mhwcexal/L+KDoA/rwvYDXqa31elHm
	 XroyReZvfzMYhnZuy2vFgAkeFgeAHvGWKxRw981XmyQqWkJy+8bjM1U/LSlDqoe3oW
	 L205EjAXeQEfub9Q+Ssx9eIZnjnyo/upIwvI0VSh79t+uknQ7xRuEeRpBXL/MVhswN
	 lR9DEEW8uUrOEzjA6y7sMK3IfG3MQWoaFuY9G4LyMLaplamsdaBB1OvKTC5x/BAeUP
	 Q954WR5yIbHqqfS3S+Vo0ILxxxGFzMyDhyFBg8HAmI+zk5J3xcWihDrR3wxVZ7cZW8
	 Zd76vlDixhdFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776355930; x=1776616430; i=anthony.perard@vates.tech;
	bh=9i1GohdlhXVzP2qyrLIucgM92vxUqV6Buaznl+/iM9s=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qpyRH+0a+Jzkq7oM6jRogxtuKK2HdV2betC73tmdPqxXALoqEmHjM0G+BxZo/fI6D
	 prbdZGaHdtQvcTAqqH4TMkwB2IwWiI+jExl2kvwRWfh6KhmLRTP4yHxJOa8iggnFur
	 mKXq1RS/5BJbFJDEDNz5P20LiUb8NnpISToBMWoPgqFNXI2zqZ1OlREtiG/JlV1P57
	 ON3rnKVBnhHWAYGAJ9G7HIvd5fI1XSYMYMcQ8sNkD6peVB1WiL8+Ml5hvdWY7P7r3/
	 D4xMFPuseJeMl1JMMMvyS6vS+g/8C8KBzIvJXiKMY2ZbLzLo9tKbNGcbt5cK+WTeG+
	 9Tp7bV5gq+XWA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=203/6]=20ci:=20introduce=20BUILD=5FFOR=5FTESTS=5FONLY?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776355929690
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <aeEKWZ0AqETJFJOl@l14>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com> <c5247e0a41dc49bd18cca23864f9adaf86bb2147.1774999414.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <c5247e0a41dc49bd18cca23864f9adaf86bb2147.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.29f48fc9630b48479eb5a8e27dd77473?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 16:12:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1776355932-E13A0443-09EAAD9B/0/0
X-purgate-type: clean
X-purgate-size: 845
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
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.678];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 307C84116E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:24:52AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
> index b69bad9202c2..f4e277780311 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -496,6 +520,7 @@ debian-bookworm-gcc-cppcheck:
>  
>  debian-bookworm-gcc-arm32-cppcheck:
>    extends: .gcc-arm32-cross-build
> +  <<: *build-test

This jobs doesn't looks like it's used by any tests. The other looks
probables, and I could start a pipeline, so no tests are missing the new
rule.

This chunck could be removed on commit, so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



