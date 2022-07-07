Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8C56A7DD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 18:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363096.593447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9UD6-0008EW-M0; Thu, 07 Jul 2022 16:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363096.593447; Thu, 07 Jul 2022 16:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9UD6-0008CN-J1; Thu, 07 Jul 2022 16:18:36 +0000
Received: by outflank-mailman (input) for mailman id 363096;
 Thu, 07 Jul 2022 16:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9UD6-0008CH-0X
 for xen-devel@lists.xen.org; Thu, 07 Jul 2022 16:18:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 730f3e57-fe10-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 18:18:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5259.eurprd04.prod.outlook.com (2603:10a6:10:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Thu, 7 Jul
 2022 16:18:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 16:18:26 +0000
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
X-Inumbo-ID: 730f3e57-fe10-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JInaqqVJxwHkQ9dkSf5PX+iYI1NLBX+YO9MteaEEESOzINLvw/kk/c322GQlAyLEhq/zoE0XvO1J3tdou84Osp9laf/N7aEFeG4uzrfmRT8MpICdpoS/reYb5TugVnikfRKq5XcQ6/BJuTzto9EwUtH0jSNC3tcMex7JzbFeHfe1M93c0ydtHhXAxkZoJ8f3OlUoDTzQBtMVtiv00upM/bM0/CJgct1D6JntxlnEnna3Du7a4mnu1mIIZCP+ADmcHwdekkR9M0ySuJtn+BT+lXXJLNalqsBF8T5PBemz1xYJkJU9fhDGoBZnwuzkreDnmLB0K52bUlWpSlhM8NKNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkBQYIncmfnZ6I7MvVd8YjOSYY1zkcjGVBb9JS5loRY=;
 b=RPaG+SEYyhlhq1FUJY6yI6r5mjUHNHlVKbumz61J4a31uHJUK8jvvh4NXhxfzFAkboSBtUaHPdoYAT5VIpVeEl0bB9ECzMihoDww1/lGz0MjNPHQ6vXs/ICB2QGycP0WbM1QaAIPl0HMjcgC0w7A6HGNoQgxKKjN9Q/7mJYFb/EH8NjXJvTWIGQW6dEOvIWIe3kHH+7TBrVbo/ObXphDAGrALHRPewXgcB3PtzFiofP0sIBH3sL/PpViQlf3gQ1tJmF91s+qFhl/7YYzwMDal4OVjfJwPpcQAlxBwPro/Oc6oXO6eac+OMOnOtvIJdy3SxGa2ctIAYcSMzz1DRoOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkBQYIncmfnZ6I7MvVd8YjOSYY1zkcjGVBb9JS5loRY=;
 b=kzowu6Mto8N8zWRVYnZtGMZzKyd+GIAHy+jZxZW1F6jv9RPK6T6VdMWHrtfS1QAHDNIJqjdSpLXhvQvKBrZeKlLF+mH2+mObEH/tka1GOCFTlEgEe0KzmASm73JfdhGipq9KdPV+W8L1WoaNDZKQf3VyEo+2aDrbCgegM+Q/m+M2GTUvINckN29c1a3Mr5oinGk6G1onHxueHtdtYpWrDING0e+HvArWihcWh11pArOzVMQn5zjbjS4fudyhQtRE04kxFkAOQ9a/5HJDEpTjLW4/vdu5n9DvZKjprUeYZ8JdrcV6DyZQt65zylq6/exkSxfFVhw5tXJXvXHBqCSqIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <051bc3f1-c3d5-968e-7065-cae29bb5ca91@suse.com>
Date: Thu, 7 Jul 2022 18:18:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
 <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com>
 <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
 <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
 <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com>
 <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
 <CAKhsbWaeniirR5ZiOn_ixa51Z_HrfiAQ3mUpevykxTjo+o8G-g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWaeniirR5ZiOn_ixa51Z_HrfiAQ3mUpevykxTjo+o8G-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e11c169-cab4-48f9-e480-08da6034526f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5259:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLzcWNm5ACFZ+NhlkbdnefWX4+WAwhisx/v7JQBCDObhIH+HmbflVjiI35BvfnHfofA6y45W6NHkthPkNtHohj2pbKPZDq4RIK2cfZNGbnZl7IDrLSFUihyBxtQIeCzZkGhEBrKnfgjbWz+x2VClL/E7E2ocrZKFEQfLUc4Th/Hm8ftF2uWG9rq5JCvIhKcTCN38r4CnJmZqiyAz5PHk5gtvc9L8Rk40uzV4kdLU0XoZ9g2WMjDNyirNK4/60p+B/6uE/8mywlVtec0JkHn/oGZ9+MRQ/nljmh1gtk4F6J0eyU5UABn0uXqe485mO1PhkG5hrdpOEmP9ImRQJZXn1NndcImi1TH/UtEnLx1cWfeyKA1vXoOZ9V9hyj8irhbYdSbbIPRlr2ImLwiJAy0COGmWbTjr4du4LKjHK01bhPdJqMMVQo2MobJ1oDWmH9CgnkkhQohN88RQB5nNqHxSQ3g0kVYYdh/MZsL/Nk2ae5KlSCvODKWnt9j2a4H61znpInqJT7VtMW8NIa7GxwHzy8QI/ktkjTv9I63Y3d3z8Z+13ZSjQZOYeobRkWsJeAB8+GAUB2Cw5vX1j6Ov/qPN4RViGpcioFXac6FglJSNslJHZHhOXBwWa/O2TlFW7HUg0N9mzq/eX3GSmv/P6ftdxAKShlSxEriiebjKnWzQY3EAdOqjgb1yr7bok+uJkVFvcM8GDXv/40o5AgOKkWUK6yZABTx4HWJ1WHxDplB7saqWNKAjrmknFaWQ+DdwrOyxPFUl9/g+Qv4Hzno7kGy6Dm4eyAADU8tTKVj3pTvKbewie8dfV806sRlPpQbzFcrkrUUSJruMR8rdf2DAgWppCgMLBjBTfpPSsbwWiMORxpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(396003)(366004)(136003)(36756003)(6486002)(26005)(6506007)(2616005)(2906002)(53546011)(478600001)(83380400001)(186003)(6512007)(31686004)(38100700002)(8676002)(86362001)(66946007)(8936002)(5660300002)(54906003)(6916009)(316002)(41300700001)(66476007)(4326008)(31696002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZZaHFqQjJZK05VbFFmZlF5TllKWFUrV2hIVENDN0NUTmdCY3FBOHBFWEdz?=
 =?utf-8?B?aTg0NHFpc2Z6YS9reXZJYnNZRUYrdTgyb2JKaFlqellvMEVUU3l2WlN5MGtz?=
 =?utf-8?B?YW42RmxCWlBJVGZQcERlQkpFYWVhOWNBZk8zWFZoR0ZBY2RnS29ObEFBeC9l?=
 =?utf-8?B?Q2krS24rTnRVY3BBbVZFZXdFT3FEcjZYMy9kK1NGSGlld0xsSk9zTjlVNDQ0?=
 =?utf-8?B?R3hpcEF6ZWpPQ0x6azdFM29UU3FueEZnMFZnNDJydHpCMEwzOFBSdFRQTjR2?=
 =?utf-8?B?VXBleGIwcmtqTWUrTVoxTVN3VXR5MUExRk9MVkkxTUhjYmgvYVI4QUE3OTYx?=
 =?utf-8?B?MC9tSURvWlJ2S3ZXS0JiMEpJaFNOQjhaTDdyWDRXekNJVzFNUzhNQ0dRUjVB?=
 =?utf-8?B?WjFSaTFUTmFKNksyejRoRUt1bFgwdWxPNml5eHVldG43VzRQTUpNNTMxNHlZ?=
 =?utf-8?B?MjZZdmViSE5IV05qUU5OTzNLSFFaWkdIc3Zzb0ZQczByVXdWcDYvTS9xUHVn?=
 =?utf-8?B?djh5Y1RmOEpuclFnTVFGcjFmVm5MQ2FSSDliL3JlQ0JwYjRDTkJ3S28rdDVB?=
 =?utf-8?B?ajhiMm5MUlA4RXp5Y2p1Qm1FMytOT3ZOUFAwOG44S3plZUxVa3ZxQmVhVS9D?=
 =?utf-8?B?eWptRGlSdWFOSkZ6cFV0RTdvUEdINUtMWG05eHN3RWFnSTRpcmZvcFcxMk1x?=
 =?utf-8?B?MUdyRTVIay9qUXYxNjkyVnp1ZFl6MGFha3c1RU9OaGdxQjFTRE1mRlZxUGNa?=
 =?utf-8?B?SlA5NnpoUFBWQktRVzlnN25nRXBhMzlvT3JBS0NlVUR5eXNndEJFdTZPY0li?=
 =?utf-8?B?a3BRby9VcU0wNDRBZlVNSExMOWZGaDhMeERGNEc0SGJNOHNSdFJRWDNjU3ph?=
 =?utf-8?B?NzRVanZ1T0JKWnBsUVJNazRXQjcwbjFUaW5UMjVYTWkzSVExWVVIaFVYVFFz?=
 =?utf-8?B?OGZaR05sMkQ4ZjVFWWJyYXQ0eDZDQUNRa2xJbkt6b0Rha0QrdG9GQzFreHBW?=
 =?utf-8?B?SFpLYW0rYXZ0dkdEZEdUbXJPUTVSOWdtdkVhaTVUWVZGSWZ4NlVaV1Z3YTk3?=
 =?utf-8?B?N2hFemw3dEpTalNNU1V4TVlOOGVUNWtteHhmdXBMNjVBc0R4bTlQMThRYW5D?=
 =?utf-8?B?NjI3aGowTlZKN09rdW9yV0FIcFJPNnJ2T3F4V2JpYmdvZ1d3S2N4U2FqRVM3?=
 =?utf-8?B?S3NmdVpwdStVMnYxb3Fhd0VKeEMwQjNXanUrVWlTbVlzVkh1a1greTY2dFl5?=
 =?utf-8?B?ek45UktMM1NGTkM2RTBzVXlDRlA3U0pnYkE0TlhpQi9ZUUlYOE1BMmhHb0hQ?=
 =?utf-8?B?TWdWYlBRRHRmRU85WC9SMy9OdnVXc2hTOTIzQkVtS3BUU29qZ0hTbmtXR0JE?=
 =?utf-8?B?d2VITWUzcW84azZ1YS9JZlJVMUlJK1htYStJdGFZYzkvT1ZmL2MrQnI3L1dT?=
 =?utf-8?B?UVEzbEJ1WUFycWozRTR2dVNZRDFFOUFNZW9pb3hqYXIyTHEvSENLVjlmSFNy?=
 =?utf-8?B?NDh0bkovN3B2bFVnU01XQ2Z1WTNhNW9pa01FblgvamJrclBSZVhpbGo2ZTJG?=
 =?utf-8?B?RlZRTUhxRit6WnorUXowQmd1NnFTeDRuZkFndmg2VkR5R3ZieXN4cENHY0RU?=
 =?utf-8?B?UmNFUzMwcHVIUWIzSzJwLzQ5eTZKWGlkc1JZL2NXNW54LzZiK3l6NDJqZzJ5?=
 =?utf-8?B?U0FMNmh5aGhaK0poM2dtaTJYT3FzeFJKNGlHNEVsY1RlUlBXeTNPKzl6aTRt?=
 =?utf-8?B?UzdxVUpZZ0xWWGZCMy9RMStzL1FSZFpucVNGSWcxZHR1RDBZMmYvc1BTWGxZ?=
 =?utf-8?B?RzV3UzVnVUxJeVZkYmpEQlpyaHNHK3ZRTFFob3hUbXhiLzUzTjVoQllacUVk?=
 =?utf-8?B?NVpHY2RpTDc2YkxlUFFFKzRMdGxZam9FWUZPMStyUFZnNkNNc2M4WVc0SEhw?=
 =?utf-8?B?Z01BekVBTmdBb1ZTczFqamZ6ckVXSXpJNU0xZ2JJN2paVXBMamJURzhoVUlN?=
 =?utf-8?B?aEw5aHRDRkk0aUh4dXpWSkd4THRXR3pBd3BtdGlHaVVjZU5KNCszOWs2YXFk?=
 =?utf-8?B?b0taV0ttUEVqT2R1ekpWQVJidVV6eWh5SFRDNlFWMDJWMG9LT0V4MDNtcE9E?=
 =?utf-8?Q?FrAXyLKB3Py7I8AyHkBhOAdjK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e11c169-cab4-48f9-e480-08da6034526f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:18:26.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdOqhqICL4iqIZVLqSJCh85EEdPenlsb2bk2egSsOYM6ouCj9zB1sZn2DO7nbNwsPUHh/Xctc83jSsLe0ioC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5259

On 07.07.2022 17:36, G.R. wrote:
> On Thu, Jul 7, 2022 at 11:24 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>>
>> On Wed, Jul 6, 2022 at 2:33 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>> Should I expect a debug build of XEN hypervisor to give better
>>>> diagnose messages, without the debug patch that Roger mentioned?
>>>
>>> Well, "expect" is perhaps too much to say, but with problems like
>>> yours (and even more so with multiple ones) using a debug
>>> hypervisor (or kernel, if there such a build mode existed) is imo
>>> always a good idea. As is using as up-to-date a version as
>>> possible.
>>
>> I built both 4.14.3 debug version and 4.16.1 release version for
>> testing purposes.
>> Unfortunately they gave me absolutely zero information, since both of
>> them are not able to get through issue #1
>> the FlR related DPC / AER issue.
>> With 4.16.1 release, it actually can survive the 'xl
>> pci-assignable-add' which triggers the first AER failure.
>> But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
>>> [  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
>>> [  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44
>> Since I'll need a couple of pci-assignable-add &&
>> pci-assignable-remove to get to a seemingly normal state, I cannot
>> proceed from here.
>>
>> With 4.14.3 debug build, the hypervisor / dom0 reboots on 'xl
>> pci-assignable-add'.
>>
>> [  574.623143] pciback 0000:05:00.0: xen_pciback: resetting (FLR, D3,
>> etc) the device
>> [  574.623203] pcieport 0000:00:1d.0: DPC: containment event,
>> status:0x1f11 source:0x0000
>> [  574.623204] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
>> [  574.623209] pcieport 0000:00:1d.0: PCIe Bus Error:
>> severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
>> ID)
>> [  574.623240] pcieport 0000:00:1d.0:   device [8086:a330] error
>> status/mask=00200000/00010000
>> [  574.623261] pcieport 0000:00:1d.0:    [21] ACSViol                (First)
>> [  575.855026] pciback 0000:05:00.0: not ready 1023ms after FLR; waiting
>> [  576.895015] pciback 0000:05:00.0: not ready 2047ms after FLR; waiting
>> [  579.028311] pciback 0000:05:00.0: not ready 4095ms after FLR; waiting
>> [  583.294910] pciback 0000:05:00.0: not ready 8191ms after FLR; waiting
>> [  591.614965] pciback 0000:05:00.0: not ready 16383ms after FLR; waiting
>> [  609.534502] pciback 0000:05:00.0: not ready 32767ms after FLR; waiting
>> [  643.667069] pciback 0000:05:00.0: not ready 65535ms after FLR; giving up
>> //<=======The reboot happens somewhere here, not immediately, but
>> after a while...
>> //Maybe I can get something from xl dmesg if I was quick enough and
>> have connected from a second terminal...
> 
> Unfortunately I didn't see anything from xl dmesg...
> I wish the 'xl dmesg' can support the follow mode (dmesg -w) that the
> Linux dmesg does.
> Here I have to manually repeat this command. The machine suddenly
> freezes after the 'giving up' message is out.
> I see nothing special in the log. Maybe I'm just not lucky enough to
> catch the output, not sure.

If the box reboots in the middle, I guess you really want to hook up
a serial console.

Jan

