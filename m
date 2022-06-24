Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A2559E0E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355613.583464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnn-00005Y-K9; Fri, 24 Jun 2022 16:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355613.583464; Fri, 24 Jun 2022 16:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnn-0008SK-FV; Fri, 24 Jun 2022 16:04:59 +0000
Received: by outflank-mailman (input) for mailman id 355613;
 Fri, 24 Jun 2022 16:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnl-0004qc-E3
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e59467-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:04:56 +0200 (CEST)
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
X-Inumbo-ID: 62e59467-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRGeCKQgwOk/UNXsa1d505aRXj+pmL/UOsklwZQeiFU=;
  b=I+MksVtG6MTNz6Nn1xvQjLW1EDKt6shiRYJJ3yBQW5oUc6sKr0gT/iuT
   4RShp4Xxxs81bXEKpEgd7SZrbamCCAnKIYDEWkcf92/Ix4ctb7cP8//uy
   2PrIpGmvRLhMyeYfvafZTS+/lVKOmWrQ48+BCA9aLOYkye37Iyj8lPWLG
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74787692
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zKbMeaxgaEDdRUT38vB6t+dvxirEfRIJ4+MujC+fZmUNrF6WrkVVm
 mZOUTuFb/7cM2amc4skPdvg9x8Ovp6Dx9ExTFQ5qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplnse5TiYHP4DwmuEvcyJeA3lFO6l+9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BO
 5VJNmQ+NnwsZTUWHl4uCYhktt23oWvaVGRos3akvIQetj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ7SOQ9yS+M55bW5jS5PW4UFgVHbOQp4ZpeqSMR6
 rOZoz/4LWUx7ePNEi/Fqef8QSCaYnZMczJbDcMQZU5cuoS4/tlu5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5GxlkgDGJdT9b0gWU3FN4ZRGpjcnGPv
 WIfh++V5/0UAJeGmUSlGbtQQunxtq/abGWE3jaD+qXNERz3oxZPmqgAiAyS2W8zappUEdMXS
 BW7VfxtCG97YyLxMP4fj3OZAMU216nwfenYugTvRoMWOPBZLVbflAk3PBL49z29wSAEzPBkU
 b/GIJnEMJrvIfk+pNZAb7xGiuFDK+FX7T67eK0XODz9gOTHOiLKGOxbWLZMB8hghJ65TMzu2
 443H6O3J993CYUSvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:nvL99a078SDYc1CBdUnA6QqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74787692"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 13/25] tools/libs/util: cleanup Makefile
Date: Fri, 24 Jun 2022 17:04:10 +0100
Message-ID: <20220624160422.53457-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove -I. from CFLAGS, it isn't necessary.

Removed $(AUTOSRCS), it isn't used.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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


