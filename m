Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C85CA9F33
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179690.1503175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMZ-0007PM-Bz; Sat, 06 Dec 2025 02:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179690.1503175; Sat, 06 Dec 2025 02:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMZ-0007MF-9O; Sat, 06 Dec 2025 02:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1179690;
 Sat, 06 Dec 2025 02:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiMY-0007M8-0j
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:49:34 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1ffc97-d24e-11f0-980a-7dc792cee155;
 Sat, 06 Dec 2025 03:49:28 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id C2FBD1D00199;
 Fri,  5 Dec 2025 21:49:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 05 Dec 2025 21:49:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:49:25 -0500 (EST)
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
X-Inumbo-ID: 2e1ffc97-d24e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1764989366; x=1765075766; bh=/dlkRFv0tNgM4I9AXI5GHWsgGvCsnxyM
	uoj/1XwRQWA=; b=P0aw5fLFjV8+jtNFgi7QXYdFpJpKC9Qb1bnS99wLJuuFHox/
	IvWZcBDMhq6gK9GPg+5qzHIZCt0+7F4uBfWZfZG5MWgfsV3BOH0lGi4yhTn31uD8
	uDKn0OYTYBHAuMTWsE8VORfFLkQ2Kmv8Y4Uh4PElA8ejRsdTe6YjDsfYh9L003sT
	KT/6lXdBmd8MFfARXJi+z4rIszbxGj1PBZAy+i59XQ5neZNT+TTPYI1qNMXZlsol
	APzzO9sM5irHMw1aooITbgUVHAVMZ17VEraBcil9aVeURZo8/QhPTS5rEwvoLFvK
	tgpCsYbm13Eka76hbfSTtNq5RXr7qnumKMsglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764989366; x=1765075766; bh=/dlkRFv0tNgM4I9AXI5GHWsgGvCs
	nxyMuoj/1XwRQWA=; b=hK2v09CMAnygYs1xKKz2mb86XbzbULoHJHflbExeV5H/
	g2RatednDmXNENYpLbebkqVZI3kbVH0pUM2K/NRbS5y/rnNAZM/j0GPUbqPdbqo7
	GHJHjNYu5nxkhCdyIQgcIhztZ6ciH2fVMFrrKQ3s7oshB78YlveKUviXC/NsZazx
	DFNKbegDo6+MqGa6OvPtior0Nuj1x5d4YRsp4uwwXPhhDd+L2gaVN6OuUC8vfSNf
	pWpU2q/wFv7hx+1lyns4Fdq1rb59qQbvpNTcsFe45mSVVudTQ8yhHXgln0fdcRXs
	akcZ9TtovZHGJPimcCOcYPGS1FWsiVGAfaExtZFdqA==
X-ME-Sender: <xms:tpkzaUJGtMWGbueuyYUnu4tCTV0Etx-3Fo784aguGMJMfzfOVxK0oQ>
    <xme:tpkzabkti9eNO55XZGxK9S82KHkM4Y_Qv_dWkD6l2UHSgH2NVlsLvdcVb_yTnZ8SS
    6eu5Qasf-mzuiTFJu0dLjKf7oo3uEKNejnHvuAuJ_a0KpQt8A>
X-ME-Received: <xmr:tpkzaSG2YJp0JW9qF17vmcjFCxnK2s95dCSou909JGQSc6svXVIRGQvn489YvNth2V1Aa39Odhb259e_x2AsbfeHPNIQNr0hk2k2GIzrwEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueefhfelieek
    geeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrghinhepgh
    hithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthho
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tpkzabG1BQwc-0S9n6dBjf9aguvyA-BupxVFO09TNjra1_mcAX3tNg>
    <xmx:tpkzafPdOKce6qaBFUrad_dgJ99BGcozkO2CqgS6iY6z9CF6ie9lAQ>
    <xmx:tpkzaaFTNKuD3MxCdmQMFVwKn5Tp3yumZuJXNnkqQ_87uoI13sFzyA>
    <xmx:tpkzaWNLqQzPQfPx2K6Q61tEBHnNT_Hq7WS5aYKsDDzmECUre9wHWw>
    <xmx:tpkzabbhkWIdzKLDjoFks7oBYRssqu95eCldn94Z0yNxS2Rb8CRO0mPO>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/6] Add driver domains test
Date: Sat,  6 Dec 2025 03:48:02 +0100
Message-ID: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is intended to detect issues like recent xl devd crash in domU.

Pipeline (on top of Andrew's sd-notify.h fixup):
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2199305972

I did checked that indeed it fails with the fix reverted - that's why the
Debian patch - Alpine version did not detected that regression.

Requires Alpine 3.22 and Debian in test-artifacts repo - patch series sent
separately.
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

Marek Marczykowski-Górecki (6):
  automation: switch to alpine:3.22
  CI: extract qubes test container
  CI: cleanup alpine containers
  CI: Add driver domains tests
  CI: Add configure --enable-systemd for full build
  CI: Run driver domains test on Debian too

 automation/build/alpine/3.18-arm64v8.dockerfile       |  51 +----
 automation/build/alpine/3.18.dockerfile               |  52 +----
 automation/build/alpine/3.22-arm64v8-qubes.dockerfile |  18 +-
 automation/build/alpine/3.22-arm64v8.dockerfile       |  46 +++-
 automation/build/alpine/3.22.dockerfile               |  59 ++++-
 automation/build/debian/13-x86_64.dockerfile          |   3 +-
 automation/gitlab-ci/build.yaml                       |  44 +--
 automation/gitlab-ci/test.yaml                        | 125 +++++----
 automation/scripts/build                              |   1 +-
 automation/scripts/containerize                       |   4 +-
 automation/scripts/qemu-driverdomains-x86_64.sh       | 152 +++++++++++-
 11 files changed, 379 insertions(+), 176 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.22-arm64v8-qubes.dockerfile
 create mode 100644 automation/build/alpine/3.22-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.22.dockerfile
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

base-commit: 28d1d1c3f5aa6563ecf07136ba064be0261565c1
-- 
git-series 0.9.1

