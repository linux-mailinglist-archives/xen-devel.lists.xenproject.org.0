Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9D590545
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384908.620492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX9-00079j-4f; Thu, 11 Aug 2022 16:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384908.620492; Thu, 11 Aug 2022 16:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX8-00074P-Mj; Thu, 11 Aug 2022 16:59:46 +0000
Received: by outflank-mailman (input) for mailman id 384908;
 Thu, 11 Aug 2022 16:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNA-0003Aq-JA
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eee6a8d-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:27 +0200 (CEST)
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
X-Inumbo-ID: 8eee6a8d-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IYKuPYRjZ6pvXVQdnWBlSSCMGmweNvIFFiS+JhxCSBY=;
  b=YP9nzi4lncPf28Qmtkw/6vdTGP1apUtKhhLHJ1yGKGR+xO/EJdDxX9cB
   bgtJ/sY8nu4reKiarjMoVRc9N50Jg8zYfi++rrF/pvfuvllBnobUFQ94m
   SYDnj+WCbYXngn81s7PvO9jLVZFlQfD+LYmZksBR52xANQWbSWby2J59F
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77898051
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A+y7RlaM1YfKrNxLvrXNrnJZn9oimJRAgMRhcQ?=
 =?us-ascii?q?xGJyBt+GUZOw4laZrtjiq2i3aJmyGb9mmIBeKSSRr53aQm6gXAjCuHlasX+9?=
 =?us-ascii?q?5QHLC0YumKzbe0XjW3twuEXz1JRUf8BtCM7bJ8mgR2FR/vv/j1PJnkIdwUDM?=
 =?us-ascii?q?A15FlVxhm+g3eQV6f2UeZZ5LJGwsp5ifkrjn1gPlhF7vW5yEW4eLeEqvXAXV?=
 =?us-ascii?q?o/BIvZgFei4+eLqAsjioD2WaKfh/Pv4N+gnpFoR2q5z8BdREzFfQ1FHsdT1m?=
 =?us-ascii?q?w0aW/e2HSTeNU27twua3Pbh/ux4pnYCkePlZpqUJNDZH65g0giiiRHQVWa/X?=
 =?us-ascii?q?FIlLRnA6k1s0dnji49pQ8Z/fm1cENPEDSk72hwYifP/wSHFrvvgMH0/Bo+oe?=
 =?us-ascii?q?GPjTMRuB0qUBcrN8Mq6PPcZT4QAVbuI3TDzd4ksGhYsP3pL6JiXENF+g3agN?=
 =?us-ascii?q?XsV4hMNeYVPRIfaNBTj2vZiE4980PS37alh39Xykct0dk+K23kAwtROZJgT/?=
 =?us-ascii?q?pTcECBM2OL/abDWtYpsAz+J1HDcY7GoMZJT32GJG7HM+unWfay6tQSq1UdnO?=
 =?us-ascii?q?8R0FhhKicbCK0sMm4LP7GNrDW7kUtNOap7uev71qkYTK80ggu+qX/7QbP+dU?=
 =?us-ascii?q?G2+QQ+XybxT3Jur7CSaRxClAtkJ7QigUWI75t2C94YbiMN3ZS+MYIv8+nj9u?=
 =?us-ascii?q?BPbs4wOKswJHGezM1ksIywaNbIt7hodgCyA5J/l8q9y99gCNYgfAw2UNZRf1?=
 =?us-ascii?q?51zb4yxc3vQ/F+62Z0thHzYpYRiB0A76m6P4JWVZjqHv8/hPP+Nn8jbcogE7?=
 =?us-ascii?q?o2ylyyj3j4MdWq/COxGn7P6oREr4IQqbOdOgDRz+idmBRVIrBcrEzgNhJaV8?=
 =?us-ascii?q?DhF785c3JaWcSv6RfJnjzHJ3LeImuDq1bFLgD4KpVSYr3s3GzPxCotZV7Weo?=
 =?us-ascii?q?kUJzQvZooxjME5+0L7xDr9PniZG6ouOaomYn1WOCTVbx6z5AgasrwEAdB+Ki?=
 =?us-ascii?q?sUHm0BwE5c9TfYVzLKagRv6EOFs92NKEyZpIIxna6uH6DQn6WxQXl8OHufiQ?=
 =?us-ascii?q?ZXREUX8slIl2tMuLeInGxtXbWOSwQo4P2kO9zRZuTUvCKGMDLGz+EZcOLuEB?=
 =?us-ascii?q?eb4SrFvZhoR8LKmSZXzagjbxw2qXq+TJtnWwntzfJk7geX7LrQ1b+EolnC5L?=
 =?us-ascii?q?3itLttkKCgGZuLERzaxVuTkKeOPdHHEkKcZYn6421rXcYyFQBtkPP4FRIsDO?=
 =?us-ascii?q?tkr3ab5dUFN5oruLhsyVRJtWS90pLHIlxUksaJ4Kjo42fAX467WWi9qG2Bdt?=
 =?us-ascii?q?HzMQcsMLa+42PZxUeMtLATLAPIMIEva0O+m2xxnSrZnf479waXGeBccgw5Jg?=
 =?us-ascii?q?MemyDu5AYNRauBnA46Hh5bfHojBbeY4gcJL2u2cjbyTRx5KdoncoGgMcj7ny?=
 =?us-ascii?q?sA/BUn2ugZ02lCtT9jZiVNZmzy0DX2cmFoZov3YXElmlM77KKorPdG3Po45d?=
 =?us-ascii?q?R5GiXt1x3mmMRgHs+WEJKjI3ENRc3AZb4Fvx1v9g0g+Pud9WbJJ8eTon9QnM?=
 =?us-ascii?q?0QBqgrAiIMOiFGbzBQKdb8sNwuSolvKqD7hNwVMZpRBZFgU57c4pt5ueTnpJ?=
 =?us-ascii?q?P79l4f9NyR8fz08W6bWy0uI6MYxLR9JXSd6Bl+8rmfT90WjFmhEXTE5OP5cA?=
 =?us-ascii?q?alGyxM5GPCV1kaSYsvjfMZA90JtEKurd6COmMKazI7b18UwtSX0rsst0LLV0?=
 =?us-ascii?q?u0ZSz5zEQnZrykzep+8Go3Df8YczY2Uw946Id1jgODR+YrNbhG8dJMVWDabC?=
 =?us-ascii?q?u44izdTK+drXrBgCRFajYcRLTkKRBtyVnHE48BK91ZhCVrZiJqaNo5iP6z7z?=
 =?us-ascii?q?v9Tery70nFGXmieMHsnrXLkdN8gkP67xySN/Y9BBWbw5QXDr7Dl2FTooSW8K?=
 =?us-ascii?q?InI6UbljdbYOsmj8UV5l18lYB2Z9FfBsxDfJgM/OdWVe7cCugirq7kBW4yNw?=
 =?us-ascii?q?JGFkMx7sPeNuViw+XtEJOJm4Yb5VkWf7E39VpHatVymIAjwp/KlBI2cb7ySJ?=
 =?us-ascii?q?oe9RLgTjyJk+8Eo4wmkJlE+KW2wtnxW7dUzNM3JKi7wYx/oYeaqCaTmj3xI/?=
 =?us-ascii?q?/iB6GnruipsGVz+zpqp8NGDMaaWL0cbrFXI/UzdRk0KuJMHCRHlpGpcW4yBf?=
 =?us-ascii?q?wpCNmn9DQpiH3xbx7E1zCJRxsq/4I9zAl1/8wm3BZ3dWnXHXBFcg4QoKvg1Y?=
 =?us-ascii?q?7bpQshw1/5eIlzLXkFN/wOwuXAeg9KPWoojKOuX5SqW/Z0e9Thf/7UqSHnAC?=
 =?us-ascii?q?HfTk3XpwY+4W6NDD0ESuex+SDStm2wmFuhWzTJ84nJ3dROOcTAEJ4Ct2HjbT?=
 =?us-ascii?q?l3p47wAPZTznsuA3MacoJDCHT30gTbLsduwQcuRMNgwSjJY85oA4/ilSOdGN?=
 =?us-ascii?q?n1cWXpM4NdsTDsrDleSZem3z+DXadYeWCObVemxTt3CNmFe8t7vuGb+d8Phb?=
 =?us-ascii?q?hwop1sCofY77cu/25FcsJ0yypRAaAh60hDctjL4uIroHBzkwJ65j1dzgNDGt?=
 =?us-ascii?q?Nt2RqV761XkvRgEAy93EnzH4bEhtXaX1L8uq45um4lFuEWYKxV15I3/fZWTP?=
 =?us-ascii?q?PVpyrF4naceUYQ/h6FNxZpgh9KsG1NoSRrQMfvp1WQx05gokDBw6eCfRUDHy?=
 =?us-ascii?q?9l0Zw62h+iy7APR+yshESgxpfJ42+Dxj9VkK1sphrMCEJC3CSCw3d/4kM8lC?=
 =?us-ascii?q?9fxzZvr7LzM/7MXGfhl635yJyx73Bq7sAtIiEOG3iOsIsj9FtfXFbhk7jHs4?=
 =?us-ascii?q?Ws420j0ZaeIJoWBkft3spBGvGSXFaWbFKdKUF3LPsGy8c2L1w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77898051"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4 10/32] tools/libs/util: cleanup Makefile
Date: Thu, 11 Aug 2022 17:48:23 +0100
Message-ID: <20220811164845.38083-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove -I. from CFLAGS, it isn't necessary.

Removed $(AUTOSRCS), it isn't used.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/util/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index ffe507b379..493d2e00be 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -11,7 +11,7 @@ OBJS-y += libxlu_pci.o
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
-CFLAGS += -I. $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenctrl)
 
 CFLAGS += $(PTHREAD_CFLAGS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
@@ -29,7 +29,6 @@ ifeq ($(BISON),)
 endif
 
 AUTOINCS = libxlu_cfg_y.h libxlu_cfg_l.h libxlu_disk_l.h
-AUTOSRCS = libxlu_cfg_y.c libxlu_cfg_l.c
 
 LIBHEADER := libxlutil.h
 PKG_CONFIG_NAME := Xlutil
-- 
Anthony PERARD


