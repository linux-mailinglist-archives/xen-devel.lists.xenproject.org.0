Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315FA5690B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 14:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905040.1312804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXrk-0000vo-5O; Fri, 07 Mar 2025 13:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905040.1312804; Fri, 07 Mar 2025 13:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXrk-0000ty-2v; Fri, 07 Mar 2025 13:35:52 +0000
Received: by outflank-mailman (input) for mailman id 905040;
 Fri, 07 Mar 2025 13:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqXri-0000ts-Lc
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 13:35:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1293743c-fb59-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 14:35:45 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso11437705e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 05:35:45 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb799fsm5326001f8f.2.2025.03.07.05.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:35:44 -0800 (PST)
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
X-Inumbo-ID: 1293743c-fb59-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741354544; x=1741959344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlC/Vx3UWbowuDDeWyGh/6v1Kg3wCL6sEzGQMuIV9bs=;
        b=D7Zgyn2v4xUTazTvf6godve4DNBDSX/a6wzedtzrC3TG/vkV95OuaIwMM1EaoZIH9Q
         C6cUBAhytia5v/g7ATxpJrneooPQ28+dJXqf1qXzhB4uGpN20E3GXPEN83haK5/V/UnQ
         Dm2vCnh4AkNV/DUyrLqiXBwe5yThgTBcZXXjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741354544; x=1741959344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlC/Vx3UWbowuDDeWyGh/6v1Kg3wCL6sEzGQMuIV9bs=;
        b=M7ymciHrQkfKYmVAksFuDd1aBG4zMXESc9gbGgkhVYt5A50ZuSYIjTJi8y31xPrKls
         KFJk4dAxd9ojOP3Wv35dIENWgYmQknN1oE3L8FFbaoffIO5m+UOS2gCdnCBKKbXCc/oi
         UyvnKzjithBx/doaqNIT9nb0osEUSwRGrExfPMZlyzJayxgOfrbqqb5En07p41WsnDKj
         G6AjL41+ssC0JyT16L4ULFKSc13upAqKH7HYZp+4q6TyBy4FRFBuoGUHjYcIZCF+hqor
         xXXOTWNV9LF3L1R4oWKKDwtU1yZDOgh0QfUxuMFK6tnQ+2maNLO8bN1uOQ70kMrBsUwX
         4FDA==
X-Gm-Message-State: AOJu0YypDd4MrK0bubMD/w3U2R6Czosfg4SPFVF6dCHC8sIAxYsTZjd5
	WjRKrpp2qnGW+U1MVdZLXvldidrSyo43fzhVM8wgTaf4z/SanwvrEdeXwtcG/aCX0nDAF6u2UYK
	I
X-Gm-Gg: ASbGncsyKlmPL+CKp+G3zwG1fqMXGdCTs6kmEwPiHOQAg4JDOMUpmc0zSPhZHuTfWpz
	5Gvip1ndDCLa4br6WxeastsNa2Mo4Zh6E+WcTPmhgengeYYgmjkLoDPYrUJV3eHjGJ1n6XFQzGj
	CniV8qasLZgHYaqwGNnrSpeK9qr4zw8pC629RXRQXcLm+JwEZJ29TzdqASf+rKUobmU5WjpkaSN
	4nGsQlwTcoMtE/0xA21w4jDBd3tonk5qFlV1BD043oc4g8ewygoDbIdbbwImifhz6otKd74tP8X
	pHs8ecfk3//zP+YC4xTIk0a6URY4RTq6jozEcsNWDVClYyeHzvpGGzhM9LSxZidW1Z/j30BXYXS
	uYN0FL/lSvl/sDKhRbyg/1Z9Z
X-Google-Smtp-Source: AGHT+IGdtKSi6I7lu3pag4C7tfcm3d6j4Q+3qjtyC+3mth+BdTLi8dogMAihYOXnfJPOru/r18zNiA==
X-Received: by 2002:a05:600c:1c2a:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43c5a5e9074mr29964915e9.5.1741354544611;
        Fri, 07 Mar 2025 05:35:44 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libs: Make uselibs.mk more legible
Date: Fri,  7 Mar 2025 13:33:42 +0000
Message-Id: <20250307133342.3057009-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few blank lines go a very long way.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/uselibs.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index c0a234cfec84..3c88e78c10cd 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -2,34 +2,49 @@
 
 LIBS_LIBS += toolcore
 USELIBS_toolcore :=
+
 LIBS_LIBS += toollog
 USELIBS_toollog :=
+
 LIBS_LIBS += evtchn
 USELIBS_evtchn := toollog toolcore
+
 LIBS_LIBS += gnttab
 USELIBS_gnttab := toollog toolcore
+
 LIBS_LIBS += call
 USELIBS_call := toollog toolcore
+
 LIBS_LIBS += foreignmemory
 USELIBS_foreignmemory := toollog toolcore
+
 LIBS_LIBS += devicemodel
 USELIBS_devicemodel := toollog toolcore call
+
 LIBS_LIBS += hypfs
 USELIBS_hypfs := toollog toolcore call
+
 LIBS_LIBS += manage
 USELIBS_manage := toollog toolcore call
+
 LIBS_LIBS += ctrl
 USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
+
 LIBS_LIBS += guest
 USELIBS_guest := evtchn ctrl
+
 LIBS_LIBS += store
 USELIBS_store := toolcore
+
 LIBS_LIBS += vchan
 USELIBS_vchan := toollog store gnttab evtchn
+
 LIBS_LIBS += stat
 USELIBS_stat := ctrl store
+
 LIBS_LIBS += light
 USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
+
 LIBS_LIBS += util
 USELIBS_util := light
 FILENAME_util := xlutil
-- 
2.39.5


