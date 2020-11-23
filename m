Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2ED2C1249
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34929.66254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFto-0006Or-CR; Mon, 23 Nov 2020 17:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34929.66254; Mon, 23 Nov 2020 17:45:12 +0000
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
	id 1khFto-0006NM-0I; Mon, 23 Nov 2020 17:45:12 +0000
Received: by outflank-mailman (input) for mailman id 34929;
 Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtk-0006Ir-NR
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtj-0006YV-L4; Mon, 23 Nov 2020 17:45:07 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtj-0000at-HN; Mon, 23 Nov 2020 17:45:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Ir-NR
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=dpUixXjI/I4QIesMLF+10yxwU7Nt8aYiH/KlAxrUXlM=; b=o+392nWlICupgPcT/zrNrfMCS
	/ycRGM7S2GfEgkxNlTwlOMQxjZ+CA16dawSkPJRpIelIMUxYl8TxZU2eSArY0FPM0v/geuYKi22K1
	Qw5CawOnvsIbLpkpVXCyARhNLIghJcajAOLzURbtici+MdeN+aX6io4wr9g8gxUrqxPSI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtj-0006YV-L4; Mon, 23 Nov 2020 17:45:07 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtj-0000at-HN; Mon, 23 Nov 2020 17:45:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 04/23] libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
Date: Mon, 23 Nov 2020 17:44:44 +0000
Message-Id: <20201123174503.6800-5-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

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
index da01c77ba2..50c96cbfa6 100644
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
2.11.0


