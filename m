Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F386D32D3C9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 14:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93246.175999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHncT-00066J-AP; Thu, 04 Mar 2021 13:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93246.175999; Thu, 04 Mar 2021 13:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHncT-00065t-7G; Thu, 04 Mar 2021 13:02:21 +0000
Received: by outflank-mailman (input) for mailman id 93246;
 Thu, 04 Mar 2021 13:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHncR-00065m-Sy
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:02:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c7ff942-9040-4b11-8293-a61178d4a683;
 Thu, 04 Mar 2021 13:02:18 +0000 (UTC)
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
X-Inumbo-ID: 3c7ff942-9040-4b11-8293-a61178d4a683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614862938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f8xQsxSfztGXF9Zuo5QPBfwNWbESjWufzUav+BWFt4Y=;
  b=cxzFOOJ7qTx8PlfkTOZzkNtbJtbzANb6kqr9tY6IhVIJsuPHqHTzn7VD
   tOjNVoA9oDWYwEyP9FqPIoc8mrmZMqsDP/UXI/vDhiBXukxR/E5VFEyxV
   FkCCefPGbtdLfukbx+WC4Yk1AY+vPvNlPxeZLiCAzV0woKOas0xdpp4nO
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fdSu2OVB4m91qMyFIrwWFELzmhwi5/KUpxElkWqvrN8yGLiXsTJaiEuUSvu8b8+3Wy3AC5pQw3
 MzLamkBPVtTuUCshiJ5+3IO0tr8/VULn377CgrbfcMQYjemBCcqTFPQKU0GKnMa1Ejea3z85tQ
 XmV4aqhILBknesSDaFG6vYdVyFX1cXKPOVd+J7P9FIboY0HiKxcWca4/mmRPoGpf2OvVC8+ujA
 cpPCKZkPJ5UkEEdmNCKZLLZxU2bqz+/2rpphxSzG7jIR5n5PmSEeJjuWetJ7g/lfMFRWYC8EhH
 9tE=
X-SBRS: 5.1
X-MesageID: 39936652
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="39936652"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.15 1/2] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually return data
Date: Thu, 4 Mar 2021 13:01:59 +0000
Message-ID: <20210304130200.10521-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The const_op boolean needs clobbering to cause data to be written back to the
caller.

Fixes: c4441ab1f1 ("dmop: Add XEN_DMOP_nr_vcpus")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 xen/arch/arm/dm.c     | 1 +
 xen/arch/x86/hvm/dm.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index d689e336fd..1b3fd6bc7d 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -128,6 +128,7 @@ int dm_op(const struct dmop_args *op_args)
         struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
 
         data->vcpus = d->max_vcpus;
+        const_op = false;
         rc = 0;
         break;
     }
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index f4f0910463..b60b9f3364 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -612,6 +612,7 @@ int dm_op(const struct dmop_args *op_args)
         struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
 
         data->vcpus = d->max_vcpus;
+        const_op = false;
         rc = 0;
         break;
     }
-- 
2.11.0


