Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1683C57CAE0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372691.604582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZF-0000NM-OA; Thu, 21 Jul 2022 12:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372691.604582; Thu, 21 Jul 2022 12:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZF-0000KK-LM; Thu, 21 Jul 2022 12:46:13 +0000
Received: by outflank-mailman (input) for mailman id 372691;
 Thu, 21 Jul 2022 12:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVZE-0008VW-3V
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:46:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18377743-08f3-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 14:46:10 +0200 (CEST)
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
X-Inumbo-ID: 18377743-08f3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658407570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+GzIgxPBvHngtRJvU9WIFoqyToE0lwj31ZPFwvXIEE=;
  b=XVS7xdmWGzAlZN3Oy0dom6pog1qapUn7lc9ckE0uGzwTysgLCQS/5n0+
   Ulz6CPsG6X5B5Z3rWqYBvNVEMgbEPIBwR+cWgg54SQI5qEinzsAB4W7yO
   xZbbOgLCSBR6CEwSzhIijwoUp7kC3Fbg2ncyLyxxl+N/YemCS0GUN77kn
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76751237
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sXqIL6MuUIcZUBvvrR2jl8FynXyQoLVcMsEvi/4bfWQNrUom0jMDm
 GUWDGqOP/aLNzH2cot1Otyx9EwOuZLVyYJgTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPja8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPHndFpAxkSMLEo0cpUAHlo3
 vM9dSwkO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeNk1EoiuOyWDbTUuCxbMBywlSDm
 nqF9GTlXzNCHsOf5DXQpxpAgceQxHimCer+DoaQ7eV2iVeewmgSDhw+Vlahp/S9zEmkVLp3I
 EUO9i0jhaM77kCsQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtyIfHp45rqh/zfv1PM6+tqPb6PGzs6
 mXfxMQhvIn/nfLnxo3iow2X2Wv298SQJuImzl6JBzz4t2uVcKbgPtX1sgaDsJ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPnqgKuVmS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SIS+CqqNMIEfOMAZmOq7EMZGPBX44owQuBJ0zfFX1
 WmzKq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDFbIGOhtDbd7RrpmhE9yiFmKr
 o032grj40k3bdASlQGMqtZJcg9bfCFT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:fcezi68C49tlW15HM7Nuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76751237"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <andrew.cooper3@citrix.com>, <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v2 1/4] automation: fix typo in .gcc-tmpl
Date: Thu, 21 Jul 2022 13:45:59 +0100
Message-ID: <20220721124602.9910-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220721124602.9910-1-anthony.perard@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
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
index 72f2a317ac..5eb7312754 100644
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


