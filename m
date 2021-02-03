Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A630E3CA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 21:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81050.149034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OR8-0000CZ-Ic; Wed, 03 Feb 2021 20:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81050.149034; Wed, 03 Feb 2021 20:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OR8-0000C0-E9; Wed, 03 Feb 2021 20:07:38 +0000
Received: by outflank-mailman (input) for mailman id 81050;
 Wed, 03 Feb 2021 20:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1O+=HF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l7OR7-0000Bi-Hb
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 20:07:37 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19246fc6-9e83-44af-808f-9044396c1725;
 Wed, 03 Feb 2021 20:07:35 +0000 (UTC)
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
X-Inumbo-ID: 19246fc6-9e83-44af-808f-9044396c1725
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612382855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EyvH51Bn6pq0zdCFJ+K3Cfpfi1Q7rbnOK1TQDTsUE8M=;
  b=RcdmPx3C9CDwLmZehsq8nZ38IlW6cED3EFsqsXuKhml/3dsScbMePHhy
   U5RUAie/6d6IRBzaQpaB1or8OJpd59xAVDJ+xoqDuAGHVdn+S0Nm1QK28
   zOdeZxHaPqGVL8AixbE+JZFB+SPasblD//BU358MBDDd/jDynOhhY6AXC
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: y0vrFMvfz/3F9VBGEL2ptjYDNwIkFipgqd+cfKDaRytnjYsPTCef31rc5xJ/HbNAXLEchisjiv
 3gyu/5xpUt9m1QotYqw6k1SELRN2HXkYxPIVXamaUo3AzBYn1ddhDP53UaDR36MH+gsYsslNGU
 5Ol65laLUoWwMf1LTp+ENVwtN0buuh8qixcHI0qu/6xQdvVvmZNwxZmKgBha5em6yrm1Hvg6bA
 7SjrpfMoYkW3mU/KJ1XRI3IRRjihdfCMFL3IZyIKlZJ1tmx+fyZYw2l3070rEaHaQQhEOXBbEr
 Aeg=
X-SBRS: 4.0
X-MesageID: 36694182
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36694182"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<tamas.k.lengyel@gmail.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 2/2] tools/libxl: only set viridian flags on new domains
Date: Wed, 3 Feb 2021 20:07:04 +0000
Message-ID: <1612382824-20232-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
References: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Domains migrating or restoring should have viridian HVM param key in
the migration stream already and setting that twice results in Xen
returing -EEXIST on the second attempt later (during migration stream parsing)
in case the values don't match. That causes migration/restore operation
to fail at destination side.

That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
extending default viridian feature set making the values from the previous
migration streams and those set at domain construction different.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/libs/light/libxl_x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 91169d1..58187ed 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -468,7 +468,10 @@ int libxl__arch_domain_create(libxl__gc *gc,
         (ret = hvm_set_conf_params(gc, domid, info)) != 0)
         goto out;
 
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
+    /* Viridian flags are already a part of the migration stream so set
+     * them here only for brand new domains. */
+    if (!state->restore &&
+        info->type == LIBXL_DOMAIN_TYPE_HVM &&
         (ret = hvm_set_viridian_features(gc, domid, info)) != 0)
         goto out;
 
-- 
2.7.4


