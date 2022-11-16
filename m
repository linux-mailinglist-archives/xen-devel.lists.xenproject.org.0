Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F262B53B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444227.699205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDoX-0005PE-SF; Wed, 16 Nov 2022 08:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444227.699205; Wed, 16 Nov 2022 08:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDoX-0005MP-P1; Wed, 16 Nov 2022 08:30:33 +0000
Received: by outflank-mailman (input) for mailman id 444227;
 Wed, 16 Nov 2022 08:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDoW-0005MH-PJ
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:30:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee755946-6588-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:30:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8285.eurprd04.prod.outlook.com (2603:10a6:102:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 16 Nov
 2022 08:30:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:30:28 +0000
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
X-Inumbo-ID: ee755946-6588-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxXVvesUrhHZptnZprLajL28HGnNUSIHVODaPS9ofiHLEzYb4VPcZpY8tXvihxnc6LOwXntTmumc6JJgDtJy3cpeHXTH8Ha9FJNADS7q0x0wON0R9erL2JVjdDbwX9ILZOsSZkCxpeMYyI+DNPzb33VXiuvk6fh1pPPDeyRFyzqvgJ46CxnYYh9jKvdth2RUzhhywlY3F7WxIRaVfmSDdZtwbmEqNKHjoCjQJBOOVOYW4Ba/EgcGXW5exgc9JOw+nNRgXyLCI4g5o454PDr38kMEgd87qNyKEgqDS5C1LIB4tdiLjFWf7acRLoXzWqKP0A+hqmBSy3kW45z3ZK9Ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axfFSnyJbvDY2gZir/ghgWEVvgbEK5iHpnHlwOsHUo8=;
 b=fhuemvKauGQTCnEkCQ5kF6NKHrBRE8EabVppS+K2t9eGyLB6CH/ef1sN8nSzyJOaIt9WMKQOzWoOQoyNdiHnWC4hWgQCOSGAc+FqGYInEB1nGKIuBmqJb0VDeQ8/CR6JbwtKXqDONkX1lUJIFz1hH5jfZBxz9c+taWv0rJCVX+XtWcS6WacghSN5l0CvMmy/FSHegQmXoFIaSYrTqHqfUn+RszP8FsAA9XTbVCptlJXpE3wxKvx30tpHjKA8boLnRgHYmPTgizRa+cLZSbf1AbSDJRtpdvw84Dj6xhuaztU2n95TtJLaBx/4U74YjyEr2gwQn5iy+9nZ2FVI7hQ4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axfFSnyJbvDY2gZir/ghgWEVvgbEK5iHpnHlwOsHUo8=;
 b=sISmMYVFgkfa1DT/Bk+8oxGfNQmcY0unh+0NYLkT19PkdbZ3XLCOp1dNMMCd0TSRHa8atKQwxzIxdAZcFZ4xsvw/os/CIGF9rjjkP2EoxvKHI9S6mRPIMcVHRWTnmESilOIIrtVR0Q0/27UtsIC1eL+B+DNU57tfZ+BpuM+5/0T5L+UicCe4SPLnSDyaJwHQRvPZ2krt5WnFOB7uexyv1fEdgx4jCkBGlwK4jM5LMRLCtJL9HHoSOa/7LLCh+dHp4Fn+CVAeD1JjFBJNnZahh2lGSCau7pzN/2mYuQGZkNOjn2DbdDy4eCcdVok16QBQEUBq5CM6bggv7x4L5yqGnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddb3dd9b-8697-1fe8-2dcc-2b5b859d18f6@suse.com>
Date: Wed, 16 Nov 2022 09:30:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Xen Security Team <security@xen.org>, Roger Pau Monne
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
 <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: a717398c-f985-4c05-b8e0-08dac7acd164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yapd4lU6IRVbgK41rUqYa3XYDv/PHZUi2OacKTgRxEDVcUurBVnAs3JboF6tLPyzEGkrpMLkz9NiDdSgc0zPxtm5+3STapy1yxglh6SscoEwpouaS+qo0PI8cvKcSjjHBigFsnchUseg+6BiheLCEgTV6nIuUccXr+OTl0MXjgbV3XfLzEnJpkzkDWondpEVgtbryV9W0aqioop/RtxXkd4+UOF9ie0QgqUFW2VhgdnTBMzJ4mphNqVIAaGk2L5IBTaNpQnAY5MfqM/wPgGtN/BpMSnL0swM3D6+s+BOs86vpzkI86HJJJFhvZb5Iben7zFlQi3k14M1kf6eKMJxAmqKTJvVgxq+riQY0DKqCCNiuzdxN8lO2L+d9dIW0ocOnPMG1P7hhexJJCFuL6ZyIKB3nEYAF40UVo2b4FGYaj06ugHyWMUoXyw4bGJFOzkIOIFaaPJKxSl3+pOvD7O1vymgPk1WhPT2AtM32YABbMYaIO5Bd48CzAk1UWRwkuLiuIOAbLPyr0YW4cnn9ZetK9PV6OQj+s5XE4TRAbRXH/HtWNYm378lzcx2ehG68Cx8ivZcmTkXSZywNneOIpXSF3wVn4HFVvrtzYDVfRWuOI0Q+U7hIJeK+c4jv6e5j+E1u6RnY6Bk5NWZ19zDghS09fl74Ur/i5MsjtGq0OJOj/SIhyqH9Vh+rYewf7WxB5rRn9WMyXuG/hWBQ02LXT4WnwrEXzCBZQUtMjtgR0dqXySHi8gseWWjT/weGSZT+TexQnK9KCDEkX8RjuBcpGEJq65E2OQ1Ln4BbwDPgZJqzmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(2906002)(6486002)(66899015)(31686004)(8936002)(7416002)(36756003)(5660300002)(86362001)(8676002)(4326008)(66556008)(66946007)(66476007)(38100700002)(316002)(6916009)(54906003)(31696002)(478600001)(83380400001)(2616005)(41300700001)(186003)(6512007)(53546011)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlhxT1g2SklWamNCTUVWeDN1ZUFTSlpiWFdQVHIxR2hFQ0FnM0FhbVBHclg0?=
 =?utf-8?B?Rit6NG5qNk9UWkszeVlxaFlWZ1RNRlpFSXd4WDViNmNOczZZdXdCd0dYWUdX?=
 =?utf-8?B?RHB5UkEyTHpYWEdNTkQwemtrcndyaWNEQkVrZFA3dDZuYVViQnpOUmtFeUtB?=
 =?utf-8?B?QXd4TXc5U3pITzVXdDhqWEI5SFZmKzc4Y0ZCSWIwb0ZrWDFjRFdlUzJ1Ynpu?=
 =?utf-8?B?U2EvNkMrdlRmekFsYjg5M2ptM2c1Z0xoUzVYUFY4ZXJ0M1RBcVovb0hjTUF4?=
 =?utf-8?B?d0Z5M1hKZTNxU2VGUHltQnk2SWc0cjVGUkhQYmx0VHJDenc4UzNGZVVPVzZE?=
 =?utf-8?B?Q0tXbkFMTWlFR1VWd1hOSVhEQkVpM1VXcG5BVUFqT0h2YXJadHQ1N3ZuNFpm?=
 =?utf-8?B?MFZ5RnVZSUxNUVpQTnlSWllQNlIzR0lCbDBrNTJGUlB3N0hEOVQ2eEhpdE1U?=
 =?utf-8?B?N1A0NlpyY0lmL3Y2QXRDRElXVnI1bSs2NGxyQ3lUL3BiRUVWaWlGbWFaRU4z?=
 =?utf-8?B?bVk2cjN3cjlWSlVWdkNkblBwVlBrY2V0NE0wajhLcllNTmlHWDBIS1ZqK2c1?=
 =?utf-8?B?SmtFRU9ZaHRJdEcwNnkwekQ2TkJXVGZ3Rjl4UTZsYTJNWWY3cS8zcDJXYjc1?=
 =?utf-8?B?UFJ6OW9xcXFmRnQvZWMrMzZpcENNejBOOEIzWjdFdDJxbWxIOEFvQnpsVXVE?=
 =?utf-8?B?WnJkQmhLaWh0bFFocG5NTXNDNXg2UnV0TXNrcHJrWHZ1WWNibktraVp5ZEhp?=
 =?utf-8?B?QzRWSjBCVnl2dDJNNGNXOWp2TEFLRC9DTm8rdjZXNDlML25oY2hOcWJaSW5Q?=
 =?utf-8?B?UkZqNnV4ZUllR2NRa1FDYVNYOFZFZnY3TlJJcnhXUGZncDlJbDdwVFJZdXZZ?=
 =?utf-8?B?SkRkblcwek9ISW1CZVVqMlVzTDR5d21hY3VaN2lBMGZ5dGhaLzRSUU52NDJ5?=
 =?utf-8?B?c2FQUGRac2JDeXhNYWU5ZnZaODZIbTdtY0ZYV2ZKQ2RzRTFXSVljblZiRnh2?=
 =?utf-8?B?UFk5Y240SmlyS01qNnpvd01uT0xQSHJrL2pNMmNHZEVaSDV0eHNQRUg5aUxk?=
 =?utf-8?B?U25EZ0x0OWY4eE5OdmdETGVPbllHVXBOU1EvZ2FWNWhWMmFxRzh6cW03emVR?=
 =?utf-8?B?Y1BvOXJxS1hxZHByVFZodE93NnBzZWM4UzN2WThJd1hMdXdpNGxtdDFJZG0z?=
 =?utf-8?B?dmZ0eGx2UFRjYnVVcCtVVnVCNHpIYmRjbDAxVVdKand2YmRlOTVibXpQdkVD?=
 =?utf-8?B?M2YzWnVzTGM1Y0NJYkhFS01zdStUejFxNS9seWNnTHBPblQxTTR1MWNyNTVL?=
 =?utf-8?B?SkVsTW9sR1BsbjdlYW54d0FWNnlweTZBY1ZJcUNuVXdzQWJweDdXYVZQY0Zn?=
 =?utf-8?B?RlFONjlpS01pSkNqQTAwb2FSVS9QblRqa01DNHlSQm1BQU0vdkZsc0J4ZTlI?=
 =?utf-8?B?Y05vUUpoVHJZLzZRaXQwUGFqQTNOcCtONnduenBuSTd5MGU5RDJrZ05CZ2tE?=
 =?utf-8?B?MHgzR29HbWVJTVhPTGpDc3R4b3VESng4UG9ydG1HY0NoVWZBd1NOYzc3K2ll?=
 =?utf-8?B?UFpmNVZkU0xPc3JKYStlZkltdXVvMUVxU0ZPWVNBMS9mUkk3bjEyd1VMUi8w?=
 =?utf-8?B?N2lTSW1JSEVWVEQ4NldkVEF0S2tYSERPNWt2aU1rWWdnK1dEOGNTYWpuOXdQ?=
 =?utf-8?B?QnpuSFR2UXNEZmRwZXdUdTZMcVhKT0pNY2NCMVhnV3UyYnFGbDVHMU1BSGdR?=
 =?utf-8?B?aHZMUEVsUnJXTE0wREs2SVRSODN4dk5ZOHdVMC9ZeTVDZGVYeEVoUmplcGNH?=
 =?utf-8?B?dmdWeTFpdENDaktsbU94dUkraTRUdi9yUml4dlpTMEQ0NytpT0owS2lpKy9w?=
 =?utf-8?B?NzJtbVAxWXJkaFFyR0x3cTdDeUpscER5RGdPMXdsSXkxazFkc1k5Mmp1c0ZN?=
 =?utf-8?B?ZHVoeStJWFlqaDB3T1RBanNUUk92VkYzWWwzV3orRWVLSUlBbjNCT2g3cUd0?=
 =?utf-8?B?dWUrVDQ4VnZEbGJ2c1pDQytaQ1ZlTjF6cnliVS95OGw1Mk9xNTVxZnNYODFJ?=
 =?utf-8?B?NHdpTitkaDF2Njl3OUdMVENxOFdCbTVXaDdoQlY3UEFEeW4zUHZFOTAzZFEr?=
 =?utf-8?Q?Ngkpu4Q71mdJTdR238Y8w/9sW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a717398c-f985-4c05-b8e0-08dac7acd164
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:30:28.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BXNhuJeG3GmEweJZXtXWsfiTzg2r6mmnHt7p0X0JTuJa1q0wuGiUmzH6tG47j17U4n7vBEL6I8LkYCoZdVgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8285

On 16.11.2022 03:00, Stefano Stabellini wrote:
> On Wed, 16 Nov 2022, Andrew Cooper wrote:
>> On 16/11/2022 01:37, Stefano Stabellini wrote:
>>> On Wed, 26 Oct 2022, Andrew Cooper wrote:
>>>> This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
>>>> of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
>>>>
>>>> First of all, with ARM borrowing x86's implementation, the logic to set the
>>>> pool size should have been common, not duplicated.  Introduce
>>>> libxl__domain_set_p2m_pool_size() as a shared implementation, and use it from
>>>> the ARM and x86 paths.  It is left as an exercise to the reader to judge how
>>>> libxl/xl can reasonably function without the ability to query the pool size...
>>>>
>>>> Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
>>>> replaced with a working and unit tested interface.
>>>>
>>>> This is part of XSA-409 / CVE-2022-33747.
>>> Genuine question: I can see this patch removes the implementation of
>>> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION on ARM. It also switches libxl (both
>>> ARM and x86) to the new hypercall.
>>>
>>> Why keep the old hypercall (XEN_DOMCTL_shadow_op and
>>> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION) implementation on x86 (not on ARM)?
>>>
>>> Is that because it was only recently implemented? And not actually
>>> present in any past Xen release?
>>>
>>> If so, please add a note about this in the commit message. Also, if that
>>> is the case, I think this patch series should go in 4.17. If it is too
>>> late to get it in before the release, then we should backport it to 4.17
>>> as soon as possible. That's because ideally we want to keep the
>>> hypercall interface changes down to a minimum.
>>
>> On ARM, the hypercall has existed for a little over 4 weeks, and isn't
>> in any released version of Xen (yet).
>>
>> On x86, the hypercall has existed for more than a decade, and has known
>> out-of-tree users.  It needs to be deprecated properly, which in this
>> case means "phased out in the 4.18 cycle once known callers have been
>> adapted to the new hypercall".
> 
> Understoon. Then I am in favor of getting all 4 patches in 4.17, either
> before the release or via backports.

Removing something from the domctl interface generally requires bumping
the interface version, so some extra care may need applying if such an
interface change was to be backported to any stable branch.

Jan

