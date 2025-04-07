Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE2A7DDB9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939833.1339798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgS-0006DT-Sv; Mon, 07 Apr 2025 12:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939833.1339798; Mon, 07 Apr 2025 12:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgS-0006Bt-Pq; Mon, 07 Apr 2025 12:34:36 +0000
Received: by outflank-mailman (input) for mailman id 939833;
 Mon, 07 Apr 2025 12:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgR-0006Bg-3E
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:35 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a860adf4-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:33 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 74D351380335;
 Mon,  7 Apr 2025 08:34:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 07 Apr 2025 08:34:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:31 -0400 (EDT)
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
X-Inumbo-ID: a860adf4-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1744029272; x=1744115672; bh=WFapRtox07cHAjVDnGsGUNV6flqZv6ts
	pF8FK/dHBoE=; b=QWKo95r37B+xZKPK93JR3htJMXogp6NQZTUuEK0PGogoWKSi
	JmTFlQubIDnLbPqNCWVWaQHV50s53wGlBKnlJ0/Jx2zWq8HB3fgkhTSdERAEx/P9
	Ah42w04FOltXfOZBwrEzZEwiOFqgTM5kES67JVTwuA+V+kYbwQHbGBHv1TzxwpqM
	ucr9ZerxqWhz5Dthlq2jMzy2lj+OqE9X7UnIhUuLyryBwpjqOcr4bUdSA5v0VbBp
	aihuFa3LlDg34Uro6XupLVkJocFbadn+Xhnzr7h4I+PGmvfaT2QkxmVPDpLNzMJ3
	HRZvxUiGsHFausCVMxpP1O+8f2IBhe15TO1Uew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1744029272; x=1744115672; bh=WFapRtox07cHAjVDnGsGUNV6flqZ
	v6tspF8FK/dHBoE=; b=DI4W6Rm94tjv8rVv5X0Qst/UUU8QQXVPZfxXUpe+EyO0
	MZyNlLoPWqlia7K9KaCWtKS4kXyreBNa6Wt8l18V1NlelFA0LmeWsfyV2ZoqQs4G
	FuOWaro6MkUTmbPzQcAhswQ0bAmkYtfFOOqjscl0zKa76zefJvPdQFayHYXU54C3
	smxhaIU09kRCRuQC4yJqL4iwQfzjolUYKHdegEKTtwm1Ykwzf+/QreH7uIStO3X8
	Iwy6eE6Gt4370M6xJehEO4gfU8pcjUJD7l2i02rqcq1ZG2pX/A1k+3hY9AXIRy2C
	hlCYbyH3cWBnHRNZmlP1TIQCGCAR+/1Dv7Ai+lqdRg==
X-ME-Sender: <xms:WMbzZ_Jj84QDeNlEuMXC4-Zo-tDIdOr3j9eiQNvclQizjjrYjP5ykw>
    <xme:WMbzZzIWe45zHGllPo1ymNZ6JeIQGJlB0nxVX3wMQe6epQMerIctapC4dGMJIXEzi
    lrXgNq30Hro1w>
X-ME-Received: <xmr:WMbzZ3u30QlzKlt1WAKVHtmMgrhtkjMKY5BYOLM6l5Ptz4-1adKGEb5Lj2f9_ICZUon6LYcfrTcviaobOjm7m_i_QzapgT6zaytWu2HBY28Hg7RnBMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekle
    eghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghp
    thhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:WMbzZ4YNa61Pe8gLjLKsTesNZOGeX4fySea5HkrxdQ-QDh8_S0o28g>
    <xmx:WMbzZ2bqhux6tivY7RKjrew6YpT_NMm9CI5FndalrmJ--zoyAfuU8Q>
    <xmx:WMbzZ8AN-PaGZu3eLjUeG-1bVodQPpoLnkZ_udEXblClVE2ng_ilPg>
    <xmx:WMbzZ0bslaPQnkqtu4inqU75KLY16dLrs-k23g3Krw38XMiFCTQU_Q>
    <xmx:WMbzZ_JmzrwJ3puCQMwtoNUy-crqstb6eW4QLfNUo2bmS9vZqlH5-4jG>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 00/12] Several CI cleanups and improvements, plus yet another new runner
Date: Mon,  7 Apr 2025 14:31:00 +0200
Message-ID: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of those patches are collected from my stubdomain test series, others are
made while getting the new runner working. All of the cleanups can be applied
independently, but most if not all are needed for the "CI: add AMD Zen 4 HW
runner" patch adding new runner.

Last two/four patches (including test-artifacts patches) are
optimizations that cut time of some jobs almost by half.

As usual, besides the patches, somebody need to click on "hal9012" runner in
the relevant projects.

Marek Marczykowski-Górecki (12):
  CI: prevent grub unpacking initramfs
  CI: switch qubes runners to use console.exp
  CI: enable XHCI console in Xen debug build on Alpine
  CI: include domU kernel messages in the console output log
  CI: increase verbosity of starting a domain
  CI: consistently use DOCKER_CMD in makefiles
  CI: wait for the network interface in PCI passthrough tests
  CI: switch test kernel from 6.1.19 to 6.12.21
  CI: adjust resolving network interface into PCI device
  CI: add AMD Zen 4 HW runner
  CI: avoid repacking initrd as part of the test job
  CI: save toolstack artifact as cpio.gz

 automation/build/Makefile                                 |  4 +-
 automation/build/alpine/3.18-arm64v8.dockerfile           |  1 +-
 automation/gitlab-ci/build.yaml                           | 10 +-
 automation/gitlab-ci/test.yaml                            | 58 ++++-
 automation/scripts/build                                  |  2 +-
 automation/scripts/console.exp                            | 23 +-
 automation/scripts/qemu-alpine-x86_64.sh                  | 15 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh               |  2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh               | 15 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh           |  9 +-
 automation/scripts/qubes-x86-64.sh                        | 97 +++-----
 automation/scripts/xilinx-smoke-dom0-x86_64.sh            | 29 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh         | 16 +-
 automation/tests-artifacts/Makefile                       |  4 +-
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile |  5 +-
 automation/tests-artifacts/alpine/3.18.dockerfile         |  1 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile       | 41 +---
 automation/tests-artifacts/kernel/6.12.21.dockerfile      | 43 ++++-
 18 files changed, 216 insertions(+), 159 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.12.21.dockerfile

base-commit: a235f856e4bbd270b085590e1f5fc9599234dcdf
-- 
git-series 0.9.1

