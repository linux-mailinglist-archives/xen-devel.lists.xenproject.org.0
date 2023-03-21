Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDED6C3688
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512834.793117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeSw-0006aU-CN; Tue, 21 Mar 2023 16:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512834.793117; Tue, 21 Mar 2023 16:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeSw-0006XR-9F; Tue, 21 Mar 2023 16:04:02 +0000
Received: by outflank-mailman (input) for mailman id 512834;
 Tue, 21 Mar 2023 16:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peeSv-0006XL-6E
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:04:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0da108-c801-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:03:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8404.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:03:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:03:56 +0000
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
X-Inumbo-ID: fd0da108-c801-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js+dcOqgTaO5bRca/ApyvfYNdHFJd5qcIvP45m5SiuNXLvP0smiXiCEuFjEz1VnIzT13IzGqmVfOXuqJGilQ1p8t+iKL0SPrttB3lR8GyusCYVwck0LQlx5BRC6smAaPU58fm+/aaO+BVLeateIATb7DTYVVf8lAYXtSvGosF+/JMydNHTyxO/Dm40sxPKY7j7IbpADwab+vGpmzlsSkXSdVoyePckq4uYiJPuF3ME1+hlsoRzJbqlRXrNDxySdNR1FJl9Ehw2diLk2zKw5TPx4qyTvlhZ5OMK+3P22YcSvoiRQZKG7c+Z9E8ucdV7mHQQuRZcX3N+sU9mTQWIBuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlJDbu1FlW8ZxTKqy3Vjn0gQyyL06P+7Nqw3mGCGkfo=;
 b=SAeib/DoQ7xW47RMBFmebC/ccpQRmGeLaUNKwB8rTFU/im2fB9uK6nvY6Y9bGix9payGKujtNfeVmcXMVe10yQ614vTi3JYEyaccL+D8rPq36u+WGXQDfAk5itx90b55itQzhXak+lNbZKwNXeO1iH4Go1KFnBhd0VUyeO9dK/W1oMWPkO1doyMKroyb6q2OhSBDnCrV0qX8Qr4NKx3/qNPb4I8mIH+3raYFfo+3ES/4O2cevGChwOCrDTMBfB+UQxILazRF+ol2/uIprO+H47xFbU+fKsIm/NQ0hF607dqI9qddZiO1WLdqMLfcHKZzCpCPWOK/LstTGjlvtly3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlJDbu1FlW8ZxTKqy3Vjn0gQyyL06P+7Nqw3mGCGkfo=;
 b=g7xQykrNcO0SGWIeurZ+7Jv4j8hyKbDJs7HtAzqjuBRNqWWw8Yp3RlzUhoP7gpgXpPFU7nwYhklMZpwg825v/qUhuVQEeLSKq4kz0NJKxOYcDUTrRrvjFHPhZfZNhJ3qmGiY6Jvpxlf/n7CnbXC6O2EssAcTInMN5TiybhF5Ti9TjFDFaiMnrrKZssfMoBs+DGFu6TuIzJGOMkyL53xLTjyU+qhVIVZ0Javv6Mv2ocAWwtiJS4plFypb761dnYd2T2Rl4Ygj2j0d//lt6RJV0epmigcnGj7VEmDvPwUxbflOIsxlvU0AayTKlCf3WKH5u4nsRq6KweojpAezhs9Fyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a10e515e-3157-2a1e-1ae6-f6ed7c7d7296@suse.com>
Date: Tue, 21 Mar 2023 17:03:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <ZBnCTAw3Fj/BpvTl@Air-de-Roger>
 <9864c24a-6d08-5a5f-3de5-3b34b68a6edd@suse.com>
 <ZBnUIJLHJSBTlwLe@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBnUIJLHJSBTlwLe@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ad9911-3c77-4c2c-c1f4-08db2a25e00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Usyq7zoDRCCwioTcztJ/wgEJ0+4BNj9Utdyv4Jnn9kP5f3KvibO3BFwMlk/zsT3A3MTp9hRWwX7H7RSWlEXiPCkZ7nuA59wEqxSGKd7aSNqahwfXNzFK3pqcySYdwSAaekfcibQ9qpbRXDGmQzAL5k7xqV/W+Yz54kwXaddsPa3YxnLah3c5BtdcIXm5kVUZMDRM2kWZD30QklKZz9M6O0cDtQSthldzl/8xMph21gmRKF5oYUIaL8N09RpeomLzRDNZwFtwjNU2pGmj8lXaUUv3iJ6dRN7KU65kYgB+5ZUlzpWv9+Lf53FxoutiTOlnIiCCbiondjbBv8vPadI1mLnKDD1YRxpbsiJB3Yrprc+vZklWEW391hxmvzwInIeuB4Vzc5XbbE7PhkGvuaEQpDPGTgPQE/Ox/S2MDRnsEpNMLee+94ge3T1W+xcBD/vGPbqej1Taz3wyauXaFKXbBOpNA3FaDhH1kVfZoAASh0WFhYrKbRVwqkl+dyBRJj3vMK71u65+GzlMl18x2Fkx0hjQDHejnEj9E+YMd/I4BXdxSUeYdJnTB20fzucNoyJIL1w1qJvGGQHPVLxY2th5P4RffvNNJ2lOtPvMmRnJkDxd/NaWHtBPLe3f9bkAU/076vsNUfBJ34ImBGhZ2shJgqq4AL4ZOGN5TgFjBkZW8S/A/EwjItkIXPBG3PE9DWLmY+2+Y+yhmpU0AgMj2hn2gNmjRc2JS6DEm1StfOYC6bo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(66556008)(2616005)(6506007)(6512007)(186003)(26005)(31686004)(6486002)(8676002)(6916009)(83380400001)(53546011)(4326008)(66476007)(316002)(478600001)(54906003)(66946007)(5660300002)(8936002)(2906002)(41300700001)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c211K1ZYRndIenR4STN3VUlabWVZZXlUS2Z5bmh2SjlqNi9Uc1Jnb3dkV0Zt?=
 =?utf-8?B?elZKY0dZcjBQZjhpZk1WQVhrTnR0YzVCYkxFVGVPa0NSeGFzZ2xSUnRTWUVk?=
 =?utf-8?B?M3p2aVo3cFlGNXJiZVBzR1psTkkvOFBMVnFYaWRMUElyME5zNldOVDZqMnFD?=
 =?utf-8?B?SkxSMG1rRGEyaFVWYzhaWTZpM1d2MS90SlA4eGdLTmk1NDJiWE1Jemw1MnJU?=
 =?utf-8?B?N09HVUhnZy9iNEpFMjg5UVF4RDN3SjJ3VStDbnkwbk96bWdDSWtzUER2RjRK?=
 =?utf-8?B?M2liTkpRa3FtTGx3M3B2ZWNSZVRHOFk4THpNR3ZXaHc2UUNncTRWMUJQNWJ3?=
 =?utf-8?B?eHlEbk84NTNIdFFGenhQcGpHQk9hcDc4M3Jkemk4cE9mcEJjUVREc2hhZTc1?=
 =?utf-8?B?K0FQZkd4WmF3SEhuWDcwVFVlT3padEVGLzcvYThUMUIxRmZQZ0ozS1BxSHZX?=
 =?utf-8?B?YUpISU9Ic3VmZ3VQNHUycVN2UlNDOXoxWUpCTThzS3I4SjBCUTRqTVd5R1p0?=
 =?utf-8?B?YllYRS84WjRFK0YvU2tXUFNSMGhjS0Y0UG84OGpGd09ZTm9MZm15TVkveFFq?=
 =?utf-8?B?ZlJlTjBleks1K1JvNzByOStVZ3ArZGFnazFvaWN1Q1VhNGdHQkxrMkNvMkU3?=
 =?utf-8?B?ZTFrK25FcTNSZklLbXlYOFFpWXhzaGNQendwZ3c1UmlLSVgyQXd5aitpR0tK?=
 =?utf-8?B?VTd1VHRJOFh5WjB3eXdtYnJEUEExeHF3U211RlFFOG5MVHVGb0NPUWE4eVJ4?=
 =?utf-8?B?bFQwTGxKZlJQU3NCN3ZtdVc0YXBROGYzM3ZFcGFjVUJ6RCsrZUNxbWlhK0VW?=
 =?utf-8?B?c1VyMUJ0aFlxV2M1Rnl4K2o2SXNoZld1OGNlKzdpTnROL3R1c05IQ0VBUEts?=
 =?utf-8?B?SzcrZzFlVmhGV0w2OWdqZFduUDFtODRhclAxdFVIMW44L3RIMWZlQkcxWXdj?=
 =?utf-8?B?SzZFMUpxakJoY1Yxd3hUdWVwUjBCbGN0L1JUTENndDhTa296R3E2U0RodENL?=
 =?utf-8?B?WEZFWlN0ZUVIMTFSYlpsbXp5S0pheXZvUnREalpvK2tmZXJ1VDRqQ1BQMUNi?=
 =?utf-8?B?bkFLUnRDMXF3eHp2UkxnZEwvWUFDaTFtNnVRbjhjUHFhWENnU1dJRGp0Yk5K?=
 =?utf-8?B?SkRhNlhRbXZUOVN5V3J6cHpqd3hGbW8zbkhydUhrMGcwRkJabm5Cd0lDUHI0?=
 =?utf-8?B?c0lIZXlLQWJVeWFDUGdGU0VZM2NJQWlHT0h0dVp3RERoT3VXaGkwem5PSVBi?=
 =?utf-8?B?QlVmdi9HcXJKdWpxMTdOcUZoRjhOSzBUb2o5eWRkOTZYQmlBNy8xNXBDKy9C?=
 =?utf-8?B?VEMrSWJJUWhNZUdqRHZtdi8xdHArN1I4dkNlMi9vSWpKSENQdzcxQUdyMGE3?=
 =?utf-8?B?SjZYN01ORHpCd3JtKzRNM2F3blRiaFdVdHVoaHc5ejIwZjBKY3BpV2tZR0dm?=
 =?utf-8?B?T0p2eU9mWUlxRGxXVFEyNm1jc0hqbTF5dGtPZEc5dkt2YkRnb2ttaVB0VTUv?=
 =?utf-8?B?SjRPd0NUT2ZsYWl1YlQvT1VDRlUyd3lPSHUwZ3FIV1lYV0hJdFBDb1FpcjMy?=
 =?utf-8?B?M0Q5VW9xM1dZdGFzNVh4Nk5IUE5PcG1Ed080M0tkNGxiaVZsa1k4SU80SU1k?=
 =?utf-8?B?dTRQVHZLZzdUTkdyOUdOYWMyK0p0NXE3NnYrWVBFcjlyR0xnN3d4Q011TllL?=
 =?utf-8?B?RTZzaFF0WU1GQnNsRmVPMTdRM1U0QUhpMlF1RTJMZDJwOHhCak4za0k0aVpM?=
 =?utf-8?B?Zmw1dGdMdi9UajY3bXFmOUhQQ2ZKYWpwSTRyeHlRTnd3QkJFQ1FBMnZ1dGZX?=
 =?utf-8?B?bUZwTnFYZ1VxejF3VXozUndyeGpvSlI5S3ZhSmdOZ29RMGQ1ODdFWUVHS2FM?=
 =?utf-8?B?TVA1czlYTFcwSlh0TksrQVJIYUdKYUZPSW5KSXRZU1doTGtOeWdJaFVWT09H?=
 =?utf-8?B?U1B1djlld2hNckM2cDBHVDFjdVdCa0s5Y3poU0t2Tzk4ZGtNdkhMV3pLdnZO?=
 =?utf-8?B?Q2p1b0xuTXlHci9vaXQveDMrQjVjWmJsMk5obnNhOWlDMlhGa1hSalVSTVJL?=
 =?utf-8?B?OU9iR1Mva0Z5TDFjMmNsQU16UmxORDZPRHJTWkI5MURXOHQzZGFXVDhNM3R2?=
 =?utf-8?Q?ko/lsYE1e6uRs6VdkL++c4XmG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad9911-3c77-4c2c-c1f4-08db2a25e00f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:03:56.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3V1mzVxv/OMiKKHp5mvper1HL0bYv33aqtmiI/VOMg5WGxWV/lRyuVzArsrLgeulppApKeEsrvqDd322crE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8404

On 21.03.2023 16:58, Roger Pau Monné wrote:
> On Tue, Mar 21, 2023 at 04:51:43PM +0100, Jan Beulich wrote:
>> On 21.03.2023 15:42, Roger Pau Monné wrote:
>>> On Tue, May 26, 2020 at 08:49:52AM +0200, Jan Beulich wrote:
>>>> Respective Core Gen10 processor lines are affected, too.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>>      case 0x000806e0: /* erratum KBL??? */
>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>>>
>>> I think this is errata CML101, I would add that at the end of the
>>> comment.
>>
>> Indeed in the current version of the document CML prefix exist. The older
>> document I've been looking at has no such letter acronyms in front of the
>> errata numbers. I can certainly update.
>>
>>> Also you seem to be missing the '806ec' model (806e0 case)? (listed as
>>> 'U 4+2 V1')
>>
>> Isn't that pre-existing (see 2nd line of context above)?
> 
> Oh, indeed.  Would you mind also adding a reference to CML101 for
> 0x000806e0 then?

Already done. Provided there'll be a v2 in the first place, considering
Andrew's comments (which I still need to properly consume).

Jan

