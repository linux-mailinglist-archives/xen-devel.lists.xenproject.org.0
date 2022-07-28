Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D29C584398
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 17:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376943.610004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5nd-0003WE-Fl; Thu, 28 Jul 2022 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376943.610004; Thu, 28 Jul 2022 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5nd-0003Tx-CR; Thu, 28 Jul 2022 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 376943;
 Thu, 28 Jul 2022 15:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oH5nc-0003Tr-BC
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 15:51:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c52b454-0e8d-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 17:51:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7368.eurprd04.prod.outlook.com (2603:10a6:10:1ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 15:51:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 15:51:39 +0000
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
X-Inumbo-ID: 2c52b454-0e8d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URtXR1WY7Wf2ns6O4HZAljmPqXeCfhOENh/Kn2tRhw8Ejs0qLaZL28vJ/guVZK8q8EgksDDoiCxq3vlMDkgbTunEZf+mmU3qMB5++tBRKtHzZjFJ+s42Af/Taj1GrEzoWyiM7rapE3jyHnesS0j/Fu+nkfhA4RzNkZnGl5Es8bBBoel2UPCqzaCH6+4EoSB63jQC52/hobzOiBoFAZIT0jFCF8q4aghNJVSfawSayWZnoROe/2bIapBnSk96bPD8P6IHDIrhDutrR9g6068Df14irRyvRQRXrEU6pjy590UFc0pgUr5KJ/rqSidagI3XpMbUM14Ff2cCQp8opHoCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0s+R7yNNKX3aIiKoZPdA1fzy8enW0+HY3llMQIngbQ=;
 b=OcSqXxcUQ1Ui8Qf6B14zQ7xTZxWb6jMvo6D5pFu1lIZ0e9Rmlbq0+3qtXZA3gkn3pDf30jtHh+1g0RPDYnSxjRJ4jivrtg7FnT/QzlHtleRuzLLXHJ5m8g/MlSIYe3jwkdKdtZ7VQkRr22ZOXADEJyGfn/9mCQx1SyQSbAGcIEJarquao+sD8uNS5pNa0M9CFU5hHB65+S1eqdlueCvBfKnrXiZFnGB4FFDoGW5KzdfoGeU7ZrIFYbjNi7yZEZEU32HbCDwI9zUDCb3r5/FVcyOd5q86yWpihVyQNCuMonU2Izq2AekGgzk03dVGXHd0OCB8WLU66Z8SWbidahUfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0s+R7yNNKX3aIiKoZPdA1fzy8enW0+HY3llMQIngbQ=;
 b=PyC98QuZlUTg79WOkPeL7hPrVNv9iHWpLbjU5IwJxGe8/uxMAz6tNqZ4NJ6biZz4qsWUeZ3z7hpV0zcVzINx6akE4E3tB95DZ34ShGWWiD29Vs7jNCTeVk6jERaMkkCxdjzPb8QtLduuxpQw/fVzfcLfEPCVER6XM3DeKloFpZOl6MqlMUlmRQ4YmR/HPb3hdGF35u9IWqmPMKdCU6OMcu1PB09j9gzMAZ/7/h/wVXdwA80XCtScFjbgL+X8tLJQ0ZOabB3zOcEG6cXYkUoV6aV5xUrM0WyR4LAmZunonHXkvBoA/98HhF66u5VaUq7xMZqZJl80q82ggh9E0iNidw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b398cfb-1b01-0e6b-f3f6-410350153383@suse.com>
Date: Thu, 28 Jul 2022 17:51:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
 <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
 <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
 <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71916ad2-09bf-496e-d520-08da70b10f81
X-MS-TrafficTypeDiagnostic: DBAPR04MB7368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ARD8AQPSWKgL4MhpHQQ6NUrE+hS3xh4EZhZK1xPzMbYc34p50MQ0k9o0yivGmLb1U2QxpEQYfD78r+CPZXZZN7epfZRRJCnrQD3cWyPTCem+Ll5ARx2Untl7Ohl56FoCHNyvYlT+bDgoCTW0vgrj1tkzzsZlnlQ/hzlGPJJdCP/NeH7Ss9q0UhygY/aIlDmRvvVNF5SRz64RSfMQVZhIsJtCk+9gScBbXgg8CUG9GOiGR/noz0uFclg5PFRuMciLtuS0asPcIFfhSYyghiL579WWamM7dE79QNQBz4+WjONwYxSbvGOihEBBiSskQUgOkQNyxyPWOe2A4WDdMIoHNH8UgPnnvOhghc3yPAuvPPLxtDny/O4+AeWRZnlocvSG7nKkJH6dvazUBJBis598CoshS0zmYwXo+DEtUY22zxiE6ppu2pSbl2Xdz4u49lFnW7CpU9rCpu13Qd7JNLzlHkQIjhOBbsuU4pL0F0GhuEWLIgC5rDjwxClzTFvB2tzJokkoPrbvQuHHCk19Effgq9yr2VwF93Sf/h4Ppcalbl10xx57h9AoHtU8cVb1VT7KeCSe0Ooq18y00vA+KC3Cg5fvJcF5Hwle4pAuIgQOQzvkGqOxgcSQTRxKgig1EbVBnUbKK8reXZuZf3C9bfM/I1jcygtckfeif+l5fjv/j5d/kfXAIgtsgGFP1coEQgAJWsBpBNlSlH+GNA0rAJ7Oqh9wjZqgb3/0K3iIaL/KcIJiMD9Cweg/2yejYFgnHpYRgwJAlwXAbkzEGYMbo9w+dYUC6+Ym3lzU1au9Gj+60RGlB424Im4Fe6+pHXItJhIdREHLk62TW8Lry9d0o5VE/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(346002)(376002)(136003)(84040400005)(4744005)(66946007)(66556008)(5660300002)(66476007)(31686004)(8936002)(316002)(36756003)(4326008)(8676002)(54906003)(41300700001)(6486002)(6916009)(478600001)(86362001)(2906002)(83380400001)(53546011)(2616005)(186003)(6506007)(6512007)(38100700002)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBOQXRwaDNRdXEwMlByNnJhcXNFL1M1cVhvelBmRTc1dXlUcE1xMEYxamFt?=
 =?utf-8?B?S0ZxUEJLOTVkWi8vSklSVHhnWFlIYlFsdkxGcnZOUE11eExXaFQ0Z05BRlc0?=
 =?utf-8?B?cjl5bHVoUGN1SnM2Titzc0w5M1hpMi8yMDBuZVZhODE2c1piWExQbGJML1Jj?=
 =?utf-8?B?ZmNNWEZ2RzBZQlRoVDVPdzFYK0VrR1cwMUZNdDZVdXg4azFXOHE3amRlNllF?=
 =?utf-8?B?MnJhZmZKU0FnL09vVlJzMXN3WVNUVGtlZ0JmQTRPc04wOVVDWUZzV0NIOStG?=
 =?utf-8?B?aXhBT1lyS3Q4bHpjRll0aHJXWlF4b2xJSzdOWjdET3lPQUJWWERFU1dORTJp?=
 =?utf-8?B?THNCRmNyYXZ6SzJBS2QrSytDbEFyM1F6U05aWjRzcGlJREI4NlNMdE92MkN5?=
 =?utf-8?B?Q2ozbEpOSnNocDNCd1FzN2VGV2kxVDFRQlhiTHV1WDlYMXpNMzYvQ0NvT2xS?=
 =?utf-8?B?R09MU1h1SDllZGdmVm0xWkJ5RWFEWWpQZHpUQ2lJSGFLNkplVDJDMEl5dHp5?=
 =?utf-8?B?enlDV20xQjM1MFlFL0wzVjM3a3BYRXRSaGVYSkk1SDE3akJ2emVtSEdXTnNF?=
 =?utf-8?B?emVsazU0N0JrTzhibmhuRzRUMVBRb0oyV04rc0I1VitYNEtRWmxTcG1ISGVk?=
 =?utf-8?B?d1pmVG10N29LVnkzd0dDa0JOc056amltUS9sdWJlMDVkS01Nc2cwU3VaT21J?=
 =?utf-8?B?QjlPZjYwc2k5dGxHam9NUTlBMzFlVUFpYXlub1lHUTcvNFhtTkhQRVhKTzlD?=
 =?utf-8?B?VDd2aXkvb01qcjYrdFFZNklRbGtpaXV6b29xZUdKeHJoQmFUNWsrNXJwYlIx?=
 =?utf-8?B?MTI3WjJ0K2tHMzMrRkJ6V29aNzJXNmFkMzFkV0xXbERQcSs3a1dQUExRZTNC?=
 =?utf-8?B?V3ZnQTVtQ0FBTnl5OEZVaVhTUjRlZ1BUcXhJM3RBOTRxK1JrUGg0dVZmYWdz?=
 =?utf-8?B?YWwvSndxazE4eWNiUHpsUklCb1RLY09yckJWNmFmZmo5d21tcmdlWVplRnNY?=
 =?utf-8?B?Z2pKNWo4Zm9XVFVJWmlMeEZiK2RGLy9pSTJDWFFpaWxwcXNmZTNnOVhaNFJy?=
 =?utf-8?B?SU04T0lmamtneXdqOXk1WDBsWjRSUk52T0ZNRWFlL1JSTVVOalcxQkJiTHhT?=
 =?utf-8?B?VGo3aWxmblVJMk9ZZHYzdmM1ZTdDWnA2dlQ5NFdOclpncVBtNFhDOFNraEhC?=
 =?utf-8?B?ZEdLMHN6SFczZE1wR015UmlHcVA5UVF6R0Z2a3RXZVhES2UvUUo3RmhBV3RL?=
 =?utf-8?B?TnpvcTdhQmV2MVV0QW9FQ3Q2WlQxRHNLL2RTZlZPcktDblI5SzhBdCtkVXdL?=
 =?utf-8?B?aW5XUWt0RzFjZ1dROXRDTEhaSXRRblh2RFJIYVFROWthMTlBU1BVT1o3eTlv?=
 =?utf-8?B?eTExbkpLV3dJMEtHc1oxWWRFVm9pVzB4U044MG9uMndSdWNoNnVsRG5xYVcz?=
 =?utf-8?B?bE1hRGtwelNnK002N1pZclJQVkRxYXpyRTJTZExuc0ZHWERlUmdQWS9FWXVT?=
 =?utf-8?B?WVhNUUZtOVgwc1E1VDlYQzcvdGpDTFJ2SThwRnNhcTBCQ0x1MUI0VUNoSGY5?=
 =?utf-8?B?anNWWU5xQjZNU1pHeitOMlpBWnUrSG5qMmt5VHd6MzN4cVF5WUtJbWRrZVJ5?=
 =?utf-8?B?cXpyMmhJL243ZXRWOUcrajlNZzY5eCsvcnVPZ0ZNNlJsU3dVZm1DNWFwYjZK?=
 =?utf-8?B?bFZTZDJlS2lxMXhYUW45WVFiM0NCRFBVRFUxMW5nZXkzTU5TK2JBbDZ6Z0tY?=
 =?utf-8?B?dEJ4ZlpyYUxkeGJrTHRLVXMxNEZCOVo5dUZwYmd2NUtqTjN6dlBLcDkyQzhM?=
 =?utf-8?B?c2xKT1U1RGtyeEtVckpIN2UzNHl0NHpGK3E2eEw5N3lqc0EzbVJCdjU0bVZo?=
 =?utf-8?B?Y2k4QVlJN2lEZTRMc0lKcUVhUjY5TFhMKzZxU0JFSVoxSm5JRTlaWTQyWitr?=
 =?utf-8?B?NTl6SVgvcVE5b00zZCs3WE13NXI2V01GeEd0N3p3cVZPZ0VWc3BERlcrR2Fk?=
 =?utf-8?B?VXBtNE1aczFWMkpaMWh3cnZxQWtsRVBGczVNcGxPd2c5YUVlRDBLZFdYSXBi?=
 =?utf-8?B?cHJXV2xueXlGTm1Rb3pVNzRDQnpobWo0ZVdTWnQ4MHhzM09DZHFEZlJNR2hm?=
 =?utf-8?Q?/bbulS4g9gIk1deqGXBIknVFJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71916ad2-09bf-496e-d520-08da70b10f81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 15:51:39.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD+7Ad1xftW9Pjs0hI2YvxcxDKYNXtNwYG6qaClXn5lITyad3SuvggFkpcoY5FS3/YxV3UHD0rMh2OQEVCYPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7368

On 28.07.2022 17:37, Rahul Singh wrote:
>> On 26 Jul 2022, at 6:37 pm, Julien Grall <julien@xen.org> wrote:
>> On 21/07/2022 16:37, Rahul Singh wrote:
>>> Ok. I will not add the warning. Just to confirm again is that okay If I add new command line option "max_event_channels” in
>>> next version for dom0 to restrict the max number of evtchn.
>>
>> Personally I am fine with a command line option to *globally* restrict the number of events channel. But Jan seemed to have some reservation. Quoting what he wrote previously:
>>
>> "Imo there would need to be a very good reason to limit Dom0's port range.
> 
> As you mentioned, if we don’t restrict the number of events channel for the dom0 system will boot slower.
> This is a good reason to restrict the number of event channels for dom0.
>  
> @Jan: I need your input on this before I send the next version of the patch series.

I have to admit that it's not clear to me what you expect - I continue to
think the way expressed before.

Jan

