Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKNJBfvq6GkGRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:36:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609C447F88
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290786.1570283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZcg-000804-SN; Wed, 22 Apr 2026 15:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290786.1570283; Wed, 22 Apr 2026 15:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZcg-0007yU-Ol; Wed, 22 Apr 2026 15:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1290786;
 Wed, 22 Apr 2026 15:36:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5d5a953000f373@swg.vates.tech>)
 id 1wFZcf-0007xw-40
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:36:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZcc-00FpQN-TO
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:36:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5d5a953000f373@swg.vates.tech>)
 id 69e8eadb-2eae-0a2a0a5409dd-0a2a4501dc76-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:36:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5d5a953000f373@swg.vates.tech>)
 id 69e8eaf0-c1f2-0a2a45010019-b9ff1c2283c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:36:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db5d5a953000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 15:36:11 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2831486AED;
 Wed, 22 Apr 2026 17:36:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=RMdXDWOqjRmmYJbO94LXDJeVD1bT0MotR/jczO+vBFE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=krs/lAxNHtWD8ZJgDDGLFYOnomQICeAtF94DmZa1aPaJkEFiyVFUHhRNJVvmPTO372sG8CDqz
 HckFfaFvameSep0MqPHGmt6FZ8cIdtTlT4xWFwiliJp10jeAjVlCv7k4FUZLCrgYDj01HoZ6V3Y
 KWph8BR4sW5tV3BU7ZwfA7EP40t0euxpbvFfD9bSrv5oRVtXIdRQwSYAeiUJ1vEyHE1x3HBs5eM
 lHxpOGGXO+48kOWjKsfYAV2m5TRW+qauLVH3c9O9e6L12T8RvbSQiGkW8T5UIeu7THtGCSrASom
 COzjjAyBb8QfnWwNVFwX+0Bh8Wk0cDr/TOrPzdkcAIfw==
X-Zone-Loop: 23a0342a037226df6fbbd9eddedb8f8340e888be72aa
x-campaign-type: default
x-transaction-id: f2a89e3a-cd6c-44b1-b4f0-833cb43b91dc
x-swg-uid: 01-57b12bd8-2ebe-466c-8c31-5786b712f82e
X-Mailer: Sweego
Message-ID:
 <1776872171.8631fc262581453bbf619ec5b2062170.19db5d5a953000f373@vates.tech>
x-swg-bid: 1776872171.8631fc262581453bbf619ec5b2062170.19db5d5a953000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Apr 2026 17:36:10 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 09/13] Add trigger-test job, to run
 test on a Linux built from a branch/tag
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <9893108225500bb841a39918942bc9267e62b6af.1774999132.git-series.marmarek@invisiblethingslab.com>
 <ad-WTdnAdOzcUkze@l14>
 <ad_Ng5TryP3Nj6em@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad_Ng5TryP3Nj6em@mail-itl>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.25e8.5edc5adbba897eb8.19db5d5a70b.50242c239d631519=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776872171276
X-purgate-ID: tlsNG-d62444/1776872176-BE667FF4-526ECA59/0/0
X-purgate-type: clean
X-purgate-size: 3235
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7609C447F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.25e8.5edc5adbba897eb8.19db5d5a70b.50242c239d631519=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 07:40:19PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Apr 15, 2026 at 01:44:47PM +0000, Anthony PERARD wrote:
> > On Wed, Apr 01, 2026 at 01:21:59AM +0200, Marek Marczykowski-G=C3=B3re=
cki wrote:
> > > +trigger-test:
> > > +  stage: deploy
> > > +  trigger:
> > > +    project: $TEST_TRIGGER_REPO
> > > +    branch: $TEST_TRIGGER_BRANCH
> > > +    strategy: mirror
> > > +  variables:
> > > +    ARTIFACTS_REPO: $CI_PROJECT_PATH
> > > +    ARTIFACTS_BRANCH: $CI_COMMIT_REF_NAME
> > > +    LINUX_JOB_X86_64: linux-git-x86_64
> > > +    LINUX_JOB_ARM64: linux-git-arm64
> > > +    BUILD_FOR_TESTS_ONLY: 1
> >=20
> > Can we add this?
> >   inherit:
> >     variables: false
> >=20
> > Otherwise, as I understand, the triggered pipeline will also use the
> > global variables, like TEST_TRIGGER_REPO, LINUX_GIT_VERSION, =2E=2E=2E=
 Or I
> > could be wrong because we don't set a default value and the are only
> > manual/scheduled pipeline variable=2E
> >=20
> > https://docs=2Egitlab=2Ecom/ci/yaml/#trigger
> > > CI/CD variables defined in a top-level variables section (globally) =
or
> > > in the trigger job are forwarded to the downstream pipeline as trigg=
er
> > > variables=2E
> >=20
> > https://docs=2Egitlab=2Ecom/ci/pipelines/downstream_pipelines/#prevent=
-default-variables-from-being-passed
>=20
> Hm, yes, inherit:variables:false might be needed if we'd want to avoid
> passing those variables=2E But, TBH I'm not sure if we want to avoid tha=
t
> - it might be useful at some point to get LINUX_GIT_VERSION there, for
> example=2E=20

I've run a test and I don't see LINUX_GIT_VERSION value in the
trigger pipeline, only the default value=2E

See https://gitlab=2Ecom/xen-project/people/anthonyper/xen/-/jobs/14042314=
690/viewer

    $ echo triggered by ${LINUX_GIT_URL} and ${LINUX_GIT_VERSION};
    triggered by and
    $ env
    REGISTRY=3Dregistry=2Egitlab=2Ecom/xen-project/people/anthonyper/test-=
artifacts
    XEN_REGISTRY=3Dregistry=2Egitlab=2Ecom/xen-project/xen
    LINUX_GIT_VERSION=3D
    LINUX_GIT_URL=3D
    TEST_TRIGGER_REPO=3D
    TEST_TRIGGER_BRANCH=3D
    ARTIFACTS_REPO=3Dxen-project/people/anthonyper/test-artifacts
    LINUX_JOB_X86_64=3Dlinux-git-x86_64
    =2E=2E=2E

So, the triggered pipeline got the value of the variable as set in
`=2Egitlab-ci=2Eyml` `variables` section, and the values of the variables
set in the trigger job=2E But the value set via push-variable are missing=
=2E
So far, the triggered pipeline doesn't get the useful variable values,
beside the needed ones=2E And my main issue would be with the REGISTRY or
XEN_REGISTRY variables, if we rename one into the other, the triggered
pipeline could fail=2E

So I think we should use inherit:variables:false, and explicitly
passthrough the variables we want=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.25e8.5edc5adbba897eb8.19db5d5a70b.50242c239d631519=---

