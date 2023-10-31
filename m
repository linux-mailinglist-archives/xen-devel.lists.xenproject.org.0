Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460367DC438
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 03:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625454.974742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxeK4-0002Zy-Cl; Tue, 31 Oct 2023 02:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625454.974742; Tue, 31 Oct 2023 02:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxeK4-0002Y9-8z; Tue, 31 Oct 2023 02:17:40 +0000
Received: by outflank-mailman (input) for mailman id 625454;
 Tue, 31 Oct 2023 02:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwBg=GN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qxeK2-0002Y2-EA
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 02:17:38 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65b1a62-7793-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 03:17:34 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D5EC5C01E9;
 Mon, 30 Oct 2023 22:17:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 30 Oct 2023 22:17:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Oct 2023 22:17:31 -0400 (EDT)
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
X-Inumbo-ID: a65b1a62-7793-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1698718652; x=1698805052; bh=zYMfoQZoxqDRcFBjijlGHhNbY
	0JZtNCtyhnKb84g17Q=; b=A31AKVkPDgdT+w+gVQpGBIsE5PZeRATEYQY8EzIp3
	tevYFDFXfZsbz2UEKCgdROx+YLRx9/dN5kal5iW8qJ+1Jc0n6/bjaKPvi4/cnG94
	rewn+1DMwDE/nzD87kZ4BlNbyssCfZznyfs8azsuoLVb9iPpA7PNcjvxQd8H5CeL
	/1tgwThEu1leUUgD7aneWcxsOaG3KlByAbVjG1vIJ1BrjtvL0GIZdKvEeG9pXsHB
	CcTjgSJl/XNuCOiE+yKnaC/ggNAF8/GWUrVgKi0wpuo70x7MA51nEn92oljTVCgJ
	l5IaGhUUUzSGxmiZ4wcgYLvowKkpCIfSa2odl5k7I6ruQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1698718652; x=1698805052; bh=z
	YMfoQZoxqDRcFBjijlGHhNbY0JZtNCtyhnKb84g17Q=; b=tMKFu20R1LNTNuBgd
	OdCn7xaOO+rPfPp7j7iW2mIVU7TUC3ymPDAvOanuPNUZHW+vpjMveve0n2HS5usZ
	S8gQSDpMiVsHFqaZCXqBT5Pd7wjT6W19ZN3n37S35NKU7VmZq2Omn5Cu4JRe4q2M
	Jloo02S/LfVVHQ2RAJqg0vJQOIENsn7vaaV01E+6zaekxODE7ZO6YI3TJ+AdWCp9
	kNMvjZ+/JU4s1cPtnPsakAF4MI0ZB1nL2wjMxWniwFdcGZu0FIt3kAKGR/RNdQIT
	xye3QoHLX5KO5w1M2peULHVal5l78MD8RtDPmXWsvEMJbf+yA8wTDIBZaqZzeVQ1
	RT9uA==
X-ME-Sender: <xms:vGNAZU-5QWmbcIE9_PsM17lISfbsTq5mE82Y-ruN03qg8qn42rcvaA>
    <xme:vGNAZcv8QnxHcz5bAdl-tfGfdavfSVSPlEmqgBDyYEnuXMRdfuacqoWFXUv5m3sLI
    KaLxWAiDEjMcQ>
X-ME-Received: <xmr:vGNAZaBcKCS_Okmidyzqh361KxJQXEhELA5B2dgBd5PD03kfwmyoxG0zV6N5SqDQN-aW0E8AwGXtIFd3ztrlIPw9QsyKsWUJrjXoZ8ui6kC49HiKdaE1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtuddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:vGNAZUecyhAXdfb_XWjh5PL5E4F_X7mPm9kK51BlwOVS5WdDlLiI-A>
    <xmx:vGNAZZMYZA6TYNi2IjyMMybt3Hz6a1DOzeTFDw_8f29qNzEP7iKF2Q>
    <xmx:vGNAZekkHbEtGwrBIhvTiiZnOuPBSb10K4o0J4WJFaCtslvjjWGgzQ>
    <xmx:vGNAZSaFNJ0hdAlMLF7Qzk4DsDur_m0eBgYHOO3RP_PMFl84T7x_6Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.18 v2] automation: fix race condition in adl-suspend test
Date: Tue, 31 Oct 2023 03:16:53 +0100
Message-ID: <20231031021712.407318-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If system suspends too quickly, the message for the test controller to
wake up the system may be not sent to the console before suspending.
This will cause the test to timeout.

Fix this by calling sync on the console and waiting a bit after printing
the message. The test controller then resumes the system 30s after the
message, so as long as the delay + suspending takes less time it is
okay.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This is consistent with the observation that sync_console "fixes" the
issue.

Changes in v2:
- add sync /dev/stdout too (Roger)
---
 automation/scripts/qubes-x86-64.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 26131b082671..0f00bebdd8c8 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -54,11 +54,12 @@ until grep 'domU started' /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
 echo \"${wait_and_wakeup}\"
+# let the above message flow to console, then suspend
+sync /dev/stdout
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


