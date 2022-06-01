Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3B53AB73
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340583.565670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgz-0000an-TV; Wed, 01 Jun 2022 16:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340583.565670; Wed, 01 Jun 2022 16:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgz-0000Yo-P7; Wed, 01 Jun 2022 16:59:33 +0000
Received: by outflank-mailman (input) for mailman id 340583;
 Wed, 01 Jun 2022 16:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwRgy-0008OC-J8
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:59:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3345643a-e1cc-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 18:59:31 +0200 (CEST)
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
X-Inumbo-ID: 3345643a-e1cc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654102770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lTcMhdu7U3PbutCiovcP5+LL1tCro+vwpmFhh06+tHU=;
  b=HDHkZMN6n30hVAZN2MKH+LXvMUEx0ozJUY54MirDnBYAKWcf5VAK5MzC
   Lz/DzZr4ocTHPOpoLs1zK8CyGYLFHocWT+6Uwnj/W+DFhg0xsrphq8vrz
   PVA6SgWsFp30PJj2wHF2LFlFz2nA0kO7agoBNxorV7ORhH0ZfsXw29zmh
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72647996
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fC3eBqL6t0KeJT3uFE+RqZUlxSXFcZb7ZxGr2PjKsXjdYENS3jwEm
 mcaWW7SaPyDZWr8eIhxYIq2oE5SvZHSn9RjTAdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3NYx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OdKrbH3FyZyBbHzttQ9Sz0GNnxHYoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQqyAO
 5VIOGQHgBLoQxlEJ04dT6kCpMS0vFXZbQMDkXeHqv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJW66/prjVu71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9e3WF2/DKjGiJJRc7HU8aQXEhEDJayoy2yG0stS4jXuqPAYbs0ICpQW2vn
 WvaxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5F8JvsULYyX1NPYfj2eN5yMClPGIKDgYfqqMMoomjmZZL2drAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWLsL89EiOdD7nlnmQv7GMGgpzz6gOX2WZJgYepcWLd4RrthvP3sTcS82
 4s3CvZmPD0FD7OuOXmMq9FNRb3IRFBiba3LRwVsXrbrCmJb9KsJUJc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:xdWcsqHGaflyk95hpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="scan'208";a="72647996"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/4] build: remove auto.conf prerequisite from compat/xlat.h target
Date: Wed, 1 Jun 2022 17:59:09 +0100
Message-ID: <20220601165909.46588-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601165909.46588-1-anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that the command line generating "xlat.h" is check on rebuild, the
header will be regenerated whenever the list of xlat headers changes
due to change in ".config". We don't need to force a regeneration for
every changes in ".config".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index b7e7148665..937a8bc884 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -99,7 +99,7 @@ cmd_xlat_h = \
 	cat $(filter %.h,$^) >$@.new; \
 	mv -f $@.new $@
 
-$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf FORCE
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)
 
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
-- 
Anthony PERARD


