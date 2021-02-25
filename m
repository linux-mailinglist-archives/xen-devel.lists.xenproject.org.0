Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E963D32518F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 15:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89797.169473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFHlb-00018G-A8; Thu, 25 Feb 2021 14:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89797.169473; Thu, 25 Feb 2021 14:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFHlb-00017r-6z; Thu, 25 Feb 2021 14:37:23 +0000
Received: by outflank-mailman (input) for mailman id 89797;
 Thu, 25 Feb 2021 14:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFHlZ-00017m-0c
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 14:37:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 211ad76f-ff28-4ac5-a925-1ba6a4b313df;
 Thu, 25 Feb 2021 14:37:19 +0000 (UTC)
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
X-Inumbo-ID: 211ad76f-ff28-4ac5-a925-1ba6a4b313df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614263839;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=yhNTWm255lLEwEDS0u9GjHof2gWGrlbMR+g2aI2wLBI=;
  b=flOYuPHwmFeim86/qwIAIfFerCcjgKhvVfl9FHH7shm5QqgWxJDQmtTd
   nqIZC+Zz7rh7k6N7S0Rsp2g3BkN2xgFJKpqJvTLbDa9VeGZCNW72vHjWf
   Kzk3u6lKNEtJpabLLD+ZCbeg1fmdk1OLlpVw5wwnZcPXMJVbznxf3J4Kn
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kUnkce5i2TPbTcmj7ATgf0Pe3FA2brZw5HG65rlz49RQGaOUscwesX5K711dr7aU5pF8bMlZa2
 VB1xHYbN/JNjx6JhGWMyRGAmnXkGAsFdvhc74rkuuodvlwsGg2VkUn7OEhzoE1rL0ja/FHKMDW
 CpQOHVdssmO5HTiZX9TrUYa7wtuB4opxxaqVfVu3dUV5AatUALNb5ayvQkZObL7E9qCMr5O7au
 YUMmgVNEsXEcfXzpOUyOG+k0XI9vMMLiZqFm5+WHBo6jy1HOWWMd7ga/9qHSLKVTbcV3IMDdbK
 MeA=
X-SBRS: 5.2
X-MesageID: 38212095
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,205,1610427600"; 
   d="scan'208";a="38212095"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Doug
 Goldstein" <cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15] automation: Fix containerize to understand the Alpine container
Date: Thu, 25 Feb 2021 14:37:01 +0000
Message-ID: <20210225143701.8487-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This was missing from the work to add the alpine container.

Fixes: a9afe7768bd ("automation: add alpine linux 3.12 x86 build container")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  This is only developer tooling, with no impact on the build.
---
 automation/scripts/containerize | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index da45baed4e..b7c81559fb 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -24,6 +24,7 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
+    _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
-- 
2.11.0


