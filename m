Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4A60FC2D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 17:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431094.683632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo4zP-0005gV-RF; Thu, 27 Oct 2022 15:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431094.683632; Thu, 27 Oct 2022 15:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo4zP-0005dB-Oa; Thu, 27 Oct 2022 15:40:15 +0000
Received: by outflank-mailman (input) for mailman id 431094;
 Thu, 27 Oct 2022 15:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo4zN-0005d5-L9
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 15:40:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3d4968d-560d-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 17:40:11 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 15:40:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 15:40:07 +0000
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
X-Inumbo-ID: a3d4968d-560d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVOS6z1Wgs5ar6UF9Tx7Zxo/dgF2doQXePGp2gNcY71RjbHZTJ+9Be3HHDEvO8YSLq6itySFpMzuCKsiuVK4ks++pdoSA5kax+sO/HCbBrbqM7yUKZyTS0bsmMJmiFWe1MlXMqgqs63UK1cH/JosIEcvg5jc2v3/ulZAUFPELcmV74KLdbRjbwPDlt48N7UT7+CEln0nfQiUCYrMlWQFrm1xuwkyhx1Wu0zbTlbSQ2SZVgjN+Vq9gk74xWLAkTVhxBJ7ariH3iH00QW+T6IjAWS93baEHMTiz14ExKdMAa1exnknTOPwpXMitt3FWg0T+JMFFcwO2VhXqY2d1OfRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xdya/2LdvajT5SSNeKEhvvkC8qdcVKui/z0ztWN+3g0=;
 b=UkpH5h0VFZ6FqG2mOZ/9/CHU/TX2MhohEYqWh45IyX88P0PthQhkpOizy/tl4XtoiRsbfNJ4leZ/psWrGqUQlcoyJt3cbQiFhAqCS3U7ozyJLhOk9T9P3Uv7Hz4mKkQUcSBQ3QuOXB9zj/pgUUMTPfMhY/W3K16V7Ez1tHBCjdAQHT7+T8lx8eckYIA36xRs8f0NFF+mkvKDjGab4oizB81wPmt9VHEhW8Q5A8kFPt+8UcTN56HLAbaP9UEbcqBiW5lk7EM6ZhEfK3mxDqCazsDJCOcw6K+Z0Fa/TyM60qpl/f3dFEyXfhLmTikOIbamNG/exduIYcLg42V8/ueOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xdya/2LdvajT5SSNeKEhvvkC8qdcVKui/z0ztWN+3g0=;
 b=byIRQ7jLcXtP+u+6wSQyOih0khSm7/1MXiprM6Pka3NXeh/fssRubzMA8+M/BoJvwMUDEiVRLrjfTipn94ooS2kCBGx7qbzRX65KoPb6f8owUySsc5eqjGSQqsESQkUJwe0B9nObOINgtdhvi+GYm4u7YzjmDnCljxuKKa5Hi84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
Date: Thu, 27 Oct 2022 16:40:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Henry.Wang@arm.com
References: <20221026183004.7293-1-ayankuma@amd.com>
 <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8c31a5-dffd-483c-19cb-08dab831863f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hvolDu4usPj7Ta4HIOyvCRb9Ohip0Uyj3YqScN57nDpSldPfNlvrvS/LFDJQzDghA4szP5Yt7Hvv4Q21ncLQ+uA57pSCNeQPVX+xFZtwlNJCo8cQgT0sPdViO17YfWxTwWSEvCxSoMDr88AH//NlatEDsGYZBRIf/UcTkVfIP0A1F52pvKkQ7IRKaZHTne70DDsK9qdF8nAeLogDGtjm5IqH/24KzohjI945Gkmgng8Gs14WDzePhmnNOGDrxP+Hba2pv6sBrfN0ZAA/iI8aMUo2UYa6Etppl0u5mR/VK241Scc14Ozmvs94uhBshqs9oGOHjYMLIJDTVGzFGWFY7QmqWOaFdjg3wuH27dcylhrj0ZnutLzJk9Ozquk/xqzP7vqC89ltTkOHjpWTXR33e50044TZnuZZ9GR2q/jV+WTlTf5Ffh3bmIv53/3TzxqN7QrB5P+D/xsgW8Ol37lwJXoi8LQzsPK3fd605QuxR3ngBR5W865YjiANvCCclkFn0qiZALQuFM1T23uHe3ORgrnpXaJI4N0PdjfjgsuV+3ulP9XdZnki/BaJDJGj9XNq3u4690BdIB9l9vNruzqkx6FIpl8m2EI+6R9LlSq2a1DMzY7pG6WUc0T+zCmlnPl5HTmB+KWLt/9Tj4Lna4xkDrP/3uv0k1DlCnOXZrr0Lv8XO9MBiX9kGOFXAPNfiFVe8wAxP7JNvCx8cx3lvzwNZvrGKnnm2EiiSMiLPmAmcOKqA/mOkwhWUlTqVBOIofsUvH0Jjci41JvVDWdrNHcHN/yKWAzkIMjZTMKuO6k07nI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(478600001)(31696002)(6916009)(6486002)(31686004)(6666004)(316002)(5660300002)(2616005)(53546011)(6506007)(4326008)(66476007)(66556008)(8676002)(66946007)(6512007)(8936002)(26005)(38100700002)(2906002)(83380400001)(186003)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUs5eWptQWgwWXNlaFlEaDdZNmd2QW5jcFVtdmpUNFpDRWF2MlNlandRUyth?=
 =?utf-8?B?bUlmeTBKOVdQTjZIcGpvdzZ0enhMZTd4b3puQlJzTlpaRnlCWGxnUHQxV0x5?=
 =?utf-8?B?QTBpRk5FSXhZQ05JTjN6eCt4dmJJbnBNSDU3b1lPUEQvY0xzV2JkaUNKdEto?=
 =?utf-8?B?NXNocjA0UUhxMTIzSkt4TVc2VWUvZXFYUnV5Yk5oVzNub2M3eWtmaEE5cEFP?=
 =?utf-8?B?Vm9ESEhiR0lSSkh1cFMxbFFOakw5d3hYRVBaWUFvVnhXY2NINTJSeHZ6WnJR?=
 =?utf-8?B?LzNDL2xEbGxybTR2ZWJnZVkzQW5XeXh4L1A5c1NtL3JiMlUzSFhNOGtnOWxo?=
 =?utf-8?B?WkVUcHowdTFGM0ZpTWo2RVZvNVdTQnZBL3RlM2wrT1VYTTFQTHdDekpDMkh2?=
 =?utf-8?B?ck1tQlB4cFBFTE5tRmIxZFVFQlJSUUlaU1NQc0NOMTgyeS9OZ1NoZ2ZLTTZJ?=
 =?utf-8?B?TlZZcFNwWjBNRlpGNXFrOGlLMGhlb2dVeGhra1ZwVHgxZmVrYW5rT3RVUzBV?=
 =?utf-8?B?NHhlUnlDcWpaa2pDUmc0QmpXdk9OV3M0T2dvUHZBM0dHOVo5dDBVdjUyRkZD?=
 =?utf-8?B?b1ZxZUhOOXdLU2VuYkNqb2dqeXp6ZjU3M3JqOXRXaklhZlduMVRXZUJ3N3Fz?=
 =?utf-8?B?YzBybWJJOXBSMGdqNWQxcG96cW9Wck9jTDFtL28xdUFYbWRuV0JyYVIvSUJk?=
 =?utf-8?B?SE1aQURaUUVMTWZjYk1lUUJlSmYyZEYzV3gxejE1WHRYQVZCUDAxbXMzc21B?=
 =?utf-8?B?UGZaZWdQWHVwb3l0QWxLWmpVUmt1S0dWSFVLUEZwL3ZGUXRzOXEvVGI1dFkw?=
 =?utf-8?B?RDE2K0YxbTd2WnM5MkJyN3NvSmdRb1ZFTTU0bDZYOXVkZWRXMHZvdmFTUnR3?=
 =?utf-8?B?L2RVT1J5dmduS3R5djZnYXQ5WS9oeXBJZkxZNVNxSHdqWHN2RFNvZGt3SEh0?=
 =?utf-8?B?ZjNjZjlSNVNoNzRQd2dDcW10Z1V0UTJScGxRRXNQbUh0SFkvYkN6YUpQdWFj?=
 =?utf-8?B?NlBXUDlzcmdMSHFLdkJRUHZZcndwWFF1RDFzRS9qU2RIem1nR2t2U0trZTdY?=
 =?utf-8?B?MXlJTDYrMW5UN3ZTRFcvT2JoNm1vZWNEeERBNjBEUzh3NldnTUNYR3JRZVlr?=
 =?utf-8?B?VzRTbWJmRTFjNGRoN2cvOEpNRTJsZTFMbm9OTVp3cStlc20yckhPcjBtTkRS?=
 =?utf-8?B?SW1GMkUycnM4bkN3S3FqcjV3eG5YajVTTkd3ZlFoWGhzSlA3VFJBellNcFcy?=
 =?utf-8?B?R3A3YkJreVFzZ05rRXhQR1I1WUVvVGFqOFd0Qy9lRnFjdFk4QWZhTHJqZjA2?=
 =?utf-8?B?a0lQRm5QVDg1ajZ3dGVvVDJBVWRoeERzZVpIdGhTQ3dtQSs3d3IzWGlHWkxv?=
 =?utf-8?B?SnM1ZVFsN1NQMzlaSlJVVFQzNitRSHBLU1BXOFU5cHNycXFtdTB4RzgzUG1t?=
 =?utf-8?B?eFYvUVJCOUJPSnFZUHBobGlhZHEwVTJqTWFVNm9BOU85ekY4YUp0dUgxcnBy?=
 =?utf-8?B?S0s3V2tObEZpV2U1YnhaWUQybXVSMFcrU1hzSzNDdUN1cGxSclhLUDNoeG5B?=
 =?utf-8?B?dVFFeWpSSE9VSDIxM2lWUE9sNFRJYXRneTl6SFNZS2lsOE84bXFJdENyaFV5?=
 =?utf-8?B?V2t5RXlaZ04xUERvcDhZbnRkSkxsU1dKb09QQVJtRzlTWWNPaUwvcG1LNDZs?=
 =?utf-8?B?Q3Rhb1VQS1RIZWZvQ25uN0orVFNGTW01MGo1bnZONlEwR1ZkZlNmQmZvZkZY?=
 =?utf-8?B?aGNwOURTaW9wTTQwdktUd04xdHBWVzhRWFNwRXBPamFScXlSSW02Z0d1TXdJ?=
 =?utf-8?B?Q05oRWhUNWpYNHpFMy9tVmhNWk9JTkZWY2NqRVVHWVJ4YTZMUXFVdHl3cFpa?=
 =?utf-8?B?UUc2TmN3bVc2ekR3OGllbnpIeHR5SFJXYW5NM0EydndTcWJCNEF6eVFOYmtH?=
 =?utf-8?B?WVhjM2JOOFJpVjBETjRrenVTN0V2OWRvcWEzS1dHTmlwTUJjbnc0TmlwMmh1?=
 =?utf-8?B?RGJialVQSUtKNVZWNjlxa29tWGYxL3g0RlgyM0xMd2FGSitjbGpFWjdYbkZ3?=
 =?utf-8?B?OHNDSGQ0dlpBYnpVbHQrVDZsd2RyK1JuTlFJZjBldTMzNWtOR0ZvT09iU29W?=
 =?utf-8?Q?Hew05jwhd1mr4XPg3uapgTL4u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8c31a5-dffd-483c-19cb-08dab831863f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 15:40:07.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS7jpcnf7xkESy9/6tf5g6VsB1Jp+hpPo8TFPzuBL+7HPGIoICHjfvLY6Hsgb846fgozMghZ8CbmfceIjozuxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117


On 27/10/2022 10:44, Andre Przywara wrote:
> On Wed, 26 Oct 2022 19:30:04 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>
> Hi,

Hi Andre,

I need a clarification.

>
>> If a guest is running in 32 bit mode and it tries to access
>> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
>> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
>> This will be stored in a 64bit cpu register.
>> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
>> in the lower 32 bits of the 64bit cpu register.
>>
>> This 64bit cpu register is then modified bitwise with a mask (ie
>> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
>> 64 bit cpu register) is not cleared as expected by the specification.
>>
>> The correct thing to do here is to store the value of
>> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
>> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
>> vreg_reg64_extract() which will extract 32 bits from the given offset.
>>
>> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
>> v->arch.vgic.rdist_pendbase. The reason being v->arch.vgic.rdist_pendbase is
>> now being read/written in an atomic manner (using read_atomic()/write_atomic()).
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>
>> Changes from:-
>>
>> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
>> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
>> appropriate commit message.
>>
>> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
>> v->arch.vgic.rdist_pendbase in an atomic context.
>> 2. Rectified the commit message to state that the cpu register is 64 bit.
>> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
>> clear.
>>
>> v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
>> in __vgic_v3_rdistr_rd_mmio_write().
>>
>>   xen/arch/arm/vgic-v3.c | 19 ++++++-------------
>>   1 file changed, 6 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 0c23f6df9d..1adbdc0e54 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>>   
>>       case VREG64(GICR_PENDBASER):
>>       {
>> -        unsigned long flags;
>> +        uint64_t val;
>>   
>>           if ( !v->domain->arch.vgic.has_its )
>>               goto read_as_zero_64;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>   
>> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
>> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
>> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
>> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
>> +        *r = vreg_reg64_extract(val, info);
> That part looks fine now.
>
>>           return 1;
>>       }
>>   
>> @@ -566,25 +565,19 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
>>   
>>       case VREG64(GICR_PENDBASER):
>>       {
>> -        unsigned long flags;
>> -
>>           if ( !v->domain->arch.vgic.has_its )
>>               goto write_ignore_64;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>   
>> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
>> -
> I don't think you can drop the lock here easily. If it would be just for
> the LPIs enabled check, that'd be fine, because you can never turn LPIs off
> again (but that would deserve an explicit comment then).
>
> But down below you do a read-modify-write operation of rdist_pendbase, and
> need to make sure no one else is attempting that at the same time.
>
> Cheers,
> Andre
>
>>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>>           {
>> -            reg = v->arch.vgic.rdist_pendbase;
>> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>>               vreg_reg64_update(&reg, r, info);
>>               reg = sanitize_pendbaser(reg);
>> -            v->arch.vgic.rdist_pendbase = reg;
>> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>>           }
>>   
>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);

Shouldn't this be "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" ?

- Ayan

>> -
>>           return 1;
>>       }
>>   

