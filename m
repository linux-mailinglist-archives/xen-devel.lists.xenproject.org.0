Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAB351112
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104190.198988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsxh-0006mC-1c; Thu, 01 Apr 2021 08:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104190.198988; Thu, 01 Apr 2021 08:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsxg-0006lh-Sw; Thu, 01 Apr 2021 08:45:56 +0000
Received: by outflank-mailman (input) for mailman id 104190;
 Thu, 01 Apr 2021 08:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsxf-0006lL-IS
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:45:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b40a4a9-cb32-4a9a-8f79-f2e4d4d12201;
 Thu, 01 Apr 2021 08:45:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AB96B06A;
 Thu,  1 Apr 2021 08:45:54 +0000 (UTC)
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
X-Inumbo-ID: 4b40a4a9-cb32-4a9a-8f79-f2e4d4d12201
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sz7pYz3SSChzPfaCLOKsspYeFrYrOKDDv1mzKeQ9WSc=;
	b=C5WivcIWPbxFb6n70fdiFuFmF4fq79Pu1zMvQzJiACePVHeSlekCBdlwsPuqPU1cSV2Xsl
	aR5QJ1ZXPtr7eXm/7eRGmZXZeT0PMQLhouqcMw5zxFu2JADtp5XulLevIiYMy5KbO/+Nek
	ucvVtRFVaVzMChaOiI2ODEpPqTA22A0=
Subject: [PATCH 6/6] VT-d: drop unused #define-s
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <38aab031-d9a3-dfa2-9958-ec625a0ce042@suse.com>
Date: Thu, 1 Apr 2021 10:45:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -471,26 +471,12 @@ struct qinval_entry {
 /* Queue invalidation head/tail shift */
 #define QINVAL_INDEX_SHIFT 4
 
-#define qinval_present(v) ((v).lo & 1)
-#define qinval_fault_disable(v) (((v).lo >> 1) & 1)
-
-#define qinval_set_present(v) do {(v).lo |= 1;} while(0)
-#define qinval_clear_present(v) do {(v).lo &= ~1;} while(0)
-
-#define RESERVED_VAL        0
-
 #define TYPE_INVAL_CONTEXT      0x1
 #define TYPE_INVAL_IOTLB        0x2
 #define TYPE_INVAL_DEVICE_IOTLB 0x3
 #define TYPE_INVAL_IEC          0x4
 #define TYPE_INVAL_WAIT         0x5
 
-#define NOTIFY_TYPE_POLL        1
-#define NOTIFY_TYPE_INTR        1
-#define INTERRUTP_FLAG          1
-#define STATUS_WRITE            1
-#define FENCE_FLAG              1
-
 #define IEC_GLOBAL_INVL         0
 #define IEC_INDEX_INVL          1
 #define IRTA_EIME               (((u64)1) << 11)


