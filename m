Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CC7497BC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559804.875139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKjy-0002mU-Bo; Thu, 06 Jul 2023 08:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559804.875139; Thu, 06 Jul 2023 08:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKjy-0002j8-7c; Thu, 06 Jul 2023 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 559804;
 Thu, 06 Jul 2023 08:53:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKjw-0002j2-7x
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:53:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9281910e-1bda-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:53:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:53:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:53:24 +0000
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
X-Inumbo-ID: 9281910e-1bda-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJC6R65WUuCBJ5kDEh/FEAPz+gG4QLRu4aCamMi2I9VQ9ieE+F6551G5pOU/s8mWcq5mQr7PJCJhUj3Rsmk80ukdt+6+7izrXxJGd7dZmWh8UbrRCxjQ05ZpCu8Uoj4KZBCHt2WM/GjhLYipbhfJBelrCqFRDCHGFqGvwzWLqXQ7VU3EnHsQZAVMu3qiZy4zgqUGDKjAO8Lpv+zgygHWhbGOZ/v2a/hdnrx6qZaxRh4OYNrPJIw+3Y4Dp3g5s/gIKGq5zUp6wIUvpKKL1B72eCGJ3t2LqDf4sd8KRKHot8QXd/s4AXYyxC+yiS+ZFRyM26/gKhZtJJCl/iwHYtilYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZpOws28dab5EZe7Whl8rvvBliq7pfyOrkFq1YZ9tdw=;
 b=RQ8JbAaVISkVEZUa0+IYIjZFgOISTjea22qCpNW/IMJUMzIXmfOh3NtDgHQk8Vcmwqr3+Poy9TcevGoblWj6onKjb1SI/5W2IOMpSMUJL2GMGB0vdH9JsnAaDVPe/ADZ9P8j8z7/JBLFyTSbjubbHP78F5cE49AwOOFT71TTldmaIhs1DR0xNsvRBs6IU2DhWeLlnPKYJ9jj5hQ/2Eje3ZjM7YWzr0Fpkb2ycUkYhX/rzlY4BrMWyqejrw5fd6AzWCRYmWJa27KhZiSQZa/zN/nNgpcLKElVDdkmXWdKtzl9XWgVr8HM4D72Nmwxho3BUVysOvKTCSyvGbraDfOEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZpOws28dab5EZe7Whl8rvvBliq7pfyOrkFq1YZ9tdw=;
 b=W56Ye9qnvtzYp5yQOcKVJ/b1e66QwLAS6JBcKNOmprBDCXzSfRKGFLgqloDLuSCfAQJ4aYKJH+QbDZvtNrHEHhjjfpHgNKh150+FNCx2ePriEe42R1pdBjPOPovL6xmkH8lGm5Z4wFYRCSIPT328Ee9U4s8+66KC2QehkLF5NfKTz/HTtySrcCXmPGhC7kOYDOzBX5Ll++RO0BMSi9e5sQXS/QVJSdEDQonI5AkkjM3l1VkvsEjGHkADG31uAlwERXrWocKzVp+9Sz3dMA4o/VV6YDV6dIptuPTLfFWTWWjj8NPVPy4wclle5oQW91+rLBjQ2d/SbXKrIG+2Znl/JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bf7b868-1a48-17e0-e268-7a076a532647@suse.com>
Date: Thu, 6 Jul 2023 10:53:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
 <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
 <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
 <39e5b62b-d863-ad2b-5e9a-461fab6c9d31@suse.com>
 <ZKREeO2XJ9C8FYOM@MacBook-Air-de-Roger.local>
 <cbca26b0-b6a8-c529-8a41-6fc58965eaf8@suse.com>
In-Reply-To: <cbca26b0-b6a8-c529-8a41-6fc58965eaf8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d981b29-b358-4f96-8410-08db7dfe7502
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dcpy9BmN/P5RLThD53is45d2DaCBsPd5e9JLz5v4tnUWhdEuQfWiMSwcq9FeeQpT2D0gbeX/vQnu5tCEvEJtUtxxlILRFqYYbEJUe7I5p1O90ykZYL403scQMHULoJ2e/ucZHmweu/9pv5R37RuhYg5xzMAzP8i3ryF/YFZ7NzOJErtwSokyxwDkmbDlux6/hG6BuJHVmWMyIYEuJOXb/7GHDTU0G3Xr8yVz9yREKbj84gbjZ05qZHHwZFtHFh9JNwDjbJtf2uCOI5GjN9zQMjWSdiAXAUO5suw4Als8Ofx8f3liBNVa5hi3Ltz3y39c+CgJkMJaOKY/pNpEb/VESdLewUbyhLtj3jR6+Ksae70NyYFata+1apM6mp1sObBeuycMgpQoI2IeOJfx7AmZP7oZF2wdTwgS7LWFy0rgdiRApHI44y97Ln5eB/hfFYW1J5mRxlnn8rT/+BwmEd3tLjRXrYgSAsjL/2Bs/BYqksvmty7jQT2FE7ZN6iW4xzYBqKghAmTmADM/PyKC8W/Dlrso0reko5yvry53OmWj+oLA9JpvbFgcXDk39zVohnMBnMWGU1FQUiuoJ8bi2FqyX5RkYsjNOzio8zxsjop8OXV78Ewh/W9rmMT9FaijIVgyyawFrZHBI26EcvQEcZw76A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(66946007)(8936002)(66556008)(5660300002)(31696002)(86362001)(2616005)(6506007)(83380400001)(41300700001)(4326008)(66476007)(6916009)(316002)(53546011)(6512007)(186003)(26005)(478600001)(54906003)(6666004)(38100700002)(6486002)(8676002)(36756003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2dDSGhnMDdlM2RyUVpsUjdkeVQ5N0NQdlVkSVhVVHFNTld1SEtjakNjN3Ar?=
 =?utf-8?B?LzA0MzhVSEtlWTgrcXEwV3RuY1JrMDlUcTNWN2l3eHJiVFNEbWkxV2Jpa1VK?=
 =?utf-8?B?V3dwTkQvZmUxeE0zNXJHaDVRbWozbkgwbWQwR0o5bVBtVUVsV2NmbmlyZ2ty?=
 =?utf-8?B?K01XRm4yRVoxbUVveXNTQXNTSktVaGdFVnVRc3I2eFloMklmdWlPekxnb20r?=
 =?utf-8?B?UGg4alNnRHhMUXpVZHlIOXRZS3poU2prUW8yelhJMENoS1p1SUFOTUR1QlFH?=
 =?utf-8?B?T05pUFlqblpqeUo4NmhtTVRJOVkrQUlrNE4yT205U1BiQzdQRS9ZQ0NUQjRJ?=
 =?utf-8?B?YXI0SWFsdUVJMUZvUGRHSy9wVy9WMmFNN3YzdkpKK1JONC81NkJERnBLeGd2?=
 =?utf-8?B?b0dadzJyMDU1QnNueUtQZ3owN0NLS29HbGhnK3R3RFdvZjQvaVBSZHQ1TmxE?=
 =?utf-8?B?NnFwQnVkT1BZeXBOeHkwMkpKaWd0NWVqSGRlSmpLcERmVVp2eUhMSWxubTRi?=
 =?utf-8?B?NFhhSlBuVy9ldGVHeW53Tm16S21qK3hreG4rY3hUTkZHaU1BdkpJbnNnRnhB?=
 =?utf-8?B?c1VjeHBDbUFuanA0QXlxVlZSSmpLNVkxVi9kWHhPSk1tUXhKOHZuamQ2dldO?=
 =?utf-8?B?bjlna0RFMmxDc3VqTExjUUZROUszU0ZPRWRNQ1FzZUdiMVBjWUE4L2hMcEov?=
 =?utf-8?B?bUdHY1duWjVZYlFNVWRoWkJ2RW1JT3hPYjh1cTRvNjI3RkdwYlhteVF5TDUr?=
 =?utf-8?B?SE92VFBrQXlJOVlWYmlXYlliRjBCQlJtQmVGSXI1NHBWYUZvYUN0aU5aTEh5?=
 =?utf-8?B?U3F6Qm5Qb2xvWXhZb2pqdTJ0U3o3ZzV0WTJZVWtrUVZDV3I5Qzh1UmVTeTBQ?=
 =?utf-8?B?NFJMSG03Rkw5U2xXMUJuVjZlSTBXVHo4V0dRRXp3VndVWUxKYm1YRFFJcnNs?=
 =?utf-8?B?czRYUXdNU2JvWldMRVEvU1pwdVFIcXFYd2kxN1hlamZZRngvSlVBcFdvQklT?=
 =?utf-8?B?cld5MVRORldha1lnbFhCby9lRFBzcjdVd3ZKUVhSWWNhb1ErSXZ2WXZROHRX?=
 =?utf-8?B?SktWRXEzWDBNcSt2Z1VZTHdGV3VKZ0xaaXNUTXdHbGJGWWFGbG5sSmtKL3B6?=
 =?utf-8?B?STcwd21OTndyYWcwVXU3YnZ5KzVHV3hKeXhtNExFYjhBUHBqN2UyaWhUNUl4?=
 =?utf-8?B?MlZ1VmVkUitjZENGaU9EdkpFZmgrL0dnQ2MyK2NNbUR5ZnlEc1gwYUZhQzBP?=
 =?utf-8?B?SERvZGcvQXZjc1RzVGtlcWh1NHhDVHNvdXhsWDN2MmU2ajJvSnIrbThtUmtI?=
 =?utf-8?B?cDA0UmVTMVNWQ3pWZVh5bTkyOHRxbmd1dVAxSFA3SmkxVmRoMVNrZEdGcU5n?=
 =?utf-8?B?OGRLUzloM2NaR0VXamZJV0YxSUErMEJkNDIzdVZXS3AwRzh6Wkp1aCtQK0dJ?=
 =?utf-8?B?dDJHbk4zK1NhR3laWURoWVNPbjJPSG1pejdVVTZVOHIyV1BvZ1ZaSmVsUEJt?=
 =?utf-8?B?bEttRFBNUTU3MVgxU3hzaDlXR2ZkV2ZPd1RzSVc0ejFzQmhMY0Y1Ym9SOTE1?=
 =?utf-8?B?Kzlmd080MmtHajFrekcwbk40elNUN1pmc0NPT2NpdnpyWnIyOGsrb2R6SzI2?=
 =?utf-8?B?cFpJVU5weGlyeCtDVTFZVkswOFNld1M3d3JraFlwc1ZleElmWDF3ZHEyOVA4?=
 =?utf-8?B?cStLZWQxMmg5Zk1reTFyV09GcTdWamQwek5tTWFIcFJoWmRPR3ZuRHJXMjBF?=
 =?utf-8?B?NS8ySU5NZ2VmeGZyb1ZSYzFnczRQSWxjNkF3UFkwMjFYRkRIT3ZCYkd6NzJ2?=
 =?utf-8?B?NlRZRkdEdzEvNHd5TkppYmhGamE5ei9abVdoTm5DdmVtWHlKMlhxQ1RBRTJj?=
 =?utf-8?B?cWNMcERXWVcrM2pLakp4c0dUeVZQQzcwV2YwaklLZzRWRkVyc0lJRHhvRXpm?=
 =?utf-8?B?YzkzK2tQTGQ5SWtjN2xKaUdtWDdPNS84cGtzTTY3eEhocHA4alFXOFhqWnN3?=
 =?utf-8?B?QXZqcTlLajl2UStzVUFxdUtqSUlpekhxYWJBR096SHlCR1c3WStYU09EU3Bl?=
 =?utf-8?B?OXE1YXZaZjI5NGlSNW9zVTdzOVRacis5NmJVaU9CMUxuMk5SQnhhekdkSm1s?=
 =?utf-8?Q?LkC+EpDfFMPvjs2SyG03v+pqa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d981b29-b358-4f96-8410-08db7dfe7502
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:53:24.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2gJNfAoCkgpMiFdyh4LI9NLKPd705My2hr6o1cLsUy2tcQCS+lgtBcC1TDUE5hNIjsUhTTn3jFc+55OX+p/UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749

On 04.07.2023 18:16, Jan Beulich wrote:
> On 04.07.2023 18:10, Roger Pau Monné wrote:
>> On Tue, Jul 04, 2023 at 06:04:36PM +0200, Jan Beulich wrote:
>>> On 04.07.2023 17:55, Roger Pau Monné wrote:
>>>> On Tue, Jul 04, 2023 at 05:42:33PM +0200, Jan Beulich wrote:
>>>>> Plus is the mentioned
>>>>> "potential ABI change" safe to take on a stable branch? There's not going to
>>>>> be any SONAME change ...
>>>>
>>>> Is there any ABI change in practice? Both fields will still have a 1bit
>>>> size.
>>>
>>> But what a consumer of the interface reads out of such a field would change
>>> in case their compiler settings arrange for signed bitfields when signedness
>>> isn't explicit. We don't dictate, after all, what compiler settings to use
>>> with our interfaces (which generally is good, but which bites us here).
>>
>> Hm, I see.  I would argue that sign doesn't matter here, as those are
>> intended to be booleans, so anything different than 0 would map to
>> `true`.  But implementation might have hard coded TRUE to -1, and the
>> change would then break them?
> 
> That's a possible scenario I'm wary of here, yes.
> 
>> I'm failing to see that, because those implementations would still use
>> the old struct declarations they have been built with, and hence would
>> still threat it as signed?
> 
> Until they rebuild against the updated header, without any change to
> their code.
> 
> Anthony - do you have any thoughts here?

Btw in the meantime I'll queue the uncontroversial part of the patch
for backport (with a respective not about what was dropped).

Jan

