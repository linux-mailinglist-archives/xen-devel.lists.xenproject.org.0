Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3E1DECFA
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 18:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAII-00063f-MQ; Fri, 22 May 2020 16:13:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAIG-00063T-TR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:08 +0000
X-Inumbo-ID: 1ca260c1-9c47-11ea-abf6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ca260c1-9c47-11ea-abf6-12813bfff9fa;
 Fri, 22 May 2020 16:13:03 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H1HFa8+grZ7oFej9hGO2VMHPPWnJV8aaJrw+GbjtDg0jVZCqiLR8a8/3JJWBzAZDaiIUWJ7wvS
 4qlm0rfOfsKkuCu97+rr9taChIiTTdlwYn58dnuegKQgRujqSYEKsy35qA5oWahlIrRO8H7S0B
 MWAmMGuWkHdl1w69dKsmUXiKsLWl+z5kxvMetkiHnOnqgVcsYc7UEFekwfbeEd3kgtMYuVAYu8
 X6T8btkJNKaSrpunjGjQlfI4Zuu36pv/fjWzZpdAEMS2rxDmSQYI2UJ+mLNlF8lELqDmearTjX
 HRo=
X-SBRS: 2.7
X-MesageID: 18557067
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18557067"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/5] Golang build fixes
Date: Fri, 22 May 2020 17:12:35 +0100
Message-ID: <20200522161240.3748320-1-george.dunlap@citrix.com>
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
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a series of patches that improve build for the golang xenlight
bindings.  The most important patch is #3, which will update the
generated golang bindings from the tools/libxl directory when
libxl_types.idl is updated, even if the person building doesn't have
the golang packages enabled.

George Dunlap (5):
  golang: Add a minimum go version to go.mod
  golang: Add a variable for the libxl source directory
  libxl: Generate golang bindings in libxl Makefile
  golang/xenlight: Use XEN_PKG_DIR variable rather than open-coding
  gitignore: Ignore golang package directory

 .gitignore                     |  1 +
 tools/golang/xenlight/Makefile | 12 +++++++++---
 tools/golang/xenlight/go.mod   |  2 ++
 tools/libxl/Makefile           | 12 +++++++++++-
 4 files changed, 23 insertions(+), 4 deletions(-)

--
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
CC: Wei Liu <wl@xen.org>

