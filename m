Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC85245109
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 15:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6vql-0006RC-1J; Sat, 15 Aug 2020 13:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6vqj-0006R1-7W
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 13:03:53 +0000
X-Inumbo-ID: 105d1c67-473b-4976-9460-291ffb3013b9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 105d1c67-473b-4976-9460-291ffb3013b9;
 Sat, 15 Aug 2020 13:03:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE741B57C;
 Sat, 15 Aug 2020 13:04:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH I v2 0/6] tools: streamline tools/libs/ building
Date: Sat, 15 Aug 2020 15:03:35 +0200
Message-Id: <20200815130341.27147-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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

Generate many make variables automatically instead of having to
reiterate common patterns multiple times.

This is part I of a larger series. The previous version included the
move of multiple other libraries below tools/libs. In V2 I have
decided to split the series up, as this makes it easier to commit
some parts early.

Part I just contains some cleanup work and the automatic generation
of the make variables, without moving any other libraries under
tools/libs.

Patches 1-5 can go in independently from each other, just patch 6
depends on some of the first 5 patches.

The other parts will be sent out later, moving more libraries.

Changes in V2:
- split series up in multiple parts, part I containing only patches
  1-5 and 12 of the series V1
- eliminate the LIBNAME variable from tools/libs/*/Makefile (patch 6)

Juergen Gross (6):
  stubdom: add stubdom/mini-os.mk for Xen paths used by Mini-OS
  tools: switch XEN_LIBXEN* make variables to lower case (XEN_libxen*)
  tools: add a copy of library headers in tools/include
  tools: don't call make recursively from libs.mk
  tools: define ROUNDUP() in tools/include/xen-tools/libs.h
  tools: generate most contents of library make variables

 .gitignore                        |   1 +
 stubdom/mini-os.mk                |  17 ++++
 tools/Rules.mk                    | 134 ++++++++++++------------------
 tools/console/daemon/io.c         |   6 +-
 tools/golang/xenlight/Makefile    |   4 +-
 tools/include/xen-tools/libs.h    |   4 +
 tools/libs/call/Makefile          |   4 +-
 tools/libs/call/buffer.c          |   3 +-
 tools/libs/devicemodel/Makefile   |   4 +-
 tools/libs/evtchn/Makefile        |   4 +-
 tools/libs/foreignmemory/Makefile |   4 +-
 tools/libs/foreignmemory/linux.c  |   3 +-
 tools/libs/gnttab/Makefile        |   4 +-
 tools/libs/gnttab/private.h       |   3 -
 tools/libs/hypfs/Makefile         |   4 +-
 tools/libs/libs.mk                |  37 +++++++--
 tools/libs/toolcore/Makefile      |   3 +-
 tools/libs/toollog/Makefile       |   3 +-
 tools/libvchan/Makefile           |   2 +-
 tools/libxc/Makefile              |   2 +-
 tools/libxc/xg_private.h          |   1 -
 tools/libxl/libxl_internal.h      |   3 -
 tools/xenstat/libxenstat/Makefile |   2 +-
 tools/xenstore/Makefile           |   2 +-
 tools/xenstore/xenstored_core.c   |   2 -
 25 files changed, 119 insertions(+), 137 deletions(-)
 create mode 100644 stubdom/mini-os.mk

-- 
2.26.2


