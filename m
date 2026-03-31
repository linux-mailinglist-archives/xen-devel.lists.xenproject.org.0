Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNn5MvFYzGk4SgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB85372CAF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269509.1558565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWo-0000XE-Hz; Tue, 31 Mar 2026 23:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269509.1558565; Tue, 31 Mar 2026 23:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWo-0000Tn-CA; Tue, 31 Mar 2026 23:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1269509;
 Tue, 31 Mar 2026 23:29:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWn-0000E7-4U
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWm-004YwC-HK
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc58e6-bab6-0a2a0a5309dd-0a2a4509c0a6-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:44 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f7-e484-0a2a45090019-67a8ac95bff9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:43 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id D5E65EC0258;
 Tue, 31 Mar 2026 19:25:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Tue, 31 Mar 2026 19:25:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:41 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999542; x=1775085942; bh=ipNBzb/xPe
	pZOkJie58FqxMbev+ybK+wfGHJYYApMdY=; b=jw0x53EBBypN7RvSLbdGjHu4/r
	tLu5F1nXEmX3pkfsAwT4prTFVFIXM8XcXP/PjmDXn57UVSsEkHQTh0j+Or0Cion+
	wjLBIVjSWpKdjhDUPhjixajIJC2pv31gUq5NG0RxES3iCOW7YmYamOrgYLOYH646
	1dy6xYPcVNikiONkVKixc2w3/oY7HVuY6j1lBY91GFwo+KKSbQY+NNgLNnh9bhWI
	Zh7Y/jGn1BsE734WJlM3Qx9nZZlysuYWDjqGqU2Iqqi9bUA/RGaoooLuxE1kanaq
	O+LaRpTJu3U5lQo6ZZjwftFXyl9S+McBJF6ynpIifyPlNc/Xguoz5iiA2A1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999542; x=
	1775085942; bh=ipNBzb/xPepZOkJie58FqxMbev+ybK+wfGHJYYApMdY=; b=T
	ijCnAJPBv0ZA594hOZsW8WXPxJHQj5sLOkxLq7vP7tECYinH8WSysj8D9b+ybSJ3
	oWu1tuwEogyWlRKsZUBJBC8DvvIkmVkGCyStbU/mSXbbp48QDF+1SHYJFAjEvLXl
	jXg1Gd0bB/7rUA4BfljnJJrUtcXA9qS/SJZLDDIsmG6N3Ys5SBJ/0HDT+dXhHMVZ
	iuScjV+OnJ4mqEdB/9bWW2ovv8SgbLHsdoNBznf2kK5Vq9BO74/aEPTb+/xM5R+4
	Snz5UYtj8UGtPSz3cgM8XHoU1OJ3M75tUzUrAtvc8vujXUQ0X5bfbiRACL1iy6wu
	5YeDYYglwrC3o+jLwaRJA==
X-ME-Sender: <xms:9lfMaWzZ_nTHfFPaWNuiD0A0iVeFGOrGnzvArl_PDKCJ-y6vem0RfQ>
    <xme:9lfMaZKBlvr0j3Va-j61_w6K7r7KUu9NWNeL1n0hYjfDIqFczoob_egtFwmbrd_OK
    Dk8FjlueFFU3LsVPoIdGwr7kU6SLjnLRZj_cGena9TM_dseIg>
X-ME-Received: <xmr:9lfMaQrqKJwsAZwxb61QZzzRcRnZC84uqEQjp2ZFhbaX6luiyWvYdQsJFA>
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
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:9lfMaYLMiTLcexU6m--OwOrA2pBu6EIfgRXyX-9YRzhZq1SX1f938A>
    <xmx:9lfMaVScVsuV30TKxKaoJ94krKKORO_SFrfplwFxKSXclj-p0UcHPw>
    <xmx:9lfMaXthwF0cslKPfca5VPgO5UVMaZwgFdmI3QRsH4XIETL_BW5l-g>
    <xmx:9lfMaWZLG6Dv_hcWzypXNhRI9fKcCeR3xPInrzKt7uqqQkFqPv7hQw>
    <xmx:9lfMaa-JDwtU7wZ5yn2fmVg4LjJfO-B8k8EEKFSDTnLYVXns2M7DvhmJ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 5/6] CI: setup SSH key
Date: Wed,  1 Apr 2026 01:24:54 +0200
Message-ID: <5d11a521db04134f8917c990a494ba8ce44548b9.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774999544-5BAA4A73-EAD71CC2/13/0
X-purgate-type: clean
X-purgate-size: 957
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7FB85372CAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Generate fresh key for a job, and add its public part to dom0's
authorized_keys file.
This allows the test controller to use SSH without any password prompt.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v2
---
 automation/scripts/qubes-x86-64.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 91c0d5bec829..745fce6f9134 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -246,6 +246,10 @@ chmod +x etc/local.d/xen.start
 mkdir -p etc/xen
 echo "$domU_config" > etc/xen/domU.cfg
 
+mkdir -p root/.ssh
+ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519
+cp ~/.ssh/id_ed25519.pub root/.ssh/authorized_keys
+
 mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
-- 
git-series 0.9.1

