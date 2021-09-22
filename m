Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D25B414C2E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192865.343572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3N2-0002ar-E4; Wed, 22 Sep 2021 14:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192865.343572; Wed, 22 Sep 2021 14:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3N2-0002Xt-9X; Wed, 22 Sep 2021 14:37:12 +0000
Received: by outflank-mailman (input) for mailman id 192865;
 Wed, 22 Sep 2021 14:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3N0-0002Vd-2a
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:37:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7eb2009-6179-48fb-8483-cfefde1d690f;
 Wed, 22 Sep 2021 14:37:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-6qAaoySUPVKlzxJtqDs2lw-1;
 Wed, 22 Sep 2021 16:37:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:37:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:37:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 14:37:04 +0000
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
X-Inumbo-ID: f7eb2009-6179-48fb-8483-cfefde1d690f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/R2l8vt0G8tNtmvPjl7fZ9gXSFTbwJmfLkNFVNLpmQ=;
	b=UhWUHBgxNCSleBHMj3V20uOMsPZX+2Yg03bHwtvIQCaGgbhiqxSYgP6nKOQxdBnSg76wlh
	2WX3i86FjqAVCnlXacwsTQjmKYcHhIEBAc2gPBEhoGBxzHLGJoJT2la5pDuhaUTuUrD6U9
	v8XNA+35bY1IE39DuErdfyU320jFEk4=
X-MC-Unique: 6qAaoySUPVKlzxJtqDs2lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z66vj0047mTU5EESP4sULXQ1MS0tNDiLIZ+//m6n5PWRgvUIG+Q1WUaQewKNnIYaAnEyDx38+oUvm9sdslKOnqnMxjJYcfDol7VuH3bIEHJfxfhTihgw0dUD+YKuZ8ckXd7h+GcmE+vA9GYfmot4E3sjexdU0ECBACudaCG3oXY/2HocYmsxNnrkxImZJ0RNNKl1iCrI7EIeoD75q2jorDXEG4/Hm6xsRYBarL80Qs145D0Q4XAlDn5D4eTTuDq4Kb9/uYNkjMnu2T28O/Xk/xqQgK14zdMZKVltJBzsz9OUh9dsqr4Y2318/hFi0JDbxWtuYX+kVy4g1vJMvt8tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+/R2l8vt0G8tNtmvPjl7fZ9gXSFTbwJmfLkNFVNLpmQ=;
 b=V/CEU36JtINRpARvKMBYbVRo7osmTGzMeBCn7recrtS0e/9sLuPQyo5MFibi9mNEDY7OyP2/9xWwYcP3+N0ZIRBV+QC771gf8t9ctXW1QpRGmP3NC6Y5y1G1rOSGRCmHzVVA5zWS+RnL1GKye5zPFzWnEm8h2HoXxmtmDsrHHmlHQgc31ljHbGggsf+D4AzNOB0UzDOrix77/qJUZvwWUDa11uFijvYKg5mpHcqYxPOT+ZDwWBnhBdzqsXl7w5mtxZqNQY//hH4HCuf9KGTo5taUT3jFmdMVrtw+Cw4I4U6Qkv9nDugo+9BIL9Z0fTMk/OpcwzA7gFfPLY/pmIMINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 2/6] AMD/IOMMU: improve (extended) feature detection
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <4e2034ee-a074-a321-ccbb-9e36c74f0060@suse.com>
Date: Wed, 22 Sep 2021 16:37:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0f66931-a73b-4102-a62e-08d97dd672c7
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C103B7A1A9B7865E25B1B3A29@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rg/HDUgGphnXEsx061sn1RpxYlO11XJv14xpB6aKFSr7OzqtW5PG49fKEU+OZAdIUWv/QCFspjiBOG2nVhtd4aL0Kt5vmQdV2KW1EZullR5ThDUOlJET1/FaTXUMjhNUdxp3DoTExtxeWW2LA4qTekl4x5TGEhNganNQCngIXb2SszuOtH77AeaMyrZtzUXK7Bqu7VFwDlJHLtNYavhLvQGYfJ4EoPMam75DuqFuVNifGkhGBnMMLowxZG1HI4qgxGEERJlUiaqH7xtXQNf+M8+/q0JQAbTp3om2uDfhTOPzQ1BAjsta+HKbtpGw7kEcSkbokKcvmOmG3GL5BB97E5B0kl02bFE0PTUOb3OqrHlhW3gYEbaV30O+nIS2oPSHbl+Q8OpV2daNnQ0b+7YHKR7M75RU0zdDHSOkBwmSmHy+M2tJwOL7RkenqdIoVkyTsDMKh0qmvTwr50F1AgtpopwAmUeHQ41RN8qRatb5d3s7MBPhIhAUsOR89LZGA1yTn3WxboUeiWB9s/JdcYbBurXIPNCEaVnZ0lTmIGLEBMNPa4S/SqvLQ6Bw3f2L0Ky5bj71nQ/oxB0e+rS0/WBlj4bq1e//QMFK4ogPBuBSNQ5A/SVnEKvNJnPAgdUBhuaO19yEyT0IA5N7epWrzvAXECsUFFmlDeidCmWdvtc/Tkz1fEjJx+TMmD93fzi1t6Vh+xhnt5KFAKvGJBIjuwYoF0LMUUAAYSv4VDONEmUA/yY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(16576012)(2616005)(316002)(6916009)(4326008)(66476007)(2906002)(508600001)(66946007)(86362001)(5660300002)(956004)(26005)(186003)(38100700002)(54906003)(31686004)(31696002)(8676002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDE5anpyMkVIUFl1RWVxRG9idlM0SHhIMVEzaWNRZXR4RTM0VTdIZCtlSmR5?=
 =?utf-8?B?V3pObldsM0s1N2crN1BmeHh2aDFGbmMyK2hHSEh0ZHhNaGgwWEpEL2pLbS9o?=
 =?utf-8?B?bDd0N1phdVRkMDNUMmNDcFovQ2kvSGVBU0RRLzZ0N1diRTJWR2hDbEhxbWlY?=
 =?utf-8?B?aDNEbnB1T3Mxay9MTGQ1NUxpUk5PVDNKWW9mUTEwcE1rWG4yM1l4Z3piU3p0?=
 =?utf-8?B?NjQ4d201UEdSUlV1QTFBSXh6U3lDUWdzcXZkcktscWlGMzMxdVNGclNkaHBi?=
 =?utf-8?B?SDNuOGxickcySFp4WTJNb3AyN1cwd0p0Y2h4LzJadDAyaUZkZE1QSk9UTFdS?=
 =?utf-8?B?bE5Va1pVSkJDUkRkSW02R1U5ZUE5QXRkUzM2elpaNUtMSHlNZnlWL1ZPeTFv?=
 =?utf-8?B?UFk0SmdCeUFXN2hZUjZUdWJtV3p5TkxCZmp4bG1CbVZuOUhscGZLU1FUZHlI?=
 =?utf-8?B?MklNMExxTGRFMkFKcXQrME5tQVE1Q3EvbVlLbFpBaFR5U3pPK0ZlOUJjRC9H?=
 =?utf-8?B?VEtRN09mQnQyaS8rR0dzeHB5Yy96NUZsZkdDK3RaR1ZnKzVvbW03TFdWeFJE?=
 =?utf-8?B?bmJkQWptOVdJeCtkRU5BakVRamVZMUorUGFTVnVuUmVobnV2R2l6dkQvZ2k1?=
 =?utf-8?B?a2RVK2lKanIrSlZMWXZaSXpSZ0lJY0t2ekxlWnZrem85RlM3cGhQOVhzeXdO?=
 =?utf-8?B?N21tVWQ2b0dyTlBNekdhTjJjNzUxRjVlRmo4RUpabFcxaDkrRmdHYTRnOXVD?=
 =?utf-8?B?VytYRG05TXVXMUFxdHFMaW5KNm11aTgrVTJmRmwzazF5c2VidU9uQXduK0s5?=
 =?utf-8?B?LzJ4UG5tYWJqMGZ1bEF0MjVDT0V5dzBDd204NHVyQnRMQ25DUVVYSkxvekp2?=
 =?utf-8?B?UGxRb1hyL2ZEejBaOURRTWFsZytmc0FJTW40Qk5maTNRRkhzRmtseVFWc3ZI?=
 =?utf-8?B?VGpITS9MWEFrYlRJWmFwbDlYalFCenFma0hSVklvTUxKdEdQYkhQTFdRQmpa?=
 =?utf-8?B?TzE0SFVaUXpmbUZqTzlWOVZYYjBMSElURzhDQmhlOHFyT2Z2a1VqMjNjZG15?=
 =?utf-8?B?TFNQT3NkTkw4YjgwVllhbi9OaUFFbU05MXZ0eStadHRSY3JWd2V0OWp4eGdw?=
 =?utf-8?B?T2JCdG1Zdy9zMXJnQW1DQ2IxOUlHYWs5VUJtWjlkeXcrMXdCNmc2a1Jma0wx?=
 =?utf-8?B?aUZocW5GOEhjVk9POFZMUUtxT3V5eCswZGJhdDBpTTZ2UFZzN2tJNlIyRm9a?=
 =?utf-8?B?Yit0dC9LYmlPTmZxU3N6VnJRK1lTQ3BUTStSWU55ejZCL0RMNTkyN2h4aUc2?=
 =?utf-8?B?YVlNdHRPbEVSTUUvUkE4RU00QyszdE82aWNQdU1SSklFSHZ0d0h2MUV0cGVN?=
 =?utf-8?B?alpDRWhSelpFS0dQMXVhb2VlN01tNGJPU2ZnNWJFb3dBb01QenF0MlZPdUEr?=
 =?utf-8?B?cmZOUGJsUFpoZGxNaEJmZ0dNanFIYUtBM1NicWJnYURMQURvdkNpaWJhM09n?=
 =?utf-8?B?Yll1bTFRSmhBZEZ6eHVEWWhIUlNjRFZYdVI4ZlNHS2l1MXdYTjBkM0JHdU02?=
 =?utf-8?B?NUpJdVdPclF4NVJuZkd6L3c3OXh4Ym5yeW5FMHhvdzZQbEc1djU2L2RwTVZG?=
 =?utf-8?B?ZytVRmVMNkUrYm1kNjcvanNpMStVd3A2WTBFMCtOSHhITlhxOWJFVFNnV0tF?=
 =?utf-8?B?V1B6MDdXWjVHOEI3c21tMWFXR2hiN3FFQVlGaGNwRlc5RUZWWTRFaUM1WU44?=
 =?utf-8?Q?wNtEcbLD4ZggM01PucIgeJCSxAPuPzsq8mXsU/w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f66931-a73b-4102-a62e-08d97dd672c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:37:05.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoeSJrzDEo4+5cvD0xN2/E8RnEJXjqVKUUuIl3cptCLyi5dKnjhy/sQdYijLMSbBVKpoKsTR5Sc4CUA/y0inIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

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
@@ -306,6 +306,7 @@ extern struct hpet_sbdf {
     } init;
 } hpet_sbdf;
 
+extern unsigned int amd_iommu_acpi_info;
 extern int amd_iommu_min_paging_mode;
 
 extern void *shared_intremap_table;
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1062,7 +1062,8 @@ static unsigned int __initdata nr_ivmd;
 static inline bool_t is_ivhd_block(u8 type)
 {
     return (type == ACPI_IVRS_TYPE_HARDWARE ||
-            type == ACPI_IVRS_TYPE_HARDWARE_11H);
+            ((amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
+             type == ACPI_IVRS_TYPE_HARDWARE_11H));
 }
 
 static inline bool_t is_ivmd_block(u8 type)
@@ -1176,7 +1177,7 @@ static int __init detect_iommu_acpi(stru
         ivrs_block = (struct acpi_ivrs_header *)((u8 *)table + length);
         if ( table->length < (length + ivrs_block->length) )
             return -ENODEV;
-        if ( ivrs_block->type == ACPI_IVRS_TYPE_HARDWARE &&
+        if ( ivrs_block->type == ivhd_type &&
              amd_iommu_detect_one_acpi(to_ivhd_block(ivrs_block)) != 0 )
             return -ENODEV;
         length += ivrs_block->length;
@@ -1316,6 +1317,9 @@ get_supported_ivhd_type(struct acpi_tabl
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


