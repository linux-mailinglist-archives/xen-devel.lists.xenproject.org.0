Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7C59593F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 13:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388234.624846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNuMZ-00052n-LK; Tue, 16 Aug 2022 11:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388234.624846; Tue, 16 Aug 2022 11:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNuMZ-0004zV-I3; Tue, 16 Aug 2022 11:03:59 +0000
Received: by outflank-mailman (input) for mailman id 388234;
 Tue, 16 Aug 2022 11:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=REbT=YU=citrix.com=prvs=22068c4b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oNuMY-0004zP-9G
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 11:03:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb6ba49-1d53-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 13:03:56 +0200 (CEST)
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
X-Inumbo-ID: 1eb6ba49-1d53-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660647836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7DCyYci9k1cGZao7uz7iHpT2TbqPVfR2Yen6reBLhRE=;
  b=XGHdxj4JyRCJ5hNPPeJb0svtep+/33mxtwofUbNT1YJDEArkDzYsVT/R
   rd15Uq6C0Z4p/nu5xStxkYsou0TKd9GzcnMNG8hxHZTHZiD9H8YhuJ0OI
   0Vs9EEnPUk9c+R0q25vfGyuqhQwDC1Gaag5k8lsqOBfVHn6uG4PayaJ9X
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77419939
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:++HV2q8QdPOdctT3qJ8jDrUDln6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zAfWmGPP6nfYTGgLdkiYdzn9E8F75fXzYM3QQo6/C48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM24qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGPUIwL401+9pNB15es
 qAfJi8mdTe+mLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQuj+S0YYuOK7RmQ+1bnn+io
 XDt8ljyLSo1aYXC52vU9lOF07qncSTTB9tJSezQGuRRqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80jUqhbg/8gqsVNaVdx+lpH+JuDYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+fRG+Z97yUhSivIiVTJmgHDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxnBw
 DaYrAU/u48Vst5Mi6K14nvcpA+z882hohEO2unHYo60xlonOtb7PNb0uAWzAeVod9jAEATY1
 JQQs43Htb1VU8nQ/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+yzMUKVJdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDOhz29wBZ0z/pka
 f93lPpA6l5LYZmLMRLsH7tNuVPV7npWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt0EAFe/iFyMq
 753aprVoyizpcWkPUE7B6ZPcg1RRZX6bLiqw/FqmhmreVA7RT9/Wq6AkdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:fI3CXajepNIo4p0iEKunYLfotXBQXtAji2hC6mlwRA09TySZ//
 rAoB19726QtN9xYgBGpTnuAsi9qB/nmKKdgrNhX4tKPjOHhILAFugLhuHfKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-IronPort-AV: E=Sophos;i="5.93,240,1654574400"; 
   d="scan'208";a="77419939"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] MAINTAINERS: CC Anthony on Xen's build system changes
Date: Tue, 16 Aug 2022 12:03:40 +0100
Message-ID: <20220816110340.35453-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I'd like to keep an eye on any changes in the Makefiles, to avoid
further break of the build system.

With this entries, it means that THE REST will not be CCed anymore for
changes in
- xen/Makefile
- xen/*.mk
- xen/scripts/Kbuild.include
- xen/scripts/Makefile.*
This could be an issue.

Most other files are also listed in other sections so would have a
maintainer. There's probably a few Makefiles in subdirectory that
would have CC THE REST but won't with this new section.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

I'm not sure if adding a maintainers would be needed, but maybe Jan?

I could look at using lei from public-inbox, or just the search from
public-inbox, but it's easier to tell people to CC me.

Thanks.
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e12c499a28..088647ba11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -260,6 +260,20 @@ M:	Rahul Singh <rahul.singh@arm.com>
 S:	Supported
 F:	xen/drivers/passthrough/arm/smmu-v3.c
 
+BUILD SYSTEM XEN
+R:	Anthony PERARD <anthony.perard@citrix.com>
+S:	Supported
+F:	xen/Makefile
+F:	xen/*.mk
+F:	xen/scripts/Kbuild.include
+F:	xen/scripts/Makefile.*
+F:	xen/common/efi/efi-common.mk
+F:	xen/arch/*/*.mk
+F:	xen/*/Makefile
+F:	xen/*/*/Makefile
+F:	xen/*/*/*/Makefile
+F:	xen/*/*/*/*/Makefile
+
 Change Log
 M:	Henry Wang <Henry.Wang@arm.com>
 R:	Community Manager <community.manager@xenproject.org>
-- 
Anthony PERARD


