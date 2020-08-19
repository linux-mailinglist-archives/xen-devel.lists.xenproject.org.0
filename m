Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7802492A9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 04:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8DPL-0005MO-21; Wed, 19 Aug 2020 02:00:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tsRI=B5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k8DPK-0005MJ-Bo
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 02:00:54 +0000
X-Inumbo-ID: 2921ab28-113f-4bbc-ae75-9fa55b0cdf7f
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2921ab28-113f-4bbc-ae75-9fa55b0cdf7f;
 Wed, 19 Aug 2020 02:00:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 16B9110BE;
 Tue, 18 Aug 2020 22:00:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 Aug 2020 22:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Q+psKKjtAH7R+iHIoeeTOiTdy9iWAsXDZugd5Q/h6
 fc=; b=U61ulBVA9wSVVplQXJCe+xvulmHPBbyRpTfQsD/JGX58iiIyost4x+0d4
 MeMywC9oLijG6Vnhw2uM0FlY4hFxaoNzYmnCr3nypKN/aKNNqvk/iG12zh76Ap2X
 oyjUspo1u9ny5NbcupQ6cs5E6M5oijO44b8M00EJ2Wr7rxVdeAEYcxgAWhEviKsM
 7fgCm/iaPnQIaf9pTuwrLCHpbLKf4bAW7bqPD8aBqThEsswPe+uNDNYXaTFhMX6C
 Mi4XgAzVhlJeAT+JSa4/gcMiepgYXHrz/EpBi4dP6Shwe4pqb8mMbtkdKeoQPRqR
 rL5c2soZWY4jPpk4j5Jgzj+2TEwDQ==
X-ME-Sender: <xms:0oc8X6_pUQXsm0ygSH5tXESJykmqX7S_l1Dphv59IeIwc3eO0_958A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtjedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtohfgsehtkeertdertdejnecuhfhrohhmpeforghr
 vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
 jefhkeffkeekkeffiefhhffhledtgfejleeikeevffegfeelueehueeuleeljeenucfkph
 epledurdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:0oc8X6vVHVOFzZBdA8EqymVmX40TNS8jBshi6YhQoVqKqhtqWacXSg>
 <xmx:0oc8XwD0r2wCLnZjzdGsSRJcoQJmOXy3hIiFg5VlmAXaQt_bcLfnoQ>
 <xmx:0oc8XydQBpEYWXsskw11D7MqV602WxmzZlFctY8ZMK_BFuR92QLcZw>
 <xmx:0oc8XxWRh7eGUI4GU5cLtcW-XNBq29BMYKHON32pxJl56-tH6P_PVQ>
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA891328005E;
 Tue, 18 Aug 2020 22:00:49 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
Date: Wed, 19 Aug 2020 04:00:36 +0200
Message-Id: <20200819020036.599065-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In file included from /usr/include/string.h:495,
                 from libxl_internal.h:38,
                 from libxl_utils.c:20:
In function 'strncpy',
    inlined from 'libxl__prepare_sockaddr_un' at libxl_utils.c:1262:5:
/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libxl/libxl_utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
index f360f5e228..b039143b8a 100644
--- a/tools/libxl/libxl_utils.c
+++ b/tools/libxl/libxl_utils.c
@@ -1252,14 +1252,14 @@ int libxl__prepare_sockaddr_un(libxl__gc *gc,
                                struct sockaddr_un *un, const char *path,
                                const char *what)
 {
-    if (sizeof(un->sun_path) <= strlen(path)) {
+    if (sizeof(un->sun_path) - 1 <= strlen(path)) {
         LOG(ERROR, "UNIX socket path '%s' is too long for %s", path, what);
-        LOG(DEBUG, "Path must be less than %zu bytes", sizeof(un->sun_path));
+        LOG(DEBUG, "Path must be less than %zu bytes", sizeof(un->sun_path) - 1);
         return ERROR_INVAL;
     }
     memset(un, 0, sizeof(struct sockaddr_un));
     un->sun_family = AF_UNIX;
-    strncpy(un->sun_path, path, sizeof(un->sun_path));
+    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
     return 0;
 }
 
-- 
2.25.4


