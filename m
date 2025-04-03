Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F6A7A195
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936477.1337734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPQ-0005lj-5i; Thu, 03 Apr 2025 11:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936477.1337734; Thu, 03 Apr 2025 11:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPQ-0005fN-10; Thu, 03 Apr 2025 11:06:56 +0000
Received: by outflank-mailman (input) for mailman id 936477;
 Thu, 03 Apr 2025 11:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPP-0005Qy-0o
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:55 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8a615c-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:52 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 056C613801CB;
 Thu,  3 Apr 2025 07:06:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 03 Apr 2025 07:06:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:49 -0400 (EDT)
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
X-Inumbo-ID: be8a615c-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678411; x=1743764811; bh=CG3r5e95Ow
	X8jqQD81Gk2i2+rrH9WMNFIvnRfMaYPhM=; b=UkUJYwB6XZ3wti06ChW1j3lX3b
	zaVgy+WhVt6eVzuNHpgIXer3+/f4uiy6O0TtrSQ0GLeANu5bPljHfU0mFu4xN7kP
	dsec6Q11zbUpI/m9CpSgaGlPkBQCgdOep63HDvqaADP/YTEr3QL8y/zvObzWo4UR
	n/uj2gyb+rMNFQrPJUCEj/VR1x9TV/ej3+H0qXEt3I9PycLW+j9s1yiPNW/pPf6D
	IPV6m74JURYINk7L9wMZbACXyv5Df2iOy266deSGeacyyKKsVGpNFTLkLICHyydP
	fNN4PqymoTrfAqbKZXvRMON+4ZD/Nd55jxp1FGPSQBmDe1mPZ5jE8XOn/OzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678411; x=
	1743764811; bh=CG3r5e95OwX8jqQD81Gk2i2+rrH9WMNFIvnRfMaYPhM=; b=N
	M4QyWUPRGbUMrbwjA/eErPIySIfv+t2RZjcQq5sx0Fw5L7vtc8NIWcA7gKCjDf7p
	PfMhnRyWeJADUSP5Z4la6YZvhiGlPn2G1iOfYGq9MXMXao8Hv12Ltv6hKTvynt0R
	0mCuVefGCQ/B4KPVW/AIjpQ1S8fgRnfg5aZlDILJKCiGvd4PnugWKfTBtNSHIJJW
	bMBptpH+pVO5tfIB14QwMEqgzj9KEL0nY9vXUhhIABVhAMrqq3iOkj8jIVcEIC8/
	j4it7sGgyPOlzXcCNa5M3389TQvNbj6ONoGbX8vfqZJBDCmlFoh5nqz7e5MzCq+M
	oJNgGNkAlRVZP/bg1FZ0A==
X-ME-Sender: <xms:ymvuZxbBiFeoWUdU3LNQIB1Mz_cAJ48sb48TpPbPcMiIOj606DqxeQ>
    <xme:ymvuZ4YW8n54m04vZyB6wz71ixS9VcnwwgW-2cztKHAEcKNzhg2QmF2-cW-75SrXc
    xIAWrDsjweP0g>
X-ME-Received: <xmr:ymvuZz9TOHzeqglbI9WyzM2BLJtlTVSVFCuGNeN0zJK9-7i9ws_HuFS0ZIEx8FWRqTeZkazjz8eeUkS5OBbdNLZLBmj3y1rMquO-yymrlAIDS0LYJq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ymvuZ_p3vSM6EZ-8A35jN_78NLx96J-PpVXv0W4ZHYGlUHCe0TcUgw>
    <xmx:ymvuZ8p1MhQeLntKWHjNMjj0jm4LlAznhOSuxGHLBtAjOuhK1qcp5A>
    <xmx:ymvuZ1Q_bjJZga_-X1fUIF5sJJW8YzKXUAwnfS69Ul7gkN_lQw84QQ>
    <xmx:ymvuZ0oA5DH3x7vCajT0pp4v7b_DAWg8ooBQKef7Qg_kocOod7uJUw>
    <xmx:y2vuZ6gBkeK3yFGM344NM0yyGCjOpIVnXRjUXPxGYUxdIZ7zikPwSjMq>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 04/11] ci: include domU kernel messages in the console output log
Date: Thu,  3 Apr 2025 13:04:39 +0200
Message-ID: <8902a1274707600b1fe38d41d11ac28627f386b7.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 771c77d6618b..d316c17e0c9f 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -175,6 +175,8 @@ if [ -n "$domU_check" ]; then
     rm var/run
     echo "#!/bin/sh
 
+echo 8 > /proc/sys/kernel/printk
+
 ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
-- 
git-series 0.9.1

