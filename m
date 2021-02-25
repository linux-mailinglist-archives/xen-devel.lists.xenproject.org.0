Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3923257A9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 21:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89958.170035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHW-00083l-5e; Thu, 25 Feb 2021 20:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89958.170035; Thu, 25 Feb 2021 20:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHW-00082s-0y; Thu, 25 Feb 2021 20:30:42 +0000
Received: by outflank-mailman (input) for mailman id 89958;
 Thu, 25 Feb 2021 20:30:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFNHU-00080O-Tx
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 20:30:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d24a89a-4b02-493c-a854-65cedcced3a9;
 Thu, 25 Feb 2021 20:30:40 +0000 (UTC)
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
X-Inumbo-ID: 9d24a89a-4b02-493c-a854-65cedcced3a9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614285040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Qx8jBmkmdqJqWBNokGVben/Nln8ENewcLj1gGF0TLI=;
  b=QJWJwq84XWvyi8LiEMczFTRwHVnfkI6IDTMrrEPE1BG259+wdpbO6FFm
   WJLKYlW5Eu0eg69bXUPzbWENDPVT6xkuHzbdSpCgdfnQnMhgo1/AeCDeb
   gbgLfp3e1pfoBV8whPXy4PRSD97aHIQusIa64eolWzl5z1lFjRqEtnQyN
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ttoJ9fpxkvZkkT8zQSkgPq1z9X8fNuC4qsaA13gavWAV1C+SqixUoeWTy69UYPRzf7lbpxcn9j
 22ImvXfA584+weNvU48sAnHwpULZPO9BQCuwmPub1OGLXD8rWQ1K7D+k/L6ei4Fg64l0/rJZ/c
 gpTjUcYYDnljBMRDSURiqb2agUnL7YeSusaR5mj7sUl1/rVI0XF/8b1PVgazsg7MLOYNJUv39y
 eTIp66EMAzq05LSz9bGkMpH5+x+7FtdizfgCpUoh+rKXzLbxb8bTAq2yMv4NE9ksgUzg95QGB9
 8N8=
X-SBRS: 5.2
X-MesageID: 38422276
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,207,1610427600"; 
   d="scan'208";a="38422276"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 1/3] tools/hvmloader: Drop machelf include as well
Date: Thu, 25 Feb 2021 20:30:07 +0000
Message-ID: <20210225203010.11378-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210225203010.11378-1-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The logic behind switching to elfstructs applies to sun builds as well.

Fixes: 81b2b328a2 ("hvmloader: use Xen private header for elf structs")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
---
 tools/firmware/hvmloader/32bitbios_support.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index e726946a7b..6f28fb6bde 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -22,9 +22,6 @@
 
 #include <inttypes.h>
 #include <xen/libelf/elfstructs.h>
-#ifdef __sun__
-#include <sys/machelf.h>
-#endif
 
 #include "util.h"
 #include "config.h"
-- 
2.11.0


