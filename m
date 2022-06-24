Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6C559E2E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355652.583541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqz-0006ps-Eg; Fri, 24 Jun 2022 16:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355652.583541; Fri, 24 Jun 2022 16:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqz-0006jo-8q; Fri, 24 Jun 2022 16:08:17 +0000
Received: by outflank-mailman (input) for mailman id 355652;
 Fri, 24 Jun 2022 16:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lo5-0004qc-1Q
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e40166c-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:13 +0200 (CEST)
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
X-Inumbo-ID: 6e40166c-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S8/hwL2N26ebpBrr2BTp9NQzqw/JJLwRIQMFuynDLXQ=;
  b=ftg7FbNNJxiLX+Ax7R0/z9W6m6sU52764kHALcCqXgIq05akE6oCxsnl
   qLH04GugxvJm4qH4NLD/Rj85iErbb62IhmvZUFqzJNSk7uFgtPemcVxE2
   6gwtEQfrSOcvp/p8RUT2U7aTVuXkPzyrW39gok9yFhelFyJpBkjnxotbA
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74362409
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sz7SNqIpVG7lSwGMFE+RmJUlxSXFcZb7ZxGr2PjKsXjdYENS0WYDm
 jcZXzzUMvqMYTemKdB1PYzn809XsMTSn4I2TFZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQ02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MccrL3tWVskBaSWv+ItAyF3FyhwA6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQqqFO
 ZBFMWsHgBLoP0xhZUoNMrMFxb2rjWn8MCVig2qujP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL7+4AIIERIDx3h+6D/0xPgHYIEQ
 6AJxsYwhbpj7W32XoXwZBTih3i07iYzX9NeLeJvvWlh1ZHoDxal6nksF2AcNoR96ZdpFVTGx
 XfSwYq3WGUHXKm9DCvEq+zK9W7a1T09dzdqWMMScecSDzAPSqkXhwmHcNtsGbXdYjbdSWCpm
 GDiQMTTatwuYS83O0aTpwmvb8qE/MShc+LMzly/spiZxg14fpW5QIej9ELW6/1NRK7AEATf5
 CBVwpfCtLhRZX1oqMBraL9VdF1Oz6btDdEhqQQ3Q8lJG8qFoRZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52aK/yECCNPctC6roUpxC5fG5SbzNC6CFBvITM8MZXFLWo0lTibu4gjmFfL4EyvpkZ
 /92sK+EUB4nNEiQ5GDnGb5DjeB6nX5WKKG6bcmT8ilLGIG2PBa9IYrp+nPUBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:az2aT60Y5gbwrYYEgUr6DAqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74362409"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 22/25] tools/console: Use $(xenlibs-ldlibs,)
Date: Fri, 24 Jun 2022 17:04:19 +0100
Message-ID: <20220624160422.53457-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/console/client/Makefile | 3 +--
 tools/console/daemon/Makefile | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index 44176c6d93..e2f2554f92 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -6,8 +6,7 @@ CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(LDLIBS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenstore)
+LDLIBS += $(call xenlibs-ldlibs,ctrl store)
 LDLIBS += $(SOCKET_LIBS)
 
 OBJS-y := main.o
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index 0f004f0b14..99bb33b6a2 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -10,11 +10,7 @@ CFLAGS += $(CFLAGS_libxenforeignmemory)
 CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(LDLIBS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenstore)
-LDLIBS += $(LDLIBS_libxenevtchn)
-LDLIBS += $(LDLIBS_libxengnttab)
-LDLIBS += $(LDLIBS_libxenforeignmemory)
+LDLIBS += $(call xenlibs-ldlibs,ctrl store evtchn gnttab foreignmemory)
 LDLIBS += $(SOCKET_LIBS)
 LDLIBS += $(UTIL_LIBS)
 LDLIBS += -lrt
-- 
Anthony PERARD


