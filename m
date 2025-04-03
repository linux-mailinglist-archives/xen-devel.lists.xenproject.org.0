Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A6AA7A194
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936474.1337716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPP-0005U6-6R; Thu, 03 Apr 2025 11:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936474.1337716; Thu, 03 Apr 2025 11:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPP-0005SE-2t; Thu, 03 Apr 2025 11:06:55 +0000
Received: by outflank-mailman (input) for mailman id 936474;
 Thu, 03 Apr 2025 11:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPN-0005Qy-Q9
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:53 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb955e4-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:48 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 05F62114028B;
 Thu,  3 Apr 2025 07:06:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 03 Apr 2025 07:06:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:46 -0400 (EDT)
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
X-Inumbo-ID: bcb955e4-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678408; x=1743764808; bh=rC8r2721qS
	JvlhwPgxIAo1RX9Y0qBL31QSD1MwC1V0w=; b=KIHPBMMoRiuv47uLFhv6Qh5Eqq
	3a81cqTnRut72JOgfHGS2NTAsXCknnI1i0+7s2obhloqtmqzkrM3ecanbPeUsscf
	2G5mSliGENbFXUs3LVp254j5EkkAvRLDC6BapDfDGDXR0betQ7HvqAvvbD0/AU1y
	nfQHFSKJE8I+oGWDUJwreYc+97ZmKThDKbNM31eyEkXXaqWxUKhRZj2hZjaDAe4u
	ioyz8HGh7fYff2POZ4TDe7JelLnKoGp1IELyScubvnnfQ7XTNLhEpQgdaUcujzsx
	Yb8VG5cWD132pGGBCDjMmUJjGyPW1+mI3noCzsZtGO2vUhF2OC//fOtIxVWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678408; x=
	1743764808; bh=rC8r2721qSJvlhwPgxIAo1RX9Y0qBL31QSD1MwC1V0w=; b=u
	8O0YrckO7WiIQTAekB2PobwoZDwjEFljRymGje+Pgg4FOVsrX0h/D8q/CWGYkXiB
	6ak/mWtT2KkjF1PTVKg4PibIaZnBMGXJQX4Uk21w78TcUUG6IUSKdwFucIPgSBs6
	q/Qc6TxMAFq2j3oqyhp2k+57cAmHDwNR8kSFlW3JWIPni2W53qMqcKAXRv2nTfzA
	MxG56LGqaVtqf0eNpFLgtJ2bh0M8Ha+vvjHTPGmDcB4Jn2/pBTymB3ESP9Pf14zS
	l3V4oZzaSJN6mfKFaQW5CYAUQv5NziR+H9j7dF4LBL4qdXy5xFOEMBqks1We1lYQ
	ZB6dSrFaPNzIVLEfqSfwQ==
X-ME-Sender: <xms:x2vuZ1pJoOQtu1bp51PU_ar0MOx8qBbNMXn5fN457stPaE9JHEOuVw>
    <xme:x2vuZ3ozFE2t_iaOydQ9eaLd7NeCXAr5MZyyZKWw_MWgHNxi2C62_XFuijwNYbOr0
    8A2q7l6H_CDEA>
X-ME-Received: <xmr:x2vuZyPfsS9MmfEPKC277E_8jnnYI-j736ogHmttqjupRLVlXn9Jr6MI5fNEESg3n2lqWOTzKFkdMnkH_hKMUjyD1TDwVOvG_EHe3N0VkIEHMzbgXIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:x2vuZw7gXHAGANP8NmtGriSzYuYyQhjPfqnACoO42Fz2zGy_lW726Q>
    <xmx:x2vuZ06-AzbUzANtiNT7XjdXT_mxfCYIPYR092WR7p_oA2Fda4bSkA>
    <xmx:x2vuZ4i3YPE7r7RJc7yApKWiLp1SlfmONO0uX5H7kMIk-sKYKQyTQA>
    <xmx:x2vuZ27mDz_Vc3AhoAfpcewaMR5ZJ0FPLl1XqTq0XERVlfLycZPxBQ>
    <xmx:x2vuZ3ybpn17BkRHoVFeVNd7NBTuKHHXeWn4ZVdLjRtuQHzIX9URaGkO>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 02/11] ci: increase timeout for hw tests
Date: Thu,  3 Apr 2025 13:04:37 +0200
Message-ID: <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It appears as sometimes it takes more time for Xen even start booting,
mostly due to firmware and fetching large boot files by grub. In some
jobs the current timeout is pretty close to the actual time needed, and
sometimes (rarely for now) test fails due to timeout expiring in the
middle of dom0 booting. This will be happening more often if the
initramfs will grow (and with more complex tests).
This has been observed on some dom0pvh-hvm jobs, at least on runners hw3
and hw11.

Increase the timeout by yet another 60s (up to 180s now).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 8e78b7984e98..771c77d6618b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -17,7 +17,7 @@ test_variant=$1
 ### defaults
 extra_xen_opts=
 wait_and_wakeup=
-timeout=120
+timeout=180
 domU_type="pvh"
 domU_vif="'bridge=xenbr0',"
 domU_extra_config=
-- 
git-series 0.9.1

