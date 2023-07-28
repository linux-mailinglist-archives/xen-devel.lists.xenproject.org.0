Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D4766BE3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 13:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571434.895267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLlV-0003Ji-68; Fri, 28 Jul 2023 11:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571434.895267; Fri, 28 Jul 2023 11:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLlV-0003HT-3J; Fri, 28 Jul 2023 11:36:13 +0000
Received: by outflank-mailman (input) for mailman id 571434;
 Fri, 28 Jul 2023 11:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPLlU-0003HN-2J
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 11:36:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1678e2d-2d3a-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 13:36:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 11:36:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 11:36:05 +0000
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
X-Inumbo-ID: f1678e2d-2d3a-11ee-b24d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjpN5HRaxRAZ09QcjMibceZpKljDkOvSWWO25z8wnndoXBzI6a+2N+V/w0jSV+bWRY7WzjKJzPZqNsQuf5bm5TA9n2KUyLfPMm66bqHs6+LTm6Z32pHzUqCMBhs/ucf2YXhuaW0xEvQGEtCu0fZzjhb7g5RBaRIZDoRCDEicjJrBYhOvnZe52c0Ft5vEIjldOKCloHmEZnEwGl9Ctk74aSAW5WaCtPO1sRrXAS1tMYEMaoW5Ah9X+8tfTKnLqhjegBKpxiwMM6Q3p8Fc08QNpWLVj6mQn48s0R/QeK0jy0HmMmJl6aRyhKOV4jmZVH0PESrKT/Tr8m8A+zXmUS2CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktfLmxlXK57bO+MJWojIhxJvX7c3Pcq7960V1SSpI80=;
 b=ZiOJsUo0MQy9cgq52dZvnw5eOyRuxw5FWrerURdpHSW0fNV/FL3WW3CNiJ2Ad33NnXKUl5xsdL9s0kj/1hOjxGElLcMxvEJRD2QcR191FMsoCwQJvkVnsQAmNEULV+cHD+HLGb9XG9aGNZ47QXP9o9EthCjO3tv+kKAHrjlJwGIa487U4kcVGGv2VIcCHIihcLLG9nekeyoy6FWl6CFTF1MlfkOgn+LXR+d6cN9fcSUGbSPVUTDowKrB78Dd9IrNMyfb1zHrlu8/L0DIUAKyNMP98z8KaxAX4sHOyJGq9r90d/XNtfYr/KaAubUnAqdW1yPuT8HcEJniheDEvoTbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktfLmxlXK57bO+MJWojIhxJvX7c3Pcq7960V1SSpI80=;
 b=B5AWXt5B6eH+bqW51HeK4OgHjlRXf7/Ks2xi3I+tSRZO+6f12Xb9ZbViQrjUcoVHuJtCx4owK8yfA9mL66CzXb8+p57GdLuM7deBCe4/2fFQBpSpEQB4h5NTBT0fpaVNeYpZIxKG2OzWkJYwGUoInD14eIjrYikNZ/V7eMM8cUI2sjMi/ZIcxlqw/IRANRXEx9iDB7r6houPFv46Ztrp9m+BHj9bw3tbQa5PwPjKD2naLBCM3JJoQSjYnlVg+UMDaYMhn3GkjiYrsw+I86V1YDX/HsM46KK/6aHBb5GjjZuCEbLwPx5RMA9s0US5KeuAOSKXNUwkrr9gIjJ6Zw4h/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf7964bd-be34-47f8-ffc7-67e34e779aac@suse.com>
Date: Fri, 28 Jul 2023 13:36:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 0/5] clang-format for Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <27a9861c-7901-d9f4-37c8-f6895aac64de@suse.com>
 <815F80B1-7D0A-4A1C-B3B5-E1E3D30E327C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <815F80B1-7D0A-4A1C-B3B5-E1E3D30E327C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 22863a82-9eda-4ab5-0823-08db8f5ed405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CnjKXL6Ifz+jAhFqQmgfZW3W05YHlLBelzo0g61kRLxlygnUsS+2lwoaWOurCLzZ0pTWNhjXO60UMuh0dqPPf2EZO3wx9ax29qwLOzOVfmGC0IbKj1CyyOoVCfaqIaZKfuN67SSYtOE9qi6yCamu7J1H6ylyn6LS4JM0cONzr31cdTPdgVEhyHtkGnXCVXrWw+nepE3E+lhSytu5i+VpyKdLDmWC/karco6M42AOus08fsVhiTrwKdL4l7c7yNyL/OUOM6x37qojLnzlaRn8bdUqW4M4XIXYYw2JXdf7AOdcxzTty5PwrwDpBST4qNzhdnnfdUD+BS5PCaAAxIWtf0phvIenhFcFp/ssGsCKdHL1KndZ3LKDuuIPetUFijxL0Tm78H+6lPTHM7w9LevNQCnwgVktix/TqbrmF/BcGpE7MP4+dDznTSodvn5Ll+ezNujblr6xhwPiwlLHKr2cmBo4UTlKroirAFYoA2DNz3hqZtfQl5HzWjQSfy14c9ni2oUbyIyDpnK16HBuP7j/BmLn2uMhtV4NZfSnreGu38W7UKDMZPXLltzMl1xPYdDNlGdMSmFg38BU6rRwgUNemZ9x9+rzvCGXyToZB3ap+v0vF5uoSQe9EfByV3MZMp5VjF7wGM1bwO7vtgw8Un9gsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(83380400001)(31686004)(54906003)(31696002)(478600001)(2616005)(8936002)(8676002)(5660300002)(7416002)(41300700001)(36756003)(2906002)(6506007)(316002)(66946007)(38100700002)(86362001)(66476007)(66556008)(4326008)(6916009)(26005)(186003)(53546011)(6486002)(6666004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUMvdDJ3RVhKMTNnS0hsZ0N3eW9hRUZ1YVRRbzNvdzMzK1FhZjhTWHRaMEpS?=
 =?utf-8?B?SFhBYnRBblRwaHRucFZzVnJISVA2cHZKVm5wdVcyL3pJZ1ZYMWhJUmdBSmE5?=
 =?utf-8?B?Vktmc2w1OC9Gd21CaXFEMTFJUjdZcVBtVWZ0Y3VkNFN2SDU4b1FnTjZRRHN3?=
 =?utf-8?B?RjdpWnlZSTZrRGk4WllxUTN5QWlYaWV6OEMxWlNYWGxWN1JXam9wUzIwTGZ3?=
 =?utf-8?B?cEJxQ21tSkVDSnV0RzdXNEhQVW4vQUtyUGVlRUJhSWZ5YU84VVp0SitTSW5E?=
 =?utf-8?B?ZFJaSjh6bUx5Y09JVG5XUFdkeVZjSmFrNHRYeTludjVidHpiaGtsbWg5VXRT?=
 =?utf-8?B?R0J6UE5pcHpmTUozdy9oelVGa0xpOTFhVStVQ3A1d3BZVi9uS3lMTkx5QThI?=
 =?utf-8?B?YXIxL2k5cEVVSTcwODJQdW5pQzVxM1FCdEE3ODFTUS8xQlZDVUI0SHNIdjZV?=
 =?utf-8?B?T3FCT3VESDdheHdrbUR4NnJmTmxTeHk5c0dvMng2UUNaNGQ3bGRVUTZuMHdE?=
 =?utf-8?B?bzRQbDBtaDNrckMzekRsWG01ODhiUDRVSlhNNndwcjAwTkdMRHI3Zm9LN2w4?=
 =?utf-8?B?aGV5QmszT21HbmpoMXl0MUZpYWhNclJkaldqSG5mV1dPeHcyNkhoRjM2QXhh?=
 =?utf-8?B?a2g2Wjhhak5XUkZ1RUtXTkR5eHQ0R3VWMzRnNEhkK1JacFA3U2FGU0hycjMw?=
 =?utf-8?B?dDhZK2VvdFQ1SG96MjRxYzVEekUyN2h3a0RuK1lha3FFcUJZNDZSWUp5SThJ?=
 =?utf-8?B?UlEwL09uaTRMMHRzNmtrK1Zidk5YSnprelN4SldEVU5pMnQ1c2lGZGJTdXBq?=
 =?utf-8?B?a05lcHAvbnFyZEtGV2NmV3Z5S3R0Q005R0xSSnMzVGI5ekxGZlRPMUdoNFcv?=
 =?utf-8?B?V25xWW0yUTVGQzJwQitZdEx1ZDQ0aUxYdlpJbFdkbGlZLzZMQ21xK2w3S2pu?=
 =?utf-8?B?cmU2UnE0RzRuUE1nblhoRm1jcUxvVkppalRQcFZualNBclh5a25zVDd3UWRj?=
 =?utf-8?B?b0FpS053ajlQb3RjancwT2I1azV4aFprajlMZGo0QjRkUzZKZEZWaGFtMW4r?=
 =?utf-8?B?cHJyZCtuQlhpK0VObUpBOUswOUt2RG5EWUUvVlM0R09VSjgxekoyZXh5bGxn?=
 =?utf-8?B?eVJJRmpVZFJ6dmhtVUZqNnUvcWxoT1pHWEYwcDVjUk5Kd1lMT0EzNHRCdEw5?=
 =?utf-8?B?NTVKQkFsQmZVUFlCUjc1QmF4MVI1TVBEUUNUMWFlWE01NytLNWpFcUxySHpj?=
 =?utf-8?B?MnA4dkcrMjIzVjNDbXRvakovWWtyaU1HQ3l5OEVoU2VTVy9QanRpd3dpTGdZ?=
 =?utf-8?B?aEkrRldYZm1UYzRXR0tkYXBrenM3T3NSK0tyeHRxUTgrVlRVNW5vZExZWWZv?=
 =?utf-8?B?N3BJazNtcThSOXdlc3ovUnZmNXRmUUp0MWFuVSs2L3ZHV2cwaGovaWhaR1BM?=
 =?utf-8?B?aXFVSUxKdlRNWTRMbWJVWmFiQzJkTjA4NnNEVjNmK05ONnc5L2hrWkJSenNl?=
 =?utf-8?B?bTlRTWUxbVJ0RC92ajVvdUN6dDRKUnhGcnVEUDlKVmUxQ0ZoY3dFRWpxa2d6?=
 =?utf-8?B?NlJYVksreDZsNVlKUUV3SzYyQUhhTUpSWmljYTlSR1VzcEJFQm1mOC92WWNy?=
 =?utf-8?B?c0FkbENKbjA2eXJKTXNjckYwYkFxY3o1ZnUvbTBiOU8yK29xSHFSZlY4REIz?=
 =?utf-8?B?d1pwOVp1Nm1uMkttb3A1b2t1c092L1BwOXR5ZEZIS01qVVE0Z1lDdzJwK3Bn?=
 =?utf-8?B?eU5PYXhMS0JGUktWZjlnRUNqU0RKKzNwU2wyVjlHOFhjNVNIM2d0R21WQldq?=
 =?utf-8?B?enMzNWRGUElRMVU3SjVJU002d29HTGxYUnY4VUcrdlVqWkJUa3Y5NFY5bXI2?=
 =?utf-8?B?blUwb3NCVDhUZHRZa0xGS3dwelJFTlh0Tkl5WENldlFCQVVZeUUxbUVQTFVj?=
 =?utf-8?B?UXlUa1FoUGJYRUZ4alBTSi9MYjlhNE9NL0pKVm5rQ0JlYUZ1SXZpVURHRUZZ?=
 =?utf-8?B?M1ZQN0owZUxqTWQ2VkhEUmljUDByY0tWQUtRT3FaeGo3QTJnaWE2TGFXRExn?=
 =?utf-8?B?MWhJMjVWY21lcXhQVUtFL0dyTlU3d2VaRmcyOWV6TmpqZGVnZE9kZEx2OUgy?=
 =?utf-8?Q?K2bFFcUmfmh6coSH2DNOIkd3O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22863a82-9eda-4ab5-0823-08db8f5ed405
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 11:36:05.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4D/ypZeF+whuN55GZ3w8/BBkcPUPejellac5r0rdDRBRYavcDkJMzEPUh2aXD16wTckfAelLhN7/Q4gzxBf9Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

On 28.07.2023 12:50, Luca Fancellu wrote:
> 
> 
>> On 28 Jul 2023, at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.07.2023 10:11, Luca Fancellu wrote:
>>> I've read the past threads about the brave people who dared to try to introduce
>>> clang-format for the xen codebase, some of them from 5 years ago, two points
>>> were clear: 1) goto label needs to be indented and 2) do-while loops have the
>>> braket in the same line.
>>> While point 1) was quite a blocker, it seemd to me that point 2) was less
>>> controversial to be changed in the Xen codestyle, so the current wrapper script
>>> handles only the point 1 (which is easy), the point 2 can be more tricky to
>>> handle.
>>
>> I'm afraid I view the do/while part pretty much as a blocker as well.
>> While placing the opening brace according to our style elsewhere would
>> be okay-ish (just a little wasteful to have two almost empty lines),
>> having the closing brace on a separate line is problematic: At least I
>> consider a block / scope to end at the line where the closing brace is.
>> So the farther do and while are apart, the more
>>
>>    do
>>    {
>>        ...;
>>    }
>>    while ( cond );
>>    ...;
>>
>> is going to be misleading. While normally we would write potentially
>> conflicting constructs this way
>>
>>    while ( cond )
>>        ;
>>
>> the alternative spelling still isn't outright wrong in our style (I
>> believe):
>>
>>    while ( cond );
> 
> Hi Jan,
> 
> Thank you for your feedback, I could maybe misunderstood your reply, so please
> tell me if I am wrong, the Xen coding style mandates this style for do-while loops:
> 
> do {
> /* Do stuff. */
> } while ( condition );
> 
> Currently clang-format is able to do only this:
> 
> do
> {
> /* Do stuff. */
> } while ( condition );

Oh, I hadn't understood your description that way.

> So the issue is only in the opening brackets, not the closing one. Is it a blocker too?

No. I don't like the longer form, but I could live with it.

Jan

