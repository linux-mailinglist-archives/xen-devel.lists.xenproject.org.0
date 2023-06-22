Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D422B73A51A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553698.864423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJg-0003hq-NU; Thu, 22 Jun 2023 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553698.864423; Thu, 22 Jun 2023 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJg-0003fy-KC; Thu, 22 Jun 2023 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 553698;
 Thu, 22 Jun 2023 15:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMJf-0002MD-0C
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:33:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c6b3dfd-1112-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:33:46 +0200 (CEST)
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
X-Inumbo-ID: 2c6b3dfd-1112-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687448026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4QtfO0K4kclGq2hMs7w55dwQYz0mk//LeZXUiJOoCww=;
  b=dGQhHX9ZspFzJa/W4yB+vFEPN8d4MTo0uW0ciTQK5QyOBgGnhJkKjQeP
   6TBvQCi0ZJGFj92sf4NNSvIGTflHjXCTOaVcz+q9/cCjaXJE9jH5EsobK
   YSP81kIRWzwrIFh2UaWeoQdI+O20Zv0T+QIymC+Pjvc0jis4H3l8xIOzU
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113083464
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MN7BBq5jCNLHVixuuC9hWgxRtP/HchMFZxGqfqrLsTDasY5as4F+v
 mIdWmnVPPzYNzT8Ko0naYnno0oE6J+Gm9cyGQFoqSFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa4R5geC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 sEzNBsiVE24vN2L/qK7R/N1vNo6I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/D/
 jKdozqlav0cHPaj9iKG61m+v/PGuj76W6A9RZeVr/E/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGus28hCQyYLb5g+YAi4PSTspQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUjjvvhuwqd2nT1+8aPF1RujunKYo67xghET5KOSLb10mPk0MhQLIuDV2Ofp
 XdRzqBy89sy4YGxeD2lGbtdQ+r3t6jZYFUwknY0QcB/qm3FF2qLONkJvWogfBoB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMJGPxT4M5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzOMHs+hlUT/jOHPDJJwdVvjGAHVBgzexPneyDg5D
 v4Fb5fao/mheLOWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l4Y8I9NYgJItQ/94wMz7egw
 51IchMAoLYJrSGdeFrih7EKQO+HYKuTWlpiZnJwZgj3iyR6CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIpjo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:LgYJFaBkd+5MfAvlHemB55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8sjzuSWE6gr5JktQ4+xoSZPgfZq0z/ccjbX5W43SJDUOl1HGEGgI1/qA/9SPIVyaygYUvZ
 0LT0A1YOecMbA15vyKhHjeLz6gq+P3iZxB7I3lvhFQpeEDUdAa0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AKmp+oGqzKs5lpgC4AIj67d3mUcsYWWH2402NGHS?=
 =?us-ascii?q?HNFh5SLCPUGWO4awxxg=3D=3D?=
X-Talos-MUID: 9a23:fL08dwbUr58CBuBTnQPTnDJ7H9VR/62JFUEOs7pXkeTdOnkl
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="113083464"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 5/5] Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS on first use
Date: Thu, 22 Jun 2023 16:30:05 +0100
Message-ID: <20230622153005.31604-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

So, to avoid having these command been run more than necessery, we
will use a construct to evaluate on first use.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
---
 Config.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.mk b/Config.mk
index c529b1ba19..5fbdbc4500 100644
--- a/Config.mk
+++ b/Config.mk
@@ -19,13 +19,13 @@ or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(
 
 -include $(XEN_ROOT)/.config
 
-XEN_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
+XEN_COMPILE_ARCH    ?= $(eval XEN_COMPILE_ARCH := $(shell uname -m | sed -e s/i.86/x86_32/ \
                          -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
                          -e s/armv7.*/arm32/ -e s/armv8.*/arm64/ \
-                         -e s/aarch64/arm64/)
+                         -e s/aarch64/arm64/))$(XEN_COMPILE_ARCH)
 
 XEN_TARGET_ARCH     ?= $(XEN_COMPILE_ARCH)
-XEN_OS              ?= $(shell uname -s)
+XEN_OS              ?= $(eval XEN_OS := $(shell uname -s))$(XEN_OS)
 
 CONFIG_$(XEN_OS) := y
 
-- 
Anthony PERARD


