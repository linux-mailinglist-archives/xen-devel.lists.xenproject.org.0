Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5730765674
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571159.894355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OO-00041K-Dg; Thu, 27 Jul 2023 14:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571159.894355; Thu, 27 Jul 2023 14:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OO-0003yV-9S; Thu, 27 Jul 2023 14:55:04 +0000
Received: by outflank-mailman (input) for mailman id 571159;
 Thu, 27 Jul 2023 14:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP2OM-0003ww-LK
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:55:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e600259-2c8d-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:55:00 +0200 (CEST)
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
X-Inumbo-ID: 8e600259-2c8d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690469700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u9VUyPNCX/m9UxlOUYomFLQl8PbYRLIgdSRaAegbCOg=;
  b=PeD/0QXGY+YPnkjbCckE1lw1hasHd65KcNu5uqQ0nTvgGbJhCSTNbAUu
   6SqtuTLhkwhf8O1mEnmiRX9DBIHBoVOJErat+7gLaI2M4MY20KF32wmYu
   6PPHLTWCgpY8WjFXeNGCFlypSwVkQb+L4wCKRfReIPKRCS5CU6xHHOGlq
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117536776
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FVLePqmvXHapho1kMBNQOvzo5gxFJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWDvSP/aDamKgLtAgad/j9k9SvJTdztRkSwNsrnhhFiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5gCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cAXET9RTxOCvrOdnq29RNZriOsCMca+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B+
 T+doTumXHn2MvSSxje9ymudqdaf3hP0ZLArU7mF8udD1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4EeQ85Buc16n87AOQB2xCRTlEAPQkvsIrQT0h1
 neSgsjkQzdotdW9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7sCIQ//zlpxad2Wvq/8WXCFdvvW07Q15J8CtFa7eqO62r6GGKxqhfKoimSVeun
 WULzp32AP81MX2dqMCcaLxTTenytq3VaGG0bU1HRMd4qWn0k5K3VcUJuWwleh80WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2NTRTKt4wVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2CHcuqkU74gOHGOxZ5rIvp1nPUMIjVC4vd/m3oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUpfsLUcaU9U9xcx9z76Yl
 kxRr2cEkDITc1Wbc1TVAp2iAZuzNatCQYUTZnZxZw3xgid/PO5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:fGyJeKxDgL12nwB+qwj6KrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-Talos-CUID: 9a23:YQulCGGUfY41HZugqmJb+3cbRuEmc0SM5ynPJUGHDmhGaaCaHAo=
X-Talos-MUID: 9a23:ckGnNwqx0NXaDvIFtdoezzxtOf9Q+pWBMRBOoZo6ifDDMRF0Ih7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="117536776"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v3 2/2] Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS immediately
Date: Thu, 27 Jul 2023 15:54:47 +0100
Message-ID: <20230727145447.2701-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727145447.2701-1-anthony.perard@citrix.com>
References: <20230727145447.2701-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

So to avoid having these command been run more than necessary, we
will replace ?= by an equivalent but with immediate expansion.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v3:
    - replace evaluation on first use construct by immediate expansion which
      isn't likely to break and is clearer.

 Config.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index c529b1ba19..dc3afaa47e 100644
--- a/Config.mk
+++ b/Config.mk
@@ -19,13 +19,17 @@ or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(
 
 -include $(XEN_ROOT)/.config
 
-XEN_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
+ifeq ($(origin XEN_COMPILE_ARCH), undefined)
+XEN_COMPILE_ARCH    := $(shell uname -m | sed -e s/i.86/x86_32/ \
                          -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
                          -e s/armv7.*/arm32/ -e s/armv8.*/arm64/ \
                          -e s/aarch64/arm64/)
+endif
 
 XEN_TARGET_ARCH     ?= $(XEN_COMPILE_ARCH)
-XEN_OS              ?= $(shell uname -s)
+ifeq ($(origin XEN_OS), undefined)
+XEN_OS              := $(shell uname -s)
+endif
 
 CONFIG_$(XEN_OS) := y
 
-- 
Anthony PERARD


