Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2931A1E1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84310.158078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYg-0000xz-16; Fri, 12 Feb 2021 15:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84310.158078; Fri, 12 Feb 2021 15:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYf-0000xB-Ql; Fri, 12 Feb 2021 15:40:37 +0000
Received: by outflank-mailman (input) for mailman id 84310;
 Fri, 12 Feb 2021 15:40:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYd-0000ix-O8
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6990a41-5224-4e58-86c7-bbec74fd5ff9;
 Fri, 12 Feb 2021 15:40:16 +0000 (UTC)
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
X-Inumbo-ID: b6990a41-5224-4e58-86c7-bbec74fd5ff9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xRy21DvjvCrpVWjUNEKJmq6KENL31WHuSFgYxPxdZ5Y=;
  b=BXgLuG64lHW7VUdMo+kj1T03GBulBkrF7agZRDm92wN4Rg9lccD1tOe4
   Wmdk5HEfXGdVxayckaXRfzablsU1en8Pp2wdnzbICxIyGCnnyk/aFgBvA
   O16rPrv8XtATh75ZdMruQXm0jqMPGop1q/cD+bD7n81sV8yBysYoV7WmN
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1GPl3yxibCxgECKAjeZrzdszMYAG2TEfiCuJFMKA6SDBa3uPSy8e9DGGtSxuqhLr6synXsJZOL
 dw98UqTfaA1mUFGvgnR5N9EP6+tdudSPFnvx6VHznAbe+sKdRMej/e23fe4zxLg+JhZrA65YOq
 8/m0Zgv0qQ5FQATavZE6BIEDEFTEo7YvIblWmNtAWdydiQtbdu1hHYLQ58JqrlersoyvoEQgpF
 i3B2L8ANF3HB15BjhG6euS/wJOEp3uP2qFIo/wTYL8axOjWuc63b8bRrgUch9gf8n1tn4M1Rjz
 7SA=
X-SBRS: 5.2
X-MesageID: 38508886
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="38508886"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 01/10] tools/xl: Fix exit code for `xl vkbattach`
Date: Fri, 12 Feb 2021 15:39:44 +0000
Message-ID: <20210212153953.4582-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  xl_vkb.c: In function 'main_vkbattach':
  xl_vkb.c:79:12: error: 'rc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
     79 |     return rc;
        |            ^~

The dryrun_only path really does leave rc uninitalised.  Introduce a done
label for success paths to use.

Fixes: a15166af7c3 ("xl: add vkb config parser and CLI")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xl/xl_vkb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/xl/xl_vkb.c b/tools/xl/xl_vkb.c
index f6ed9e05ee..728ac9470b 100644
--- a/tools/xl/xl_vkb.c
+++ b/tools/xl/xl_vkb.c
@@ -64,7 +64,7 @@ int main_vkbattach(int argc, char **argv)
         char *json = libxl_device_vkb_to_json(ctx, &vkb);
         printf("vkb: %s\n", json);
         free(json);
-        goto out;
+        goto done;
     }
 
     if (libxl_device_vkb_add(ctx, domid, &vkb, 0)) {
@@ -72,6 +72,7 @@ int main_vkbattach(int argc, char **argv)
         rc = ERROR_FAIL; goto out;
     }
 
+done:
     rc = 0;
 
 out:
-- 
2.11.0


