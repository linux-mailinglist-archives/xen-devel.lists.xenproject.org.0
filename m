Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290543C258D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 16:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153696.283937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1r9g-00074J-VR; Fri, 09 Jul 2021 14:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153696.283937; Fri, 09 Jul 2021 14:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1r9g-00070q-RZ; Fri, 09 Jul 2021 14:07:00 +0000
Received: by outflank-mailman (input) for mailman id 153696;
 Fri, 09 Jul 2021 14:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1r9e-00070i-KN
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 14:06:58 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fa7647f-a8b2-4c40-897d-7f9966856e85;
 Fri, 09 Jul 2021 14:06:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx69E6tf3k
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 16:06:55 +0200 (CEST)
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
X-Inumbo-ID: 8fa7647f-a8b2-4c40-897d-7f9966856e85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625839615;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=urRQ9cDz0GYm7h6Wbhvh0nAibRF5M2Xlo4EVIkBq0KU=;
    b=R4ogQxmTR2nUjZxQ9wQuCDlgazxrCxS7dcJPJs6tPdnxgv+l56UnDpdaZqtOJ4u+bT
    Zoba3QYdaKlmJqULiXKqjhJrer3m+n0PCabzU0ImcGQcklmfaKLU11OyKvEJIHMUh+HY
    MfNV6JdeZQDct7BQ3qSn5+oE5d6uxD499CldE40aX0uSEUfaw+gaD6eIuDfztMFUbd2U
    N8ih2y9jw1IuSxcl4AbCOLQwI224n1VcSJef9EWrBCpVOASLDaTyE31I2MorFXs2sRfa
    1G0nHAYBuU561aM44ULvgASTXR41vKi1pSBglyh9mZ/z7Obkmklw/IilPNSe5te9d/G/
    +mwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: add meson and ninja to tumbleweed container
Date: Fri,  9 Jul 2021 16:06:53 +0200
Message-Id: <20210709140653.14220-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu uses meson as for configuration, and requires ninja for building.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-tumbleweed.dockerfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 3965e7f9cd..be5ddb0d98 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -48,8 +48,10 @@ RUN zypper install -y --no-recommends \
         libzstd-devel \
         lzo-devel \
         make \
+        meson \
         nasm \
         ncurses-devel \
+        ninja \
         ocaml \
         ocaml-findlib-devel \
         ocaml-ocamlbuild \

