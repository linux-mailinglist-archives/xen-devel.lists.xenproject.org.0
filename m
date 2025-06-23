Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC536AE44FD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022373.1398178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVr-0004vy-IA; Mon, 23 Jun 2025 13:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022373.1398178; Mon, 23 Jun 2025 13:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVr-0004tE-CM; Mon, 23 Jun 2025 13:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1022373;
 Mon, 23 Jun 2025 13:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVp-0004sG-Ch
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:05 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ab1b2ec-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:03 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3711511400F0;
 Mon, 23 Jun 2025 09:47:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 23 Jun 2025 09:47:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:00 -0400 (EDT)
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
X-Inumbo-ID: 8ab1b2ec-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686422; x=1750772822; bh=rd3USSJTOQ
	GgPaA3MkEgLhgVn41dCK5xgFAB+vXgTXw=; b=QXtXyH/kHx8bMeJDMBI40SfKFK
	bdo45hv+dvfWJLa78uhmz5Npa7Le+zv3tKFmfVKJ2LYfHO69mAXWfmdYQcqxNqGf
	4C0eNBk16lmWQ2wCGRcExoc6zqcnOP5qvSH7H2kuXWtbOGzuefCTEJVkDkbuSuLZ
	2mVoBqWSTYET6X38NtTz16tEFX+XE/uqhM7FZPPltxizBpqFJv5UrM11jrqmswxV
	ruZv/c6Cxn6xs+uyx/JH2tB6PEyRH/dEvSo6ysfLatI96N2r7BpR2Fz5TAo6nkwK
	+qdRHhvg9HltBuwYhrs34KPScB+um8ek/M322LRQHx/TF2k/bNe3t11NKoqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686422; x=
	1750772822; bh=rd3USSJTOQGgPaA3MkEgLhgVn41dCK5xgFAB+vXgTXw=; b=p
	KfWRAzkLU7xqYc9tsiMPtzPcavCKln7+2oL6Z1Ao5saLqbd/z7v1DCrYQXF7EeYh
	B01+bpzKVWdM7dnIEYEcNEWsyEci4Ea64czXnzyXaBYgYJsjWC6l5MBxhmnolWxZ
	4d9f6BoXY6wypsOXyHmI7uy8AvJt9a0Fc4xAJ6yiggIjdM6xUpcGmcRNW8rblXcD
	3E6uNuaM9k6hLFfwElAN5TsqgFsilTI+9iS/ELbcVkSRj4AH296nRt52Mo7RNbNc
	XeENN8+jGswnBtWRLUCtZMPU1k5TOxOwwMqxkNnZ01mXraVO9qMuj9QPRNvixdr/
	x9trkJmGP6GDqIvLxKDhg==
X-ME-Sender: <xms:1VpZaE_DhUqubwdxedSYkq3psO1oXJ2fppEldPSs3HCKALMpEvhygg>
    <xme:1VpZaMs-N7-t4ZFGCXDFpJnLL4u1O38ZVkmie1lvlEqwlKl-vcooV_iodgt6pOBfe
    l3Rw6WMp_ASKQ>
X-ME-Received: <xmr:1VpZaKB2dPEogCIm6dADirtsmuGkXL-b35zp-CjryTFWoOGuiy2pOq05AMCo8pF5EH8FnBgVaH5UWtLER4JT2UuYZMu8U2hBepZhWoShnUaeMB6tZbMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:1VpZaEeujdEx96Gh7RSeg0PE0uzwYxuwvhhn23-lJ_2UnFZgGmGcpw>
    <xmx:1VpZaJPCnvvDQBGoOvcDbditB1_MKY1lPFBTb2KLi7U3OavO06lm1Q>
    <xmx:1VpZaOmG0x-57Qm6R3-cx49LVrcpsPbql8xXXoExEkRjgrGznSpDDw>
    <xmx:1VpZaLtYr3ffOLVJBXJrJ-z-s29T1Qgz37dqOZ20831bmrgHCFrOJg>
    <xmx:1lpZaOUdgm3AgiicDWeCPSnnc0jJ8skT4dagMx1MqKFH3olPpWkZALbt>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 2/5] Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
Date: Mon, 23 Jun 2025 15:46:21 +0200
Message-ID: <8c97ac17c41e53c15e769f28d537faa01a0b2e6a.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It uses this USB network interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

