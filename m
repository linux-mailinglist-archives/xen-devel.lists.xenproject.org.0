Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE58C7815
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723361.1128177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be7-000731-6n; Thu, 16 May 2024 13:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723361.1128177; Thu, 16 May 2024 13:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be6-0006y2-SO; Thu, 16 May 2024 13:59:46 +0000
Received: by outflank-mailman (input) for mailman id 723361;
 Thu, 16 May 2024 13:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be5-0006bS-6e
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:45 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b79953b-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:59:43 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id A72EC13814A2;
 Thu, 16 May 2024 09:59:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 May 2024 09:59:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:41 -0400 (EDT)
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
X-Inumbo-ID: 8b79953b-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867982; x=1715954382; bh=cBlSjeC6zd
	zYMoWYLWhLp1CCK8q23xDxzAsx9E+dnrY=; b=mo6UKpsRNc7gr9AnBbyV8Cs/wV
	MnFgDUgiGTtBCZ5f0n04z5oFFW4xQQN1bahC8/TeFnmZXbWFCdB2FrECcyqQWKox
	RNgXHQcM85IdpAuNgzMzpkSXdEaOQmOd2+Kvo5uXkgGzpH+IASF4LLGVcjwXDA/v
	xoE/q98GDarHuyLYOVwzcVVZ20MqohdwHI1G1BwotOWx5S9LjI43SxOiPVNK9xaU
	wRUXxli5/5n/J/+X+aujx08Mtn075TtkXyfRNrxatpDmhuuO+YYLLSZjblfTeIu+
	XgeklA6dwlwQbyr8YJ4qby6BzgxTAxJzWiEKiXANl/65b1+zRAeFY82fqpTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867982; x=
	1715954382; bh=cBlSjeC6zdzYMoWYLWhLp1CCK8q23xDxzAsx9E+dnrY=; b=c
	gNdw/XMpKM3xQC6wzV+yp3TnZlF7DG4A/9JrdGJPKx55dh7nyZYYYRddKsiAwjAN
	2D7mk5J+6ywb2iBxF5pfW5cbqQ9o3FJjeLDh5p3u4uDpnirT2ao4CaRYiuJfRKGF
	2tJSFwEPfeQ9btJ7EX6Hbp+CleXu0AVFdY5C5ew1lk6vsZ4JGJaALx4mVx74qmap
	vIOYOYb4VQbQokmnr8RhcSLiQO70P/ZUVQ3I3ClpbXXgarzrL3vgAZUH2tAvZkCw
	LcC4o0hHdRbUwcJ4BAOjG5uYeYxU7pW4H0sjVJ191NqLrh1WEITiIPmEkwAun6Lo
	ANlJKAGIgJrl/zA7+FQVQ==
X-ME-Sender: <xms:ThFGZnhFynRtGm38dSNdA-sqVDpBS8wRvDAlsbRkK-233wybPlRn3Q>
    <xme:ThFGZkCAH9fwY1xraaPGJilF7FCwclgMTrXNIrSHvtGfA_LGhI2QFkPzCs5iGTKvl
    1iy_bxCXkMZ8g>
X-ME-Received: <xmr:ThFGZnFzA5iUnvJOFUrdiz550aGf-AVQacCV5ndu0p1t3z9xd6AayN_8VJmdRgSN5eblJl_272EA-envOEM3td0StcbjQTlVs8HER2uEpGHZ56TB6Vo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ThFGZkQZP4JG8zpgu9vu4kU7V-Q9U4gIrwQRHAALmlwicxqpjVZG3g>
    <xmx:ThFGZkyehKSm4gpyYaud5px6YRRUnlrLe1p64BsUBTcqNSlkVgYmag>
    <xmx:ThFGZq5Kpom9gtlTOgOp2px37rjkVNKX9VHh5hwkavg896gOBRLpMA>
    <xmx:ThFGZpyx6zFgswY6e9RGnl_Y7ZmnDqTSmJhQHDGxUepJBCjcP07f4A>
    <xmx:ThFGZg8YoMkqQfUJyb7cOe6eVSxev94H0a7_z1BaZ0q5NjdCqMfCwS4F>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 05/12] automation: prevent grub unpacking initramfs
Date: Thu, 16 May 2024 15:58:26 +0200
Message-ID: <f56b08c94bacb493651f0121660aeaece34f3df7.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It fails on larger initramfs (~250MB one), let Linux do it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index bd620b0d9273..77cb0d45815d 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -189,7 +189,7 @@ CONTROLLER=control@thor.testnet
 echo "
 multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (http)/gitlab-ci/initrd-dom0
+module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 cp -f binaries/xen $TFTP/xen
-- 
git-series 0.9.1

