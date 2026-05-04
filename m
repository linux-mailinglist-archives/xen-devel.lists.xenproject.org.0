Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOZ5AROV+GkKwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D24BD2AF
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299784.1574409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgV-0004JR-9r; Mon, 04 May 2026 12:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299784.1574409; Mon, 04 May 2026 12:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgU-0004CB-SO; Mon, 04 May 2026 12:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1299784;
 Mon, 04 May 2026 12:46:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgT-0003vv-At
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:46:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgS-002QAe-Md
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:46:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f8-5cb7-0a2a0a5109dd-0a2a4508c074-32
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:00 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89507-63b5-0a2a45080019-ca0c7c9adeaf-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:00 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 37CF97A00A5;
 Mon,  4 May 2026 08:45:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 08:45:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:57 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898759; x=1777985159; bh=AO5G90pFBx
	jSjPmnC9JaB7F6HUPav+M3PPDEti/IWr0=; b=is1HC3S54Zve+k6VTxN4yd+rp9
	Om6nSdnb3cAg5RNzFNu9NKfEhwy8uxcTlw5yWdyZ+BjVlPg3WSP90Q/YwhoJbcbK
	M+RjxxgsF26j2KpWHKdFG+XmnIQg7kWV6nQ6CqUK6d8EQR+4IzV9jCV5Me1fUTkT
	xvpU+2EE1QB3xcxc46Ikxq+ik5tyNCjB6LBJj7DtujB5g9tOKY29K8SsNrg4b0BO
	I2xylb0uKxUuAQIZmh8qIoB3PIWq+BnqhyNRJCdz29VybLnkegqBw4/sRSLIwjn6
	q9ucRqkdrDncr4/04ZV+TBgik8K53jYZlkOcxT6wCajm8QgfMW4A+05Ea30g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898759; x=
	1777985159; bh=AO5G90pFBxjSjPmnC9JaB7F6HUPav+M3PPDEti/IWr0=; b=Y
	5P/ySTYsl650uJKavS68h+fbpM6vgCjw2f70/o1R86aKOC5bw0tkKVS3MxxzkXNX
	gvzy7TN2purf5ILNTKx8UiJdoE61W29uM1LQCCntoN0w7OdapIZOqlbKEl3+JQhp
	nj5tuqryJU95K0U1NSrQgC1bxMX5bZLcs5mqGiviIIp9b9a2Wx5LgBslyQUNSV4P
	S0VsSrujtUSDi/KBTHBwrIhwwffYW0cXbZ/zIIN1QoGpHTd9p0WgFZSxk+dX987m
	nYAGWi3mtOG15vvhkLz6R4yrePQCyO0GKHCUfo3Ns1GZbqb163oEIIbvoJsuPrA4
	Cp2HWtOb0qF/pnFfxCAiw==
X-ME-Sender: <xms:B5X4aRKFN65RMhVEgERbFo4jYLcI4hpGAif8TTrkU4qsIrmmgIdQHA>
    <xme:B5X4aUC79nLE5kRPNeLPLW4mbxoxqj3Qo3MzVxaDVCXZvG9XJfKtP_llh2KrDfBxo
    3iFLslaOc97QnX8fCCCSqFCYt6rMDT_jHxUGYd_XL_jK5yDoA>
X-ME-Received: <xmr:B5X4aSDNW2FNcIApqSgBb7FGEQVZ01J6GYQZhfez_WjomhemToPOs44xvP2WwHueirADekyws0vHa72Gx-yPPCdn05i1YN_5r2Di3DpNOGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:B5X4aeBAgk1vUAcL2G3pT9owrePCfg_-cgTVPNLl9T7BTSolcqkOkw>
    <xmx:B5X4aVqcVEp0JiVUZBGiwhkPbW4RTwGFuEYqjffZtvkrl8vnYwwcEA>
    <xmx:B5X4aQnIc92R_g_xgmpTVAdUdwEpLdG7rjtIp4EHGbXXtQkv_m2Erw>
    <xmx:B5X4adyJidyTraGH6UDcWPkm3CuMPmWABiGezeGTB5ugG9ipbBJEKw>
    <xmx:B5X4aX0iNhxdiMAwQ9KSlFVqWfWkF80_DLpqLQPbtPsBmmPmp56u9RTw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 11/13] Prepare grub for booting x86_64 HVM domU from a disk
Date: Mon,  4 May 2026 14:35:50 +0200
Message-ID: <00344b97286d79b76334622611da48ceda7e7e8f.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777898760-C176EDB1-B29018E4/0/0
X-purgate-type: clean
X-purgate-size: 849
X-Rspamd-Queue-Id: A44D24BD2AF
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
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

The stubdomain test will use it

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 2671ab5..18f43e6 100755
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

