Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7108B3EB8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712993.1113919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn3-0004aN-2p; Fri, 26 Apr 2024 17:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712993.1113919; Fri, 26 Apr 2024 17:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pn2-0004Xu-TJ; Fri, 26 Apr 2024 17:55:16 +0000
Received: by outflank-mailman (input) for mailman id 712993;
 Fri, 26 Apr 2024 17:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0Pn0-0004Xj-Dg
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:14 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f6d9e07-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:11 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id 30775180016E;
 Fri, 26 Apr 2024 13:55:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Apr 2024 13:55:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:06 -0400 (EDT)
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
X-Inumbo-ID: 1f6d9e07-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1714154107; x=1714240507; bh=2UbGT9QUGQlfG6FarGdSLlb9Bs1DKTYL
	9oGMxssKi2Q=; b=0xS4LlPbVed+eZvcLvLIHWm+fCq+KpZsUEXHsZ7RbAY6Ue3K
	6ahhaPtdXGr0BU6yh1j2FPYHgFOLYYYifO01d/A7/g3X6ose0Ck8AYylC1T7uctj
	qcVCEzwYHHQIFN71jX4F5f8wyl4Ai/P++nAmx3Nfs+gRtxu6jOEH/cS5CkKznZs/
	6qUqToYMeI4snyaHvHgxM5G9aCi+5FZ83OfnMvRYSMeuqKQV0/nothqC76pQar2k
	+lTWGi+vw6TCFT7zgD0wkNnRyNwYLEZmPydJRR1lJ/6/JUiBvI3amZ1BBfROAmW7
	goOJE5zAa1my9ukU94xb1naqVH5mA7QHCh6UiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1714154107; x=1714240507; bh=2UbGT9QUGQlfG
	6FarGdSLlb9Bs1DKTYL9oGMxssKi2Q=; b=KdQRzg+v6NLkX7MTICXI5voWj7p9i
	7QUAFV/dZSIOKQhztefrcyrxVHXbg4vZzljl0mrNhl7OTzk4/+f+M/AbzxWHb7IM
	idEW2PxX7G17zloD8diZjBE4aUniFGVk0NjeIpXrYiHIIS/uK9VgFhVvD4BIeI0f
	u3ERhOe5oPM3XS8yY5GK2Se01WEjKIm434+nXCzXgCuaL9DeDcqqaRbbMGEssVbE
	I2On3/0gFzAqj3tops6lSvF5bn25m/4AI93IG9+BylaCmiMgSEQbjIfo9s6Q8mOi
	IbOBjZvagnIqPBVKb/8yCLefK3pSifZR7flLMAY6ARK7fMY3yH/P+i2tg==
X-ME-Sender: <xms:e-orZm2VdzdPw78KZzcHDb5WvAmaRu0ToMlVe4T0lR6gVLGrfaQ2gQ>
    <xme:e-orZpGpnJx0oc5Is09BP8EXo0jR4rCiT5muSNjJXyIwBvEe9_DL5gsVKVG9xpoX-
    D0RpgttbKCl5A>
X-ME-Received: <xmr:e-orZu7QGHarwQ4kOmFu7LkBtntfsfBUphRl5cO1_ttsnPaht7mbM4O5Ir-bBNMyXSu_qJzdi4s-5cYvR36Ww333mqyWvdH5vQs7EXUT7Wu96_UKf3o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtke
    ertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgv
    tghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpefhfedvkedtiedvgfeiveetffevfefgtdehveettdev
    jeduffevteehhfevgefhheenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhtlh
    grsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:e-orZn01ktjtecV39UBRKIU2NsUdqdPRjZSXk07tojVDYTa8SB2Iwg>
    <xmx:e-orZpHYzoOMb3_cpEB89Q7aIbBRPmJvmQ8EkWgvVxymufT1XSigvQ>
    <xmx:e-orZg8YN9oVFXp42OXk6eGGhWSvC3vqKOMD2kQ_fRrIgeGIs0DumQ>
    <xmx:e-orZulJhAs-_DIDuiP7Z2Kesp3Xpfl4fykUB9-90inC-y9tyJQbGg>
    <xmx:e-orZnOTeTN4e1ewaFMKG5s1N43_V4aQ6ALUgHtHZyigOWZTL-OavEPO>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 0/7] MSI-X support with qemu in stubdomain, and other related changes
Date: Fri, 26 Apr 2024 19:53:57 +0200
Message-ID: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series includes changes to make MSI-X working with Linux stubdomain and
especially Intel Wifi 6 AX210 card. This takes care of remaining reasons for
QEMU to access /dev/mem, but also the Intel Wifi card violating spec by putting
some registers on the same page as the MSI-X table.
Besides the stubdomain case (of which I care more), this is also necessary for
PCI-passthrough to work with lockdown enabled in dom0 (when QEMU runs in dom0).

See individual patches for details.

This series include also tests for MSI-X using new approach (by preventing QEMU
access to /dev/mem). But for it to work, it needs QEMU change that
makes use of the changes introduced here. It can be seen at
https://github.com/marmarek/qemu/commits/msix

Here is the pipeline that used the QEMU fork above:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1269664578

Marek Marczykowski-Górecki (7):
  x86/msi: passthrough all MSI-X vector ctrl writes to device model
  x86/msi: Extend per-domain/device warning mechanism
  x86/hvm: Allow access to registers on the same page as MSI-X table
  automation: prevent QEMU access to /dev/mem in PCI passthrough tests
  automation: switch to a wifi card on ADL system
  [DO NOT APPLY] switch to qemu fork
  [DO NOT APPLY] switch to alternative artifact repo

 Config.mk                                           |   4 +-
 automation/gitlab-ci/build.yaml                     |   4 +-
 automation/gitlab-ci/test.yaml                      |   4 +-
 automation/scripts/qubes-x86-64.sh                  |   9 +-
 automation/tests-artifacts/alpine/3.18.dockerfile   |   7 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile |   2 +-
 xen/arch/x86/hvm/vmsi.c                             | 215 ++++++++++++-
 xen/arch/x86/include/asm/msi.h                      |  22 +-
 xen/arch/x86/msi.c                                  |  46 ++-
 xen/common/kernel.c                                 |   1 +-
 xen/include/public/features.h                       |   8 +-
 11 files changed, 300 insertions(+), 22 deletions(-)

base-commit: 7846f7699fea25502061a05ea847e942ea624f12
-- 
git-series 0.9.1

