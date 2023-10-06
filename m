Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDF27BB032
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613206.953589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDn-0006kX-O5; Fri, 06 Oct 2023 02:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613206.953589; Fri, 06 Oct 2023 02:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDn-0006iX-Kp; Fri, 06 Oct 2023 02:05:43 +0000
Received: by outflank-mailman (input) for mailman id 613206;
 Fri, 06 Oct 2023 02:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDl-0006iG-I2
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:42 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5e78b50-63ec-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 04:05:35 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 33B495C02C3;
 Thu,  5 Oct 2023 22:05:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 05 Oct 2023 22:05:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:32 -0400 (EDT)
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
X-Inumbo-ID: d5e78b50-63ec-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1696557934; x=1696644334; bh=szqnVi6g9mbzzXBsjSHixzKi6
	OJf1LsbfZomEo+ZX1c=; b=omUDQ/vP9e8y/je1JHL3bB1tckknt/D5Qh/3JQ8df
	Yn03iDsLgOPOoAFaG8Ykhik/4ZPdBWaXiD9m+7WKoY1WvF4BBx86CZjbwxjFguQw
	qf6F1rvEeCtspqlHfoFrFty1YSdfzZjs0BM5kxxMoQNnWR5+RRdynCZedwvtXix9
	KF2PXvhEPvE5Y1Omaea0KP0woa4SWkn07xDrOU5g/9OueTp88M4JhWzbJu17DRPD
	dZL7EaejilMZGTbQAOOMDmOh5whm75KoTEggAGgLCKGMLhKoOCcNI2Z+anal/JUf
	dquJLSSdmjtkMnTaal1wHnQIR7LDUR+F6ymuew1Tw6w9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1696557934; x=1696644334; bh=s
	zqnVi6g9mbzzXBsjSHixzKi6OJf1LsbfZomEo+ZX1c=; b=rUVkRfRO3ux6+p06j
	4S7NMZAA5A6U7QqSyECs5N/7Ppb3RsHrxk9BgNaCG2GNWjtcYwTW8gPGV8yIBTsq
	7uSAq7PGqVuxC3D2IJbIffPkszJDKFzHOtWpEmkLw1UrK4yQQgSD4k4j3mv+EPcr
	IcOzYGpnQPVEx0RbGY5wVlSSxrNc7+rf02PUfCZ0qATahKfW0valSRpkH/pX60lU
	CICVlkjgXs6dw5rVNwcq7qafwGHUR9FQJCYGIgS4dOzJIDUDiT6x8Ef+QpEgmInx
	RGNEzbZ1N1gaLImXpjsDtf9yvXn75zn+rDXIjrshloSW3zssYhwGlFgSEj+YrD/i
	FAzmg==
X-ME-Sender: <xms:bWsfZe7Vq7bwCQXIrJWZkyBwT3QMOoqhsVz-fZUKpXb1CqYzN_6Q2w>
    <xme:bWsfZX4GvAwHwQVN6R6NTCYk201WwJbYhWWOD1QI9WIrLwPHlg8xMXBwAOSwYG8YM
    z5RjEbk_09mzg>
X-ME-Received: <xmr:bWsfZddPbJF48fb3sbDYxsOfPo3QUOdKQh0eHAWY2aVN-ZJgaKJHfF_QRxp-m7oLV2NtViLoCjFMOg1QZO-sX5HwlB-rVma6l0LBWC2uxCa2RyICSzLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeeufefh
    leeikeegfedtgfeiueeghfduteejtefhfeevheffjefhieeggfejkeelnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:bWsfZbKU8IsJupGjJ6FWdCN_0ZgIYtkYY8OZerxyOzkJsfXQkN_wvg>
    <xmx:bWsfZSIAY2d3buS0cQ3f7OhaMv0WmIp_0j0FvDKaudVFlfgX43rR-g>
    <xmx:bWsfZcw2hBNMGIiisDYnGbB7ae382GI2sorlOwgwjAC0DksvioOzSQ>
    <xmx:bmsfZZUvjbBsUMgdfdtN7eVs2SXjRxFyqdr2PI79327sMBBeePSpEA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] automation: cleanup hardware based tests
Date: Fri,  6 Oct 2023 04:05:14 +0200
Message-ID: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on tests for MSI-X, I did few cleanups of hw-based gitlab tests,
greatly reducing false positive messages in the test output.

After applying this series, the tests-artifacts/alpine/3.18 container needs to
be rebuilt.
Test run with container rebuilt (on my repo):
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1027467761

Cc-ing Henry for release ack.
---
Cc: Henry Wang <Henry.Wang@arm.com>
Cc:  Doug Goldstein <cardoe@cardoe.com>
Cc:  Stefano Stabellini <sstabellini@kernel.org>

Marek Marczykowski-Górecki (5):
  automation: include real-time view of the domU console log too
  automation: hide timeout countdown in log
  automation: cleanup test alpine install
  automation: improve checking for MSI/MSI-X in PCI passthrough tests
  automation: extract QEMU log in relevant hardware tests

 automation/gitlab-ci/test.yaml                    |  2 +-
 automation/scripts/qubes-x86-64.sh                | 29 ++++++----------
 automation/tests-artifacts/alpine/3.18.dockerfile |  7 +---
 3 files changed, 15 insertions(+), 23 deletions(-)

base-commit: 3d2d9e90224c4f430a7ee1190fd3b871b99b0ba0
-- 
git-series 0.9.1

