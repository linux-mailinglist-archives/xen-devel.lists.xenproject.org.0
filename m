Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM20IGqW32nXWQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:45:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DE404F77
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282498.1565069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Xz-00040o-Mn; Wed, 15 Apr 2026 13:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282498.1565069; Wed, 15 Apr 2026 13:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Xz-0003z4-Jx; Wed, 15 Apr 2026 13:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1282498;
 Wed, 15 Apr 2026 13:44:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df964f.v1-603041154a0e46c9bf79c06074e1b14a@bounce.vates.tech>)
 id 1wD0Xy-0003yx-FN
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:44:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0Xx-00DFnq-4Z
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:44:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df964f.v1-603041154a0e46c9bf79c06074e1b14a@bounce.vates.tech>)
 id 69df964d-bab6-0a2a0a5309dd-0a2a450acd86-14
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:44:49 +0200
Received: from [198.2.186.1] (helo=mail186-1.suw21.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df964f.v1-603041154a0e46c9bf79c06074e1b14a@bounce.vates.tech>)
 id 69df964f-ee98-0a2a450a0019-c602ba01f614-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:44:48 +0200
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4fwj7M2xXpzBsV4dp
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:44:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 603041154a0e46c9bf79c06074e1b14a; Wed, 15 Apr 2026 13:44:47 +0000
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
	s=mte1; t=1776260687; x=1776530687;
	bh=//hAjML2pP2vneo2Hm8FFXS2YtyAc4eA0WjPQ7ENl3I=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CWJLQsjDywmikCmPwll4k9l6BwkfqwAt6BJJFPzVZAz4589wppITxJHKQfLrZGGQR
	 WWzeRGjmG7kZJX4KxqRrUAGyGOXf1/9wmsWM/yOaFEclCowfP9K8Si4BuEWcHYeBJR
	 PeJ0IyHfDJywxuXkWa2JO49x0xxvomd+LENjRwN2VjF4De3wsFwChBnRyP9td2PJKc
	 GfrsydVmdCsYurKff8+wvuWg+uPJFhkq5NrTDR+IymbjlIaXJVG80miFp1BAbO/UhH
	 C8+wF5cB/DwhgqeB9sz7idR42eVvNFD245i+R/yHDVQeeTcVOMtwxrDnotE7HRqaoY
	 wVAmQd9mLRwtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776260687; x=1776521187; i=anthony.perard@vates.tech;
	bh=//hAjML2pP2vneo2Hm8FFXS2YtyAc4eA0WjPQ7ENl3I=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kcKALmQok2Xxm7U9tuhtxZ/rLyqDfvZQddaWVbquy75KG6gu3m/gbVslYV2oGzmyH
	 eNqANYyJU8cVP6VVVviMp1yctYFPuOIJZyRHNQ7wZaWmyjp+ys2VPCjG3O/VwgLzKy
	 5b1zno7bm7bZrZGdAvqAbzQ3/9uHsapJ05mLnJRZgKUSq7HIIt7wapYTkb0D6lCk/r
	 zINaGxiwUCP78RM4bAvVUB4W465lq8s3HFwx+CtabRXWbzLs843TQmPQn0WQ5CnBYo
	 Bu3eNUzK2Ttfcmd21pUbAQvX1WoI+70qASashqf9n+uk1Sybs7+BtVaQ9AYoURfhd+
	 M1ubXx4nYv9PQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2009/13]=20Add=20trigger-test=20job,=20to=20run=20test=20on=20a=20Linux=20built=20from=20a=20branch/tag?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776260686233
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ad-WTdnAdOzcUkze@l14>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com> <9893108225500bb841a39918942bc9267e62b6af.1774999132.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <9893108225500bb841a39918942bc9267e62b6af.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.603041154a0e46c9bf79c06074e1b14a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:44:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1776260688-BFF430B1-0B40947B/0/0
X-purgate-type: clean
X-purgate-size: 2617
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,vates.tech:dkim,vates.tech:url,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.607];
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
X-Rspamd-Queue-Id: C88DE404F77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:21:59AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> When scheduling pipeline in test-artifacts repo, it can get also
> TEST_TRIGGER_REPO and TEST_TRIGGER_BRANCH variables, to trigger relevant
> pipeline to test just built artifacts.
> Pass ARTIFACTS_REPO+ARTIFACTS_BRANCH to the child pipeline to ensure it
> fetches artifacts from the right job.
> For example, to build linux-next and test Xen staging on it, the
> pipeline could be triggered with:
> 
>     LINUX_GIT_URL=3Dhttps://git.kernel.org/pub/scm/linux/kernel/git/next/=
linux-next.git
>     LINUX_GIT_VERSION=3Dmaster
>     TEST_TRIGGER_REPO=3Dxen-project/hardware/xen
>     TEST_TRIGGER_BRANCH=3Dstaging
> 
> The triggered xen test pipeline will skip most build jobs.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---

You might want to add that this depends on two patch for the xen repo,
for the trigger to do the expected tests:
    CI: make test-artifacts repo/branch/job customizable
    ci: introduce BUILD_FOR_TESTS_ONLY

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 62b2a24e7faf..9d90a8f57ff8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -105,3 +110,18 @@ linux-git-x86_64:
>  microcode-x86:
>    extends: .x86_64-artifacts
>    script: ./scripts/x86-microcode.sh
> +
> +trigger-test:
> +  stage: deploy
> +  trigger:
> +    project: $TEST_TRIGGER_REPO
> +    branch: $TEST_TRIGGER_BRANCH
> +    strategy: mirror
> +  variables:
> +    ARTIFACTS_REPO: $CI_PROJECT_PATH
> +    ARTIFACTS_BRANCH: $CI_COMMIT_REF_NAME
> +    LINUX_JOB_X86_64: linux-git-x86_64
> +    LINUX_JOB_ARM64: linux-git-arm64
> +    BUILD_FOR_TESTS_ONLY: 1

Can we add this?
  inherit:
    variables: false

Otherwise, as I understand, the triggered pipeline will also use the
global variables, like TEST_TRIGGER_REPO, LINUX_GIT_VERSION, ... Or I
could be wrong because we don't set a default value and the are only
manual/scheduled pipeline variable.

https://docs.gitlab.com/ci/yaml/#trigger
> CI/CD variables defined in a top-level variables section (globally) or
> in the trigger job are forwarded to the downstream pipeline as trigger
> variables.

https://docs.gitlab.com/ci/pipelines/downstream_pipelines/#prevent-default-=
variables-from-being-passed

I'm not sure if the inherit:variables:false is needed, so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



