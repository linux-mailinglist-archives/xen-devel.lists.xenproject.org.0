Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9D7523B6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563170.880234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwLo-0000bC-30; Thu, 13 Jul 2023 13:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563170.880234; Thu, 13 Jul 2023 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwLo-0000YY-08; Thu, 13 Jul 2023 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 563170;
 Thu, 13 Jul 2023 13:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJwLn-0000Xv-1I
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:27:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0b8113-2180-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:27:16 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 13 Jul
 2023 13:27:14 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 13:27:14 +0000
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
X-Inumbo-ID: fc0b8113-2180-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXLG172FLbs7dy8oeWrpxU16aAIYTwtVMHfSBr+mv97WSbbeCcgvNXkCU0a+XylE5Z+iBNJQEo1zdSrPA9XipH3B4SII3UNRNBWOT1USaLK07ZL7LzKIvoGa+VJOZVJ+drc0qWAXEC+uwGa3ucwqbHJ0z/pJqh0oOe3yZdhgnWJDYPXxi4s3Ul10IoLHbuRt43PXqs8uFn/rsbu5M60p08iENMLPyDcj6gToMjzGlkS9YgEYiCBK6Lw65Igyb8c2zzGqk2iD5PDLHHKut6pUWat9BjT+Mij5UI40T1E0jq0Ty5/2pdM3Q2sxy0b+5QichUFtfaXLpQlVgN0odGFb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVowdBeioNqE7rx3G1jPNX1b58+2dJY50H1U2ncgZbE=;
 b=gLM2huKPwnYZHeDn0MyhYoeY3/O5pSkfL0EodSVKVBRDRLgKHZL48bt4UhCRsEWvpJOT8FCeIpxilMqG+lt0HnYjFmM1/2F+C5tFr6X+cqQpoXsgCIjZMY/Y4ggFnJgxGfyXkfk16ZmT1hxLeEhnEgB3xpnPnz035t2YdNeQELGt+yOjw2TiG4TOgSUDUaNOFZSEdurQ65ekyQftQHs+L5zhNA+2FI55TjD8micKs7Sasjp9UR3naKmsWbHezaK9zMZvNmx5wTWbfUvkL2id4krVYhC0QKw2RWerTFEUxwNNoAR274OZLtAXIAbfv9kpewDYwmNKZ12HDcea9zTbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVowdBeioNqE7rx3G1jPNX1b58+2dJY50H1U2ncgZbE=;
 b=SFaxgHjHp3LLsLGDX467GOKUW8XuSkhFMJ+qWdSE++WbTSmmrWmA0JwJewrITSGjWxQmWjKRttkONWEb9as7L+03sETgXCdFAPAaxB/ZB9U4O2xWkmmPnlRkvljtTQs5I6LPIzWBCfSt4xP76gs8odOcYsdxNMuJHEuHh14RnaSd12Rfwkey7BrvC/dGBJ6GGm8uqGYhN2wHYenwThcfhzCDB+GREI5QgdcrvIgjzzc5kdlgbFSQsqePld+tN8zi/GhXAVMnzU/zBJO0q+Xzi051H2EfNkAVw6A8OGPPHZstUI3/R7XrW/Stz0hEj8y+lV0fAa5L9qw70cIBvgj9Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
Date: Thu, 13 Jul 2023 15:27:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: 701bde98-8ef3-44e1-d4cd-08db83a4decb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8IpBNehh5IZ7kmLdNNBWr6HQtimBnZgb/aqx1pelRdqw3+FP2XCFlze1pOx5Pbt8MjsDxnYl038YRhEI3gbc+/09eOATIAEYjoG2yU2R7emjnmRgUIz/bUxFtdYFDH0Ymwo1hRNS9ZmlEnmVZqof58GlaOVNy1L2hhlLnr/J77TfCrQHTUmxvooKHaHrScnCADCnWIimihGwqHDRYypxyNDktKzrY5sLtapee8MbFysUM6GnCOU9dE23ZDHv4dBLAi0h6WtoRk4ili7UbNwqHkwR7Ad2I4wnjtygmaJrGSHyMvpdV/f0UaIaR/XfnCBHrhLMj2kaiCKABfOxd0nWVx2LvtpWK5coIqUijGebv/GUPHPyJFefAu2cyZMO8LQnYLe9XX2ZDdTQggv98QGFdSGXPoQ41B2cUfNwlYYj5e4F4vJ3+/1zjB+cimx0Zk4Y5vQz/a5QKHy6mN54q/CAxcPmDWE746FpQxnsGMM5bybfAQy0Zcd6nlCFuMvqAuODYkFtRPzLNp2n/xNQtS1ICn/1ZfnVlu1qNOMb7fG+KGMeSGwRyBhYdU3RUE1Tzd62Yb08cEwc/7yNhEoAp0LZeyr07bqNfKixQvcXqdf98wCI5EZ1pNQ6KTFnoT7D4xCuVNCCQKMlOcd1DloL6Xfreg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(6512007)(5660300002)(8676002)(8936002)(316002)(41300700001)(2906002)(83380400001)(31686004)(38100700002)(2616005)(6916009)(66946007)(66556008)(54906003)(66476007)(31696002)(86362001)(53546011)(26005)(186003)(4326008)(6486002)(478600001)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTNBQzFXbnJleTBqUUg0VG9XYmdWaWNvbUhZZ2RtaFg0RitXamVyV3RvdTBC?=
 =?utf-8?B?Y0pEMUVjb3V4dHoySmxLYmpEbWl3a1V5eWtiU0VSM282YWlBYnY0eVZpTUtI?=
 =?utf-8?B?T3dWdE5WMGFMbCszTTNYRDR6My9xOTQ5MUd2RmkwZnFkM3BTNytXK3hLZEp3?=
 =?utf-8?B?US9XMFRMR3R0VGIzYWpidDB3QWpyWncvaUg1RXJOd25PQjNib3lWbHJEQ25E?=
 =?utf-8?B?S2NxWHdFZWZjemxZaWdETERxYXFPUVhUNURYc1duQkczaVJzN1dSc0l4bER1?=
 =?utf-8?B?cHNOOW1ENm9VdGRKQmRKcnNpWTlEKzhsSlU3dlVmRzV3M3lvanM0eU1FN3Jn?=
 =?utf-8?B?VkxPRDRhbXF6TTh4TnVLOHdoUTVKbEhnKzV1QlFlOU1DMG02TlNRTnJUWVFY?=
 =?utf-8?B?b2NXN2lQSlRnMHQvMThTL0lyaklRRHZ0SlJTWWJzOUFHVWI4NXQrdklkbDd5?=
 =?utf-8?B?Yk91SFQ5L2NQcEdYcUV5YjRkcldVSEpIdmc1cnNIa1pJdW16NWI2aFdjWkpB?=
 =?utf-8?B?SllOelRibmQva2dONUNmVEhlODFFbkJjQUN5RVN3eHFoN1RzOVk2N3c3a0RV?=
 =?utf-8?B?RXdJZ3NrSGE3TENWUTRURWlaZzdLSnFDNGRhaUFhcFZsRUhPRUNyZW9kOVIr?=
 =?utf-8?B?ZVJXeTlRelM3d3ZLTE1NRTQwaUMxamhkeTRoQzlHcG9hTHM3QkhkaENrYm9Y?=
 =?utf-8?B?aVNYcHphSnQ4dmMzSmRocitDUnlpTUs2dDRuWCsyT3l5UVU4NWJMUTlPVkZ1?=
 =?utf-8?B?SnhINjU5Yk1PUGZSbGg2bnh1Z3g4NDV0cEs3Q1FnSXoyd1lCTjl2L3B0WkR6?=
 =?utf-8?B?L25JN21XVjJqOVdTczNMeEdndDJhdEdvZGxtQUlsdmZJT2NRclR4TlFyV3RL?=
 =?utf-8?B?WE1NVEJZdmlIUjJ2YUE4elY0eWo4enphMytxVmRjWWFEMC9ES3JIcU95UXdC?=
 =?utf-8?B?c2dIR3NEcElVOEp1dElnQk5QVGZhbGt2d0tSUWxwM3hXOG1FbGZ4aTIwYTlw?=
 =?utf-8?B?M0k0SWRaZXFqVEYwalJmcFVtdmFFODd3S24xYTl2RmliRVNJWVUxZXQxczVK?=
 =?utf-8?B?TkpxVUpxc01zV3lBbU9XQWlDcTZQcTY2ZFovTzBSRnFBSlFiemQzZWFCc1By?=
 =?utf-8?B?ell1MFFkVWNoaVVXdm82c3NDVUlTSzQrd1lDR3JTNThwZzBua25pVmdoanhU?=
 =?utf-8?B?WDkvRk5CTDhqWHVrbjNDV1JocTN4YWpWZkpWMzc0SCs2cFJBVzNnOXhRWkc4?=
 =?utf-8?B?M1FvRHNxUlArNCtFNWxGQXQ5MHJlWFFMcHA4bDVKa2gyeEVaeDZTNHp6YVRQ?=
 =?utf-8?B?elpYZGZ0YnFvc2Vja3I1TU00WWN5WWZPdmRHYXVXczAwU1A4bklKSnk5OXdC?=
 =?utf-8?B?NU8yMlN0dnhUQnB1Q3N6Z1Joa0dEMm5wMU96d0l3WTI4U3dSd1VLR0x4Qmtk?=
 =?utf-8?B?cnZXQ2Z5Z2w5U25rOVg3WjBVQ2JmUXEybnFES0FoUzhoZnpMdUx0OXRWTzdy?=
 =?utf-8?B?b2haTzg1SloyM0xYQXBwdG41R0tXQ0ZUV3pDVXdURFZiMFdJYk9sTGJwYlZG?=
 =?utf-8?B?RDBxQnl6SDgycGdNekR0c3g3NVRpVEhyWCtlOGlDYnNCV3F3MHMwbmFESUtU?=
 =?utf-8?B?YWpRV3lNTkUyRFJNNjQ2SXVzejYvMzVXUktXVitFWnQyczhOc2JlQ1Z3OFFG?=
 =?utf-8?B?TCtpL0RhbTZSbTloZTdsWk1wenpTK2ZYWFNRdEJjL3VmT0trM1AwMCtaa3lQ?=
 =?utf-8?B?dU1EZkUxNElEWk04KzNPMHQ4R3V4VzhqRi9ENWQ5VjlUbGpndkNJWlFDSE9s?=
 =?utf-8?B?NE54OFVwSVZVQW1oQko0akppNzFEMFNqenMrYUczKzdhSk1WZU1OVE5FYUJU?=
 =?utf-8?B?QUJkQ05oRFF2VjBGVGlKRWE4Y2duVWQ1SFlkZEkzZFV0K3hsaU9iNG5Ca1ZF?=
 =?utf-8?B?dlZNSmY1WjJQbitTQXV5TVlZTUNaV2lQMW9YRWh4bjcxZ0xrc3cvUHI3bWdS?=
 =?utf-8?B?ZSs2UEIrb1l4czJNVzNVYkEzS2o5NGhaVjFFbkpYQ1d6RTl3b1dZNFZkVVZB?=
 =?utf-8?B?M3JrM3pVL3A2VmVnR3BOWXJMT2lKbURDbmh3WkhHK3V0L3plVHVBRytsdjJh?=
 =?utf-8?Q?aG1Js3k3tfQfve3RN2ndBYEYg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701bde98-8ef3-44e1-d4cd-08db83a4decb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:27:13.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c31Y0x3u6Xz+SOL4nUaRRKsNPQDAhobXq94U5Uxug0cWTADTGDfDaY3IjqiUyz+C8mdcwh36W/ZYUbvzzld4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8793

On 13.07.2023 15:19, Oleksii wrote:
> On Thu, 2023-07-13 at 12:08 +0200, Jan Beulich wrote:
>> On 13.07.2023 11:30, Oleksii Kurochko wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -1791,8 +1791,16 @@ static int __init
>>> ns16550_uart_dt_init(struct dt_device_node *dev,
>>>      }
>>>  
>>>      res = platform_get_irq(dev, 0);
>>> -    if ( ! res )
>>> -        return -EINVAL;
>>> +    if ( res == -1 )
>>> +    {
>>> +        printk("ns1650: polling will be used\n");
>>
>> Nit: Please don't omit one of the two 5-s here.
>>
>>> +        /*
>>> +         * There is the check 'if ( uart->irq > 0 )' in
>>> ns16550_init_postirq().
>>> +         * If the check is true then interrupt mode will be used
>>> otherwise
>>> +         * ( when irq = 0 )polling.
>>> +         */
>>
>> I wonder in how far that's actually correct outside of x86. On x86
>> IRQ0 is
>> always the timer interrupt, but I'm not convinced something similar
>> can be
>> used as kind of a heuristic on Arm, RISC-V, or basically any other
>> architecture.
> uart->irq is used as an interrupt number for ns16550 and according to
> the code in ns16550_init_postirq() uart->irq should be > 0.
> So there is safe to use 0 as a detector of polling as it won't be used
> as an interrupt number for ns16550 itself.

I don't understand. My earlier comment was affecting all checks of
uart->irq alike, as I'm unconvinced IRQ0 may not possibly be usable
on some architecture / platform. IOW I don't see why the check in
ns16550_init_postirq() would allow us any leeway.

Jan

