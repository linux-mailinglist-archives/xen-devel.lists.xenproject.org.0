Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553564188F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 20:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452747.710536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Xsm-00029b-0N; Sat, 03 Dec 2022 19:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452747.710536; Sat, 03 Dec 2022 19:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Xsl-00026v-Sf; Sat, 03 Dec 2022 19:09:03 +0000
Received: by outflank-mailman (input) for mailman id 452747;
 Sat, 03 Dec 2022 19:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p1Xsk-00026p-Bf
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 19:09:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef8c3f53-733d-11ed-91b6-6bf2151ebd3b;
 Sat, 03 Dec 2022 20:09:00 +0100 (CET)
Received: from DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) by
 SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Sat, 3 Dec
 2022 19:08:53 +0000
Received: from DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::68dd:51a6:396f:db71]) by DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::68dd:51a6:396f:db71%5]) with mapi id 15.20.5880.011; Sat, 3 Dec 2022
 19:08:53 +0000
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
X-Inumbo-ID: ef8c3f53-733d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZgiasLxyeyKlHQlnu90AlAc+RQ5as1mHMHM/F9Vb1hczxo5d8QDBPrVOmwZ4mRxb3XwvVc+fwRbwRhEjS5HEPeC4Nk/+h/Gq24CZ60WrPeLq5g3Qhxx6aQaGss9tMX98WEe3ipFXxCCxJ5Qaby2hzLuH1S7J1K8OBpJx8xXaSfgOJBWne6g2HNKLULsrVJaqbcgE5JCfpAwnkUxQGnItx1Go4kcFT2hK5/DFmLkV9yYVfqgGfkw4XoO5Om54JQ5f61dCpMExWBRSjnvRD6D92sJau3l09knm86DhBev+0MmalsZtyGh4P/VKJ+dv5aw1sr9EPrV28E2YYulZV3t/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsFcESaDUmet4EZbcaO1d1NPpq9U4nqcXZ/AP0joGhY=;
 b=COf7AQeQCLMLmY5MWVzv4pIeQvdGq3xH2XbLjHswxjyeCCRfD4mlJ/1/7IbIh8mKoHXrxNYmOAAg3v8+nqz5ONe3tfVeD+PZC1Y57bD7LaRPRucO+Txw0QYCvv2eQfNXocl1Q8BvhHbzucrn8+NG8alS07NU0Oemit5bh7cfqZ6lrB0H8KDCm9yxWJWrgqrSu2rAw2bKlBkxESstHpP24ED6W0435oMpYymWYZK1K/usQXeWwGHB1RlYLEfhfq6OlTjVeI1A8SvnZ+l0x6J3XLCJGSDmQjiwKFvjI2TZGqrAJ7vmPIAyNhe0E3Q/34eFGynCNsb6+8dFWaItw8phpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsFcESaDUmet4EZbcaO1d1NPpq9U4nqcXZ/AP0joGhY=;
 b=yxs65cfdPux6nFfHA2ZGMw/9rs4dp6fs+UctSWnSFHb5gmbv1/zIm34YGph3Sent2TCjUgk4qwg+6Ms/+w4Hb/WT1ejUQA/rzYqWvYR4z3OVLu46jqHZq7hlhm2YDsiK8BB+bWVT0u5e1ONQBD5srB/8ptgJSzN0JELP9ExkMdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b5374345-4782-20a7-2ceb-158197e7015e@amd.com>
Date: Sat, 3 Dec 2022 19:08:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v1] xen/Arm: Remove the extra assignment
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org
References: <20221201173121.33865-1-ayan.kumar.halder@amd.com>
 <adc5e471-5fe4-73cc-267f-196f5aed52b9@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <adc5e471-5fe4-73cc-267f-196f5aed52b9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To DM6PR12MB2618.namprd12.prod.outlook.com
 (2603:10b6:5:49::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0068ab33-74d8-44a2-d6d5-08dad561d1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	52zNMPqr+bwaUKvrVwcGbJm4m7QeY+SFL1IOfMm2WkEnZLGE8y9gIqY3q5u3ueZfyO342aQVY6cuA4hsvty9pVI1l2zYAlU3Vwu+SYUt5u1q9DfFZkdW16iOPU+WgCiJXYqK7iVkX6YhlddtK9yrEgKLH8F3QM8a8638flzKfddw0+2VSLGxEYLXvw8nkD3XMCvQWm14oCXAkHnBPi+VhjQpAk93Y/UInXeIJ8lqy0rqErw2ecGQr4bvCIz4woQjjyN0gLNU/opnmk3H2NcWaT2opECpV2oeQjepDlwGUAbeU/V7Qg4Vyi6OXGJNPZeoSgF6Lyys+rEq3AGc2fSahJ5/O7DU+WAMraBAO7CLKJkp/cbpAaIdKNk19BHbcVkoM9IO83Ha9JGmP5VXobHrT1MHUBfTw7XZ7YZrNX4MDY8vG1jtaiPyMJar8uYsI6pOU4UrP/wTnksKVGoiqFuYDoCBBoOg928cfxks8zSwT7Cx2rd4SXUSIZ87Lw2cWhw8Nw/poKsa6QlXHUSWclunU+OIoF0tlf60QNoV1mpTmrSfEWCDR+7twFfxWeFVjKQLvprn82vK8foHJBRIg0+F+3nrtOvqzZepfgLYBuMCH+iZhMuQCfuqtkUineqQKp2Q4/Mvc9yAboV68ijb8YumLvVKyor/mRkWwd/qqeurbFj1lx3pHxH/7SUvkoIjbFNPGRDubl6rxS4FzIktWxl8CEsgQ1FJIrvACrQl6h5y/ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2618.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(41300700001)(186003)(2616005)(66476007)(36756003)(66946007)(66556008)(2906002)(4326008)(8676002)(53546011)(38100700002)(5660300002)(83380400001)(110136005)(316002)(31686004)(478600001)(6486002)(26005)(8936002)(6506007)(6512007)(31696002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWkyQnd3Zjk3czF6c3hoTnZ4QnFWQW9vOWZyTmlLdSt2WXFIYkNjajNTd0N5?=
 =?utf-8?B?R1lqR3RsMWMvdWZPZjJRRnR3aHZaRzgxd3JQNGNRZWsvbzVNTHJkekRhQW1Q?=
 =?utf-8?B?cDBBK3ZQVEoyUmZHVGU3WFVvbUN0dUh5QkFqL2kxeVhqOTJJZXBhaysxM0R4?=
 =?utf-8?B?U0tQR2lKcllJV2h5VnpPWGMyazBwckFMb2RWNHJCclkzVFBJT0NyeERKV0Mw?=
 =?utf-8?B?MHkza1lTYmVHTVdmYTl1ZVdOMDFlei9UVk9COHFCODUrVGtWUzBLZEJpOUJn?=
 =?utf-8?B?aXRNWkRMNlRLZFhlbDZsNmxaMFdhdFJuc204bmN1cWhFSFhqOS82QStsS256?=
 =?utf-8?B?em9HaXl0VTVZRldTVTcwZHV0WWNVV3hkTk1PclF3K3lKZ3E2Y01FWGttaDZt?=
 =?utf-8?B?d1dFdzk0eHBzaGRJT0pJYnJrTDBOdnlZWkZKMjhUTFBINGQyNE5XZDRXazdC?=
 =?utf-8?B?M2FLRExXZXpXVlVCZytjdzUzbC9Nc1AvSTNLbG5iS2kzUm0vRDFUejJVdXM5?=
 =?utf-8?B?WDhwYy9WV3c3TU5ZbTB3cXBVL1lhUUFUTjRER0J5MnRnckpHVVpCR1Y3SkU5?=
 =?utf-8?B?YmdXRUp1MDk2SUQxQXYxZThGenN1ME0rN2x1QWh0TEZZNzNEb3F3R1lML1pu?=
 =?utf-8?B?eFFpWDhqQTFpdk5IbDBHaHRsZDdwL29ORkM0UXZiRzFiWXozUC9pUFg1SEJl?=
 =?utf-8?B?a1R0UGsyb1FlRTNZbnk1M0ErZmNWaCtCYlhyNFpTT1ozY0RaNFIxZ1dUOG9N?=
 =?utf-8?B?T0RTdVBuL08wK1NGYzdTUmRrdDZIREtjRzE2QmFJZkcyOHNEYzBLQ0hoclEw?=
 =?utf-8?B?Y3BqYnFrWnNNS0J4YTk0SkxFbUpwMnlUTUxvV0taeW9hVXU1VVp0d2dhZnZC?=
 =?utf-8?B?cVNFSUp4bGtNY25yelJZczJ6aWpNdWJlL2U0QUxvT3NPT09zbzFZTFo1YUJh?=
 =?utf-8?B?eWFzNUYvNjg3SXBsY2hzN0RtM2ZoSVVIZGdnOWlHZG14L2VLOTBEYVQrQk05?=
 =?utf-8?B?YjJnUVF6WnQwNUlOVG9OMi9tQmxaRVBlUy95M2N3MGQrY1dSRktTRFBGcG5G?=
 =?utf-8?B?eTdjM2pERGhjNjJMM1hla1dGS0N5Sjg3b1FVZVZWQ09KK1E0Q05OeDV1VEdV?=
 =?utf-8?B?NnI0WGdObDh5VVZvNkxCRnErYmR1U1VXV0k1NndmbTFWeWcrVUJVMmJjMUM4?=
 =?utf-8?B?VlJ3UE1UeEF5UThIYnNEOFNQYXVleWdzbG54ZjVwT0p6cW11QklzYUVCd0Nk?=
 =?utf-8?B?SC9zT0wzcVlZbS81b09PaTJXQmF5QlZoR3Vock5ZVDhxQ1VqbjJzdlVLQU1S?=
 =?utf-8?B?dTB6c08yLy9RVHJuQndpL3VBOGdkWXVEbHFyKy9DbVZRNUNlaXgzU1dRbXc4?=
 =?utf-8?B?bFREK2ZlODJkL0hQU1ZUdmdHWXBrQ0ttbGdQQTdrUGVWREluQjU3RmxBWTlz?=
 =?utf-8?B?YzJQbjhRbnMzN29kd0Q0NER1UzQyQXo3Mms2VGxSWHlpeTIyZUhibWNzYmVH?=
 =?utf-8?B?Q1hmRFdwSE14R1ZhbWVNTlF4V3BpVzZGdTQyZGZYT0hRNEY0WHBRcmp2RWo4?=
 =?utf-8?B?dGxkamY3dTI0VlhsYzlseXVycG1sMmtCYXM1eUYwS2l4SFQrUWxGRzFjUzk3?=
 =?utf-8?B?b2hKaGEzNGVXWUkwTHg2RE1xc09XaG9XdVNBL2VJNDgzSjZMemdoc00yYndq?=
 =?utf-8?B?VEpXOXFhYmh5aEJ6UjF2Y0JiRE9xSE1Zbi9VYjJwdy9pY3dvS3ZCYnA1WTBU?=
 =?utf-8?B?UE5Bajl5TFlJV0Y5cVFMRzgxbzJFeXAvR2hFU0NsRVdoZEJCakxrcklsRkpz?=
 =?utf-8?B?cThaNjlyeGIySXBlbXV2dVVqL2ZSOS9KbENHK255ejhHODZXQWhTUHZRNWpS?=
 =?utf-8?B?V1IrOUp1K0phazFaRUdJOUo4MXptTUdNOEZJRHVQTjFKbG82WW1qU05mZXQv?=
 =?utf-8?B?UVN4M1RReW9JckZvZnJIVFJwbUd3REcwZlhXbVhDSGQ0U2ErWHdZNHRKWE4z?=
 =?utf-8?B?aWNOV0ZUb1E2YklTK0M4Qkd6S29GL3RnNHdiYTVyQnpibS9DSm1SZnBGSTRT?=
 =?utf-8?B?SFpQMXliWUNaeUU4eXdsNTlHNWxFazRqSmpyeWxBKzBISnZMbzFydUhaeVY4?=
 =?utf-8?Q?d2dIn+/dSJBl89Dldx7lpL21s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0068ab33-74d8-44a2-d6d5-08dad561d1aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2618.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2022 19:08:53.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XEwHSm1Wwoz5BedGj8b+HUFYp9NiDE5KOYLhUfLc/mwKwll/iM7WwNi2vqJsntbv95enhqZKcDh3j76b0QYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442


On 03/12/2022 18:05, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

>
> Title: It suggests that this is modifying arch/arm whereas you are 
> updating the Arm part of the ns16550 driver.
>
> In addition to that, from a reader PoV, it is more important to 
> emphase on the fact the truncation check is removed rather than the 
> extra assignment.
>
> So I would suggest the following title:
>
> xen/ns16550: Remove unneeded truncation check in the DT init code
Ack
>
> On 01/12/2022 17:31, Ayan Kumar Halder wrote:
>> As "io_size" and "uart->io_size" are both u64, so there will be no 
>> truncation.
>> Thus, one can remove the ASSERT() and extra assignment.
>>
>> In an earlier commit (7c1de0038895cbc75ebd0caffc5b0f3f03c5ad51),
>
> Please use 12-digit hash and provide the commit title.
Ack
>
>> "ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() 
>> was needed
>> to check if the values are the same.
>> However, in a later commit (c9f8e0aee507bec25104ca5535fde38efae6c6bc),
>
> Ditto.
Ack
>
>> "ns16550.io_size" was changed to u64. Thus, the ASSERT() became 
>> redundant.
>
> Those two paragraphs explaining your reasoning why the truncation 
> check is removed. So I think they should be moved first. Then you can 
> add the initial paragraph to explain the resolution.
>
> However... I wonder whether it would not be better to switch 'io_size' 
> to paddr_t because, as you said earlier one, on 32-bit ARMv8-R the 
> address is 32-bit. Therefore:
There are some more drivers where this kind of change (ie using paddr_t 
instead of u64) is required. Thus, I wish to send it in a serie where I 
will introduce CONFIG_ARM_PA_32  (to add support for 32 bit physical 
addresses). Also ...
>  1. it sounds pointless to store the size using 64-bit
>  2. the truncation check still make sense (maybe hardened) in the 
> 32-bit ARMv8-R to catch buggy DT.

Yes, but we need a common check for all the drivers/code as the DT gives 
us 64 bit address (ie u64) and this needs to be translated to paddr_t 
(which can be u64 or u32).

Again, as part of serie to introduce CONFIG_ARM_PA_32, I will provide 
the following function to do address translation :-

--- a/xen/arch/arm/include/asm/platform.h
+++ b/xen/arch/arm/include/asm/platform.h
@@ -42,6 +42,32 @@ struct platform_desc {
      unsigned int dma_bitsize;
  };

+int translate_dt_address_size(u64 *dt_addr, u64 *dt_size, paddr_t *addr,
+                               paddr_t *size)
+{
+#ifdef CONFIG_ARM_PA_32
+    if ( dt_addr && (*dt_addr >> PADDR_SHIFT) )
+    {
+        dprintk(XENLOG_ERR, "Error in DT. Invalid address\n");
+        return -ENXIO;
+    }
+
+    if ( dt_size && (*dt_size >> PADDR_SHIFT) )
+    {
+        dprintk(XENLOG_ERR, "Error in DT. Invalid size\n");
+        return -ENXIO;
+    }
+#endif
+
+    if ( dt_addr && addr )
+        *addr = (paddr_t) (*dt_addr);
+
+    if ( dt_size && size )
+        *size = (paddr_t) (*dt_size);
+
+    return 0;
+}

And the drivers would invoke it as follows. For eg exynos5.c

diff --git a/xen/arch/arm/platforms/exynos5.c 
b/xen/arch/arm/platforms/exynos5.c
index 6560507092..15d1df9104 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -42,8 +42,9 @@ static int exynos5_init_time(void)
      void __iomem *mct;
      int rc;
      struct dt_device_node *node;
-    u64 mct_base_addr;
-    u64 size;
+    paddr_t mct_base_addr;
+    paddr_t size;
+    uint64_t dt_mct_base_addr, dt_size;

      node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
      if ( !node )
@@ -52,14 +53,19 @@ static int exynos5_init_time(void)
          return -ENXIO;
      }

-    rc = dt_device_get_address(node, 0, &mct_base_addr, &size);
+    rc = dt_device_get_address(node, 0, &dt_mct_base_addr, &dt_size);
      if ( rc )
      {
          dprintk(XENLOG_ERR, "Error in \"samsung,exynos4210-mct\"\n");
          return -ENXIO;
      }

-    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
+    rc = translate_dt_address_size(&dt_mct_base_addr, &dt_size, 
&mct_base_addr,
+                                   &size);
+    if ( rc )
+        rteturn rc;
+
+    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 
0x%"PRIpaddr"\n",
              mct_base_addr, size);

So if this sounds reasonable, we can still remove the truncation as part 
of the current patch.

If you agree, I can send v2 with an updated commit message.

- Ayan

>
> Cheers,
>

