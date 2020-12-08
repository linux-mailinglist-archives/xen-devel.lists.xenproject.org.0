Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7722D32AF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 20:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47688.84443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihF-0000u5-K4; Tue, 08 Dec 2020 19:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47688.84443; Tue, 08 Dec 2020 19:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihF-0000tE-Ea; Tue, 08 Dec 2020 19:30:49 +0000
Received: by outflank-mailman (input) for mailman id 47688;
 Tue, 08 Dec 2020 19:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmihC-0000j9-9G
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 19:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihB-0007Lc-9h; Tue, 08 Dec 2020 19:30:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihB-0001p0-1c; Tue, 08 Dec 2020 19:30:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GW8F74uuKnBsl/QhgvU4YWCjBsqUt8SG+nfW/x6vTeU=; b=qzD4mITNZ6VcGw1+bulyKQf8t2
	UbzOveql4qDDGq0xkUmFTBMO5yVsDrzhD1Dbg3RNl8xUbIlT1XjvWCbb9Gj9ry7rtHCIYYKPa/VS5
	+AzrFzoGUy7ThoppnCBlecRBqJUnx38nx8qv1SSLQ+0RyvrJnTZ139Rm74CadnkOTh1M=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 05/25] libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
Date: Tue,  8 Dec 2020 19:30:13 +0000
Message-Id: <20201208193033.11306-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Other parameters, such as 'msitranslate' and 'permissive' are dealt with
but 'rdm_policy' appears to be have been completely missed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 3f85f0d7620e..2a5a4db976e1 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -61,9 +61,9 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
         flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pci->vdevfn));
     flexarray_append(back, GCSPRINTF("opts-%d", num));
     flexarray_append(back,
-              GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d",
-                             pci->msitranslate, pci->power_mgmt,
-                             pci->permissive));
+              GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d,rdm_policy=%s",
+                        pci->msitranslate, pci->power_mgmt,
+                        pci->permissive, libxl_rdm_reserve_policy_to_string(pci->rdm_policy)));
     flexarray_append_pair(back, GCSPRINTF("state-%d", num), GCSPRINTF("%d", XenbusStateInitialising));
 }
 
@@ -2374,6 +2374,9 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
             } else if (!strcmp(p, "permissive")) {
                 p = strtok_r(NULL, ",=", &saveptr);
                 pci->permissive = atoi(p);
+            } else if (!strcmp(p, "rdm_policy")) {
+                p = strtok_r(NULL, ",=", &saveptr);
+                libxl_rdm_reserve_policy_from_string(p, &pci->rdm_policy);
             }
         } while ((p = strtok_r(NULL, ",=", &saveptr)) != NULL);
     }
-- 
2.20.1


