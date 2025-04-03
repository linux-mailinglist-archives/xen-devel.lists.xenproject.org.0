Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C68A7A199
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936479.1337766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPT-0006iJ-73; Thu, 03 Apr 2025 11:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936479.1337766; Thu, 03 Apr 2025 11:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPT-0006ei-33; Thu, 03 Apr 2025 11:06:59 +0000
Received: by outflank-mailman (input) for mailman id 936479;
 Thu, 03 Apr 2025 11:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPQ-0005Cd-Sq
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:56 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1070267-107b-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:06:56 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 34356114028B;
 Thu,  3 Apr 2025 07:06:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 03 Apr 2025 07:06:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:54 -0400 (EDT)
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
X-Inumbo-ID: c1070267-107b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678415; x=1743764815; bh=JB+Gi2GOjf
	nWi6se5uw8dD30frUlt29FZmXlnJ+NZkg=; b=YkQpgWNsuwEyBTgmsyCxEGOuNZ
	wX9wnq5xyyl8KJMnwdJJO0hMPtaKHY+Q1hULmt3Id8wLjbBZbaL3bgoWhj3UijXB
	IOEBRP7j1em9ac+kMloKd6FYQbr99ZJvxvVa2WIPh9+Cxh2NMbLLs/RJ4tzpaIHk
	WOfL0Xuy25ridiQ4CUqf82WF/6m2K9o/n6jiJYJitKuyNyKVq9bROXbCWzpZj/GS
	48gx2/s2M8kC5mve1mzev5K3BcP3S3y4z9+HvWPWMFa4qk85PdBdf//6T60jwxma
	Y7c/vu6fbE+1nnG0Wgyt77McyVyNBC0e9oHtxuOAtY+OONLha6reLkSbhB+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678415; x=
	1743764815; bh=JB+Gi2GOjfnWi6se5uw8dD30frUlt29FZmXlnJ+NZkg=; b=I
	BWGI52jRLSwPEtGzpduI5S8breXTIc+X3tCz2lJNoMaHEvbZcbobsH/WdtF1wTcl
	Kp0IZasiWuBr1gcCDiKoeUD78Pln5jUR1lROg+bL9nM4/dSxN75pHsSZWBRXJ2oH
	uAKotFVzSt89RIFaiJ2OPkATOFvQoX9HhKdIojV4/xFOL1u1e38gNU6Mjcqe2z/l
	96mM/X9IHWKcUxr50Mh1ncjm1m6Uqbb5gxqGixFFdjBxlnJkB7PYJhOw7N0aYgik
	HH6Vo9I9GdqGoyIP71UpIUAcIycKcKzipMxX0CuEABIVBX+n05KGMi/OtPb2EikH
	qsGblNwydro0vupg8f7zg==
X-ME-Sender: <xms:z2vuZ9Uzrls8izq27WFVdO9WN6QmGsNRTRbvEHKR9bPprNHJEvV1kw>
    <xme:z2vuZ9mLD1J5LsYH81HT7unlx1iog_Fwz4lxQ6mH0rmzR6k0rh3pUoZ9q-LJPO_XL
    oy6b5Nl4rTLKw>
X-ME-Received: <xmr:z2vuZ5bZr_ngX92YddCjltEPy0yfbxQljEB-gz5s5fjxHJfq8mGJ4JrmFTdilbX0nbwp8xmuPpyvNT6xUa3CRq1r8KiXN3c1ppwVbIJbvOyaig168ck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:z2vuZwXVhzwGvv6wk9c7PjiqNR5gcAIEpk0NAnGxFKSzZO9X4883Aw>
    <xmx:z2vuZ3n1F8KrxhmQJdtfClTcE2PndxZKYDVL_vFwA4jiRx7EL0OY0g>
    <xmx:z2vuZ9fWMOWY-Qyyk3D09xDpPKQUvPYpkEBtmfrcRJkvhUztXtHEiQ>
    <xmx:z2vuZxE1omlh5zaRygy5T59TDJ-Yavupif_CeD3pq5f3a1B17O1tiQ>
    <xmx:z2vuZ0P9y0JVFLPSDI7WjjLOxjJgWYlSjuqkvA20hlQ1oFbvove6iAnm>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 07/11] ci: wait for the network interface in PCI passthrough tests
Date: Thu,  3 Apr 2025 13:04:42 +0200
Message-ID: <726b40daa70f376f928c559b061e002c8cc2005f.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The network driver initializes asynchronously, and it may not be ready
yet by the time the startup script is called. This is especially the
case for USB network adapter (where the PCI device is the USB
controller) in the upcoming runner.

Don't bother about separate timeout - test timeout will cover this part
too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 822b81d186a7..6d2c170d1ee1 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -104,6 +104,7 @@ on_reboot = "destroy"
         domU_check="
 set -x -e
 interface=eth0
+while ! [ -e \"/sys/class/net/\$interface\" ]; do sleep 1; done
 ip link set \"\$interface\" up
 timeout 30s udhcpc -i \"\$interface\"
 pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
-- 
git-series 0.9.1

