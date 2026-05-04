Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMSMDA6V+GkKwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9D4BD289
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299772.1574352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgJ-0002W8-Mg; Mon, 04 May 2026 12:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299772.1574352; Mon, 04 May 2026 12:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgJ-0002SE-JR; Mon, 04 May 2026 12:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1299772;
 Mon, 04 May 2026 12:45:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgI-0002EG-Hb
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgH-002Q9j-Qw
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f4-2eae-0a2a0a5409dd-0a2a4505bc9c-42
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:49 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894fc-aaa8-0a2a45050019-ca0c7c92c031-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:49 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id 597721D000D3;
 Mon,  4 May 2026 08:45:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Mon, 04 May 2026 08:45:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:46 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898748; x=1777985148; bh=RrCBw/kdRl
	dmMfpbhnl07n1mcjH5lkh9QXsoy56IYxc=; b=mtzpJuHRxo9VqbwOLCFwY0yqR3
	o9K/AcG2SAks6VfoE82h2Jg1BvyShyXGIJ/li+Cih9vVp2qhbvkKks5fnrDWEe60
	1O0i+u6H+PQYeS4Dml3k9XgrWcR33o87GYb05KqQLOAGWDKQv68yj7IoxGCMaNC2
	PCL9Lo5ug161JKu0Wcb2/vt4GoT0HNlGv18SkBjxx6JcutCVB4sOrmpFDJusdMCa
	idVO2y3qTN0+dHw2R8tuN97oSFWSkJkb7us8GBeZUb29dHDFOEw90ksKx8FT13wL
	SdjSGOUyRmoDV991W+IRF2p7Vrc4iqnOrhoJQfUIANrpK/Vst38oQzMloDFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898748; x=
	1777985148; bh=RrCBw/kdRldmMfpbhnl07n1mcjH5lkh9QXsoy56IYxc=; b=D
	igvE7G9Unsk4XHhbE7oDpV0jKsyBJke/uwLJdkbRtaUW2MUKeUTaJfmwqGCPdw9c
	sY4IDuhwRh5JDb1fK4WqS7RQp44lF9o7Wv17bQt0S0jOUmH0QeebiuOsK+5ZAbPq
	fJo5SHqCo13PVUk5LzPnI1LyPZ1lBN+GgxVyIC8EdKR4bTx5Ty5NZxBh1NCccovQ
	AKH+qiy3d/lfwPiOG555onH4PvjMnAs4lLZWnj11tfP7+TsmmhE2vRaFp2VyZik0
	tKDZSBt0gBHbZUkMSE3r2oejtLb8qr9YTeLUkNcQ6oDhfv32q0paf8CS8UJEMl+n
	kuecYYKkxAHzRGFRq+7lg==
X-ME-Sender: <xms:-5T4aVmFcu1THMbD7HKPmuDCYAStxPut1bHAqvZsfI-fP5X6umYrXw>
    <xme:-5T4aXujyTQFuBNub8McL82rLzr-EtJLOB675ilyopzvi7mgzf4dMHHb1eyq8FxWc
    Dq99qihqgjX_W-BZu2iJVQhxzIetdt_9jO6vA4okMVaN7TcwS8>
X-ME-Received: <xmr:-5T4aT-wMaVRLzDwHQmCFjCIYEonrATKdkOXHTzb9UoUN0Oht6r15YYPXedVVWC6tvjEs6jhXAoULS5LdZI6F3j0wHzOl6nNc-9CwtEwV54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeitdeg
    veffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprh
    hoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:-5T4aRPPNZwjeQ5kkp5VgoxqV7axjZ7BGj5RDTXAlXF9RCZlD3SjhA>
    <xmx:-5T4aRH6jW_jeF7mJ3MYr39gu2zBrV1WlzhhLRnj73pphUGfPZHaXQ>
    <xmx:-5T4afQYx1chyXUsLtg1zJXeX4HpqevBrjZRmJddA4wJdTxGbh4-Og>
    <xmx:-5T4aesfWi_czuu2JBDctsi0orw5pKk-1ijcXSAreFWtIvyJwUwR-A>
    <xmx:_JT4aQjQjbCA2zB2uaqp2FYTgsOuO-aX1Ah3O1UUH1R7_qecxUdznq5w>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 04/13] Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
Date: Mon,  4 May 2026 14:35:43 +0200
Message-ID: <e2c1ff1c83ea1fa58af486aa6e90073b7c74c788.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1777898749-E3563443-53F9635C/0/0
X-purgate-type: clean
X-purgate-size: 808
X-Rspamd-Queue-Id: CEA9D4BD289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim];
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

It uses this USB network interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
This was posted before at https://lore.kernel.org/xen-devel/20250411203336.585215-1-marmarek@invisiblethingslab.com/
---
 scripts/build-linux.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 441b872..cf0e744 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -32,6 +32,7 @@ case $UNAME in
             | grep 'XEN' \
             | grep '=m' \
             | sed 's/=m/=y/g' >> .config
+        ./scripts/config --enable USB_RTL8152
         ;;
 
     aarch64)
-- 
git-series 0.9.1

