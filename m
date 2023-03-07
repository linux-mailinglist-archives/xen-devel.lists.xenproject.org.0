Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798DC6AEBAA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507753.781712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZbOa-0003L5-Vq; Tue, 07 Mar 2023 17:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507753.781712; Tue, 07 Mar 2023 17:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZbOa-0003Ib-SO; Tue, 07 Mar 2023 17:46:40 +0000
Received: by outflank-mailman (input) for mailman id 507753;
 Tue, 07 Mar 2023 17:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob8o=67=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pZbOZ-0003IC-RL
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:46:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00f862e4-bd10-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 18:46:36 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 17:46:32 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 17:46:32 +0000
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
X-Inumbo-ID: 00f862e4-bd10-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRtGRzphnlN5pP88mEYP3YQ3RSBp9dM6Md06REjFuykMnUZ0oEUL7v+OutsIN8KHnjmy2ZNeRBuz4MB3zQyf+rIzm/begKDwP0+MpiUFuQw+0QI0Z/ixiBReJ0DGkgZw95Ckc8T7tVVBenbr9/ghdF4kT0gyr7fB1uh/vbkk7VUiQBdszxtRj8aZjYAG7yR2GfhO9ZPW+4/kLVtm+yTag/+9GWlEGSd+b9ivvipWGIc6Gd60acyYfHJspBuMHgUpFoL2Cx9a7dPuwNJW+jqk7Fdnqu+orEH2aEgTRwJomcWVHUVTXdFiDgNZL4bUA5wqWpF421IUI5NUTKACyeAiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tJXt4RG4WKx1/yFmJmwlyt7r4nomhj+7N9nOuH7bQE=;
 b=OtLjBewsMtrTBdS6OkhnguOrDf2AruniZ2jI2W1RV1k1CCF+ZYHbW0vT9tCqlPZzc8J7GP5U6Y8jmd490LAGMN1VcRtBgJP3LyiNof5BXDNhM5uHvYMYQnsQadjVXck9vxHVkqABMoktuE5FTaxSEDbinEc1CqZXpG3VOjyq6+Xt/Ehs3cQLzq7tNWqyJ4rt7sKxm4js8N4c3qclNpDwpyGRTZjPs5S5eOhx+QdtmPr2B0OQEfsi5Vy0Tzlj8hT36zFldAs9nkw0Tre0174pBu42VSesci3v8yvmMgkeut2Qd+Daao3FbO9eqa+irz9JJXkuWwhTYPI6mYwGIjtjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tJXt4RG4WKx1/yFmJmwlyt7r4nomhj+7N9nOuH7bQE=;
 b=YYQ8XFJhBR4K30rUSApglEuNqIv2qo16HR046CeJyR/rhKXt0+z/Auce3++wjSfyOoIAWGqwXYv9HNhm9rfAaWHrh9+ubyRVn91SayHHOAlQXEaHBrbetJ5zfreVdDG7KcSxlPd+gOBB8P7XoPLRruv01Lf+tunQIb2o9IGufDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <f6ab5731-3d43-edc7-daca-2694269560a7@oss.nxp.com>
Date: Tue, 7 Mar 2023 19:46:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 0/2] Fix ARM Generic Timer interrupt parsing
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <6A06A9E8-4643-4920-83D9-3B628D29A386@arm.com>
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <6A06A9E8-4643-4920-83D9-3B628D29A386@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0061.eurprd03.prod.outlook.com (2603:10a6:208::38)
 To VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PAXPR04MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5271772b-1e48-4bd4-b7ff-08db1f33e306
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydVHa5U++x3opPQMAh09bqBeLy7R8skJZGpVQMYdrAhysjBL/vn9O6WnePexC4IryvSyAtRFB0nB9CdYLRfJzvZJjomg6jTMHW5rU7iLlwxsfKqs58MXxWSPAbm/9aO15+HvrwPitC+36nW6Xe88teWNUWc0KKMQr7ehoNUQpS8RopsxuL4hpJvH69V2xDxL2Ad9OOl2HK5VkchL1PJI1x441O7YaSobmResmnFko5kSg5gc1x6ATPNh4ncKTXB2UKt5Rpl4LFs6IptSWoJunepbLaTLqkiUuIrRHdlwRypjorjmYo/iL2PNMG/zVQo6TVTqDVPstnq5YOc5Jh2zI+KEQUl5KSmK76raIG25SaIPnPkyBMTL7K565bL+7j1BnnumvRz7zMVT3HwFtaeS7LXEStgTG3L3HWTO7J6Yrw67XuEFtglDi68+St7D8SGs8ldBbZB+M6QL43xZBapAsJLKt1nxJliEuo/3BfeJVIGkOYJe7Z7pd22tmRO73qEW+eDohaLQgM9WQYoTCR2xbBFzVKVeI5160fg2ag6813bNCF6ptjV6BD1favOxWm3Bi4F3ufRt6E5W0mRcpT7mXlXn4MllCirDMT9bNt0JHTEMSxBk3GgePMTFAEt2XSS++Zl/N8asoDzwFEdVE+KdF8r49BEW02qNduos5ZiAO2bSMeO8CNtlw4QAmBnr9TYe4Zctzik6oCoykzhte2bYNd61iMrDFJZODfswEMIVTQE98Ez/W06LUrBGPg8vEvXz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199018)(31686004)(8676002)(4326008)(5660300002)(44832011)(41300700001)(66946007)(8936002)(6506007)(6666004)(2906002)(31696002)(86362001)(38100700002)(66556008)(66476007)(6486002)(26005)(966005)(110136005)(478600001)(6512007)(316002)(83380400001)(186003)(2616005)(55236004)(53546011)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xveWRXN2FGcmEzMDZBUVA2bHQrdmJGYjBKeUw5RmxPc29tdHZhbTY4dUNC?=
 =?utf-8?B?U0g2OU93ckN5c3FKYnpuNnI0NWUrUTBZaTgwN3RQb3ZGK09TcUorZkpOc0R4?=
 =?utf-8?B?WE5tTmtpT29WcGZ2K1NYYmVYa21Wem1aNGhzdmFCZmFXeXhHVmlIdUJ1ZXJQ?=
 =?utf-8?B?TytHd1NUSGYxZWRuSE5XWGdjTVQ4NmY1SGJiMEprM081Z3ZNeEZDZ3VxcCtB?=
 =?utf-8?B?VzNhWFp5Tnh2TWptM1BxSXpaWXEvT0ZLWTYxbmdYbkQyM3hHaC92NThwQWUw?=
 =?utf-8?B?bXBwcVFiMGZIWkZLTllETDlQUVdRZUs0eTV6NElvUXJaU0ZrdEZ6WUdVYXQ2?=
 =?utf-8?B?MjFSTlNFU2lrTnJiL2FDTVo5WVJoNUd1eTZhaDZOaHhrSnJ5S3U5OWVMU0Ja?=
 =?utf-8?B?cTJJMUFFN2lpOUxkcFI4dk1Oek1pQWdRV2MzRTJoRk1LSjlZZFIwYjlIQjVx?=
 =?utf-8?B?OUEyUUhFTkNyUUIxdDZZVkV1eTdNVlZ6SGNYTnF5cWZpWGhMSHhOUlhhb0Fs?=
 =?utf-8?B?ZndlaTI5UVhUK2hxVnN1R2o0c3ZLMWdGYWFjOFM1QTFWbXJ5eGRaQzIxR1Vy?=
 =?utf-8?B?YVhJTTlsTG0vei9hSlpsTVNlQlJ3OGdLRnk0b1FpL1FqWFh1RTcyb2p1NDcr?=
 =?utf-8?B?c2FJZWltaHdHQ2cyaXZUczAvb1RJc2dTUk9VMHA4UjRKcElhdnNqekU4NGcy?=
 =?utf-8?B?MXREYWk5L29IOEdOWVNNR3JIampqbzFlQUcxU2E1WU9yUVBhN0prblBHbEpk?=
 =?utf-8?B?Tm40bENOWnYwMUxDbFM1UEloMTRIdzVqQ3hUakVvTldxOEtwWnNwd0tpK05G?=
 =?utf-8?B?MWE0MjU0N0R1Z281L21FOWpNVmtwTEdnclkrRnJrKzJpZjhCUmt5dVNIcUwr?=
 =?utf-8?B?VWh0Tk45bXhvUndCTHQxclBML0JoTi82dDFCdU5FNmdicHM3OXh0Nml6MDRM?=
 =?utf-8?B?WDhpN0puK2p6TTJnM0V0a0pvbEh3a2pDb0lkT3VkRVVCN3JEWmxyQWNkcTdK?=
 =?utf-8?B?eFNHU2tUMHVMNUhPNEtxdG9lZlJpNTU3Y2RsMkV3UTYyMFZvb1F3NlVDbkJC?=
 =?utf-8?B?YUVqSzRTSi9KMTl3cDh6Y0dPMlh6KzNsUlJkKzlRdzVVWUp4QUFhSy9Vb0VT?=
 =?utf-8?B?QlN4ZENGbzNFVEpGQWtsRmlXdnFYcGUxeS9JVUdpY2Z1aGRlMUtEZEp6UnFw?=
 =?utf-8?B?TnZZZitjRDZ1NEtBb0JiNEY3d24ySkNaS01iNDRqWjhyVjJMZGJ0Qk5KOHh1?=
 =?utf-8?B?V2JKRXFCdmoxUTl3S2ZWUWZBWTRBM2F5Y2hGL2swQktRemhISnN4RG9mNjZI?=
 =?utf-8?B?T3Y2WjZnVjcxellBR3haRldQYldmTlAzS21sejcrYlJmelpvdGsycHJUVVRX?=
 =?utf-8?B?SkRTcXpQcmkwZkxMeS9HcjZuMkxFS1c0bExZV2JJQWNsaXBSNVBzb01wSUpr?=
 =?utf-8?B?dDRCRGt2SkphMCswbjMzWkRZcUFEb0g3UEVNcHUyMFRtZ2ZaTHM5cDQ3ZWM3?=
 =?utf-8?B?cFgxUy94M3lnQWxRYWhGYnk4UXFCcFhwTTc5MWR6VVUwSC85NTRhYnpwRGhj?=
 =?utf-8?B?TCtNRDhibjlCMEdueGROMXZ2azZxQWd5REpqbkt5c3k0MEdBZlZ4WUFsREJh?=
 =?utf-8?B?bS8vT3lJZnpvWWhyWXEvWm5ZSUx4OTFxMzVCOFRzYnp6aUFNUWxqdFQ4aFRU?=
 =?utf-8?B?cGtMb3ppY3VCTWdkVEEwdkZlWUdQUG9MUTVRa2pRZHMySmJCSm44VUFSN29Y?=
 =?utf-8?B?b2pHcGVnWklxZEhnYnJuSjZoZ1Zmb2Z3MHJHTGtYN0RYUko3Sk84ckVPeDVj?=
 =?utf-8?B?eG4vKy9uTWVQbHZiWU1nbStQRFY2NnpXRGJPZEF1eDlCNWs4Vk5YaXplMXFw?=
 =?utf-8?B?MnVxbTB6ZDFEMHlVdGwvUDZZNGRkVklxdzFUanZibzlQN0JkaGYrYmM5eC8y?=
 =?utf-8?B?bUlVYTR0OVZ3SXpIZHNmQTRSdHR3QlRjc0lwMU1TRWlzWEFYWkJwMFRyVlR3?=
 =?utf-8?B?TXNvZUVidGR0bFpONXVOSU4yNElFMzhZYkViSWo4a3g1R1VMVHoxSzdKT280?=
 =?utf-8?B?MmtZUklMd2szTlJsTmxOcXNFcmE3VUxabWJGZFNNU1U2WDB2SE5wVlJza0VC?=
 =?utf-8?B?OEJOam05R0FSZFdhU0RsVzduSG1HZEtJQVE3ek9uMHMzVGVRZWRRaWZ6dFB5?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5271772b-1e48-4bd4-b7ff-08db1f33e306
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 17:46:32.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP0fxu3JImr5Z0ggZqT+1Ei9vKYLPsHZ0cNDjjuNszMoaeSxtJ+KVqdVwVgVSNvbH2efDR5e8c7XAuNYikXEDDSvs6IFQGmqfX0O79nZ5nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8863



On 07/03/2023 17:27, Bertrand Marquis wrote:
> Hi Andrei,
> 
> When submitting patches, please use the add_maintainer.pl script so that maintainers of the code
> modified are added in CC.

Hi Bertrand,

Thank you for reviewing the patches. I apologize for not adding the
maintainers in CC. I added them now.

> 
>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> This 2-patch series fixes the parsing of the ARM Generic Timer
>> interrupts from the device tree.
>>
>> If the generic timer interrupts order in the DT was different than
>> the expected order in Xen code, these interrupts would no longer be
>> correctly parsed and registered by Xen, and would result in boot failure.
>>
>> This method with using "interrupt-names" for the generic timer interrupts
>> instead of having them hardcoded in the DTB in a specific order is the newer
>> approach already implemented in Linux. Xen did not have the necessary code for
>> this approach, and it has been implemented by the means of this patch series.
> 
> Would mind giving a link to an example or the Linux documentation if there is one ?
> 

The bindings [0] for the ARM Generic Timer DT node were changed around
Linux 5.13, when the interrupt-names property was added, along with the
implementation for handling it [1].


[0]
https://elixir.bootlin.com/linux/v6.3-rc1/source/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml#L44
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clocksource/arm_arch_timer.c?id=86332e9e3477af8f31c9d5f3e81e57e0fd2118e7


Regards,
Andrei


> Cheers
> Bertrand
> 
>>
>> Functionality should remain the same if "interrupt-names" is not present in the
>> Generic Timer DTB node of the platform, but the interrupts should then still be
>> present in the expected "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt" order.
>> If "interrupt-names" is present, now it is also correctly handled.
>>
>> Andrei Cherechesu (2):
>>  arch/arm: irq: Add platform_get_irq_byname() implementation
>>  arch/arm: time: Add support for parsing interrupts by names
>>
>> xen/arch/arm/include/asm/irq.h        |  2 ++
>> xen/arch/arm/include/asm/time.h       |  3 ++-
>> xen/arch/arm/irq.c                    | 14 +++++++++++
>> xen/arch/arm/time.c                   | 26 +++++++++++++++++---
>> xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
>> 5 files changed, 46 insertions(+), 34 deletions(-)
>>
>> -- 
>> 2.35.1
>>
>>
> 

