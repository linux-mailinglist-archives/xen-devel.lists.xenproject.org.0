Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +1VhI/VYzGk9SgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C430372CCA
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269507.1558557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWn-0000Fx-8F; Tue, 31 Mar 2026 23:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269507.1558557; Tue, 31 Mar 2026 23:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWn-0000E2-3C; Tue, 31 Mar 2026 23:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1269507;
 Tue, 31 Mar 2026 23:29:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWl-0008O2-HB
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWk-004YpL-UD
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc58e6-bab6-0a2a0a5309dd-0a2a4509c0a6-2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:42 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f5-e484-0a2a45090019-67a8ac95c24b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:42 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 642CDEC0252;
 Tue, 31 Mar 2026 19:25:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 19:25:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:40 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999541; x=1775085941; bh=Pbl6hENohF
	btGGC0Gw3P9MXarDAJt6eXsMQHLBHvuXw=; b=doWTw13O/LQ5rTHi5X9ZaZtDNa
	+gvszLCPXfCT9c5uSEP/IJADLCalLMlhQR1XKUCSHW3zO+DHz1lpR4HzZ94V3Dix
	Fd2l72e1NXjqFcYrKgeAx9g+rn/8lFtgxQeGIFLQgTJ7nUfEgkDHLPRKQ94f35hy
	TUKyqH2gwCeqjxEWk+cTclKnMZYjUYUZXv/unRSxJ8Vv1CTyKDQ15Ie1DT/DhEy/
	SaPb6oME9WPNcf7Y/uvjIaSu/Ke5nbYvFmg83Zjt5aCVjfdmD9AwRlsnNZXwZzDb
	u0VAx/5nOo9kERGI+NPJMnLm2O2he4E0IGSRv7b0gvFchxeJ3zyRj8v5Debw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999541; x=
	1775085941; bh=Pbl6hENohFbtGGC0Gw3P9MXarDAJt6eXsMQHLBHvuXw=; b=i
	nox1QWGhNPHLEaapd/+S5I+BmEvfyUdGUq2w88C/WPv7LlIVObnNLLPORaFFXS3f
	n0Rh3IqL+shiRWlmXmp/rahspHsurzguwvaTfhVN/CYYjoWhNjaXlChYoqdYhJnq
	+BpCwquS33Bo+gooIWRarVQKqWGLbT2A37gPxkbF4ui4hFS7NzLFPVuAxoAg60dC
	0NLwDQkNwppAKGfrsibDNSRaxsrz86Fh79pcOQ67RhCpGvnJc2qDl/GAG1VtC5/v
	3ZSYijswoJ7Cp1tVhpe8jn2KMgoH3phjafDyorUAs6DF+1aI85ySOTklVaLFRPK4
	ID6aAr2S6KKQkLaKjVAlg==
X-ME-Sender: <xms:9VfMaXwrQFcz_4q9w2qCYNxurbvQeJEu6nrMfqjduFoua7UagOwMsA>
    <xme:9VfMaWLS4Ib-hdX7eb6j6oC1vvoyg1GL8aPpMeQ-f3Chk57Kjhs-NZ1KroxX8pYdF
    wg6FaJevU53R1gLZnk_VNxB1myBdJOW0Mly7w20HgrWqesWpw>
X-ME-Received: <xmr:9VfMaZoyKPymPJs6rgUHKmOPE5mYEy5GBzeZGbZhzTBWwB7SahBnArNGzw>
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
X-ME-Proxy: <xmx:9VfMadIRLTJHrBG3JbIUsl183s9oZgG_dFIUBP-FQctcnLWt8bVshA>
    <xmx:9VfMaWT_4JllQewSy6QeVOczyjO5idKbUsvj67FJbt2CkLSXM46Z_g>
    <xmx:9VfMaUvvbNZeNtC5Z9alFW2lrTkdGF_miX7QIRJaiFGEyx_85rXpCQ>
    <xmx:9VfMafaMvCRo9FAAcYRJZmb7alTRzrCkSG0xrK4ZHK0e73fJvomm6A>
    <xmx:9VfMaX-9wUQNhhgyM31v-WMmSbK0hwqZhfcxRCYUOG6dRjrOQ6I7WEu9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 4/6] CI: use Alpine's network setup
Date: Wed,  1 Apr 2026 01:24:53 +0200
Message-ID: <2a02d9e9a4fc47674d771f22e65b202b3dbf6336.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774999542-5B8A5A73-D4C2F213/13/0
X-purgate-type: clean
X-purgate-size: 1555
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 3C430372CCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This allows Alpine startup script to properly handle service
dependencies - necessary for starting dropbear ssh server.
For the latter, always take the IP address from DHCP, in addition to the
test-local one.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 7a59fa5f1116..91c0d5bec829 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -214,25 +214,23 @@ cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-mkdir -p boot etc/local.d root
+mkdir -p boot etc/local.d root etc/network
 cp -a ../automation/scripts/run-tools-tests root/
 
+echo "
+auto xenbr0
+iface xenbr0 inet dhcp
+    bridge-ports eth0
+    bridge-stp 0
+    up ip a a 192.168.0.1/24 dev \$IFACE
+" > etc/network/interfaces
+
 echo "#!/bin/bash
 
 bash /etc/init.d/xencommons start
 
-brctl addbr xenbr0
-brctl addif xenbr0 eth0
-ifconfig eth0 up
-ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
-
 " > etc/local.d/xen.start
 
-if [ -n "$retrieve_xml" ]; then
-    echo "timeout 30s udhcpc -i xenbr0" >> etc/local.d/xen.start
-fi
-
 if [ -n "$domU_check" ]; then
     echo "
 # get domU console content into test log
-- 
git-series 0.9.1

