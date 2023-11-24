Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BE7F6A3F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640075.997906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ9-0002bu-3W; Fri, 24 Nov 2023 01:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640075.997906; Fri, 24 Nov 2023 01:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ8-0002UQ-V5; Fri, 24 Nov 2023 01:48:38 +0000
Received: by outflank-mailman (input) for mailman id 640075;
 Fri, 24 Nov 2023 01:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJ7-0002RQ-No
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:37 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e91973-8a6b-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 02:48:34 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C8BCC3200A49;
 Thu, 23 Nov 2023 20:48:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 23 Nov 2023 20:48:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:30 -0500 (EST)
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
X-Inumbo-ID: 92e91973-8a6b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700790511; x=1700876911; bh=LX
	yAOwjjde0ByZ9X1DEhA7dY4ff5w8COeOtbRqSP8vg=; b=Pdug+HOGAg7VS85J4z
	BNN594jq/XE/8+nYpETemTpPhbQDUo7R9Vl3D2sZh8qGPDEGE2kMRj+my8W9ZjPX
	OiTtAaPSAdtp/8JcIwZAK7xEmT3ts0tUF5zwayUmbwuGk48/9fG2rqnpaLHCSlR4
	I/tbZ38ooYCDO3LgmDADS/441aJYHU5mB/e+WbTNwwYyCPlDYFIJGHGxvnPzWKoT
	oQLUa8lJs53nFwzwp1d+8mnxFO0KbDyWUry5TCq2uo92WkJOmqRnjhgXr0foEyAO
	03JzV5fT+seBNl4wDLqo17cXrUCZuMIeY4/B+IeKsmebWo8zuAjsjMYBsV+He5as
	iVbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700790511; x=1700876911; bh=LXyAOwjjde0ByZ9X1DEhA7dY4ff5w8COeOt
	bRqSP8vg=; b=jYGZRnb3loPFsO7oIZa6c+7DpFES3Hkd7fWkz5bKhkh6p+GZBrE
	8i/nVMl8eItIqi486wZgJxdbaJXrD7xtiptOcFjC4vW7t2PPFBNrScfD6220o01g
	VZTPRqdmVk4Zte45ww2kVEm6SdltYt2bJSnQp5dOVJ2ulCuw/AuKHaIMLWiNIXfy
	BVELY3H1AJoDHzM3FrfnYTToAlJzXmN2/Kjph31aZt5Dh3t+mlidMcHp0omx5aI5
	kHF9yEkbXN7fDAxuE4y+R/voMWx1duOJAqsTqx4C9AKQ4ZUrJYQTjVTJfbexPopZ
	bZp75RCKiygMFKrpgZGCx3mURi7CB7cT8+Q==
X-ME-Sender: <xms:7gBgZYKnik_CEQZkxN3nKWP_otbU-0Z4hShAjNPmnaVpBdNMGhBd-Q>
    <xme:7gBgZYI6VuA0hiNKdSiYrVBsp89wC9hxoN_M_xnQtNkjLLoFBHmr12vYYRLNNqG-g
    BoB-lBd7aDKkw>
X-ME-Received: <xmr:7gBgZYsNgKC7N1fMZRs3h2I8Sz92NyVz_lm7zrBaJUjJdC244D9qg1hSkawk5ZkaKMDgk8vvp8tBndWkTJ6Z_YLMvneezNn1V0lSHYHRtn4bAFULl9_9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:7wBgZVYSuK2Zi39Sh-YxS862c6su0qEQLyA2CHd-NcbTdW8dDjPWag>
    <xmx:7wBgZfbWZA_ncTD8ZF4uUfTDlnB5J8bL4WY4_2m7l07DoH3hb7myxg>
    <xmx:7wBgZRAnvyaPjIrSsOJvwtG4Vrl6k0mrTZ-I8EmXCmuvUjOqFEXcjA>
    <xmx:7wBgZWzS4uOX5olN9WC-Ed7FLKYlFfy_yyWz3vhjLpWFNZ-46suYVw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/6] automation: prevent QEMU access to /dev/mem in PCI passthrough tests
Date: Fri, 24 Nov 2023 02:47:07 +0100
Message-ID: <5c7cf4c680200c37187b90eebc49f600865c65ec.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/dev/mem access doesn't work in dom0 in lockdown and in stubdomain.
Simulate this environment with removing /dev/mem device node. Full test
for lockdown and stubdomain will come later, when all requirements will
be in place.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

