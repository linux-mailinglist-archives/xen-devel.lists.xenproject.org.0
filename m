Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3D4C7021
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280630.478647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR0-0003zC-Vy; Mon, 28 Feb 2022 14:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280630.478647; Mon, 28 Feb 2022 14:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR0-0003wk-So; Mon, 28 Feb 2022 14:55:34 +0000
Received: by outflank-mailman (input) for mailman id 280630;
 Mon, 28 Feb 2022 14:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Co=TL=citrix.com=prvs=0517876bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nOhQz-0003h4-1c
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:55:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b8ab98-98a6-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:55:31 +0100 (CET)
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
X-Inumbo-ID: 78b8ab98-98a6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646060131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rocmMjvzUQRs4n7ggDg9sS0cuq8lUwnn9yR5Wesg0oA=;
  b=N5TdfE+w/NQaB4I/vxMjPO8lA3+0QnEiMA2cXi+/F7GCHLhpM6k6ijVH
   9Nw6aCDUj4U46CHIvuoBmh+s3rrNBQkQn/IPh07Qv9oEjPNsu/kpdAqdS
   ED+VlnlwuWF7wpAL4p9pyLkkDJxKr76FQQsIhCgtA18mbFT4LAxbBi6Cl
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65133088
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PEvhMKxyTzgDz4lrIol6t+crxirEfRIJ4+MujC+fZmUNrF6WrkVRz
 2YcDG+Eb63cMGGkKYpwPIS380JVvp+Ezt9kHANvqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplr6O1FzUbJKT2tsMPTBJzEwJjfpxo5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 pNCMmI/PHwsZTVkKFomFK4Bjd75uV/SXA1+9XCnprIOtj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3EruTGhy/8VaoZHae08fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwK8iG6JuFgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobSYV0
 wG7rcngPxJIoqKeYnK+6/SlgyznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhrx/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXblrAYlRujBCxO53Nv02wMH834JrWnFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVpV6kvG5SYq9Bpg4i+aihLArKWdrGwk0OCatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l6U66Bme56Itc990mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:ZvoYWKhGHdzRpoUFRKH8rXIY8XBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65133088"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 1/4] automation: fix typo in .gcc-tmpl
Date: Mon, 28 Feb 2022 14:55:20 +0000
Message-ID: <20220228145523.8954-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228145523.8954-1-anthony.perard@citrix.com>
References: <20220228145523.8954-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The name of the field doesn't matter because it's use as a YAML achor,
but it's nicer to have the proper spelling.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/build.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index cc36428cf5..26dcfb1c25 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -17,7 +17,7 @@
     - /^stable-.*/
 
 .gcc-tmpl:
-  variabes: &gcc
+  variables: &gcc
     CC: gcc
     CXX: g++
 
-- 
Anthony PERARD


