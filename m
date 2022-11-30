Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2B63D5E4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 13:44:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449871.706877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0MQu-0002XP-54; Wed, 30 Nov 2022 12:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449871.706877; Wed, 30 Nov 2022 12:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0MQu-0002UN-2B; Wed, 30 Nov 2022 12:43:24 +0000
Received: by outflank-mailman (input) for mailman id 449871;
 Wed, 30 Nov 2022 12:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCy/=36=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0MQs-0002UH-0R
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 12:43:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908c28b9-70ac-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 13:43:19 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB7449.namprd12.prod.outlook.com (2603:10b6:806:299::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 12:43:16 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 12:43:15 +0000
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
X-Inumbo-ID: 908c28b9-70ac-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQzXxcwvTaAD6CcjUBbeFt5wnrWfr6RLvbvJCDSVhsQ3vYuKxTxDiruD1N33/NI22XGv6uanXCvTWSt7UxyrKeIN32+QixBbACa7pCXBE2yjRwLQIw9pvXK/ox0XY8CMaX5NGkWWVlGjmEXUiKf4AWtJWyoNePfVXPb3T9LLxDnUdgOwU64h0FtI8jIh8Hl4kCO2C2d/quEL/FylQ7rOYUKjnA41YteUeue2eTYdeFGprJgMm/CtsRSvoD0eQYwTml3vmnRA8gQRhTP5/7HHNmvU5QX2Xgis229w5AAML1XM/PIP7okNd8DEZvO6B/brb5UrxraYJ2lNdwcJuiJxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwnZRvaQilf5sgrXXdNIkyArvMuVhp1jNizG2R1Qvk0=;
 b=BLAL2D1maGAtTKXiB0cE9I+XvJYWNlCoSdNKhuhrCDkbDHRkNyREWbQGPqivSbItdDJR9RZyOiY5GB5QWj/L3dWxzFBLb1FemHTSj8WPvvKX7imG+xX1jqqRpgyg/l6XOFQ/GFxaHt8f5gWBJaijUPAiZhE8dRvn9QUTRjP+F3GoOaLnbIY8zwF0qm33FU2Nx5PB03Te7UW6IuVRZ6hUYnO3hp2HxuN56vTpzi3PSByXSy/uAKcmR2tNWQY5PgRNxXbMt3bO6sWfKwrkvr/oUPhgGu0GGl3rNXJE+gTmu0cVCluR6znuP3K6reYKmex9DrE+sa4JfIpwZJGUwSBikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwnZRvaQilf5sgrXXdNIkyArvMuVhp1jNizG2R1Qvk0=;
 b=iGUUXXClvKXpcCJVeJfWFHK8soDCd0c3F8ik3S54/7YKzFeE8AC8WqdzAknub6TQwxZCFu9+uaYXlshPfFAuq7U+YjhRUoAGB5+Xw01urLgQY13+uLN+//LElUELPZOfyscblf8/+0xFDe8IfPN2CmD5LAA4gMKZzVTTcUsOQPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <60f34cf8-0b24-9b1e-c515-194b46615f35@amd.com>
Date: Wed, 30 Nov 2022 12:43:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
 <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
 <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
 <21ae8452-167c-88d3-1604-162018408ea6@amd.com>
 <fec9fd11-7bbe-da64-6417-264878b06ec1@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <fec9fd11-7bbe-da64-6417-264878b06ec1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b922012-ae40-4e1b-a71c-08dad2d0734e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWWBR+xIHMrohdx6tPakVEEouwfxS9DWE/pzObHn/6IGzprkD2RoRD2E+/PDNA71DEjIqW+MOwsGBwjTOE1k3+wAXDJ8ZpNhi5pSJFJbeRfhlok/LgPMb9g+LPYyDkjTRSKhH+dqkOGO5BtDNB7/yzmGedJhJrX/7xCURMsJ8Wvao69JAqj9pTxTJApS3a4k5BqB8zTvCfkrpAFcx5UakmpbcGZgrVIk8GhG5dgbHtOmDqaRTjtO9lEfH55Vyunf4HFvXp73rGsZy4i1KLAFYNXKsVdIwYw1tQQtULIW2/iDgbZU3dWlheU8vBc+LX/G0eAUMIjQgJrHXS3eh+4wleQFTFILv4Ig85uPjoBdbJvMOtCbgc2dpmY271Nmg+h7Gq+jYRLOkjzbmnIpiFGhY/9eUUTvt1selH7mV0aQ3c5v29/EBZJ253NZdAwUZ+wPyZIqSqpwuwIffJg0oM4ZV41uFyQYnVdOCIQHitA90DeYEqG4Tum3gA59ta8xa83X5NYaI4tjEGuRIgpT2TEGaHA2gnHwina2xUwInglk1h96yo2s9xEduWhYooblIngXBMt8nnjXBxHAOy/XnfaWVhkjVl7HT7K9ftHw7I8u1p29JsFALWszN+pgrHgAaNsDJ9rzoJ/t/wvdMSQXRs3RtOO9Jlp0w6EesKbMLkdtbwsvhFo+5F1S0n5lduF2Rpkw/RBctMtbzNrHjXnILKEBWqUWHRNT9ltwDXbi+IBxdCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(66556008)(66946007)(31696002)(66476007)(2906002)(4326008)(8676002)(41300700001)(54906003)(316002)(6916009)(5660300002)(8936002)(6486002)(53546011)(6512007)(186003)(2616005)(6506007)(36756003)(26005)(478600001)(6666004)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NHakdmZ0ZDTktHYjNEUjgrRkUzWndZblV5dXRLV0ZYTC9GdEpkRUZuV3Yz?=
 =?utf-8?B?OWE2aHdNQlIraDYwckVvR1RvLzB0SkttQWRjdUFuNXhxNlZ0YmhXaTIxNllS?=
 =?utf-8?B?TlNKNFNucitaNG1zek9MakxvbUY0ME5zOXpLOUsvUUVxSzF2eFY0RHR1SFpy?=
 =?utf-8?B?alpCeWpLVnVwQ3dDUnYwN3B5Vm1DWGNNbUhjRElHNHk0N2piTTNzUlNMdzFL?=
 =?utf-8?B?bk12MlBIMG9ESU5ERlRyREZwUmZjcy9xand4VkZsTHkzbnBzb0J4VHRmMURH?=
 =?utf-8?B?RVB2dUEzNTc3eXQxTkxSYndRL1VuNURiQ29NSlZQOE1LVHl2SGJ5K1k2aXhC?=
 =?utf-8?B?S3BqdythM2RhWjB6SFFMQWtBcDZDQW9EOFM5Y2trUXJYLzlGNWNIVHVnUWFm?=
 =?utf-8?B?ZjdDc0hkSzVPdFNwRmdwK0tsaHRGWms0bDVJdXFXQzA5UmU5aG44WURqQStG?=
 =?utf-8?B?RjZWNUJHREhTUnlKVkRrRXJZRUxYVUlDZlJ3OEZOWkc0ZzdXWWJZYTI1c0Qx?=
 =?utf-8?B?REFKK2k3L2J2SjR4K0xCOENJRHpEZXFwcTQ1aytrLzBFSkJUOUJRSm1ab1M3?=
 =?utf-8?B?QXJsNW8xSGc4aU5zdlZBbXhQWStOc0l5UForN2xHZVc0czI4QnFWeGJOV3Y5?=
 =?utf-8?B?R3BRTHhTSDFPbEV5L0Nab201SXFIZzBhUkNrRGhwK0E4K1BNdkZDdEU4Y1Zk?=
 =?utf-8?B?djRFMWd5cVIvMXNDMy9pUG1DdXQrY2oxalhXVjNZSitmKzZ5c3Z5eS85RzNH?=
 =?utf-8?B?NG1SS2JlcU9LQ2NYbFFRMThlWStXdEVzZCtYZmxyb2wwRnVHdlJhcW5QdGQ3?=
 =?utf-8?B?SUtuWVhSYXFsZnNvTTc2M3pGMHR1YjFvRVJuZm05c1pINCtqdVhnQ2ZTN0xN?=
 =?utf-8?B?aE5MWWQ0RHFackdUM08wMzlFblkxMDIzZEVvUGpkOXhrVGdzdk1yV0RjbFdW?=
 =?utf-8?B?V1JkbnNuU0hUcFl1OVV0eU1FL1g1ZzRCSlVaUG5GaERZdEdvOENZbkZqamRZ?=
 =?utf-8?B?WGtUeFdFQzZGY3FURDJHUnNSeTRUZnpRK016VHhrOTZpajVhOEhvR1pKMDUr?=
 =?utf-8?B?VDlMVkY4RzBWOWRRUDlJTDFYci9LeFJTcFdydUtYWUxvMG1VZHZaazJjdEh4?=
 =?utf-8?B?UC9CWm5MTVFWUno2TXVaM2M5bDdTd0VKUmZSL2V6T3VYeWdNQzNuVGVXalZr?=
 =?utf-8?B?SDRnTUdHS0VsbHRQWDFia0RIaW9PNG14M3d3dVVJTUkrLy9MemEreEJraWxM?=
 =?utf-8?B?Skoxcnl2TVlVVElsVHdZVVFBQ1JYbmhDN3FLK21Pc0dvQmFxWGpocUZtUFRy?=
 =?utf-8?B?ZFdZTTQzTXRucHhuSDRWdnljV0dhQmJGcEh0WUNhUHVNU1U2MWR2YWV2N2xV?=
 =?utf-8?B?dk1PdFMwWFYwK3FHSXYxZlJwcVZwU0FuREx4Uk1nR2drVi8xbjQ5STYrK2ky?=
 =?utf-8?B?K3MyQjdLd2JXWkdId3R2VEFXMkdQSWVJT0Q2YjRTdnlmQTZScmcyUDhuUHUr?=
 =?utf-8?B?aGNtYUxwTmpzLzNjRWxQalRTRE1xcWlacUp5allzeFR5b1pnTkdlUUo4TllF?=
 =?utf-8?B?aFN2SGViZjhydEM1THBlekdWQlYxcTcxaklRamNnbHRSMUF1aWJFRXZYVE80?=
 =?utf-8?B?RDJseUR4N0xuRkMxeUtrZUVLOGFuYmF2Zkh2Z0ttbnhRSEJwR1hpeVZta0tx?=
 =?utf-8?B?R1hBbWxvZjRaL0ovOCtxcHB1Z1NDT2hTOEVhMUdpeFhHdmhXdnhyRUVhRWJX?=
 =?utf-8?B?TnU2Rm1wQjlFdGVIMkk3VDJTQ2VJZi83VWpSalh5ZlZzRmp4bUZ4TWdnYVo3?=
 =?utf-8?B?V0tTRlVmWDZ5VyswbmF1bkRCUC9PdWpScEJRNDFIMXV2WDI3WVV6eHhKdmJz?=
 =?utf-8?B?bVIwUG42aTI0Y1plenFsdkNucTZCQ0IyeWdjcGxic2J2M0NvT1ErZnM3VE9M?=
 =?utf-8?B?R3RhS050NG1aRnAwSU1FN05HVnNUdzR2KzRieE5hcGFVM0haS1RDWnVmUHFK?=
 =?utf-8?B?WWYyZXdPV2hMMVZpYmNDNE9mbExWZHhvV0Zud3FlMFBQYXhBK0VrcnRORjh3?=
 =?utf-8?B?TVRaRFRLSzJPZUhFaDVqRWNPL3NtM1BIY1drK2ZMK0FGaSt5N1BIZGs0eThs?=
 =?utf-8?Q?fvw28xoVlmgN9deIBNv+g2lIZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b922012-ae40-4e1b-a71c-08dad2d0734e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 12:43:15.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPm0t1zInJ8aHf92V4pSnX6x+1xQ5MzJ/JAEgUrLJ7iNLleGLbp/JC6ZjxIN4QWu3+xzkrqSVOYGvevemDt6GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7449


On 30/11/2022 12:01, Jan Beulich wrote:
> On 30.11.2022 12:27, Ayan Kumar Halder wrote:
>> Looking at "min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);", I do not
>> understand the reason for "... -1" (ie subtracting by 1).
>>
>> Do you know the reason ?
> That's because fls() and flsl() and friends return 1-based bit indexes
> (with 0 being returned when the input was zero), when we need 0-based
> values here.

IIUC, you are comparing the count of bits here (not bit indexes).

PADDR_BITS = 52 (x86), 48 (arm64) and 40 (armv7 arm32).

Also fls() returning 0 is correct as none of the bits are set.

In this case "flsl(mfn + 1)" will return 1 when mfn == 0(min value), so 
I think you are subtracting by 1.


Should I send a patch to fix the below ?

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..cd390a0956 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
  {
      ASSERT(!first_node_initialised);
      ASSERT(!xenheap_bits);
-    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
+    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG);
      xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
      printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
  }

- Ayan

>
> Jan

