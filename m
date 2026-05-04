Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCq0DBeV+GkKwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EC4BD2C6
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299789.1574433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgZ-0005Eg-3w; Mon, 04 May 2026 12:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299789.1574433; Mon, 04 May 2026 12:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgY-00058i-Oh; Mon, 04 May 2026 12:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1299789;
 Mon, 04 May 2026 12:46:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgW-0004hA-KS
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:46:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgV-008wGN-V4
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:46:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89506-5cb7-0a2a0a5109dd-0a2a4507cc76-40
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:03 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f8950a-229c-0a2a45070019-ca0c7c92b73f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:03 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 4419D1D00072;
 Mon,  4 May 2026 08:46:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 08:46:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:46:01 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898762; x=1777985162; bh=/ymJBx8GTx
	CdivGqgtTD1zSfg4O+MOsuDgVQ5lv9Mo8=; b=IoLAfBpHrE9+vgcJr+XguJYmO5
	sPSgkofYKMKErZXztKRdI3jBEDjASIn0Oa+rSAOyh0rp8ZGFx9m+lR9zR0pmdOni
	bMpiOn5QM9M7euI/iK/9/kTAlUCMPlzS57TOCNcCSO164tjvlCjVmHANCjQ4Ldr3
	D4OGgqQnCzJeK4soRMYkFz/8FvPFQYIdJ9mNaa2VuPHrJJZ5NDFd7YkmlyzbWTRO
	9VWLBwLZmUuobcb8txDz+dNYV2PoHA3PRMdvToDxpTRQyt/2mqurmpNEpqEMJQ/9
	anoTC9aEbKD3nLGNQG+cf0WJucYznSwld501AXuiuVyUeZiQ2z2IMLbYwi4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898762; x=
	1777985162; bh=/ymJBx8GTxCdivGqgtTD1zSfg4O+MOsuDgVQ5lv9Mo8=; b=R
	vAmDOmYsF1CM4FqU5KEb8VBYiCi8hBkEgnLklPMz8tRX9g1JvQfmm/RMB5ibf4gd
	60WNcjLn1eCVg/V/OnouYU9ZwkRFDrs41Bpofdk+8dLOd6MDjAcGHSH9LtrAwkIX
	/uj3X7dfTMaB+CxpSgXRoQdmQif0jkkK8zQ0bcpSPtG+InvaRz8Q1TelJXWmjXhX
	xtdDqd+ujvAKp0YTWDFs18zXrUj6/MNu9Sdft35J16bl7NlMIIPI2u6aN/vj1QAP
	4/QBZDOJBnkdjdwtl1OguSUszKT1w4MWrxKwdPRxjOSBuV3Re4qVD/xZakmwToeQ
	rvG74nnQCPTj1WzuLgbqg==
X-ME-Sender: <xms:CpX4aWuOWafVUGj--21TZNVRYQds5YyZLF1K3Nk4Zsdtk5YBLe6sbg>
    <xme:CpX4aSWs5ub1Ilf3QWRIiWzBzpRDlgARW8AF3Hh2l2OvaZuWrTWQQkNzRr0qMpq2f
    gkLU90Ri_JYDKjJdFAN2qeuIL4xUIuqyG4jCG2ga0ZweRfwDQ>
X-ME-Received: <xmr:CpX4aaEcD_oROZDbTrabNIzgkn52yeC6vGWvT2XaVnq8Vbqxn1Dn34WW6n9O-T2V8g_RZfRPnRAGQrv9PEycQw_h0rRAnYlQ_PcTOW41NiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:CpX4ac0ANZRGTxRmhQEZsxCIYOCqRGTZjhlNRT5JOZLdbgQVH3KWQw>
    <xmx:CpX4aUNCW3FgORfWVkP8t1NRuktSiP5zVnTM1oWhDYmt4Akn3UnuzA>
    <xmx:CpX4aT7CI3Wwq5ViH1TFjwHFBYdOSuOPTsPVG00K4bx-Ka5O25v3SA>
    <xmx:CpX4aW2wHiw0vNBQFFsq_ynehOg9f_m4xCeUlSI6O8alvJDPfDiPGQ>
    <xmx:CpX4aRIc0DCDWHZDCDcCNDP6ZV7Ig8bIHJO9M5jXY4oZwtbrNlnPQzTs>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 13/13] Setup ssh access to test systems
Date: Mon,  4 May 2026 14:35:52 +0200
Message-ID: <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777898763-1505AC48-0BB3A418/0/0
X-purgate-type: clean
X-purgate-size: 1527
X-Rspamd-Queue-Id: B40EC4BD2C6
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

For this add also bridge package, so xenbr0 can be configured with
/etc/network/interfaces.
This allows extracting more logs out of the test system.

Create empty /etc/network/interfaces, so the 'networking' service starts
cleanly even if no interfaces are configured this way. This is
necessary, as dropbear service depends on networking.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v4:
- adjust commit message
- drop DROPBEAR_OPTS=\"-R\"
Changes in v2:
- do not allow passwordless login
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index f649550..c7fee4b 100755
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
@@ -85,6 +88,7 @@ echo "hvc0" >> /etc/securetty
 echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
 echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
 echo "rc_verbose=yes" >> /etc/rc.conf
+touch /etc/network/interfaces
 echo > /etc/modules
 passwd -d "root" root
 
-- 
git-series 0.9.1

