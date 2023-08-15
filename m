Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CA77CFF7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 18:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584008.914389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwhB-0006Do-Le; Tue, 15 Aug 2023 16:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584008.914389; Tue, 15 Aug 2023 16:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVwhB-0006Aw-Iv; Tue, 15 Aug 2023 16:15:01 +0000
Received: by outflank-mailman (input) for mailman id 584008;
 Tue, 15 Aug 2023 16:15:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVwhA-0006Aq-39
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 16:15:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e02e48c3-3b86-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 18:14:58 +0200 (CEST)
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
X-Inumbo-ID: e02e48c3-3b86-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692116098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JMM+IzKUa/xdhtEWNcNAqrBAMIu8EImwTLztjHn8RQ0=;
  b=FVRko+eRp+o+1/yEHS7WC2QmYP2YUk5NRFiwme7a8lz61LB+JEqNW/LN
   tSZzIv5sm/Q0g4B1ahW9DVhaEl14+fw6iJ/oEvlaHGjI9SPibNaVS0YwT
   3x5IbmQNNRcsM5qWab6XtAfvXMbCyZ1++xgTN5xyqc9+hjSE671z4pFxB
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118230468
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:e2AbmazRodoccx1eiIR6t+cOxirEfRIJ4+MujC+fZmUNrF6WrkUEy
 2EaWm6EO6rcNGb8coxya47j9BwO7JSDnYMwGQs9riAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPK0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxpz
 KQELiosVE6avNKWzru3TOtjxf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMzhzD/
 j6YrwwVBDkFE8zA7DeZr07wreD3m3LGWqkJT5qRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAjyoKCpUzBmROW+IHyfi477wnRXG3m11YsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPY64Phw3RoAUCnSUSONg1Hg3DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDmLHsCjnk3+iOH2iJuppVAtagfmUwzExPnc/FW9H
 yh3ZqNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOq2Askg8yxqZn1E0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:rSn68aicUAJ+cxMZNKseD4OYCHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:W23jm2Fx1ZVf3iIOqmJ603dMBsY/U0eD1UzgA0GxBWBrR/6sHAo=
X-Talos-MUID: 9a23:MXdCAwlPaZ0iKhxMqQwddnp9E9c3xqmyVXxRupo+vZi5NwdrYBC02WE=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118230468"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] docs: Drop warning about 2M limit for ARM
Date: Tue, 15 Aug 2023 17:14:25 +0100
Message-ID: <20230815161425.2202782-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This issue has been addressed in the 4.18 timeframe.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 docs/hypervisor-guide/code-coverage.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/docs/hypervisor-guide/code-coverage.rst b/docs/hypervisor-guide/code-coverage.rst
index 49c4a8ad3bda..a0b787b379b5 100644
--- a/docs/hypervisor-guide/code-coverage.rst
+++ b/docs/hypervisor-guide/code-coverage.rst
@@ -8,11 +8,6 @@ the coverage of its own basic blocks.  Being a piece of system software rather
 than a userspace, it can't automatically write coverage out to the filesystem,
 so some extra steps are required to collect and process the data.
 
-.. warning::
-
-   ARM doesn't currently boot when the final binary exceeds 2MB in size,
-   and the coverage build tends to exceed this limit.
-
 
 Compiling Xen
 -------------

base-commit: 2763c33c6e52583f4f599d0e195bf5b1b859df22
-- 
2.30.2


