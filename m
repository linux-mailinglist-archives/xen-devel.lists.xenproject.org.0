Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0470AE44FB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022376.1398207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVt-0005dK-K5; Mon, 23 Jun 2025 13:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022376.1398207; Mon, 23 Jun 2025 13:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVt-0005Xa-GO; Mon, 23 Jun 2025 13:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1022376;
 Mon, 23 Jun 2025 13:47:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVr-0004sG-R3
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:07 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cff6737-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:07 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 15AFE13807C4;
 Mon, 23 Jun 2025 09:47:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 23 Jun 2025 09:47:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:04 -0400 (EDT)
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
X-Inumbo-ID: 8cff6737-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686426; x=1750772826; bh=o8VgD6a057
	VNjsnHartaX+IMFYG5/NjtSB5DTQtrThg=; b=kVMrrhGZUonqkg9BkLaWTh36Mk
	+T5RRSacCflydJAosdLcm+UpRFJ1qjyQ4dI3HVi3XDvI5uQjbv/eZ6tISiLYR9WO
	7Etp3B55qqax4+0JuC8aNGHDwGlwmL9hIYloYafqpJxCcWe+q4VjCiuVq+zwXl8Z
	EAGmhzpQBNkojo+MJbP2a7Dz9ZC1Ujti2in8fVfWJTT7QcknRM4MUa+NvBBZwqCt
	LKFAnw6FXZY8ttoDOvwCib3/IPdCNUYNCArNnWaVtnqSazhMWo8j41mBCY0vCaCc
	MhV3mNuFyyV5+rulErnqjPX6fQe/OYjmER7Xpan69jnXi6m8R7LPmOXjh1DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686426; x=
	1750772826; bh=o8VgD6a057VNjsnHartaX+IMFYG5/NjtSB5DTQtrThg=; b=V
	hrFO3icLA/H0g/99mNdap6/ZZLybSoBn0zQ+c+BgwW/Ri6TS7mR0u7kTnvDp5g2q
	HKbP0TcDnFsv8w72V4lAKlo415eGPRXiczF4kUHIBoaf9OrKNiiZbEfgAK7LZmIy
	qa3+TzdubPiAXG91JmhMJxJdkAJAqutMCN8Vfc8vcn/BMkuynBIrFuB1QQ4pxD3b
	nIzolHfWmqNU2VOTHr56fQs5L/OkBhdbtK+SvJKR2VeVn6HqBF5hp4lJJRQWgWeu
	rin+HLI5z2aSJfI8QQ9NduhvnjFWQYFTvVua1d0YIVJo3e0Nwgqle4fQ/8LLm9Fd
	OhttBQV0N7G/lt4OF9J4A==
X-ME-Sender: <xms:2VpZaJVCzhxUvVLVB6Q6_jHHEIj5BywZs6J7kqPSP9ilQYwKkwo6Sg>
    <xme:2VpZaJlT9nK436UPtYYMJE2IFGPDJrnJfWPQ_3w5qMEZoW9p8J3WB92Xd7xv2Rupu
    6JkbBDCZ1-X7g>
X-ME-Received: <xmr:2VpZaFZmafjKKsRQRr-L2h0k_THd4kxYLbZQYQEpmB9fHaJaPVs0cem6uA-Y8Jm6mV5lXPVvt12VH-5I4b6xGOnKjmCEMTYMRK4TqiXHneuLA6rQOpjX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:2VpZaMVC_aa_qm2jZVmLBKZDh2MpMsLIuyTfDhpyzooJwBUzCkfmcA>
    <xmx:2VpZaDkwskN54kbHYJbQ5a_lji9jUNH1aR98CNKCZ_evQVs2XNZBTQ>
    <xmx:2VpZaJdapE1SUOc2DXBKEW-8NSSlse9SCffni5_V5DfpqsTOw51iFw>
    <xmx:2VpZaNHNL6D8BpN85dlQEg-4F4kmF6Zuwn7QdP32tCGvg4e89_C_GQ>
    <xmx:2lpZaAOfbaIPsu5wDmGcIwpJdxm1JtFgjsoQtnZNa-GeOsBynWAL6-oc>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 5/5] Setup ssh access to test systems
Date: Mon, 23 Jun 2025 15:46:24 +0200
Message-ID: <d9e1dc62d2bcf647e0a1d26d90d2d33778d954a1.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For this add also bridge package, so xenbr0 can be configured with
/etc/network/interfaces.
This allows extracting more logs out of the test system.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This enables passwordless root login. It's okay for qubes runners, as
they are isolated (even from each other). Is that okay in other places
too?
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index c999b89..632609b 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -10,6 +10,8 @@ apk --no-cache upgrade
 
 PKGS=(
     # System
+    bridge
+    dropbear
     libgcc
     openrc
     udev
@@ -62,6 +64,7 @@ rc-update add loopback sysinit
 rc-update add bootmisc boot
 rc-update add devfs sysinit
 rc-update add dmesg sysinit
+rc-update add dropbear boot
 rc-update add hostname boot
 rc-update add hwclock boot
 rc-update add hwdrivers sysinit
@@ -74,6 +77,7 @@ echo "ttyS0" >> /etc/securetty
 echo "hvc0" >> /etc/securetty
 echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
 echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo "DROPBEAR_OPTS=\"-B -R\"" >> /etc/conf.d/dropbear
 echo "rc_verbose=yes" >> /etc/rc.conf
 echo > /etc/modules
 passwd -d "root" root
-- 
git-series 0.9.1

