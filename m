Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA88IGdXzGn/SQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322A372B96
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269369.1558496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPl-0002tD-8S; Tue, 31 Mar 2026 23:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269369.1558496; Tue, 31 Mar 2026 23:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPk-0002pL-UT; Tue, 31 Mar 2026 23:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1269369;
 Tue, 31 Mar 2026 23:22:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPi-0002Xg-SQ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPi-002Gy3-9E
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56bd-bab6-0a2a0a5309dd-0a2a450ce832-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:26 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5731-f93d-0a2a450c0019-67a8ac95ccd9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:26 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 14E55EC0103;
 Tue, 31 Mar 2026 19:22:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 31 Mar 2026 19:22:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:23 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999345; x=1775085745; bh=XrCpwgjR2U
	u0xVLHgXM+ZJpYWbTG+sNx3Cc4mQAhwOQ=; b=f3qAKfujU9FCiDGJe/nE7sq3C8
	fzceOx/oz+V5P9fyGwn/KYEF/0NzY1eV9IWemwowcMcX3xudlhawJ6IhfAR2nRUJ
	DMpoToFbCIkb+gOYjMk2H+jQUL45iThwaRgcHYjlNKSZ/RXVQNWWpNpE9d/L1qv1
	w0ppHcBwn7iumdYHVD78LEEtuDKOmpknox4m9/A8wZ1Dzbu1qKTPr6SMiEM+GV6t
	77x5q8bVndU5LM2Zk6HVhkhVN4rVWqnOQT6DkDW25Lgu4AvthMWTpY7A3TgbV5Jy
	uZZIXxM93Cs701h8khzB+3xkmEkceQyeBIBJzms9myCCIfwBJ+nUxZboms8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999345; x=
	1775085745; bh=XrCpwgjR2Uu0xVLHgXM+ZJpYWbTG+sNx3Cc4mQAhwOQ=; b=Z
	ar3rwERIKOvwplFIM2OfTCMZkQeApBZPkseiSPZvQeZh2fNW5E2xBDx4nppDrUDa
	qovVn5pu1A15OqmsTEXxiAzbiiosjq4bGCzgqyezWyfB+OAPuklNIwWaw9HDVXdr
	ZNpsVGNgef3/ZvnHWHWNU+SRkUfAlgjrpL5QwwJvkx6WOW6oLu5BM9J47IquRcqb
	UubO/uuh4UvfCYoEsIvjZQawasJRVPwH6xRFbmmsalemOf52dX/TwxVE0oz2Apks
	r1GB4s+BQdQtdzrUC1Lp7IflpdnF6OraZQ0Ag0LF8M0Jz7oF/81pEOqsBXuCQHbt
	o/p3zvuHayLLtewxgKn3A==
X-ME-Sender: <xms:MFfMacE8zRQBUOFJ0FJrzWN76G43g9R-dyQ7QFpqpkwT3bwGohb2EA>
    <xme:MFfMacMqEbuxLq4LppBjuB9AC6cA8z3G49s1atu-5QNtWJ_ESInP5AraslJO78a7y
    4tLQVe-U0mCR6dNI60aLrbVjpx2WUU60ookcf0JpNOqdVSzwUE>
X-ME-Received: <xmr:MFfMaef5kDtoTY7oBvDnxTHF1r4xNFDgwM4rRr9b_uZDs9hIr1z6vOnDJA>
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
X-ME-Proxy: <xmx:MVfMaZsb1dVx3_c21eecyNFLIWc20MpMMYH1DPP9ymOPt6OvKMltBQ>
    <xmx:MVfMafm_g5RbUmWRmwJVSvYoPQNlTOAUaRLZPDeI9G3NwoXYy91xcg>
    <xmx:MVfMabzMGoasa0s3BL5e5DUcuS4CXKT_ix6N6SMv84RTp6M2_qg0mg>
    <xmx:MVfMaRNc40iMe1lsivdJw16iID4eOfnZcq_1KAdq1ZWVvTIDirU8sg>
    <xmx:MVfMabo7E7YE0Fv1z6CA5crvSZ0uJDbXHWTgFT12FkyDfVi0EDnW2Gx_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 11/13] Prepare grub for booting x86_64 HVM domU from a disk
Date: Wed,  1 Apr 2026 01:22:01 +0200
Message-ID: <5ca6115fd59f7a2de8dc732b28c1dd335735bb0c.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774999346-F76A7734-D33B688C/0/0
X-purgate-type: clean
X-purgate-size: 859
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
X-Rspamd-Queue-Id: 3322A372B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The stubdomain test will use it

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 2671ab5662f9..18f43e6bcd9e 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -96,5 +96,12 @@ cd /
     echo -ne "dev\0proc\0run\0sys\0"
 } | cpio -0 -R 0:0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
 
+if [ "$UNAME" = "x86_64" ]; then
+    # Prepare boot sector for HVM disk
+    grub-mkimage -o ${COPYDIR}/grub-core.img \
+        -O i386-pc -p '(hd0,msdos1)/boot/grub2' \
+        boot part_msdos ext2 linux biosdisk configfile normal
+fi
+
 # Print the contents for the build log
 zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
-- 
git-series 0.9.1

