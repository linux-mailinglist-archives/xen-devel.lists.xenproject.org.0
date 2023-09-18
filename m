Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDD7A4A6E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 15:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604039.941259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDsQ-0008RB-SB; Mon, 18 Sep 2023 13:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604039.941259; Mon, 18 Sep 2023 13:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDsQ-0008Oq-OS; Mon, 18 Sep 2023 13:01:22 +0000
Received: by outflank-mailman (input) for mailman id 604039;
 Mon, 18 Sep 2023 13:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiDsP-0008OM-Gh
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 13:01:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750ecb0f-5623-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 15:01:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 13:01:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:01:16 +0000
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
X-Inumbo-ID: 750ecb0f-5623-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXoCB4Z8ZJ5xv4vo/lcyaQfWAjb/Vkw8nBVLBFJIPgx8FEVDl39QOMYweCed8TFHt4y9eg5ew5BnzeKh9tQXJGqulBTnQDEH1TR0dQpzNLfFPDYcoo8dAA8mnaAj2mAVRtrC+zF13y6EdAOAHdn+As0P07TMphm3uFOW2szFL+YB6UourfYxqbOtYL9gpFGCW/8dJ8lVn4n7PLzDrz/lWj1jNv4RLOV3dqJGv+ngwNxXTIw9/O3XT3H8lD8sIkU2PDSLHfWrXs9SNW5xWBbYJ9anGu096poAVLrf8VI3Wy8V0HuxnZGQzPUpptThAH/ytoOiV7h2WCM1uEDXAnjUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDRTXhyEnove3BzMv0AvHNet2hJFeUKZNxbpuSsxB0k=;
 b=FhbFa6pmlgGsJnNvJ9izAw8dEB9yRNtYR5c9CGCwCvpJXGyLUoXWLaUQJOs2QPDm+8PmAzqM+WnkLmHNspaSIzq8YGyTSAdHtN0FjtrY4RZlUwdLfrPSt6Zhu6TMGQ+E05EmDYAMSgTmeTnyD3gTR3WpGRyEKRhPOS0XkXZ19HnVVof6CY4buMJWW1KXkgCbkIPM6yc40/wv85ME/Bd5jy25a1jtQHQ5Q0KNe10a6ZqldyyGBeyQXiNszbk1cQ7zBL6EqHsHyzvy+buZrpIU8Mbd65HFaC80p0WEBBS1qWjytZg7yAEjFtDwdcp+ff/mUjTvuUxWa3PIaOk4Zi08Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDRTXhyEnove3BzMv0AvHNet2hJFeUKZNxbpuSsxB0k=;
 b=DW8RQUYdmvKjftm70OnFc84PvRPzQpQD5xfeZobnFWtSvbO7+ALyUbqiMdh/yVOCD8kMlPY/gQvbX244cl1qqD2Kjuk0xAEa1UQYks7F+f8NXsj1bOGqxpS+qSRk69DkBwMKxUF/03BgUkDV0l+FYk/d46D7CzEsFhiH3vdidLj7RwFci9fxPzvkTl56VSsngmR6dVSt/4/w8gXhCXZLLX8Pabiqt0YKKLfNw0/Tk090T9yMEwcHCi6zPMjBvpXPCkyXuavReRmnNBZWIF00LQiJlEO28704vqnqTH3karbRN1G+mD9LlurSWvLFcdFwYJj8DkW4M/j9StGYITULOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebd99e84-ed89-25c7-62f0-c82de3c4038b@suse.com>
Date: Mon, 18 Sep 2023 15:01:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/4] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
 <b0a77fda0c663ecfbf40d177f275a51817efb28e.1694717278.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b0a77fda0c663ecfbf40d177f275a51817efb28e.1694717278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1af1f9-0cea-44d1-3f82-08dbb84757d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LsEJoFzUQZ2BTkaH/fkY/ZhJuK6E6bSRtz4bFDUzs4jUEIpB8sZpSzPmoD3Umvhl0zngdEhw94816JeTl1npQd8HnPE7zDwx08fK3AryBF+uXv+vIyVDRFBwk6WmiQhvit8olJ9yyM9/CNkZGbgfsdtMVg2denzPVlWxbK1TltAcKe7UdDDekTQAdJu0cvpsyoRVqfZfKcnaKMWFuhg276UWnSS7DON4x/rzN9YRrk+YrJUAlSD22EkIonNWiB50LXNNkc0gAjbordCuUUMQfGmb0PCE6k5YWU9vbjzOjmqgOkYs/LD1XNNZFVkJHuZzK6ENNZe9ih1sjwi6Ms1PuKbjCBfwQujX+WcmE1rllFJAg41A7Ys2meEeyjppxFETMUPGPSDtpJWEOiWR+5+r0W6eNHqk5pzmZymZhK2hrrgcNRz4B2yeYNsua72UHMfOko2AwIl0jCwKbqH7XbsRYxAASoFXBN8MMbhHM4wUVRQmIK8VzU8Y2LqeoBoSSW+JI40DA6WR/QUWuRW388ph3b8Qss0p+s94XFrUYS2n4b2HGCeP5cQprTbADIaN3luBImpbrjxCsUtEjOc3IYrLMrm/3PnSUpOOslyzwGUmCGNtB+B4EasRdTwE+/VGY659mO6zi+ITRBWzQXCi9ku1ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(1800799009)(451199024)(186009)(31686004)(6666004)(6506007)(6486002)(53546011)(31696002)(86362001)(38100700002)(36756003)(26005)(2616005)(4744005)(2906002)(6512007)(478600001)(83380400001)(5660300002)(8676002)(4326008)(316002)(6916009)(8936002)(41300700001)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3NqSTV5THlRMjk0eWlQemZLcUp6TVpsd2JPdFVPZVdEbmJSQXNZVG5BWUhD?=
 =?utf-8?B?N2p5RVhFMzVKcFlFeVFURkFnL0lGcWp1ODdUY1FyTW5qaG9pTGZMbUNndUxF?=
 =?utf-8?B?SVNtNUVnNzNZOVJTOUhXZEtLS0l4V1hYOFNVek5iQ1QvcEN6STNwQzFhd1ZB?=
 =?utf-8?B?OWVZNStyQ3IraVVGOTRGZTYya1R3RzdlWCtxb3pWZHhnZ0wwU3RjaEFlbEg1?=
 =?utf-8?B?UnU2empUeUllSUZuYnNOdVJ0eDA0ZzRCRWY4cUQzWktPWGtQWWNQV3JEWVcz?=
 =?utf-8?B?K051VWNTQkJvZExJbjQ3eUdxWTllTXVYV3d2U0dhUG1vUk5xY0JDY01kRzJI?=
 =?utf-8?B?V2NCRVhTaUpveUFXb0hZQ3doaVBYYmxUZzdoSkpNQUhZVlZ5bXo4RUdLeFVv?=
 =?utf-8?B?VW4yaWlnZDNjeTNrejJXai84eWkzbG91Sm95d2dLeVMzaENBZXZGNmVhM01W?=
 =?utf-8?B?ejFzTUx6RXNaOFZlbFVveXlCdmY1cUNqbTNpNUx2d1h6TTFrd3VkdGprT29u?=
 =?utf-8?B?RGFVeXV1K3BDU2tDQmxzcXF2N01sT0FzWFZLMG9WRisvNmZMUGR0MUJoUDVM?=
 =?utf-8?B?ZFNlRC9HVk1ybUVzc2lTV0pLRHN4amY2dWhtSVh4aUh0NERhR2RieXkya0xq?=
 =?utf-8?B?VFhMVmhUUGNDclk1anQ3ZFdBOWRMYktSdlNhWGwxRDRQWENsTUQzVXBHcSt1?=
 =?utf-8?B?YUgzczBHNzdFdk5CZ083QTZTcGxHd01aeVFCc2tuUXplUkpWS2dLVVlRMXdl?=
 =?utf-8?B?Q3RNZGQ2QURnakJGdzNTZ3lwQW9mNWdPV0tleUR6dHpUdGM3Sk5WZ3R2ZlN1?=
 =?utf-8?B?UjVXZ0E5MFJSNExldWtteHA4S1p3SFhSVXpVUnB6eEdSSEhFRFI1Z2l0RlB0?=
 =?utf-8?B?VDZFVmNsYWJUa2VBUVlOQmNJSGZUbERBeTBaUjdVYVJoSjQ1RURITDNYMGZN?=
 =?utf-8?B?OFFJRXJYYnBlU2JPN093eWkrU0lJZEhmMCs1U3pWYm52OVdzcmJndmV4RnB0?=
 =?utf-8?B?YUdaZkhSdWUrSTMzbkViRzltNHdHY1VkaG5zeVFkWXJNV3o4R2tWK3JZMkF6?=
 =?utf-8?B?SVE4UWZwSitqZVFaWExtWFh0MWFEZzRUalVMUVpvd2FUVldESHlJRklrd3h2?=
 =?utf-8?B?d08wWG1iQUx5cHJxQ0M5R2xUc1U3N3BpNEVHaUdUdkRJK3E1Wk5yM1lVd1Jz?=
 =?utf-8?B?aldub2RTU1lVYVEzWWp3N1JCVXJQenV1dyt5UUFLQnVRRzlFZXNYK3FVdXFm?=
 =?utf-8?B?VGFxeHJOOTAvRXk4UDVtQlN6R0FSaHRSTGNCQmhaYVo4OUlsUmQvbjZzWitB?=
 =?utf-8?B?WkVMTWttT3M3eDNKOGtySG9NTzZRMzBqaVM0TFdxbnNoS3NGK095cHJrVHQr?=
 =?utf-8?B?VTRKc1dLZFNMQU9VWHZxNVlYRldEZXZHOWhvVTJFVzJtbG4zMFNMeGpzN29w?=
 =?utf-8?B?YUlYVGR0Q3BaS2xQaEZIcHkyclhZU0FmMW0wZUxOb2VTQnJmamlNQXQwZS9r?=
 =?utf-8?B?UkdNTzR6VlpqV1djdE8xYzJGL0ZqNTk5MGYyTVE1NHJBcE1pUjV4eG1KbWNm?=
 =?utf-8?B?NEtlRnl4Qm5QYi9uMUwvUXZvRTBscnZ1Q3BCSTBmcmoyYklNRlB1N0J4WFp6?=
 =?utf-8?B?R2Uvclpnb2l3bXVadXE2amZMNjhZNVRnaWdJZERxa0VFQ2U2US9SQUIrdk54?=
 =?utf-8?B?cmNQVXVDWlptUEttdlZ0NE9YODJIdUxyM1FSL1RheUF0LzN5QUtKcFoyd3I4?=
 =?utf-8?B?WDVIWW9ZL2RYMTZoTUlXVnM4THlwVHRoWWVJbU5rNVR3RGNjMngydktKMkg0?=
 =?utf-8?B?Z2VYUExJUU1QaFZPYUJQMGV4c0taYloxb1lEUEV6M2JxTHMrQmlHbFlGc1lh?=
 =?utf-8?B?U3h3RnhMZ1RMcmtQUEMxemNncUxkNTNML2J2eUVTWjd5N1BJNXFSMzNtcUpa?=
 =?utf-8?B?TEZzdzBvRURDWlhlUUVDUUZTRXNtbXlwbnBrbU1yYVErSHpVMGFuZTFFcGx0?=
 =?utf-8?B?VmNyYlNMRjZWdWZTR28vWDU4WVU1alNOanZ3aW13SDZHellMY1RybG12VFpK?=
 =?utf-8?B?SFZucTEyYWJvY2FCc2JCT2pXdVZ5NjJoZFRtVnhsM3ZVWFJPelBmRW4yWGFo?=
 =?utf-8?Q?ygVEvHOOvZwtQpFodE88cOCaI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1af1f9-0cea-44d1-3f82-08dbb84757d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:01:16.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xDzHANzGPEBpxmfIGgwN13jegLx6GgbB1IyiX1wO3CrfoqBmhYxqlkcppAZhC1PAI3HDJLR9PDrkBFHAZq2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

On 14.09.2023 21:03, Shawn Anastasio wrote:
> Implement bitops.h, based on Linux's implementation as of commit
> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
> Linux's implementation, this code diverges significantly in a number of
> ways:
>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>   - PPC32-specific code paths dropped
>   - Formatting completely re-done to more closely line up with Xen.
>     Including 4 space indentation.
>   - Use GCC's __builtin_popcount* for hweight* implementation
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



