Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1873402F9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98871.187824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpef-0007NH-HD; Thu, 18 Mar 2021 10:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98871.187824; Thu, 18 Mar 2021 10:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpef-0007Ms-Du; Thu, 18 Mar 2021 10:13:25 +0000
Received: by outflank-mailman (input) for mailman id 98871;
 Thu, 18 Mar 2021 10:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMpee-0007Mm-6W
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:13:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 442177c9-9ab5-4fee-8f59-82895bfbff01;
 Thu, 18 Mar 2021 10:13:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1ABFAC1E;
 Thu, 18 Mar 2021 10:13:22 +0000 (UTC)
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
X-Inumbo-ID: 442177c9-9ab5-4fee-8f59-82895bfbff01
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616062402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1982WR6j3cpgGsFbVcaDaicMn2WceMWsDl7cYZX9Vg=;
	b=lFyVfQDVjWzAMl2oA21/i6bVwBTG2NkB0Ir071fgQUFk7xuVaNo6YWTMpzmSUTxn75dWFz
	NVfq/T6tgSTXsnH0sfXJis3oN6Byhs4bBnvi1bkf909pavpl4m7t5+wW8VvApdjIr0ZkGh
	UqsCwVlrqcL6xPC/pH+lBbFqA7mjM90=
Subject: [PATCH 1/4][4.15?] VT-d: correct off-by-1 in number-of-IOMMUs check
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Message-ID: <68084b4f-bcd2-59dd-bea7-781b8aa75ef7@suse.com>
Date: Thu, 18 Mar 2021 11:13:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Otherwise, if we really run on a system with this many IOMMUs,
entering/leaving S3 would overrun iommu_state[].

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are more anomalies here, but since we were asked to not make any
cosmetic changes for patches to have a chance to go into 4.15, I've put
off correcting even the most obvious things (scope of MAX_IOMMUS and
nr_iommus) for a later patch.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1168,10 +1168,10 @@ int __init iommu_alloc(struct acpi_drhd_
     unsigned long sagaw, nr_dom;
     int agaw;
 
-    if ( nr_iommus > MAX_IOMMUS )
+    if ( nr_iommus >= MAX_IOMMUS )
     {
         dprintk(XENLOG_ERR VTDPREFIX,
-                 "IOMMU: nr_iommus %d > MAX_IOMMUS\n", nr_iommus);
+                "IOMMU: nr_iommus %d > MAX_IOMMUS\n", nr_iommus + 1);
         return -ENOMEM;
     }
 


