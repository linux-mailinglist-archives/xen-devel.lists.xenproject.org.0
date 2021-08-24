Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD73F5CB7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171076.312375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCJ-00018B-H2; Tue, 24 Aug 2021 11:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171076.312375; Tue, 24 Aug 2021 11:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCJ-00013g-5Q; Tue, 24 Aug 2021 11:02:27 +0000
Received: by outflank-mailman (input) for mailman id 171076;
 Tue, 24 Aug 2021 11:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4c-0001EC-FE
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ab1cb7c-51bc-48ca-a536-68a6494dc77a;
 Tue, 24 Aug 2021 10:52:28 +0000 (UTC)
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
X-Inumbo-ID: 7ab1cb7c-51bc-48ca-a536-68a6494dc77a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QuqoIfeDw8eF+DGgSYO4xUOtOIqvl/XeL88YQx7aEos=;
  b=S4V6X66ZAg8Jn0XYmLQeVsIDGVXLCm45J9GTtuwJNE7QSgQm3aY0EYHO
   N7UI9mGpbSrgaDDQ4x8jK6OkC1X1C20OvnlcBw1Le8YhOYkhJMn1KbXrr
   9rFnun0+cuM1rDmKKFkxG0+80lmMRM57DMI19vk9M1+w9jCAk/rp8XQSh
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vYYem8iODwV1MlhRS+TqWRAqy7e5fGxR41KiW/A6v4dHTHPmI7SD8+APb7NnHFGdhoek1K0fEF
 Vu4Q3Kf739eG61IZ1r/sYCvW3TmO0NXdgy/qnM/P6VNV8AnJshCTJGgeoZcHTcGj1h6a5aTqv2
 hAwNu95mBU488IIdQHP8MWVB4rQmuyikb0wyj1TfHBqAZKZ2m0p8YvPm21oKx36p9qEosX9iUS
 WadE4v6unyh0O8vr9src63Ipfz6HD3YfQfXiwCXTvVT2Gq+BpB51T/QnLrTf/7uzYppIAMqbOT
 Vtk992vpXswjk5JH3JQMIYvI
X-SBRS: 5.1
X-MesageID: 52875527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+8AyFKAxgx6APQrlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875527"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 48/51] build: Rework "headers*.chk" prerequisite in include/
Date: Tue, 24 Aug 2021 11:50:35 +0100
Message-ID: <20210824105038.1257926-49-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Listing public headers when out-of-tree build are involved becomes
more annoying where every path to every headers needs to start with
"$(srctree)/$(src)", or $(wildcard ) will not work. This means more
repetition.

This patch attempt to reduce the amount of duplication and make better
use of make's meta programming capability. The filters are now listed
in a variable and don't have to repeat the path to the headers files
as this is added later as needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index c3172f6636be..4e64a31ecab3 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -78,10 +78,21 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h))
+hdrs-path := $(srctree)/$(src)/public
 
-PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+list-headers = $(wildcard $1/*.h $1/*/*.h)
+filter-headers = $(filter-out $(addprefix $(hdrs-path)/,$($1-filter)), $($1))
+
+c99-headers := io/9pfs.h io/pvcalls.h
+public-headers := $(call list-headers,$(hdrs-path))
+ansi-headers := $(public-headers)
+
+public-headers-filter := dom0_ops.h arch-%
+ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) $(c99-headers)
+
+PUBLIC_HEADERS := $(call filter-headers,public-headers)
+PUBLIC_ANSI_HEADERS := $(call filter-headers,ansi-headers)
+PUBLIC_C99_HEADERS := $(addprefix $(hdrs-path)/, $(c99-headers))
 
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
-- 
Anthony PERARD


