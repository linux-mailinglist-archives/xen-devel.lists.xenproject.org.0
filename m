Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF6710BE3
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539553.840550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29uV-0006B9-TU; Thu, 25 May 2023 12:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539553.840550; Thu, 25 May 2023 12:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29uV-00068X-Px; Thu, 25 May 2023 12:17:39 +0000
Received: by outflank-mailman (input) for mailman id 539553;
 Thu, 25 May 2023 12:17:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q29uT-00068F-Ld
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:17:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe16::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2262098b-faf6-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 14:17:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9066.eurprd04.prod.outlook.com (2603:10a6:10:2f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:17:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:17:34 +0000
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
X-Inumbo-ID: 2262098b-faf6-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVtPJSTIwRlp0xDBAsYirNCP7y+6RE7/09YoTjhFSFWBMjr0sNPANrtLyABuv6AJQxanRigTv18PesiVRGNVL9AQ/Bz7JuqYCwqV7S11ELRS4nliV0zhlRsb+XNMKRqqfOf5Ga9WEfBV51Kme/s9yeHv5tNxsmpDAHk7AbDHhLfMziki9eNZV4q+4KVj8R9X4UdcLpqQqlVGGxifMdPSWpuu0XlklH4Gn3SPNNKRx6fMG6ras7pcsHpizeHfWhtnPeDzfH5VeBB7xWhtTchsvf8btP6oBR2urB/JEzbq8PP2VfMKSusPwXpm57ZBJR4boiYOwXoPM/Sb/C7JTST4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7dVG7pTtKyNxCjXZNiKqOIYzPJo4XJd6QYa5cnCVZY=;
 b=d9km/pn11mzu/YnZodFF5ykQABYduUBIMxaLIan5UPoir18sAc2T4j+MBV+bTKh4/wNAWTxeawITgrDaSYLAmDJ2KVt2it5Zo2PFGDCPZD1xsPRyROaQBpsjdK9vzf+w2djJw9xnqYeiYKNWCxEbiDR1OO1EnJx697n6jK/iSwzNCh7zlBeJ/U4wfL/Id+U65qprrX8zVsQ50+uIwxDbfvChvk1vUx2QaGCI2VMxQrapCT4jr/deFQPEUXlaTvLO/cZyEo+7q31rJ+spWanaBAkOHqe7u8BtLTx9gRLQtF+xkqV1U2qWfkCnZKvl8T1HSjd21rcjdhQjhaKGNbg9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7dVG7pTtKyNxCjXZNiKqOIYzPJo4XJd6QYa5cnCVZY=;
 b=uOrmCMgLJth9Qfu0jmP2ASIinJ29TlDF0axyfTJT5jhh99Sg/Hn8v/ZBECIi25NQbBgxmxjP6amKvpZ/cuHcnmjLOV6Y6Bw9EQsXHnqs9nvTwrYU9BCJr9ZckWoK6vYBnduxxcONft5p42dDyGt8yCIQImhxyRbhrqH0tTzbs1nECBSXu3VD1joG4CZYHIobPmBYbrZFJDu/QYS5Ae+C86S5OM3nCiHEw3V9UfhS7x1rYk2Pmhp637CfqiK3hC9DLL/3ebwv3ZljypKHP9LMEs4molu9a7xyqLH9k7UKObeba5L3SNumttwM+ujOetOM6MjYGP3359RXAfYc958/jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7586363-5762-5154-efd2-543e784bc3b0@suse.com>
Date: Thu, 25 May 2023 14:17:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-11-anthony.perard@citrix.com>
 <17CC7699-2B73-499B-946B-E423F7C9620E@arm.com>
 <BA29A878-86E4-4B5F-A344-C920C3D82076@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BA29A878-86E4-4B5F-A344-C920C3D82076@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 6344e0d0-8059-445a-80d1-08db5d1a0529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	am2Z5BNt/oAxX3q6KrZUaN6oVibgUYznLexV9b9SYQ9KEx2EaVoHYM6CHkIbjv5fHOq4MILAaN8z1+LJHgNPNL2gNXKG8X8hZKphabP9xs/AS6OgnifkCqoGksFKYCGEWCCiq4zj+svLzOlJF86eT8YdklZTUse4o3uNMBBhNPjLiJIj9zhTM+kq9sRZ6iwF4tdkvQuLCXMCb5rN4/qJEw9rUo3ZaC9aAjQnDT+DYhgH8KuEMZRxlUVnXWw/enkXNhR/VC2eWoI0YXYpoi4FE7ilRaWCcHkN4uCCtt6GwwSGEAuRUnVi6H4rfEjQ2IOCdggDCNoCOgq8mDe6jztVY5Mpsrywla0v+bTU2pSDUrsqxhzWKhzFy1mVkK8/kmKy5SHSeXZORDH4ieck1gx/vwOAmN3D/W1dHqlXBv3QvwvX7FIPLZ/BIWdDaxNGrEeRDfXoCZnJgDg/cmyybGvOwk9mFQNNB/8m2Dc6Y6DFvSWy8urReex01AKMUFL/qCLsSCngM0vKiE3YhEpDDKBwasG6Ts2yr0z8fg3kZTu4u7dU5oJU3nuu0boCIKGjzQkZ4d1bW1br5v4+5r2NFyLC7s102Gu5XJi3ntEIm24oNuCLsGPskzAkw+0C4Ek2dIOQysNwHAFpQyNnL39GxwYRKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(6916009)(66946007)(66556008)(66476007)(4326008)(8936002)(8676002)(36756003)(5660300002)(316002)(31686004)(54906003)(478600001)(41300700001)(6486002)(6666004)(38100700002)(186003)(53546011)(6512007)(2906002)(83380400001)(26005)(31696002)(2616005)(6506007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckJISHAxeWdUdVRwdFJUcFdKU1lLdTJQbHJLWkVDaGluazBpaGFwZTBLMDF2?=
 =?utf-8?B?ZGw4SmhnQzFlSXZ0RW05S2JzMkNtT3VNMVNQVUd3Wi9DWGhIbVo1M3duUDho?=
 =?utf-8?B?eTZzSHZWMlgvdHM2eDRUVXR2aytXNWh1dmJJVnhidGVWOEZBRnlyQ0RscTQx?=
 =?utf-8?B?bzBCdjlFdlF0UlJZU0d4MEJ2dG1RdkZrRkRqNWxBTkpKMFlRbHpzRDZIMjVq?=
 =?utf-8?B?WDJ4NHZnQ29XclNOaFVZdTh2dGwxSWMwQWxtelo0T0czTDZMV1Mwa1lJNkVk?=
 =?utf-8?B?UHlKQ0YyZXhjWmUvem40NHhxTUF3ejBSWDVseUNFNTNZNGVFSkh4S3pSK29m?=
 =?utf-8?B?MXZDdFdLRU9NWllwaTNmU09TL3NRRVVJMUd3Vm5Bak5Td0Y1VDRoY1FDYjMz?=
 =?utf-8?B?S1gyZUg3ZUNydm45VEhPcjlrOHZYYlBXakZvU09pZEh2UXJvaEZHdnU1ZEFW?=
 =?utf-8?B?R2VJR29YMjdwMXArVVhrbHhDMU9WcGprS2Ywb04wM3FIdzVrU2NXTlk0WVhB?=
 =?utf-8?B?MEFoNTV0U09DV24yWDY0YXAvZVFkdTVzRXdtUG5PeGU3NnFhc1FqcllCTzNy?=
 =?utf-8?B?Lzk3Uk5odVJHOU1DZ2JBUTdaR2tDZ2swcjhiU1U5ZHluVDFML2oxbmdzdjEw?=
 =?utf-8?B?WGlFQ1FvMnB3Qkl1SlZoRGZMa0VBL04yVFRhS3Y0aVgwelpuMDJJVEUzU1U4?=
 =?utf-8?B?cVlGc1JPQk52SktXcHBma1JqU0ZnMnpHTy8vZjJQZHA4Q1JOellId2dKb2Qw?=
 =?utf-8?B?cVk3QmRpZFhRbnJvcjBQN2Z0VWZiMzU0dTdHTmQxZkdmSWhjdGt0ZFBNSkRO?=
 =?utf-8?B?WG9jVjFmMjlTSnFXa3FSUEFwNTFtNCtzeVBTdVE4RU5UbWl1ekZiQ094T2VL?=
 =?utf-8?B?bFZzbXZVeURHWkNqV1ZyVlljK0NNWGhoQnRCVG1BZnUxRUp5alpKbkNtczNw?=
 =?utf-8?B?VzZLZDdHaGpOY3JxNVV3UjAzUWZtMFBCL28vdUc1aXhwMXhodjc5bXZka3hT?=
 =?utf-8?B?dEVlVnZ3a0hjejdyRUdkeEhHd2Zpd3dLYlNSYXUxTFhJRStpTU16MDVyY2Zs?=
 =?utf-8?B?ZldtL1N6MFdlZCtsSkNBdExWcG9TTUNzNVBBMktaOFNoYzQxdEVBRzZMb2pI?=
 =?utf-8?B?bElHS21VTzlwUkVmM3RoZDlwZEZqUndSY296bXZlZm5YRDMrNEU4RUdEem5j?=
 =?utf-8?B?SjFzRTNJYUNVUGFhYldGVDgzNjk4MERaSjJXQURSckRUaFZkT0E4Y25aYTUw?=
 =?utf-8?B?aVpHMWZvQkthQlFVNnlvMkNoOXAraDU5RWtzcXV1NjRkVmRFa2dDNUlUUkdF?=
 =?utf-8?B?ZWd3S1BoVlVIRFcyUTB0TTdUUnp3VTJVWE5qYlc1SWhWOWVwamF5WkhmVFFJ?=
 =?utf-8?B?ODkwS3QrRTh6QkZGaHpHUWVCWU12NG9kUkRxOElSVzl2QUtXcmNFdm92Smxk?=
 =?utf-8?B?aDIwd25iT1ByMDlKSmF1ZVMrdGRKZERlblNOWFlWMDQ0M1QvekxBR3VJT01H?=
 =?utf-8?B?ZCtSaHJ1c1BhL0M2UlRHZXhnanVIYzUwNnAvNHN0emJLRjFUZWdRU0JibHh1?=
 =?utf-8?B?MGMwcWdIejRnRENKU1VBUmhKbFZiTWFaRGx4WmkyWmdVaS91eDVDVW1wY0sx?=
 =?utf-8?B?RFVWdVdWa2NEZzYxZlBwSHc1aVorUWFycmo5VVBtaU4xQklLZWJDd3B3dXhx?=
 =?utf-8?B?dVl2S2ZqTHJ2S1Zkcm9ObzlXbWlGSHRSWGdhQXRqcTJ2eVlsSHZNNks3ZlU0?=
 =?utf-8?B?Z3FvZjE5cFdWRXZxb1c3a0ovSGZscFB0Wm9mUnU1VENoSmFXdHp2OTdKZjBX?=
 =?utf-8?B?Tkw5MzBuVUQxUnUzQkx1UFh2am8xZ0UxR1piUi93SHVRVExIYS9DZ242MCsv?=
 =?utf-8?B?My9teWpLdXBwajc0cTR0eVprYWRBd3drclQ1SDh3cHgrVEtRM3JCbHZycnMr?=
 =?utf-8?B?c2xUaWx1S0hXNXBoTnRHWkIyQWdlUFQvYjZydzhZekNHaGZobGx4cE8rSTBk?=
 =?utf-8?B?WGtNV05aNndnb0Z1TVhWUHE3NWgydFNMN2l0VGUvVHhOUmx6R2REa2VYZm9t?=
 =?utf-8?B?a3RLVWJBbDNSRHRzc3c2S3FJbVZjS0pzSWVTYUU1TGJVZDhaRlozVWpQZTFi?=
 =?utf-8?Q?YbpGix1FDiJ8oFkl+SfShUeqg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6344e0d0-8059-445a-80d1-08db5d1a0529
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:17:34.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+7CTNb61B9ayR9vx0+nWp+y/YX/86cEzSzxuVWYPljFwH67g91ddeuOKQ15UkfQU+BzJRWOUBVdd3zmQu1lUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9066

On 24.05.2023 10:47, Luca Fancellu wrote:
> 
> 
>> On 24 May 2023, at 09:29, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>>
>>
>>> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrote:
>>>
>>> We don't want the AFLAGS from the environment, they are usually meant
>>> to build user space application and not for the hypervisor.
>>>
>>> Config.mk doesn't provied any $(AFLAGS) so we can start a fresh
> 
> NIT: there is a typo s/provied/provide/

And preferably with that adjustment ...

>>> $(XEN_AFLAGS).
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> ---
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

There is some interaction with the asm-offsets change, but I think the
two patches are still functionally and contextually independent (and
hence the one here could go in ahead of the other one earlier in the
series, with said adjustment made while committing). Please confirm.

Jan

