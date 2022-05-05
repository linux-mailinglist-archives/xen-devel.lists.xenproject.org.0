Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B493351B490
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321177.542121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB3-0008UJ-TO; Thu, 05 May 2022 00:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321177.542121; Thu, 05 May 2022 00:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB3-0008NG-Gi; Thu, 05 May 2022 00:17:05 +0000
Received: by outflank-mailman (input) for mailman id 321177;
 Thu, 05 May 2022 00:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPB1-0007ib-IB
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:17:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2c56aa-cc08-11ec-a406-831a346695d4;
 Thu, 05 May 2022 02:17:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12ADEB82A2B;
 Thu,  5 May 2022 00:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9F1C385A4;
 Thu,  5 May 2022 00:16:57 +0000 (UTC)
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
X-Inumbo-ID: ae2c56aa-cc08-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709817;
	bh=ZGLKYYisUFc7rn69ZuhuAK+ygCod9wup1sfHy1UwDoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S9CFQ9zfBSPi8met1QyoP+KqA5OQ0CtJXNnOXF7M9WbALyBL45NT0DcQv3P7mavXi
	 mcVNUCqKbsqu8QpxNGsJozUtxpUNqcdyp5To2mhVgWgTRalQrX+ktfGrXRberm+9cx
	 b3baurQQTmE88cYdA7NNnownmSZ2TK2LWBtVERmIQt9jYJ2eZfl1Ev9VgO4Izz/4rB
	 7lXnPD/qaGNJhqa9a6SuHdP/FSszW04AhLGnH3Fsp+ct6XKO5w7xVZ0T1tTNX1eQBD
	 A6y0gQEEwW0mW4eZVssa4rDfie3V12YEygEDWjfIADo0MJzYpJUKsUpZqcN1BRT6mG
	 v79oU1bRvbVsg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 1/7] xen/dt: of_property_read_string return -ENODATA when !length
Date: Wed,  4 May 2022 17:16:50 -0700
Message-Id: <20220505001656.395419-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v5:
- backport from Linux
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


