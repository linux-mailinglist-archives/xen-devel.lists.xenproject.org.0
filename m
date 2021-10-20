Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D6434910
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213820.372159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8xg-0006C4-Uc; Wed, 20 Oct 2021 10:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213820.372159; Wed, 20 Oct 2021 10:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8xg-00069O-RV; Wed, 20 Oct 2021 10:36:44 +0000
Received: by outflank-mailman (input) for mailman id 213820;
 Wed, 20 Oct 2021 10:36:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md8xg-00069I-1Y
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:36:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d0203ac-3191-11ec-833e-12813bfff9fa;
 Wed, 20 Oct 2021 10:36:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-fueFwKl-PsCe8okDe0HhkQ-1; Wed, 20 Oct 2021 12:36:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 20 Oct
 2021 10:36:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 10:36:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0201CA0014.eurprd02.prod.outlook.com (2603:10a6:203:3d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 10:36:38 +0000
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
X-Inumbo-ID: 9d0203ac-3191-11ec-833e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634726201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fLixa5mYFXJzvVO/wWHaEgJ4h3Tnk+rcvIsAC/w20Y8=;
	b=LtU8iT+GD4VeklbB1D5LOAdT+kv7HxphNu7Etyzxf9VkzOjyyG14zHegSqx+6QMA1o74rI
	GCVrrOAXK4bLDaSCVtf387zI1GDfreq6FIg7dcyxgOVa71ISMlWlxlxQS2kOfceD7Z+QrS
	FJslRfX2tn0pD9lI70DNzzY4nB+S4KM=
X-MC-Unique: fueFwKl-PsCe8okDe0HhkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf9xfbwKZW8n0gxx3Ul59ARhondWFRtYidCgviO717rkStZO5Onv0nYrpl3GRaGtjqOmfwKt+jXwsw4dw2QXApgkKy7NZR8kmHjpw30Xm5F4eb5U2edrOPUpMfU7Tj4k/CF9gRiMzYJ7hJjfQW/53QwFZ5ystdkuQz+/nOTRdeYFqJJxtoZ0RMKw8uwj6CytyhJlLHbeh+/eu28CfeCWok6e/+xpXpzD2aK/JjLqpgfMHa64LA+ZtLfib+dzVvq76DT8rGAwnNIH6FoAq8LyDyi4MAwNkxoRoXIBXbzLMLQkwcAhWaxjgWJn767RQ29BurS3+5Xcnc5t/pvmQrPXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLixa5mYFXJzvVO/wWHaEgJ4h3Tnk+rcvIsAC/w20Y8=;
 b=C6GkzYatV5+Io82mH5QMCgtZcc8Sk+SXCFVqJ+4eW7KGSx/2hns6kr9pkZ9S+XqH11WrF+PxbNraqqXy13svEnuNhjLy1bkMBE6wNzyTo2eGvwDiZRzk/b1QjZBv0ufPothXqkAA630Ild3jsf84QRwuMf/sWHhhYlBMTXExpBMWB144X11A2rTbVaKq4wq+aNYaGQuhXXm8pJvAHK1TX4rSdnpaYaIhN9cwmKBbAI7Y6bxD+mXRlH4ILkTGyOn4R81s3N/rw9mM8cEuRDqewhiOKltJ/jD0u5/JLmBH4vVY/RYiSQ4fOABpMWWNfq5xR1//3VAwMNexMcxd4rhjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables
 are missing
Message-ID: <684e4a04-3ef3-46be-3302-149d5ce30177@suse.com>
Date: Wed, 20 Oct 2021 12:36:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0014.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54beda57-2908-40bd-6f25-08d993b57fb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56002B5E5C82D535993B99BDB3BE9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BHzyvB7mCYMHY749Y8GnTXhHwGgUdaP4aX5NdA/fIbb2j0scvbeqoV80BgIvF+o+YUV4vZEsw+P8gwa5DbxIdG/PT5wWL8EKzWUJmTP9fK/YZlGSByq7zI5DF9rLCSYS0n4dXvNLFeaYoGcR0bpUD44FH247q7vC5bKwmbnQVb6gGCZsAM1v7noNd3+doWL3myPqsmOw3bQNFlQdslPy5ZeyyW7HztYdK/lSBiJL232Dftn7cpNZO2CmdCNaG1/ej81AwT9F/zLQ2MhUyFnujxlqJn/iZdtlMV8LrynbOJCbUGHrpgfvjTq9B6HY+V0w4iIiXASAi8ZGB0dZIg2ps4WEYbcdqVXQOooREBv3jzzMa+2spTw8tW7WxBoVjx6aA/xgqX9p9Yl12Wu1As0X3ZEQJv/+cjmLzqSLHGI36fJS9McbkbBGty1du/8t6fGkRHWteqa/XUUbgymOKbCPbMRsfYmuMZD92Q7sz2EbGQjFacZ2OGDzZ+ZTJouxHvIZHuVH2f5Ke74nHGeM04/I1aVeT+MvkqLvZzgh8pYEaPhYrruBfdoYyfRJcsoylzo4y3aRlWi2RtpRY7iKOWqzE4fU4010XkEiscFnyo/LlsmunbJmXhqiFJYkfOyNaoWaZ2Gph3Q3RNfgx0m/BE1g7i9Li8plZz9v9ufZ0mE+Yz+az5ldTw+6aWhHhhGqfsrBBGCGhejtbBvsi2KO8Qq1WuvQdjK0ZChrFeeOeoD1JNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6916009)(6486002)(66946007)(5660300002)(316002)(31686004)(66476007)(66556008)(2906002)(956004)(16576012)(54906003)(38100700002)(2616005)(186003)(86362001)(83380400001)(36756003)(8676002)(508600001)(26005)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUlWZVpKcE1sVjdWcGlVR3lrbi82MG1Ld0xybXBKYXR2cDl0dmwvRVN5bzFJ?=
 =?utf-8?B?TDJVeEVPZ2VFb0haVTFSb2htY0hja0gvM0p1dnJlN0JlbkFIeXhuZ3hBZFFY?=
 =?utf-8?B?YW9uL3RTLzlZZloycDhxYnZxQ1dSMWFSR2NEWUZ5dVFacGtTcmw2TG52M2pi?=
 =?utf-8?B?NXdyV3U1clBITzc0L3FKRGdnVE9iMGxxZlQ1UzNzalJFUjZlY3dLdE42MVM3?=
 =?utf-8?B?ZHAzSXBMUlJna0NTcEowdHA0ZUhuVzBUSjVmcDVZZnliK2FFdXEwOGl0a25h?=
 =?utf-8?B?NWx6ZEF4U01BMXlvSHFKNVhJZGFrTGpjVkJqcUFMWS9jSEhuRXc2M0MvSURS?=
 =?utf-8?B?QkVlOHpBSFNhckNrZXVDR29SOVNIbTVjVUpUdVc3Mjc2bHdmRUUxUWtlaE56?=
 =?utf-8?B?L1dZTXoycVFsbmRPRC82VC8rem1oazlJNDZFNFoxUE50ZWFiNzM4U1BlRGla?=
 =?utf-8?B?SXNrbmNCakRkOWg3ckl0dXN0K042UzNjVVhhbkh4clVFUWQzUGpQVUFWREZ3?=
 =?utf-8?B?M0JSU0IxN2RyTFNXcndmbWY4dmVsMHFzejlTSkNHMER5S2RnMGVoL2xFcUJV?=
 =?utf-8?B?MmtQTXVlRGNwTDNCRGQzVTBnTEJXKzVDYVdrS3Z5OWE0aENQU0ZEcm5pYlQz?=
 =?utf-8?B?SUpTSWdTK3Z5QVZBWE5DMzVOYlFFUkVGTzd2aFJEbWZpVGlCVjJoRlJ6b09h?=
 =?utf-8?B?UkZGbUJ1VmdQUWJSdDMzOVl0V3plSFFaTEUyR0ppQ01nSzFUYXBTSVJVK0t5?=
 =?utf-8?B?VlFEdnpTTWNUbzVVdlg0eGk0VkRvZXg1RjR2R1lyM1lvTXhidWFWMzhFcjBJ?=
 =?utf-8?B?Q2pUcTlTRnUzUUJBZGlTMTZjOHZlaUE3T0lkUWFRWkdDZWVmeEV3dWEyMXgx?=
 =?utf-8?B?dVV1TytVd2hjb2s4bCs0TnF3ak5oTVZXQ2RoYkVtQXZZSTZHNllzKzV5a0xC?=
 =?utf-8?B?bThQZS9hZHAwRDkrdEFqR0R1cVRrdFhSdUZNeC93bHVqbXNVM3hiTWhuZGxu?=
 =?utf-8?B?dUFZaXpGa29DUzBLVlhIVGtaWVpNanFITzR6aVpZWGZuRGoyR1dXV09laE4x?=
 =?utf-8?B?d0FLemE3bmZWNDNtMFJFNGtLRWNwb3RnMGpBUjB5d3pzRFNKSDlISnB6UDY0?=
 =?utf-8?B?YTRFY0hLY2dUZy92cGNubmI2U29BOThEM2ZRb0ZNRmFGbjFITXl3MEt0WHJp?=
 =?utf-8?B?S1Y0WEVvcmtyNG1lMXFSRFlQb2MxYXM4Sit5cjFRem5yWkpETTZ3ZCtMbHA2?=
 =?utf-8?B?c1NEMVR1bU1kSDA4VkJ4ZWdaNWRaZktQd2ZVR2ppYmxNZFh1Q1U1akJ0L1My?=
 =?utf-8?B?N1I3MlhTeHE5dzVyT2dCNHoydDFreWZoeFhCTUw0TEErVkhhMjMxOUxkVG81?=
 =?utf-8?B?cGk0ckRDTU1HRDJyTWE2RmpyTStLc3l2YUUvLzF5Nlg3TnRGa3ZwUE1uZksr?=
 =?utf-8?B?UThTbjZDbmZ0Nlhkc211dGRVclBqd2Y5NStzckFTSHA2QTVMeTl1Ync2cG5m?=
 =?utf-8?B?R0RvcnJBTlYrdlkxZ1JkdWNFUnBEd1ZnTHNtTEtqeldzKzZzWTJFUFlDLzJM?=
 =?utf-8?B?eklrRm1IOS8yYWx4RDBTZTRHY1NlM2ROeS9WWGZIOVdaUGg2Tm15bk5takRq?=
 =?utf-8?B?bW8xTE9EV2dlcTl4SzQ0WmRwdUtsc09EWFZSTk9kVktTbnNnSFdVelJMWVFB?=
 =?utf-8?B?Sjc4WXVkbkhjNExQbkJHcVkzVkNLdVBWZmRXQkw3UHA0elp6N2piYTZCaTd3?=
 =?utf-8?Q?JoWeqwhzfH2W783EyWJJADmAdnv7nWe0tNzGPFt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54beda57-2908-40bd-6f25-08d993b57fb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:36:39.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
mode (physical vs clustered) depends on iommu_intremap, that variable
needs to be set to off as soon as we know we can't / won't enable the
IOMMU, i.e. in particular when
- parsing of the respective ACPI tables failed,
- "iommu=off" is in effect, but not "iommu=no-intremap".
Move the turning off of iommu_intremap from AMD specific code into
acpi_iommu_init(), accompanying it by clearing of iommu_enable.

Take the opportunity and also skip ACPI table parsing altogether when
"iommu=off" is in effect anyway.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've deliberately not added a Fixes: tag here, as I'm of the opinion
that d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier") only
uncovered a pre-existing anomaly. This particularly applies to the
"iommu=off" aspect. (This now allows me to remove an item from my TODO
list: I was meaning to figure out why one of my systems wouldn't come
up properly with "iommu=off", and I had never thought of combining this
with "no-intremap".)

Arguably "iommu=off" should turn off subordinate features in common
IOMMU code, but doing so in parse_iommu_param() would be wrong (as
there might be multiple "iommu=" to parse). This could be placed in
iommu_supports_x2apic(), but see the next item.

While the change here deals with apic_x2apic_probe() as called from
x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
similarly affected. That call occurs before acpi_boot_init(), which is
what calls acpi_iommu_init(). The ordering in setup.c is in part
relatively fragile, which is why for the moment I'm still hesitant to
move the generic_apic_probe() call down. Plus I don't have easy access
to a suitable system to test this case. Thoughts?

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -193,10 +193,7 @@ int __init acpi_ivrs_init(void)
     ivhd_type = rc;
 
     if ( (amd_iommu_detect_acpi() !=0) || (iommu_found() == 0) )
-    {
-        iommu_intremap = iommu_intremap_off;
         return -ENODEV;
-    }
 
     iommu_init_ops = &_iommu_init_ops;
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -41,6 +41,23 @@ enum iommu_intremap __read_mostly iommu_
 bool __read_mostly iommu_intpost;
 #endif
 
+void __init acpi_iommu_init(void)
+{
+    if ( iommu_enable )
+    {
+        int ret = acpi_dmar_init();
+
+        if ( ret == -ENODEV )
+            ret = acpi_ivrs_init();
+
+        if ( ret )
+            iommu_enable = false;
+    }
+
+    if ( !iommu_enable )
+        iommu_intremap = iommu_intremap_off;
+}
+
 int __init iommu_hardware_setup(void)
 {
     struct IO_APIC_route_entry **ioapic_entries = NULL;
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -141,16 +141,10 @@ extern u32 x86_acpiid_to_apicid[];
 extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
+void acpi_iommu_init(void);
 int acpi_dmar_init(void);
 int acpi_ivrs_init(void);
 
-static inline int acpi_iommu_init(void)
-{
-    int ret = acpi_dmar_init();
-
-    return ret == -ENODEV ? acpi_ivrs_init() : ret;
-}
-
 void acpi_mmcfg_init(void);
 
 /* Incremented whenever we transition through S3. Value is 1 during boot. */


