Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD95A7A196
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936475.1337722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPP-0005Zt-Ha; Thu, 03 Apr 2025 11:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936475.1337722; Thu, 03 Apr 2025 11:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPP-0005Tp-D7; Thu, 03 Apr 2025 11:06:55 +0000
Received: by outflank-mailman (input) for mailman id 936475;
 Thu, 03 Apr 2025 11:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPO-0005Qy-0n
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:54 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd9a8eb9-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:50 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7AA001140292;
 Thu,  3 Apr 2025 07:06:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 03 Apr 2025 07:06:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:48 -0400 (EDT)
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
X-Inumbo-ID: bd9a8eb9-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678409; x=1743764809; bh=lA5rNoXMFj
	Yd+4VEypprEaANw1GP9/mRcCpOefAjoY8=; b=PbAlQHudWw8iLI/QReiOn313Ra
	TnYL+0BAhDHrdor7ToF35o+oXC2BJzuWgNlnUKLWdUqurxgQYoJxyN0MoN3aSq+O
	ZsiqhbTBda1kVpgxzh0hC8A2TMqi5lM0+WzCNQql751yDIO9twptiDwb2FjHgO1c
	ZDv+cgOxJa4I2pQXOomzdhHVs7rNzAmK4n+lHnj6EQANC8JxDaDzHbclD41dKI4j
	6sLuNBkJbsAxzdJxhuecL1Mn+PQvd1JTidIv3LdFHSaMy3oc5VcPKSv1t0ckEhW1
	LNwxX/yUzudQ7YGr3kFbA6upWx0dRK9pH6GnFfgBV++1fKdIrjUCOSuLqADg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678409; x=
	1743764809; bh=lA5rNoXMFjYd+4VEypprEaANw1GP9/mRcCpOefAjoY8=; b=Y
	cwrokVZ7jqto5GogC+j9RgjiBWsxLXdI9lDcV9pT9yqmyRECSFilrWksSZZhUC6Z
	vJ+eFsDonrv5AbIJOmFLQtG27TYdn1VEJffVCwihoHebjsSey631kKbOZRb8X8nM
	+EQpqlj/0XfSTvqH+vGunCljUth2e4vshE7ZjGwm2C1UEYz658Jcj/GMlYvhVnGQ
	3q2PcSzdb5WbTSFmiFq0PSYPRtzGh17SFH/R4mVqlKyXhWOWlN+fNduOR2EWG/1x
	qWfJNHlh4Y9cilPynvB5dnyYqe43EFvOhtL3vlkroOMmBkvWheWtuYBRpwBIlm4i
	cJicx1oH5KCe28jJzmscA==
X-ME-Sender: <xms:yWvuZ2nTtIeo4vLrKsuDK10D2u3nc2DhDGoPJEParF-cen0qDCDQag>
    <xme:yWvuZ911sHivnyhNOxcYCXLiMz_Y4OvTpHO_J-dQZ_rjzZxvYemwlkjjM_RGN-e95
    rWY01n_UiZzkQ>
X-ME-Received: <xmr:yWvuZ0oVIzJ9-gY6oCnyVMzYyFEHgPJOSEnnJNZ668KLDhMdn3xFsR8Craxngb7q-jGMBAQik759mU2GviUezBSHJsYATbmLqe5RixKQG56lO0gSI7g>
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
X-ME-Proxy: <xmx:yWvuZ6n4K-_0QIJMGNzTLM1s2MY35DjtersTkSMgZLlHNKwM_iMT7w>
    <xmx:yWvuZ016MF3CLtVxIZKbJTD4FgwqJ2ezbPpYf-SvNnBvANdJVMG5OA>
    <xmx:yWvuZxvdZ0FxEHVfbYM9w8ZL9Q1xM8T3KDMo6YR6hyR9I9XXorh9ww>
    <xmx:yWvuZwX4YNsJSYDVGtZh6_-sWEbSQTLYAlX97_U9zovdLnbYuDjnEg>
    <xmx:yWvuZ6cVruP2Cm731J7pMsjaixPOx2e70WMlcUWSjDGheRaniRlI40TS>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 03/11] ci: enable XHCI console in Xen debug build on Alpine
Date: Thu,  3 Apr 2025 13:04:38 +0200
Message-ID: <8994039fbd8694a984d234b30b1ce727b16844f3.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This build is used for hardware tests, and some runners use XHCI console

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2513908b059b..169bebe3c775 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -341,6 +341,7 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
+      CONFIG_XHCI=y
 
 debian-12-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
-- 
git-series 0.9.1

