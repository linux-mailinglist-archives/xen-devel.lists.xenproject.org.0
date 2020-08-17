Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C12463BA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bln-00049E-Vy; Mon, 17 Aug 2020 09:49:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bln-00046Z-Ag
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:35 +0000
X-Inumbo-ID: 139dff61-47d5-4f91-a80b-415f49bd0e3a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 139dff61-47d5-4f91-a80b-415f49bd0e3a;
 Mon, 17 Aug 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38F71AD77;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH II v2 01/17] stubdom: add correct dependencies for Xen
 libraries
Date: Mon, 17 Aug 2020 11:49:06 +0200
Message-Id: <20200817094922.15768-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The stubdom Makefile is missing several dependencies between Xen
libraries. Add them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index af8cde41b9..6fcecadeb9 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -405,6 +405,7 @@ libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $
 
 .PHONY: libxenevtchn
 libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
+libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/evtchn
 
@@ -414,6 +415,7 @@ libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxengnttab
 libxengnttab: libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a
+libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: libxentoolcore libxentoollog
 libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/gnttab
 
@@ -423,6 +425,7 @@ libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxencall
 libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
+libs-$(XEN_TARGET_ARCH)/call/libxencall.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call
 
@@ -432,6 +435,7 @@ libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLI
 
 .PHONY: libxenforeignmemory
 libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
+libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory
 
@@ -441,6 +445,7 @@ libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TA
 
 .PHONY: libxendevicemodel
 libxendevicemodel: libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a
+libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: libxentoolcore libxentoollog libxencall
 libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel
 
-- 
2.26.2


