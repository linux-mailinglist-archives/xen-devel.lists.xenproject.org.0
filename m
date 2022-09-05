Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B205AD444
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 15:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398878.639864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCV2-0004K7-VO; Mon, 05 Sep 2022 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398878.639864; Mon, 05 Sep 2022 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVCV2-0004GR-Q7; Mon, 05 Sep 2022 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 398878;
 Mon, 05 Sep 2022 13:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inei=ZI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVCV0-0004D3-63
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 13:50:50 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be184c92-2d21-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 15:50:47 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FB025C0124;
 Mon,  5 Sep 2022 09:50:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Sep 2022 09:50:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 09:50:44 -0400 (EDT)
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
X-Inumbo-ID: be184c92-2d21-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662385846; x=1662472246; bh=D1HUAi8Rml
	jpADjhvAS8+P6wQ88QJtRK17ws45qCrsA=; b=YDDMe5LhiZI/ojtjb/Xqcy6/0Y
	JVkZA97sgNsU4b7ye3aIGHJDaEKM+NsWhDWJrlxMo5/eCOdStv3nEqOSi2acazj1
	gOXyiETySfAaMNkUt1S0V5tQNI+2FIJKl5oeItR5AL37KXE8vCJRPCKIrHJualkX
	mwp/lThcxnVT06luvYkRarJONCyWxglLzMk7t7QU+TvTLQ0oIfsRr00HI/BZeqpd
	QeWNIOZmEQ2PgPD9oLaEGMRQJS2DgUafp/7TTvwRVxuz9LFdSuOMAYMbe0yiCchm
	IZ6ncbTtNBCW1QE/ZCzrY4FEJyirX7nhnWBoh8jWkIXx20D2790yK1e+hZpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662385846; x=
	1662472246; bh=D1HUAi8RmljpADjhvAS8+P6wQ88QJtRK17ws45qCrsA=; b=Y
	TJvtB0UTdCrRm+X+4EdufBqOxvJNy6Iz9B9E+1TA2J8WjFzH6djcJhHBhx81Y5nH
	OqWBxRvH+pZ59zICA+6vj341jTPSaHc33izBlHo0rq6sMF+eDSmhef3dk7bBIFW0
	v/IFua9h0oKn/orxur+eRKE28Fmg6doi4GiVorhibL7TefiPcBmofCWlMHftrUec
	DQk/VYSi7opEa66b6F1wZ2PIsBVV31sPyMdyA21hj/B5bO491sGVw31MJ0jzxShu
	vM7IuMO4XYR0lSfLJXvktj6WFnwuXOxlyq2HFqRbADUTm2Wx9LOZmldwGW4G+xmR
	8hQFzmHDE7kV0cv7Q0C2w==
X-ME-Sender: <xms:tf4VYyCgfbOw4G-1vyyrYddVvgqg5aJd0FqmZ8Z2takp0s2ubQvPWg>
    <xme:tf4VY8gJ0O8_GjwzbDIEC09OVKW77JSRap6TBUVWpBFmnfB1_yzBBkgAqASmiIqCC
    rOZt2IFHDBeJw>
X-ME-Received: <xmr:tf4VY1kyHnA0T_JvPq2wI_D7SCDFkg5ZIE9h1WaLVquhwoiXUfxGVDs9a2UWQ_WimBpqkvtg1WBaMgjLK1wgHDnprfXhWEPltcLXwuTo456PYCnvPvciZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tv4VYwzSBrunceUsApcs0Vf31l_J5Ck_Kq4j4m306Ud_IuXl5FldhA>
    <xmx:tv4VY3T78Qm_pO1BTyQcHLfvSDfy68sWlu-TWHZl6oial_WXYJfocA>
    <xmx:tv4VY7bkyItgp7TFu1rYmMNDDgxLujg55UeBpZ6JM-ObZ3M2XZwRmg>
    <xmx:tv4VYxfr6Mhm85IUEd1_w-KAFqiwCaRAVv4YHoMmjuZpF_NO8ZCe3g>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] tools/libxl: enable in-band reconnect marker for stubdom QMP proxy
Date: Mon,  5 Sep 2022 15:50:19 +0200
Message-Id: <20220905135019.3749982-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This enables stubdom reliably detect when it needs to reconnect QMP
socket. It is critical, as otherwise QEMU will not send its handshake,
and so libxl will timeout while waiting on one. When it happens during
domain startup, it can result in error like this:

libxl: libxl_pci.c:1772:device_pci_add_done: Domain 3:libxl__device_pci_add failed for PCI device 0:0:14.0 (rc -9)
libxl: libxl_create.c:1904:domcreate_attach_devices: Domain 3:unable to add pci devices

See vchan-socket-proxy commit message for details about this reconnect
corner case.

Stubdomain side needs to use --reconnect-marker=1 option too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13a6..cc9c5bea1e7f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2625,10 +2625,11 @@ static void spawn_qmp_proxy(libxl__egc *egc,
     sdss->qmp_proxy_spawn.failure_cb = qmp_proxy_startup_failed;
     sdss->qmp_proxy_spawn.detached_cb = qmp_proxy_detached;
 
-    const int arraysize = 6;
+    const int arraysize = 7;
     GCNEW_ARRAY(args, arraysize);
     args[nr++] = STUBDOM_QMP_PROXY_PATH;
     args[nr++] = GCSPRINTF("--state-path=%s", sdss->qmp_proxy_spawn.xspath);
+    args[nr++] = "--reconnect-marker=1";
     args[nr++] = GCSPRINTF("%u", dm_domid);
     args[nr++] = GCSPRINTF("%s/device-model/%u/qmp-vchan", dom_path, guest_domid);
     args[nr++] = (char*)libxl__qemu_qmp_path(gc, guest_domid);
-- 
2.35.3


