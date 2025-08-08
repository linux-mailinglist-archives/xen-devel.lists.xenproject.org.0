Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE2B1EAD4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074662.1437145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVs-0008Kb-MJ; Fri, 08 Aug 2025 14:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074662.1437145; Fri, 08 Aug 2025 14:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVs-0008J7-Id; Fri, 08 Aug 2025 14:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1074662;
 Fri, 08 Aug 2025 14:56:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVq-0008IZ-TY
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVq-007zr5-1s;
 Fri, 08 Aug 2025 14:56:06 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVq-009BYT-0y;
 Fri, 08 Aug 2025 14:56:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=raD2DxVICJDfaNLubZN80EJ1w54pDYHTSpJpYmDjXXs=; b=Vul31LkpIc2hYvJ13DGCLv6uKG
	Ztrg7XC5+LRyqnCPjLrwyrxlQhGLmLNImC4S0fwhtzWuxKdS7Dh0/CgSM1Mn5GaU/QnP9Ja5zIGNw
	JcyrNYKrTEukecn8VRSqC515AgwQ5R5IHRz9hLDNlQpWv2WFTc0oGhkqlSL/SUxL4O1Q=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH 01/11] xl: move printf_info prototype to an header
Date: Fri,  8 Aug 2025 16:55:52 +0200
Message-Id: <20250808145602.41716-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

In a single place.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/xl/xl.h      | 3 +++
 tools/xl/xl_info.c | 3 ---
 tools/xl/xl_misc.c | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 45745f0dbb..9000df00de 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -310,6 +310,9 @@ extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
                                         unsigned int size);
+void printf_info(enum output_format output_format,
+                 int domid,
+                 libxl_domain_config *d_config, FILE *fh);
 
 #define XL_GLOBAL_CONFIG XEN_CONFIG_DIR "/xl.conf"
 #define XL_LOCK_FILE XEN_LOCK_DIR "/xl"
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index eb019e3ee9..3fbc0698b7 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -96,9 +96,6 @@ static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
     return s;
 }
 
-void printf_info(enum output_format output_format,
-                 int domid,
-                 libxl_domain_config *d_config, FILE *fh);
 void printf_info(enum output_format output_format,
                  int domid,
                  libxl_domain_config *d_config, FILE *fh)
diff --git a/tools/xl/xl_misc.c b/tools/xl/xl_misc.c
index 08f0fb6dc9..f0167e1603 100644
--- a/tools/xl/xl_misc.c
+++ b/tools/xl/xl_misc.c
@@ -256,9 +256,6 @@ int main_dump_core(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-extern void printf_info(enum output_format output_format,
-                        int domid,
-                        libxl_domain_config *d_config, FILE *fh);
 int main_config_update(int argc, char **argv)
 {
     uint32_t domid;
-- 
Anthony PERARD


