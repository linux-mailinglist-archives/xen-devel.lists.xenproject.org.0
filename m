Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DC737429
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552232.862190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBg6F-0001cX-Ii; Tue, 20 Jun 2023 18:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552232.862190; Tue, 20 Jun 2023 18:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBg6F-0001aO-Fc; Tue, 20 Jun 2023 18:29:07 +0000
Received: by outflank-mailman (input) for mailman id 552232;
 Tue, 20 Jun 2023 18:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DaFZ=CI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qBg6D-0001aI-RS
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:29:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55538cc6-0f98-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 20:29:04 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Tue, 20 Jun
 2023 18:29:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 18:29:00 +0000
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
X-Inumbo-ID: 55538cc6-0f98-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjL8m6FAhVhybR9MP2n/maU9RhTAtTKr04Lkqj/hV18d4RBxwjpRHva6BP0m+tQeJy+q4ZdOzQVO2Mlnsspw2Qiy+MgQjL1e9Y6t1IMNEHkt5KcEtkxY0tseZ61guPhgtO7vmC8c81n4nap+W8ueAQ12AqVF9KLgP75u0Rs4zXrGHozLyJ3xj5JnLJ8vOeyqD9W/AKwqU+uBSHqYdE5SOtAl+aA+66iBMwgpjump9CT8vAUf9G/+EAfEEBLwpG7MF2v0heFhRtrw8dYWp3zWiduxLhQTQQ/gKFRhjSfmiSwqWUgLmr0V5a4LNt0E0EscEw5qLXXHrxzofFRZVFWaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um1Q1Vanm/D1QbI7wp0XIu2hJX7VGk0raR4T4yWZFsI=;
 b=ZhlOcL8d0+DysBiTikokFYFzzbs0zlT/N2qU4s3b+JUEPMwasv/moOESx9mfw+GYj72CvI+gfBpKk6e5tyF+OmrAEWThpK3uJc1xyQXYPgSzqt5A9ZHWxno1WM8iqwZoBZy1fF2QeiGO3o8hghn55y1bjTqTX0eyR97uZTCDJ2hEtLf9D7u5DoWgHPiqpbAOAOeRPTUabY+rrpk3Fkcavj4oTbndqdeDpMAh4DJgKzmYvgBu9KfqAe9vfE3krWELtpPKQ+Y8wSr9L7/X4yElhMoEFKlg1/Gf08vXLhX0J0Fum05xbHR/MMnWU1P/SA0xuTP7yJjs+w+Jmbl9N9kcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um1Q1Vanm/D1QbI7wp0XIu2hJX7VGk0raR4T4yWZFsI=;
 b=aj6Q83OmPGoacTPRbNrwwB9ZzlpVdv6ytv5pQZOUaxad1HRj6ATEgbmxKxsxE5UDd9/RzlT4IoNtYS6sWJ3VW3zOMp9GbUGl3w/NCZgjddc2/XqxS2zNauRTmmX8vbBY9E4Ft4Zz+Y2Qbda2OMHj8tA7C9E5Xy2no5NXw7mAZzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
Date: Tue, 20 Jun 2023 19:28:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0390.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: e82f65a8-fcd9-4566-d84c-08db71bc3745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l2elAZ6WVdqn0/lZh5u78nMfeWwYT3UKVxzmRbQYMisy4mgZj8Z7xMOw0jErwWnytIm7imcnarQnetR24x2IU9BRX+m+RkvcuauzHBwHZHLUFT4g2WgO+Cbz1SGjnAGRbU0AEQLoot+ya3j5r3EpzmZhNY9Aeuqvi5UWKMYk2ts5x9CTo+NCpBi9V4gPN/++u+sMTxBLqqy5x6Jrb4pq5EcL6zTVtDdDIYnPvyls41IOqXyxzcVahJ6ibYFSO7rkt0Xb4tmTtVHo0cLFjl3GCCePDdl7k/avQBMyBHdG8yLGsqpvc2BWECf26wDwAmz82CeQqFu3bhhX2+2cgs9roUGxEepw4MjtgqOUHLc5z88wPf0zR0BcJ7NChWGUsJQ5w3o34qbrXthQ9kSZg+CKnuChxneQBh7jALxipCJt0HM1y2juwHGnTzn5vj6/VfzdT54VbEbEwhshmn2QaS4/Y8Oe562aqZAHZLG7tm9Y9Z1FB2HCkaE5jjLr+/Dug8RxzEo2dTcMEbx7cAvvN2ptEZHIaViscl7Kyzk0lg0OT+HwPfffIsZp/dKEwqlhmAcnT+A/EZxk/YM0/X3SYNBJegFj20OaWvcIIt2Yq8EwEEN1gS7aY9wT5KzUAKoCCcqnZZjGKT10Vkuv02MQmSXHsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(38100700002)(110136005)(31686004)(41300700001)(31696002)(6666004)(66556008)(66946007)(8676002)(316002)(6486002)(8936002)(66476007)(4326008)(36756003)(2906002)(53546011)(478600001)(6512007)(26005)(5660300002)(6506007)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGRzYUZINy9pMkhoSXZQdUVrRlpOTWtaZ2tWR3NrS0RQSjFGaDRXZ0hSQVU1?=
 =?utf-8?B?SVV4UVViZi9wYmNFQ0o3eVNyOE52S0xsc3AwYjU1Q3R5YTlBTzduTnRwT3p2?=
 =?utf-8?B?WUk4dnVhK0dxNFIzWE1Gckw5dC9nUUZLektLTUticVRJZlVLUm9aK2Z0cFhz?=
 =?utf-8?B?c1lLbW8rSms0SVVUN01wNFo2dmVjNldCbEZQTElheDJpUHdMRFZIU00vRERI?=
 =?utf-8?B?L2RxY25vcFQ2S0orcThOcVRLaHdrMnBuNkJVZzBTUTJTL3NOdXhvLzNXWGFM?=
 =?utf-8?B?eWNpazk0bU1mN0JuNWFWSkZvVEo2S2RMaG5mK1JQdlR4YWp0VjNJc2hjN0F1?=
 =?utf-8?B?N0dkRTVTWnlFaXB1YmlDSVpDYVp5ZDFIb3R4cTNYQ1BLLzFCZlN1MGFCRmRp?=
 =?utf-8?B?Y0E1QzhlTXVjbVJrcmdvVTdFbk52c2R6dG53TDJvMjVCN2hBdGtqWjhleE41?=
 =?utf-8?B?cjY2SDRqVy9LV0I1anJzb0JtYTlFemcwVldYWm5Hb2pDZmF1Rzc1R1BDT2dV?=
 =?utf-8?B?ZkxySnlLUGJtTVp4dFRzaThjeHB2WEVTTXB3QU4zYU5kVFUxV0J2aEJ3WXA3?=
 =?utf-8?B?d3VJWVRZUVZUTkFueWxqcmw0SXRkb2dVNjEwWGhrUFBjc1krSG50N3JmclFl?=
 =?utf-8?B?U0FUeUFQK2k5WloxdUpCOEoxZmFsVVBIOEh0ZHBIbTRvbzh3aXBoSTkrNEpH?=
 =?utf-8?B?OHJYamlYR1BVeG5LL0tJRVl4VUFocHcwemlkZUs2Ykh6a2FTV0Y1T3dUTHE4?=
 =?utf-8?B?bnkvRmdQQzNEa3g3cENUZm9ENzcvNjBuVFBLWEs1OUJCUHZZZjJBSmxNLzhG?=
 =?utf-8?B?YWtyMUhGYkNxSmExaXNWcy9lczg1aE5hSFBkMzY2czBFaEZjdmpsTlNtWTMy?=
 =?utf-8?B?Z3JMelZFbjdZeC94R0o0MVpUYk9lUk9jL1hQTkNzQ1FIbmVqMUpoeXNyTEhq?=
 =?utf-8?B?OVlNL2gzYldkTlBzYmhEYmRvbUIxRFNoOWxoUXNwcE5oWmZWYVNzTHNoUTBm?=
 =?utf-8?B?STNrQXlHMStnWGhNT1NwWDNSblBuMkhrRXh1c0JQNktEU3p1dXl4L3RjaVAw?=
 =?utf-8?B?SnRRbUlKWTFTRUVrWXdXWmJ4RTFFTERSMnd5MHlaUXBDUDBKNXF3bEFZeVNv?=
 =?utf-8?B?NUh1KzYvNUQ2d2xQVk5DekJUcVNoaGFuaGtCMmYrMllFQW1WZ1ErVFdSMVdo?=
 =?utf-8?B?ZGNGWDF2enJlSHR2NEM3S3ROK3pDc2NwSDlndGZIUmxQN28wdTYwSEQyTlYx?=
 =?utf-8?B?THZZOHNLQVFFWXhHMjh1ZlNZWEplMmlRRmdkU1JSMFUyeWZOMWtjSG4rWTBL?=
 =?utf-8?B?SXhkUHdIbW0yZS9YUzhkUnduRjJXek8wL1R2Sm9vVDVCOFVpQ3BWcStpdEVs?=
 =?utf-8?B?RFJUYjM3TzZOL2J6czd0S3pDeHMxNnlaSnZkdHZlS3dGd1BDRmlUYjJRWDRW?=
 =?utf-8?B?VUFXakNnSy9SbldWMlhVbllKei9RQU1CMEY4WlE2Q3gwblQ4RUtaS0lGakRL?=
 =?utf-8?B?YTE2QTFvU05iRmxWdVJJaUY3Vlg5T1Q1ckZkM042cTUwYjA5U2FLV3ZSZUFB?=
 =?utf-8?B?a1NwSmYyenZpczRuQjE0TmtIZFpXYVhaYWk4VlhTTGVKczBNeWJtaG1sWFJy?=
 =?utf-8?B?UUFFZzJ0eGUyWDNZTk1DbFlYRmlrRjV6bUlDN2RjVTRSMFdoREhveG1QTUpp?=
 =?utf-8?B?QUFMZEIzaGhKVW5RNlRjS3ovN052cnBCUTR0d1ExZlZHcTkzRjZBN2dlRWcv?=
 =?utf-8?B?c0JDZHJ4cG1hMGNwNUlnc2hVZEUvSS9ZYVNLdUk3bktVdFN4VnFNMCtBUmxi?=
 =?utf-8?B?bGdZeFZqWXpnZnN3dkxGbjBiYnFPbnF1WHlxNit3QXJQQVpqdC9jRkFMUWFr?=
 =?utf-8?B?MnVJY3EwZ09VdUplN1AzamtHVnhic3RoQXB2aExxa1dxQUlncUJ2MUh1THAr?=
 =?utf-8?B?NnZ2WENLNnVzNExCLy83RjZ6elRySzhTT0FmQnRZd1hqVzI5dmx6dXpRRkVr?=
 =?utf-8?B?dW1qRGtFK0lleHFBT0dXRUgzaUNMNHpGUEhWcGczNi9UdzU2dEM3TnZ1SjNU?=
 =?utf-8?B?OVhSMGY5djh5K3UwODF2WGh6SGJzcCt6MDRVN2svMEJaVFl3UlpyOTBmWGx3?=
 =?utf-8?Q?ET9MuVRbPkaX9Moa4tGBqzaM3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82f65a8-fcd9-4566-d84c-08db71bc3745
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 18:28:59.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRQf84j61TGy8vyfUV59RR74kooamRG01jSL1QAQ0l1lAGydjEiOnT0ttNPABVCpnGJNcQIlxQolKISVtzZNcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037


On 20/06/2023 17:41, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 20/06/2023 16:17, Ayan Kumar Halder wrote:
>> Add a special configuration (CONFIG_AARCH32_V8R) to setup the Cortex-R52
>> specifics.
>>
>> Cortex-R52 is an Arm-V8R AArch32 processor.
>>
>> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
>> bits[31:24] = 0x41 , Arm Ltd
>> bits[23:20] = Implementation defined
>> bits[19:16] = 0xf , Arch features are individually identified
>> bits[15:4] = Implementation defined
>> bits[3:0] = Implementation defined
>>
>> Thus, the processor id is 0x410f0000 and the processor id mask is
>> 0xff0f0000
>>
>> Also, there is no special initialization required for R52.
>
> Are you saying that Xen upstream + this patch will boot on Cortex-R52?

This patch will help for earlyboot of Xen. With this patch, cpu_init() 
will work on Cortex-R52.

There will be changes required for the MPU configuration, but that will 
be sent after Penny's patch serie "[PATCH v2 00/41] xen/arm: Add 
Armv8-R64 MPU support to Xen - Part#1" is upstreamed.

My aim is to extract the non-dependent changes and send them for review.

>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/Kconfig         |  7 +++++++
>>   xen/arch/arm/arm32/Makefile  |  1 +
>>   xen/arch/arm/arm32/proc-v8.S | 32 ++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+)
>>   create mode 100644 xen/arch/arm/arm32/proc-v8.S
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 61e581b8c2..c45753a2dd 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -3,6 +3,13 @@ config ARM_32
>>       depends on "$(ARCH)" = "arm32"
>>       select ARCH_MAP_DOMAIN_PAGE
>>   +config AARCH32_V8R
>> +    bool "AArch32 Arm V8R Support (UNSUPPORTED)" if UNSUPPORTED
>> +    def_bool n
>> +    depends on ARM_32
>> +    help
>> +      This option enables Armv8-R profile for AArch32.
>> +
>>   config ARM_64
>>       def_bool y
>>       depends on !ARM_32
>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>> index 520fb42054..2ab808a7a8 100644
>> --- a/xen/arch/arm/arm32/Makefile
>> +++ b/xen/arch/arm/arm32/Makefile
>> @@ -8,6 +8,7 @@ obj-y += head.o
>>   obj-y += insn.o
>>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>>   obj-y += proc-v7.o proc-caxx.o
>> +obj-$(CONFIG_AARCH32_V8R) += proc-v8.o
>>   obj-y += smpboot.o
>>   obj-y += traps.o
>>   obj-y += vfp.o
>> diff --git a/xen/arch/arm/arm32/proc-v8.S b/xen/arch/arm/arm32/proc-v8.S
>> new file mode 100644
>> index 0000000000..c5a566b165
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/proc-v8.S
>
> Below you say the file will contain v8r specific initialization. So 
> please rename it to proc-v8r.S.

Ack.

- Ayan

>
> Cheers,
>

