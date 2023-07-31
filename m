Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB00769AB0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573140.897561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUhA-0004KZ-DZ; Mon, 31 Jul 2023 15:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573140.897561; Mon, 31 Jul 2023 15:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUhA-0004Hw-AD; Mon, 31 Jul 2023 15:20:28 +0000
Received: by outflank-mailman (input) for mailman id 573140;
 Mon, 31 Jul 2023 15:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQUh8-0004Hl-I9
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:20:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c59dfb5e-2fb5-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 17:20:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8330.eurprd04.prod.outlook.com (2603:10a6:10:241::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:20:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:20:22 +0000
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
X-Inumbo-ID: c59dfb5e-2fb5-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ths20cYQQygn15LBRACcgM3fE0Adz6lOt++g9hWbiXHvxst5gkOP3Q4Dn5qhcIC8bBcNoyB8O93Lyt5wG4sBvswLh2dusfPdLq3/rdHN/TxHZoii4e58/7gxeTd8mFyHQyELuWU8X5Ca5M2G/Smi87IwFvBz5024m0wcqE6xF0smHxele+ksRZWNyUXYyVeJYaL1UD1PivL8gCzh+2E/pxLCD1tbQIsVWrH+w6E+YoGsFSshboJDc/rICpHTSuqLLhRUqZBrpLzYy1XwMzXyqhpTr1bv3zc4Ztf+UCmjdZHnlB5CcOX/xAwJsFV/dOBmFPd0FZqdtRuEi1EsanWL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YEX4x3csvhwU9a1JvGEy2rXbRl8myJVdp7sXTKYJxs=;
 b=RVv9SwYD98jZkLvlV5tLsvK0vB4XGBLzvJlduKWYvS1bn1bKLaylUyC9kbA4ppLecbx0XBefhFsI/0gE+Ufjafo5bL6o47kTfzqf6AtOWSDOlIlmCiGznBdgViSaeC0IDa1fpNESQobGAEgerrliLakltXEZh5vwdxCa35CX4lit6X/xTe3B1nU63oMKceI7WMNKe8BIoWxsfejOgy4cj8nS8RnCwsanXfk93Pqy/SS0Toka2zAIlck4shEh4XmBfOF+MJm8p7tfujkr2ttSkSEEKXbysr5JzFd6U0XEMTfF262sVCoLZysiacOG7E/NPrPj16Mt9Wvo8QY8ca7EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YEX4x3csvhwU9a1JvGEy2rXbRl8myJVdp7sXTKYJxs=;
 b=A8vr5K1Gc80i/+DJqK1c3TCMDmyATsL6BIet/osE+b/ukSrcfiX+USu8a3+vwVFSDlKJcsbe3gLF228P8aM0e+9r8JaPghRuK9ZGNx5OHO8HN9TEa8JZLCFNxgBMv8lvNvvrX3w6VGgBXruvQ2XVpLya9mIBJy5Y4WAaNiU53FuSXddDnuEXZLkIerHSFN3KLbqPERCnX+29Oy5DQH7RxZXFbvZq+tUerK59MWmt8bATkR3cFxtNEmi2Dz5YHlRqvqeV/xVjc6cqbiK8MATUcqDtTzfIdAGDvSYGV8B2+9Xm0G6I9wZWbC8te/4xGZOnQ3C65RUmNGywSjKW7ZNNxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6356ab5d-1ecd-da3c-4738-fb33ee2b187b@suse.com>
Date: Mon, 31 Jul 2023 17:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-2-luca.fancellu@arm.com>
 <876c7fa3-6759-ce5a-9e6d-9737eb4eb9ad@suse.com>
 <2C6F7309-B7EA-4FAA-8C72-E95D253F79FC@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2C6F7309-B7EA-4FAA-8C72-E95D253F79FC@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: aeda75dd-dd56-4dce-7ab2-08db91d9a852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m43mb4rr4FoJ0DMABtessu8S90dVVdt9YlpPvgHnF79OxXNcr7RN/hMOTyhaqcY1J8mipF7UvU1x/OYLwZ+MsFh98ZWHQSDXSMiRUx9RK8WCYITMEw7XuKYY05KuHT3Ry6c5MNd/Re9uUPjcf4K9+I3aHAF/XK9l1mSRHlyrDswQbWesO5dtfxd9W9b6fxVxzRid82AgttAmf8LgN5oS+9ibnRaInyjgIOf02OGOiTGJdm0ONlq7uLT1TjssuPbqbODYC5yMI5+jsyC40sVPjm0n7cWTSAWgo+Ld4HZhDuUfPAg817dxcxRE9pFYT+bT1FYrg6zeKqijXnqVhkXl4+heTL/WaCNO9jQuxl+87LxrJeRCUh/UyRLhZGN5XHxNU97GTQp30faE3pqZJfVgUccT8b+mDk5WXQvHbQb9mxUgsU79LMKgjRzRvqi+7LA4CvfCB/R9NM8Ib0tcXr1LbrXo5qXb3FNjfxnH/hdlq0E1C2tzKVmI63iaq2Tt/UYJat2j+/IAce4Wgfr1VdQ259amgP4U7zU5mh2Af7IVSu0OvWhDGTfGTl6D03uVfD7AyoM0Ommnp1DGMmFD7Oxe9eVMGCClaTF/5ndhW+ZiG6VLr/bqanzaHL5wh6ay+NHQzE/4Hw6qZCBDYnDwuPsTvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(86362001)(66476007)(31696002)(41300700001)(8936002)(31686004)(8676002)(316002)(6916009)(5660300002)(4326008)(66946007)(66556008)(54906003)(478600001)(2906002)(38100700002)(36756003)(6512007)(6486002)(186003)(26005)(6506007)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk16V0NNdS8zMEdjbkVSaUk2dnBLdnk2UTFHRVQxL3dwUmFQLzRpeU9rekc1?=
 =?utf-8?B?Q2lDQ1Z1M1RrL3RZNzh1NjBwTkRHMTBuR2FzRG4wVkE3eW11S0VKUzJrakdx?=
 =?utf-8?B?ZmFTQmlZQkx3Y09oZ1MyT3krT29UYlVtMkllVCtZTmYvRHl1b081MjhrOVEy?=
 =?utf-8?B?QjR5NGFZbTNkMjhod2xhZWJuSUwxdjkrK2NwTEp2OFBSNVdZZmh3a3Z0RTl3?=
 =?utf-8?B?am1PM0RNVVNmaGRaRW9RcTR1N1EveVJhclNjbW5laTQ4V0VzR3l2ZWYxWmwv?=
 =?utf-8?B?cG9RK0pNb3drL1lWYWxvcnRUOGZrcHdTeEJsNUJmMkowL2J3OExCVG9PS2dp?=
 =?utf-8?B?WEYrY1lBdGszNnFlNTFCVVpKNVpLMVhLdmdoYkladGJuWUJFUjdTNjJ1Q3dC?=
 =?utf-8?B?VEpyVjUyVmVRSFlpa2hWTWRBZENZcFBuQzVxR01ndFh0MzV5ZUNlZktmMjh1?=
 =?utf-8?B?NE9TVzVzSnArZElVN2pOYklZWno0L3YzOEpWM0x2T0ZadFd5VlNKNzFsSWpN?=
 =?utf-8?B?MXZ0NTBiRnRPUC9PSlYzVE1WZGYvb0REcFBBeXhaWFpQeVlPWHNCVVNIYklv?=
 =?utf-8?B?cDhob0RtZk1tWFdTdEFxM0NtelFOSDdBOWFrYUNXMmcxSnc0VFVWbk5hcHl2?=
 =?utf-8?B?bzY5a2Q4L3pYSitleDhrbkVhdll3M3g2bmVKNi9LRXZIL2pmeEJtSnM2UU4z?=
 =?utf-8?B?ZHFyR0dacjVWaEN6c0dUS2tHbjZyL01hd2cxdUZDalFhVy8zYXl5eE0yZHIy?=
 =?utf-8?B?Rm8zWXdsSVBUT0twSEdJRGVVVlIwVFhCMEpqOFJmbU9tY0d1VHhEajRpU1dB?=
 =?utf-8?B?Y2h6V3pFemRJRWNyM3p4K3lxV1Uvc2NXRjZPWmVzdXZRU0o1eThKTnhjTXFG?=
 =?utf-8?B?UTdSYjF1SENhNXVVVDdjTFU5aEdFendodjh6clZLTThxLzg0TVNQTlN4VkI2?=
 =?utf-8?B?Z1QrNUxCUlBKcEV3UU1aZElPQ2ZtTEZyQ0NKcTRTZlZ4MEg4Zm1FNGkycC9l?=
 =?utf-8?B?WXRpdFpRTDI2cFVzV3IxelVFa0oxc0tXenRkSWVKWi9idmg4bDkrL0paUlZr?=
 =?utf-8?B?QnM3SXlURUxJUlpreGNxYjh3S0RUaFBydlJCTDNWdmk2VlBoV0d4Z01HdWpy?=
 =?utf-8?B?VitnMXVhNTBzYzVBb0FTT04rNGlsQUdOMnJRbDlXWTliMUZudjVpMkN1REZn?=
 =?utf-8?B?LzI3YjRGQ3hrSmROMkRrbFluRzdQOGhvTndRQUFWUjRpYmdkMVRwMVpLZnA1?=
 =?utf-8?B?d3JyMVo2SVBsWlNxSUlWY0IyblpkT05tZXk1Y3lIcUdGQTNtdk1Ldit3Sk02?=
 =?utf-8?B?bmVvb2ZhUy9IUHdMSDBHQkRpUGJyd1NxbjdHTE9GSlk5V2xlVFdRanRqa3NY?=
 =?utf-8?B?VHY4ODI3U09YN1gzcGR1RVZkR3JkQk1xSHo5QmZqalVpVUU0V0J3MVl2T2ox?=
 =?utf-8?B?Y2hFUnNray9jNTczN1pIZkxXUUM5bGhmQzdzdFl1QVY0cHBCemNWOU83Q2ta?=
 =?utf-8?B?MHA1TVVma3J5a1MyWHh5TFRJeEkwRXBHSjhBUVNCZngyUUVRRElwZlJLcTls?=
 =?utf-8?B?c05lVHgvS25FaDBlSEFpU2pVOWVWYmJPa0ZiZVVpd2VpK1BYZzl2ZEphMVFT?=
 =?utf-8?B?WTBsZ2QxOUxid2dWcU9zNTFRSkhGNVhpOWI3QkNrcm95SmlIdnU4dGVpOSti?=
 =?utf-8?B?UkhycHVZZWhwcGFTTDI5MFJNeWd2OVljQ2xyL3RHUmZ1YThHd1hRcnBBekM3?=
 =?utf-8?B?RGVaVFZmbVFxQ1UwclN1NXFBTGpEZmt0SVc2dnhLVVNjNnVzSXBmT0NoU1JJ?=
 =?utf-8?B?eFdjSHJaZFpzYU8wNTFpMzFsWUlLS3d5bGcxS2dHYW9CRk5aQmh4RVZBMXJw?=
 =?utf-8?B?L0JyOHZTVHFDMmhoNHBtaG1ZV1RqRDJVc1l2b09lZGlrZHdIdlMxRWprVTha?=
 =?utf-8?B?czdUanhtK0FabnF5bUhoa2s4M2IvdkhLWktzTXpNUWd6MmV2amxMWko3MDFG?=
 =?utf-8?B?R1B3QUdzZk9DVWtOV1lPcnYyNllJcmIyZFpmZTFsODFWcmduWC9ENmJKZ1By?=
 =?utf-8?B?MXlRQzNCTnM1eWtmbHdtcEUrekJJbU1HZmViYkMwamVkVW0weGxrbEg2WTRW?=
 =?utf-8?Q?DJxrk2vHb6pev7Kun1dEy5Y80?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeda75dd-dd56-4dce-7ab2-08db91d9a852
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:20:22.2355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pRG+fNb5sl+5KB1EKBQolSlm1KVQMMYTegmC925ab/ljvLf6lwD4FrMPzFi3R0ybbg4XXYwzJ3lYt7GZcF3vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8330

On 31.07.2023 17:11, Luca Fancellu wrote:
>>> +        {
>>> +            "rel_path": "arch/x86/include/asm/bug.h",
>>> +            "comment": "Includes mostly assembly macro"
>>> +        },
>>
>> Mind me asking why assembly macros wouldn't want maintaining in proper
>> style?
> 
> From what I know (experts on CF correct me if I am wrong) clang-format is meant to format only some languages
> (C/C++/...) and assembly is not one of them, so what is happening is that most of the time clang-format breaks
> it, in fact we are formatting only .c and .h, but since we have some headers with assembly macros, I’ve seen some issues
> that ranges from really ugly formatting to build break.
> 
> One thing we could do, is to export the headers that contain only assembly stuffs in dedicate headers (<header>_asm.h ?)
> so that we could easily use a name regex to exclude "*_asm.h” from clang-format? And also these headers could #error if
> included when __ASSEMBLY__ is not defined?

In principle this may be a route to go (naming aside), but first of all
I wonder what "assembler macros" are to you: We use both C macros and
true assembler macros in assembly code. The former I would hope formatting
tools don't have an issue with.

Jan

