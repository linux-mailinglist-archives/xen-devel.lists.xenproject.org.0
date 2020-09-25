Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDD278075
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLh60-0006JW-42; Fri, 25 Sep 2020 06:20:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLh5y-0006JG-33
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:20:38 +0000
X-Inumbo-ID: 06953b82-a900-4582-ba40-9116930fd550
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06953b82-a900-4582-ba40-9116930fd550;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601014836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mVsee859h8yN/ROdgV5ZHB8aurkrGDMDA/4/tTIMUqw=;
 b=IqcoegJcy0Ohb+GBusFHL+3E++HPRFGGtoOOK4I4GiFRUuCGvh+MxfnLUHes3N72nZJ12M
 4WFE6bswwZ+8OCYNCkV+l9hv9Bx5+9/kEVNCF6HTeyHEGjqh0TZrf3s3jf5gN73eduMZIq
 107npKoIVSWdB4Z7AES9wFhOGQgesoA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0ED63AB91;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/3] Fix and cleanup xenguest.h
Date: Fri, 25 Sep 2020 08:20:28 +0200
Message-Id: <20200925062031.12200-1-jgross@suse.com>
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

This series fixes builds of libxenguest users outside the Xen build
system and it cleans up the xenguest.h header merging xenctrl_dom.h
into it.

Juergen Gross (3):
  tools/libs: merge xenctrl_dom.h into xenguest.h
  tools/libxenguest: make xc_dom_loader interface private to libxenguest
  tools/lixenguest: hide struct elf_dom_parms layout from users

 stubdom/grub/kexec.c                        |  20 +-
 tools/helpers/init-xenstore-domain.c        |   2 +-
 tools/libs/ctrl/Makefile                    |   2 +-
 tools/libs/ctrl/include/xenctrl_dom.h       | 455 --------------------
 tools/libs/ctrl/xc_private.c                |   1 -
 tools/libs/guest/include/xenguest.h         | 400 ++++++++++++++++-
 tools/libs/guest/xg_dom_arm.c               |   1 -
 tools/libs/guest/xg_dom_armzimageloader.c   |   1 -
 tools/libs/guest/xg_dom_binloader.c         |   1 -
 tools/libs/guest/xg_dom_boot.c              |   1 -
 tools/libs/guest/xg_dom_compat_linux.c      |   1 -
 tools/libs/guest/xg_dom_core.c              |  86 +++-
 tools/libs/guest/xg_dom_decompress.h        |   4 +-
 tools/libs/guest/xg_dom_decompress_unsafe.h |   2 -
 tools/libs/guest/xg_dom_elfloader.c         |   1 -
 tools/libs/guest/xg_dom_hvmloader.c         |   1 -
 tools/libs/guest/xg_dom_x86.c               |   1 -
 tools/libs/guest/xg_offline_page.c          |   1 -
 tools/libs/guest/xg_private.h               |  14 +
 tools/libs/guest/xg_sr_common.h             |   1 -
 tools/libxl/libxl_arm.c                     |   1 -
 tools/libxl/libxl_arm.h                     |   2 -
 tools/libxl/libxl_create.c                  |   1 -
 tools/libxl/libxl_dm.c                      |   1 -
 tools/libxl/libxl_dom.c                     |   1 -
 tools/libxl/libxl_internal.h                |   1 -
 tools/libxl/libxl_vnuma.c                   |   2 -
 tools/libxl/libxl_x86.c                     |   2 -
 tools/libxl/libxl_x86_acpi.c                |   7 +-
 tools/python/xen/lowlevel/xc/xc.c           |   2 +-
 30 files changed, 496 insertions(+), 520 deletions(-)
 delete mode 100644 tools/libs/ctrl/include/xenctrl_dom.h

-- 
2.26.2


