Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F251375F471
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568749.888665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtOa-0006PD-JV; Mon, 24 Jul 2023 11:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568749.888665; Mon, 24 Jul 2023 11:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtOa-0006N4-Gn; Mon, 24 Jul 2023 11:06:32 +0000
Received: by outflank-mailman (input) for mailman id 568749;
 Mon, 24 Jul 2023 11:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNtOZ-0006Mx-A9
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:06:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 239b4dd2-2a12-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:06:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 11:06:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 11:06:27 +0000
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
X-Inumbo-ID: 239b4dd2-2a12-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTlimjO3+UW7EPgu0O42i7iKiII7dMOWoe4aO/WselrTtTSLAfapWN2GXL+AKcvGeu3B7VCrnq7aQFDHEZ5ycZc6a/Xdd+fXw1lKHTuYId7BWMIqEzTee0m/e+YOBvaPueVjy9VOkQnrWR3Z7+L0UF7lc/nBLKCYK/Lcf9wi+nhFg3akFx3Fo/uRYs8lgAhfglj6/Z26rRAyz9AwGbMa0X4y9FYi/5snNhLOLGpv5rLFs37/MWlJwQoQ8zWJFPrCj0mIo6051VuberYOUHqob/0zv4oUYKboSWw+bufloRJZ+d2T9Li49dZLqsz19sjZgg+1D7rI46IsZobaSMxvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecwrqCzGMywutxclDewn5ns90+IWxqevIEVLjZHvqAo=;
 b=oTzdBSDi/ndPs+3ANrjGRiQmtjbRjlbqwzM/M9EjpHNOohudiUpQDZO1oUdZeXo4n4iKuRGj+VRSKNx3bj5InivVmSAxDkMsY2rcf7M+l9YjwwGdVsRmvo/qUE7zW2LL4eLiDAfqcPQU48//D6ikoSPKPoysebdq7QyprXWGzFQP8TYQJHwTwhqkUYNhSYTjvrqJd0EL6TbCODmTjIt6zT8xqp5NtfIwXgbsUHhcx099gaDS6eE/WMPMrE/fhfhJxvRVG8XMv8u/uHl6HV9jUq4RZ3PrYugEKjsAY3mDUcpzsKBcBQcgJOy4MSsqj+qfGT4CXk0tQECA5tVh6TrjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecwrqCzGMywutxclDewn5ns90+IWxqevIEVLjZHvqAo=;
 b=b8bzIQUPCgUuoKGs04oAWCKt3IusTL0Sgk2pgUSyzOCzvtCUl7JIJUxAzG1F0FCurEnMGXahOS3LIYP9rGI0Zps8LgaDL95WhDe1xa3KYaJ3vXxJfY8pkGpj8ydQe/i95WHpU7Xj3XI700LrbMWnPpKYgB3iRz0OOrCRJW8Zr5oQpV9ALB2ZE537vyXGbSPUFSqYRKDnW+2Q63bbh2Mv8hqcgPt/MRj+/tCiv7EbIQUOW3Zg86RuEN20TFHdmIJlB7IWDScCCnXUssJuH+R7Wma4/utQbJvT0yJI7VtTZBF8b+Wsqo4sHPXlNbbVJIw02a0iz4ntE2oNJStCbYCXWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98c801fd-f352-cad1-5e44-d6d8ca433422@suse.com>
Date: Mon, 24 Jul 2023 13:06:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
 <ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: fdda0065-2c09-4782-d494-08db8c3606b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EP3fWYe5RYCM4wbtnbw5bx/2F05Pve3DAqoX31ewpBYKG6kM9YfBvETUWt+uAcqupRvUar2g6KaFi5EoVw2bXVJtY0oTYM9mIfst4vug6Qx+0WMTvnyvZYQUKGauRkaoW4k/CrL6KbeVHHkiqa0f8XPMAoMSZS7QRsSfN9QVinbXbgHq/MgsTSEWx3m7clpzdFzbhk3yT2TO37FkusXm/OtC3GmnGS/NAY3hrEpyPXaen/a8reqgBhcvowh4kaYy7eQLipZwneORo6AFaGahbO6SorfAhj0/BjP5W1hBOge+SXiNlhYZja8hNJyR9rK/LfqsoRL4esuB9BjzmS9CO4Lis30Rc5CN/Oeamyt2aaIn8vTlVDVyOXt6oS0vxGz01RY4Fl9dJgpxE0/Lqnk+K+lgUDHGQAeKnYMDRTyPJtlUkMbmx7C+uAr3naZ/Rk2xdyj7zK4xwPVED5znq2d5nM/pJKosZKLBLtoJw3JXov+7JWORcEfYNI63Lfffl50zk3MPhqIGprPO8ZgwycTwrPXZ7aP/6GwiMr1ezjNlj1mI5rF4x9obo/0W+AHXBqUBwBFK1vL0dz3/u8m1TbcfpI9Z1gZlehM1TuAm7mGGQcNfLTrC6+2BdH++RWxsmeUWF1PRS6mANXkWwdBGyc2+jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39850400004)(366004)(396003)(136003)(451199021)(6512007)(6486002)(478600001)(54906003)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(6916009)(316002)(41300700001)(66556008)(66476007)(4326008)(8676002)(5660300002)(8936002)(66946007)(38100700002)(86362001)(31696002)(83380400001)(36756003)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJzd1N3OTBEOURZUU1wVFlURlJ6SlJpRGhrdXVzQTQwWXRUbWR4YmJ0L0FI?=
 =?utf-8?B?R2dYZUVPYWtrWlNFOUZRcGROZXhFZUNXeU9qZ0tJTmtFYjBDVjJBaDJCZmU0?=
 =?utf-8?B?YW01RWxHaWNHNTVkTndyNTM4b0JOQjRQaWhvdURTT25DMTU0ZWw5TVZTWGFT?=
 =?utf-8?B?b205Y2RXRVBDWTc0ZHBUcTJETm1GYXR2bTZoOWpLT0dvS3dRM2NzdWVoVXJX?=
 =?utf-8?B?TG5iQjZWQUxCeHBzbWkvekcwMEkvY3l5RTczNW1uelVpb1dBT1pWUEwrWThF?=
 =?utf-8?B?c3lrRFBzQkJYSW0vUzNnZmxuc0tGOE9aeFpIUk5kUEQzZmFTR21PQjBTWkEw?=
 =?utf-8?B?eVdLREs5UmRtenZqK2ZDN1NaaGl6Q1pzN0JFbDFoOVhVSWVGYnYzdEJDWWhZ?=
 =?utf-8?B?Zjl4K3F0TzVaQjF1ZlJlMmNWOXJOSGM4SkZRQ2hFMFMwNnZ3TnN1Smh6NkZX?=
 =?utf-8?B?T05uVlN2SlFqbGtNdVlIYlUrc0pETUR4NEkzbDF6YzFSVWZWdHZNK1YrVi9z?=
 =?utf-8?B?YlhJOTNOWk5wL2ZKK0hqU2lhN1dwbHk5YkZ4cmFRYUN6a2JldWVDRm1RWG0y?=
 =?utf-8?B?VmhxbzBlRDNyS1laVGFtUFFkdHp4Q1p5THpKclZXL2Fkb0hzQ21hTU1jVVpM?=
 =?utf-8?B?UmNpWGN0dklqSk5kYWRMRWxYZlNoa0ZEa2JIUXZHdmREMkVVQzVSWDVvWWVP?=
 =?utf-8?B?WTlRck1MUkwwdWF5bHBBUDEveTg2TjhHbWdwMk9jbkpObThlenRyR2IxQ3Qy?=
 =?utf-8?B?bkovdnI4clZNVGZ5R0xtWlJSZmFoSS9rNzdkTFdhS1o2Slh1WlZjSEpPaWVU?=
 =?utf-8?B?WjdSYkxCRk5nRjdIUXFKeWxHdjIzZUNUK2h1WmJsUDdYWE02NkpmZFBPVVFP?=
 =?utf-8?B?M1Z0T2JYY1lEWFVtMnpvTVRhR3N0T2lHNlZCcmtvM3J0REFuSHpLNk1wQmtZ?=
 =?utf-8?B?N3ZxWDhxU1NncGN3a3BWdzZtRlN5RmVpYzFST08yZWJobXFWOHhSdHN2K3lz?=
 =?utf-8?B?eURDVEQ5eFFZUEFPbWFrRUp2eC8zbFRua3pHbzQ5djlidi96TDZIL2d6blB5?=
 =?utf-8?B?L09aVHlIY3N1ZlVmTWR3K0RkWHduSDFRTXNhWDkzN0JFc1JEVDYwWEVrVk1V?=
 =?utf-8?B?SjZmTjVNZUdlZE4ySk9wYTdsenNCQzA4dm9wZk82c1lXdmx1N0JNV25YSzVB?=
 =?utf-8?B?a2tYT3ZNVWhJemM2S0QycGprSDVLTUYyOHhkdndtTHVTTi9xTUlEVVVHakRx?=
 =?utf-8?B?OS9TUnJmaTVPSmE2NVNHVm9DSS8zdFpMN0ZnaVNDSS9YeWN2d25vZ1RvWC9S?=
 =?utf-8?B?QlJ4MGxOY0lSRTdYU2RuWHpxd1ZYdGNRcE9PbUVBWkdPQzRJTUcxYmxDQ09w?=
 =?utf-8?B?aGYxMDJjaVhiNHJFL2lTcHQ1a3dyQmRRVG5aNnA2c1ZadDNDbk4zenNqeG0y?=
 =?utf-8?B?UlhQSUpVWUZYczBxU09rSjRqSGpObHRCMHM0eldkRnNZLzBMUmpnaGUrUjB6?=
 =?utf-8?B?QXBTMWhiL0YxVHdaYXVoRnJ5UnJHOUozaS9GS01MZUpFZkNWcnEwclF2N0Ix?=
 =?utf-8?B?bXNDTzhRM2tTTFk3TlN5MXNhTWwwV0U2b3ZFQ0xma2tQbXE3ZnFiSmg4c0ZY?=
 =?utf-8?B?dGliYkd6ZUpPRHpsWjJ0WWNMUVc3Q3crVDFTOFVQUFp0aUYwWkdCQU8xeWN1?=
 =?utf-8?B?b1cyK2l5VXdsSjdZa1M5UmVLbzlFVmNacmRqODg0WnFITnlJaURvT2RqaFd1?=
 =?utf-8?B?MGtBSVFQS2VnUVltZndlNWFZNUZhVWtiYXN0MG1uR0FFU3hqRk95ZWlnOVdK?=
 =?utf-8?B?T21RTDdkK0Fva1JyM3V0Z2dVeENwME5hZ3hlaGRUSkF6azFITkpsL1lGSjVX?=
 =?utf-8?B?OTBXY2tEZ3VraFBSQzhrWktwZkVXa0ZFeEZaN1ZYbFdYOTlGTkRGVmZnT2pF?=
 =?utf-8?B?M1pnQmR6aWNzWFlRSWNRVnNycW55Q0Z1d25meDdEQ1U4Q1BkaHkydU0weUZR?=
 =?utf-8?B?Y3ovK2xqL0Exci8za3NVUXVsOUNEa3FiYTNUY3hKaHRPNVFoNmxDOE4vMmdp?=
 =?utf-8?B?a0JlZ1FFRmE1elpLeXRZemw5cVQ2TmdWbmdNbm92TzBVckFSM3pENTZjbmZk?=
 =?utf-8?Q?8UHpLmub4w4EA26PdDo7Lpl3f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdda0065-2c09-4782-d494-08db8c3606b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:06:27.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiSIShzsOPWsxeNGqZByy/z7rWqKUMWQT7gIjLUq9ccN8GzM7B7LwuI28jBVEtEnPQ2HNF/XCXxpVGQeS/GHAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8584

On 21.07.2023 15:32, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
>> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
>> guest's view of this will want to be zero initially, the host having set
>> it to 1 may not easily be overwritten with 0, or else we'd effectively
>> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
>> proper emulation in order to honor host's settings.
> 
> You speak about SERR here, yet in the code all bits are togglable by
> domUs.

I think this paragraph is meant to describe only what would need doing,
as per what's said ...

>> There are examples of emulators [1], [2] which already deal with PCI_COMMAND
>> register emulation and it seems that at most they care about is the only INTx
>                                                                       ^ stray?
>> bit (besides IO/memory enable and bus master which are write through).
>> It could be because in order to properly emulate the PCI_COMMAND register
>> we need to know about the whole PCI topology, e.g. if any setting in device's
>> command register is aligned with the upstream port etc.
>>
>> This makes me think that because of this complexity others just ignore that.
>> Neither I think this can easily be done in Xen case.
>>
>> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
>> Device Control" the reset state of the command register is typically 0,
>> so when assigning a PCI device use 0 as the initial state for the guest's view
>> of the command register.
>>
>> For now our emulation only makes sure INTx is set according to the host
>> requirements, i.e. depending on MSI/MSI-X enabled state.
>>
>> This implementation and the decision to only emulate INTx bit for now
>> is based on the previous discussion at [3].

... through to down here. Yet I agree the title suggests otherwise, and
hence that initial paragraph is further misleading.

>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -486,11 +486,27 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>      return 0;
>>  }
>>  
>> +/* TODO: Add proper emulation for all bits of the command register. */
>>  static void cf_check cmd_write(
>>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>>  {

Note also the TODO being added here. Which course will need resolving
before any of this can become supported.

Jan

