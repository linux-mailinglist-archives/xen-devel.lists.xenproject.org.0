Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGqTEl5XzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5D372B72
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269371.1558498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPl-00031O-Io; Tue, 31 Mar 2026 23:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269371.1558498; Tue, 31 Mar 2026 23:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPl-0002t8-Ey; Tue, 31 Mar 2026 23:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1269371;
 Tue, 31 Mar 2026 23:22:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPk-0002gn-1j
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPj-00DeiG-Ep
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56f9-5cb7-0a2a0a5109dd-0a2a4505ce2e-22
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:27 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5732-5aeb-0a2a45050019-67a8ac9983b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:27 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 45C5D14001EC;
 Tue, 31 Mar 2026 19:22:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 19:22:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:25 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999346; x=1775085746; bh=MvciWlizRc
	IDu7rh8S3OHYbb/rSLDBoIcJRZTzFEZcM=; b=N7EO6XEqaxZSKob/n4nQklN6EE
	1+fqEg+wExJTSA2ZEPOMxzrKbc8A0tMMIngUdfU6xZj61SWE5a6n0Xl8in/6h8KJ
	6krvmAbzEpw9kwAH+9XGC9NTnIhP8w/VqWVD4HczarVGKoIS1HKcM8BdE675l04E
	5SbLqvV224Nmpvl9eDRDg44uXS5ibh4TABcc/SC4LE2GiPOtRKOi662rWTaR8Y5K
	8M0IamN9UNRD+pbavWv/roCVI8wfl42HCHwnKu2/ZQ0Xj+9HpxN4vOiY06aknnY7
	AaHLEFNATHzeY0yl8TJAWVzdp+q7lV1cB2qMvxjI0dpnm/Xd1QpJV7Le/fmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999346; x=
	1775085746; bh=MvciWlizRcIDu7rh8S3OHYbb/rSLDBoIcJRZTzFEZcM=; b=P
	hLtPcb4LwKxCqvJHCaHyHrSD8JOynPFQbjrbmDqmaftFwvmffNwbdv9b5aamE2ZJ
	Tp29IMHVovLW5+cFyq83eaGiFXgKPOoP30gDrWmgKGB6uR4LxDXBgqsn8dhLRGgr
	P0RAJ1Qx466DV+jIFD1lsN10G1/vK9S55KYddq1ajEtGKO25BhXETZ2WXgMK9V7g
	0xgTvOdXPNtnmgqy9av7WM6bCsNM60TjAh9yrQ5UC09yU0XM7z5urwhlb3BiAMBX
	xag7EDIM2pjWhEs3NxTuhI/sJmMSFM5v2Zz7rwhsuslvMJ38eytkBFapqQS/RjcG
	eelsgUdeoxd3s8RdUcUsw==
X-ME-Sender: <xms:MlfMaax-H0BN0GTvY1SoF63CgcQQ2hUmiuVwis3xddD_M7KoIpN7uw>
    <xme:MlfMadJd9KIj7pW5jM1WTb-1eDBwXwT5ecokn4MaCVFlXtO7pb648wiPLPIYN5HjN
    RQoFXcdRCNPI8BbktRoDvv1DkxCysrZ0lg0RV5IiG577g388g>
X-ME-Received: <xmr:MlfMaUoxAStAZKvs5lMamdBZcSJ2Pn9HVKfreNalEq_Eaj2E2cHd_niloA>
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
X-ME-Proxy: <xmx:MlfMacKio4OBsrbTpkw52d1LYRhqnzDxLJu0P26PHMWNtHqXr7i-hg>
    <xmx:MlfMaZRV1Ixkg2MBPJsSOm49KFku1cJaZ_30He601jw_MhQig_nceg>
    <xmx:MlfMabvBt_ujDNwopIu06IlS4BXPePLf8_gsFSSHOQFqJyk7nRbopA>
    <xmx:MlfMaabG6F0WhuRiGkau8bbbElmkDNfjU75g-GyiyrRQAdd82cIufw>
    <xmx:MlfMae9hlozZpTITH2rvOjB6nAW4CO92G4sW1fnJ6djXiH9JGJVJTtPe>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 12/13] Prepare grub for booting x86_64 HVM domU from a cdrom
Date: Wed,  1 Apr 2026 01:22:02 +0200
Message-ID: <05ad5e9c97b3b34d7df60ea650533eef9d364e05.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774999347-81F5D488-7D07225B/0/0
X-purgate-type: clean
X-purgate-size: 835
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 01B5D372B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The stubdomain test will use it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 18f43e6bcd9e..f649550d80ab 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -101,6 +101,9 @@ if [ "$UNAME" = "x86_64" ]; then
     grub-mkimage -o ${COPYDIR}/grub-core.img \
         -O i386-pc -p '(hd0,msdos1)/boot/grub2' \
         boot part_msdos ext2 linux biosdisk configfile normal
+    grub-mkimage -o ${COPYDIR}/grub-core-eltorito.img \
+        -O i386-pc-eltorito -p '(cd)/boot/grub2' \
+        boot part_msdos ext2 linux biosdisk configfile normal iso9660
 fi
 
 # Print the contents for the build log
-- 
git-series 0.9.1

