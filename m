Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16E737B9C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 09:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552475.862581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBruq-0003pQ-Ro; Wed, 21 Jun 2023 07:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552475.862581; Wed, 21 Jun 2023 07:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBruq-0003m5-Ok; Wed, 21 Jun 2023 07:06:08 +0000
Received: by outflank-mailman (input) for mailman id 552475;
 Wed, 21 Jun 2023 07:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBrup-0003lx-Iv
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:06:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1746a2b9-1002-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 09:06:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 07:06:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:06:04 +0000
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
X-Inumbo-ID: 1746a2b9-1002-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jny5iMPQYa3KuIR6b9qgtcod+FftPR3ts89urDdsPSlkXrA7Oxy02yFf/Jkk8soKOsLuJJtHTqsG0kKvypCqYQUAOcadim65HISuXkeCHGGzN0bjihK3Enw+IPE9cgUvERJrm4AlimMvECV614lOeHuvcvV6DJQjrQyvKzqwHTeBVYnm6+wut9E09orL88u7nBN6llnTI7CXbpKNuCqXUm9i85Csgu/oSloR+Jiwqyb4Iq8hesLKSf759Y7nMS8xPiARhAnPsqfJ0jm2WLMkJTF48lBgxV9JA2WxofRtY7U0BsDYICNXa25PM/yUUwpkc925TCrYCLnj3UC8p9Tbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IqZgYnm2a7/wwnhZzWE/gplCz+zZ7qf+x+faUfejNQ=;
 b=jO5p96pL8+OkRqjwpC1EL9fE35PV3j05lvUUBxM6O5i9fiO1ab/mRVIXHjaU/xJFcxjTuNcA9A601VYy8fbyINLEFdjDt5mIS4gOfuMhjcIuw2NzlZpd1vG29vxJq/nl6ZcX8TgU4raKaXhADy2qQQ9lm08K3WxnPjjamhDapIQAdkSZ6tdiabs0pWE4uBRZE1ecMYwoL8MStacqYJaq/2zakPUPksBInitlgdabqk603bUvW93udBzzlwDVjrRT5nafGuKxFhoZ6vOhJVrySHuaEIEkHeKuMgQlugcSypkP2Pq+a5mifubfUXJjkEnehdn3JAmvSwvYUeLXJXXZXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IqZgYnm2a7/wwnhZzWE/gplCz+zZ7qf+x+faUfejNQ=;
 b=UF/kvQjE5vWkZOU2kbozepiPZLxHzw1V6dZMsGQWt7F8gAx77PxvmC28TblIQryNt3UhIKmxowvbDK9R7zbAztmBurEo/RKX0i38j0HZeajBT1JXUR0giGz09NdS+rifDVnpTcsP81T3tX6rYMZ2ZZFjGSto2pdUbvg6s+28D7M56x5ccEgSCQZVwLr0B2SH68cVwps3BC07aR8c36ErC78RSp2cR/qjMvN2QIc+sdgesuamHWGX6gzbkm6TYP5i03hveJGGqwObEc8nf6IQg1P3W6GFReCLZ1o25n2CdrNlvBTalqT6Cpxgj6pXM0l4gucvBVXnvbgWxIKtuzk0rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23a79e33-ac20-6b76-335f-102479a4db91@suse.com>
Date: Wed, 21 Jun 2023 09:06:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 06/13] xen/efi: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
 <6d6708de-7afb-963c-65ae-3656fc755ad6@suse.com>
 <alpine.DEB.2.22.394.2306201354010.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306201354010.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 76986f20-c4ac-4ae1-203f-08db7225fa7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fwu64zJAOLy6jqDYd7vxKfgApAfZOjSGBfkR18PTx68biJeUOCCG8phhFo43PY8U++P8ISUYyTNEe4e6dD+b76dE2FiPfPM4VvJ5uENyzIG6dW1N+4CDQDmynxmiBK/JYNN8/++BXnM8dKtDLCa1zoEnyFoWV/py9vQFRhEY4W4Y2H/uuCAI+pnNQKqOQwfp5WzMRdbV744KY25CTld44v41i8mayvBXkpI18lwDkW7aGWQQwP5p9Wutl5cTBPrmWeycfYU5CVRSmjeA9+RGEWE1WwWQ3+y15pTydSxfylDgNZL1BsYoUJW4L5iEWA35q7iKoih3BUifNNHCdryDbiJIV8aqfEYhU4k+I+5Y93OkeHIcM5TjBTaiidXA4IupcMQntM6Vp1cU3k0vIbC8Ct8UZroeIozDQDOw3CnwGLCFVhUXAdGULqJDH0BLBih0UO6GcA0gTcyqv4tAEZR6r0GTg4VcKHwEaqpsNFmjAyqGrW62Fjygv2i9fnn39IReP0547LufFjBG3PlCJWLahU/NcxFlRQ2iibcwJ6IXpkjPiL/p6ps+FcSGIydlIG6YSfrjiXrU+X+QPWJEd1kKAyAlYzisNyUjmamc5jLoDECQx91ZeiPvgX7eNhLz8nqpkMm/Ro40yvyVB4PJiQWUbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(8936002)(41300700001)(8676002)(478600001)(38100700002)(53546011)(2616005)(6512007)(26005)(186003)(6506007)(6486002)(54906003)(31696002)(86362001)(316002)(36756003)(4326008)(66946007)(66556008)(66476007)(6916009)(7416002)(5660300002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTBuK2ZUYURranJjaVNwMVJRaWFpOVlPdzNmK1VIbEdrMVdHa1hvb1FJRy8w?=
 =?utf-8?B?U2VMYVl2Nkp4YWIydVhaRExQNzkxMFZ5WmxKazhKY3IyUmNtNUtoZnhKcmNh?=
 =?utf-8?B?bFlRYjVNaStKcmVlakdNTEVvYUczSXJ2dmQyVStWYkxTa1hPNG91TzYySndL?=
 =?utf-8?B?RS9va3Vra3RTNFlacUhONUpCN0IvalM5dkZyWXRXTUNIREhOWUoxNlJMUTB1?=
 =?utf-8?B?cXF6NDRLcVJNSUVQYzAzZlFTNXhvRHI5TGZJTUhJaXZLZ29VTEMwZlh5eG5D?=
 =?utf-8?B?ek1aWXRmM3FoQkVPRGdrMU1oWjBOZEJqQTVaYzN2SE12ZjBBWWlreFFwMFBX?=
 =?utf-8?B?V0lIU1B6U09SNE4zQmN5QUwyeWJCMWpyaXk1T0U5V3RHRVRhMSsrWFo1am01?=
 =?utf-8?B?aWFGcUJ1dnFqQVE3eURhby9SNXRFd3NZY0NhUi9ERTdKN1kvTjErdWlqd3RP?=
 =?utf-8?B?YnhreW9xZkl1VjlVYjhqd0RlWlQ1RDdvQmhFTGlZczZPZWtaVTZNc1ZPRDJi?=
 =?utf-8?B?RmNMNTRzTGtqdUtXK2JSNXYrMzJYMzY4M2FDd0JFQTNZSXdFUW9mSVhXamlI?=
 =?utf-8?B?bzVuNExRQm4vSnBUNWZMNlRrK2tKTjNLd0xkbWZUeFJ0S0dJWnZaQmRhNith?=
 =?utf-8?B?NFcwOExUZklocVg0TG5oZjBYZzc4SXBVZFpjN0VqelZyYmJhTXB6c3dWUnI0?=
 =?utf-8?B?VDUwOCtLM3ZGQzZubzRSemlKSGQ3NUpYb2ZQMk1KU0RUbDIxRGRhT3lmNTln?=
 =?utf-8?B?ckZSRnBMR0VJbG12NGZPRGlCcndlQ0FMbXpnVEJKRkpXd0xiNStwYnljdDVM?=
 =?utf-8?B?bEdsNXEyeEZSeHVKYUNObkx6eUtId2tMMXlBejlUbjRpczFBRFhQdDUxRWRM?=
 =?utf-8?B?V2pRMlgvUGZoS3JFTURkemNMRWIwKzM1U2dIWXcweUExS3NOOFY5ODRpRU12?=
 =?utf-8?B?SGdndEZEOTFoSlNjUy9YL0tOeUpCZ0pwbndXOFFzZDM0UktXZkxBalJFZG0v?=
 =?utf-8?B?ZTRRNFZhMGlKN0ZUeFFmSjh3WUFHYW14eFVRbGU2d0xERXRwaTMrampNbm5Z?=
 =?utf-8?B?VHVvcllvMlZiMVFvVjQwSGJ2VDVON2k1MFlhUkpYWGd3K3NCc2JBRE5HQ2hz?=
 =?utf-8?B?T0JYYW1KemZpd2FwSE1uVjkzZDlPelhBVkg4U0MzUmg1THBoTGtickh0U2hz?=
 =?utf-8?B?alFEdDgzU2hmMXdRbHBXSW1rR2UrbFkzRkZRaFc3QnJuL2tvZ0JXSmJoWGZV?=
 =?utf-8?B?ckhrVExDM1BtUjFrcHF2Y1o1aVlZVy9JMWxOQnAzeWRyM2tSR1JpcHFQNyta?=
 =?utf-8?B?ZXJYT1RHdmpxQnVKaU9pcDVUaHkvdzV5MnJIT0lHdm0vd0ZjYnRQOC9IMU1h?=
 =?utf-8?B?ZElrYUcvelVhNVF6NkVFRm5OYmlLZk4zcEZBL3VmWm5LekEzRDNYVHVjbXpI?=
 =?utf-8?B?WElaUHNncEU5Q0Z1cWlXSVJWTW1xelRSY3NFS1dzdTVaeEpRdU0rWW1UUit3?=
 =?utf-8?B?blAwM0EycFN5WGMwQjNOYWNrengwM2lsZVBUUjg4U3N5aEYxTU5JWnRFQkEx?=
 =?utf-8?B?Q21NRG1QVVBvUXU0UEJwN2gvOGsyYjhkWWJMQnMwR05QTUF5UG5ZaytkR1hL?=
 =?utf-8?B?WmlwYy9odkpEWDNnS0VWKzZCdk1sUVNrWk5Vc3VIam5CN2lva1pzallhbVk5?=
 =?utf-8?B?SU1TNTQvZC9kQWZicTlNVGlXN3drZ0FtbDFubysxb21NSXhueDNWQWcvRG9K?=
 =?utf-8?B?aUlSV2NLOElGVWxIaGRjMk00MlVmbTdwd3JoVlRBbmpodHRJU215VGxEeDJv?=
 =?utf-8?B?TWUvbDNYMnFlWHJHNlhtdm0vcG5kMEkrQll3UGthbGZuZHFqOGJRM1Q1TGtr?=
 =?utf-8?B?Ym9tV3p6ZU9TTURQamFmMFBBbkduei9uNFgyVVdzSG15NE40cG54VU1vOWVh?=
 =?utf-8?B?ZUZqM1pTNVFsZGErK1N4VjdvU0NveldtUnpqT1FHWkM3emlhZkhkTVg0SW9B?=
 =?utf-8?B?RncyWCtNNnBGb2haZjlIN0Q4cWd2Rzh2N0U5ekxLcmFWc0VLcHV2NHJoSFJG?=
 =?utf-8?B?dWJ5czV6c2w3YWhUOUd6WmlZL0dMaFZ5amNvRVdGNmwwQkV1ZTJEWTViN2Jp?=
 =?utf-8?Q?mse0D66Mp83OkBpDNcVAVMj7D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76986f20-c4ac-4ae1-203f-08db7225fa7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:06:04.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsTZNN8r5pK7lLcmGvumNGvpTK7v65ik9eq0Asq+UezU4/ZxCwBxlDojYu7FaCBHea+S5d0dqJt8Wo6R9XyMig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484

On 20.06.2023 22:56, Stefano Stabellini wrote:
> On Tue, 20 Jun 2023, Jan Beulich wrote:
>> On 20.06.2023 12:34, Simone Ballarin wrote:
>>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>
>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
>>> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
>>>
>>> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
>>> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> ---
>>>  xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++-----
>>
>> This file as well as ...
>>
>>>  xen/common/efi/boot.c                     |  8 ++++----
>>>  xen/common/efi/runtime.c                  |  2 +-
>>>  xen/include/efi/efiapi.h                  | 10 +++++-----
>>>  xen/include/efi/efidef.h                  |  2 +-
>>>  xen/include/efi/efiprot.h                 | 22 +++++++++++-----------
>>
>> ... the last three here are imported from the gnu-efi package. I'm wary
>> of touching them, and thus getting them more out of sync with their
>> original than strictly necessary. To allow the other changes to go in
>> no matter what, I'd like to suggest splitting the patch.
> 
> Should we add either those files individually or the directory
> xen/include/efi (plus xen/arch/x86/include/asm/x86_64/efibind.h) to
> docs/misra/exclude-list.json ?

Probably, and in the former case imo the entire directory.

Jan

