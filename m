Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIeZD2BXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E599D372B7A
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269375.1558511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPn-0003NG-Fn; Tue, 31 Mar 2026 23:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269375.1558511; Tue, 31 Mar 2026 23:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPn-0003H7-3B; Tue, 31 Mar 2026 23:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1269375;
 Tue, 31 Mar 2026 23:22:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPl-0002uy-C6
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPk-000kEs-Oy
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56f4-e002-0a2a0a5209dd-0a2a4501db78-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:28 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5733-6fc9-0a2a45010019-67a8ac95ecdd-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:28 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 89FFAEC010C;
 Tue, 31 Mar 2026 19:22:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 19:22:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:26 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774999347; x=1775085747; bh=ymOoJ9LyMP
	HIVOBi/8iFDxN4dPUDO5h+alaJ+I+SkNY=; b=v+32U8umjDS/91kDQO2GcvKBVr
	1fDxHxc1PY4o+jMeVlTFMNOYaW2QwJebuWXV1eWzuRHw1OBJ3PRGDTSeAq/Tv8Sy
	GmlrjZ3Pa4REA0Gi0KLIRO60O0HJlJAJkD8PIDM58i4K+LfpB1y78IsW4PY8nu+E
	9sHUDI5p01ME4Ux1gzBxM2Rh3kXyhuB/xQsR8bVOGJW/xIbdVlqhpQRWUwAhbkW6
	jmssNPDXwni+wspco0FENeddllOdpExfFQetSG8MbOCThJP4AN9aApZvyjDi4GaK
	b7dZhiUdaNYZplLn+gujtycby9pV/hZtY9CFv5BSqF0F0T4KT6G/75DQie9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999347; x=
	1775085747; bh=ymOoJ9LyMPHIVOBi/8iFDxN4dPUDO5h+alaJ+I+SkNY=; b=k
	bNCFiW5dsqF6saJpsrqtlB59N0XqWJjSrO21B1RDalAI91dAbuOfVMdfdxg1461v
	bfOYVGOq7TkWk/3riune2lPTJ2FRd/2xhSknq7OigG2qwJAvVkTBKdWrqA2Srv5o
	eWB71N7lqu9L3E9kT7V5j9SVhPn/aCfDsZNYhTuIy8Uv7FQ/5SHsA8bZ9t1qQfHA
	xNt2ukDtmsxzHgIP22ccd4A6LDDfZcHuIFqbOSA/qVUTWsTlAj2v3uKe4qrCaOlK
	XBoyTHxJTKfc3p/WBRaCLdrbInVzue9p1hk/YZu/dg9jzVlWDZAVurKKq4bQoBNu
	w8mC74vA5jDmE80RgdMMw==
X-ME-Sender: <xms:M1fMaY-OTDOK0qLJql-BX3nq2-Wocg6gdj2ZGZF3Dd3IEMV5tjgMUg>
    <xme:M1fMaXkTrigUsknMgqRa0xuIo9mBtDW7cxeu4i6gK9PmISyp3pZNtN2SF4tUjf-CY
    0tQK1Wkg_p3wvwDkdQmDRQS69nlnmmOnCM6hP8_VddYPgUnFg>
X-ME-Received: <xmr:M1fMaWWTOzzvAyeO1Qe7GIr57LSlXY_UZUufItxg_vmLhfphpYtVEquoZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:M1fMaUGqhyg6XgdH8NnFESqB_QAqcj15xCCUN5EN_8cF1JwKe_aUYQ>
    <xmx:M1fMaaegu6shWU8wiDobQm_x2g6uK3xEUSZ4lf5Y0od9WW1Ytzhr0g>
    <xmx:M1fMadLKKaF2GVMy0d2SSpYo30GSGE8XShGizIsQfsHdg8HGtFI40w>
    <xmx:M1fMaXFP1ZZXKJTAnutvFyjRW7Vl1UZ4qWczXic7DkgIz2HpBWEqvQ>
    <xmx:M1fMaSaqPjKaaIPDNYizrIinbYJjLJFM4FjnelT-Nkfm4WOUPERtfq1R>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 13/13] Setup ssh access to test systems
Date: Wed,  1 Apr 2026 01:22:03 +0200
Message-ID: <c58b23b75f4a65ef7bb70b472466ad3586aab9ee.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774999348-16CF2185-C18B3EC5/0/0
X-purgate-type: clean
X-purgate-size: 1418
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E599D372B7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For this add also bridge package, so xenbr0 can be configured with
/etc/network/interfaces.
This allows extracting more logs out of the test system.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- do not allow passwordless login
---
 scripts/alpine-rootfs.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index f649550d80ab..0afae48cfa6b 100755
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
@@ -72,6 +74,7 @@ rc-update add loopback sysinit
 rc-update add bootmisc boot
 rc-update add devfs sysinit
 rc-update add dmesg sysinit
+rc-update add dropbear boot
 rc-update add hostname boot
 rc-update add hwclock boot
 rc-update add hwdrivers sysinit
@@ -84,7 +87,9 @@ echo "ttyS0" >> /etc/securetty
 echo "hvc0" >> /etc/securetty
 echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
 echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo "DROPBEAR_OPTS=\"-R\"" >> /etc/conf.d/dropbear
 echo "rc_verbose=yes" >> /etc/rc.conf
+touch /etc/network/interfaces
 echo > /etc/modules
 passwd -d "root" root
 
-- 
git-series 0.9.1

