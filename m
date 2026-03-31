Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FmSFmFXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F1372B81
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269367.1558484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPj-0002bz-NH; Tue, 31 Mar 2026 23:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269367.1558484; Tue, 31 Mar 2026 23:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPj-0002Zn-Id; Tue, 31 Mar 2026 23:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1269367;
 Tue, 31 Mar 2026 23:22:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPh-0002Gl-K7
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPh-002Gy3-0o
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56bd-bab6-0a2a0a5309dd-0a2a450ce832-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:25 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5730-f93d-0a2a450c0019-67a8ac998959-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:24 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D0BDB140008F;
 Tue, 31 Mar 2026 19:22:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 19:22:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:22 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999343; x=1775085743; bh=AxGQ6gIZ8m
	qUXJBMK/ftMfEV7ibVs3ZFcaE/NllX22A=; b=f4ove0Ms4CuPRkggp4DakwRgPH
	CqSpLpd7jrJLxPyKX2TYMSHsVW1aDpdZ1LNPl4nzulnpKPj2epTJI8qQHXcqC3R+
	ZjLmVS+9O+Z9m6G7JolyxL1vkM7q2SUFj2V+ITWmcUhsOrP6y3opYVKVa5gszKyc
	Bbna8vWK+wmq0vJleX+QL8yg0j+xtbRGM9szOBnxguINuRloOE88GeoTQzBdsIpO
	kulmfcMRzXVTJZ/7WdzDQeIaD+woePqnOktakR/PIzH1eygLTEuR++tijT5W0BeE
	64FILf0lTwE72BzrbLzGKttG8doEdKz1Lqsq5jc7uYSDeenDAl1iy3ZsVmTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999343; x=
	1775085743; bh=AxGQ6gIZ8mqUXJBMK/ftMfEV7ibVs3ZFcaE/NllX22A=; b=V
	UogsOTZR6vQ+YTXTold5pDgAQECQx4jqN4bM1YyjdDJ3Kd83VPs1GCNqMNqw2272
	Ps48j6wrAv/n+ZEQfi/O2En0N2aY6jo0MqUJd3ZE7DEOFnl/jjVDq3PcfR0IuhNd
	MunIz5kvPgK8pzy4tmaakiy7b1Y/yQoLKuFi1l8cZFhmC5/vhoqKs+4mSc/mjQnJ
	Ktl/RonDYGskDuHtovRn/ZcoHUkA8HHBahvf+8ybp3+cW100hu0bVvvkLWrl+xrt
	FdMRVfal2NdlRNmcI9Hd1cihVhnJyG+gc/vX8eVetk/T6AmbADuuscgutPUdqJD+
	8e8PTrn8yYIx93UoyxcDA==
X-ME-Sender: <xms:L1fMadeMknCxot9e8WmQ6mf8QfpBAhd5-p2V0njM4CY7Blp9ZfWyoA>
    <xme:L1fMaSEIUPwoNgjVX4WUzkKFL8ymFBaQ3U1CSaPH92UGvwDy6psSNTQ4DxthSSAgZ
    VG8ysrcylz6crIVNefglXNM0g99uZYN_5kk265Q8HJ8Mni_>
X-ME-Received: <xmr:L1fMae2u3xS-qEXuEmeZ_Xp63spDEj5JMu0cmQVaWTod8g5N9MHHmgWZbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:L1fMaSmTgyiAXCKtfuhC9Ad0c7UCYVmtAZaH3qoDmUZ__4b6M3HyMQ>
    <xmx:L1fMaW87HuPUex68bm6qEhY7lRvt475LRnkUWoDTTrxar5uGkqqjRw>
    <xmx:L1fMafphle3yDEU19jo7W0Vsw64-pYGy02fY5tTMpAbrFrCJF6gS6A>
    <xmx:L1fMaXmbUtMdfopxz9DU_Iw2GX6obdLIOQUkVf8ZiBMQVmS90Lft3w>
    <xmx:L1fMaU6MHhTCHBVUIO1rSX-iRBfEJSByYgMZ9wkPEYSgcAYpgJWvA3Lx>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 10/13] Add linux-stubdom dependencies
Date: Wed,  1 Apr 2026 01:22:00 +0200
Message-ID: <7b3cf5053a5e80aaab527db31447bfc95cef829b.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774999344-6CABD734-EC14B8AD/0/0
X-purgate-type: clean
X-purgate-size: 633
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
X-Rspamd-Queue-Id: 133F1372B81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 3cd3ab90697e..2671ab5662f9 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -39,6 +39,10 @@ case $UNAME in
 
             # QEMU
             libelf
+
+            # Stubdomain
+            grub-bios
+            libseccomp
             )
         # libdw used to be part of libelf in Alpine 3.18, but it's a separate
         # package in 3.22.
-- 
git-series 0.9.1

