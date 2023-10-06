Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18B7BB033
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613209.953616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDp-0007Lr-Jc; Fri, 06 Oct 2023 02:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613209.953616; Fri, 06 Oct 2023 02:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDp-0007Fx-EA; Fri, 06 Oct 2023 02:05:45 +0000
Received: by outflank-mailman (input) for mailman id 613209;
 Fri, 06 Oct 2023 02:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDn-0006iR-Ht
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:43 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8627954-63ec-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 04:05:40 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BABED5C02C3;
 Thu,  5 Oct 2023 22:05:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 05 Oct 2023 22:05:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:37 -0400 (EDT)
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
X-Inumbo-ID: d8627954-63ec-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696557938; x=1696644338; bh=rY
	iD5wjT5lR/FmYnOgmeYV6aNTCLJNrgwGj8H4KUxtg=; b=UlzKbUIBbxLJr3a8gX
	YqxLVjLx3sMfERwZ556FD+jTPz3nnCLBgURZ8bW/7ScweJ5tZJCMs2Xanj7V+cxw
	cdh1vT6+Rg2m8RmVo95GXltF2oUv1e5PIbegfEtzNAq214yd301CLyhRQn5kkulk
	1TYYrM9Ii8RsCBAc80/2YFPoMEc1yIUGHdK+szWP5LpLBFnugpojVnkUP7z9zD1S
	A/mLJnuecr9L9LbWpi6iTwF68ppVcohMZTkTznb2q4X4R3hi3XC+A9EPPWPB9Bnl
	SR3cHO626IrAZvE3R5Z22LOzjyFmb6DKD2JiUiFjvkqXrPGe4aqEiSC2fxvz/O1t
	rICQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696557938; x=1696644338; bh=rYiD5wjT5lR/FmYnOgmeYV6aNTCLJNrgwGj
	8H4KUxtg=; b=P6u5ijZAvXBsuuCbCheNwBNEnH6dmGP9CyiFjJmbifPEqFolUX2
	TXS/QyCER/JTrJLa3lBHC557/rPSOie2JpXd+AK0YUoVELG5Ein4GscXdU/CdksM
	aEeCtYmhKOrqzKaQPTBitFD2G6Casy4rQV83JR6bqWP0hrM58hTKsIzDVjDw45lk
	OxXuhc4KA5Fnndh3ueGYSpaxQ8yHm0AdYjWnUJZsJMzQ/mLuAwMxEcpZnTwPY77T
	tcS5bS6LAMxy7NiMvEK6F5FVu7mdgdmJrVKvhuBNHbmJ6UXSIp5KFHmA30PZ++ag
	ATX0OMO5e1o/ZDnJEZ1StmndK/WM9n7Id+A==
X-ME-Sender: <xms:cmsfZWR6hyUdaS2YWcE4Iyo-GvxOE9JBGgg_h7Dgqo3dOxII7WVXYg>
    <xme:cmsfZbwQy4bV6uImWP7youPuxAyUwRUwrvDS_IzYFNqvBe2JHJd-2WH-wj4Ic11C9
    qz8_gm7Ed6jxA>
X-ME-Received: <xmr:cmsfZT1gL0KHoML6g8aUJ9JA9t02Vw6gZc2vXfcRzGtl-llspuRiHN00yjKGWaF9K_luDgj603FQwSF9xy7qEzSNWhyWlxhRpVb4aAgYgndc0-og-QwP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cmsfZSA0wqHp6aUmb7kv7Zv-zotBoGbQI0ULvr-rwf1DoFctUmoseA>
    <xmx:cmsfZfi1SGSi9BWuTa5-gZkLv60IJJPDTXlf5HgY84aUPN-eLMuVfg>
    <xmx:cmsfZerm-FdS6pi6-Qfu7O--NtYDBS6wchc29irpKtuo_KMFfTWo0g>
    <xmx:cmsfZSuKBygzSg9uasL6ewefdoJbHZ5OFCYQH-PhvuoZ2nuwLZzlrg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/5] automation: cleanup test alpine install
Date: Fri,  6 Oct 2023 04:05:17 +0200
Message-ID: <c824d0e0771e3fa266606929df7972185debebda.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove parts of initramfs for the test system (domU, and in few tests
dom0 too) that are not not working and are not really needed in this
simple system.

This makes the test log much lighter on misleading error messages.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/tests-artifacts/alpine/3.18.dockerfile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 32aa8e177847..333951d05e84 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -40,7 +40,6 @@ RUN \
   rc-update add udev && \
   rc-update add udev-trigger && \
   rc-update add udev-settle && \
-  rc-update add networking sysinit && \
   rc-update add loopback sysinit && \
   rc-update add bootmisc boot && \
   rc-update add devfs sysinit && \
@@ -48,18 +47,17 @@ RUN \
   rc-update add hostname boot && \
   rc-update add hwclock boot && \
   rc-update add hwdrivers sysinit && \
-  rc-update add killprocs shutdown && \
-  rc-update add modloop sysinit && \
   rc-update add modules boot && \
+  rc-update add killprocs shutdown && \
   rc-update add mount-ro shutdown && \
   rc-update add savecache shutdown && \
-  rc-update add sysctl boot && \
   rc-update add local default && \
   cp -a /sbin/init /init && \
   echo "ttyS0" >> /etc/securetty && \
   echo "hvc0" >> /etc/securetty && \
   echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
   echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
+  echo > /etc/modules && \
   passwd -d "root" root && \
   \
   # Create rootfs
-- 
git-series 0.9.1

