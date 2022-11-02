Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70166161C4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435810.689634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBw5-00034y-2v; Wed, 02 Nov 2022 11:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435810.689634; Wed, 02 Nov 2022 11:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBw4-00031H-UL; Wed, 02 Nov 2022 11:29:32 +0000
Received: by outflank-mailman (input) for mailman id 435810;
 Wed, 02 Nov 2022 11:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqBw3-0001la-Mm
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:29:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d1f519b-5aa1-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 12:29:30 +0100 (CET)
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
X-Inumbo-ID: 9d1f519b-5aa1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667388570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AB+G/K/xEbC4EusmJ8MPpns5BVj+9RqzmSAPIYA2wGU=;
  b=NXTdvWjGyf3h6zo9Yw5Q1yfAEKpPFcR/xrkDQ2SSmzq1mYhmCplpe/bG
   ZEtOdOck3tMYhK7r7vfcIBaf3E8B5VD/qwVf10yspyVIsJiRNVuGqS4a+
   19frH49J7IeX/F+1hL7muSE1LlT1HDlJrPUkSbOPZAgD/hgUe8AV0mhZ/
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83088809
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CYfMjKnEl0wY812IrSadzNjo5gxMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCmCFbPjYamOke98gYNnk9B9Sv8KHx9VnGwQ4ryE2RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7amaVA8w5ARkP6kS5AWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cBfAT1OMh3eu8js77iDVsl02OgRa+C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zh3A9
 jKWpzWR7hcyFf2iwzrVqW2WvbH13jHFR98SMZfl+as/6LGU7jNKU0BHPbehmtG7l0q/VtR3O
 0ESvC00osAa9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmJ2YT2iMsIidqzyaMDIQa2QFYEcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqZqSp0J9KoOrCCs3fR1epgNNi1fB6o6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4hT6FfKsEy/tX1
 XKnnSGEVC9yNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXQMbtjs/zc8VSMr
 76z0vdmLD0GDoXDjtT/q9ZPfTjm01BmbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9z4/1E
 oWGchYBkDLCaYjvc1rihoZLNOyyBv6SbBsTYUQRALpf8yF9P9b0tPdOKcVfkHtO3LUL8MOYh
 sItI62oasmjgByek9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:y8jkm60oc9XWbeQ+BIbaKgqjBLgkLtp133Aq2lEZdPRUGvb2qy
 nIpoV/6faUskd3ZJhOo7G90cW7LE80lqQFg7X5X43DYOCOggLBR+tfBOPZslnd8kbFmNK1u5
 0NT0EHMqySMWRH
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="83088809"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH for-4.17 3/4] xen: Add licence header to device_tree_defs.h
Date: Wed, 2 Nov 2022 11:28:53 +0000
Message-ID: <20221102112854.49020-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102112854.49020-1-anthony.perard@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This header have been created by moving code from other part of the
project and miss a licence header. The original source code was some
version of GPL or LGPL but we intend to have the public header to be
MIT so they can be included easily in other projects.

Part of device_tree_defs.h were moved from libxl_arm.c which is
LGPL-2.1-only. And part were moved from device_tree.h that is
GPL-2.0-only.

Part of the original code were added by Julien Grall @ Citrix with a
Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
886f34045bf0. The other part were added by Ian Campbell @ Citrix, with
commit 0c64527e7fc9.

Resolves: xen-project/xen#35
Fixes: 1c898a9fec7e ("xen/arm: move a few DT related defines to public/device_tree_defs.h")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Julian was working @citrix until 2015.

 xen/include/public/device_tree_defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 228daafe81..9e80d0499d 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -1,3 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2013 Linaro Limited
+ * Copyright (c) 2015 Citrix Systems, Inc
+ */
+
 #ifndef __XEN_DEVICE_TREE_DEFS_H__
 #define __XEN_DEVICE_TREE_DEFS_H__
 
-- 
Anthony PERARD


