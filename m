Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697D69DF32
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498796.769749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR58-00035e-TH; Tue, 21 Feb 2023 11:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498796.769749; Tue, 21 Feb 2023 11:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR58-00033t-Q4; Tue, 21 Feb 2023 11:45:14 +0000
Received: by outflank-mailman (input) for mailman id 498796;
 Tue, 21 Feb 2023 11:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6azs=6R=zhukoff.net=pavel@srs-se1.protection.inumbo.net>)
 id 1pUQrX-00006G-F0
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:31:11 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3940b7b7-b1db-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:31:05 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 128645C00AF;
 Tue, 21 Feb 2023 06:31:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 21 Feb 2023 06:31:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 06:31:02 -0500 (EST)
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
X-Inumbo-ID: 3940b7b7-b1db-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1676979063; x=1677065463; bh=i2ie1WFcVhi5uCvumoVgxqFPz
	hMCaPOtaACT2Dv2yC8=; b=abSYmEdhvfIoXEM1h3Z+p9zx2omIvHh5XPQcGavD/
	buJWUhwaBMUgXgkpGNNSoTSPNifhgJwIZF6qKUtqUTl3vFsMMJwcUwuXjYzpNvaV
	qtQyKpHMR/wWeeokyZNCk4GlYl7LexW/orRN8DggJXvXLhR6fGiKOlAYtVd2/gEN
	qyljxfpTcTVAjwb7WE/301hYym4HYRrRgMQ4DKTr8iwO52zmk+7oK3GOh6mjhMul
	T0faNRQ4UJzaSihqE5tW1NyYzrZhc3MRzu+SPBpr3jDKyyZwCAV4qK1iWe5UNld4
	c4v+9aOmTQerRiHglBAYuVMLId4b54f+1FM9xNxG9hlbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1676979063; x=1677065463; bh=i2ie1WFcVhi5uCvumoVgxqFPzhMCaPOtaAC
	T2Dv2yC8=; b=Lb4rCoUy3xxRetZZPHCUxereLUzvGnK7uwTSwc+uvnx08R0kHnc
	VyyyRxw/QwUiYuz3qxNU7YjDBJjBL3gMzn9htauqzo/BP5XfXkQl6qAyCtGUuFL2
	+Kf0XbUYr6332BxuWRXjqCMeyrSBJ5KCYGslJQOU8JQ1+G9Q8bmI2aN6LuitrUjP
	JjuFHzzNVaq+MwZU6YRKqw/dx49wJ680juY0ZNzYUUEd76OsOCS+ST6CYEikR5zg
	alp+XsNf6NakrFpMQNpjLvz/Cr1921smbFX0Nshac6uSu0oAaZo913tGNZh2fjbO
	w4eQiXuUYfmiLqU7yjrkZGj0PwB4b31VFGg==
X-ME-Sender: <xms:dqv0Y4OJWxy58oYm3F7yxXjnq0TOI1w2DAen_UHcA5u2gb8vYBgUoQ>
    <xme:dqv0Y-9aP_dG8Xjj92gK9-d56aE7aJv6Xbyjq-7FP2STo34kEfjH3u8FFIJRhuJ64
    FrNR8MM9UVK6n5p4XM>
X-ME-Received: <xmr:dqv0Y_TJYD9EBMnzD4dn2PYBTX1pQNYLC12S_ygjnA_GwDc_eVWf7MDJbfOeIpd-Vw0MpHTEmdET>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:dqv0YwuhevuhNkgImTzay4_bRmD6sKCmPhD9-U_EWGCS_ZNru_RETw>
    <xmx:dqv0Ywc4TnydFXkxHUJCkYJgpILAn2ju7nTQHLpjj0rOuZ1toZaAew>
    <xmx:dqv0Y03B_mx6DB4TRLl0aVTfIvbbPx5PlU5Hh7FYx8VONE7dgIrPvw>
    <xmx:d6v0Y8GiwstzL-cIxMYl081N_XlGroreCGnf7B2mde7qDxp5v9Yitw>
Feedback-ID: ib94946c9:Fastmail
From: Pavel Zhukov <pavel@zhukoff.net>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Pavel Zhukov <pavel@zhukoff.net>
Subject: [ImageBuilder][PATCH] uboot-script-gen: Add virtio loader
Date: Tue, 21 Feb 2023 12:30:36 +0100
Message-Id: <20230221113035.5899-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uboot supports virtio-blk drives and can load kernel image from it.
Adding option to use '-t virtio' for loading image from virtio device

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 README.md                | 14 +++++++-------
 scripts/uboot-script-gen |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index cb0cb13..64e62cd 100644
--- a/README.md
+++ b/README.md
@@ -267,9 +267,9 @@ Where:\
 -d specifies the "root" directory (paths in the config file are relative
    to it), this is not a working directory (any output file locations
    are specified in the config and any temporary files are in /tmp)\
--t specifies the u-boot command to load the binaries. "tftp", "sd", "usb"
-   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1"
-   and "load scsi 0:1", but actually any arbitrary command can be used,
+-t specifies the u-boot command to load the binaries. "tftp", "sd", "usb", "virtio"
+   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1",
+   "virtio load 0:1" and "load scsi 0:1", but actually any arbitrary command can be used,
    for instance -t "fatload" is valid.  The only special commands are:
    fit, which generates a FIT image using a script, and fit_std, which
    produces a standard style of fit image without a script, but has
@@ -339,10 +339,10 @@ Where:\
 -o specifies the output disk image file name\
 -a specifies whether the disk image size is to be aligned to the nearest
    power of two\
--t specifies the u-boot command to load the binaries. "tftp", "sd", "usb"
-   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1"
-   and "load scsi 0:1", but actually any arbitrary command can be used,
-   for instance -t "fatload" is valid.
+-t specifies the u-boot command to load the binaries. "tftp", "sd", "usb",
+   "virtio" and "scsi" are shorthands for "tftpb", "load mmc 0:1",
+   "fatload usb 0:1", "load virtio 0:1" and "load scsi 0:1", but actually
+   any arbitrary command can be used, for instance -t "fatload" is valid.
 
 
 disk\_image supports these additional parameters on the config file:
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 7e5cc08..f07e334 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1025,6 +1025,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
         sd )
             load_opt="load mmc 0:1"
             ;;
+        virtio )
+            load_opt="load virtio 0:1"
+            ;;
         usb )
             load_opt="fatload usb 0:1"
             ;;
-- 
2.39.1


