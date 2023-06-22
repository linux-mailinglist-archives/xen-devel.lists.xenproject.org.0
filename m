Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F67398F2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553317.863804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFIV-0000s8-4q; Thu, 22 Jun 2023 08:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553317.863804; Thu, 22 Jun 2023 08:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFIV-0000pU-0h; Thu, 22 Jun 2023 08:04:07 +0000
Received: by outflank-mailman (input) for mailman id 553317;
 Thu, 22 Jun 2023 08:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFIT-0000pO-KF
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:04:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5995cbbe-10d3-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:04:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8481.eurprd04.prod.outlook.com (2603:10a6:20b:349::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 08:04:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:04:00 +0000
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
X-Inumbo-ID: 5995cbbe-10d3-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqwzJfO8b34wEWwrgH/X/c4sL1rTLt2ToxRAVmR0sHb1/azIxUgJYfDY/PhWW4Hlv9fTef988M/60STyt8GzBlLjmX8U3s+Nu7j3mWVRq84lphYmFWNdFitz5JaNW7v/zugu6ZnJMPicZKzol7qGSSXKKDNO7UNlq0wdJMADVbUFHBkL30nRJBFlDOD2B2qqZXB0klbeI6TYxiVYTsOrmBFY67dKCyiU467tfNkWpHAblfeTsKUXGGFYMHgMzFbO0B/geWOLPu9cMlRqeGvIjUcArckx21bOMD+x9QkBfbS9XyPACxZfaGbGNDTmA9UEeipPDmPT33rQSCh5tv7OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fSgQa3puLw26q+rm2itAR3cQNOG9PA/mStDcsaH9bU=;
 b=ikgm91nToezvv5gje0Yl6YT+WwW7XVeaQZHkAzY/U/EOfmt3opC+hKCkMWpcBMFIns2z/E2ywrboVLvpawB/bh1HlZjOhKxl3lKQktwWNrz+bVhJ/xJgRunbZ0JhHDQ6G9a1O6hvTicGALjyqpJIYiclhuHDFtdFgWgG8+jfInOMpdUbR3wOEAnYaFixTlsygWKPOjVe1PDEYE06fPpfvLm30+yLVZX+R1ZChm0ib/Hg/Z8YPmh4PGYgm5CUZTujfXdo49JvHvsqa/eZk73x/CfyWnh2RQ20NBtazqaOYVC2Moa/mFAmO8eVFEYZzNvwdwitR2djGFJgnBuq2zQcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fSgQa3puLw26q+rm2itAR3cQNOG9PA/mStDcsaH9bU=;
 b=DcMyZAyRb2RPHoQcax41N1sGx1Ly1onjHgAkXx/Zt5onO5eDYrJbvSlIU21yqW3y3M64iLybwNiOKe/9ewjD0Rrew31Nrmvjy9g7NRW4/INyHLU45pZpmu3WXwP+cCzJ4YuCqrB/xSrOi16IZUvdjSuVXNX4RA7vTpEi17rRsCOz7cOIwakKciGeFgVjsGrjuJVUDvKuyNSyIwIdF9kTQRCjum0NjeAG4s8I3YnWFqtH1xDnfs7zDo9Yh9m8mxsZdefoMQH8hHYbRGeYHV2xIoGqRx3QggX5wyDMqrgleHITAC5CHleir/vCs4weY+Fu3kVpl2f1B1f9eGut5ZYFeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec8a7bfa-025a-5f40-f4f2-a8969e8ccf55@suse.com>
Date: Thu, 22 Jun 2023 10:03:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
 <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d8ad9d-327b-4929-c592-08db72f73cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CoOqUyoiOxJKAZgHXkqbV0a3EjCgSw+1M6AZCzD56CK8RXelC71ZWwebFuy+OfHj8DmP7zwAYAvyXEB7uO6pBeKBlCcSgYi+ZQlxJ8r7ETncb8n2rUeYiFwbY/UifdAVqwjsANNvqVLwNpNfxhZvJv7iwQjMg+CY1cPy3zsRvrUOe9D8MYiHgx7Phz/aaY09mXcsTGASkSPck7a1BfZuOyS3yem61uXd0NroWx8ivEfg8coDf1Z6k6//Q2PCvfsC9y3kO7axT287nJmbLl3ePmoEnXVmrxovyn+l9iZXN6HC33bFCLUWGm50RYr6uWeWYJ/6Y3yQCOKnl8KgtCmecNlMiaDBgcH0JHBcRnUQiK3Dmyssn1a/rsrvG8WMBNbO3swUf1GBKHY1LcjJB3KxdyF/be+kuFh6pmlYCvtbH2RO5sofB2pbczAmsS9hJkOEUrG4AETQr63FZn6BdiO8eoYQ1pQoUAmG3hHrzDvdvwjLE4TE4p+0Vjc8wZiEssEqIZ3b23yvXLgnxZ6dXYSLJyqPnSNSK1Seit3gHOnqQ2x/15khwKMYO10pxJ+IdyYhPbQ64p7aLFAnm+96Z2DqbmRHRta31Gpma2eKxOKqT9wbP7MSfd4+08NE46M5VW2cp/Uc0EYhrhI426xq0LPa1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(8936002)(2906002)(38100700002)(2616005)(6916009)(66476007)(66946007)(66556008)(4326008)(86362001)(36756003)(31696002)(6486002)(316002)(8676002)(41300700001)(5660300002)(186003)(4744005)(6666004)(6512007)(31686004)(26005)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zy9aZ3ZmY25xeVlCdHRYc0NqVmF3NWtubWtwU1R0VkRpUDNvWFQwNXJib3lH?=
 =?utf-8?B?TjllaTlQckJneXpvZExuR3FXczBGM1dVSUg0bHZmRmJhYmNPclplTFNibnQw?=
 =?utf-8?B?VmFiN0dqbnFEYzZ3WFRrYUwveEJyMEFubnZBY25WRmV1VWdXb05jM3p5RklX?=
 =?utf-8?B?czVUT04rZjdsVXZ2bUJXMXljRlY5d08xRkhYbEVJWmZPM2RtWjAySnBHdXJZ?=
 =?utf-8?B?Mmh3b2NKRzVRaWM1RnRyTUZFOTQ4UTlPZHV3Qk1Mc25iYzc0cWtaUjNHcFlO?=
 =?utf-8?B?aE8zb2pibWZNcXlyOTV0LzlFcmRQOW8yK2xCU0s2Y3VLZWZOdXBjU2REWk1w?=
 =?utf-8?B?dVVUU01nQUxLWjFreTNuZTl3WDcvTzEwTExCYmJXV3Y2TUNGR0sydnRNU1B2?=
 =?utf-8?B?eHB0ODNtK0tKZmEyUTBQZTh5RHA3RHBaY0lXS0ZlNDR1cDBseE03Tm9jTElz?=
 =?utf-8?B?c0htVzM2Y09GTjdUeEVqMVNwT3dqdWQ4dnpGcXlyN1F1blcxL0ZNSzVCWDFC?=
 =?utf-8?B?TnBVNFhmS0NDaEsxdE9veGs0MU5ZcW1HREh6Q3hTRGNxMzhrZktsem96T0tz?=
 =?utf-8?B?am4yaDlsWCsvSGlGZ1BOQUZMbTdyelkxRGNMVTlVQ0NnTlgzK3N5b1FIeVFs?=
 =?utf-8?B?U0trOW00TzMzcUlkVWhlZE0yclBkWktMK1o1Z0ZoMDZ1QUJEK25HZjNMVTdq?=
 =?utf-8?B?NkF5bC91ems5dGtjVGhJa3ZWNHUybDFFV0NWU3ExMTA4YWU2T0VtUTZ1MHM5?=
 =?utf-8?B?MHdQLzl4QnlJRzdyV2RmWmVNVFNYR3RQZUROd0NYVjF3L2JPOTVJc2Q4Y2NT?=
 =?utf-8?B?TmRad0VZSk8wajlGY3BkVzFzTUdmd3dtRVhWVHlzb2VZZlJteEUveWJsYnVJ?=
 =?utf-8?B?QkF1YUFMNUM3T1k4QnRCSVJOVU9OdmNGcmZUS01OZUREYWNuSE9GWlNQcWdR?=
 =?utf-8?B?a3QwSTNqK2ROY3hieUxjZlFLOUFvTFhjdUxVY3J5K01pVlNac200dlZIQlBB?=
 =?utf-8?B?NDkwWDB1ZTZGMDRqODZ1OXNWTFl0dEJtM3M3Y3NjOHdNbTVBV2hLemF1MTR4?=
 =?utf-8?B?ZFg3UEpSMGZ2S0t2c0pKVGJreTd6N0pqd0pDRHZzU1JIa0NSZitnU1FwYmNa?=
 =?utf-8?B?d29aSGxUcjZubkI2VEVhazViVnRkNzJ1dGdSMzl6K2dsZ3RyclNyZDMrMmdT?=
 =?utf-8?B?dkpWNU9ZQXN4eVNLeVJmL1JqNFRoTHpPSituSThXNk1xVWxreExpQjJ0ZDJO?=
 =?utf-8?B?TzFHVDE2dzNMNjF1WHlGSjBqL092SHlhZ1BOV3dqZFhCUUpBUW1xbTdkdmZx?=
 =?utf-8?B?R0JvQnpISDlZWDFkajlySEVGV1Q3ODJtZEJiMTFjK3NRQStVaDNRMDVsS2Nz?=
 =?utf-8?B?cm5CaXBKQjkreGZNR2ZUSGVrQjhMdmJiVlptOXlMTE1rR212ZzhZcVVNQ2FL?=
 =?utf-8?B?cGh1OS9ucmUxdHdaLzFuSml6aHBmb09JQXFJWDRLMnhoSm5SV2dxQkhiT1pj?=
 =?utf-8?B?QXZ0UHJNaWU0b0FCQ1d0UFFuRllrQ1hBRjR1OHowWHVFU001VjFSdXBBWGlH?=
 =?utf-8?B?b08zTmxZUHZMcDhxb1FjYS9vcTlkUkc1SEhQejlBZkl4cW41eWlZQnhvVzF4?=
 =?utf-8?B?YlJFQ3ZZSmh2WDdGWjdwYW5TMC9tdi92UTgvdUZ2V3Jaa1ltU3NSQ1ZLOFpH?=
 =?utf-8?B?UHRSMHRCb1VFVStDbWZBTkU4a0xuS3EzWFhqU25mVHB6aG1tSWJLcUI2RWN4?=
 =?utf-8?B?UlcxQzFhTGJIYU5odWtLbmswNjkxOVAyNW5vMzl0aUZlNS92d3FsbkpqeHU0?=
 =?utf-8?B?b2wxbnZCVklVZUVxaXFuVjdmRXBNcHhPbzdBNm5xMVFoazFLVGltVHFWV29G?=
 =?utf-8?B?ZTVKYkVqMGd3Z1ZsR1phdlY3KzN0azQ1d3Eya05mOHRtbnZhRDFtbENlWnVm?=
 =?utf-8?B?c1dQQmM5KzFLTEVaUXVmOGlOc0Q0SEVXOWxTbVNwVUYwZldCOHJ6QW9SSVVu?=
 =?utf-8?B?dytWUitaQXZqZ2lLbCs4blB1SzNTWnUwZTVWb3EwMVNDMndvQWF5ZGpXdnNI?=
 =?utf-8?B?ZS9xMGpiUHRQVDBDVC90d2t6TVJTN3krRjBabjZxUC9CMktDL1RmWGVJT0dU?=
 =?utf-8?Q?xnnc1Sc8iIXG9tGjaxWHiKBPo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d8ad9d-327b-4929-c592-08db72f73cbe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:04:00.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzVfypXyPN0GC2LBtpqzwgEWvDlFL5QsGdTHvixHkUe7U9KezPZXFYI8HrKzFTgYMTeI5U4B6Kd2ZbMNhaya7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8481

On 21.06.2023 20:21, Shawn Anastasio wrote:
> On 6/21/23 12:54 PM, Andrew Cooper wrote:
>> Given:
>>
>> #define r0  0
>>
>> do the assemblers really not understand register names?  That seems mad.
> 
> Yeah as surprising as it is, ppc64 assemblers don't handle register
> names by default. I think at some point a flag was added to GAS (and
> probably llvm? will have to check) to define them for you, but I'm not
> sure which version introduced the flag.

Isn't it that you simply need to prefix them with %? That looks to be
working for me without any special options in PPC code I maintain for
an entirely different purpose.

Jan

