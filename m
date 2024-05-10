Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749988C1D3A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719466.1122248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM1-0007hs-Hk; Fri, 10 May 2024 03:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719466.1122248; Fri, 10 May 2024 03:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM1-0007gE-E2; Fri, 10 May 2024 03:55:29 +0000
Received: by outflank-mailman (input) for mailman id 719466;
 Fri, 10 May 2024 03:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HLz-00077u-8E
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:27 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219c5a54-0e81-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 05:55:26 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.west.internal (Postfix) with ESMTP id 3CC8E1C001A1;
 Thu,  9 May 2024 23:55:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 May 2024 23:55:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:22 -0400 (EDT)
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
X-Inumbo-ID: 219c5a54-0e81-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715313323; x=1715399723; bh=hZ6VYL08E0
	Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=tZJkovbMemvjdPp4zK3A6sZR2J
	V20Npezq6UOnjrEZwu8Ea7YNkKGVs+gC7ZFUIHO/nAgNkDQqM8578BfAREpADbSY
	yDz8f2iE7q1qTvaWC85+WQ2IDUlijA5nPdSprsEf9Xge8MgzBxX3BYPSeI2enXsZ
	CSoJ5HyzAErAHaiZ0C7wXnREeZFdrQUD8HkKwAdSDnix6nb/6ZUSiQesuydDAil8
	ixHvInYbL0ZlocZD7x8Z7asNxu5CTp4tkFOtCMLWrU9fCBj0w4WnxpHQ5u3ZZouB
	s83j+4KBJiZr+a4Vk8fiudkndm/kgfDK+7ILr8bTV0ncoZdeMrSqJya9qTdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313323; x=
	1715399723; bh=hZ6VYL08E0Yxr0n/W2twXlHVhmqK+fKxAH0QY/uH+Wo=; b=N
	xyNYU8a2ezLe1UavSUvGnDz6vY3qcnI8kTm6L/haH/l0LPNELbDzOkQgzCMr4DN4
	kWFwyxRnwwniafQcY+GTjN2NQwpTbCJmrG5jk6GDUFvFv4Za/Jf48PU9iEEEYi/Z
	/wJtCS3dtat9QzD0yeEeTrCm1MmDKG90SQfjwTkecA1SLWu+VA3mhgfdaFOIhhn1
	EyHFZOQAKVeCw9a0tQvgiIUJrQjbR92UuEihYYLo7+OOMHF6pwFQv3TRkcAIZr7X
	2kjuHcdsHnDo/UW7+VtdtU3mZrYrfaQ1099V4QOS01l6rwTgeqY4vWqFZ4VTNazw
	DaowRZWDA2FfUHI2cAiUA==
X-ME-Sender: <xms:q5o9ZnyflwpGN4ZWgRVOrxPAYb3KorQeQqFoAo_FsBQgSeAjiBP1HQ>
    <xme:q5o9ZvRrHpInK7KrguMwCdVOXV3ANExIDHRmrD4rASUUIvwauYRPxI6gpvMhKXV9u
    6WWUntKOMt6sw>
X-ME-Received: <xmr:q5o9ZhWHQaBHe5G05gs0Ecw7Nnzx0UHXAnRsuU1Z05gd6HeSO5Z3_b-QedXc2Oxgfhhi_2cT7gEycc5fMzvTdNiUpj1nKHBi4nrF2-u05BpF4vSPLIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:q5o9ZhjOgh1Ebe-VpyUJCudImQ8b-49dsx89RPClbkIhNeiexxZQkg>
    <xmx:q5o9ZpAUPyA_H6lVfTxS7cg41TXOkqxPspawR7fq6fC9nVyoiCUMHQ>
    <xmx:q5o9ZqK9-7y8Ht06pFi5fLD-qce5966Bijl4UPqxgmdwXzdO_bHeEg>
    <xmx:q5o9ZoDbhGMG0e8ZaV1-A8SUD2jcwmyCrgIeCGt_OnkGoDxQrQD9ew>
    <xmx:q5o9ZoN1TaNdrj9YVccu3jHjQ6YNWjLmhy9cvo-V_wliIEyzlptuq03p>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v8 3/6] automation: prevent QEMU access to /dev/mem in PCI passthrough tests
Date: Fri, 10 May 2024 05:53:23 +0200
Message-ID: <38e018c5e94020ba37b5571088033cc6b648a8c9.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/dev/mem access doesn't work in dom0 in lockdown and in stubdomain.
Simulate this environment with removing /dev/mem device node. Full test
for lockdown and stubdomain will come later, when all requirements will
be in place.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
This can be applied only after QEMU change is committed. Otherwise the
test will fail.
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index d81ed7b931cf..7eabc1bd6ad4 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -163,6 +163,8 @@ ifconfig eth0 up
 ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
+# ensure QEMU wont have access /dev/mem
+rm -f /dev/mem
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 xl create /etc/xen/domU.cfg
-- 
git-series 0.9.1

