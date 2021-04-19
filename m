Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D1364594
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112934.215331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTO-00068z-JN; Mon, 19 Apr 2021 14:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112934.215331; Mon, 19 Apr 2021 14:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTO-00068L-Fc; Mon, 19 Apr 2021 14:01:58 +0000
Received: by outflank-mailman (input) for mailman id 112934;
 Mon, 19 Apr 2021 14:01:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTM-00061N-7t
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d8c9cff-9d38-4858-b45b-5293e1ff64da;
 Mon, 19 Apr 2021 14:01:51 +0000 (UTC)
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
X-Inumbo-ID: 3d8c9cff-9d38-4858-b45b-5293e1ff64da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=WbuAM+uwsh6c1saV41wYeADSZOzR/5RKAn88if8bPyM=;
  b=A8pT1l5vjedITgUCkmCs9lPQ4pVvKscfCeN/F2Ve4eRuD7lrqco60qae
   hDxc4njU+pwSf3JbF29KVzQlredxfGcGCcN0rCHZcfgaltrh1iuDzsbsO
   fhb1sCQBNUD7gIrf6YtJ11JtXLKnasLnbKQUjMvHEH3AAJonmMbgVuooM
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P6yr2jg8xyhDuopW+En6ofy7BsjwOLPEi/Ca3SB/Td7eg3ZR5tda6w7jBiEIQJOYR72MSpS4Dt
 7nqi6xygM0kS6eqqRCjGgcPgLKUiGMevz9omQE4ZagNdRcUL6U0u/cZJFSbbXNXxKXU8GmGjPb
 CBZIFcJhvgLoub85fN79EewHu6uMkCWxV11uwWrLYJcz+qbgJo1NAwb6J4cATgihCjEm0L8cNP
 bsWmSemPxSINgi443qDy5TPpCk0NXXviH+Vg8gmrxC37em49CfsjhwbF43d8WqCCyxmhCoo/Yi
 laM=
X-SBRS: 5.1
X-MesageID: 41892062
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0KAQoKB9VSieYVLlHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41892062"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Subject: [PATCH 5/7] xen/efi: Make efi_start() compile at -Og
Date: Mon, 19 Apr 2021 15:01:30 +0100
Message-ID: <20210419140132.16909-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

When compiling at -Og:

  boot.c: In function 'efi_start':
  boot.c:1339:9: error: 'argc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
   1339 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

although this appears to be limited to the ARM build only.  It also seems to
be bogus, because it is immediately preceding by a read of argc which doesn't
yield a diagnostic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
---
 xen/common/efi/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 63e289ab85..f1e7a5267c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1126,7 +1126,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
+    unsigned int i, argc = 0;
     CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
-- 
2.11.0


