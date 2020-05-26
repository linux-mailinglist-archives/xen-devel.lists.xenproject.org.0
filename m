Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8E1E3230
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsT-0007zF-Lg; Tue, 26 May 2020 22:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsR-0007yj-I0
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:16:51 +0000
X-Inumbo-ID: 9315abae-9f9e-11ea-a6c3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9315abae-9f9e-11ea-a6c3-12813bfff9fa;
 Tue, 26 May 2020 22:16:41 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: m9Edo25O6kTacSEUmULiuAAHzIyCQetXjF1b09ArClrHD6Fnoyq7QQGVutGWguCY3u0HK2th1l
 gcVFbzRyJq40yEz0otpsn4vKT7cYLvQYe6etu9kMH7LCPm/pMuUgzBVd+hRCFkKNYfdLWbYUpw
 5cCVEAssQ5gXfEm3lp4MJQnLq41S2EBoZ/IDsuNIUSog/K4VZSy9t0JWxM1XHIYFzecmasECKl
 sy8FXjwOEqwJ4rBLQIAvcEIzk3XILiby8X4a455i2tqY8mK1VXsYG+uh3fyG6GUIudTgsjXtJ3
 GJE=
X-SBRS: 2.7
X-MesageID: 19238410
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="19238410"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/5] Golang build fixes / improvements
Date: Tue, 26 May 2020 23:16:07 +0100
Message-ID: <20200526221612.900922-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a series of patches that improve build for the golang xenlight
bindings.  The key patches are patch is #1 and #4.  Patch 1 will
update the generated golang bindings from the tools/libxl directory
when libxl_types.idl is updated, even if the person building doesn't
have the golang packages enabled.  Patch 2 adds golang packages to the
docker images which have suitable golang versions, so that the bindings
can be tested in the CI loop.

Changes in v2:
- Document requirements to make sure the parallel build is race-free
- Replace v1 patches 4-5 with a patch which will just remove the
  GOPATH-related build testing
- Introduce improvements to automation

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>

George Dunlap (5):
  libxl: Generate golang bindings in libxl Makefile
  golang/xenlight: Get rid of GOPATH-based build artefacts
  automation/archlinux: Add 32-bit glibc headers
  automation: Add golang packages to various dockerfiles
  automation/containerize: Add a shortcut for Debian unstable

 automation/build/archlinux/current.dockerfile |  2 ++
 automation/build/debian/unstable.dockerfile   |  1 +
 automation/build/fedora/29.dockerfile         |  1 +
 automation/scripts/containerize               |  2 +-
 tools/Rules.mk                                |  1 -
 tools/golang/Makefile                         | 10 --------
 tools/golang/xenlight/Makefile                | 24 +++++++++----------
 tools/libxl/Makefile                          | 17 ++++++++++++-
 8 files changed, 32 insertions(+), 26 deletions(-)

--
2.25.1

