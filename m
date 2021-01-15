Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E502F7456
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67715.121013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUs-0008MV-JJ; Fri, 15 Jan 2021 08:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67715.121013; Fri, 15 Jan 2021 08:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUs-0008Ly-FF; Fri, 15 Jan 2021 08:30:18 +0000
Received: by outflank-mailman (input) for mailman id 67715;
 Fri, 15 Jan 2021 08:30:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KUq-0008HA-Mc
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0d71ecf-aa53-45e4-9446-6ffb6bf2811e;
 Fri, 15 Jan 2021 08:30:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7474B970;
 Fri, 15 Jan 2021 08:30:06 +0000 (UTC)
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
X-Inumbo-ID: b0d71ecf-aa53-45e4-9446-6ffb6bf2811e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tsWfbx6iMqKxvnR5GrO27JNZTi4P4HPe+MGlLpmMpw=;
	b=ozius3sj14Z6CNa/AQRtDyLgIDs2LzM1oTDi5rZk5S5yQlA+EJAnSVEdvJ8ZHN+fpzwZNI
	AjtOp2HDbJWkHzr6A3oVxxTic+7W2HI4fzmANe0XjUOuO4mECM4JpAHSeMxWzxFi0V1x6e
	FLK5fM084dzMUiiw5trIPSM8eJcOlIo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v12 04/27] tools/libxenevtchn: propagate xenevtchn_open() flags parameter
Date: Fri, 15 Jan 2021 09:29:37 +0100
Message-Id: <20210115083000.14186-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the flags parameter of xenevtchn_open() to the OS-specific
handlers in order to enable handling them there.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V11:
- new patch (carved out from patch 4 of V10, Andrew Cooper)
---
 tools/libs/evtchn/core.c    | 2 +-
 tools/libs/evtchn/freebsd.c | 2 +-
 tools/libs/evtchn/linux.c   | 2 +-
 tools/libs/evtchn/minios.c  | 2 +-
 tools/libs/evtchn/netbsd.c  | 2 +-
 tools/libs/evtchn/private.h | 2 +-
 tools/libs/evtchn/solaris.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index 79990d0027..d3cc93e98f 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -60,7 +60,7 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
             goto err;
     }
 
-    rc = osdep_evtchn_open(xce);
+    rc = osdep_evtchn_open(xce, flags);
     if ( rc < 0 )
         goto err;
 
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index 554af122c8..bb601f350f 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -31,7 +31,7 @@
 
 #define EVTCHN_DEV      "/dev/xen/evtchn"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
 
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index 4582a58ec4..62adc0e574 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -34,7 +34,7 @@
 #define O_CLOEXEC 0
 #endif
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd = open("/dev/xen/evtchn", O_RDWR|O_CLOEXEC);
 
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index bbb313a521..3afc8e2517 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -69,7 +69,7 @@ static void port_dealloc(struct evtchn_port_info *port_info)
     free(port_info);
 }
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd = alloc_fd(FTYPE_EVTCHN);
 
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 53f9299ebb..60a9235978 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -31,7 +31,7 @@
 
 #define EVTCHN_DEV_NAME  "/dev/xenevt"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd = open(EVTCHN_DEV_NAME, O_NONBLOCK|O_RDWR);
 
diff --git a/tools/libs/evtchn/private.h b/tools/libs/evtchn/private.h
index 31e595bea2..319d1996d7 100644
--- a/tools/libs/evtchn/private.h
+++ b/tools/libs/evtchn/private.h
@@ -14,7 +14,7 @@ struct xenevtchn_handle {
     Xentoolcore__Active_Handle tc_ah;
 };
 
-int osdep_evtchn_open(xenevtchn_handle *xce);
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags);
 int osdep_evtchn_close(xenevtchn_handle *xce);
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid);
 
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index d87abc553c..df9579df17 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -29,7 +29,7 @@
 
 #include "private.h"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd;
 
-- 
2.26.2


