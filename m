Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C907A7DDE7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939988.1339929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ln2-0006WC-Ge; Mon, 07 Apr 2025 12:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939988.1339929; Mon, 07 Apr 2025 12:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ln2-0006U0-Ca; Mon, 07 Apr 2025 12:41:24 +0000
Received: by outflank-mailman (input) for mailman id 939988;
 Mon, 07 Apr 2025 12:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgk-0006Bg-Mt
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:54 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b34af22e-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:51 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 068031380191;
 Mon,  7 Apr 2025 08:34:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 07 Apr 2025 08:34:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:48 -0400 (EDT)
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
X-Inumbo-ID: b34af22e-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029291; x=1744115691; bh=jMZW7cjlhb
	wKeY8FRDYgXIB8LyVP8OV7s9HHJqBF9Wg=; b=dL6SG/2YcZgs20yDd3hxbLWgQE
	Y4aXUSJi81P6jTXRint3WorBkzfT4p+D8sVz82EHnt+ueFGoHVj7tKFJGZWQSn84
	76K/Udk9yEgsDpIrOecxWk5EzlwnbSzf3M0HaH1TcYkcpjwWqTScjMl7si71Ofy6
	Pd45IwFfEYZKTTmw98ruUD3SeM7cFkqBxHzXyztD88h9zyLNNzHEzxqNxHQS3rYV
	iydriVIJ5yUzV9gJwqnDKrdvE/uJs+oY7dLu4pgNe4d45b7hml5pnoRXr0b9ZhDE
	krxuc23rgTlzhfhH1lWnp2CJRIfWteKJ478/36by7eQ/DP2GAfyLJltRTgKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029291; x=
	1744115691; bh=jMZW7cjlhbwKeY8FRDYgXIB8LyVP8OV7s9HHJqBF9Wg=; b=E
	+tLdzZY9IyC8LYABSwPwc1XCsHNVi/Jn4ASt0wR5miNyC3PyXPL1ijnXfLhVQMTi
	sz2yDDZGyGEkhcpTvE9UWTiXTBMHmgwkmQVhDGzvr+PNPcz8hSDwO19zhNNWlKKl
	wwlovYkpN9OwbrgkuRE8LAreeliB03p0HoJ0r0gdz6JD79x4QE4QhBTrnlw+wdVs
	mLUMPwc6eOjVh+7hEPLCeHojMOsfONRdW7oC2YWS6I2Pbuy0ZTt5ptnuVRmiQe2l
	xboRJdbMKOegqG7891ke+et+ZgPi9UjgB4XavjdE9q7NrnIRmXq6hgMnboRzQsrw
	9O+WcLKV4Ourz8DFrWekw==
X-ME-Sender: <xms:asbzZ3Gr5z87wFwRaq_GsiD6rIg7geBVIH4FOQQG6scozGo3a46Y0Q>
    <xme:asbzZ0WhzavLKanw_Y4ZxWZWnQfmLAkCo2t5tIu7q0CB1d5tK7PDunxpEIYqso5fJ
    uF147Tv5lOeIQ>
X-ME-Received: <xmr:asbzZ5IAbl5pJwFTXOnOEkeUtoQJjji5JkD7_X1RnVPwZ94mFd21WFNuxPOSy0K6q7uNi5NZqDJF-2RxCABCWIZoS5ruCEf6M4Qe-N8sL91R28RAcoM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:asbzZ1HW1HCQLF_99ChT3tVQryx-tegyvgePHuR2tNxGKf_dUEevuw>
    <xmx:asbzZ9XKG1AJdT8sOyM7MKky-jpUy6gm9eV_BAXd0Vmz9y_n1G3TCA>
    <xmx:asbzZwNXU0fV4Z5YEj76Kc9LNjf6V94H71obs3ZgrexnFgD2lC9gRA>
    <xmx:asbzZ81PCoLXm2D5WNaFf7u7Hd5ABcnBuxxF9Gwr8bWSwRPspHjWRg>
    <xmx:a8bzZ-iPe607niAeds0FbxlCYb6FXafHgD-HAreAexpLthFAYeH7ylCb>
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
Subject: [PATCH test-artifacts v2 13/12] scripts: add rc_verbose=yes to /etc/rc.conf
Date: Mon,  7 Apr 2025 14:31:13 +0200
Message-ID: <20250407123448.1520451-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is done in every single test job, so do it at the initrd build
time.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/x86_64-rootfs-alpine.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
index f8b04c5..b70b3a5 100755
--- a/scripts/x86_64-rootfs-alpine.sh
+++ b/scripts/x86_64-rootfs-alpine.sh
@@ -50,6 +50,7 @@ echo "ttyS0" >> /etc/securetty
 echo "hvc0" >> /etc/securetty
 echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
 echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo "rc_verbose=yes" >> /etc/rc.conf
 echo > /etc/modules
 passwd -d "root" root
 
-- 
2.48.1


