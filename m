Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6F32EB98
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93665.176682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uF-0002rX-PC; Fri, 05 Mar 2021 12:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93665.176682; Fri, 05 Mar 2021 12:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uF-0002rA-MC; Fri, 05 Mar 2021 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 93665;
 Fri, 05 Mar 2021 12:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lI9uD-0002r5-Lz
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:50:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58939bb7-5fb3-4810-b2a2-4fd69d64229f;
 Fri, 05 Mar 2021 12:50:08 +0000 (UTC)
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
X-Inumbo-ID: 58939bb7-5fb3-4810-b2a2-4fd69d64229f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614948608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z1HelTmkuc3f0yOSIADiJ3232SVzO1AEpOdakbI14q0=;
  b=DdmbTNu6WcqpNwD81A5kIxSGJkkd69XFOpA9yeen0aOY4lyE5GIqZTlz
   NBJH/3UUpBToNuoKLfhe+XVWGW3QuN3kprQfr2Hflf1RN8l2k1qObhKQd
   XxeY84/ZD7Qdkk70e2PSYgcZZf8YaZvReYF8Q8aoa2oqo19yizFPCH8iw
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zV1m6LxsVZsEQc4Xjcsct9N3n2ffybb6svSYUFZtgaPA2rMjfLg6YhZ4XBM+FkVxsqci7+wO5Y
 t8BH7KDyoOPEHKDSUWikshYRvNwurdLFjOi8xAUn4wQoUge+ZbhbkFOHWx1OVPvIch69ZrBLuB
 ugJFKIupiREzsfdqHfHEfZ5ZTRePtlhwz+zvpoOSOinxMo3v1wmSpZml7wCr85XpT9ZkwKOIuu
 0GieGKmwyG0h0ORXNaRhoxF+3a33NIxg1MLlqJ+iou7kYGt+UEVK9fQpVAiCueLiWSzk+GmDXB
 7WY=
X-SBRS: 5.1
X-MesageID: 38997299
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38997299"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] tools/libxentoolcore: Fill in LIBHEADERS
Date: Fri, 5 Mar 2021 12:49:47 +0000
Message-ID: <20210305124949.6719-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210305124949.6719-1-andrew.cooper3@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

c/s 4664034cd replaced a glob over include/*.h with an expectation that
LIBHEADER was suitably set for libraries which didn't have a single,
consistently named, header file.

This wasn't true for xentoolcore, which lost xentoolcore_internal.h as a
consequence, and failed an API/ABI check vs 4.14

Fixes: 4664034cd ("tools/libs: move official headers to common directory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>

For 4.15.  This is a regression from 4.14, even if AFAICT it only impacts the
ABI checking at this point.

I *think* this is the only impacted library, but I would appreciate a second
pair of eyes.

I did experiment with this:

  +ifeq ($(LIBHEADER),)
  +$(warning $(LIBNAME) - No headers)
  +endif
   LIBHEADER ?= $(LIB_FILE_NAME).h
   LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))

which yields:

  andrewcoop@andrewcoop:/local/xen.git$ make -j4 -s -C tools/libs/
  /local/xen.git/tools/libs/toollog/../../../tools/libs/libs.mk:50: toollog - No headers
  /local/xen.git/tools/libs/evtchn/../../../tools/libs/libs.mk:50: evtchn - No headers
  /local/xen.git/tools/libs/gnttab/../../../tools/libs/libs.mk:50: gnttab - No headers
  /local/xen.git/tools/libs/call/../../../tools/libs/libs.mk:50: call - No headers
  /local/xen.git/tools/libs/foreignmemory/../../../tools/libs/libs.mk:50: foreignmemory - No headers
  /local/xen.git/tools/libs/devicemodel/../../../tools/libs/libs.mk:50: devicemodel - No headers
  ../libs.mk:50: hypfs - No headers
  /local/xen.git/tools/libs/stat/../../../tools/libs/libs.mk:50: stat - No headers
  /local/xen.git/tools/libs/stat/../../../tools/libs/libs.mk:50: stat - No headers

Headers aside for a moment, there are two bugs here.  hypfs doesn't use the
same include pattern as the others, and stat is entered twice.
---
 tools/libs/toolcore/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 1cf30733c9..3550786491 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -5,6 +5,8 @@ MAJOR	= 1
 MINOR	= 0
 AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
+LIBHEADER := xentoolcore.h xentoolcore_internal.h
+
 SRCS-y	+= handlereg.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-- 
2.11.0


