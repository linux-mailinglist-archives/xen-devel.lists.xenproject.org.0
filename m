Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868E2973A5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11210.29828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztz-0001hS-7v; Fri, 23 Oct 2020 16:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11210.29828; Fri, 23 Oct 2020 16:26:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzty-0001eU-NG; Fri, 23 Oct 2020 16:26:50 +0000
Received: by outflank-mailman (input) for mailman id 11210;
 Fri, 23 Oct 2020 16:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztv-0000v3-IC
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:47 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 528ee80c-e585-44e9-9d9c-44a3707f41eb;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztV-0008O8-7t; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzql-000376-RK; Fri, 23 Oct 2020 16:23:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztv-0000v3-IC
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:47 +0000
X-Inumbo-ID: 528ee80c-e585-44e9-9d9c-44a3707f41eb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 528ee80c-e585-44e9-9d9c-44a3707f41eb;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=uoyjLt+gARtd7y51vlGjeKLiscOL3AjdBsOhpLXNLIw=; b=Eo22PrB86p+nJTk8ojvcFZIRc
	U/EWYsurGfPCK+QdMPAdcL8rtyEP0vqJo5RF2acfgCYWlkQVxDoOcfhkUqyN8m+fbnJPdutyhPxID
	PG1+iiIUBf6pAfdgUWmJjIWIj3PBZPjkQ0W0p8nMzBNyFB/yQBkQ/ErH7Y3EP1+DSCFJY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztV-0008O8-7t; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzql-000376-RK; Fri, 23 Oct 2020 16:23:32 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 14/25] libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
Date: Fri, 23 Oct 2020 16:23:03 +0000
Message-Id: <20201023162314.2235-15-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Other parameters, such as 'msitranslate' and 'permissive' are dealt with
but 'rdm_policy' appears to be have been completely missed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2e8e1c50f1..c5d73133eb 100644
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
 
@@ -2310,6 +2310,9 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
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
2.11.0


