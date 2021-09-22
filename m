Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C96414C2D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192862.343561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Mj-0001ux-42; Wed, 22 Sep 2021 14:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192862.343561; Wed, 22 Sep 2021 14:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Mj-0001ra-08; Wed, 22 Sep 2021 14:36:53 +0000
Received: by outflank-mailman (input) for mailman id 192862;
 Wed, 22 Sep 2021 14:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3Mh-0001rN-RX
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:36:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8596ceb8-1bb2-11ec-b99e-12813bfff9fa;
 Wed, 22 Sep 2021 14:36:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-LH5A588vO8K5uVEmRWeoig-1; Wed, 22 Sep 2021 16:36:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 14:36:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:36:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 14:36:45 +0000
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
X-Inumbo-ID: 8596ceb8-1bb2-11ec-b99e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym1bnxR0U4vds7SXc2ouMI0aswya4N0rxIF16d3/+iM=;
	b=AZ9WRWLKhHmdDZGSHs8yUY75HkL9HDup3+WemIZQJJ0FLReUbfv+Y+Mw5nCCsPWFxS0UeC
	qnpM/3k2RAAWTTtQwJIxiaVDSoMEfonwPpYHF9JQob1tWi6MiQ10Y1DN/9okiV0Bxi3YHO
	69CMHFSts7DJeKZ1zytmAD+ZLX37DVk=
X-MC-Unique: LH5A588vO8K5uVEmRWeoig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh8Xe1fxqTsI5KT+N8xZgj8gKILY+h5wfo1Uh0bKBhkrsr++rcUxPOoYEAdo21gpZ3q5O6OYv9x2EN4fdHRTXxPF/HLhtPdtYFu/FCJIcOLd07a1zcTIPFgebYmGeX/WPs+qYoJ7gIuPJuQrwCfBHfujr6ngXuyEf1kClRspYL1TDf+/rVipIvovx4ItjufDdx10a0V0yhUkZqanRYncjG0x+W3Cwuszfm6kWR2UPtsehPhbnjNbsIS8h4bqpqlhq9X/q4A0ZTQ4/yqreURyBRcSqYL7u0prmNX40VPBAS4drTwwEtDb1p+zrhSA8pUKxQxir6oMvO3tfIyz9C0EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ym1bnxR0U4vds7SXc2ouMI0aswya4N0rxIF16d3/+iM=;
 b=CXvssv9xSVHt4LWK6I55TFga+dHaAn0Tpj4b39qaLcFp7k+UGKR5OjxmKnLPFfXsVLBUFqC4+QfZ0Abkl1VXQeBIXenBhCqnZoS7c17eKvEFggc3lLO7KJi8wrCuKqbt43s7Eb/cpU7k9Hz8Omzo1tGxCliQG3SxpocP47+JM9WEGjHh+KHXYdSVp9A14uEOW5RsAGmrYdIKKbj4kwZ9u84mfsZ4PH+hTvaLuqO2zncqJdMOCf1e96T1L/s2c+6RMDh7pGnIro9NWWgm5qri8CbD3tET7+fTFsUW48EM+9wchCM8UMlN8KAaNsSSfCYy3yZYGNhrrk7hkECye9OcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 1/6] AMD/IOMMU: obtain IVHD type to use earlier
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
Date: Wed, 22 Sep 2021 16:36:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19ac131c-b341-44fa-1e57-08d97dd66720
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703991ED75CF2D5513CEB9FDB3A29@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XsmVvJo1yHaisw75CefUVryWMfUUYQv6QCQ+7ukYy+Br5/WHAzLmPuCP9UrtMMkbdXI7rF2bf16+2xplxKFCkGxS9KY6FBYQMVBFGzS58gSri05lNxcURJQeDdgsVv1x6Km1rAuWcwblmgM/w/cLJSq7OGzCcvWBeg2EOR8YHkdMtqYSVpMyOdGqWy0Dz49LsR+fejQtyVar0DuNrl2FqZFRrPjTLBkDAV5+WdvCecZLBBLNOKDFowy88K3iGHuZlAShp8yL4D8qO1QCYzK5nSgEhApT9111WQ5qCxwVELe9EGZ3wulSd/2KBoTP0W1JXK/mZwa61iLFRxX0HtEdrZVwsZWAlCNaymOg3ZajLWi8cudro3VogBlwUTrhLq+ikSYUmAD1L/xqY4HjRpZ/wlh31YLSCw7/AoOfwAodvEa+AttHl+CdX4rViqJ+lNRfCTpSqCw1Fl22+GbUdzNTId/VRWJZ8IfEE6YMyiIBB6WHmi48dv+BoTbA0OnPsuCXDWWXRywNMOp2pr5jZz9sHA0V4ZFsel8i0muTifK+Ap5YQ1IJ31x3E+3qjyDKn4VYCq/AU/K6LlK2BEGqVsljAGdTtwHzCvdDFPgsow1jdRphMMLQ73wCUYtxwBxncPUE4+2SXiqpo8kg7jW6NuLoFN0hK/fnqueKyNh/L3GXVvQT5Uvr2JRPp+QF0lMqQTE6sEKJTFAK3S59UXnPHvC5Zqlt1aPg7AqauD/nMGwU3Jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66476007)(4326008)(66946007)(83380400001)(38100700002)(31696002)(66556008)(316002)(5660300002)(54906003)(31686004)(2906002)(86362001)(16576012)(6486002)(186003)(8676002)(2616005)(956004)(36756003)(6916009)(8936002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZisyMDFFU2Rnc05sZkkwSlB3VjJWQ2xtMXRoUk1UL0ZCQnFTbitEQ2FRWEhY?=
 =?utf-8?B?cTl5bnJlY3lIaVNVcTd5ekZuazk2TlhVd09nL1lOOEtndE45dVJCN01FN3Bx?=
 =?utf-8?B?NjZIWkZ4Mk04WFlTL1BoTHVzbUJLU3Zob09yeFh1ZXpwenQyMGhTendGeEIw?=
 =?utf-8?B?M05nbXZ2Smx4Ny85aVlESSt0bTJza1B5UmdGVW5OUUxwTlJXblQ4aTJKTmtv?=
 =?utf-8?B?WWVFUzBnbWlpaWRSbU9RdTZLUWZCYkJPblhEcXlESHNjbnVLMHM3Sm9mODM0?=
 =?utf-8?B?c0cxMmc5RG1oMHJiUU45SllKNk5DOU9DVVo4c3RpWDRSeVZrbGJjYndXMDVl?=
 =?utf-8?B?ZEhSblF3NUI1WGZLdjZlVWNrMXZ1TnF2bTlDdEowVk02ZlkwT0R1Q1lCbDZP?=
 =?utf-8?B?Wnh3K2ZVVTFmS1NtK0ZqTTZBMDYyQkVoclJ2YkF1ajlNaFg1Q1FvWmlPV1ND?=
 =?utf-8?B?UEFRK1U2cmVlM3VKaDRQS2VacXIwL2RjQzkvUC9KYVBwVWloZDQxZ1VpWkJz?=
 =?utf-8?B?ZEp3bWJHM2JPWXFrODJOZ05OWCsrRUp2dFQxRjY4UXUxNkpDNTVpRDF4Wmx3?=
 =?utf-8?B?aDJqOXROdmlQaC83S29RZEZTTlI2ME1DbVVic0V5cm9RckdlQ3owQkU5bmps?=
 =?utf-8?B?Um5GaTJ0WGdzMHlCREdjRWpCNGZLQjBaTXRCekdCeE5kY0JqMjVmVVFtWjg5?=
 =?utf-8?B?OEdESWUwd1NuUVc1WnFXdDNPV0FUTkI5T3JEZlNEUzV5eDZUWW9xZjRoZjU1?=
 =?utf-8?B?VFB0QkJ2SkdVdkR4MHliN204VTNmTVBxZ001UEhQRU5WcC81RCtjZkZKc0V4?=
 =?utf-8?B?K29zRVFJU0R1UzZ0WFkwaFIrYWNVYkFRVndoekFYL3plRS9wVzEzQmtmc3cv?=
 =?utf-8?B?alJaR1NhdmNPRlFKWWxWTzBrOG9KVURzdytJamtFK1dBV0JRUVBIaHlvcHp5?=
 =?utf-8?B?Wi9lYjJ1RXE4SjRiNGszY0tTU3VqeWRLSEU1ZUQya2N2cXlwTkpLWlpudHVQ?=
 =?utf-8?B?WVhEcWNSMVdFY2lvcXhZNXdXZGZ3cGcrOWNuZnNIS2NqN3VKV1pDR2gwS1dx?=
 =?utf-8?B?VXhmc2FEaEVNd3JUYlVxS1RtVFlSN3UzdEFlYVRBUEU1aERyeEIyNXEwcGVE?=
 =?utf-8?B?QTBST09XSGFFSTlIWXBEOTRJZFAxbTR6ZmlKR2NKZEg4aVIxNmZoTEdJYjNv?=
 =?utf-8?B?R0xFSXhJS01ZSTNoMFZMOVRTNStIL0t3dnFxOVk1dDRFa2NLTXlsUEJjSGZp?=
 =?utf-8?B?dTR4SXA4Z3RteEFTdHVBNzlaSVhQYTVIMzN2aGpUdzB0Z3dybnZ1MTlWdnlO?=
 =?utf-8?B?NnlIU2NMbGRSaDlOU3ZpUGo4NGE1OU5aSkRma3VtNWk0eXlJMkN3T29DaUZI?=
 =?utf-8?B?S21NOE9yVkZ0MG1ST2ZoOGtZdTlOTWtBc2c1MGlyR1Y1cmVyVmIzYk9YU2tl?=
 =?utf-8?B?cVNzRVlJaVkyeHg4NjRSd0pyK3ZMc2pOb2NCa0hEeVRWNFJyaytsbVRYbUxJ?=
 =?utf-8?B?dStWK1d4VVlla2VSMm1FbVdQYUtGVjhDaFVONkRLSS91NjFMRGF0RkFBTHBG?=
 =?utf-8?B?QmJ0NHFkMWk3WUhQVWMydGsrLzBDN1E5Z3lyVE52V1R1b0lROWp1VG05K0VX?=
 =?utf-8?B?c05Waml2enc4RkdjZVg5Vll2TmhRY2IrSWUrRUZjdVNWUWJDb1RiaWFBcVhD?=
 =?utf-8?B?UVEvNXNzMHdHTmdsdlhqNmFzN1BRRDUrdGVYdDFZOVZ3Uk5ZRFhGYjc4YkIr?=
 =?utf-8?Q?yUcGbp8MpXsrw91zhCyqyfBmdMEBPW9TDQalDhy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ac131c-b341-44fa-1e57-08d97dd66720
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:36:45.7146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyDf217/hxYrsNVQpZfLa3KgiemEcboMlTiQSQ8Cl/RwRWbYjCZWmBucnQZCw7BLMEwWgQqU/nWoaC5iClSOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

Doing this in amd_iommu_prepare() is too late for it, in particular, to
be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
(luckily) pretty simple, (pretty importantly) without breaking
amd_iommu_prepare()'s logic to prevent multiple processing.

This involves moving table checksumming, as
amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). In
the course of doing so stop open-coding acpi_tb_checksum(), seeing that
we have other uses of this originally ACPI-private function elsewhere in
the tree.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Move table checksumming.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -22,6 +22,8 @@
 
 #include <asm/io_apic.h>
 
+#include <acpi/actables.h>
+
 #include "iommu.h"
 
 /* Some helper structures, particularly to deal with ranges. */
@@ -1167,20 +1169,7 @@ static int __init parse_ivrs_table(struc
 static int __init detect_iommu_acpi(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
-    unsigned long i;
     unsigned long length = sizeof(struct acpi_table_ivrs);
-    u8 checksum, *raw_table;
-
-    /* validate checksum: sum of entire table == 0 */
-    checksum = 0;
-    raw_table = (u8 *)table;
-    for ( i = 0; i < table->length; i++ )
-        checksum += raw_table[i];
-    if ( checksum )
-    {
-        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
-        return -ENODEV;
-    }
 
     while ( table->length > (length + sizeof(*ivrs_block)) )
     {
@@ -1317,6 +1306,15 @@ get_supported_ivhd_type(struct acpi_tabl
 {
     size_t length = sizeof(struct acpi_table_ivrs);
     const struct acpi_ivrs_header *ivrs_block, *blk = NULL;
+    uint8_t checksum;
+
+    /* Validate checksum: Sum of entire table == 0. */
+    checksum = acpi_tb_checksum(ACPI_CAST_PTR(uint8_t, table), table->length);
+    if ( checksum )
+    {
+        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
+        return -ENODEV;
+    }
 
     while ( table->length > (length + sizeof(*ivrs_block)) )
     {
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1398,15 +1398,9 @@ int __init amd_iommu_prepare(bool xt)
         goto error_out;
 
     /* Have we been here before? */
-    if ( ivhd_type )
+    if ( ivrs_bdf_entries )
         return 0;
 
-    rc = amd_iommu_get_supported_ivhd_type();
-    if ( rc < 0 )
-        goto error_out;
-    BUG_ON(!rc);
-    ivhd_type = rc;
-
     rc = amd_iommu_get_ivrs_dev_entries();
     if ( !rc )
         rc = -ENODEV;
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -179,9 +179,17 @@ static int __must_check amd_iommu_setup_
 
 int __init acpi_ivrs_init(void)
 {
+    int rc;
+
     if ( !iommu_enable && !iommu_intremap )
         return 0;
 
+    rc = amd_iommu_get_supported_ivhd_type();
+    if ( rc < 0 )
+        return rc;
+    BUG_ON(!rc);
+    ivhd_type = rc;
+
     if ( (amd_iommu_detect_acpi() !=0) || (iommu_found() == 0) )
     {
         iommu_intremap = iommu_intremap_off;


