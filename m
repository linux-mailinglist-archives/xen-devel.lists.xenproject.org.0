Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D83A7DDB8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939834.1339804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgT-0006Fs-5G; Mon, 07 Apr 2025 12:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939834.1339804; Mon, 07 Apr 2025 12:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgS-0006DZ-WC; Mon, 07 Apr 2025 12:34:37 +0000
Received: by outflank-mailman (input) for mailman id 939834;
 Mon, 07 Apr 2025 12:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgR-0006Bg-P0
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:35 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a901fac5-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:34 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id BC3C8114021E;
 Mon,  7 Apr 2025 08:34:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 07 Apr 2025 08:34:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:32 -0400 (EDT)
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
X-Inumbo-ID: a901fac5-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029273; x=1744115673; bh=+wUYsjtUJc
	5L9TuaQNNpMAeWAX2i+xchkoztHrK6MYY=; b=lWRgvKlNUc5fC8p1j2EqJMioOq
	557asKPjMRf6woeRU5dYUzQXGhUJlgZHdFBwZaks1spVsQsSIO31qVuWwlSRft1N
	4fF5g0fCA5g2BH6gwmzvwUIN6H3af8TEYn/OsWKJgIZnfsDGQ0B7R5F+N4tNSL7R
	FCYfcz33fdUNL4EPuSzYDzbxDxcjzPuDObQWEazNe7Ysk0yWAxnE8FtDiMdmcjsd
	JCwcQgmJFpE05Sm+pLnHU7tJ/G6NWCg+o0m98sEGpyGIP1vpmWZ/zc02H7OGNilU
	ETd+HXTrIzPJa2oNdsslRmnkzVexsJMeM463M/H3JOaE9ftNgixY4GUsg82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029273; x=
	1744115673; bh=+wUYsjtUJc5L9TuaQNNpMAeWAX2i+xchkoztHrK6MYY=; b=d
	MZUZqIxH5rVFbors4D4p2cUljYYxfWMV/o1PnDinl0eszsg6Z7uhFoAS+x9Wa0fi
	UDIhpumbQBPBa/ix1CXLV63zm6hK4LYVBRYd9q6CWXGVtKIEZkXVEaI1Vyzt8KaN
	W2wboIY5oqvjeAGrXMgzXqntI2ecIo1SZlTQbsEwZhda5o5VwOtyvKcW++xw5EQ3
	T512dmLV5jqa69Ost32t+dym7vKkb+sxKtWxgvErTOtUlO6tJoV1UW4JE2pbjYKc
	hrajpNJ8K9M1Z1R0PhKTXE9rcmE9EKwj3DPSBBk5+tLfdQh83PND+GJFAnLm8evK
	1NU3cAwAvf3zAYNt+nGMg==
X-ME-Sender: <xms:WcbzZ0UiSmwvnMiDj0G4W9KNUv5E-wpT-Ky80JpPnIHeXnBcaOU4Fg>
    <xme:WcbzZ4mx7GuRGSpCIVQH3jdfSdP9NWaRGRAQ24BeOVtGKkK3gFuhH1DDgdlgBO81c
    zx9I_HCDq9dxQ>
X-ME-Received: <xmr:WcbzZ4YF9QphVa8JzwoJ6kGtc-ljTg6agzuiE6QtxMNo-fesvHgX2GPHQuK9VO3BQXdWfhSV8D4hKvCoQiDnhOZBcf298PrUbr6xhXQdEipECIITSQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:WcbzZzUqtV36b9frU0yRqDwJtoNwNZdbDM8vQZ41bh7dpj7QWW24jA>
    <xmx:WcbzZ-laLsU_w8ASuPOU66Gk7zgiMoxQlZ2BODC2h7OOmSgEI6uQ4A>
    <xmx:WcbzZ4enHPiqvPBdAd5KDpAGh8OI3lRrjq05aoUoi5eHgXghV4xZlw>
    <xmx:WcbzZwEwyFdgWBW2OYQ4spUFuBbeI03SgwkRxMRUB3778V_gxf3o-A>
    <xmx:WcbzZ7vNw_ydtepHh4OQAL9_w4-1WqDB7331GZyhEbvR3NEqX2vQlMoc>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 01/12] CI: prevent grub unpacking initramfs
Date: Mon,  7 Apr 2025 14:31:01 +0200
Message-ID: <e401356ec4741ad3a818a84b0d132510eff0f84a.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It fails on larger initramfs (~250MB one) and sometimes even smaller
depending on memory size/memory map, let Linux do it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index f27296445901..8e78b7984e98 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -248,7 +248,7 @@ CONTROLLER=control@thor.testnet
 echo "
 multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (http)/gitlab-ci/initrd-dom0
+module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
-- 
git-series 0.9.1

