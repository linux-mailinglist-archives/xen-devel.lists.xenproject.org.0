Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1433C2603
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 16:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153702.283947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rYm-0001xP-2V; Fri, 09 Jul 2021 14:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153702.283947; Fri, 09 Jul 2021 14:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1rYl-0001uO-V6; Fri, 09 Jul 2021 14:32:55 +0000
Received: by outflank-mailman (input) for mailman id 153702;
 Fri, 09 Jul 2021 14:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1rYk-0001uH-P5
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 14:32:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8aad459d-e0c2-11eb-85f4-12813bfff9fa;
 Fri, 09 Jul 2021 14:32:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx69EWpf9D
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 16:32:51 +0200 (CEST)
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
X-Inumbo-ID: 8aad459d-e0c2-11eb-85f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625841171;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wJEuN7IcmG/orFXDSp2phKEUtyHRKhzgT7wACeQ3PXE=;
    b=Izj3QclkbYUiuesbLn9GaB0SYjXOB/3JIw5qx40LkBNKgnge8Zger7bNVMS7Snd+bO
    2wiDXJ3Twkbu2fDh5up3Zx7JiDAryQ5oXuLmj4b9w3faUjHcRaR5PLIkJMa9U+TVt//M
    oCE1QyVreoCpVg8+620am0C3/OSKDeEnNcEMRXomXUvzjzexf79Art2+pWdgwKewHgwd
    +OeUW6Wg0FNShAD0iXqeIW2ZdFzNI35IxiPLIie/RuC3Sp/kj3cHJ2/OdEWOsCXIb9G2
    3F9GBT4fzrJir67+RvZAQyS3dxnvb1QPQnt5QHzi5dV5WCWYzITpYDSgIFNDMC4as6li
    nIOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 1/2] automation: provide SDL and SDL2 in opensuse images
Date: Fri,  9 Jul 2021 16:32:47 +0200
Message-Id: <20210709143248.20310-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu-xen-traditional may make use of SDL, qemu-xen may make use of SDL2.
Use pkgconfig() as resolvable instead of a rpm name, the latter may change.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 3 ++-
 automation/build/suse/opensuse-tumbleweed.dockerfile | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 03f8a7acad..2f92392d76 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -31,7 +31,6 @@ RUN zypper install -y --no-recommends \
         glibc-devel-32bit \
         gzip \
         hostname \
-        libSDL2-devel \
         libaio-devel \
         libbz2-devel \
         libext2fs-devel \
@@ -56,6 +55,8 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
+        'pkgconfig(sdl)' \
+        'pkgconfig(sdl2)' \
         python \
         python-devel \
         python3-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index be5ddb0d98..ed10cd8a22 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -31,7 +31,6 @@ RUN zypper install -y --no-recommends \
         glibc-devel-32bit \
         gzip \
         hostname \
-        libSDL2-devel \
         libaio-devel \
         libbz2-devel \
         libext2fs-devel \
@@ -59,6 +58,8 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
+        'pkgconfig(sdl)' \
+        'pkgconfig(sdl2)' \
         python-devel \
         python3-devel \
         systemd-devel \

