Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C21CA490F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178060.1502051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCOW-00055G-Gb; Thu, 04 Dec 2025 16:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178060.1502051; Thu, 04 Dec 2025 16:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCOW-00051v-Dt; Thu, 04 Dec 2025 16:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1178060;
 Thu, 04 Dec 2025 16:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCME-0008JN-Rs
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:39:06 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf585d79-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:39:06 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 18268EC05AC;
 Thu,  4 Dec 2025 11:39:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 04 Dec 2025 11:39:05 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:39:03 -0500 (EST)
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
X-Inumbo-ID: bf585d79-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866345; x=1764952745; bh=qnUsTu3pHs
	WjMA2b8itd8vu/CqR/sF09Bd01iLpmL1A=; b=SCu9/zDrkZq+w/T77ibnn+U0YS
	MO/PM0LgaDliI+QhLbr9pPpx671FGK3OWy0hqUe3KQ8cStfZP3GCsjPefTQibpmF
	V0uqZHJbj5MmKb1KKhsLzQUexrh+xbrbjnwNQARmvXrED/qamv6JIe4jUJy0iIYJ
	0PgUXpmboKe0aduae4PZ0KtqHTHpt7xXb4UKiWA0kyRCcWAI2e6+6rORD8/JZyIi
	ksovuStzdSe/eDC9hRVHxf/IBxuTTN0XxhNcsazSEA9D475LR/Hwi6PT+m8q0BuL
	N6vEf34XBwwn0Cg9R5n9l1WLR81RcE0qj2IK/jPzOeRr/jrwhpTc+v/jJflA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866345; x=
	1764952745; bh=qnUsTu3pHsWjMA2b8itd8vu/CqR/sF09Bd01iLpmL1A=; b=A
	iJI//aeX7dPwK9xG/Nf/2/o+2InsoOV4x2gqOwkEOSleNgw5weDboA0mVUPRg78P
	NSQiIUDUO5a87efu1BXdplPcEglMCKS+7QEby8hjnRTZ/Ylr7v5b/xMcdRKyJEMJ
	ovNVeDUfGtXY1IhW8UNC58O2W7ggc+fMMSFa9lJlYEHqNBzbOsph3dCVtsuMDOtz
	xoBPQoCaX8FcIVvtLIEDkZ++DkNdtYR0hOnRU7Ar1aPSXbzTN/9mMe7QjUqEZ+E5
	Y/NikYKrytyeJxD8GVOmHaxitvrqHYQikHCZ/dBUYml5n5ieJf9V6MdXY/YlCkmz
	dUi7EZAEAWtys15uWT+WQ==
X-ME-Sender: <xms:KLkxaYZ7l8FlPPhmjmf6pqlLYcARn1HJJdSHGiPdo4TMsAUSNbgiLQ>
    <xme:KLkxaaTiLrX9wg2yB2APscIGQQKNR5MLgHlG9ckPMa0Qw0r9PaH0NgAeFjl7oJ7r6
    R_yM1LQ3pQahz7jNaUB51B4awtS3HrWHL5PhKeism7_0rJ3HA>
X-ME-Received: <xmr:KLkxabRq2A5DL_S7S6Hge4T7Bq_pzX6G1HbJVIP34wjO7R20WFnrFuM3ySZ_wh_cPzSTlBsH87NRSbSrLJaORtoJSiNUta-eqWGMeWRVdfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:KLkxaeRQlL3EvFSYxzte5trWTFfDl6xd8ecPlw81ETODF8KATutAtg>
    <xmx:KLkxaQ4GGXgjEa-_HpkaL_wMTrw5C13p1D6Ox3XtFNIYb2O-F5qxJA>
    <xmx:KLkxaa2B_FpCqtQ7cbU9qI_2v-bBEIjaPgeNMttkEvfS9VppvlzJIA>
    <xmx:KLkxabDsuYHUfTiwZkr4IO7jbdaobYtpfj3Ohbj_t3tmeQVDGGypig>
    <xmx:KbkxaRg4h3cMK4f3bPYF28TafRQZ2du5UVcqdMCSMjQjK3Q-dYc413fI>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 12/12] Setup ssh access to test systems
Date: Thu,  4 Dec 2025 17:38:49 +0100
Message-ID: <ce8df51117f8f3696059e83444be57bb20aba80e.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For this add also bridge package, so xenbr0 can be configured with
/etc/network/interfaces.
This allows extracting more logs out of the test system.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- do not allow passwordless login
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 5945657..82cc416 100755
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
@@ -70,6 +72,7 @@ rc-update add loopback sysinit
 rc-update add bootmisc boot
 rc-update add devfs sysinit
 rc-update add dmesg sysinit
+rc-update add dropbear boot
 rc-update add hostname boot
 rc-update add hwclock boot
 rc-update add hwdrivers sysinit
@@ -82,6 +85,7 @@ echo "ttyS0" >> /etc/securetty
 echo "hvc0" >> /etc/securetty
 echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
 echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo "DROPBEAR_OPTS=\"-R\"" >> /etc/conf.d/dropbear
 echo "rc_verbose=yes" >> /etc/rc.conf
 echo > /etc/modules
 passwd -d "root" root
-- 
git-series 0.9.1

