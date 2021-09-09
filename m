Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D09405AF9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183373.331526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON11-0001bN-EJ; Thu, 09 Sep 2021 16:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183373.331526; Thu, 09 Sep 2021 16:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON11-0001YR-AK; Thu, 09 Sep 2021 16:35:07 +0000
Received: by outflank-mailman (input) for mailman id 183373;
 Thu, 09 Sep 2021 16:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xa6=N7=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mON0z-0000zH-AQ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:35:05 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0509478-118b-11ec-b1cb-12813bfff9fa;
 Thu, 09 Sep 2021 16:35:00 +0000 (UTC)
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
X-Inumbo-ID: e0509478-118b-11ec-b1cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631205300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=05ujbDwCHYeB1etSWskRRxGCGEOzl35sXRnTpQwyYyQ=;
  b=cH07yqkzdQwzzNUANa+GYhsu01sNhjU0VydsHYHzi3h2lMFlqvDI3k2A
   nsuNzoVRf4fKZnqtzNDdDnxYWAx1t+6N5Mf2sKqTRRe+9N2f3z9j8UYL1
   K+IHV4cXSM0N7e0nYff82ZksjU7gI1l2ULYxcAumk/Kxi3Qpub9PRsat+
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XVrzfeg/RpgzLA8csCHC+Mc3NGz0xP5HCaQGB9gx1e3k6S9orcQfSFmA0+ddQ1jZv1hQpKl7Lt
 TAx3JpmSlonEk2KEpz5CfKpHdOs22WSLO4F3HgPjwjfKG8+jNgACYVqVHP0zksNEuZc4kNvkJ7
 c4rVsOFS01/8Y66KPMfohKkfFtx5CJHo2W2gn7WeNoG/4R+ERdHnRZfVY/+207j7R89HZ8W3Fj
 gHReyXDEGgvC7jQjXf6rtm3IPMMNE87lh3IIPJy3/QqJcyyskQ6/aC8C/dYAjMA8HGUDye4z8A
 tsQ4oQ/2Q3tv69Jp0U1HmxZS
X-SBRS: 5.1
X-MesageID: 51975738
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GiRqhKzLr91ncqQjwy5MKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="51975738"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/3] tools/libxl: Correctly aligned buffer for ACPI tables
Date: Thu, 9 Sep 2021 17:34:40 +0100
Message-ID: <20210909163441.44418-3-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909163441.44418-1-kevin.stefanov@citrix.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The pointer resulting from libxl__malloc() has no explicit alignment.
As an implementation detail, it has 16-byte alignment.

When this buffer is used by libacpi aligning ACPI tables to greater
than 16 does not work correctly.  This causes the FACS to not be
64-byte aligned when the ACPI tables are copied into guest memory.

Align the ACPI tables buffer to a page, to match the alignment
inside guest memory. The buffer is already one page too large,
presumably intended for this purpose originally.

Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_x86_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 3eca1c7a9f..0a82e7cacd 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -193,6 +193,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
      * Set up allocator memory.
      * Start next to acpi_info page to avoid fracturing e820.
      */
+    acpi_pages = (void *)ROUNDUP((unsigned long)acpi_pages, libxl_ctxt.page_shift);
     libxl_ctxt.alloc_base_paddr = ACPI_INFO_PHYSICAL_ADDRESS +
         libxl_ctxt.page_size;
     libxl_ctxt.alloc_base_vaddr = libxl_ctxt.alloc_currp =
-- 
2.25.1


