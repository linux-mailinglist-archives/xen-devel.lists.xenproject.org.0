Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43512A7716F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933218.1335240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlS-0007jN-Dk; Mon, 31 Mar 2025 23:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933218.1335240; Mon, 31 Mar 2025 23:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlS-0007gF-9q; Mon, 31 Mar 2025 23:41:58 +0000
Received: by outflank-mailman (input) for mailman id 933218;
 Mon, 31 Mar 2025 23:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tzOlQ-0007EK-MP
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:41:56 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b87e1ca0-0e89-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:41:52 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5EA6625400CC;
 Mon, 31 Mar 2025 19:41:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 31 Mar 2025 19:41:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 19:41:50 -0400 (EDT)
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
X-Inumbo-ID: b87e1ca0-0e89-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743464511; x=1743550911; bh=/CKM8n07sr
	qu1dURNdhOJvraxhra2/MXqD4MBPinp7g=; b=mdUhm3k9NR8qMGy+r3rKjJPMs3
	D+6SyDD2vPw8fj5aM5wsBYn2EWxuiP/PcYytSLzvtDwZiboyrMxKzsTBXY1VP32X
	FSXUAiC8DU0vbr8L/59dMeEKYun6V10XI0G/yfGWwgUtuOmJLGiFS4j2e+MB8gtI
	Ltg+xEZ4jtY37HwUJWDmr0/CxVopyDKG2mlaMdErbMyX/myg54BfQvN1hno0HRVC
	yIgcdQ4Wt0vnwaGi/wcpXDPVH41DOBqMiGy8Z7pF2tmAvi/zm3oTYzV4IzBHdn7R
	u+qJRqqfqk9/r7NA9fKDjyz5nfl7IBT8Sgb4wMnlHlh2YH+ZiWxuFWZPhz9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743464511; x=
	1743550911; bh=/CKM8n07srqu1dURNdhOJvraxhra2/MXqD4MBPinp7g=; b=C
	5SJPCGSKqv/fLWkWp9UOsLAXQNydB+gynr9lVNU+8loAPcpcbRT0F0y2604tobYP
	qcS0g985TlETvbDYzMhIvo00/cjM7r+mVnS8xCgEbc7VWhJIQXw5TR7hM0vcyq2/
	Pzqqut/c8PpsQoAUKHGL46ECD2T3XfxgKH1zjuD02OAZlrDkAypzNv1pzZxfUULl
	NRo79AoudtrLmDK5GucB1YyDSpKipbJ59ZeHWB/QdT9bcHU4WnwdLiY5vN6/X+5C
	Idu/5DEwu+KOnb7Lg9G+ZQRKU7Q2OAktw4O1/r15R8bqQR5zwSpF00/zaJwP8TkB
	wmXGjCnusJEzkdmeaI6gA==
X-ME-Sender: <xms:PyjrZ0GivDjYsPG-kBLwS1stp-jMhwxbBKwNiioWnbF1vkpJ0EePBQ>
    <xme:PyjrZ9WX-dtmUgYIxwjWhedtxhrM1pg5UoDiBUJMPjiPBlIBAnvpXj1KwYv8RLm1W
    N-5CQp0i-1WNg>
X-ME-Received: <xmr:PyjrZ-Jba409QubaaAH80oqDqM7e7l_W1WU9pvfF7rJNtTfntoG8nOdEP0Kjl6ezDTa94f7mMBphBMm-YxS_e_L3YoQz-0p1HaS0Kt9lFoNLKYQHw3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeduvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PyjrZ2GXfqBMLS8j0bvps95i5bAUyfbwjUQRsLjOsblT6IBEaP33Gw>
    <xmx:PyjrZ6Vel_lloMThiDLtpuK0DlELyBmJWyo_vwEYG4QJaG17VnvF-Q>
    <xmx:PyjrZ5Mmfhtl6_OobU8b2D5hHVwlBMFD3W7anVjbeJs--BCsMKLwmg>
    <xmx:PyjrZx0QgIfIyLyJ_cMiodoJl6SJ515kYcgsc95LI_iDGFLBhyYBbw>
    <xmx:PyjrZ4ylpq07UhvNZUNouRJkN__4KaY5da4H89kdvuq6W3NCLxLQiVz_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] ci: create boot.ipxe for legacy boot
Date: Tue,  1 Apr 2025 01:41:35 +0200
Message-ID: <d9443966db489ac14081d26ddb34f5d2f03f310b.1743464494.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com>
References: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hardware runners that use legacy boot use iPXE instead of grub2. Create
boot.ipxe for those too - with exact same options.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Right now this applies to KBL (hw3) runner. And not many more, as newer
systems support UEFI network boot.
---
 automation/scripts/qubes-x86-64.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 7c80e0c23318..f27296445901 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -251,6 +251,14 @@ module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
+echo "#!ipxe
+
+kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts || reboot
+module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
+module /gitlab-ci/initrd-dom0 || reboot
+boot
+" > $TFTP/boot.ipxe
+
 cp -f binaries/xen $TFTP/xen
 cp -f binaries/bzImage $TFTP/vmlinuz
 cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
-- 
git-series 0.9.1

