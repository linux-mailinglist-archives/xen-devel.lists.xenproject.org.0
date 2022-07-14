Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD570574B90
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367594.598659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwja-0007Bt-Cm; Thu, 14 Jul 2022 11:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367594.598659; Thu, 14 Jul 2022 11:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwja-00079R-9v; Thu, 14 Jul 2022 11:10:18 +0000
Received: by outflank-mailman (input) for mailman id 367594;
 Thu, 14 Jul 2022 11:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBwjY-00078r-Eo
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:10:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20088.outbound.protection.outlook.com [40.107.2.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887cba6c-0365-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 13:10:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6358.eurprd04.prod.outlook.com (2603:10a6:20b:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 11:10:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 11:10:11 +0000
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
X-Inumbo-ID: 887cba6c-0365-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQL/RQeGCQdd5sI2ZA6uK4+7sX2aaRu/Xl7u2ASOHBJm1VRrH5NSVnq6JnM/W6SloT4RF2NfjNmuIhFlFt4VpotZhWweNZlpyaMiZiNJzfBfBJmnhfqzW8N1Ghmz/nTBNpSJNaeOQEob5pWhb45qKl+kwizQQrlrqN/3Waa9mNTG9YGGvJUtlB+G8Z2Ce1qPxy0EUiSsSBqFE+1Yq2Fd6J0L+tXa+Uqhfapaago6w2J6AE8lefL1gk/mlHyMpnIBkYIFV+Iif9uDABO1kow/den6qnSgp5CWZ1DWsfIInCs0lpWBo//viSawDFRshIDASxYy27X21lkiZS9IOozmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i62fDuX3E5nXSFqeJ28T1/CIrf0ZC7wQqaqTxJVT+Hs=;
 b=CLSHL/5r45/ZsO/WJQHIds4i8uigDc6LLd16DIbi7ZGNIumFC+LX3eQ6jkHQE20Ytp850R75wIW0AK/Hvb1Kd8RCi4C3MyFgIDJeVwiZ7Q7oDw/Wp9Cw9V24TN4jZK6YGDnlGwP9maNHYD/nGcT9LuNVjo27vDTuarNsj92akqh1WIryQzZ9olCmPMDCvxajZtUX11rJ+jE/sW7iHkhbAhkMwyrwOsigZ4U3zDYmKslsAsSXNUBQ6KLSc1UltRDD8Lwse6WNFwoJ8UJfHxcDhkopItVUAdDHV4dI9paV6X9k+KFPXlFYKxGMuCOnt2DltkKzPGpTjHpaPay2fibmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i62fDuX3E5nXSFqeJ28T1/CIrf0ZC7wQqaqTxJVT+Hs=;
 b=dFwcj9ZvHYqPxAYKpOV71HkagpkwLwA14nTbSWkR6Vb6AZdq+g1i1NXrix33wgw3hJumymBB4HR91muAZuLTNRV4YDxkBhFJm3iJikaLWo5o6lIx4ipGWXB4MxTgmaVmzxZMSU/PTeKCwqdy4JV8s6/0PkSsVLUJaJYin1W9Dsjfr2oQS6td0iObarlDP8ByKIAYR7XW6A21SFxZ7PAeCIUW+ZlG32hnnz8r9HtwNk0Za38YwQvbUcXSRt/NRL+GimweWnKFnI7beLMmWHiH+BlWVa7Qup/fGccP3mu5JRjqOmXDSlpTWVDqSAPCPJukubwFoM6V+ZBGz5nr0APX5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
Date: Thu, 14 Jul 2022 13:10:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f43f3b59-b349-4954-4b58-08da65896b40
X-MS-TrafficTypeDiagnostic: AM6PR04MB6358:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	11MVpfGWE6Wg641laVuIb4Su9kTAkJ4s9vxAXXPjOc/4W+BJCpzAlJWLyL556FusfbKnjfv/F2o7oUEk+tuSMjFNTsKLG5CAS7qD7bZDBcs+xpzves8UIsm252t+9wbNf03BEq57xPY6k5+SmXwAqUZZKa5y+L9Ao8ACcohfLyoL7IIc3fdnhgjgq644y3+q5p2+u3QUyqzeS7rmGr9y8mppHnl3vK6AczBQ1YUwCyNyvnBTcjmddPNMcUkIboDnVJvsOelYaSFB+5eCmOAohpBKUjuLNjP59K7IFPs9nnj86jte5uSs5i6P9W1FpER5jolDZo7ZBtw2rAb0J6ObUTyoYRSLRNeH9jqv04pEkwUfbaSL1kkpnDysutqryBUhe+qIE41ZhnBQnUsEzWwFUIPpreKstbciU5oJomMIUszCNT56KBb3dFLQp/HCZbwsAjQr19rcvaFmfQ9ybBRcb5LGqjE/mPlXJ36QDyXFj4ISIyE5Ss3Y+mAUjAx2fpC9PPQun7fOwYv5vDyMbkEl2TlFlNipnV9Cx901D3BGfb7Jz201juFuYpLOHQuuZ7w2aYFZgavZxt4caT6nogkaaxpVz0R6168ryh4rO8uGe8+jmVp1CXWVpIgOD2ug2PU3Jcr3AaHpZaEgt9ExUOIkTTDW4d0/rhE09YSZMkbXUs80a2LYl69/TzOySI3JTd7foOHCSa9uM+agIHD0iVbnG9j/Zdc2/j9zSuWnSGSNue7dBNM5RL7OlxG+QJgZpQKezqo1ly9MGrAycmLVsC0+48vW9x8Qhu2yze63zYcE7hxzDlMBH4wEgV+0Yb7asW1QBExJGBAgOWb35lJp44/Hqaq0mxhd2kb0e+y6KibEca8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(31696002)(6486002)(6862004)(2616005)(66556008)(54906003)(86362001)(8936002)(38100700002)(478600001)(186003)(4326008)(6512007)(316002)(26005)(31686004)(6506007)(66476007)(36756003)(5660300002)(2906002)(8676002)(53546011)(83380400001)(41300700001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUZkMHhDTml2MzhoQmNEZnRvTlExZzdicmlOOUE1cUtyRHBCMTVnT2NvaWh4?=
 =?utf-8?B?cEdIdjNNQm9JQlJjM1FqVjl5clRNdWJoWEJyMWprQUIxVjh2OHhXRzFncC81?=
 =?utf-8?B?bnBJVzIvcXFxc015azlkcFpmY3ZVOEM4Wm5pSlR3WW4vMHl2RmxpUXlsMTAy?=
 =?utf-8?B?R0Rwc25UcFpScUVBakpJZ3R6ekpZenMvZk94ckxDYXl5ZStyRUkyM3Vya216?=
 =?utf-8?B?WnRWMjEzT29ORGJNYzZDSGVDV2h4eHRnY2Uzc0ZhMWc0TEpkSHNrUVhHMzE1?=
 =?utf-8?B?eXhnUzIrMHhKV3pIVTY0S2tmUHk3Wkh4SWVSZStML3dGQkh2cGRUNnFOZnF1?=
 =?utf-8?B?N3A3QmY5bFJJUHB6a2Q4V3JMLzYwYnBhOHhVTzNGemNGYmdJRmdtVU1BK2l3?=
 =?utf-8?B?dC9VVDNWcWVMNWFkb1RvSjRaYTNiV0Y0c0VYVWxhWU5TSzBYM2hGallaeGYx?=
 =?utf-8?B?bXRDcnM4eFkvNzNHdVBGdldSVE1iS2Q4Q1p5QW1RdzVET2VHR2JBWW9xLzBj?=
 =?utf-8?B?Mk5sdUZwN0dTdlExV0J6alNDNE9aVTdvQU9UL2dwQ0ZycUdNNFZZV0VVYTBv?=
 =?utf-8?B?TDUyNitsdFNYS2VFdDQ5L050MjVGbHVEOXFtYnJmQzBxK1VBZ0s3QkpPTXRG?=
 =?utf-8?B?UUNEWDN3b3NGZC90SW5laFd1UGoxY2M4UEN3c2VwUjNJUzNTOEFiTGJ0TzBM?=
 =?utf-8?B?K25Mc0VwTkVEdW5reXdvNmdmQzhaZTF3QjZjWkxqSmY5WHhVbFdJMjBYNDJa?=
 =?utf-8?B?SlhlZlJxUmNKNnNtdEVqVm5xcUZyaWdmRGg1K215L2l0d3NIZWQxeUJQdnVu?=
 =?utf-8?B?Uzd6K1dGL3RZMHBDTXBTVnhXeXYyZitzQlhISWNmUWh2dHFRTFAyUmVzc0VD?=
 =?utf-8?B?VXBONk1DcS80M0t1c3JmU2NCUW1GUHRwUkVURDlpUWpBb0l3SFE5N2pkbW1j?=
 =?utf-8?B?eTQva1JJbkNtOVZoaXZJMVY3eE9qNjdocVlYMzgyMldoWFM0SGlub3BmZldM?=
 =?utf-8?B?TU5iTDh2SE9oWHdGU3dlcmxqN1NWekxMUGNsVG5HcFgzbEFOb3pDK3ZHNzhz?=
 =?utf-8?B?UnhOaGhUWnpyQ2FOUkpiWjNuWVpBOU1XUDRBMC9PNHRpZ3RkbUlEVUpCdEo2?=
 =?utf-8?B?dThZTUg3NkEyOUlNYnFreTM2ejQvamJhWUxQWnRiZDFPK2ExNUVob3FpU01K?=
 =?utf-8?B?WVZ2eHl6TDI5S2tUMWVhU1IxQVRWSEVrYUp1cDhsa1NIYWNRUzlGVVA4Q1p1?=
 =?utf-8?B?VkY3L0crOU5NVkRnUURLQ1VIcWY3ZmNiWmlrRVNkK2ZLSW9EbGZsdEVVS0JH?=
 =?utf-8?B?WFBBYmVtd1BMTzNLZ0Jlbkd2KzNvY2IrbEJSWFROTEQrZjNrdU02bWRHN3hE?=
 =?utf-8?B?cjNjaGo3dkoxamhaakJJM3lmM0JvU1JpdHBSZTlEdVlNeE13akRNTG9rbUUy?=
 =?utf-8?B?VEo4WFIwMld2ZnAwbzBYSE0vWjRmSUtlTkp0TDJCSVFsamh3VUxZU3pIbS9V?=
 =?utf-8?B?cEg3MzBSU3l3ZldWcW1jcWFacXlBTTlnUGZXRVRSTW9LUDA5djdRVERiRlYz?=
 =?utf-8?B?c1drOWZRMFVJV2Y1UkNrd2N5S3dOcnNnUVZDelI4TWdKOFZlRGp5N3BpRDRp?=
 =?utf-8?B?VC9BampwNlFNMEluRmZaTmJHWnZOMmEvbUpXdmxFR3VlZ3JRU0MrMVArZEgx?=
 =?utf-8?B?czNuN2Q2enorVm9FemhQWUQxZ3Vhbmp1NlpUaGt2c1NJblRMVG1HNDNoaUM3?=
 =?utf-8?B?ZXVhcWQ0RHY5TW9oT2lqSm5pRHZJdXpmSXV0WEhQQjB0Nnc1UGVEWjJGNFcz?=
 =?utf-8?B?NklLeSs5QklsQWJrbGNjVFVQaVJxc00xdDFFSjhqcXRFMFFMajNKUGtGdEFQ?=
 =?utf-8?B?ZmRmMW1EQUhSNnhKUERQeW94U2xyL2FXbUlucVBUVUJqbEhQeVd5K2l0c3Fm?=
 =?utf-8?B?NnRpNTdaYS9ncDlpQnVidnFPL2pIMGg4SWNUS214ejVyaDFjcVNOeXNGWWRH?=
 =?utf-8?B?SjdlQ1V4MnE0eHkzcnp4S2VmRE5jWnUvQThwNU16RkZQN0txUzdJeklPTldh?=
 =?utf-8?B?VVVjTUNJRXEvcmNZMG4zTnFJM3JSQjNNdnlLcHFoTmNkL2lMUGhZNjdNbExw?=
 =?utf-8?Q?D5grqyuk3/iVXinKh0MLNmpox?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43f3b59-b349-4954-4b58-08da65896b40
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 11:10:11.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64i6NJQzQkK3PU+D52Nz1L62s14Iiem9HT3LMrsl3hefiVYfrTJ/tz63XmL5TeYYts2ySfcLapOyZm3AWj1+6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6358

On 14.07.2022 12:14, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月12日 22:34
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Roger Pau Monné
>> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure
>> NUMA nodes number
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -17,3 +17,14 @@ config NR_CPUS
>>>  	  For CPU cores which support Simultaneous Multi-Threading or
>> similar
>>>  	  technologies, this the number of logical threads which Xen will
>>>  	  support.
>>> +
>>> +config NR_NUMA_NODES
>>> +	int "Maximum number of NUMA nodes supported"
>>> +	range 1 255
>>> +	default "64"
>>> +	depends on NUMA
>>
>> Does 1 make sense? That's not going to be NUMA then, I would say.
>>
> 
> Ok, we need at least 2 nodes to be a real NUMA.
> 
>> Does the value being (perhaps far) larger than NR_CPUS make sense?
>>
> 
> Arm has 128 default NR_CPUS (except some platforms) and x86 has 256.
> So I am not very clear about your comments about far larger? As my
> Understanding, one node has 2 or 4 cores are very common in a NUMA
> System.

The defaults are fine. But does it make sense to have 255 nodes when
just 32 CPUs were selected? I'm afraid kconfig is going to get in the
way, but I think I'd like the upper bound to be min(NR_CPUS, 255).

>> Why does the range end at a not-power-of-2 value? (I was actually
>> going to suggest to have a shift value specified here, until
>> spotting that NODES_SHIFT isn't used anywhere else, and hence
>> you're rightfully deleting it.)
>>
> 
> I think we have discussed about the 255 in v1. Because Xen is using
> u8 as nodeid_t, so 255 may be a upper bound.

Indeed, but that's something you could have mentioned in the commit
message as justification. But you could also have opted to make the
upper bound 128. Let me ask you: Are you aware of systems with more
than a dozen or so nodes, that Xen can in principle run on?

> And if use a shift value, from a user perspective, I don't like it.
> It needs to be converted, not intuitive enough. It also limits my
> input range, even though my numerical values are reasonable. Yes,
> if a machine has 15 node, we can ask them to input 16, but why not
> let the users decide? instead of being forced to enter 16 by the program?

At least x86 Linux also wants this specified as a shift value, so
people may actually be (more) used to that. Plus non-pwer-of-2
values may yield more complex calculations when the compiler
generates code. Think of a two-dimensional distance table, for
example.

Jan

