Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B289DA8673F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947820.1345432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4C-00084z-3r; Fri, 11 Apr 2025 20:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947820.1345432; Fri, 11 Apr 2025 20:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4B-000809-W2; Fri, 11 Apr 2025 20:33:35 +0000
Received: by outflank-mailman (input) for mailman id 947820;
 Fri, 11 Apr 2025 20:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L4A-0007cp-W1
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:34 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c6b6fc4-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:33:33 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id B132E13801B9;
 Fri, 11 Apr 2025 16:33:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 11 Apr 2025 16:33:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:31 -0400 (EDT)
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
X-Inumbo-ID: 3c6b6fc4-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403612; x=1744490012; bh=VuN3uaPC9/
	1oCBNczeJqoqUgjyO/L96skArqSOsXDoM=; b=POVy4A7s+eBzR+t68xlu1snwRn
	ij20fd4QPLg6zs1uONXC41GD7eNZtWLz0rCw1/qx4qsJnidQ4VtFIhwjIhoOf+Av
	1YmxMXkKrDDkHqXehlOzuGEwAT6UIhdtRa8Th5OZQYUoHuGO/wSxSO+bJQFNr23Y
	Fg48eHiK7f1BXAx22u+6uA12GCmjRk2KZgmfhQ0KKMs7s4dnjqfu25oOTG171DRF
	SOogtDFMoWj7OpYPr/VQoUAolIvXiuFbe4qZJ60eYG43t6JE3UbXNjrudDNyqnrv
	tbeZWEReIIzsMMFy0uV6m0yDEgQoNZ04uTbvrhJ9mckVTz2ilrlVBLu/ojVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403612; x=
	1744490012; bh=VuN3uaPC9/1oCBNczeJqoqUgjyO/L96skArqSOsXDoM=; b=d
	o1kQmZzU72aAV0Ai4batfPWoxikgip4xG/gKzK4Q1K6Kz4XMDl3g8V+pY8R6qzhj
	EKvnygQm6ZowHStVoNK9mXrPfQPmkPXlmKAflxbQGuqfvjw7Ff3I7NXHXi6Hbu0q
	k/Mxqke4eXf6t+Uq/yieoR6n0vjI67dmwpCATBE8bOzcOWEX7GFXBC151aHp2Jsu
	YCIPgo5L2vjxq9Wpbijmyf8n4Cp8uTXP/yHHh8MxSXuD81ZsL3hWVEVvMDHTKj9B
	eo9NEjiscaYn0f1gQpElsV87clFUrW4q+t3tFKJLnPNJNifCZwAO1fndM4JPdbq1
	u1vY/z7dzVPpCF/6csyFQ==
X-ME-Sender: <xms:nHz5Z9VUxcfZSEOCImbp5O-PaeEGKtaiRyYwJVqpfUC84xpM9fy2tA>
    <xme:nHz5Z9mYjosHBDbr4jrI2WGhDYq3DkkWkvXnTBGgZpoch-yddMVDk1CCMX0pF_0Kp
    ceznq0TG6nKFA>
X-ME-Received: <xmr:nHz5Z5ZidpaDerIw8HPuat5gBvkuAcO_MCb40MO5nH2a-WIIe438OxjEeq2PiHJDGiLtI8Wak1JaaOKmjB6u1SgMOFFdrZ8i4u6ILEgXZayvslbfqe4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:nHz5ZwUqJqhq7P1QdM5fKfn_MVVFK7kBHY0MgJhg9ZmTfeh4En8aeg>
    <xmx:nHz5Z3km4DBqdg_vxwDQAnnARIiHiwm69aD6JYTNr2LkiFZw4ixz_Q>
    <xmx:nHz5Z9ezcxi7dfpa0-qv5RxaF06oi1VX7Y7pmTKyNrBzDkbBc6hNeg>
    <xmx:nHz5ZxFOqAsclMvZgC3JIx_KJZxWgGxVZH5RxdUu_MvUXBKYqOusjA>
    <xmx:nHz5Z0PCfVG3-yXmZzgH56vVydAM5OG7OIoDZZ3TOqgUn7OZdjPpN2Ge>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/7] CI: write whole etc/issue for domU initrd
Date: Fri, 11 Apr 2025 22:32:16 +0200
Message-ID: <526ec153b1cabc1d5b111be27ded8d0d4da5178a.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upcoming changes won't unpack original rootfs anymore, so sed on
existing file cannot be used. Override the whole file instead.

No functional change intended.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh             | 5 ++++-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 861e302d845b..dd88a1398f2b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -182,7 +182,10 @@ ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
     echo "rc_verbose=yes" >> etc/rc.conf
-    sed -i -e 's/^Welcome/domU \0/' etc/issue
+    echo "domU Welcome to Alpine Linux 3.18
+Kernel \r on an \m (\l)
+
+" > etc/issue
     find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 69caabe2d8ed..4db249530823 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -103,7 +103,10 @@ ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
-sed -i -e 's/^Welcome/domU \0/' etc/issue
+echo "domU Welcome to Alpine Linux 3.18
+Kernel \r on an \m (\l)
+
+" > etc/issue
 copy_domU_files
 find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
 cd ..
-- 
git-series 0.9.1

