Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4D2AABB2
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 16:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21697.48041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbmAi-0004yf-9j; Sun, 08 Nov 2020 15:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21697.48041; Sun, 08 Nov 2020 15:00:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbmAi-0004yG-6C; Sun, 08 Nov 2020 15:00:00 +0000
Received: by outflank-mailman (input) for mailman id 21697;
 Sun, 08 Nov 2020 14:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4CZ=EO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kbmAg-0004yB-Q6
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 14:59:59 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81181a72-5ac7-4ec6-831a-ea95dcef0c5f;
 Sun, 08 Nov 2020 14:59:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AB6F454C;
 Sun,  8 Nov 2020 09:59:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 08 Nov 2020 09:59:57 -0500
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB4F4328005E;
 Sun,  8 Nov 2020 09:59:54 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c4CZ=EO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kbmAg-0004yB-Q6
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 14:59:59 +0000
X-Inumbo-ID: 81181a72-5ac7-4ec6-831a-ea95dcef0c5f
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 81181a72-5ac7-4ec6-831a-ea95dcef0c5f;
	Sun, 08 Nov 2020 14:59:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AB6F454C;
	Sun,  8 Nov 2020 09:59:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 08 Nov 2020 09:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Dr/Os4
	7m39uIrlvoJNAUFN0AyThOrdYx72S+jUYJCb8=; b=B0jkmDcLb5IQ2Yv6JtJ1cQ
	VcX2jJZnjA9aeylCKlJeypV36DsIo74oqarEl/GJ5Gadf+BkdcQFhmN6WlT5LRIE
	W+xa3J2esBghgvRsFW/Jg5KjTCiWPcXcuerYhzZIdlx0yh1MU5AVv9OoxcxfpVLX
	6OBkLjE2tbO/sCWID5IpLPvHQwWggbChFZIau2P0SvPWs/cN8aBuHa5PDbZi/L4y
	9R/18YeGqSviaTNCCsBIdeQSfCVnI5zJamTZVsvdvB+V+RQa6anlQNVf571Gtg9W
	93yT8p6nXbwCORjyy5Qt4nz41ERylnzVGkKTJPKU5+qbJQL9yx0JVbcptnfLiLhg
	==
X-ME-Sender: <xms:6weoX8piYKOPBgl3iCTalOdJfyhlSWRWQM7mx9SPIKbhLND_nH6mZw>
    <xme:6weoXyqo-a4q8RnYujbwiVPKL6s0d8kbsiXFRUnGyj5s_qGS7kdgbnU2teh6xuGYx
    LInLu3YnTtLCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddufedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:6weoXxOuejcEnNQXn9aratvMoQPlKtzDgV6u78ZV0O1siIKHcaoGsQ>
    <xmx:6weoXz6cCBBPXNpYzZhFL_ba8WLhhXUi5gYjLQ9qRyzLAYDNqHFU6A>
    <xmx:6weoX77-dZlZMRTpDpg8g36X-jfuCYtKyWjoANWWSiZZs3TLCMfMkA>
    <xmx:7AeoX1Sxc5xbKd_AVs0lJw2e-mszuLe7I0QP32GsmzRpCoG9mKID1Q>
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id EB4F4328005E;
	Sun,  8 Nov 2020 09:59:54 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libxl: cleanup remaining backend xs dirs after driver domain
Date: Sun,  8 Nov 2020 15:59:42 +0100
Message-Id: <20201108145942.3089012-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

When device is removed, backend domain (which may be a driver domain) is
responsible for removing backend entries from xenstore. But in case of
driver domain, it has no access to remove all of them - specifically the
directory named after frontend-id remains. This may accumulate enough to
exceed xenstore quote of the driver domain, breaking further devices.

Fix this by calling libxl__xs_path_cleanup() on the backend path from
libxl__device_destroy() in the toolstack domain too. Note
libxl__device_destroy() is called when the driver domain already removed
what it can (see device_destroy_be_watch_cb()->device_hotplug_done()).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index e081faf9a94e..f131a6c822c6 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -763,6 +763,12 @@ int libxl__device_destroy(libxl__gc *gc, libxl__device *dev)
              * from the backend path.
              */
             libxl__xs_path_cleanup(gc, t, be_path);
+        } else if (domid == LIBXL_TOOLSTACK_DOMID && !libxl_only) {
+            /*
+             * Then, toolstack domain is in charge of removing the parent
+             * directory if empty already.
+             */
+            libxl__xs_path_cleanup(gc, t, be_path);
         }
 
         rc = libxl__xs_transaction_commit(gc, &t);
-- 
2.25.4


