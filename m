Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE23503209
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 02:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306021.521215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfWKi-0000tL-VZ; Sat, 16 Apr 2022 00:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306021.521215; Sat, 16 Apr 2022 00:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfWKi-0000qR-SV; Sat, 16 Apr 2022 00:30:36 +0000
Received: by outflank-mailman (input) for mailman id 306021;
 Sat, 16 Apr 2022 00:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfWKh-0000qJ-HF
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 00:30:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d537b71-bd1c-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 02:30:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2D2E622CE;
 Sat, 16 Apr 2022 00:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E029EC385A5;
 Sat, 16 Apr 2022 00:30:30 +0000 (UTC)
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
X-Inumbo-ID: 6d537b71-bd1c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650069032;
	bh=gQSFkzWaSCzU6UI9kfwlgCZeTrqeUZGpegqf+xzbLAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mK4bZmXVRMVSWKWTH9TVzcmpV3DnUZkbRpvjz/DD1T5ZhThWoNd9U4H+7uNIdVfJL
	 INCK0P8w24MupU6S4o6rd8p8V9WrGLwDR0Dj/Y1EBCtyPALbRi0PRtMtjIvGjzoSE5
	 Af+REMEn7gGqdACUEpoqRnfM1zaKsRfoNlIftOmN8LzZTeG/GtFFliec/nLvK+TmsZ
	 fO1XYmboB8vsYUfaKDLCUZv9zULTPj7wY+YGbxnqNtnwXpNcZOv7oXKofSjNUjrWVJ
	 /HfMju5Ot8B0JfMq554EeAxRdXPhd6G788cbgzCAyyt4XGu9+Z21QZ7oTnUUjNouzp
	 DFwB07UstNwnA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: robh+dt@kernel.org,
	frowand.list@gmail.com
Cc: sstabellini@kernel.org,
	devicetree@vger.kernel.org,
	julien@xen.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] of: of_property_read_string return -ENODATA when !length
Date: Fri, 15 Apr 2022 17:30:28 -0700
Message-Id: <20220416003028.1315268-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- use prop instead pp
- drop value check
- update function header documentation
---
 drivers/of/property.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 8e90071de6ed..84903dad96a4 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -431,6 +431,9 @@ EXPORT_SYMBOL_GPL(of_property_read_variable_u64_array);
  * property does not have a value, and -EILSEQ if the string is not
  * null-terminated within the length of the property data.
  *
+ * Note that the empty string "" has length of 1, thus -ENODATA cannot
+ * be interpreted as an empty string.
+ *
  * The out_string pointer is modified only if a valid string can be decoded.
  */
 int of_property_read_string(const struct device_node *np, const char *propname,
@@ -439,7 +442,7 @@ int of_property_read_string(const struct device_node *np, const char *propname,
 	const struct property *prop = of_find_property(np, propname, NULL);
 	if (!prop)
 		return -EINVAL;
-	if (!prop->value)
+	if (!prop->length)
 		return -ENODATA;
 	if (strnlen(prop->value, prop->length) >= prop->length)
 		return -EILSEQ;
-- 
2.25.1


