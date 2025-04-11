Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5096A86740
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947825.1345472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4I-0000qK-EC; Fri, 11 Apr 2025 20:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947825.1345472; Fri, 11 Apr 2025 20:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4I-0000m7-A3; Fri, 11 Apr 2025 20:33:42 +0000
Received: by outflank-mailman (input) for mailman id 947825;
 Fri, 11 Apr 2025 20:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L4H-0007Qw-54
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:41 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40332cdc-1714-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 22:33:39 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 09AAF1140174;
 Fri, 11 Apr 2025 16:33:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 11 Apr 2025 16:33:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:37 -0400 (EDT)
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
X-Inumbo-ID: 40332cdc-1714-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403619; x=1744490019; bh=O7uX55ccR6
	xGebFg3kRT0d2q6xGT5L2tU3KLCLv0anQ=; b=cQEJQzb3kbjuie54zfZlH5Ie7F
	FKXpp6x3zCkZmMgsb7wITuQjJF2w0ydVItdjUs6LHHVbbR6Z6NgiLTPqUkKuCI/G
	LJOvuZV/iQRdIRRLPHj6J3BEYTN73A9ipamSEA388Hx8aJE1b3ox4oH+Kn1qDea1
	Ahd/CZFOV2U+kCmZkzBQcdmnfucW+IXMe1SvDGp9hS/TOsJnJAuybi6OAUXqHcGB
	6a7UWonucr6R9NYFB2goHg16O5iLFBXYpamN8dgNZ9GApn1q27QFRTrmtwXxMN66
	DByEwIUPbNxo9gDZxKzo4JGY90D1UzLxod6Uth3gjny31mPXFt4OTjZypcBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403619; x=
	1744490019; bh=O7uX55ccR6xGebFg3kRT0d2q6xGT5L2tU3KLCLv0anQ=; b=J
	L6hwZjYnoJCqLj/gK5ic24i/dHlnCb95yDQggUSJvZhF+gJpSv1FxAN0dw6xLcac
	TrL+pLcp1pPgch5DhYDJDed+JnrOH7uxh0k42eMlt0U+jBEbFU/ZhDVtuFivp8Oi
	e5aYFWHazfIXERSwmt8dgQgQfhIydzP5aSluo3ZxBxnkp5DfLA5gfe5NpkvibSQo
	J8Ca6rUg7ye+ysnry2Em2iMcIg6nj1B2pC0j2jlPHjwcw96Wd2rykzcRA8dhwXZw
	y/BljCgpRCznBejHC8Y/r/lLtHf9pPvOU8+C9g5V7kmSaRV+g718bRQ6IgfhtkxP
	zKoEb6EZeOQ6EWiBulEPA==
X-ME-Sender: <xms:onz5Z37G-EMqnQdPDANM-bQcSBSEe_k4Jh0HWPUv21JHmB5PUy1ZEw>
    <xme:onz5Z87TX_tOJl4Qxq-nI7ccdScynFVJyaXUehTKV1GWgDeCE_WgMLNktbaY6iuIU
    AyxdoOAq_VpbQ>
X-ME-Received: <xmr:onz5Z-eaYP3CKPiMU6nIr0oSqz5bKgmXeiMevEHOz-4oHOydcv72qQ2jLGv3LSnMW0M3u79SV1M3Vw8Ru36xcCEvNVOWMMqCc6Y9fS-Mbt9QAyzNr2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthht
    ohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulh
    hitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdp
    rhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhope
    hsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:onz5Z4LqJBG9JVWXq7Yj9XNyuXeDziNGw_b9ormXeBfWftLT33AHyg>
    <xmx:onz5Z7JphJ-ZGTE3RpJQ2avDhdnVEvywS4TxtBKQnc2XimG8sDphKA>
    <xmx:onz5ZxyJVS_am1gpGqtkZbQPnT1tTrtllSjUeyD3SA8jkK8_ARD8VA>
    <xmx:onz5Z3IaCCFlz4SOWc0X1cB7tCmXznaNKloi1ZX6DyrPAYQ94LjoaA>
    <xmx:o3z5Z1bOBApZCmsldbRV2zbuuEPnQo8Ne7bSbBXD6Zieh7GdnorUoil2>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH test-artifacts v3 8/7] Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
Date: Fri, 11 Apr 2025 22:32:20 +0200
Message-ID: <20250411203336.585215-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It uses this USB network interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/build-linux.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 49b5ebe..af684d6 100755
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
2.48.1


