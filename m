Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E54EE580
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297185.506200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Qj-00068j-Nf; Fri, 01 Apr 2022 00:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297185.506200; Fri, 01 Apr 2022 00:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Qj-00065s-JW; Fri, 01 Apr 2022 00:46:21 +0000
Received: by outflank-mailman (input) for mailman id 297185;
 Fri, 01 Apr 2022 00:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5Qi-00065m-7J
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:46:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2469a72b-b155-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:46:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3654618B4;
 Fri,  1 Apr 2022 00:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14CDC340EE;
 Fri,  1 Apr 2022 00:46:16 +0000 (UTC)
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
X-Inumbo-ID: 2469a72b-b155-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773977;
	bh=nL9OOS2GUK9hVMygYq7DQDwBRpyIvChJ46/D+IotTPY=;
	h=Date:From:To:cc:Subject:From;
	b=dqdSbn9TTy3oGM2lkkrVCTZTNSFA9ek4UshBPEPNCXQ0mfYwe4NHlcxGiXnCjpo72
	 ObAIdp+wQbhFKe0MQOYStUB9R+b1BQwajcC5pPP5PdjUcqzccV3o5XjvrpRSy/Hzsd
	 C1YPAoCM/Ry463nQECOX4RinywUTHzRu/rSdAi50MNhSfmFivPT8+Quz/V/QapfDHs
	 yIV+QcjvYwePbgwX0ieZ2762SyJrZQ9HCtgFIwzZB5tcSw1P/pykoX59k6RDpNDzSj
	 +txUKqux8A1i0w9VNXo706Ws40D2f9I1BPG47j9EgTVRKs1BuSuKwvTOY/lAvF6/fx
	 ZznWJ3xvaVZ6A==
Date: Thu, 31 Mar 2022 17:46:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: robh+dt@kernel.org, frowand.list@gmail.com
cc: sstabellini@kernel.org, devicetree@vger.kernel.org, julien@xen.org, 
    xen-devel@lists.xenproject.org
Subject: [PATCH] of: of_property_read_string return -ENODATA when !length
Message-ID: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

When the length of the string is zero of_property_read_string should
return -ENODATA according to the description of the function.

However, of_property_read_string doesn't check pp->length. If pp->length
is zero, return -ENODATA.

Without this patch the following command in u-boot:

fdt set /chosen/node property-name

results in of_property_read_string returning -EILSEQ when attempting to
read property-name. With this patch, it returns -ENODATA as expected.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 8e90071de6ed..da0f02c98bb2 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -439,7 +439,7 @@ int of_property_read_string(const struct device_node *np, const char *propname,
 	const struct property *prop = of_find_property(np, propname, NULL);
 	if (!prop)
 		return -EINVAL;
-	if (!prop->value)
+	if (!prop->value || !pp->length)
 		return -ENODATA;
 	if (strnlen(prop->value, prop->length) >= prop->length)
 		return -EILSEQ;

