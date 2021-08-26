Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BF3F8311
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172716.315168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9kX-0008Q0-SW; Thu, 26 Aug 2021 07:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172716.315168; Thu, 26 Aug 2021 07:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9kX-0008No-P5; Thu, 26 Aug 2021 07:24:33 +0000
Received: by outflank-mailman (input) for mailman id 172716;
 Thu, 26 Aug 2021 07:24:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9kV-0008NV-PP
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:24:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38bd158f-b105-4184-a6ec-eaaeeb9ecf22;
 Thu, 26 Aug 2021 07:24:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-jsBH0EbaMP-U7gVo95GfkQ-1;
 Thu, 26 Aug 2021 09:24:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:24:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:24:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:24:26 +0000
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
X-Inumbo-ID: 38bd158f-b105-4184-a6ec-eaaeeb9ecf22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xINlJPtDCs59wvZIeRANQBo6bVaMXa5EB985oaSKF4M=;
	b=hqGs8UGe1UxyfUBCzi7Msro0YEQ5Ilc0IcfJk8lVzV01JiPf/nsR0jIshsdgDfud1gIohe
	pts5jcz8yUIpJn1h2+gpSdVNpMSiE4HLRW93caGD2JxC4debUEangJLwYOC0hSdufub2eh
	2VCuFd40CDb9nHAc3iV6sXPFqCb67Wc=
X-MC-Unique: jsBH0EbaMP-U7gVo95GfkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Atk1+LhbjV5PrJZvGKUXo8H23bRZaIdSuU7h3hFcU6mgzySuZf4ksSNINkdSLkPzafvhk3ff0qOlz0JIvDix2juQFoYV7H4i+541UT8H//h8aEgYKmoo7oqYBKf7CanG8hSoG0/hJUB/7iEzAFlZ1w8Mt9I2gcJg3YlubmV1cqZzYwyetuo7O7HwKmlrdqHBX95nwHYklT2HCrbckIUbNe8b/A6ATRiKRji6XDQufT7MHGFBjr3ghwR6x0xG3MLcauSHDkQORZhqL58rdx4Evq7kN5UrxBQKlyl+cv+CAe30SMdDpLN7mArz2Y+yMhpHb4ABLrik/LVJTN7DlKLpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xINlJPtDCs59wvZIeRANQBo6bVaMXa5EB985oaSKF4M=;
 b=cre6GnW1rxVpO7Vvtd1qf3zqAnDbD7nKD8xW7nmRFZLgi08/09cqS9VV+7G9vtiDScVoX7MBw/kwwfp/mT7BhOJ+yQkv0nebVMhkIJXyOnB9EcAVRjzOdFuVB29casUHbrmoWW481HU2uKSvShyEzrMi6aBfHoyyedRymv9z7PPgbp/qkG0h0+a6toq5HOAcz1cv/jkd4zkxVC7/maPdALtlsiERz6dD53onUCXjJIYqbMFBuqbLOq91nj9eb6ZN8zvHc2XLuLH3+NklcF0bHPpV/LDKRbY5JW7sSh52YdFTC9lj7ihigJa99PK7KUvr+gX6IblZHOCPB5RmbPFwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 4/8] AMD/IOMMU: check IVMD ranges against host
 implementation limits
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <c0b49a0e-44fa-4e15-ffb9-d49002060edf@suse.com>
Date: Thu, 26 Aug 2021 09:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30ccd12f-3c8e-44af-14d2-08d96862895a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118B9C1977DFFCF22B6ABE1B3C79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UZoeNOB9g0radsWRxhYK934mPpmZN/8uZUa3vIBKixc3eaMXhnM5iUVfyP71NduDRuch7Boeqv9XWyARVKt4ijZiD2hwt9ia3igwDzj3aM0k4vGBnGjhxDEUaWIzOlLPfiPpNM7PcxBlYhzQ8w81uTQJb/ZtXDkKjYQfSx/APkf4h/QlmqmZSj/5bZUsF9yqRZG4ic6gx2acshiN3Lk+N/cUeIx1Fijf4j1QZz37FGX7yPfp2Hn1oV28UPpfGeLVMxAOVhrsbSwqozSzF/P1CWHP2N6YO7f19hF0ZLlQn873uscnDFhVBVv3YMskbZ9pUQIVBTXj2tVgYofsVfJ2w/C7Qsg5y24Pa9mcoVwOJsDJg79iSk3KwSvkfzVJIpoJfqtlIMqtSE7exMQyX0Dq45qPEtnkNjY6R3utM9Bf9qakX0xKiaKbWWSp/QLmXNGW3JoJm0UAp73cER4VINscLRGkMPsruAQYBk+42pKwQ3/oCNcH1gGtfgRdZl53BSwIlh31HJbxyobe1rA9Ar1bMI6mx1z/sPEaMTOfaWOu1QBpC5svvr8UVUNQSBLzYeU0llyl0NY9tNlCG2uvrbiUh+gbOMDgKH/Db4kySkZtU7uba9N8V31txq9N439JbkCFF8a5vKhIQJ+R4WIRwIISLcKBXt/dGSldAyz6H4kjU3rso6yP19i0AT+H+iSXrff3siBkiZHLqKVzoERiu2osG2SYN189EIyGXexOvjNQRpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31696002)(83380400001)(186003)(86362001)(4326008)(6916009)(956004)(2616005)(66946007)(38100700002)(8676002)(2906002)(6486002)(8936002)(66556008)(66476007)(31686004)(54906003)(16576012)(36756003)(5660300002)(498600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFBCdnNaTXRPK3FuY1RwdjFadUdEaW1zYXdkTFVhdlBrY29QZVpqa0hsTC84?=
 =?utf-8?B?UnFSNlFtT1BXQUt4NXRJNjZpdkx5bUw0cHcyTXN3ZHZodUR2T3hWbzlZa2pq?=
 =?utf-8?B?SDY5UkcrVnBnN2s3MENxYmpjcmRHRWg5MWR2R1FsTEpYUUt0KysxU0hGeHpp?=
 =?utf-8?B?c1hEY2I2RVU3cHZ2dWdlWXZUUUMydmZBQWNjK05PWitPTnY0N3MzS2YrOS9T?=
 =?utf-8?B?UVlmVDdoUWNOR21NYWlPR1poUWZpcnFQNlRiWko3ZlVrektvUG9oeU1lTDIv?=
 =?utf-8?B?WmFpKzFpdThLQmkyUllVVHJQbTFXckUxZW5DSGkxQVFZRm50ZDQ1ZFo4YjNS?=
 =?utf-8?B?UlcwQjg0Tmc2Wndyd0tWSVp5YmNUY0lEQkxqQjk5QmQ0UDJha0ZCSVRCMStk?=
 =?utf-8?B?MC93d0hVSEhOZGlmSW4wRFg5eUJHNTZNR2NmNi81aFowMmJkN2ZEcVYyQXpt?=
 =?utf-8?B?T0VTdkFUdXF1eFFMei91NTBjKzgwekdyWXFmUVJTQ2xkRzIreHJWNWhwdm8w?=
 =?utf-8?B?dFk3N0RiS2RZdVg0MlpCWGdUaW9VRnpoUFNHVVkzU2hHUmI4MEt4eTQrMXBS?=
 =?utf-8?B?THdQS2RsNFk1cG1VWkZrQS9CVnp6WlgyQ0pIZEFOeWMxMWxVcGNRTVpXRjA3?=
 =?utf-8?B?aC8yZDlhWEhYbTVmanJPWno2eTNLVzJKdXEwYllZaVJLaFFDWHAyTXJ6aFVM?=
 =?utf-8?B?c0w0QlpZcGZtbWE2OHBEQlNPWnJlS3pObWNISnZpb1QyR01mMXo2dlArcExo?=
 =?utf-8?B?UERINGtPVUFjOTdXZnpadUQyVm9iUG1ackY5VDZyLzVCSHkrMHJoZnBoRlRM?=
 =?utf-8?B?QkZ2WWhnQ296YWNtbC9jWDd5UDNnZzQyVjdMdnFwNFJZVjlxcGM2T0d5dk85?=
 =?utf-8?B?ZEc3dXhLTnRlQzZiOEJjSEtYbFgzUWREZmdLM0ljU290MFQrL0ZjNXgzU0Fi?=
 =?utf-8?B?T3dZZ3c5S2xkRldGQ3oxdkJEK2MvY1hNOHNVOWprY2VZRXJqS2FvSlFJV3Nu?=
 =?utf-8?B?NkhQYnB4Y2haaVB3eU4yeXEwZVdGbjg2SXNObThwVy9QK0ZiQ255aVVqdEF5?=
 =?utf-8?B?eUR1M3RjUnhKbFMrK093d0cyMGR1T1B4L2thUVpDQkFadEQveldwUGVxcHpU?=
 =?utf-8?B?TU1hTis3aGpnS3pHZXd0a2lBY0h0RFNRMWtpSlMrS0xkTE1YeUxVVEcrZFgz?=
 =?utf-8?B?dE5XUGFaSHBoZDRDdVViM0NwMGd6a29XS0FoTEFla2luZEdnZjJ5VzNIOXMy?=
 =?utf-8?B?VTFDWWw5cWJ6WCtBUm5rUXBPeUt2SWg2MXlrTmd6aVE3M1piNjk5MFNuYVdJ?=
 =?utf-8?B?NUxCZnQ4STZZSWZCdVEzaU9QUHNLblZUb29LZDZtVW5HNXRLZG9HNGhoV05a?=
 =?utf-8?B?OUZqQXhBUjNBU043cU1Wck5vT1praDQxSkVwSnprRE1UdGg4Nys1b3l0K2FC?=
 =?utf-8?B?T3JNT3Q2cjFBQWRXMStOWkRudUFURGtFVTMva1RsdDhDMTRiTVpYSm02SnJ0?=
 =?utf-8?B?MnpHQzY5Vk1DYzNkaVczNXdMaFZhVzU5eHMyNXcwMXBTTmpTck50bXdNeUZl?=
 =?utf-8?B?THhGRmR6d3hCZ24xQU95M2l1cEFxS29NdjRMaGNXbVM4RnJDSWlZTFg3ays2?=
 =?utf-8?B?L0o0UWdOZm9RcHdwaW5uZVNpTk9RUmtDenBIWUhnSnRBZ21CdUw0UTFnY2dh?=
 =?utf-8?B?Zjc4dUtRd2ZxMkFSUlBPK3pJb2RvTnRDcDEwMXJSZGV1YmY0MHp4dTAxTlRJ?=
 =?utf-8?Q?XW1LCj+am/v+wh/oCmwJpovtarnICpQ1NqeB0R7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ccd12f-3c8e-44af-14d2-08d96862895a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:24:27.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5aNqZTpGITiPASmHxhEDFh6KyE1c9iSfemUjof59UdYxaIRuOkvfD+tPjNpcUKNeu8qC74Xfhtix2kXDKH6QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

When such ranges can't be represented as 1:1 mappings in page tables,
reject them as presumably bogus. Note that when we detect features late
(because of EFRSup being clear in the ACPI tables), it would be quite a
bit of work to check for (and drop) out of range IVMD ranges, so IOMMU
initialization gets failed in this case instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v7: Re-base.
v6: Re-base.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -305,6 +305,7 @@ extern struct hpet_sbdf {
 } hpet_sbdf;
 
 extern unsigned int amd_iommu_acpi_info;
+extern unsigned int amd_iommu_max_paging_mode;
 extern int amd_iommu_min_paging_mode;
 
 extern void *shared_intremap_table;
@@ -358,7 +359,7 @@ static inline int amd_iommu_get_paging_m
     while ( max_frames > PTE_PER_TABLE_SIZE )
     {
         max_frames = PTE_PER_TABLE_ALIGN(max_frames) >> PTE_PER_TABLE_SHIFT;
-        if ( ++level > 6 )
+        if ( ++level > amd_iommu_max_paging_mode )
             return -ENOMEM;
     }
 
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -370,6 +370,7 @@ static int __init parse_ivmd_device_iomm
 static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
 {
     unsigned long start_addr, mem_length, base, limit;
+    unsigned int addr_bits;
     bool iw = true, ir = true, exclusion = false;
 
     if ( ivmd_block->header.length < sizeof(*ivmd_block) )
@@ -386,6 +387,17 @@ static int __init parse_ivmd_block(const
     AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
                     ivmd_block->header.type, start_addr, mem_length);
 
+    addr_bits = min(MASK_EXTR(amd_iommu_acpi_info, ACPI_IVRS_PHYSICAL_SIZE),
+                    MASK_EXTR(amd_iommu_acpi_info, ACPI_IVRS_VIRTUAL_SIZE));
+    if ( amd_iommu_get_paging_mode(PFN_UP(start_addr + mem_length)) < 0 ||
+         (addr_bits < BITS_PER_LONG &&
+          ((start_addr + mem_length - 1) >> addr_bits)) )
+    {
+        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not IOMMU addressable\n",
+                        start_addr, start_addr + mem_length);
+        return 0;
+    }
+
     if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
     {
         paddr_t addr;
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -67,6 +67,9 @@ void __init get_iommu_features(struct am
 
         iommu->features.raw =
             readq(iommu->mmio_base + IOMMU_EXT_FEATURE_MMIO_OFFSET);
+
+        if ( 4 + iommu->features.flds.hats < amd_iommu_max_paging_mode )
+            amd_iommu_max_paging_mode = 4 + iommu->features.flds.hats;
     }
 
     /* Don't log the same set of features over and over. */
@@ -200,6 +203,10 @@ int __init amd_iommu_detect_one_acpi(
     else if ( list_empty(&amd_iommu_head) )
         AMD_IOMMU_DEBUG("EFRSup not set in ACPI table; will fall back to hardware\n");
 
+    if ( (amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
+         4 + iommu->features.flds.hats < amd_iommu_max_paging_mode )
+        amd_iommu_max_paging_mode = 4 + iommu->features.flds.hats;
+
     /* override IOMMU HT flags */
     iommu->ht_flags = ivhd_block->header.flags;
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1376,6 +1376,13 @@ static int __init amd_iommu_prepare_one(
 
     get_iommu_features(iommu);
 
+    /*
+     * Late extended feature determination may cause previously mappable
+     * IVMD ranges to become unmappable.
+     */
+    if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
+        return -ERANGE;
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -254,6 +254,7 @@ int amd_iommu_alloc_root(struct domain *
     return 0;
 }
 
+unsigned int __read_mostly amd_iommu_max_paging_mode = 6;
 int __read_mostly amd_iommu_min_paging_mode = 1;
 
 static int amd_iommu_domain_init(struct domain *d)


