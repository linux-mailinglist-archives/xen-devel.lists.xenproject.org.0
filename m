Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577DCA48C8
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177995.1501992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLT-0000Mz-LR; Thu, 04 Dec 2025 16:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177995.1501992; Thu, 04 Dec 2025 16:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLT-0000KB-GA; Thu, 04 Dec 2025 16:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1177995;
 Thu, 04 Dec 2025 16:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLS-0008JO-4x
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:18 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f082f5a-d12f-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:38:11 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 6E85BEC0596;
 Thu,  4 Dec 2025 11:38:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 04 Dec 2025 11:38:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:09 -0500 (EST)
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
X-Inumbo-ID: 9f082f5a-d12f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1764866290; x=1764952690; bh=vNp5Slv4FBi3vNewmWgzl8z3qukP2vu+
	6zfhsBz2ftg=; b=L14fOoqHt3Oy/uqzqnSXaUpFB7OWAeaREYGuCsqoq4hslEqP
	+Bcak1ba1orzzMuGFZtS6ZtRzh9s0kWuJfUjAL671QxnQGtE0x8aNk2pHHNBBy2b
	l+w1Ay8a6fv6LwY8rUbVeWh+RDxihIgiL/scWL4dBbPrm543vmlJp9cnciY8JRC9
	LxVpJESAD+sqNGYtBCQZ6EamwDm316VS5s0nyrT49EZw0edQdh1iSE3dk3IFXqM0
	FWLOztq85TKGqGSlb1tzUpw5gHFBYXWMfzydLPsawejNmYGc5a+2AJowYIknJt1i
	YFKpH6UYPegJQCuHUXpdqUYzm02OAm50BooqxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764866290; x=1764952690; bh=vNp5Slv4FBi3vNewmWgzl8z3qukP
	2vu+6zfhsBz2ftg=; b=nq7mL9Yd3xCWH54dPglIJGCeONNmtja1Vxs9Fgpw7zSu
	cx+bhZgG4KkXBtzMb80lyrDB2HOMYSN6mVQEklZC59MkTBhezmvgALdejGXRwiSg
	eyOH/nXw3sCYxuKd9CsQaeNpW7qKmdYeS9eZnAClq/ciK5PJvb4kyX7dFv4kstrR
	DKw4vxmrxcu6+nvU7VuPCPAyPxlxxWcGlMmLttpq3SJqWTaSZtl9NViNuE2J2wLY
	Icm8NSqxOMw/f9QlRV5HMFHYLnalNeWNMR5PV6h880xbBOzVZzsVPpxHe40l4V/x
	04jkHD3XXOWMLZOZQua/ZpvIarrmVrlgiipp6QIVWw==
X-ME-Sender: <xms:8rgxaWw1nGflznmY58IC2BP4I3tIR7ZI7uyaZJLiqZDXv2UUudHREg>
    <xme:8rgxaZKtPniz_XWYo8I1HQF2HYPh6elHki5VNI4CuqdE0vJhJA0Xi7P9TxWpnkRhd
    pghaheQf1OHY9gDOy0aw2KhmGB9ZKF1zVpGkZQKWMA3sTgCAg>
X-ME-Received: <xmr:8rgxaQqmS8TibddZ1KFC1-U-PQDVtGYZmHeP35nX-3R30OFVXJJuoWFwM3cZ2UiyT2_LNyDptBbGqdXfrtMfKh9VLGtIhwtDkkraxAXRQJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueefhfelieek
    geeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrghinhepgh
    hithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthho
    pehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvg
    hrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:8rgxaYLYO85JAoDpCOEq5yaQJp9A_AlP41CjDjLg3QI1cmPIr-q5Gg>
    <xmx:8rgxaVS47RxuJCpS1FqRunzZdfZHfUJrojjZ8qw2EiKdb75nAPYcxA>
    <xmx:8rgxaXtNP65V9T_PKTkmOzh0RYdfUsw9_SYQaWKE7weIhWMQ2LHnkA>
    <xmx:8rgxaWbHLX5I2-YrOZ3K9E-L1itPdzowFykXf-ozaKO9cNp-PceIaQ>
    <xmx:8rgxaTYxq0vXgU2QKWqyhW5KNn9qy9XoPQdmcIe2nMltNpU5CNPSX8GH>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 00/12] Changes for several CI improvements
Date: Thu,  4 Dec 2025 17:37:21 +0100
Message-ID: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Alpine update
- Debian trixie
- Linux stubdom
- test arbitrary linux branch

Technically, the last patch isn't strictly required, but it eases debugging.

Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2196630637

Marek Marczykowski-Górecki (12):
  Add Alpine 3.22 containers
  Switch Linux builds to use Alpine 3.22 container
  Add debian rootfs artifact
  Add linux-6.12.60-x86_64
  Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
  Include git in the ARM64 build container too
  Support building arbitrary Linux branch/tag/commit
  Save Linux config to artifacts too
  Add linux-stubdom dependencies
  Prepare grub for booting x86_64 HVM domU from a disk
  Prepare grub for booting x86_64 HVM domU from a cdrom
  Setup ssh access to test systems

 .gitlab-ci.yml                             | 53 ++++++++++++-
 containerize                               |  4 +-
 images/alpine/3.18-arm64-build.dockerfile  |  1 +-
 images/alpine/3.22-arm64-base.dockerfile   |  6 +-
 images/alpine/3.22-arm64-build.dockerfile  | 31 ++++++++-
 images/alpine/3.22-x86_64-base.dockerfile  |  6 +-
 images/alpine/3.22-x86_64-build.dockerfile | 43 ++++++++++-
 images/debian/13-x86_64-base.dockerfile    |  4 +-
 scripts/alpine-rootfs.sh                   | 22 +++++-
 scripts/build-linux.sh                     | 21 +++--
 scripts/debian-rootfs.sh                   | 95 +++++++++++++++++++++++-
 11 files changed, 279 insertions(+), 7 deletions(-)
 create mode 100644 images/alpine/3.22-arm64-base.dockerfile
 create mode 100644 images/alpine/3.22-arm64-build.dockerfile
 create mode 100644 images/alpine/3.22-x86_64-base.dockerfile
 create mode 100644 images/alpine/3.22-x86_64-build.dockerfile
 create mode 100644 images/debian/13-x86_64-base.dockerfile
 create mode 100755 scripts/debian-rootfs.sh

base-commit: 76894a5929bc604fb5bdb4aff2f94a6a9df68cdb
-- 
git-series 0.9.1

