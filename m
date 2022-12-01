Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8380063EF53
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450533.707854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hci-0001XY-V4; Thu, 01 Dec 2022 11:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450533.707854; Thu, 01 Dec 2022 11:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hci-0001VW-S7; Thu, 01 Dec 2022 11:21:00 +0000
Received: by outflank-mailman (input) for mailman id 450533;
 Thu, 01 Dec 2022 11:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0hch-0001EY-2c
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:20:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a51eb28-716a-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:20:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Thu, 1 Dec
 2022 11:20:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:20:52 +0000
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
X-Inumbo-ID: 3a51eb28-716a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0XXqcYPfyjK3WKD82dnvrHsJ8MMenr9YAupc6W/k4B8yllycUsAVNDvlhMfXEUapz8ulkJJcQV47Hb9buBrB9DImEFt5gDpM61/hFTZOsI2uzKO4SD5KeM4vr4si7i4YNbJw6nuSidQB++1cs5h7+8eSmJr0f6ErNHcWRYKMk740ftCZcwF6HLh3TaEmBWzGJDMdUSX1b66r44dRZ2MkwrQfTa4ZU12Jfag75Ab8pG+z3Nx7NU4BZMGn9+gTGKW/Go4af+b3KYNZRyiKbXzQ0cuLwv6OckzC5xtx5GUkhRoR985JvPFi4vZQO+F1KIuHvtzzEvaRM3n4F95O7rBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMJjuJi8bJYQBmtK1tEJB0+DrvlHB8ny1vOTO1rWOzE=;
 b=LnY2MeGxyH4AgaZKLjs8qGz5Uz3brH/x/1UnP+m9rkF1UZvUD672Bt7E0J/VW1556cJkCJDSCSWg+YlFa7l1farGwpdcE2fvZ3Hb9rsV6yYbb22EA0IdhxIUzo9fz9xBPwq8ysKd8Maczpmxm3Gw8RRHTvHv5RSo+iP/z+KzNEld0BtMCzs8SF2xMXdj40A+IYOhzGjWA0BgkcEMfyjjTzXPXxdsJNBREoRSiRAi32WzFJk/KK38lAIpzNt+bCs0o1Cf70Nseow5Civc2YUMpvxBa/SWnsqeIIBJdlgMV4NL8V000EemvFP0ShfkSi8mPcvu63CCAxadbX9XENeztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMJjuJi8bJYQBmtK1tEJB0+DrvlHB8ny1vOTO1rWOzE=;
 b=OcVaZnuQBWExT3dR66IgL7/sn50LbhRLqgp1MrG/mP+qBqzzkP/6t7P5igMz+xVOzDrh4m25A0ILCIlPSOLvS7mcbDEAUpvInSVZ8DPtbVffBR1k7t3XyYWPLMZ3nUElqC4y88RWlLEmjS6KIYPaeRt4AS0IplYPpVL0b+mnHW6hILKKrY7CN1LFCe6tg/dOzM2gHscIp2Usp1HNT9TL5ybTTXno6czJfa77H3gPdfg3xwTpEu9l1m6a/E98O0biaFKV7b0VZWswCxbfKHnaBryS4LzQyfHYZxuJdwCRxYPBUiMobGGeINTcBCjtcFqZGMYZo6vKk7iSmyfctXAjAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5aacddc-1149-6a8d-4840-836edb3ad0c0@suse.com>
Date: Thu, 1 Dec 2022 12:20:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop>
 <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
 <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <471b6470-b0b7-a97d-2114-a1871e237a89@suse.com>
 <3FE8EBB1-B565-4257-B966-BD1E97E32451@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3FE8EBB1-B565-4257-B966-BD1E97E32451@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 58391638-b900-46a4-bdf9-08dad38e1b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oJ1aW6ymSTVrnsXWP3A0SO849K7KQJHtC0ZIE3lT7+P1ZIBaV1ZhrnK9VRB76T9ls36Y5GFnDk+3Q8cptGRoR6rBXCbN18YO1CCnfYZ6FvE7mN/Zyy50S5tK7F41+WRBRQd5j7zOZ+CF3pdStKvaX4Jok3bO6ZVbAwkS1LDXveare3DqBqP1uvJIYbDs3oOJTTJ6iz4X4jE/eN142B/lEky+3ql/3EREMJ6JLDT3xZDTbf2EeOan41uql3JCUJ0emdU7G+2PkU/PRCOU2P+Gb+EuBTXl08R38MIWbPObEnddj60j4PcwOaNTtRYzrLeZwG6Z2P+sNax3ekqkM20/Ze/UUuPlnSC8Wb4D+JlswnLyyaVTqHT2UbHXR5+5UaNVqOKrXDksOSUz0bQK028AuAF1QGoLQVZUZ0kl0jMxSZNskjSrzsxS8x6oLj8TziuTiOT5MWDxcIlDMK3ItVCJYryPnopSDYk7LRYTfLUIYxN8J5et+U1OzunXMxttWTfA+hlOMKouJ7Ol3J554JMljGzmpUNkcj8Fg1Zh6Ydpr2Mv7R0Z5Mgh4FjIoUL9NlcphZTP8hWyD22HAvy/H/dRtHvDbsLr1DnbyoecIX1RYjN5qNxtMnqDUhJZ9dGIyx+yXSVrZKGkhHGWg5AZV+3/p1YIvNEmrbNbPxNU2aejBZeJ90EWoKHioG36LK/OnH36BP7RECYZYalOg+fvWZzWmBTIXMGYASRi6/h0cFzCqQ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(26005)(5660300002)(6512007)(36756003)(53546011)(54906003)(86362001)(6916009)(6506007)(316002)(38100700002)(4326008)(2906002)(66476007)(31696002)(8676002)(8936002)(66946007)(66556008)(2616005)(41300700001)(186003)(6486002)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZ3bUh0ckJRWkFDZFhXZFE1RHBuQzhyc1B5cGxmVkQyT1czM0ZEeEFJbm1D?=
 =?utf-8?B?ajlBdDJxSzI5SFNvajZNQTh6M1laTHJyU201NGkxODkydUJEQ2lRVFFvdy85?=
 =?utf-8?B?czEwMVhKOVZFL1ZIdnZMekNGVXorZGlMckxrM0Ztb0wxRjFYaUd1MGxEOEpk?=
 =?utf-8?B?VmJuUU95MjBmd05mdEtuSnp1VG5vM2IxWUJxS2w1UFZ5eHRhUTZDVXRrT3lM?=
 =?utf-8?B?K1hnY3BFckRNdnllMlpONmsyRFoxazI2TUo4QS9KUG9HR3JjcGMxMzRZODJF?=
 =?utf-8?B?eTRRVEpKcnhjWFhIUEp6SWphbXlzWkxqa3FzWmY1UFVtYkRlTm4vU1Zvb0t5?=
 =?utf-8?B?Z3FvalFzbG04c01PNDB2TTMweVd0K0dYSlJodFNBWXdpc0REV2N6Y29MK29B?=
 =?utf-8?B?bGhrRmVYVkQ4ekpMS294NmlKKzRodWpyQy9hcjE3ZmJLTU9XVHRzT1M2bXM4?=
 =?utf-8?B?UmE5RHNYUTU0MVZXZ2pSa1JjUkV5NmQ0SlBCYzlnaTI1TmtBWFZzSmtPZDQv?=
 =?utf-8?B?M1djR0ljTXAxcGlmdUFLQ0hWd2VVYjlrOEo1L252MDZHS1dMM3B3OUhkcWJU?=
 =?utf-8?B?cHEyRE95dlhQVXNPREhYeHNWM2MxV2FtWDNZUkNFRW84R3BZVkVIbzVMcWdw?=
 =?utf-8?B?eHR3VjJWdWFZblNOVWRjVXZSdytHQWY3aEtxVDNvZEFId0JrbFFzTlAzWWty?=
 =?utf-8?B?cmtnRTVRZk9haEkrbDNuQlhBMnRSc2VBRjBjaFFvVkIybXVlNitSYU9EUzdX?=
 =?utf-8?B?YzBYYmY1WjlkZGxDakpsckF5T1FzYVlIZUl5am5lcU92Vm1yQytJOVh0eUxG?=
 =?utf-8?B?Tk9xd2ZVd1hyaSs2THY2YUkvK1IwZFNZcmN4SG02c0RNSG14b0tJRmxxSEFW?=
 =?utf-8?B?WFp0KzU5SHRDMHpxZXZnUzNLQWNBZXhscmpldzZ4Wml0ZFEzUTZUSkdKMnZk?=
 =?utf-8?B?c2dQSklUK2gzUlBFUU9NdzhHRVRIYjhOSUJCRi9UMWt0a1piVG42Z1I3TUp4?=
 =?utf-8?B?d2c2QUsrVzNrSnJLVmVKMVJpZjhkczVZS3ZKUWQrMGVQSjRadG1rR0RWWHJ1?=
 =?utf-8?B?L2ptSkU2Wk5Bd2NkVGRXMDJ6cnpOSGhtQW50V0Y4UjZQcEFud0ljQmhaU1Nv?=
 =?utf-8?B?dCtCUWM2cXJjNVVqUk9Td2UySC9ReGE4cXFpK1E2cThGNVBZU2IxaHhLY29i?=
 =?utf-8?B?b3ZjQU1YNUtWa3o4dXhLZ1VqODdXSUpleElQQW04Z0NhU2pqeTQ5Q1VlNkdo?=
 =?utf-8?B?Q1FQVjh1WkhvRExsM3U3QlJGM1A1Vk9GTndGZTVsbFFoaXR0b2RUSER0UjNY?=
 =?utf-8?B?MnNzcFhYQUV5UVdBSm9VM2txandJQWxzOFpya3U3dm5OSEhSWC9OOVNqVUlu?=
 =?utf-8?B?ZTNKeHFHdUsxWWFNUms3bCtTRmZMTWVlRFhLbFpEU2FRdlQ2QlJLYUl3YUk3?=
 =?utf-8?B?VUh0MWlKRnZEeHBGdDJNKzVTbWlJay8yL1J0MHdpcGlZOGluY2dyV3hzS3No?=
 =?utf-8?B?SnhnempoaTZ3UW1BYjIwQ0ZyU3Uvcm9VWFBVbStHejNWMEZyWlFoVURGQ2kr?=
 =?utf-8?B?ckhleWdmK05pRCtHOFEyTithWitKWHl0OStuMEVFRlhNWlRGZ05pSGgxcGl4?=
 =?utf-8?B?WXliUDh6Vm9MRDhnNHNXSnB5V1VJOGp5UjR5dTBWV01oSjVKeFpvSXcwYklx?=
 =?utf-8?B?ejdjRTdzSmo5eVk4OHNKbWwraGtzN0dCVTVCYlBJNWpYSXJNUVVzYTRkNHFo?=
 =?utf-8?B?bmF1V1J1emhEbUNjRFBjZnpDcWFLcFhRMHVyalNyRFQvQTM1UHZKT05BQW4w?=
 =?utf-8?B?QWhqQWRRbUtnbm5YVEcyQ2JJRHI2RjBaNXRweGRVZDZ2VTRmL3VuTlR1cDBq?=
 =?utf-8?B?MDFwaGUwcnEyUXBMbTBYSkVaMlJRVVpZOXFwOVVvNHgxUDI0NlZQSWpXMkNQ?=
 =?utf-8?B?Y1F0MDlJaUN4UjgwV1VxejdGNUcydkF4M0k0ZEVPUTBicnZicmhUMmo0VzZr?=
 =?utf-8?B?RUdxeEh2c1ZmUEp3UHZ2dGpac2N3UUwyNUNvcFR2MkJCeWZpcVk5OWxqTnhl?=
 =?utf-8?B?emJ3WnNZbCtpSUVldXcxdFlwWjcreUlQdEU1bWdPemlMQk54MWRoQWRGL1Jj?=
 =?utf-8?Q?XVKCtMuYuFlll2Jj2bjjcwScJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58391638-b900-46a4-bdf9-08dad38e1b2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 11:20:52.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMjJfXm3MsFF34fZRSQ0KgEiPicuMqlBNJcdbnRL8cJTCel4qNQW2zRz2YkCoWbCC5M/m4HGnUocs0OhJBoN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

On 01.12.2022 12:18, Luca Fancellu wrote:
>> On 1 Dec 2022, at 08:33, Jan Beulich <jbeulich@suse.com> wrote:
>> On 30.11.2022 21:26, Stefano Stabellini wrote:
>>> On Wed, 30 Nov 2022, Luca Fancellu wrote:
>>>>> I think the revert of the cppcheck integration in xen/Makefile and
>>>>> xen/tools/merge_cppcheck_reports.py could be a separate patch. There is
>>>>> no need to make sure cppcheck support in the xen Makefile is
>>>>> "bisectable". That patch could have my acked-by already.
>>>>
>>>> Ok I will split these changes in a following patch
>>>>
>>>>>
>>>>> Also the document changes introduced in this patch have my reviewed-by:
>>>>> - docs/misra/cppcheck.txt
>>>>> - docs/misra/documenting-violations.rst
>>>>> - docs/misra/false-positive-cppcheck.json
>>>>> - docs/misra/xen-static-analysis.rst
>>>>
>>>> Thank you, should I put those files in a separate patch with your rev-by before
>>>> this patch or this is just a comment for you to remember which file you already
>>>> reviewed?
>>>
>>> If Jan and the other reviewers are OK, I think you could split them out
>>> in a separate patch and add my reviewed-by. If Jan prefers to keep it
>>> all together in one patch, then I wrote it down so that I remember what
>>> I have already acked :-)
>>
>> Docs changes being split off and going in first is okay as long as what
>> is being documented is present behavior. If other changes are needed to
>> make (parts of) new documentation actually correct, then it should imo
>> go together. If new documentation describes future behavior (e.g.
>> design docs), then of course it's fine as well to go in early, as then
>> there simply is no code anywhere which this would (temporarily) not
>> describe correctly.
> 
> Yeah I thought so, I would prefer to keep these files here otherwise I would need to
> change them somehow and I would lose the r-by anyway.
> 
> Regarding the revert of cppcheck from makefile and xen/tools/merge_cppcheck_reports.py,
> are you ok if I send a patch with only those changes? Would it be ok for you if the new patch
> is after this one?

I don't mind you doing so, but I guess the question is mainly to people
actually / possibly making use of those make goals.

Jan

