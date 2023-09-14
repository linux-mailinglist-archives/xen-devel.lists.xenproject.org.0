Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213657A08C1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602445.939114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo2V-0003FQ-H7; Thu, 14 Sep 2023 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602445.939114; Thu, 14 Sep 2023 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo2V-0003Cx-EI; Thu, 14 Sep 2023 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 602445;
 Thu, 14 Sep 2023 15:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgo2U-00027V-MA
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:13:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50fd5cd7-5311-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 17:13:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 15:13:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:13:52 +0000
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
X-Inumbo-ID: 50fd5cd7-5311-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b55F8e85XOJOszqLcYIeAusFQfzR04dGXRZknzWSzsaeC17/cMrwtgrTUkJsFahEfM0Wu9p7VJ9F6KxeRilsczxmBRqDHfo5irsmA9lTqlvGDTSpqi/Hw5qQMAVTwIQuXoV7+bV88ICmknuGKNOuY0fiH3SwJHX3Fpt1f57pBS6gPJyBlG8Ge3bQPni4pwu3NbhK4hzRvj9Tfxw7HFUcVRrwNh/cOEmUt2ba3hnGnGqX2Ly4MtjwyN5ThJmklrJ1HAcr6O+uDXNMyc51aCPf7uJQhEoJ40KfvH+46+lP4X7VfOCS4gyQnYB28fzZsDiskW7x0aAFgT7CwQ9MBDp3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXrE9kB5G0kp1YfqkLG9M5csYIjyLKALWahcxAfjhbY=;
 b=LYQz/xnooGsPTo4+jjWjMcnyeLbtu/3VKZiX7gQT0sJr/KJ+g6pXRTauBpBWoLYO0SBsCKIhrzcVW5JYylg9muj2uvBpFIt09Gu9o/W2jtAxj6KgUpz+9FV+Zg5ACirmrgD02BRWSxs8p89/jbqfqvHbiAVAeKabq4DQW8xxCpCucsO8H3QmJTpoJHiT4/HLusfn8vvIbaIGhEXiJ/lDSdOKDFexJ94OTJzlv7JLAgqoNAgnphlztCBUgGGIKxLyJ6a8Y3gWmTOWXguG0KTRu6VKB3U/DIA3+qoBaxUyGTyb6wWHaLcikCVnUjTlAMmAbpN6aJK38JldIwito+Y1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXrE9kB5G0kp1YfqkLG9M5csYIjyLKALWahcxAfjhbY=;
 b=yleh2QvHHJudZZ8JNv3kDZs3hCquFzocVC3fgRqBoky6nm+84I96wGKwtpx+ZZI9SJDC93lt3zIqECCnsBgdClxZ2MbeCbkWdo8wD7FHCU8O8nGaAra/2qdtnXEFU1NppaDlP0AiULwFUaVE1rLGYtiwe+Qx6v7FNMCrUV9eKfM8Hy1IKn3AtYG5/cfktAFiavI0lhvpkuqVfxOEmg4LjRW/+hW0jXrwa+7TVlSPUAxkzxeVGwv0J+todke5vWmPe8j7VS66F9G3In3R7+ecjCcbTjMj/bGsf9fZn677/ILTsm072+yunGqid9aY/A3t5mHcGCuwcM70PebNPitlow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a4ff59f-01f6-ed8d-0a45-51c87f1ad71d@suse.com>
Date: Thu, 14 Sep 2023 17:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/5] x86/pv: Fix the determiniation of whether to inject
 #DB
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-2-andrew.cooper3@citrix.com>
 <d7c3d67d-cd5d-d2c8-34a4-2e0c99ebe92b@suse.com>
 <bc8eaf44-b93a-c6fc-01cf-4f39835d0e99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bc8eaf44-b93a-c6fc-01cf-4f39835d0e99@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ab7e02-ddf1-4bdc-8261-08dbb5353455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ID6X7+AtSxZ30t7kWVsjqRcUQsbYZLl0YBOaO1XGZjFpN3EM1CNNh7jkeXKeODT2Av21BmaNaip6lWbCJd9r6sfZkZe+dpXxWA+d4FC6zrUbNnAFa14Tt2wWZuBLvji1ZVdeibir93MLfFAOu6vUQGUOOR/pRTIoVP3IGhDKn6giz7lWpaDyixMl0qbC8HWC99m6V7gL4IuFQMSmXrYkUVkHi3AQPGAdqSvPOhn1tmu0aW6QagJQmsW6RQ6eoqygWJjGM9vWSUbSipK1EYKAABIJDMQy5XXke3BiITCf5vhkFKpoaDJxbjUDmBK4uAGlHwxt34FYRLMy5uQhPqYS9j0ZS/zhK2Fu6RijZ7r/tB2rbB7YC0KEaXw0HSxRiX+77ufmETH4zdZTGN4uAyNSDpr/B7POwezYw2xero1Sa85PlXJl6EpRJVd3MjD9OX77z4MphRO4aruDbCIzqeZi6RfBR1OuIt5HNdxP8YaWV0fL0rqnipUoZuLXpcn6y0Apf3+kdS1iC3RqqmV8YwqXLS2xtdH9ynFFH+ksgbJpN7mA4TbBPrBhasnlwgre1Kn34A37Ke1mNobTfrwRD2z8QhKuYy3/LN9sx00gDHEkrFYmTSQCtkRVZNlKLyv7qFrbWKy5vcAIZd7A02uqzkJUTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(36756003)(31686004)(2906002)(5660300002)(8936002)(8676002)(4326008)(41300700001)(66476007)(66556008)(54906003)(6916009)(26005)(66946007)(316002)(478600001)(86362001)(6666004)(6512007)(6506007)(6486002)(83380400001)(2616005)(38100700002)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDgwc3BHMVJOeEFHTjZPV2k3dWtaL05XZTBtRkl4VWcyTEpkZFJpTHp4SVJy?=
 =?utf-8?B?SXpPQUYxdFFXbFhuam51aXVkZnozcVZpbngyWW5ubWFDd2N4NmhLZWlyakZW?=
 =?utf-8?B?R3JGcC9mYkd1TUw2RitGbDdBdUh0c3h6aHNvbXdRZjc5S1h4YmNlT2FocHJT?=
 =?utf-8?B?M0J0eW5ScEtBaDVHd2dZS3JUeG9BVncxSlBncTljRTd6TkFpU0FZUlhqSnpY?=
 =?utf-8?B?Z0lQOXJxNGwvZWF1dUZhWHpIMFczTGRYQjhOQWpFVU5LRTM4Zmd4NWowTVFu?=
 =?utf-8?B?OS9HMzhJODJDK0dQNTlBUkFxYXNkMkRkYS9la0pZYk9SYW5pVVhUMFRTOUgx?=
 =?utf-8?B?LzdSTnY1Wm5obWIyVkRVMUFraW0vbXRVUW91SGlUdXJoTWNFeTZVb3BnT1J5?=
 =?utf-8?B?T1pDWDh6NDNlakN0WG4waTBzdEdPM0VsMXdNVGwxKzg2cmlicnZCbUZwZGxJ?=
 =?utf-8?B?OEI2NVhMQSt0cE9BVndWQ21MV2VpQnlyZVR5VFNhWVJzalBwM1d0U29oRlQz?=
 =?utf-8?B?ckphcEltWGRMY1dSVHlJU04wMXZXS2NDN3U4SXJDSVU1WU1TMTlYeEQ4SXRW?=
 =?utf-8?B?YkU1T2lrZEZqalNFQVBqdzJva2ZDSUZMU096MGQvWHVzRC91MklqVXhMbjdQ?=
 =?utf-8?B?RE15OEpYQXdOZWNlNzJ4UTRVL0FOWFU3OUJDMDFwTHdpK0NuQXB0VzZWTTVr?=
 =?utf-8?B?UjRsNlBhbklPd0xYbk9iUnlFWE5rUkl0RitiTVdRaG50d2FlWXVyZEovQ1c3?=
 =?utf-8?B?NDZCbEFlMTZvcEp6am13U1RhR1hhcy83d2NrMkV4bHNlZkFuVWI3djBWRkRM?=
 =?utf-8?B?L0RmYkRmd01yYkxxKy80YVhxZStzeVlEUUhMM2RRdjQzWTdlYlZxem5EWEZH?=
 =?utf-8?B?bklyR3RHZzdobHBablN5STh6bVpZRE45WThYVDh5MjR6cjN2bGpUNW0rbzQ4?=
 =?utf-8?B?bU01VEU3cmxHZmp1M0JPeUVWdkFLY1Z0eXhPU0VXOERJTTdYbW55M1RZcDZB?=
 =?utf-8?B?QVIyakowcFJoK3k2ekRwNTJlMVdjNkIxaVNySzJpMmtSOHpsYU5ZdFNyL2VS?=
 =?utf-8?B?WjBJa1QwNDcvMnBPRmd5ZnQ0eDM4YTUvSEd2Y3FhVVZraFNBYUNiQnRlOGR0?=
 =?utf-8?B?clFkdXdBS09TSW5FdlpMbFJYVDhpTTdtanZGL2pEb1A0RzIvdlZucEdDOGYr?=
 =?utf-8?B?c2owMWszbnFWdmpva3lvd255aHQyWlpkZDVSQ0hiTkFBSXBnUVdtRjA2MEZl?=
 =?utf-8?B?T2ZJbEdDVDR0WlVMaHlpZlFLdUpFdGd6aVU1S1MzQjhYcklEKzVuREZ6Wmpq?=
 =?utf-8?B?OGpEL01tS2M5RllKOU9rRGhVK1lyNzFuc08rQ2hYKzNXYVJKRDBGeDdmVmJq?=
 =?utf-8?B?SEw0OEVNRktGN25XWnlvNERNMzFaU0I5cXh5SWZsdENuckVtdGZYbThURjlD?=
 =?utf-8?B?b0xOb2RpRkpiWnViWWFrNVNlNXZTbmp3WkNITWJDNkVtUzM5K1FiQXcwVHhW?=
 =?utf-8?B?eE5kdWxFcTBjNWcyMW4wOUdZNzZJcm1FVVR1ek1zQ3N0UmEvVVNCazFjU2xu?=
 =?utf-8?B?NldBRUlNT21pbmpBNi9HeU1RYmI5dEpYTnF0d1JvZk83a0s4cVhIdHVPV29p?=
 =?utf-8?B?ZW9aVGgrTXkyWXdtYXVYQUoycVlCSlZHVUwyT3Roc1d5RHNVbVdWNloyRGtn?=
 =?utf-8?B?anM4S3E2QVRBQzJoSVh3a3ZyYWlFSzFGS0pINjllbEdyVDUyYUpJUGxpTmtu?=
 =?utf-8?B?L0I0Y1pkWkdBRjBpT1J4eW9XSWErY2gzSmpLd0RDcmtOZnF1WmhXSTNkNnd2?=
 =?utf-8?B?bk56aGR2eFA1NjB3SnJ4bGxkd3BZSEJRa1craWVqL3JTYXAxOU5YSmd5anhW?=
 =?utf-8?B?T3o2ZjI0YW9tNUErZldNMGVrRjhCY0REQW1paDdqOVBlaEJ1d01VeXV3MDU3?=
 =?utf-8?B?QzYxTEdtVzhCci9yallqM3NYRU9waWNIVWwvejhvZngweGxZR3RVVjMyVHNn?=
 =?utf-8?B?eTcwN05HenhIV2RZb0dGdVJiRU9obXNYaXZBVHo4VTlkVVdVYjBOc1VZWTVT?=
 =?utf-8?B?TVJMTW03YllEeHF5ZVNQeXdZWm9wci9RVWhxaEYzb2RhQTk0K0k3UFVzR2Nv?=
 =?utf-8?Q?SNm4/Rtl/qhw12JERfkL9h4Va?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab7e02-ddf1-4bdc-8261-08dbb5353455
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:13:52.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIkoDtO9e+JN4hw2stGd9DFkmGbC4jGzpzpH5LBNjlTr6t90TYzJfF4XDDCbOSmNZjsdYDzxwVqOhSldJLjuiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655

On 14.09.2023 16:49, Andrew Cooper wrote:
> On 14/09/2023 3:40 pm, Jan Beulich wrote:
>> On 13.09.2023 01:21, Andrew Cooper wrote:
>>> We long ago fixed the emulator to not inject exceptions behind our back.
>>> Therefore, assert that that a PV event (including interrupts, because that
>>> would be buggy too) isn't pending, rather than skipping the #DB injection if
>>> one is.
>>>
>>> On the other hand, the io_emul() stubs which use X86EMUL_DONE rather than
>>> X86EMUL_OKAY may have pending breakpoints to inject after the IO access is
>>> complete, not to mention a pending singlestep.
>> If you look at the uses of X86EMUL_DONE you'll see that this error code is
>> not intended to ever come back from the emulator. It's solely used to
>> communicate between hooks and the core emulator. Therefore I think this
>> part of the description and the added case label are wrong here. With them
>> dropped again ...
> 
> Oh.  I see that now you've pointed it out, but it's far from clear.
> 
> I'd suggest that we extend the the debug wrapper for x86_emulate() with
> an assertion to this effect.  It also has a knock-on effect in later
> patches.
> 
> With the DONE part dropped, this probably wants merging into patch 4. 
> Thoughts?

Not sure. Even then the patch here looks to still make sense on its own.
I don't mind the folding, I guess, but for the moment the two R-b are
only on the individual patches.

Jan

