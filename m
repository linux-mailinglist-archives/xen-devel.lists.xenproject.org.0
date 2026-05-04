Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLChDBeV+GkOwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12684BD2C5
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299785.1574425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgX-0004uL-L6; Mon, 04 May 2026 12:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299785.1574425; Mon, 04 May 2026 12:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgX-0004pk-Bj; Mon, 04 May 2026 12:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1299785;
 Mon, 04 May 2026 12:46:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgU-0004EC-P1
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:46:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgU-008wGN-3n
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:46:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89506-5cb7-0a2a0a5109dd-0a2a4507cc76-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:02 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89509-229c-0a2a45070019-ca0c7c9ac7b5-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:01 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B1CA47A00A9;
 Mon,  4 May 2026 08:46:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Mon, 04 May 2026 08:46:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:59 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898760; x=1777985160; bh=XX0Dg/7YfK
	rsJr0bP1RqDlxPQIUTpCyaHF1UQw2fWRQ=; b=nkRlkLPC/WA0AHbfJhP6DjBSEO
	Saa4DJsoeTnjolHYnKw3wXIVcgBO7z49UgDkqlT/ct9+nKDy4+YFFO4CzOvSaRLO
	V7M08+YxwAx/oE7RqyoYbZtX0Ra5Vkim/xQYyRYLLYjvRqh14JfLvbpGVPMdqZyL
	na0hf6SGhO+IY3Mj91zGm5Ed8XmNaRK6tzWUAcihTOjcJDoGRlxTt1pu8FQlDK60
	E1UQS8AzrHaY0eHySzMLRsXL4Ni7YRNEgWBS51tEEWDkv1KCJzuthUWuoCqBNapt
	P9r+XgzPhMteOaJMRMSMCvFqpi3vgpe+hM32zI7wJ/j9xgGq+eBeiPnS2jvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898760; x=
	1777985160; bh=XX0Dg/7YfKrsJr0bP1RqDlxPQIUTpCyaHF1UQw2fWRQ=; b=N
	27uBja9WafF7tXG3QkODmosMFQiAaPVt9nSIFCeKpLhLUZUrIy4iZUQOecpB2Cwk
	+50VwAX0hc0pcw4gkjtvxeZRv17eA1uKXGXvOaWG+c/bIIN8F9OJKiLGkX4DvSmt
	bnjD6nyhArc63nwCIbPLDQqeQ65dELy+RzYHYmH/OwHJWVxkpnaB2rToS6VMSu3y
	9X8HViY6bpnG4IwjrfF1p4nB1P/1ijkmwn+4BKZDJN4RzDhL6XdznUNQLRWaFKET
	0qh2m0CCGth1uPzJlzWPrjfpfzpgDkUlui++EtzH9v3TZM82BpFZd1iIe2dFxSkq
	a9ywreUarTSgahtoRGI8w==
X-ME-Sender: <xms:CJX4aQaxbMtpP6yfv0bSck5cZH5U8AKzsfBIevDiaui1GRbOiY2eZw>
    <xme:CJX4aSSqB8VyW68_l4I9r2YSNsDMDKE0_blY9lWmMjFloHd7vvgPq2kgE75sR9ZYx
    yv8BOKG-hnaBWNf9VLqfu3GpJNF6aBnG_t3JtsrG9DBS0EYnQ>
X-ME-Received: <xmr:CJX4aTRcYntFSjIoyJlEXg5j5bfc9plX_OsccEqO-6lx0KZiroE0DlUX4BGiTFhGCUkAiTuSt4Y6MNvC2RFceE_7eHWvqVuyuOAVTQxdhL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:CJX4aWQkSYWQ9FSNM7eqvlCbLgUqSoHPj3h4Q0CmsNwagawYGt6XWQ>
    <xmx:CJX4aY4THPDo5Q-x2Bk_VEeEgJGeFwTGLcvvcEVQ7TcvV9p0pt1zTA>
    <xmx:CJX4aS1BaqSudc4Vt1b4nN9C5oR2JNLPSg1wdHlZ7128zJrz7Q-h9w>
    <xmx:CJX4aTB2gemWTV99xfxJdWsgKckbr2aJ5eWOMQOLrGl5gwaJv8AzdQ>
    <xmx:CJX4aSHv7HohQ34Zwt5Uxi57ir3oPZZ3Ymxw7eMXkClu6oZM6KnIAxYu>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 12/13] Prepare grub for booting x86_64 HVM domU from a cdrom
Date: Mon,  4 May 2026 14:35:51 +0200
Message-ID: <4aa490a4f8a26ec86397cef30091cdd3f3598c30.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777898762-2B77AC48-D4272D76/0/0
X-purgate-type: clean
X-purgate-size: 825
X-Rspamd-Queue-Id: B12684BD2C5
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

The stubdomain test will use it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 18f43e6..f649550 100755
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

