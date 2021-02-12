Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1431A1E0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84306.158030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYL-0000jS-OF; Fri, 12 Feb 2021 15:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84306.158030; Fri, 12 Feb 2021 15:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYL-0000j2-Ki; Fri, 12 Feb 2021 15:40:17 +0000
Received: by outflank-mailman (input) for mailman id 84306;
 Fri, 12 Feb 2021 15:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYJ-0000ix-UV
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0497549c-6442-4ccf-ba19-070ba799dfdc;
 Fri, 12 Feb 2021 15:40:14 +0000 (UTC)
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
X-Inumbo-ID: 0497549c-6442-4ccf-ba19-070ba799dfdc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9ilKt//pD9WWwJmxzImNAH8JgkNnaX0KcmVT6/nsyOQ=;
  b=TGuIyEm4uG2FoOiaRkgb+qI7ura6onEHhWcky31AlNrEr+T0yqwoMQj+
   i7gGdjG8lUGQhXdCxfTRGI1pzPLMzLTOuGwwhmpgzQHwCx1SSxpjPBDgs
   lUVC1vKwJ/dwecPMiM+KQPwJxhzpOorOIpDQbmXjgQkwEbElYUPBBkoWY
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yZYg3LdXWpas36oecYc8GfAQ44qTZtj34YojGj+i3Y/nUAffyNtu041+sfrB7t0+QzgSQnU4Vx
 CE6fbK/BHU37/SdXYauPMkSVq4Kuw7kZVQWw66pkpyl63zDqcRMX+75ukBgAJSkBtFuDTsr15f
 L6DBL/e93xWopf1n88mpx6DOurQDlD37sa1pHwN62lENUtfkIuodDMnYt7WNe4rESdpMxNza9J
 PvevuBg0Zbcdri/Nx9avtE4h5McP0/HWlr4Jux+x7NdRYdJG9XZlDDMbfSfTYgyfoPr6ekp8ut
 iTc=
X-SBRS: 5.2
X-MesageID: 38508879
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="38508879"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: [PATCH 03/10] tools/libxg: Fix uninitialised variable in meminit()
Date: Fri, 12 Feb 2021 15:39:46 +0000
Message-ID: <20210212153953.4582-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  xg_dom_arm.c: In function 'meminit':
  xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    420 |     dom->p2m_size = p2m_size;
        |     ~~~~~~~~~~~~~~^~~~~~~~~~

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

Julien/Stefano: I can't work out how this variable is supposed to work, and
the fact that it isn't a straight accumulation across the RAM banks looks
suspect.
---
 tools/libs/guest/xg_dom_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 94948d2b20..f1b8d06f75 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -373,7 +373,7 @@ static int meminit(struct xc_dom_image *dom)
     const uint64_t modsize = dtb_size + ramdisk_size;
     const uint64_t ram128mb = bankbase[0] + (128<<20);
 
-    xen_pfn_t p2m_size;
+    xen_pfn_t p2m_size = 0;
     uint64_t bank0end;
 
     assert(dom->rambase_pfn << XC_PAGE_SHIFT == bankbase[0]);
-- 
2.11.0


