Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B27013E7
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 04:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534119.831378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxekz-0002L9-OU; Sat, 13 May 2023 02:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534119.831378; Sat, 13 May 2023 02:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxekz-0002Ef-JR; Sat, 13 May 2023 02:13:13 +0000
Received: by outflank-mailman (input) for mailman id 534119;
 Sat, 13 May 2023 02:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxeky-0002BP-63
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 02:13:12 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a47d85-f133-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 04:13:10 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 510185C0237;
 Fri, 12 May 2023 22:13:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 12 May 2023 22:13:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 22:13:08 -0400 (EDT)
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
X-Inumbo-ID: b4a47d85-f133-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683943989; x=1684030389; bh=V7
	ePsmBxwb4ItsH2fnAJjUEBAyFuGVIcqpRBvQlY+2s=; b=LLc/DsmcaGuqkDA7/G
	XFHH5kQ2LiF0qC9oFphHZSgUjFKAu7ZRM/jb7Ip0KqwNB7Esi5RPASBpF3RccMyW
	xAE5ode4eqDXH+DqneIzd4FZNM9cHR6m/AEuQGQgn5r9TSW1hMnLUnlH5+bFReB2
	M4rHb3W0ZQLr2eqQNyuXFUiPJY6SQUVkPccQQoud5X461iaCA3joGb2mBB4fkK1V
	Wc+Q17j1hzOsPWxy8rFkYpKNbEeGRA3837/SzXoNUbvsb8RtXW4ZZLOOd26QmPTL
	UO7YGJzA6Vq4qWpV79nvHm0MueOHTuD6FifzvridwC8TIG3GE+axorqfbBLAX1UH
	raOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1683943989; x=1684030389; bh=V7ePsmBxwb4ItsH2fnAJjUEBAyFuGVIcqpR
	BvQlY+2s=; b=F1MDuF1Tst97M5BRqz5IENsS8LrbtTvuPham3NbN04BzdDG6fR6
	OMBcRANWBFTh4BXaFOuIYxW23tUhnbMglqX4sjT4I8D2u+cIIEHSD9TVxhWyfZeg
	uWujucWTjfh6rRVqA3sjVRAPWjzZDjwdxsf/81YWrY25ROMnOBWFTwlS2+Z4zbnT
	muHLSBu0xycQNGTpAxFHyaLwzm8o59yucvshLhtOaiIAcuWoendGPOtvgm/9+eSN
	VNBOS82KIuN4F26jp/3u5/aXtQMe80yMj+HrEzVZanZyVxkOJJJrHEVsPX8svRWs
	mCLDV3K5M/SbKSD6GFdff+gAPZb/Y0oFWFw==
X-ME-Sender: <xms:NfJeZE7KzUtqfSkjSUFLowQHWXUBotwHQxOW2cf6u-q3rQ0aDU9Lzw>
    <xme:NfJeZF5TP5b494gkHmIYMLofdL5wWOkhWT0Iv9OId9k04vp6wyvcpuglgu0C6VzrA
    _pRd8Cf-Rr4Vg>
X-ME-Received: <xmr:NfJeZDdL5TPkH4ugsSFVqOBrEGYrUfFXF9QvVSEPhNKmgNkrgLZZ7i5l5XkyKbUAl6ndUfln9AZUH6KbNzrru_VwpXR7AGKlkQI46gJyzkepTTSjAvA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NfJeZJLcy2fYvk2SdX38X02RMqZeQ4wGjKKwzNJwKQ7C--5kGzVeGA>
    <xmx:NfJeZILa04iwJDI5vQz8E44KXq7DC9Q_o_PlVobmUGeylLm7Fq7x1Q>
    <xmx:NfJeZKxxQ0WPBJq7Tb0spfQD7C5se7mnJmW-jGgRNmogxORCe2qhFQ>
    <xmx:NfJeZCgot6nmU6NJ4OBg1s9jhH_v6sPGySoJ6JPaz3oMNFOD5dCI2w>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] automation: make console options configurable via variables
Date: Sat, 13 May 2023 04:12:44 +0200
Message-Id: <e0504797d1b3758c035cd82b2dc3b00d747ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This makes the test script easier reusable for different runners, where
console may be connected differently. Include both console= option and
configuration for specific chosen console too (like com1= here) in the
'CONSOLE_OPTS' variable.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This will conflict with Stefano's patch, as both modify multiboot2 line,
but it shouldn't be too hard to resolve the conflict manually (both
replace console opts with a variable, and add extra opts at the end).
---
 automation/gitlab-ci/test.yaml     | 1 +
 automation/scripts/qubes-x86-64.sh | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 55ca0c27dc49..cb7fd5c272e9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -96,6 +96,7 @@
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1"
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 056faf9e6de8..ae766395d184 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -184,11 +184,11 @@ cd ..
 TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
-echo '
-multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
+echo "
+multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
 module2 (http)/gitlab-ci/initrd-dom0
-' > $TFTP/grub.cfg
+" > $TFTP/grub.cfg
 
 cp -f binaries/xen $TFTP/xen
 cp -f binaries/bzImage $TFTP/vmlinuz
-- 
git-series 0.9.1

