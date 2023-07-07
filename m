Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC574AB3F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560180.875880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf8w-0002nk-9h; Fri, 07 Jul 2023 06:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560180.875880; Fri, 07 Jul 2023 06:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf8w-0002lG-6B; Fri, 07 Jul 2023 06:40:38 +0000
Received: by outflank-mailman (input) for mailman id 560180;
 Fri, 07 Jul 2023 06:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHf8v-0002l8-06
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:40:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d849ad2-1c91-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:40:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:40:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:40:33 +0000
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
X-Inumbo-ID: 2d849ad2-1c91-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c43F85XB/K6O+ktcIpCPrOCqfndyd6iwjwIpCp9x9EKk2h/q0X285Hm3l+rASCU8BfJKe7T6Ux/Wuwzg6NOcl48nVn0MSSvirqgLqql6ZVNv+lnqvbpuhAtFkNve+k1w72QM/Jt0K6e0jEL1q7am5Zm89WAzXB3RO7uElXAdKfOS71UTL9705ZsFHtrz+ZLJxDMzbO0ukzb/Y4wW/zNL0+chayw3jS0LaqdTupmdvm6RL2sGwsqUH5DbKynrMYG9Zf11zWvTo0DJ90B6Xv0QRpE4Hjv6H387qBFWYKe3En4yBNGeMQBuio0Bz9MeFsxxhMxfZqJUqlCLYAcP4kRifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlzV2EmP1qtPhJ8DoYMKNaP1aQPvRPicklhflKj4VMQ=;
 b=HR9lpvqT+naM0Q5BzaTSPUMUBge0jOyY9awqcS4lMaSsJIqYGh+JkGAV+eYMi3g/cuIiSWlBSMh3rdEMkwsIaXbB5zbGlORO4Ke5tg7AGc4fejs80lYj53ZijOmFEL2QyPFhjGb14AVpH0kxcGL5ZTt24+23uo5S21XiK5TQAYeVtlN70Z4Hl5k2equgpd49UdDr9d+2yrhksFStbB3qIjW38C1D4uYaVY5jlqSDkT4os2kwgOXjyUHe63JVdqtXGTXT42CIg4w3fOjuTh0ekMySJsUD5S330+E+zVq3sOG7Hc3VL5JxE9AY/SIyp5ePMIrNVlLrOyQuk0LOQIcpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlzV2EmP1qtPhJ8DoYMKNaP1aQPvRPicklhflKj4VMQ=;
 b=aN31WeB7c1GWIP6V73lqEzITXYps60afzTJWxspqh1Z8yogBvW2uyIqLhrInpEzCcGzyufyTr81dqCysclcS5Zz1KV7N3Isc5Y7GJGzDIONkxKHdkytje8Lg7Y/ibOm2HPZ2uWBLhkk+iskMtuxEN8y+/Sb03QRRmLr5WWsH4ZAtNG1HdUAvMrehZj6cVrk83kaTeJIvpOIH4CRbtLF3F89tsPehG9u97Fxx6vy0aB7yKL6nGow0DBh2PoJiOKT+XJSIpVuewvr6T/5fVhu85xBEycN82frIArOqpFVKLp3WCkRtP22k5G61fA4HdPSKUMdlbsFWilFxRSJvwPSLhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6fb3b99-d59a-eceb-024a-8b791ef20129@suse.com>
Date: Fri, 7 Jul 2023 08:40:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
 <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
 <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop>
 <2c7d71cb-067d-8dac-3ee4-3af42b2756f3@suse.com>
 <alpine.DEB.2.22.394.2307061506560.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307061506560.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: e4fc0e3d-d9dc-4ea1-8b4b-08db7eb51020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	unmAbOcxn3RyJJDYgD2wUsdaDXkWF1hJTZwVb+lWBQm9yKGO+ctrdL3S3wWY2Q9KSFIHNqdb6kbY7yGeX64dfxYHCZgjfM9Il2zXEoZ2KzN73wyClYsTKUAw2Ly/k0qcgsOIqO9ofBq8Vt1uZHOFLg7uJpRoGge/j6/wQ54fMQSrdFxwm9374GDWVzvvWzVAKnm62PKnhto96Qv/IBszTiSOh7DOJwdY0WvXWk/Zghi6oganFBXp4YIJ04hW7GmCWn4Zb7Ovb8Fzwu3xIeaS/wsxHbeIuZ5CSPzak2ICGFeYmRTM8jZVjqA4PL7pQHediiruKjGSJUfsT4424oXEYxd6lpfITGKT71qVSJrvNvnvDtC+42SJJbjxi1QQoE0yI87snIYI2+pjZP72V/28Oy/vGLTmZAiATbJi5/PC0zoxZSrxW39Apn9PeUPjDg4qTpsvsS32WHbjhZ2eBWcsOldknAj1IPGfQibbY+alcPImTt2x+hqm8R/QNpooXAcM2QeguAiXy38wmUTcrJO9j63dM/5W3pEtG2o8BSHAM4zGCr/GBl2NMM+qvSUQ7pyAn5kihRXqwWTw+efImUjfS5XsSZESkT7nuIB1j2Qenrm5XvVfaS6+Pg1NXUKKs8WsXZkM028hLBdM0yUPhQxgzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(31686004)(6486002)(478600001)(54906003)(83380400001)(2616005)(86362001)(31696002)(36756003)(186003)(66946007)(2906002)(53546011)(6506007)(26005)(41300700001)(6512007)(6916009)(38100700002)(5660300002)(4326008)(8676002)(7416002)(8936002)(66556008)(66476007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtwbHpxT3JNbHFqR2xNV3MvcW1HUWZWNDU5OUd4aXZkWDZqaFZhNDhZY3pN?=
 =?utf-8?B?bjh4dU1PSWtSVE9ZYnRxRVRUUnJIZ05vemJYL1ZYRWxVdFA4TlFMZUNLM2pa?=
 =?utf-8?B?bldlaWQwbHRacG5SSWpNNVB6NUZUSVUvajdnOVEwb0JsdWNFWlJPWXo5M0Fw?=
 =?utf-8?B?SHR5a2JNakROaGNVb3owZTc2aFpPZUFDQ0VhWGtSaWt5UTR2V3FrUDh0Ui9C?=
 =?utf-8?B?RmpOSGZWZklwOHpzWU1oVjYvNS9pZjhpTlZwZk5PR2JIOFcyL1NGd1Ziby9R?=
 =?utf-8?B?WHJ4Q24wK09UVmMyWGZTczM5U1g5NGVMcDJuVGJlTTVxZ2tYSjZlQlg2RWpq?=
 =?utf-8?B?TkJ3Q0tYcEpsRlpMYm5nUG5nd1YyQkJ2aC8wRW05eEJXbDVXanVyUFgxRyt0?=
 =?utf-8?B?Nnlvd3F2Mk5xNDBiOW9sOFFRUURpSVVwQXVycGdMb0hmbmpMVkkrRVFXbjlC?=
 =?utf-8?B?SUcyc2hPejRHVXVSMXpGdGRzQWRrRklFYnJhTlIySWdpMjRiV21oNUs5Zytz?=
 =?utf-8?B?M29VRlRlU0FJZytxa3RWTzZEdXEybVZOTjVRNDUzN3FMamNHTlRtaVFYd2JB?=
 =?utf-8?B?S2twZjhHVDhYUXRnKzFzL1lkNW9aV3JZZDVBY2dRbkhFaFBaZ1RramJ5TVU1?=
 =?utf-8?B?ekpSbXkyL2JVcUI4RGhIRWEyK1A0UjFSSG50cGNrTVhWZ3NsWGo2ak5kK1NI?=
 =?utf-8?B?Z3FoWVNhMDdZMk9jd1BnU1dKUW9vRENpb25PUTk4djRjWGFMRXJJSVJlcnl4?=
 =?utf-8?B?NHhNTlkvNEh3aUEvYXNtYi9GN0tmM0RhanNLY0k2TGI4cHA5anlweFR0bnoz?=
 =?utf-8?B?czFjTStnN1JpRkJFSlFwTnVUMFN5b2JPc1JOYkVkSDFqc0JXZ0F6cmMyOGlH?=
 =?utf-8?B?UENQbURwL0FUNXhoM3ZwbnFqd1VLZ0oyWWlGUnRGQTNLaEF6TmNWZEp6Kzh5?=
 =?utf-8?B?d2trSkN3L1JWTjhzNVlQdzlxMENTRVJLZzdLbVlwUitiYlBOVGR5SUMxdmFu?=
 =?utf-8?B?ZGxyU0RkT3gvV3g0R3dMMmZaNDc1cnVyaHROUmZpamZxNGE0ZXo4TXI5cWRy?=
 =?utf-8?B?cDZ3ejdEOGtzWWMrcitlbVFGVlRjUk1lV2dZSENkRHdvS2VqWFd5YmprQ0NH?=
 =?utf-8?B?QXprVXlvTzN2YnFIUTdaU1B0OUJXUktYSTVXWmlWT3ZLRzZRV1ZMSUpOMDRl?=
 =?utf-8?B?L08wZFhqTlJ0L2hNOVE4NS93cmhyam9MaTZLUlROZzJhNXJUY0tCZkY1MGRu?=
 =?utf-8?B?UjBhRlVqaGdOOXhGQkRkcWVmd21BMmJySWU5VlV6eXNEZis4dWxVM0pnVHll?=
 =?utf-8?B?Y2JvNFRXZTg4MFlPS2JKTUV6bUY4Um5JSGcvUkExRnkzUGk0d0NMY241NHpB?=
 =?utf-8?B?TzN0NEk4ZGJ4bzZoek4rM3V6V0kxSE9GN21MQ3RIeFVxaFRhendIUUhtYm80?=
 =?utf-8?B?cXoxbHZEcVBUd0kyRFc3UFRRbm04ODhIVXdmUE5uK2V3VE04TTc4eXpVV3V3?=
 =?utf-8?B?dTZxNTRlckViTVFIckUrVFh2K2JZUWJ3OS9qdjU1eDl1WE9WTlNQVjMzcDk5?=
 =?utf-8?B?NjBCK1ZJdldMNDZjdUMya3g4QWJ3dXJqTDlYZGNidmdOZzJUZEVGVHVYSzJu?=
 =?utf-8?B?RXkxWit4Y3N0R2ZSK3FIZFY3S1F4Nno5K1ZhZE9uY2JYV090OUkyc1NYNkgv?=
 =?utf-8?B?YjFROERmM2Z1bkR2eGsxK002WVpNczIyVE5BNllVd2syVVRGdmoxUjNEdUt1?=
 =?utf-8?B?dU9hbEVFbHA2VFBqclN1T3NwMmVjYlZKMFUzbUVjandBUWF2QkJCbHA5WmRv?=
 =?utf-8?B?UlpHS2FOUmswcXFwSDR2SThWY3VTRENuT3ZYZStwdXBoRHZxcXIvOHJIc2Fa?=
 =?utf-8?B?ZWxKSnJUeENua2JBYU0wZUVWSG5zQjFlVjJocnR6dXpEMnExc25pSEVrMWEw?=
 =?utf-8?B?YWp1M0dZRVBBUnE3Qms1MFpuM0F3M2tNWHRaOHBSQ3NNR0gyZ2hSdDQ0cndv?=
 =?utf-8?B?dDRvaVNEa21GNElwMjhFYnBGMGN3UDd1YlVOdTAzblZQcGM5Mm1UcEh5d1Mw?=
 =?utf-8?B?U1VHOEF4eWYveG5yUjVodi8rMXJDRVR5VFRhU1ZBWVdndVBrUUY2TVptWVhJ?=
 =?utf-8?Q?lK33CQMXBgcLKMkWeLe5dOQ5Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fc0e3d-d9dc-4ea1-8b4b-08db7eb51020
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:40:32.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA+ZyMKXsf3CSM7b9E3L2MmFUOrCOsTvszJ3faWkQ1+iWpqb/qLvWbJPQILxFLWCooUIHCUA7e+sor71ZYRqaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On 07.07.2023 00:29, Stefano Stabellini wrote:
> On Thu, 6 Jul 2023, Jan Beulich wrote:
>> On 06.07.2023 01:22, Stefano Stabellini wrote:
>>> On Tue, 4 Jul 2023, Jan Beulich wrote:
>>>> On 04.07.2023 12:23, Federico Serafini wrote:
>>>>> Change mechanically the parameter names and types of function
>>>>> declarations to be consistent with the ones used in the corresponding
>>>>> definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
>>>>> declarations of an object or function shall use the same names and type
>>>>> qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
>>>>> prototype form with named parameters").
>>>>>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>
>>>> On top of my earlier remark (when this was part of a series):
>>>
>>> I am not addressing specifically this comment. I am trying to build a
>>> common understanding on how to do things so that we can go faster in the
>>> future.
>>>
>>> In general, as discussed at Xen Summit, in order to successfully merge
>>> large numbers of changes in the coming weeks we should try to keep
>>> mechanical changes mechanical. Separate non-mechanical changes into
>>> different patches.
>>>
>>> This patch is large but mechanical. If I understand you correctly, you
>>> are asking:
>>> 1) to split the patch into smaller patches
>>> 2) make a couple of non-mechanical changes described below
>>>
>>>
>>> For 1), in my opinion it is not necessary as long as all changes remain
>>> mechanical. If some changes are not mechanical they should be split out.
>>> So if you are asking non-mechanical changes in 2), then 2) should be
>>> split out but everything else could stay in the same patch.
>>>
>>> If you'd still like the patch to be split, OK but then you might want to
>>> suggest exactly how it should be split because it is not obvious: all
>>> changes are similar, local, and mechanical. I for one wouldn't know how
>>> you would like this patch to be split.
>>
>> So I gave a clear reason and guideline how to split: To reduce the Cc
>> list of (because of requiring fewer acks for) individual patches, and
>> to separate (possibly) controversial from non-controversial changes.
>> This then allows "easy" changes to go in quickly.
>>
>> I realize that what may be controversial may not always be obvious,
>> but if in doubt this can be addressed in a v2 by simply omitting such
>> changes after a respective comment was given (see also below).
> 
> So the guideline is to separate by maintainership, e.g.
> x86/arm/common/vpci
> 
> Also separate out anything controversial and/or that receives feedback
> so it is not mechanical/straightforward anymore.
> 
> 
>>> For 2), I would encourage you to consider the advantage of keeping the
>>> changes as-is in this patch, then send out a patch on top the way you
>>> prefer. That is because it costs you more time to describe how you
>>> would like these lines to be changed in English and review the full
>>> patch a second time, than change them yourself and anyone could ack them
>>> (feel free to CC me).
>>>
>>> For clarity: I think it is totally fine that you have better suggestions
>>> on parameter names. I am only pointing out that providing those
>>> suggestions as feedback in an email reply is not a very efficient way to
>>> get it done.
>>
>> What you suggest results in the same code being touched twice to
>> achieve the overall goal (satisfy Misra while at the same time not
>> making the code any worse than it already is). I'd like to avoid this
>> whenever possible, so my preference would be that if the English
>> description isn't clear, then the respective change would best be
>> omitted (and left to be addressed separately).
> 
> Yes, I think that would work. Basically the process could look like
> this:
> 
> - contributor sends out a patch with a number of mechanical changes
> - reviewer spots a couple of things better done differently
> - reviewer replies with "drop this change, I'll do it" no further
>   explanation required
> - in parallel: contributor sends out v2 without those changes for the
>   reviewer to ack
> - in parallel: reviewer sends out his favorite version of the changes
>   for anyone to ack (assuming he is the maintainer)

For this last point, I don't see it needing to happen in parallel.
Reviewers may be busy with other things, and making less mechanical
changes can easily be done a little later. The overall count of
violations is still going to decrease.

Jan

> This should work well with MISRA C because they are a large number of
> changes but each of them very simple, so I really believe it will take
> less time for the maintainer to write a patch than try to explain in
> English and more back and forth.
> 
> I think this is less work for anyone involved. Let's give it a try!


