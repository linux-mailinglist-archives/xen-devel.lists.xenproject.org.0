Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233453C2604
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 16:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153703.283957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rYn-0002DA-A9; Fri, 09 Jul 2021 14:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153703.283957; Fri, 09 Jul 2021 14:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rYn-0002Aa-79; Fri, 09 Jul 2021 14:32:57 +0000
Received: by outflank-mailman (input) for mailman id 153703;
 Fri, 09 Jul 2021 14:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1rYm-0001uz-1a
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 14:32:56 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 907767b0-a386-473a-a826-5750a5ccd9c9;
 Fri, 09 Jul 2021 14:32:54 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx69EWrf9E
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 16:32:53 +0200 (CEST)
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
X-Inumbo-ID: 907767b0-a386-473a-a826-5750a5ccd9c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625841173;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZvpxNsh5S6aCi3dz5XgIxfqvAswKpjs7QNEeoF8oZA0=;
    b=T467g7uSGO+0+5e5Hl/Snsp1hO6sxoXMKAZtwD/OHAs9i8hg2SXfprViFby9uTESAv
    xuicOzzhebJGQDrULCOj0Opv+mB8ibftLAQM9TS/MyWVK/L75+sqcfXgwzpFgSrtmYLN
    i4ibqd64sO+TGnpFjyJpIPSFXGWdmBffR6C96paX8rFw6PQHSbTqTZzAfB63HHHJ5R3J
    /4EbM0livY+GFOeYz7VuKHPyxHhXxFLVg14AvYejy7x/0pq7HnG5FkfDH3Y1sCd4fqye
    x1wm5DtY4CcBrgs4qvfAlKXYTZfNic707zDKFnU4aLnBix9kqRjJFo8Kcb3gd42/KJVc
    ckHw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 2/2] automation: provide pciutils in opensuse packages
Date: Fri,  9 Jul 2021 16:32:48 +0200
Message-Id: <20210709143248.20310-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210709143248.20310-1-olaf@aepfle.de>
References: <20210709143248.20310-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu-xen-traditional may make use of pciutils-devel, for PCI passthrough.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 2f92392d76..5e8111f40b 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -55,6 +55,7 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
+        'pkgconfig(libpci)' \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index ed10cd8a22..b165c48245 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -58,6 +58,7 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
+        'pkgconfig(libpci)' \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python-devel \

