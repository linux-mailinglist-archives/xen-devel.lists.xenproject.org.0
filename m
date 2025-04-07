Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF190A7DDE6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939957.1339919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmr-0005sx-7s; Mon, 07 Apr 2025 12:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939957.1339919; Mon, 07 Apr 2025 12:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmr-0005py-4Y; Mon, 07 Apr 2025 12:41:13 +0000
Received: by outflank-mailman (input) for mailman id 939957;
 Mon, 07 Apr 2025 12:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgp-0006Bg-OG
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:59 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4947446-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:54 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 2DE761380319;
 Mon,  7 Apr 2025 08:34:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 07 Apr 2025 08:34:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:51 -0400 (EDT)
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
X-Inumbo-ID: b4947446-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029293; x=1744115693; bh=va+AU7XSH2
	JkS6D22fCg+3+hIvHKU1o8Xr6qRtSJn7c=; b=R09hXLgAxPzDGlVzqYC/BPPTPv
	Wl4LfZ6146rX4XbczO1P7cKNJYbhOCCzGcGpUCu22SdxHHDoJyRz6VTLss8RjgDV
	uXFG2YSIQExJpkWbH/FDIRDrbXqGV6PON5xAaNFNSCv7/35fHrKysE5IZTrNkfmo
	7/mgK9AQxEVKJ9OMUe3EBcAEfnr3mjKBP84Bs7Mdb5Cw2THqBjyn02CSc48JAqYH
	imMz7z5fLODwI0Pi3SJFBUX35xYVnQZOIuR8RowM29CVXja5+HrSZJy//Kj3cTQi
	egS0oVRPiT2NYxQYb8eisjgPVzbhyFFAHF27e8fUzRg5u0iHuSB0fEYOAiKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029293; x=
	1744115693; bh=va+AU7XSH2JkS6D22fCg+3+hIvHKU1o8Xr6qRtSJn7c=; b=Z
	3z/i1anbVVS9SbprXuMHD4y/D5Y34SbaYFVB+YU9cHKy2wJohEEtRQ324UgZuJal
	lZP+lqG2AFVLpxyGfBkDcy8wbTV/IBNQJ9DPG6sKFwIiem/AzwMbv7zKZFefwZ5/
	a30JaPEGlS7n3OzKYkbPAh3hn0QKTEi7DzE0OK0K2xRffnHfIIq/2Go9ofj1xeqF
	uBovQoXplWubAPUFd7kKZ3x/xK0ownJ2912AuRxWujUqE1+nHbnCIl4cJEOJmmUn
	k+8kxE1P19Dg7prXEW6cDw6yKlJ9hYsScaTyr1GeAgiKbhKHX8/6kwdE0eO0ch46
	KYen0vbJ5k6x09kIfZ5Qg==
X-ME-Sender: <xms:bMbzZ0VEUMzATHViLa4crr8KdXVUHxqicCfACuChe52TWPucQc3-zw>
    <xme:bMbzZ4krFSlF6Z6ZX5BdVF9i6Y4D41RFceI2t2Vz4P3rBezoS1Uz-FlkcV7gbb9Ai
    fJoImXGX8uzVA>
X-ME-Received: <xmr:bMbzZ4b3zGpoKMmCstlEVPFZB-3r7VTDkdYId_U9bPC42GHMpQeTQ_xJc146OxdfB8Pywc4KxDprnWvjB-kiOwaZ8hoIT85rm1n5TELp5prUQE2aMoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitg
    hhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtth
    hopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:bMbzZzU0E0hMQupzEDl12pHusv8IPwLpaqzUQYnWgl5y3NYGBJQ86A>
    <xmx:bMbzZ-mcNERAc7ILsfFqjnmW0aiCs_edQtTLTSmrloz2fy_QpIMJAg>
    <xmx:bMbzZ4fBEoXaXCSKbvz8XFcP9Y1RY3ZdjNCrc185DATvNjXm9CBlWw>
    <xmx:bMbzZwFC7W9ef89Dp91pteb_YIwmt79933DuuEvI7AM9rhTV9J7XKw>
    <xmx:bcbzZyxUrVaIipPYeoByBX8ih31QgBLy6w180fBE99Y6yX_JcFWCsjTc>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
Date: Mon,  7 Apr 2025 14:31:14 +0200
Message-ID: <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build initrd format directly digestable by the kernel. Additionally,
include it itself inside as boot/initrd-domU file, for domU booting in
tests.
This should avoid the need to repack tar -> cpio as part of the test
job.

Keep generating initrd.tar.gz as that's still used by older branches.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/x86_64-rootfs-alpine.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
index b70b3a5..13e85fa 100755
--- a/scripts/x86_64-rootfs-alpine.sh
+++ b/scripts/x86_64-rootfs-alpine.sh
@@ -58,3 +58,8 @@ passwd -d "root" root
 cd /
 tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
     bin dev etc home init lib mnt opt root sbin usr var
+mkdir boot
+find bin dev etc home init lib mnt opt root sbin usr var |\
+    cpio -o -H newc | gzip > boot/initrd-domU
+find bin boot dev etc home init lib mnt opt root sbin usr var |\
+    cpio -o -H newc | gzip > "${WORKDIR}/binaries/initrd.cpio.gz" \
-- 
2.48.1


