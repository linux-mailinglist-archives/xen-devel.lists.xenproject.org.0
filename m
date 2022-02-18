Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B164B4BB9FF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275397.471244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL39W-0001jj-Hn; Fri, 18 Feb 2022 13:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275397.471244; Fri, 18 Feb 2022 13:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL39W-0001hq-Eh; Fri, 18 Feb 2022 13:18:26 +0000
Received: by outflank-mailman (input) for mailman id 275397;
 Fri, 18 Feb 2022 13:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL39U-0001Kc-Tn
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:18:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f039856-90bd-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:18:23 +0100 (CET)
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
X-Inumbo-ID: 3f039856-90bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645190303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cOUWI3z94656wRQdu1HK/Pu/la0FR5XncqommOnx4q4=;
  b=BIJxFo+z5fV0NbsBrWgwltda+kZkqgNWMs2Nb6MO9MJJihEefJ1vmOiw
   ZNudYD5V2vnmNDbb2+tXgwCgZwoDpzQgFooKWTO5evMzbB8VrXvONcuPt
   4DZ2/swxBIyPqaOz1Sk9ArW4+a5giLevwLIYfwceTnNHt8yDMoE1jarkX
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64920608
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hAdPgqJrSN3FHwFzFE+RzJUlxSXFcZb7ZxGr2PjKsXjdYENS12BUx
 2ZOXW+ObvaMMWvxKNl+PI7k/RwBuMDRy4diTVFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PRkiaXpVjolBJTvgcYaXhVROSdSF5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qPP
 ZJHMWoHgBLoPjsUJXUlCM4EmtyTi3LAegRxoVWFjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhaM77kCsQ/H2Vge0p3PCtRkZM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKqucXbAATj
 0C0k+nQJiVNt7CZQFib2p2t+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv3mr0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJc3c/MBuaL9UdF1M2xpjGGSN6bKIN8N8nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpP9/oUZhynPS+TI6NuhXogjxmO8kZmOivpnwGWKJt9zq1zBhEfV8XY
 v93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQj95UKaJmet7E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:Qo8hQqBH4OB/eublHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64920608"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: Clean up alpine containers
Date: Fri, 18 Feb 2022 13:18:11 +0000
Message-ID: <20220218131811.31133-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * `apk --no-cache` is the preferred way of setting up containers, and it does
   shrink the image by a few MB.
 * Neither container needs curl-dev.
 * Flex and bison are needed for Xen, so move to the Xen block.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

I've already rebuilt the containers and confirmed that the build is still fine.
---
 automation/build/alpine/3.12-arm64v8.dockerfile | 69 ++++++++++-------------
 automation/build/alpine/3.12.dockerfile         | 75 +++++++++++--------------
 2 files changed, 65 insertions(+), 79 deletions(-)

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index a1ac9605959e..006cdb3668b3 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -8,46 +8,39 @@ RUN mkdir /build
 WORKDIR /build
 
 # build depends
-RUN \
-  # apk
-  apk update && \
+RUN apk --no-cache add \
   \
   # xen build deps
-  apk add argp-standalone && \
-  apk add autoconf && \
-  apk add automake && \
-  apk add bash && \
-  apk add curl && \
-  apk add curl-dev && \
-  apk add dev86 && \
-  apk add dtc-dev && \
-  apk add gcc  && \
+  argp-standalone \
+  autoconf \
+  automake \
+  bash \
+  bison \
+  curl \
+  dev86 \
+  dtc-dev \
+  flex \
+  gcc \
   # gettext for Xen < 4.13
-  apk add gettext && \
-  apk add git && \
-  apk add iasl && \
-  apk add libaio-dev && \
-  apk add libfdt && \
-  apk add linux-headers && \
-  apk add make && \
-  apk add musl-dev  && \
-  apk add ncurses-dev && \
-  apk add patch  && \
-  apk add python3-dev && \
-  apk add texinfo && \
-  apk add util-linux-dev && \
-  apk add xz-dev && \
-  apk add yajl-dev && \
-  apk add zlib-dev && \
+  gettext \
+  git \
+  iasl \
+  libaio-dev \
+  libfdt \
+  linux-headers \
+  make \
+  musl-dev  \
+  ncurses-dev \
+  patch  \
+  python3-dev \
+  texinfo \
+  util-linux-dev \
+  xz-dev \
+  yajl-dev \
+  zlib-dev \
   \
   # qemu build deps
-  apk add bison && \
-  apk add flex && \
-  apk add glib-dev && \
-  apk add libattr && \
-  apk add libcap-ng-dev && \
-  apk add pixman-dev && \
-  \
-  # cleanup
-  rm -rf /tmp/* && \
-  rm -f /var/cache/apk/*
+  glib-dev \
+  libattr \
+  libcap-ng-dev \
+  pixman-dev \
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 4cce7ab926dc..22cad2524972 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -8,49 +8,42 @@ RUN mkdir /build
 WORKDIR /build
 
 # build depends
-RUN \
-  # apk
-  apk update && \
+RUN apk --no-cache add \
   \
   # xen build deps
-  apk add argp-standalone && \
-  apk add autoconf && \
-  apk add automake && \
-  apk add bash && \
-  apk add curl && \
-  apk add curl-dev && \
-  apk add dev86 && \
-  apk add gcc  && \
-  apk add g++ && \
-  apk add clang  && \
+  argp-standalone \
+  autoconf \
+  automake \
+  bash \
+  bison \
+  clang \
+  curl \
+  dev86 \
+  flex \
+  g++ \
+  gcc \
   # gettext for Xen < 4.13
-  apk add gettext && \
-  apk add git && \
-  apk add grep && \
-  apk add iasl && \
-  apk add libaio-dev && \
-  apk add linux-headers && \
-  apk add make && \
-  apk add musl-dev  && \
-  apk add libc6-compat && \
-  apk add ncurses-dev && \
-  apk add patch  && \
-  apk add python3-dev && \
-  apk add texinfo && \
-  apk add util-linux-dev && \
-  apk add xz-dev && \
-  apk add yajl-dev && \
-  apk add zlib-dev && \
+  gettext \
+  git \
+  grep \
+  iasl \
+  libaio-dev \
+  libc6-compat \
+  linux-headers \
+  make \
+  musl-dev  \
+  ncurses-dev \
+  patch  \
+  python3-dev \
+  texinfo \
+  util-linux-dev \
+  xz-dev \
+  yajl-dev \
+  zlib-dev \
   \
   # qemu build deps
-  apk add bison && \
-  apk add flex && \
-  apk add glib-dev && \
-  apk add libattr && \
-  apk add libcap-ng-dev && \
-  apk add ninja && \
-  apk add pixman-dev && \
-  \
-  # cleanup
-  rm -rf /tmp/* && \
-  rm -f /var/cache/apk/*
+  glib-dev \
+  libattr \
+  libcap-ng-dev \
+  ninja \
+  pixman-dev \
-- 
2.11.0


