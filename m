Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743443DEB97
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 13:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163415.299352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAsMl-0003h2-FR; Tue, 03 Aug 2021 11:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163415.299352; Tue, 03 Aug 2021 11:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAsMl-0003et-CI; Tue, 03 Aug 2021 11:13:47 +0000
Received: by outflank-mailman (input) for mailman id 163415;
 Tue, 03 Aug 2021 11:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAsMj-0003en-Up
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 11:13:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d37fde0-d250-491c-9580-894aca751db5;
 Tue, 03 Aug 2021 11:13:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-LhFKX99qMRSnSiP8GI10og-1; Tue, 03 Aug 2021 13:13:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 11:13:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 11:13:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.11 via Frontend Transport; Tue, 3 Aug 2021 11:13:41 +0000
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
X-Inumbo-ID: 4d37fde0-d250-491c-9580-894aca751db5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627989224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xWaLnr6aNgmuj2Dd6xZE5CJ2eUlvhSileQ7UcXxl4BE=;
	b=QCv/3iAEB1/yRF2sURuZuBlXAO9Vf2Zrt80HZ6heXNmMuX66RkjCSz5Bg0gFoRtAKT2Vz3
	LmTYL1KD1Ss+vYB+7bYue/2vVGXd/QdiIi6tjNiUrm0bk6s4PR8qzQ+1yzSoV8w1n1vkmY
	TvmezxAWSGO6AWJQ33VvFwgxWicjTC8=
X-MC-Unique: LhFKX99qMRSnSiP8GI10og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6lnO6Wsvo8ZhxqzHPhQkyxMJtVcC/S0NRTVTZCRhwSayRu4nHAaSPTYFchZ1ewYHGZv24VyLt/hyZpvFxFA5Gg3fkK/R5+jhZUl1xQvPbesaJskGiQWuSDrRN+LEOrZUrIOPZQB+eq2LCXCsx0Y1MWWNudd8FzI87W2uBTun5kP7faq4STubl7P6ShjASMsFa4Z0nq3nh86hALCkN2nTRMSqmUQ/CZgYW0YO0JMirvGvfCfGpep0XP2em5ZEQw5MvDUWMUjIkuTLFHYQqUOhUp/W05DxRFiUyntLaX889XXh/QWUHyck2y6YggVpjBAGgv7RRKneXnJHELVlNfmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWaLnr6aNgmuj2Dd6xZE5CJ2eUlvhSileQ7UcXxl4BE=;
 b=RGXoZn5f85KCftzYdI5xNuKgQ5DqpC1XLrhtUEJb90PuQHVZ0G0sP0sUXZgw2zmOMcmcIDV87CXQrRNxof0cuAVCTK8sKYc7GcTZPUobsN9dcH9KEuGMCtP8f53GdfA1ZYJ08uYKkDX8qCs2jMfGHNqUKA7w9wLog7ypDs8T8Nx6NE91NK7lJvdrhbBHmOFhSS+cQ5Q7RkOW4J/E90dJDX0wWEORIRk0XovPGA9sAkTFPj5ONV4rTt70pr1/vv2sEGGW0/mb/lzXFhD9wnpnjdp+riIGzbIx9ZE5LOZ5rYo8DGON7+69kyJdZM90T/5mK2quYCfHtRkzsacY9KCgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
Date: Tue, 3 Aug 2021 13:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657b5aa6-83a6-4c9d-fffe-08d9566fc04d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23331048FBAC6BBC4BA45E6DB3F09@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yXah1SBRnGPgfvlT7rZVJr3mq8Dc+llgno8pf3gvtwAD+gZZ7qgRnWbuegSRCeWhFIiguea5SN7J2LT7tFH7RMBv9zQa9HF29U94NhGqoImoQ0HN00OuUbr0CmWxSTh6T92q2LfLgMIkBhHeGDZfZfSkKUi3iuPQSqovjOfIXJdan36z3Bwro/v3U7/pQ2ZuHNPfT42mWHfThOxR+L5Q76mudJJTx7e2UmvxUFNRtI5iu0d++CBDkOlmWbDn0nVNskDr7desvuv6nyifHki7x2662l79SWgIyZdjUOQ5ktueabq4r07snM1xwsI2UquTARvdQFX5vEy3GiRYCe+sBk+kFneUu4XDD0Lci/5mtPhd+sPs4Gl1hJsgqCEwJrnDevZIubih4vzPA3w71gxY5KpbpkWx+py7AOLL9aEyr2SafU+n0mLwLv8uQKMwfcCrcKwFZqMJmdqU+04qILQpczIiFO1xH3SCUNAMj5dJeQHKvVua3lzhwBPr+4uafmEfKpHEPvncaUVu13XdZrjkbQijlPfmG7/6hJ8ZfJwFQVfdPZBIabjtVgPRTmmZ+kaSn/ntHemyHjQqEQyyv3la8GsCHgUlQiz0YT0NOujQVMStAjtmakvaAokNd6JxaYEZqvPP18261l9Hcbg5eYWeMy0A3/bsvobDraYFug9GBemc4iZohiRDOVWJKyLREw60/eE4OzA1jlPCB1JDaauutyLtrarsa9oD8aDryG2zL1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39860400002)(376002)(136003)(36756003)(2616005)(31696002)(956004)(8936002)(186003)(26005)(2906002)(8676002)(38100700002)(83380400001)(478600001)(66574015)(5660300002)(16576012)(31686004)(66476007)(6916009)(86362001)(316002)(6486002)(66946007)(66556008)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhVaTN1Z1d0VUVDMWs5QVV3Y0drcnJRT0RiS3FuK3MzMG1laGVXYzJqK200?=
 =?utf-8?B?aDB1ZVNPQmJqSW5zQXBEZkphTW5vKzhtNHpydW9aZkhNOVRvSFlSS1pqc0ZC?=
 =?utf-8?B?WDI5cEQ1ZkIvcCs0cXphbXRTOExNRjNKcVlmTWhNZ2VkZGtOMjhxc1RWU2pp?=
 =?utf-8?B?OVA4b0xHVXZBZm1yeGx4T2t4Y2VFbm9COUVOWld4YW9UMTZselRZYWpwTlpu?=
 =?utf-8?B?U2M5Y0ZsVVJpL2tZTVpEQ29ma2JrWGF1dGhWbHpoaGo1MlZ2TjZ2Sm1vY1NX?=
 =?utf-8?B?YnNERSt4MmxwZE43WGNGVk1henFRem5NV3MvdzR2Umt4VnZXQ296MFp1NVVX?=
 =?utf-8?B?SEoxbk5UK1FDRFhhaHBsdlhzSGZzSXlrYW8rUTFrRkFEelJMNTc3cWxZb3RC?=
 =?utf-8?B?Y3N1Sm1FcTRLK0xEVVFtbDZwL1dVazBtVEYvd0tUM2g3RFZxc0I0QmdDUWcv?=
 =?utf-8?B?VHF5aU5KMThjc3M4em1YcGhYRVFpYlJmZXZKMmowcndBUVR0ZEZYZXZCVzRr?=
 =?utf-8?B?NElYMCszdGxvVTNLY042YUEyb0VGWnl2OUcwaDAvN29ueHNyMDc3aXJHQ3lX?=
 =?utf-8?B?NU1pTEVVdEkzTXVHdVJaQ3Eray9wY1B6YWR4MmlBZ2F3UFdwV3ovWEJ5dWpq?=
 =?utf-8?B?cGhNcHZiT1lXTlVJVmU2NGdTOFlISFJhRmVsM0RDZXRDNkVLSTdjNnpEc2JC?=
 =?utf-8?B?MUxYQVNHSzhUZklVMU9NSWt5TGFoUFJBaVlRSjIvY0hNeUxIQXozRWw4ZG9i?=
 =?utf-8?B?WFh3SWJ4S0pySzhQR1luSTV2ajVJbDdlVmhxdzhJRG1mWEhIRDN6QUFiU2dG?=
 =?utf-8?B?N1lwNWFQY2NldzR0a2NOUnFKdFhuamk2OTJ2SnlxaWFxcFc5TGpNcDN4Y2dF?=
 =?utf-8?B?aStPa2ExZFI2bW9qVTZSWjczTHIzamM1azNWU2tjaDlmUXMwWnZuRThjYUJl?=
 =?utf-8?B?WnRVaEtQOEY3Y0UxeWU0MFNPbG9nSXFKd216ejYzemFXcTAyVkVQSGo3VEpu?=
 =?utf-8?B?Qkk0MVVobXViRlh5b2g2aTk4bTJXeDBJbFllRnRxRzdqL0ZmNGVDUVRhUFlk?=
 =?utf-8?B?TFFyalBmMXF4Tm1zMFo2WWN2KzVsNFlPOXBwdWs2SWRMYzY3cHVIREFRUVM5?=
 =?utf-8?B?WnI4S1EwT0hJa0pEUXVOdnlGTXZGL3dUMWNNK2lTQzNXK0ZPRkZwZHpQU3lC?=
 =?utf-8?B?MnoxT1hBeWJpdVhVTy9COUdGd3NYeG1pb28yRkd4SW93Z3I3cGttVzB1c1NT?=
 =?utf-8?B?SVdjM0tLdURTaDNXN0lCNFI0K2lHUHZTZXdMUUJ3T09tRTlzRzFPdTlsakQ5?=
 =?utf-8?B?OW9PMzJCRkJMRWd0ZWNYSzNmeVhtcjBRVXF1SjJ4NWZVZ1ppOXc4MmdITlNu?=
 =?utf-8?B?b1dBNEliQThIV3FUYklNZTJCZFFjaTE2aFA0RzMrTTIxUG0wS1lLbUVCdFdn?=
 =?utf-8?B?bTJwRnJWZ1B1eVMrd2doeUt3SWtlcUhzSm4yMVNZdW5CQVJmV0pQNWErS2lo?=
 =?utf-8?B?Z2laeCsyUVk5NlVLTFBIRlVhcUwvKzZpU212RjNnV09KUDY2SWg4NitKWTZv?=
 =?utf-8?B?aEpnK1BzcmQvWVRSZU1UakdwR05KS0ZNaVRReXd0SkM3b0Y5d1c2WG92WkUy?=
 =?utf-8?B?aHJEZEI0YU44bjdtdDNQZ0l6MDIrVFIzUzVaNk5kMjZiVU9yc2VFRmEvRU45?=
 =?utf-8?B?ZlhQVGdLL3VxRmhRUG5ycXZ1djhCcEJWRlQ5Z0hjazl4UmhvbHlnd0lPYlRu?=
 =?utf-8?Q?EQ394GmF72TeKUft7K1OfqmLnViv+qNweqsGWZE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657b5aa6-83a6-4c9d-fffe-08d9566fc04d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 11:13:41.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7qXUx7stsQJLgXHb3X3my3sxt1T1Wo8mfyEtQO/rFGyV9+SyYZcEAl8BnngEWZmBpo8Dm8abaBemmHFMg2HzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
spec update, X58's also mentions B2, and searching the internet suggests
systems with this stepping are actually in use. Even worse, for X58
erratum #69 is marked applicable even to C2. Split the check to cover
all applicable steppings and to also report applicable errata numbers in
the log message. The splitting requires using the DMI port instead of
the System Management Registers device, but that's then in line (also
revision checking wise) with the spec updates.

Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As to disabling just interrupt remapping (as the initial version of the
original patch did) vs disabling the IOMMU as a whole: Using a less
heavy workaround would of course be desirable, but then we need to
ensure not to misguide the tool stack about the state of the system. It
uses the PHYSCAP_directio sysctl output to determine whether PCI pass-
through can be made use of, yet that flag is driven by "iommu_enabled"
alone, without regard to the setting of "iommu_intremap".

--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -268,26 +268,42 @@ static int __init parse_snb_timeout(cons
 }
 custom_param("snb_igd_quirk", parse_snb_timeout);
 
-/* 5500/5520/X58 Chipset Interrupt remapping errata, for stepping B-3.
- * Fixed in stepping C-2. */
+/*
+ * 5500/5520/X58 chipset interrupt remapping errata, for steppings B2 and B3.
+ * Fixed in stepping C2 except on X58.
+ */
 static void __init tylersburg_intremap_quirk(void)
 {
-    uint32_t bus, device;
+    unsigned int bus;
     uint8_t rev;
 
     for ( bus = 0; bus < 0x100; bus++ )
     {
-        /* Match on System Management Registers on Device 20 Function 0 */
-        device = pci_conf_read32(PCI_SBDF(0, bus, 20, 0), PCI_VENDOR_ID);
-        rev = pci_conf_read8(PCI_SBDF(0, bus, 20, 0), PCI_REVISION_ID);
+        /* Match on DMI port (Device 0 Function 0) */
+        rev = pci_conf_read8(PCI_SBDF(0, bus, 0, 0), PCI_REVISION_ID);
 
-        if ( rev == 0x13 && device == 0x342e8086 )
+        switch ( pci_conf_read32(PCI_SBDF(0, bus, 0, 0), PCI_VENDOR_ID) )
         {
+        default:
+            continue;
+
+        case 0x34038086: case 0x34068086:
+            if ( rev >= 0x22 )
+                continue;
             printk(XENLOG_WARNING VTDPREFIX
-                   "Disabling IOMMU due to Intel 5500/5520/X58 Chipset errata #47, #53\n");
-            iommu_enable = 0;
+                   "Disabling IOMMU due to Intel 5500/5520 chipset errata #47 and #53\n");
+            iommu_enable = false;
+            break;
+
+        case 0x34058086:
+            printk(XENLOG_WARNING VTDPREFIX
+                   "Disabling IOMMU due to Intel X58 chipset %s\n",
+                   rev < 0x22 ? "errata #62 and #69" : "erratum #69");
+            iommu_enable = false;
             break;
         }
+
+        break;
     }
 }
 


