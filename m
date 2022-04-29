Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E27515630
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317702.537165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgI-0007HR-DR; Fri, 29 Apr 2022 20:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317702.537165; Fri, 29 Apr 2022 20:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgI-0007Ed-9B; Fri, 29 Apr 2022 20:57:38 +0000
Received: by outflank-mailman (input) for mailman id 317702;
 Fri, 29 Apr 2022 20:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXgH-0006w0-EI
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff03d556-c7fe-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 22:57:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11385621A2;
 Fri, 29 Apr 2022 20:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176B1C385A4;
 Fri, 29 Apr 2022 20:57:34 +0000 (UTC)
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
X-Inumbo-ID: ff03d556-c7fe-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265854;
	bh=qNbBe6vmVEA5q4kiVCAEwgFL1a6sen9A+xt7fWqSkOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t2mf+d5+Yl/YFI//MIfxpyddVMpFHSoViMkxkhbAmDwvfKyySCDMqzGohssrt7ivY
	 dGauxPXjx5u3tlE9B18X3/JlC3bHpAIipY+jo8jkg+OzH2nW4vDL7XlYSvHLOtkYPi
	 l5KP0rEb7gpOO+5lwJt2pYF9+3UrXtM3Oi4lR6f5c1OY3f0YDAp2tGDqt+yO8GPqgV
	 bG1s0MkVYB8DLMlfidkTNYlU1/XXdZ9FKZxQ7HLd7hd4cWuvoAwrnDvfp72Uzoem4Z
	 63+bzRRT5+/IZ3n5SrYay0iNl3kq9iNeuLz97MSjZPUgVFnHdSVmJkXCRNOCJ07O2C
	 wRlbOjpoQCUuA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 1/7] xen/dt: of_property_read_string return -ENODATA when !length
Date: Fri, 29 Apr 2022 13:57:26 -0700
Message-Id: <20220429205732.2030094-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

When the length of the string is zero of_property_read_string should
return -ENODATA according to the description of the function.

However, of_property_read_string doesn't check prop->length. If
prop->length is zero, return -ENODATA.

Without this patch the following command in u-boot:

fdt set /chosen/node property-name

results in of_property_read_string returning -EILSEQ when attempting to
read property-name. With this patch, it returns -ENODATA as expected.

This commit is a backport of:
https://lore.kernel.org/xen-devel/20220416003028.1315268-1-sstabellini@kernel.org/

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v5:
- backport from Linux, I don't have the commit id yet so I used an LKML
  link instead for now
---
 xen/common/device_tree.c      | 2 +-
 xen/include/xen/device_tree.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..0e8798bd24 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -198,7 +198,7 @@ int dt_property_read_string(const struct dt_device_node *np,
 
     if ( !pp )
         return -EINVAL;
-    if ( !pp->value )
+    if ( !pp->length )
         return -ENODATA;
     if ( strnlen(pp->value, pp->length) >= pp->length )
         return -EILSEQ;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index fd6cd00b43..430a1ef445 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -451,6 +451,9 @@ static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
  * doest not have value, and -EILSEQ if the string is not
  * null-terminated with the length of the property data.
  *
+ * Note that the empty string "" has length of 1, thus -ENODATA cannot
+ * be interpreted as an empty string.
+ *
  * The out_string pointer is modified only if a valid string can be decoded.
  */
 int dt_property_read_string(const struct dt_device_node *np,
-- 
2.25.1


