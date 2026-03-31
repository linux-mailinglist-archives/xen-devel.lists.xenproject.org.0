Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDBEBRFYzGn/SQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:26:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4C372C7C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269475.1558520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iSo-0006iu-Vj; Tue, 31 Mar 2026 23:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269475.1558520; Tue, 31 Mar 2026 23:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iSo-0006hN-Sx; Tue, 31 Mar 2026 23:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1269475;
 Tue, 31 Mar 2026 23:25:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iSn-0006h6-Ke
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iSn-004YK0-1g
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:25:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57bf-bab6-0a2a0a5309dd-0a2a4506ab32-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:37 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f0-3034-0a2a45060019-67a8ac99bb41-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:36 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D503B14001FA;
 Tue, 31 Mar 2026 19:25:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 19:25:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:34 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1774999535; x=1775085935; bh=UKMOTo2RX1Ll8vvrhEXAxY+PtF1EezHS
	ReErpU39Q38=; b=SF1/7rYr7tLAz7Qd6fFWdB8fNdTNIp446XSQN5Q4Kud9x/3F
	8zyUUXDmInaw+huAeT1XQVu4CLXo7sNqZot9+2ZDdb+j7J1YRHPJuGastfG3pTo1
	MQlll2SvTR2Nr7fbbT5DDPZUfbrEsre/Bb25w1A9lEXBEX7iBiWKYXRx0NIqcijo
	gUkpRAyXo4QFEt2QrR1MJB/xxyxhxEmwg17UAPD00FBmJGYJtrPAO5HEjryorQct
	aiE32zjo1k8q3at7VTKZODfpqQ1Hf3e9YCQMAEhiWccThQnLUu6mJY9UijqtZTQl
	HnuWbWRwUCdK7l1ExXRKqh+E3nFSPvmQu+hcVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1774999535; x=1775085935; bh=UKMOTo2RX1Ll8vvrhEXAxY+PtF1E
	ezHSReErpU39Q38=; b=aMnqOBf7F+6i2bG5qxZ0zngAt6mgloXdoHVFuhRQe0HJ
	BA3ZGLP8o81GVeFMO+TRKPHv48j6XewAyAATeljgnrMOQ3qmpI2g9IpRlpj0DcHH
	1j3sInHM/jj2VjOA+RtHzyx3Ml+BsoRgIryyndPF902lqKBv5QOm7Hk7jOlzTn5P
	rUGxF8XZxlF3LZGFdDo+YaJ2Fe4GUiUWvyiRrdUsk/iRG2L6zJwqRkvL3pM3WA1j
	Q3A9irjAvsWSNCdq6Y/moRJDTYk55sdRP0dbIF8fwVkeCnfn0Q4Y32VjuHfIGbM3
	u3/5lgXHdtTnepB7Vxd4x9ureSwwErWIcji1YAuAkA==
X-ME-Sender: <xms:71fMaaGRGKZ93x-39wjry3GSL0aaf0AgZatEaRB7FYQ8051Aw-opkg>
    <xme:71fMaSVo5wzn3dqyB4equ9DUsamZuCKbheQqwNo08KDmL43WOfb_TVQziXJEV4BQe
    Ar9t4GJ4JDfMeuxe6bitB_OXi0NxxzvDfNI8rmIAWAI7F4l>
X-ME-Received: <xmr:71fMaZKjHuwycMVD8B5ateZqnB2c2lNkYpSQPVg62CFR1IUAtdgp4bTAhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueefhfelieek
    geeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrghinhepgh
    hithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:71fMaS_fuE8BxdFpyHQWbIAyC1Zed953UAgyEAoFVHaDz-I-fP53NQ>
    <xmx:71fMacJ20DjVYuL1IzR5PMUQJsfDBhVEOtLAuunkpfakvRqgFtgm4Q>
    <xmx:71fMaXkq44B2hfghS45iUDzxTbZI6v7DNO39JpEJpqDshInNVCMGrQ>
    <xmx:71fMaQPfWJZeOkvvW8MrKhmFd9T3pKGJTDxpVbGZcYCWPculBuXLrQ>
    <xmx:71fMafTLXf1VvetuGGeoy1cu8CVgCpFGAXC4aOz43bhrPdw325IFXTlC>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/6] Add infrastructure for testing arbitrary Linux branch
Date: Wed,  1 Apr 2026 01:24:49 +0200
Message-ID: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774999537-7AD951C2-7A5CCF65/0/0
X-purgate-type: clean
X-purgate-size: 1946
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,gitlab.com:url];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7AB4C372C7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series implements testing arbitrary Linux branch, based on pipeline
variables. The idea is to setup schedule running a pipeline for few selected
branches (some of the Linux stable branches? linux-next? Linus's master
branch?) The SELECTED_JOBS_ONLY variable can be used to exclude most of the
build jobs in those pipelines.

This series used to add add hw12 runner, but since it's still problematic
(might be genuine Xen bugs), I excluded it this time to not delay this series
anymore.  There are also few minor CI improvements collected along the way.

A few example pipelines, showing how badly this needs to be deployed:

v7.0-rc6
    https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2419664631
    (pvh dom0 crashes on zen3p)

Linux-next (20260330):
    https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2419594464
    (the above, plus PV dom0 sometimes panics on ADL)

v6.6.130
    https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2419841336
    (fails "only" because on one qemu test domU has too little memory to load the updated kernel)

v6.6.86
    https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2422090153

Marek Marczykowski-Górecki (6):
  CI: upload tests-junit.xml as a normal artifact too
  CI: make test-artifacts repo/branch/job customizable
  ci: introduce BUILD_FOR_TESTS_ONLY
  CI: use Alpine's network setup
  CI: setup SSH key
  [DO NOT MERGE] CI: example how to use ssh to extract logs

 .gitlab-ci.yml                     | 14 ++++++++++++++
 automation/gitlab-ci/build.yaml    | 25 +++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml     | 25 +++++++++++++------------
 automation/scripts/qubes-x86-64.sh | 26 +++++++++++++++-----------
 4 files changed, 67 insertions(+), 23 deletions(-)

base-commit: 1792bb9a99d27d6b42e72fa28158e32d3ad05cc0
-- 
git-series 0.9.1

