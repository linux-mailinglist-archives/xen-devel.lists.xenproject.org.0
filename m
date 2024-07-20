Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B41937E74
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jul 2024 02:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761212.1171214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUxl9-00037b-Qz; Sat, 20 Jul 2024 00:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761212.1171214; Sat, 20 Jul 2024 00:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUxl9-00035i-OI; Sat, 20 Jul 2024 00:15:35 +0000
Received: by outflank-mailman (input) for mailman id 761212;
 Sat, 20 Jul 2024 00:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XC/M=OU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sUxl8-00035c-In
 for xen-devel@lists.xenproject.org; Sat, 20 Jul 2024 00:15:35 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c001df4-462d-11ef-bbfd-fd08da9f4363;
 Sat, 20 Jul 2024 02:15:31 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 265D91380126;
 Fri, 19 Jul 2024 20:15:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 19 Jul 2024 20:15:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jul 2024 20:15:27 -0400 (EDT)
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
X-Inumbo-ID: 2c001df4-462d-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1721434529; x=1721520929; bh=VKwXjlPJjEOR+Z0ANt4pOIIHCDp5/8kT
	rMxMyZN7PgA=; b=rmbs3iTvQ2sLsKVC3gLqCJVdswA0z1IxQmzOTQoJoM0rHKu/
	M8hGPCuoBTfaI/IvthNZ0CPD+he9lhkeEGgQMQ5WJ0ngz8vnMKlfpnmbMUksHW5Y
	+/93s+a6HwykRGdmHydH8oIGBNSPKm8Et1/XJ6mPr9a/N1ysm7y+RCGsOzWkRrDt
	f/uMQIkIphdc6jR9IB2di+WgZ4ZQFKeedPk8gijqF95ssHg8Weoi/L2jvDAYzQym
	SFlA/7HW46wtVzqK8yEigIv6N7PZvqlowC4Oxx5KsWkJeZBWIFFSYYPeDGloYnHc
	ga0E5premsP4vd4aHtptwojGSYS8Tw17oh6o4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1721434529; x=1721520929; bh=VKwXjlPJjEOR+
	Z0ANt4pOIIHCDp5/8kTrMxMyZN7PgA=; b=mdCuJXgvHil11HngvGk82l7Gtl5JY
	8Ea20f/aUFbHQnJtjy2GXNdiIh24tJ+jhJzB679zL6vNAF9RZgMjDcdoIU7Ub2bP
	f6qgif1gDhNoc8mJYOBjxzsEem5wpVhvhB2jew5wEjecUsWQD276ggeLvXuffpzl
	xp+G2B5olMnXCxcw78RwOUFpA9g5pR/ZTDlX4iFI7mrTRNNyoSdixBMtIZDwxKCI
	EHE41Rmp2TtD1SL7/0hB8js9N91pNld4t573XYpAQs5hGEFX3rMLm1cKSfXIOeYu
	Gz4baNgTXTO9xStgAOcytAYskC9Ww5GThiPgB462yUKjohVSSfzAnluJw==
X-ME-Sender: <xms:oAGbZvP5x2lCWq8C_PPSVc88p9cGBzYMuvi6x6Gn7nRwPrsl_e7c9A>
    <xme:oAGbZp_aryIcxyL6N9xFZ6cIHM1AXIGpZ4yr8eVL9yiiXYxJAOc4OnK62HG4DdyaL
    Bz1CdcTn6f61A>
X-ME-Received: <xmr:oAGbZuRHPyedN0SW-Jtm_c0UheSvW9OMu0lMek1DIvZXMzHtFpMgp9-i7ihdwMW9uIbf4O1Y8bgMRtqiuVCh8bD4oHytFkqnqCN0vWxGnRfcX10Jbq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedvgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdeiiefg
    keegteegjeefffeiueekudfhudduueffgffhueellefgteefudeftefhnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhdpughotghkvghrfhhilhgvrdhinhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:oAGbZjvgm9NYFnysgN74JzV1RB7eqWbYG-xLWUgoXus1eYDcVLUPaw>
    <xmx:oAGbZnc_e0H-ke08md6RQT2sJWxTh1i-RfJWThglKbwYsZsMUXv0pg>
    <xmx:oAGbZv2LGdF1WRApx8g43VADTjRw8hCmDM8qzI8TSJvWZcx1klai1Q>
    <xmx:oAGbZj96f-HilNToG2DbBfAeGOkJ2eqwUtwj0YE98jFp4vaeNz4HrQ>
    <xmx:oQGbZu5xaF-SM10J5FVnz-8IAjV6apjVaZf5Bw7N8NhQOojuN6d0ApvV>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: workaround broken selinux+docker interaction in yocto
Date: Sat, 20 Jul 2024 02:15:03 +0200
Message-ID: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`cp --preserve=xattr` doesn't work in docker when SELinux is enabled. It
tries to set the "security.selinux" xattr, but SELinux (or overlay fs?)
denies it.
Workaround it by skipping selinux.selinux xattr copying.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Tested here:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7386198058

But since yocto container fails to build, it isn't exactly easy to apply
this patch...
"kirkstone" branch of meta-virtualization seems to target Xen 4.15 and
4.16, so it isn't exactly surprising it fails to build with 4.19.

I tried also bumping yocto version to scarthgap (which supposedly should
have updated pygrub patch), but that fails to build for me too, with a
different error:

    ERROR: Layer 'filesystems-layer' depends on layer 'networking-layer', but this layer is not enabled in your configuration
    ERROR: Parse failure with the specified layer added, exiting.
    ...
    ERROR: Nothing PROVIDES 'xen-image-minimal'. Close matches:
      core-image-minimal
      core-image-minimal-dev
    Parsing of 2472 .bb files complete (0 cached, 2472 parsed). 4309 targets, 101 skipped, 0 masked, 0 errors.
---
 automation/build/yocto/yocto.dockerfile.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
index fbaa4e191caa..600db7bf4d19 100644
--- a/automation/build/yocto/yocto.dockerfile.in
+++ b/automation/build/yocto/yocto.dockerfile.in
@@ -68,6 +68,10 @@ RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
 ENV LANG en_US.UTF-8
 ENV LC_ALL en_US.UTF-8
 
+# Workaround `cp --preserve=xattr` not working in docker when SELinux is
+# enabled
+RUN echo "security.selinux skip" >> /etc/xattr.conf
+
 # Create a user for the build (we don't want to build as root).
 ENV USER_NAME docker-build
 ARG host_uid=1000
-- 
2.45.2


