Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968A2F64C9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67201.119736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hT-0002Yb-EN; Thu, 14 Jan 2021 15:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67201.119736; Thu, 14 Jan 2021 15:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hT-0002Xo-9U; Thu, 14 Jan 2021 15:38:15 +0000
Received: by outflank-mailman (input) for mailman id 67201;
 Thu, 14 Jan 2021 15:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hR-0002SV-MJ
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2504745-3d95-4f1d-8aa6-9c77531c1eca;
 Thu, 14 Jan 2021 15:38:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EEA1AEBB;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
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
X-Inumbo-ID: d2504745-3d95-4f1d-8aa6-9c77531c1eca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULA5oyQ9PKQvxY0XQ311WS+tk8vKPHRD8O8PUy43dFQ=;
	b=etqhtqGCj1/phUwMjAy/YdUqFrjO68IY6PuNwn0qBx3Ju9kKWSznIR4Ps7BD6wq2Dv9xc0
	QDDtxxcR3b8vlqmPAWeRYnpK/WeMJK8y0jgosQ5chzRIIeZI020jxspGd7V4toxUPLc9Am
	Bz6Bvlcij0c950hgqQM7hZ8CxGbseI8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v11 04/27] tools/libxenevtchn: propagate xenevtchn_open() flags parameter
Date: Thu, 14 Jan 2021 16:37:40 +0100
Message-Id: <20210114153803.2591-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the flags parameter of xenevtchn_open() to the OS-specific
handlers in order to enable handling them there.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index 581a14e3df..c069d5da71 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -60,7 +60,7 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
             goto err;
     }
 
-    rc = osdep_evtchn_open(xce);
+    rc = osdep_evtchn_open(xce, flags);
     if ( rc  < 0 )
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
index 8e9f77bb6b..47c153c268 100644
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


