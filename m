Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00A7DA50B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 05:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624732.973359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwa6k-0003IW-5u; Sat, 28 Oct 2023 03:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624732.973359; Sat, 28 Oct 2023 03:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwa6k-0003Gp-1v; Sat, 28 Oct 2023 03:35:30 +0000
Received: by outflank-mailman (input) for mailman id 624732;
 Sat, 28 Oct 2023 03:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HIYw=GK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qwa6i-0003Gh-DY
 for xen-devel@lists.xenproject.org; Sat, 28 Oct 2023 03:35:28 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05ccfa3c-7543-11ee-9b0e-b553b5be7939;
 Sat, 28 Oct 2023 05:35:22 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E72AF5C0352;
 Fri, 27 Oct 2023 23:35:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 27 Oct 2023 23:35:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Oct 2023 23:35:19 -0400 (EDT)
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
X-Inumbo-ID: 05ccfa3c-7543-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1698464120; x=1698550520; bh=x+fJDKu1XKqm+RWIGS9Y1RqzZ
	XaHFv/SGQeeRLP2hbw=; b=k1YRj4VT5oHviv7HyLTyZRC9NpXE8iUDK63Gpcvzi
	u8Xofn6mCavBfbzXv0nQo+mOXtDE8ogYZkkbTdfhK5bJs1DkIUNhQY/bckcQ/mNA
	qhWabQvGeizXP1a3KO9bNCy3P2o5ksLjbgToJy2zhl/ndwNC9BvI0UibTCtySlcq
	BwWxthJOZ3k1ocaNxEw9IZ8tqb2zD8dN8JZ2sRlIOsTZAhDwSWkxVLsy4FDT3H1T
	c/a8vV1Uk5K/wVMXr2fquN5C/66jWC6PUYNfbOZ4awZomtOG+oaLwcXxU0Z6Nn0l
	nHnF9Tmr8DJZ16foJbpp4ZpJqo9sYqZy9sW4POZaWrN5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1698464120; x=1698550520; bh=x
	+fJDKu1XKqm+RWIGS9Y1RqzZXaHFv/SGQeeRLP2hbw=; b=f6MqBWYyIGZv09LWw
	mjV6wGnGOWyQKFsCzwiymi6TvcJ+NM5ftqEGLd7ECZwxn1yI2O/7Is7KbhgMOFlx
	iOChbsL/L/x79UGWBWrEVzlOzezUAbYBw1YdEGBPWNDaFxn4QwpTRMBS6t+en0Em
	3lXwRmFWkGWTIsudN22m9iAo1GNlUqPDIG+S3P0i1VJXFVsW5ImkICJidWNtITkz
	Jms70G9eHuWviLU3//EQ1uWjiCWOlwIRfyMuYQAlQbpIZtcU3DVyhBIuR3SRvlAV
	/i8rv3T9oMBIlFGId/laO90pKV7JtpTN/T9M8jVh8BE7p8B9CWUJ27YHvjWC4ihx
	xEbnQ==
X-ME-Sender: <xms:eIE8ZW0Hb-TWYAoJTn_3OEixsIqQOFl_PEOOz1abXN1trNZgjAZUpw>
    <xme:eIE8ZZEzZKpVJDbwzV2gEbSWDcwf-DbqSp_BntuLVvCwEgaQ_p8qy3ulDl8pFxY1X
    Pna91qCEy4l0A>
X-ME-Received: <xmr:eIE8Ze6SCtJBmRpu84yFBkJrrts-dsxec2cAxbPjZeURuq-xo2Rveho5iKuQNVtklUo3bHDlCoL5Vw32IhDA7F4oPlSLWj4-VDGqYkyPO8KuPQy1yP5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:eIE8ZX3PzQo-qxNsPyklAaG8yJw9YRd1LVbwOYXuHi54M0_1rvSbQw>
    <xmx:eIE8ZZFqi2tsWVpgfbBxWzwvPPBI3cScrkNUKmvcp38W5b6Brym8LQ>
    <xmx:eIE8ZQ9CrYgH5rAV7Ii4zOCPGAeVOllXr9yhC_mTjudeA-YzI_bTog>
    <xmx:eIE8ZXNtzvNzqJDoRGDmJNIv0iK9rRII8xSMLMArxYG_f__cLGJ_HQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: fix race condition in adl-suspend test
Date: Sat, 28 Oct 2023 05:33:57 +0200
Message-ID: <20231028033404.262729-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If system suspends too quickly, the message for the test controller to
wake up the system may be not sent to the console before suspending.
This will cause the test to timeout.

Fix this by waiting a bit after printing the message. The test
controller then resumes the system 30s after the message, so as long as
the delay + suspending takes less time it is okay.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This is consistent with the observation that sync_console "fixes" the
issue.
---
 automation/scripts/qubes-x86-64.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 26131b082671..a34db96e4585 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -54,11 +54,11 @@ until grep 'domU started' /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
 echo \"${wait_and_wakeup}\"
+# let the above message flow to console, then suspend
+sleep 5
 set -x
 echo deep > /sys/power/mem_sleep
 echo mem > /sys/power/state
-# now wait for resume
-sleep 5
 xl list
 xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
 # check if domU is still alive
-- 
2.41.0


