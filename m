Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6453AB70
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340584.565677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRh0-0000j3-Cl; Wed, 01 Jun 2022 16:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340584.565677; Wed, 01 Jun 2022 16:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRh0-0000ah-67; Wed, 01 Jun 2022 16:59:34 +0000
Received: by outflank-mailman (input) for mailman id 340584;
 Wed, 01 Jun 2022 16:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwRgy-0000Xw-Rb
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:59:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3355f586-e1cc-11ec-837f-e5687231ffcc;
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
X-Inumbo-ID: 3355f586-e1cc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654102771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFVVIbvewXpq18wLagkSmqKQFGebkO+PaAyJtLO/9K8=;
  b=VF+AqHuON8WHLriyTwRdVXR3ra0uqaQ0z3ibpz++GYpR2cB6LM4Gk1DB
   zjpUn7xWn4u1O/qg8rRb5OS0SlST6OKjC8BZc7AfNnxlBckTHdh2EaQQo
   W3r6FT1c+YcGR0hcfvTDyp44iz5CRYKE4ic3HxmXpQMJFhDeSNsBurloC
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72494142
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OoSqwqinvuCJ3pRVzKHD4FDgX161GBAKZh0ujC45NGQN5FlHY01je
 htvXTyCb/qMYDSgf4wgO4+3p0oC75DQnYRqT1dtq3o3QyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvU4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT41MbzJwuMcb0RJCjw5J/JKwpvsGVHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmAzPUiZP0cn1lE/Uss/uP+miUvEbzBXk1KcpKkdyHeM01kkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8lC+9KC1PKm4+OD4dUEwfvNXZhKoLp0eaJjp8K5JZnuEZCBmpn
 W3W9HRh2e5D5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSfyN/UvPNzuUp1CIU3c+TPND6m8UzazSsIpKF/vEN9GPiZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGNrtBDdgBRdydlbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:8BwDfamrKb54aO+kaqExKfY52i/pDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.91,269,1647316800"; 
   d="scan'208";a="72494142"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/4] build: set PERL
Date: Wed, 1 Jun 2022 17:59:07 +0100
Message-ID: <20220601165909.46588-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601165909.46588-1-anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to use it in a moment.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index 82f5310b12..a6650a2acc 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
+export PERL		?= perl
 
 $(if $(filter __%, $(MAKECMDGOALS)), \
     $(error targets prefixed with '__' are only for internal use))
-- 
Anthony PERARD


