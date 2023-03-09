Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9376B270C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 15:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508296.782850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHNb-00051R-Bx; Thu, 09 Mar 2023 14:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508296.782850; Thu, 09 Mar 2023 14:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHNb-0004yx-8V; Thu, 09 Mar 2023 14:36:27 +0000
Received: by outflank-mailman (input) for mailman id 508296;
 Thu, 09 Mar 2023 14:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaV7=7B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1paHNZ-0004yU-Fc
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 14:36:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c420a65b-be87-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 15:36:24 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 14:36:21 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:36:21 +0000
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
X-Inumbo-ID: c420a65b-be87-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOJo4KV+0LpadkREgQHQUbOthcfP32Y84DNMSj0lDCV8rYO+9hRtGSwwPjL9DlBy5eEAqTy4fM9mxNZyqoKXwN2msuF5NaDR8TfTyz69ndrmBXabxvXCWn6qqS3GctGw2Jf/BAiiDx4We63wgUfBBXunaHQrz4TRc4Fn+jPxBNK5GC7MCu7a1S31+YgDMoJPPiQTw3ZLTT7OEQyLdiLOIhN4TdEVtf6GqCFXExnC7KfZDSWVACsbwMGVEIZJMZbzCmf/uBgo5ymBWPOeNIPsyPwDvdPoT8nEkvwnLwOJvNAYa/3fy0/CibXRpt/skc+RKqnhajEmfvvGRkz+o/T5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVJ/9SC7BsEVacNhV2x4yyx37TxiZaxg3/RW4DyEXzk=;
 b=IuIWaV7H10G3b45Wj5dmV7Vi+KpwpPpNm9xyFgE1AmM9b8bSyTMss+BHi3BNQBTy4MPR3Xzl3c69lzet9/eEZaO+hM/qOjwCZyo7TtzNBFmP4/f/xJpB8FjAIa3fnhdNtGV8Lte2lPYIa1d+Qyh0wzxnWTZ2WKrOLRD30nN3gyvs24z69dIDDQToTJjGlhvElXYIvsdSenH9Z8iBQWyudJS6jXbWYCfKIvLrTIJjTk/74J0jcJ17ocdp2fy/CQ0D+P6DjAF+YmJUxr9kIkX7oN6mX5LmJL3xsuHTSYTUkRjNX9vbQSLos/M0sjP6KotqQFbJbhgRrkY4R8nuRKSB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVJ/9SC7BsEVacNhV2x4yyx37TxiZaxg3/RW4DyEXzk=;
 b=XGfjctLR4piplBp/ocdSjc1vzFrA4YtEjGZWdYEOQXAu1EJBlU/l5BhpuxDZRGhDwQqUVAvnrSNSsY41NEoEultPTYudoPHghyzMvUSoEVyEz5j2UMoHhuBhzKqPdOTRGEDY0oWE2KrXspZYaUN4zj77ItsGNXY38qgLPBlfr+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <70209e22-c52b-597a-81a2-750e2ca9aefa@oss.nxp.com>
Date: Thu, 9 Mar 2023 16:36:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
 <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
 <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
 <CA41DB66-DB7E-4EDD-9A34-38328A2A8C9E@arm.com>
 <93cefcfc-1cfe-bb79-0f6d-5e578ad153fa@amd.com>
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <93cefcfc-1cfe-bb79-0f6d-5e578ad153fa@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22)
 To VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3a89a9-a98d-468b-768a-08db20aba662
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FqOOMjcL+RSdIlU3Uj0Me6AnXgi33ENVD630/pu7htE0h2rAviXzAuV+pr7/951xxQwZ4KJ2paAqpVuRMZEr8tbKLG9sf0bwzMI8rFO5zpRzNT8+6liAcuDZUWPAGXRvGUVSihohrsql9XhPUR89gNmq/OZxfJfp6dVn4eSI3TUdvPrZsjVbwwf6ajnEV7pLYLkLaq80XHX3TBoiK+YpFPOqId1GpSbAE0sSFrdvggLu9hjol+H7hZKz9TUtIo0biAKiRPApE/6xWLB+NXdz2hi4oLVpYZo9xcnGSFiNSqohOIlNrWOlbeY9E5oS1zOSwTeWEaX5NC1FjckIp6QcSbcRNqW1dNRSg4Ag+EGg0nL1B80l6XcYwMlenNwhcbClrx0XNOObhrUFTrTCdKG8zTC/kNa3dyT/uDds7LqworvKU7gXqetBzkbAJPEui4L9G9ZjHHM8jk5FKPThnOTnjNkMcBAtiZrYHGFTT9PjHn98HE0+4+mAiKOnZvy44bvlemteiEczoV3N135pt3TeVXN2bb1dCfTfRj63N2vT23RvvC49tnT2Q/5nrJPzwo4EE/jSSH3LyuNgk5E4M5I+vuAf2aECTmjF+0xSRIY6V7tFvcZrqlZcG87a1FryBcjurPn12jKMVVZ6CLPUZPZjXjkqvSmX8KgUTEW9rYnAreVbHfAXksf4pUBx9s4XjqBR5VpFrrPiH8Bmmu1D4BX29Ta+typ7s3AwZ3DBOJgxeog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199018)(66556008)(4326008)(31686004)(8936002)(44832011)(2906002)(478600001)(6666004)(5660300002)(41300700001)(8676002)(83380400001)(66946007)(6486002)(55236004)(53546011)(316002)(110136005)(66476007)(6506007)(54906003)(31696002)(86362001)(38100700002)(186003)(6512007)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hZeExNVkpXTjB6ekR5TmN1RnY2TC9SdndVOTlRdUdzRXlTaWRxN05mQnVY?=
 =?utf-8?B?a2VVU1h4ekxQdmpyR3dWbUZlbHF6NXZpR1Z0U01aV00vSS9WMEJNRG13MWZW?=
 =?utf-8?B?Z1I3R1paOHRXaUxBem9iVXlMaHRvc2VxMHpaQUgzaW52N01PV3VxN3hVc0xw?=
 =?utf-8?B?QTdtUXdDL251VlBsd3RaN3NoZzY0OUFnNzkvcDJCUGtYRkpHaENrUk5DdTZo?=
 =?utf-8?B?dElQL1JURFV5V3FPUlhlS1NtUHpkY2ZDOTNnZnhLVXFyeExuaVlCQWV4L1JZ?=
 =?utf-8?B?djI3THdkd1dMT3p4TDl6RzI5TWM3Wkk1aEdrWEoyditJSE5mQUx2dGlJbkRY?=
 =?utf-8?B?K3krZGRpdnZidk1yT2pCaFVNR3VJdXlhaGdoL1B6K2RpdzFoMkU5Y2FwMDdx?=
 =?utf-8?B?M1h6ODBIdjE1cCtyUTdDYWtraHRHdmtIN1lPNzEzRlZTSk4zRHB4Y1p0Zklj?=
 =?utf-8?B?Zk1FWmxDbjl5ay9RdDZ0T2Q2NzVkVHp0a3Mrc0dSM2ZRSnRSdlhwd054bVln?=
 =?utf-8?B?b09UbkZjR1o3YUtOSXNZTG5JSVBOZHgzWWtBTlVpd2o4aEJ6d3lkM3lwY0xF?=
 =?utf-8?B?aWhVbGh4Nk1JbjZNQlBVUkpHWE1YSnptSmZIQnpEMzFDTzdnL2t6S09HSnJG?=
 =?utf-8?B?WklPWkRJMmJsSUFuWUNtR0hvN2o2VTcwR0FvVXhlNTQ0QVdPcng2dUZVckJp?=
 =?utf-8?B?NHdwZUhPRkVlSlU0TXpReERhZ1JKSFBZbU5rZzZEcHhaRHY4L1U0ekF2RE1R?=
 =?utf-8?B?NVhmcWtCS0N1SVNJSnhpRytIZnY1eHlMcHI0Yk5TelJjK1ZRaldZSkRDOGwy?=
 =?utf-8?B?Tm1iT00rbmpVMnY4SjdqLzFmb3ByRG8yb0syeFpJNi9PY0Naem41MzVXN1RR?=
 =?utf-8?B?YlUvemE2T09QcDBrZlFEUjRhaXo0YUZvd202V2ZMU01jTVFwSUxWNnRYcVBM?=
 =?utf-8?B?OFptSUpWSzRkZ2tRazVlUjlNSDJXN1UrNE5FbjR2RXFIejVPUnJyTkRvbWV0?=
 =?utf-8?B?VXlYVUkya0pvbnNyZkEzekpKS3JTeEVndnBHRTZQZiszSVc2NDdVN3RHblpa?=
 =?utf-8?B?aDNPSHBWd3RKUGJwWWdkV3B2bytBQXFEMm9OazZZSEVPTEd1RGExSUoySEN1?=
 =?utf-8?B?ajh6SlVRb1FMM2lOVnBIWU5qUS9xWm5qNERPdmFCMC9IdDV4L2k4Q3V0eFF6?=
 =?utf-8?B?WkQrLzd3MVBENVNnZXBCYnhQZDZqbVJVd3FmZkIrTUFIaUgvZW1nMlZEWXdj?=
 =?utf-8?B?MWtDV0R1emRFUmc1Tk5wRTU0NGJoTmtkZDVGMm1VQTZ5b1g3NTVWVkpXNXpP?=
 =?utf-8?B?MzhBRUNJNHlEMkw2TGVzQmxwbUFpTXFKSWVUeCtQdFQ4SE9Wb0dwTXUxQ2Q4?=
 =?utf-8?B?dWo1VjRuVlVKMGRGdjcybndjd2dJb1VScjh1WTgwcGZ0L0ZoaUxzdEx5SUlF?=
 =?utf-8?B?QnBBdENhdW5yMVl5aXljem8vUE9KOTY3VVZQc2RxcGw4bnNwcDcwVHc2RmpH?=
 =?utf-8?B?OC9pME1tWThVMUsrczFQVi9SaXlzMVNEbVB2WVY1OGJHRDM5VHEvREJ0TUlX?=
 =?utf-8?B?cUZic3cyM1ZoYXNVZi9ZYk1Kd21McXZIcmRiZDMzVkpJam9YbXc5Q3J4ZS9k?=
 =?utf-8?B?REhTTFZNcHQ4UEYrMDVPc2VDRXU3YjVpTzYyVVlLbEsrN1c1WWZqa0RvL0hz?=
 =?utf-8?B?VTZqRFR3YzBUSDhadnFKVnpVa0JXWHRTUWtvN040bDhNNHVjRmpNbTU3dE1W?=
 =?utf-8?B?bDc2YkN0VlBHUm42VXU1cllPKys0a2pEUjRFeWFHdUd5WmJTUUpPY0x2cmFr?=
 =?utf-8?B?UFcwTEx0UVZTYmFUM1JPbS9hdTNuSmFyUkdaSHZJdDIrenlkRDA4V0x1RGI3?=
 =?utf-8?B?dmIrNGlyREJ6NEM1cVl4Rnppem5EU1kwbG9rOGliZEc3dEpRcEYxMXQ1TjQ1?=
 =?utf-8?B?dGROSUNJSEYzZHF0Z1FEaU9jNVRvRlM5eEJiTnlCOFdUc2hBdTZYd0ZjcUR0?=
 =?utf-8?B?ejhjc1hxUmMrdHNHV2E1SzErYi9qS0g1ekp1VVZkTUFOQ0psWCtsYm1HOWxL?=
 =?utf-8?B?T1RzTmNwemZRNGk4VlZ6L3VRbnBhcFNFZG5CL3JkNVlreEpUYUR2ZmxuMUxR?=
 =?utf-8?B?TzBWakRKc2lMWFoxcS84U09NWTcwRDZnQURLTkRuSlhKRTBjYStMWVJ3czNP?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3a89a9-a98d-468b-768a-08db20aba662
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 14:36:20.9149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks+Sr7r3MJ9nqR5wGIgUa8ChT7phWOpprE+WTnjCKIUn9+Y8XmXxqU29DkOTTLHLwiXw/52HUaKHucZN5b93ijp2pP75X9TFaCItuOqrIHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949



On 09/03/2023 15:46, Michal Orzel wrote:
> 
> 
> On 09/03/2023 13:45, Bertrand Marquis wrote:
>>
>>
>> Hi Michal,
>>
>>> On 9 Mar 2023, at 13:42, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Hi Bertrand,
>>>
>>> On 09/03/2023 13:19, Bertrand Marquis wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>>> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>>>>>
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Stefano,
>>>>>>>>
>>>>>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>>>>
>>>>>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>>>
>>>>>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>>>>>
>>>>>>>>>>> If not available, the usual parsing based on the expected
>>>>>>>>>>> IRQ order is performed.
>>>>>>>>>>>
>>>>>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>>>>>> not found, the hypervisor won't panic.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>>> ---
>>>>>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>>>>>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>>>>> TIMER_PHYS_NONSECURE_PPI = 1,
>>>>>>>>>>> TIMER_VIRT_PPI = 2,
>>>>>>>>>>> TIMER_HYP_PPI = 3,
>>>>>>>>>>> -    MAX_TIMER_PPI = 4,
>>>>>>>>>>> +    TIMER_HYP_VIRT_PPI = 4,
>>>>>>>>>>> +    MAX_TIMER_PPI = 5,
>>>>>>>>>>> };
>>>>>>>>>>>
>>>>>>>>>>> /*
>>>>>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>>>>>>>
>>>>>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>>>>>
>>>>>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>>>>>>>>>>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>>>>>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>>>>>>>>>>> +    [TIMER_VIRT_PPI] = "virt",
>>>>>>>>>>> +    [TIMER_HYP_PPI] = "hyp-phys",
>>>>>>>>>>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>
>>>>>>>>>> I would need some reference or a pointer to some doc to check those.
>>>>>>>>>>
>>>>>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>>>>>> {
>>>>>>>>>>> ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>>>>>>> {
>>>>>>>>>>> int res;
>>>>>>>>>>> unsigned int i;
>>>>>>>>>>> +    bool has_names;
>>>>>>>>>>> +
>>>>>>>>>>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>>>>>>>>>>
>>>>>>>>>>> /* Retrieve all IRQs for the timer */
>>>>>>>>>>> for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>>>>> {
>>>>>>>>>>> -        res = platform_get_irq(timer, i);
>>>>>>>>>>> -
>>>>>>>>>>> -        if ( res < 0 )
>>>>>>>>>>> +        if ( has_names )
>>>>>>>>>>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>>>>>>>>>>> +        else
>>>>>>>>>>> +            res = platform_get_irq(timer, i);
>>>>>>>>>>> +
>>>>>>>>>>> +        if ( res > 0 )
>>>>>>>>>>
>>>>>>>>>> The behaviour of the code is changed here compared to the current
>>>>>>>>>> version as res = 0 will now generate a panic.
>>>>>>>>>>
>>>>>>>>>> Some device tree might not specify an interrupt number and just put
>>>>>>>>>> 0 and Xen will now panic on those systems.
>>>>>>>>>> As I have no idea if such systems exists and the behaviour is modified
>>>>>>>>>> you should justify this and mention it in the commit message or keep
>>>>>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>>>>>
>>>>>>>>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>>>>>>>>
>>>>>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>>>>>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>>>>>>>>> error.
>>>>>>>>
>>>>>>>> Problem here is that a DTB might not specify all interrupts and just put
>>>>>>>> 0 for the one not used (or not available for example if you have no secure
>>>>>>>> world).
>>>>>>> Xen requires presence of EL3,EL2 and on such system, at least the following timers needs to be there
>>>>>>> according to Arm ARM:
>>>>>>> - EL3 phys (if EL3 is there)
>>>>>>
>>>>>> This might be needed by EL3 but not by Xen.
>>>>> Xen requires system with EL3 and if there is EL3, both Arm spec and dt bindings requires sec-phys timer to be there.
>>>>> So it would be very strange to see a fake interrupt with IRQ being 0. But if we relly want to only care about
>>>>> what Xen needs, then we could live with that (although it is difficult for me to find justification for 0 there).
>>>>> Device trees are created per system and if system has EL3, then why forcing 0 to be listed for sec-phys timer?
>>>>>
>>>>
>>>> Let's see that on the other angle: why should Xen check stuff that it does not need ?
>>> Because apart from what it needs or not, there is a matter of a failure in Xen.
>>> Xen exposes timer IRQs to dom0 as they were taken from dtb and allowing 0 for any of the timer IRQ would result
>>> in a Xen failure when reserving such IRQ. Xen presets SGI IRQs, meaning bits 0:15 in allocated_irqs bitmap are set.
>>> This is why when calling vgic_reserve_virq and passing SGI always results in calling a BUG().
>>>
>>> So we have two options:
>>> - panic earlier with a meaningful message when IRQ is 0
>>> - let Xen continue and reach BUG which would be not that obvious for people using but not knowing Xen
>>
>> So you are saying that in the current state 0 would be ignored during scan and create a bug later.
> Yes, provided platform_get_irq() returns 0. This is however only theory because IMO it is impossible at the moment.
> Both GICs, do not allow specifying SGIs in dt bindings and require at least 3 cells where 1st one specifies type.
> So if we have a fake IRQ 0 as PPI, platform_get_irq will return 16 and for SPI - 32.
> Therefore I cannot see how it would return 0.
> 
> ~Michal
> 


This was my original thought process as well when I initially
implemented this fix. Thus, I figured 0 should also be an error case.

Extending this, all SGI possible return values (0 to 15) should be
errors here, right? But I'm not sure if we should also treat those extra
cases here (1 to 15).

So, to make sure we all aligned, the only change to be made in a v2 for
this patch is the coding style for the added comment? Or do you also
think a more specific check for valid PPI IDs returned (16 <= id <= 31)
would be beneficial?

Regards,
Andrei

