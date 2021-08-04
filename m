Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96E3E0A45
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 00:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164060.300262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBPEG-0003ft-NT; Wed, 04 Aug 2021 22:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164060.300262; Wed, 04 Aug 2021 22:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBPEG-0003dg-Jo; Wed, 04 Aug 2021 22:19:12 +0000
Received: by outflank-mailman (input) for mailman id 164060;
 Wed, 04 Aug 2021 22:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0O68=M3=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mBPEF-0003dY-9Y
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 22:19:11 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d54aea45-e917-4ae6-9e01-da3437b60be7;
 Wed, 04 Aug 2021 22:19:10 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id z24so4351436qkz.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 15:19:10 -0700 (PDT)
Received: from shine.ofnet.lan ([2601:cb:4002:4020:a833:3d41:e5ad:b892])
 by smtp.gmail.com with ESMTPSA id s14sm2186583qke.1.2021.08.04.15.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 15:19:08 -0700 (PDT)
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
X-Inumbo-ID: d54aea45-e917-4ae6-9e01-da3437b60be7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ey+I12fvrW8YmerN2IdBMxylmrTrBeZL4vjwFqqTFmk=;
        b=RaQ82U1nXN0+WRqY12oMN5vAWAVUxmyW/9GTHBf7BRG7XTLMQVMdUTc677gAtryA3E
         cJUvaFNEYWEAg6vVwL/JAk5kIpYfjjmybiYvazZheA+PoOUDIpkZhtWaZ9Fb5kHJFl0I
         dhz0rUBgVskoLtyJKxZf4c+oEW9yCNfmmVNZjkeL9GFlm7vKZ4gKfQHWxQhP1IZpOmmi
         AIVtobx71SJ8/jKPHy7X9ZYgD5dDdKhu+nfrX8kKCneK/w8dRKSbDJV115uRK7uc1vvj
         c2DtoAJwRUPXxiMsBdVz0o6dtxQ7sdzgazVb1uUmGvrsw84Vqwm95gdiwAit/ACSc9JW
         hVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ey+I12fvrW8YmerN2IdBMxylmrTrBeZL4vjwFqqTFmk=;
        b=SQQ32ImoWI0SNLdRtSX2reprrEAxzHnlsm6CbmQeb45q3rvw+JalZTy+fcZ+n9UrIc
         nD5yWyAjk+uAOH5zlt7HxD/6gEiKqrr/3LUvGd3ls7OigolnGvjzZk2XYCAW4XqfAvcr
         YDjZ7CjaQq4kiaiIf2NKv90GzyE9Fpkp3EgHHUnwQq9jiHNznqG0qYlA3dKiXfO+OjTw
         7kQxNvNtEDwJnylVdqT6ZZcCCscaBJDY+/XyjNrCh7QnJNZLF08ovIbIUlsWJkzQbyhR
         6KCYcBMd+keLmqw69pHwtxqAWyaJkMpTwkd+AaLikz+w/X+ddupCfp3JJyker+p6NBpW
         LkiA==
X-Gm-Message-State: AOAM533uOlT/lrkAXZ70Nw454xLbcSARixKAJgbdPgn+paipvqGAHCpN
	M/0byFAzffqI/xYLFm05aCsF5Y44PgI=
X-Google-Smtp-Source: ABdhPJyOZx6XQlniFSWAdsGRAHfw6r1RhVrpMXLQcbLs81Lsqi7gytTAsdk5woDRoVs1CmeGaERG7w==
X-Received: by 2002:a37:ccb:: with SMTP id 194mr1751969qkm.369.1628115549793;
        Wed, 04 Aug 2021 15:19:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pdurrant@amazon.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Fix stubdom PCI passthrough
Date: Wed,  4 Aug 2021 18:17:49 -0400
Message-Id: <20210804221749.56320-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
reflected in the config" broken stubdom PCI passthrough when it moved
libxl__create_pci_backend later in the function.  xl pci-attach for a
running PV domain may also have been broken, but that was not verified.

The stubdomain is running (!starting) and PV, so it calls
libxl__wait_for_backend.  With the new placement of
libxl__create_pci_backend, the path does not exist and the call
immediately fails.
libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices

The wait is only relevant when the backend is already present.  Use the
read on num_devs to decide whether the backend exists and therefore the
wait is needed.  This restores starting an HVM w/ linux stubdom and PCI
passthrough.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Looks like this should be backported to 4.15, but I have not tested.
---
 tools/libs/light/libxl_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1a1c263080..19daf1d4ee 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;
 
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
+    /* wait is only needed if the backend already exists (num_devs != NULL) */
+    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
+        if (libxl__wait_for_backend(gc, be_path,
+                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
             return ERROR_FAIL;
     }
 
-- 
2.30.2


