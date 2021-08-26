Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B212F3F830E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172709.315159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jz-0007pW-JA; Thu, 26 Aug 2021 07:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172709.315159; Thu, 26 Aug 2021 07:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jz-0007m5-FO; Thu, 26 Aug 2021 07:23:59 +0000
Received: by outflank-mailman (input) for mailman id 172709;
 Thu, 26 Aug 2021 07:23:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9jx-0007fE-Co
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:23:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9183045a-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:23:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-fpEDhM5MMdSUWGBHHzu-ww-1; Thu, 26 Aug 2021 09:23:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:23:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:23:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.16 via Frontend Transport; Thu, 26 Aug 2021 07:23:50 +0000
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
X-Inumbo-ID: 9183045a-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+AQGPZXlT/q+HUDFRoBgG6p5d4VOARNEisvMrjLXMw=;
	b=JL3g3PE8F22YB6hK8OBvJUyuQeCG/319tAsMVUHV/05K4RJgeTzjLpun02lZwr4AkHtlXI
	9uAKiTu4VeI1uXgI0QHmPVXNvFVKHjdtMxtH7WXtCYX6HlNyMwx0LY/Fqw+jQmlX67ltOp
	05r0T9Khey6Ws7FU0SJWgxFljn81+z0=
X-MC-Unique: fpEDhM5MMdSUWGBHHzu-ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZm1PEuSujgc1sZ2YVisi9d5gRxaczNpftBRxOyqXO0lOhhfwjCd+9YPJr2jI4UEren1j3CPZydSqfGiZsRT/srffBhyzjYCXcdCr0MoObZotEy+jTdmWPe9caCn4zamkgpEMxY/P9t0srmi6+goX7DTPsG19A/3gchC8t03RcTq/ZmhA/YJVGsjK5GfbgDum5BZB3RkhUqdpITSMMuEniaQWKBststp+0MehsyJXQValUmzEi8gmzuSkkgkWOoplHe41OZ+sFIDzGtSa1WJT4G+FBoHiS6adz/A6mfh/l9GDX4wSYi7zIsiiA1y/V4iddjyh3nkCPGqDIs5W123+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+AQGPZXlT/q+HUDFRoBgG6p5d4VOARNEisvMrjLXMw=;
 b=laigmezGGWzoV2/fbtF0TYH7UGSZFMRZZNdYRQcESzXN17022n3vP7INJUvwzIU6FipoPcZqhuANJ829AOww7wr9sTLi/YlF/slw4tysWQbY3uQBNfISg3VU/vNsYXfGjSWXJKi4XoNLF0srf7afNDHpK2QMkWdpaZYpguSIikFeLE8VpiHN/vGYpeGxR2okjAmaJul9q4r/+hUstinf1DWif7A+yZtcbZzbgQmtHmSrKHB33MaO5rODcH8EgxCWxAw3X+GnD8Kt9Q5EOiN5u8HVaK4Sz2IxNUej0j9JX1z8r0UdJskFrNMFTq1pYwfZsyQJ87aWWdKiI93APGBzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 3/8] AMD/IOMMU: improve (extended) feature detection
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <6b6b287a-c5b4-06f4-6f7e-78273cb74d64@suse.com>
Date: Thu, 26 Aug 2021 09:23:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a97364-73a9-4af1-63c6-08d9686273f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715293A01CC44BE2E73B4865B3C79@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/UovAcgjOUVqYjRcxT9xkNangV4ffBAg2jb6qKGayYRTWT1UUyg2nHVifjqfhNkOfEClrlvbaQlumSuQl8cT1mPlr0LHUqV+gV+ZT/f1d1ZtetARV1ffBpxJSd6vmYskaHxurNv0AcyTwPDNjDDjGI5Q0mx24DCkY672yw3Z2QmBw6W000nSc5zQjusq6BBFErKjhGy5a5nLXVbdAp1uPnbEJirxVgrEjc/kgUxVlUcHLlBioNZQTtmsmkDQwg00ZeOYVeHzTuOFJO7SltVlvHds7ba4BR/eyXQYxUzaahX15d9SRlYx8KzTdyDmQK4TEUK2gIwcAXtoe2Cul9Ac4jLvdi/M4tO06vutPo18HPc4FmzJEZKzyDPczTX7Xq+hdbE4HHpvA2eRGVQ6n0Imfw/dCdY5cQSg1svOy9aPSYIOWMr5TzEGaM6bw2v4ybHA9UCxAtfF4NpNYlq5goJsbkkEBIaSue7uuF+JL8DYlrfCxWOVwzKXdGaeKXxnPIQJ8gx4oZd5zqNM3PCn+TdEdbJm7TSWIoIpH7Cw532hnCRSmHamOju3tF62MNSkI463I5XWUgufkj7pz2S08gITp01CDMr3OPSlM+ujb6D812rCasI0f3AzfsQzhRhnns25Y5kKN5QZcP6DdNldXgl/g5nfrKMPvSHDq/o7+KgPoKU0vxE7BUsHAKGaUCKODY3TkTMIzgfQ/dsah/abimX+olMMvJILBxt/NZB70xurWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6916009)(2906002)(26005)(5660300002)(4326008)(8936002)(6486002)(31696002)(83380400001)(38100700002)(86362001)(54906003)(66946007)(31686004)(956004)(66556008)(66476007)(498600001)(8676002)(36756003)(2616005)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01ZNXNnUEhGdnI1c2xCQU5ibzlXVlBzdUNNNkZVbmV2UCthRVh5WmdaamxG?=
 =?utf-8?B?eFkwSkh1cmZjVDhhUlBCQ2JzRTZCMzdjMWNaM0prbnFJbnl5aUN5MHB6dVBs?=
 =?utf-8?B?SnVqMDZHanBmaTR2VlZIME9UWU5mWXVucjBEem43YU5GUWNvUmlEMGwzSWxk?=
 =?utf-8?B?RjU4WDNLVHVRem9GcG4rdTRoY0N2REFZMmpiUThQdy9WenRsdXZtNllSd3Ix?=
 =?utf-8?B?QXlLWDI4ZnNaOXg0eG1nanNlKytFdDNEU2hXcGVRMC81S0lEU3dXZGZvc3lK?=
 =?utf-8?B?RS9tQU8rZFVYQW8xNlRBQ0kxY1dZVmR2dkwwVUxPWTdrL2xNcUhvc2RpWnIx?=
 =?utf-8?B?amdiVFg4SkFySGFqREhrVEtnOGMxejgweGowRE0xVDRxMkdOZlJXeVl3NkpG?=
 =?utf-8?B?STBsdm5BZndBenp1UDE2KzI3dU9GdjVZdFpPT2JrcXBKbEdGQUNVT09MWjVs?=
 =?utf-8?B?cjd3SGdsanJxRHprUitLY005TWVWUEVWcmpDRDgweHI1b1AvOU16cFR1dTJi?=
 =?utf-8?B?MVd1Z251WXRScXhTWUV0T1RlQU0zV0lGV1dyY2dCSVVKSTlrd1hsZTJTRUVh?=
 =?utf-8?B?UGN3QWJ4OUtvRUpZdjJkS2hMUGhJRm10cU9YalI3bHc1amluVUd1a1VEK2R1?=
 =?utf-8?B?dEV0QUV2WDJUZkJnWEFnaVdsN0loakgwL3hQcmpQak12OWxSanBMamtSZkk2?=
 =?utf-8?B?d0tGMGhMOU5KQnlEMlBQVk1XQVVmckMrNE5reExHeE10dGVaYjJPU3FXQnZJ?=
 =?utf-8?B?QmpBQ0dQcmh5cmlzcC82Zmp0TkhJSmNWZUpBQWNZWDQwVzh1cjVYZWtKZUpu?=
 =?utf-8?B?TDJNV0NvbzBhZXFOdDE5Mkgrb3BpcnlHK0FOY3FjTkdGd0pCTXJzSWs4aUFJ?=
 =?utf-8?B?MmZGL2ZSaGpOR3dTY3pRRWRNN2VUNFM5OFc1eHc1MGU4Tnc4UGdvbDdmaUNV?=
 =?utf-8?B?VS9zMnNrN3p5NHQ0R0pVVERteDIrVzRzT2JUMzc2Yzdzb25DTmpvU3VRazNa?=
 =?utf-8?B?cjVNYjh5cVg1N3pKUURGTnVpWHhuUGdkNHVteHlzLzY1dnkrejRWVXZtTjNj?=
 =?utf-8?B?Kzl5ek9YaDl4aEd3QjU5Vit5Sm9GSVNFUGYwQlZzNG9QbXVyNUhWcVpzV0Ni?=
 =?utf-8?B?eXJOMHVXUllSSnA3ZnV5cU85YzNLZlptbTRwMW80SG5NcWF6Rlpwa09yd1A4?=
 =?utf-8?B?dC8vREtXTEpINGhwMmZ1SWwyd041Y2RCdUlvUHZkdnhQajB0TnJkNytodXVZ?=
 =?utf-8?B?SEY4RXZ5YSt2Q2svaGtiN3hJWEN0aG9PQzFzNzEzZVRuMTJEK09TVXVpalFK?=
 =?utf-8?B?ci81cEx0N3FySjVtVlh4WkwyT0k1TGVoOUZlb3Nsa3FLY2ZaUHhSMmR1MWNG?=
 =?utf-8?B?U0hnSndNbUdEYjZiV0E1dEFjUjYxZWNKRjZBOGEzUmtmMEw2OWpmbXNMV3ZQ?=
 =?utf-8?B?UzlJL2M4MW1XanNQKzVZcmFCZkpSa3lvc3FlL2MxL240T0RidmFPM3NyMjNa?=
 =?utf-8?B?ZGJndHFTa2F6b1diRlNTTVJhZFlOb09jZ1c4L3dqcDhGcUJvNzZ2aUw4ZXVt?=
 =?utf-8?B?K0QzZVFWZmdnRmFIa3lYRlVMRy9GRkg1ckQ0VktNeGRKcHBBZlU0cTFNa1N6?=
 =?utf-8?B?cUVUeFNEOTZZYmhDVDBmeVZ4YWx0elc4cTVDaWhDdEpXWWNXME5YU1k2aXRC?=
 =?utf-8?B?RlBjVmkwU0xhYi91ZC81RHpXblZIVkVhU2NSZlEvUEVyek1VaTQ2VnhsQ240?=
 =?utf-8?Q?2U+3TjlrnM4vHjvWOivZ4TViRfVPfj+j7rIdv/i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a97364-73a9-4af1-63c6-08d9686273f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:23:51.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cENxci0p7d36V7XJM92kwyNkKPxpitQLf+oGo7S194NcVYQ6629j1Lsf30CIL+oLUfEzihzQuBCprLZW8O10qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

First of all the documentation is very clear about ACPI table data
superseding raw register data. Use raw register data only if EFRSup is
clear in the ACPI tables (which may still go too far). Additionally if
this flag is clear, the IVRS type 11H table is reserved and hence may
not be recognized.

Furthermore propagate IVRS type 10H data into the feature flags
recorded, as the full extended features field is available in type 11H
only.

Note that this also makes necessary to stop the bad practice of us
finding a type 11H IVHD entry, but still processing the type 10H one
in detect_iommu_acpi()'s invocation of amd_iommu_detect_one_acpi().

Note also that the features.raw check in amd_iommu_prepare_one() needs
replacing, now that the field can also be populated by different means.
Key IOMMUv2 availability off of IVHD type not being 10H, and then move
it a function layer up, so that it would be set only once all IOMMUs
have been successfully prepared.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v7: Re-base.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -304,6 +304,7 @@ extern struct hpet_sbdf {
     } init;
 } hpet_sbdf;
 
+extern unsigned int amd_iommu_acpi_info;
 extern int amd_iommu_min_paging_mode;
 
 extern void *shared_intremap_table;
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1051,7 +1051,8 @@ static void __init dump_acpi_table_heade
 static inline bool_t is_ivhd_block(u8 type)
 {
     return (type == ACPI_IVRS_TYPE_HARDWARE ||
-            type == ACPI_IVRS_TYPE_HARDWARE_11H);
+            ((amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
+             type == ACPI_IVRS_TYPE_HARDWARE_11H));
 }
 
 static inline bool_t is_ivmd_block(u8 type)
@@ -1159,7 +1160,7 @@ static int __init detect_iommu_acpi(stru
         ivrs_block = (struct acpi_ivrs_header *)((u8 *)table + length);
         if ( table->length < (length + ivrs_block->length) )
             return -ENODEV;
-        if ( ivrs_block->type == ACPI_IVRS_TYPE_HARDWARE &&
+        if ( ivrs_block->type == ivhd_type &&
              amd_iommu_detect_one_acpi(to_ivhd_block(ivrs_block)) != 0 )
             return -ENODEV;
         length += ivrs_block->length;
@@ -1299,6 +1300,9 @@ get_supported_ivhd_type(struct acpi_tabl
         return -ENODEV;
     }
 
+    amd_iommu_acpi_info = container_of(table, const struct acpi_table_ivrs,
+                                       header)->info;
+
     while ( table->length > (length + sizeof(*ivrs_block)) )
     {
         ivrs_block = (struct acpi_ivrs_header *)((u8 *)table + length);
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -60,14 +60,14 @@ void __init get_iommu_features(struct am
     const struct amd_iommu *first;
     ASSERT( iommu->mmio_base );
 
-    if ( !iommu_has_cap(iommu, PCI_CAP_EFRSUP_SHIFT) )
+    if ( !(amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) )
     {
-        iommu->features.raw = 0;
-        return;
-    }
+        if ( !iommu_has_cap(iommu, PCI_CAP_EFRSUP_SHIFT) )
+            return;
 
-    iommu->features.raw =
-        readq(iommu->mmio_base + IOMMU_EXT_FEATURE_MMIO_OFFSET);
+        iommu->features.raw =
+            readq(iommu->mmio_base + IOMMU_EXT_FEATURE_MMIO_OFFSET);
+    }
 
     /* Don't log the same set of features over and over. */
     first = list_first_entry(&amd_iommu_head, struct amd_iommu, list);
@@ -164,6 +164,42 @@ int __init amd_iommu_detect_one_acpi(
     iommu->cap_offset = ivhd_block->capability_offset;
     iommu->mmio_base_phys = ivhd_block->base_address;
 
+    if ( ivhd_type != ACPI_IVRS_TYPE_HARDWARE )
+        iommu->features.raw = ivhd_block->efr_image;
+    else if ( amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP )
+    {
+        union {
+            uint32_t raw;
+            struct {
+                unsigned int xt_sup:1;
+                unsigned int nx_sup:1;
+                unsigned int gt_sup:1;
+                unsigned int glx_sup:2;
+                unsigned int ia_sup:1;
+                unsigned int ga_sup:1;
+                unsigned int he_sup:1;
+                unsigned int pas_max:5;
+                unsigned int pn_counters:4;
+                unsigned int pn_banks:6;
+                unsigned int msi_num_ppr:5;
+                unsigned int gats:2;
+                unsigned int hats:2;
+            };
+        } attr = { .raw = ivhd_block->iommu_attr };
+
+        iommu->features.flds.xt_sup = attr.xt_sup;
+        iommu->features.flds.nx_sup = attr.nx_sup;
+        iommu->features.flds.gt_sup = attr.gt_sup;
+        iommu->features.flds.glx_sup = attr.glx_sup;
+        iommu->features.flds.ia_sup = attr.ia_sup;
+        iommu->features.flds.ga_sup = attr.ga_sup;
+        iommu->features.flds.pas_max = attr.pas_max;
+        iommu->features.flds.gats = attr.gats;
+        iommu->features.flds.hats = attr.hats;
+    }
+    else if ( list_empty(&amd_iommu_head) )
+        AMD_IOMMU_DEBUG("EFRSup not set in ACPI table; will fall back to hardware\n");
+
     /* override IOMMU HT flags */
     iommu->ht_flags = ivhd_block->header.flags;
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -29,6 +29,7 @@ static bool __initdata pci_init;
 static void do_amd_iommu_irq(void *data);
 static DECLARE_SOFTIRQ_TASKLET(amd_iommu_irq_tasklet, do_amd_iommu_irq, NULL);
 
+unsigned int __read_mostly amd_iommu_acpi_info;
 unsigned int __read_mostly ivrs_bdf_entries;
 u8 __read_mostly ivhd_type;
 static struct radix_tree_root ivrs_maps;
@@ -1375,9 +1376,6 @@ static int __init amd_iommu_prepare_one(
 
     get_iommu_features(iommu);
 
-    if ( iommu->features.raw )
-        iommuv2_enabled = true;
-
     return 0;
 }
 
@@ -1419,6 +1417,9 @@ int __init amd_iommu_prepare(bool xt)
             has_xt = false;
     }
 
+    if ( ivhd_type != ACPI_IVRS_TYPE_HARDWARE )
+        iommuv2_enabled = true;
+
     for_each_amd_iommu ( iommu )
     {
         /* NB: There's no need to actually write these out right here. */
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -716,6 +716,9 @@ struct acpi_table_ivrs {
 
 /* Values for Info field above */
 
+#define ACPI_IVRS_EFR_SUP           0x00000001	/* extended feature support */
+#define ACPI_IVRS_PREBOOT_DMA_REMAP 0x00000002	/* pre-boot DMA remapping in use */
+#define ACPI_IVRS_GVA_SIZE          0x000000E0	/* 3 bits, guest VA size */
 #define ACPI_IVRS_PHYSICAL_SIZE     0x00007F00	/* 7 bits, physical address size */
 #define ACPI_IVRS_VIRTUAL_SIZE      0x003F8000	/* 7 bits, virtual address size */
 #define ACPI_IVRS_ATS_RESERVED      0x00400000	/* ATS address translation range reserved */


