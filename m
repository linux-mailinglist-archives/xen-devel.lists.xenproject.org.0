Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B96EEB52
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526383.818120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpu-00013y-Dr; Wed, 26 Apr 2023 00:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526383.818120; Wed, 26 Apr 2023 00:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpu-0000xw-AA; Wed, 26 Apr 2023 00:16:42 +0000
Received: by outflank-mailman (input) for mailman id 526383;
 Wed, 26 Apr 2023 00:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSps-0008T0-LV
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:40 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d048d4c-e3c7-11ed-b223-6b7b168915f2;
 Wed, 26 Apr 2023 02:16:40 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 504E7320046F;
 Tue, 25 Apr 2023 20:16:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 20:16:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:36 -0400 (EDT)
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
X-Inumbo-ID: 9d048d4c-e3c7-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468197; x=1682554597; bh=Cq
	ssG/KC+YvF49hzLtSeRQGnmHXkLm9FnGPzRc0yuiY=; b=FkqRwE5Bn4jO0B0CS/
	TA+FHAAPJoTdI9VsGJaqkUmHip3J6zjja/1Nphj3Lgj67Cfv1kc1dPb3QlVmvZoI
	5by8SuHpWAk8sGhk09E/d7Bwks8yjaFvXfhaXFkoK6A/9sEIGbgOnNjVjf3RtTKA
	1gMcgauVczqX7Pn43DCF081X3hi/agBhsJwx5mq4VjATPJ7NB0VwT4ZnrrjryXUz
	qAI5IypjsCegE3uqK6ip5W34Jo/RQ/s4wJEZSZi1cVTiKpHor3QENZ/z9xOT83h2
	8QHEDmBZn9do+Fj48WK8i0pPsf64cxwNsTXS1gbNHIpsYTltpuhXYqZ2xJzsypv7
	d/yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468197; x=1682554597; bh=CqssG/KC+YvF49hzLtSeRQGnmHXkLm9FnGP
	zRc0yuiY=; b=Wbl0Dytlkd0lKjIbe6t9AchnDCRQkS7/w/d126/UMletBGaSAzt
	P9YBZwNZ42PsVn95SD1VGUvIL66ba3WF3OC7wJh97VjuLaa/RJ4qyAQ4+BWzYsU3
	DhSsfRjwCWUShC87Nv+JpoidaJsT/FUaLS+ZA5ddsDTMiq4o9vAxrQY4WDDOEjWK
	FqmGcNHvDJIx1OpOGVdDcyNd5dFNLcXJd1zj2hzd17m73XHk0n64VVVf3vZFL4me
	GClUDumJE3p8wmRaq6hnpe70ExpOjfftXII0K3x9uLqypKhZsY5UGO3zcWF3puyG
	Cm5xmTiA8YXeBkSVq4rGHgk5TcemmZJhBXg==
X-ME-Sender: <xms:ZW1IZOwzQFdqhw1r8sM16xouaVlzQXTqF3O3zzNx8lbOU1EpgG9eOg>
    <xme:ZW1IZKQ_gqIl2nsxMicAZMr7rjOa9xiBmxbvF5sLhB18vGSsnJamDGAeiCCYkykyK
    ntVZvJRM78ZmA>
X-ME-Received: <xmr:ZW1IZAXJMhGxoRw8NSEskFcL8ZeVPN909dTVoWILRRt0acGLRfg8gEItrjTWUp26EePhdOW6eMmoBNDEXXGHMLfwWe-d-YI9Mr2C6cnYJRJCv9s68DzB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZW1IZEiBud7mqi_Xjsebc-Q6F9QW6k-JZ6NRnlyfB-gmMXU69-o_fQ>
    <xmx:ZW1IZACAxlkZeRpSheHbleB4RGCSwTseCCk2xuLby3SQOexjYIKjJQ>
    <xmx:ZW1IZFIcaxGYJ5r7rwVchsvQ1ohl8mGr9U_vRC4OLHokmemkLeQGmw>
    <xmx:ZW1IZJ5t9G-M6dk5HNlVstpn6mVWEWr10NniYiI0qIUGAioE_Bndaw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 4/6] automation: wait for the login prompt as test end marker
Date: Wed, 26 Apr 2023 02:16:14 +0200
Message-Id: <7a0e3b0f6373ce9ad0bf66ddb1535ca9c4fed0fc.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The login prompt is printed after all the startup (test) scripts, wait
for that instead of "passed" marker. And only then check if test passed.
Before this patch there was a race: "passed" marker could be already
printed, but the final check would fail because login prompt wasn't
there yet.

Also, modify etc/issue in domU rootfs to avoid confusing the one from
domU with the dom0's one. Use the dom0 one as test end marker.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
changes in v2:
 - differentiate dom0 and domU welcome message
---
 automation/scripts/qubes-x86-64.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 916dbaae59c3..6c0309704661 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -66,6 +66,7 @@ ${domU_check}
 /bin/sh" > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
+sed -i -e 's/^Welcome/domU \0/' etc/issue
 find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
@@ -159,7 +160,7 @@ if [ -n "$wait_and_wakeup" ]; then
     ssh $CONTROLLER wake
 fi
 
-until grep "$passed" smoke.serial || [ $timeout -le 0 ]; do
+until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
     sleep 1;
     : $((--timeout))
 done
-- 
git-series 0.9.1

