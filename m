Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EFB730FA1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 08:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549402.857909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9glR-0002vb-A0; Thu, 15 Jun 2023 06:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549402.857909; Thu, 15 Jun 2023 06:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9glR-0002tw-70; Thu, 15 Jun 2023 06:47:25 +0000
Received: by outflank-mailman (input) for mailman id 549402;
 Thu, 15 Jun 2023 06:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9glQ-0002tm-0e
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 06:47:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6da0b2-0b48-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 08:47:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 15 Jun
 2023 06:47:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 06:47:18 +0000
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
X-Inumbo-ID: 7a6da0b2-0b48-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMeORvvDrMuJB8+z92Bi5m0NyRkVJT+vJrpIkh3KHQ/F8hV+V3yZrbMIVirdNXpnCkicQvpXAT/jx0ERlxZBmEdg2acjMvyIJRGZVbW28DToClsFTXSPx6CfcVl5aiUKLycmSE9IWilPl2dvh6vCMJ8eNz0ymP/KTa36aFsh66rvK7xD2arprnTu2jxRUt9RREEZDKa2sNZxabbzQ2mHvoD3w9kwzOrz5h6Xhvr3j70vbYZne3VE5nQ1VuRL0Ej4GEm5CDPNbYGfOLppQ0dIKFN3og/aGlOGDlhD0aNzK83O4cqaZBQWgPrwf4vbI9ZDoBTSM2NVewziKYoz7Axw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G/gnCkroko4U8ZZM2HLq4J4bcmK8s6b1bZVZGd3O1o=;
 b=fzBMLhvM3WJ7yVYYUtu4iXE0YMQS3xviaDOktBIZOsXgjqLNshlWmbvNatMUIn9h9Q1+pwISp51BQrVcyl0i55Dy4Rk0nwUyWZuqdGV4y493IKwbzY0OaIk1mvfYyBe7xuODRc6DfQ/l3dl8Se4vjGKqlIRasAeggpCPiFj+hzqNBD1ENM9WVM3YxCaNMJC2jg+381RWRWJSDJcn9LvRrYaUQ/CwnB8/d+oAL80N8Bz1XpMwsqMzkPxPf3FLUxuqE9uJ+Owy+Pi9IH+6SnCUVlTB4TEspusDh/a0UNMqzY8fwoa2sjSnANA9auxlnZWj2Su6fSxQm9MnA/qiVrKfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/G/gnCkroko4U8ZZM2HLq4J4bcmK8s6b1bZVZGd3O1o=;
 b=plWxE0b3upNFBnZAe5tQFRr6Qgt8727MWwGoKKd4moqUwRSA3uqAwMTHhPnDAc93QrxoyQOcunTiYi40KoMd4a/qweHSFqlHR2eXeVQ8PICILiFspGSSvuC4DbTPD1ylMWtPrdNrMt6ktOJZAMCp5ma3Gm3acwdXqJ2MluwdxOwQ6mvmqaw3X0IAcamTpQMlrSpmJ+X17DC4n3JQjh+U+2cUWShXvz/f7FQij/LrFbxTHcKj4yKeCyjFSQ0maeAxodK2Dq/BRkkG/uZNeLk8z4UxfX4lrvGNyJl6lPJHzUypLQ+1//xXI/qTLo9OsV3468cZxP70YCb6gTHWfTyf4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b874b1bb-f1c4-47c3-fe65-1070d263cf90@suse.com>
Date: Thu, 15 Jun 2023 08:47:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686667191.git.shawn@anastas.io>
 <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
 <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>
 <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: db3ae136-609e-4ff0-11e6-08db6d6c5ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvxOLsNzXSZx9UHV5xbdIb4eOBxSjRZLNYCK/thFIdjUxXzaAvL7QrwlOOA+JaklveYF2JK0YWldNVAx9BlRYIbCSmMSkormltXn2rsaG6hwUD1I9S+nhAYvsw1XsXlMWmtvy5Gb/JaATgWdSZRN/7O5/2UxE/ahyYE09Bx6NlkMaXkUrRbyeo2IzHvx73mYRzwrcOZ47BSDUnOYMQVBiQhxBboccdaTXFsxrGwsoR/aZLrgkfzKHcWR2mCN9pl+2SZmS1cJxCbkmmBpPhV4et4jk42AtKhVpief4FeStBrO0+uSMQBYKShsouXNxYKuNGKVmFr5dN3rW6yTp170++beI1B9TLBp8ARjo3+yunHEdVg8qSXWtMHC5qJYubWfTXrLCgwHwhKxCAShwRnfUhrLqGeJ76b7PLUJMNrxcvWxOhsqpHrlVk0gMA0aIvoEwqJeq9DCY1ndvTM5yNfXQXGQHcV6r0B9FQ9V0BBdywu0K9/7xp8K3CMDRulSY2eSRTQoVMKA68aVIsTPAGMB47vgIxxODujSjPoCTVVyrn8D/+K2QjoP8ltMnKG+lmS6udnsRtq9/pfaiVHYgCiy2ROE9WukwPje452kR7Dxnvo4ctMr/FCCvAA7i3SPHEawL+Udgehb7EX49RyaeOIocA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(5660300002)(41300700001)(83380400001)(54906003)(6486002)(8936002)(8676002)(66946007)(86362001)(38100700002)(66556008)(316002)(478600001)(31696002)(4326008)(66476007)(6916009)(36756003)(2906002)(186003)(26005)(6506007)(2616005)(6512007)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDJ4YnZMYm40aCtFcm9rY1VRRXY5RlF0ZTh6cDRrNUkyNHZtWmRaREV5RElm?=
 =?utf-8?B?ZUdoT1M2eTUraU9tMlpDU0pYaVRQaWxFbktyYkkvVUVxZ0ZaSE45WGJVanhp?=
 =?utf-8?B?SXA2UmJBN1FRVXBrL3NKT21RS09iT1dsS3ZEalhaVjViNFplL1N5MG1iY0Vk?=
 =?utf-8?B?d3ZySmZJWWJmdjlnL0VaSWViZTJqa1FHM3YrOTFLcW4wQXpkVUxCMFZEakwr?=
 =?utf-8?B?YlVRODBLV1RSSmdJYnhrdEpDbTZNNXpBNUlLYmF2QW5IQnYxcXc2MVJYVnBJ?=
 =?utf-8?B?WThBU3QvNGpnVm9MVHlIWlhFYzN5MG81QjF1U1p5NFI5NTdPUzFNTHFlODBF?=
 =?utf-8?B?endIejRUYjF0YmVIb3FjajFVbXEwUTZWTjNqZnJYS2FxN0ZYZ0dnMVhObXBJ?=
 =?utf-8?B?OEs0U3cvTVhYU3kvVk9SeU80cGw1NHlqcG9pODVPOEpyZCsxQlRONkFWY1VR?=
 =?utf-8?B?UWZsR2tZM1NHbndtUDVBUDRTOFNHb21XYWFlZUJxRDVlR2tUNFZNUHlSK1NI?=
 =?utf-8?B?WVVFZi8vaERhSnpNbEIvTlZTV0RWR2ZiWGw3eXNtc2dDTjdLNWdFbmdudndo?=
 =?utf-8?B?eGxpb2xRWnA4ME4zcEtZL25kNG15L0dDYkl5bFh1dCtLejZURkhEbVhrd1I3?=
 =?utf-8?B?R2hsZndvdXBraUlkbmlCUzljMDAvd1RTSnA1azZNWUIxbkp2M1dQamlDSUt6?=
 =?utf-8?B?bXBnczY3bzlyYlZvSkExNDhLakROQzREcmZPeHhjZ0lzWXNKWi90clNTRGFJ?=
 =?utf-8?B?RDJXYVRiTTk0d2NDVFB0Wm9yaHlralo3ZGV2THN4UVl2TTdxQ3VjYUVLNTRv?=
 =?utf-8?B?eGMzRERCTmlQTXpLS3BxcUdqOGFRVW14WDdoTFJ4KzZXQ1MyS0czeVAybVZP?=
 =?utf-8?B?T1JsWnUvcWVaN1kveTNQaHFsbDJFeUZjQkx5QjBrZW5HOVc2TldxWlhiSHo0?=
 =?utf-8?B?eS9qMGh1YVU0QWVadG9wa25ON2ljOHdVOU12bExOWXJiVG9QOWd4QnV2RHV5?=
 =?utf-8?B?dXZkRTh5WmNQeHNEUjNYZWNBODlGcDRUN3VwTlh6YjNaMFhCQXdjRE1HTWJ6?=
 =?utf-8?B?Q3BKeFlzUWFuVXovZDhnVTJ3bHFBTXlKbVQrN0o5ZjhOcy82RGpLT1ZYVGxO?=
 =?utf-8?B?b2xaUnI5V2xoNjRGV2Q1R3ZUTTJHL1ZidUhwTHV6MGdlaE8xR3pNeFRiajN2?=
 =?utf-8?B?VTV3UnJ5R213Z1hwcFlra0JNZnN3aUZ2UUZKRXBrK2IwTDI1R00wbTJCVlBX?=
 =?utf-8?B?NGtsVHFaWTZPSEl3OXozWEZ5K01MRVlwRi9zMmRXUW5xN3dXMldwVWdJWkl2?=
 =?utf-8?B?bld4NWlpQi9STzI0eFR4bUJVVzFVWG1MSHRtdGpJdUp4M0FZcTZ1VTUwV3pz?=
 =?utf-8?B?UnloWXlSa2QwckYvL3p1bU1jRUlLTHBDWVppTEYwaWZuNUJUdXNlaFRMa0hx?=
 =?utf-8?B?N2RFTEthTmt5eEUvUk55azdtUWxnVWJsVENNM1p0SFhQRUM2QnFVcUx4bDN6?=
 =?utf-8?B?VVhRTm1JZmh6OGt2NnZGTGZlVjlOTTVLY1ZrdTg5NUs0aHlzU1NzM3d5aCtl?=
 =?utf-8?B?WG5iQzVyRXl4d29CcExTUGFKbXUrdW1VTjByaEVlRG0yeFpPNzVaR3dETlNh?=
 =?utf-8?B?ZHBBQ1Zvejl3TDFPbm8rM1hGYlJOcDk2WDNWWGF4aUpkYnJhbzkvcFovNmw2?=
 =?utf-8?B?am5MQjBUV1VWVC9TM2dIaEZ4a2x1UHV3aDZCWWJ5OWZuZVVyV0dwUDdxYzFh?=
 =?utf-8?B?aVNncFUzeUpSRUZMV094Yi9NZjVtcTVRVTRqZloxQjVhSlhwZTM4SU85dXFR?=
 =?utf-8?B?Qk85N2xoZlJHNzVIMEVVWHlXTW9QUmkzVlI1VTNFOTIzY0hXWHdKNzlBWExz?=
 =?utf-8?B?dUpnNDdlamlmZjNsbUwvVFVGV3NIUkdhNW5MZ3hER3VoWWFQOUZ0dE1HWnUy?=
 =?utf-8?B?ZStxK0lOZzd2Ymhtdm1WeFZaTFViNSs3alk3Yk1zakRGMVFjTU4xV2Vub1Zr?=
 =?utf-8?B?RjN5M05RcVRnc0pDNzgwemwzSmJwdFpNUW5DaWNIMmZqT2I4QUFvcGFlNHZY?=
 =?utf-8?B?WUpNUHBaZHdGaU5kMm9IaDNMR3Mvc0k0REhaOE5CL3djN0ZSQ3VkTmRXNnFx?=
 =?utf-8?Q?r1kjlJdlgQZLovuJWcNGq9yvb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3ae136-609e-4ff0-11e6-08db6d6c5ce8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 06:47:18.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKXQvc4nX+pxSUSNqCYZCI+2EhXgPxR61WBwFtAAGflQehl9b/WsI2EFZuXdXv6MiUgKt2Rf6W46kmF3V/MOsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

On 14.06.2023 18:36, Shawn Anastasio wrote:
> On Wed Jun 14, 2023 at 10:51 AM CDT, Jan Beulich wrote:
>> On 13.06.2023 16:50, Shawn Anastasio wrote:
>>> +    DECL_SECTION(.bss) {                     /* BSS */
>>> +        __bss_start = .;
>>> +        *(.bss.stack_aligned)
>>> +        . = ALIGN(PAGE_SIZE);
>>> +        *(.bss.page_aligned)
>>
>> ... the one between the two .bss parts looks unmotivated. Within
>> a section definition ALIGN() typically only makes sense when followed
>> by a label definition, like ...
> 
> Correct me if I'm wrong, but wouldn't the ALIGN here serve to ensure
> that the subsequent '.bss.page_aligned' section has the correct alignment
> that its name implies?

Yes and no. Thing is that every contribution to .bss.page_aligned already
needs to specify page alignment itself, or else it may break if any earlier
contribution was page-aligned, but not a full page in size (which I think
the compiler wouldn't allow to happen, but assembly code can result in
such). Note how this very ALIGN() was recently dropped from RISC-V code,
and my respective Arm side patch is also about to go in.

Jan

