Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE1D7D088D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619673.965151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj6x-00088z-UF; Fri, 20 Oct 2023 06:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619673.965151; Fri, 20 Oct 2023 06:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj6x-00086Z-RA; Fri, 20 Oct 2023 06:35:55 +0000
Received: by outflank-mailman (input) for mailman id 619673;
 Fri, 20 Oct 2023 06:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtj6w-00086T-9B
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:35:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea853bff-6f12-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:35:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.7; Fri, 20 Oct
 2023 06:35:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:35:50 +0000
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
X-Inumbo-ID: ea853bff-6f12-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgC9vaELtMSmbLiHWBWNvSmn1UV3cGi+w8deceBSoqyJkOnQuqxW8vevEjkm0dtSZrbWVHg6YHnDlBSLAtok13QdxXv2MbVw7lvRbVo6nKIZdD/LB+IxeDlo9Twrxnsp+HvN86oRjmtPkjyTvnPIUsC2fxn/R/udwSst3FzEK2rC3x8ERZJslqCimzfXL8vBqM2P9bDZKXOudHChD1gdfv0fH3bQWWeabMvZIDdlnuFwTwsbud4wqW0wHuNmkODL/+kGYYTn4BYFLytBnqhvHaC8QsP6T0EktU/anixd8gYPhU5ob5umQ7kSej+/VahjyYdyqEK/4KQoSBOMQ98+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6f2tYvHry2L4w9vq3Qucgn66j8enyLW3TNbGkOpySc=;
 b=ElcgNg7zhiv0CBJU+lRyW1M5tJo0L3Uqv+u4OxMtWptcf4/WIGWU3+/vC2JuqomfL3hezuEN9IZ3IcDZo17BVHefSAAe+2JM/Hxb39EQ4hHtHfFnAmeQgH9ioso3PY1wrFClfATnGehjnqySSWkMwPD2Qo1ZE3AkC5FgvdGztDFY6xuW6ECZk3Bgf55f8LcMoN4TFkGfreqHPTGw12BjgabWylrpxpWflUsJbQ/YxjWGdwE/IzBR/iapGstcgxJI20/JJ0u7CLJUiR+DCwn94cR6LHVnQ7DG/GV2vVGVL3gl1ekPz2OgJAiWO5kHqCW71/UrP3RpzgwVMVYtQwlpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6f2tYvHry2L4w9vq3Qucgn66j8enyLW3TNbGkOpySc=;
 b=W4ZvlqupI/QL1f9T4OqujiUfsVdvc1Z47noSE+S54L3O8m2fZvdPAX034MH+mbAgTN3Ix+xepK6dZIXvCVp063IxP+y4b1XYqlF71cLv61IbMKDkLkbnbz9SWW6H/lcNMn7e16I2K6jYOcD1aeykK9y0U5/NacE0xRUmfm9e8JbURfC5VAWM5iKPtfwjkW6VBzCSeEF0rbKsQO2T4Oslx/Ny/DF0YhNe/dAv+aVdnfXSpIav7fTBZvEngpFY3yptuzjuh9x6nnr3H6+mkV61/r6tWsV/c+tSfhylsmFJujYzakZMv5zfw8DUOpcduCgSGCmPyAvR38OndPkC0oNd+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <965cdb62-1b96-c8a1-733b-ad006bb2edc6@suse.com>
Date: Fri, 20 Oct 2023 08:35:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
 <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
 <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
 <alpine.DEB.2.22.394.2310190921020.1945130@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310190921020.1945130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 0283fa57-6074-40ef-5be1-08dbd136cd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zw2r7UQEO/eZTg/D4n9vg0jDEUk7Kk4/sz8iSejhyVzHFg+JMJV0P+LPVhe9GKovFmvWEN9XEe+/so3V2Cw4GrlNDgrNiF27wjSAabp99TraZj6GaP36U+ih4+lqIwy4Hd/odZp/7/nds6LwUhCrYKK4drP6MSga96neykc/1D4eBrdmo1tVQryrp5oiKOQZIMmnhJPAJf7L4ojFGQKaNfQwRfvM+XEv1ar9q99OHVGS2TOeHbgWqCXsQLwTZn8YFXCMMJugXnGlB86OZhO9mlymEOoda+lvI3DNSWZQ0evUkKPJdwH9yGslNh6dF+dYuJKtnu+MJEvQcgnJMHxnk3dJoAb/NAuODhjyEfbc3TCl0G+7eM7RoaMq72if7+bzoxoA8B2XYYs2hUT7xnu40SUQiDCPm74eUjYgSOB4Nxu+vcdQvvHMujkzHuCH4gxzPqHqyUTU9sfSFKuEDEL3uwY2gNoQ+liFyRUWzgD64elmkSHLp4vvqxCu+6orFdzAHPWEUEFDylQzQsUR5FdbxIORlFriwMjxz7Co3fwvQPa51z9OplTHqf5Z/6D7IQ8gsAn49Hi2mXZiO4/J+ABacZYh6DetlsgliuIiMZXm/J+PQ/KEdWq0mxxH1NcZehZyFDjj/LrC0ex83p71h88JbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(2906002)(41300700001)(6512007)(38100700002)(83380400001)(6506007)(7416002)(36756003)(8676002)(4326008)(86362001)(31696002)(26005)(2616005)(53546011)(66946007)(6486002)(478600001)(5660300002)(54906003)(8936002)(66556008)(316002)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QklONVJEazlZNU0yTmUwaW9jd25KRHBBa2Zxa2tPbUJPdFQ0SUpCZkRiaWs0?=
 =?utf-8?B?Qmhma05NaGRKam50aVZ4OHRkd0x3Nks2VHdybnUxSGJta25kMnhKNDBsaDNB?=
 =?utf-8?B?cFhtQmo4Y0FCS2FhYnRVL2M4bmovOU5Gbk9QTXVDZ3NtRDlBbDBqVVpHVTQ5?=
 =?utf-8?B?eG4vcFJrc3N6aGt4VzFmTC8zQURCMnVqY1VXcVV4Um9IM2NOZThWUVl6b2NU?=
 =?utf-8?B?VFRmZjRjYkdOWmFWWXZCdEJzKzRWRzdsQ09BNldxT2E4RWJ5QWFjanN5c1Jm?=
 =?utf-8?B?ejdwK3lYMHhYNVZWZHRXcUhVTTVQbDluams5a0dqVi9wbXptRjlSZks1QldI?=
 =?utf-8?B?clp2Y1FzbHYwZGI1MTV1c2VySkRQbjF0SzhtMmVQSlVzdEtCWlJjQ2pvZSsx?=
 =?utf-8?B?UXU0cFQrbEtUd0JGcjBCQ3VjMDAwMktaeTlxTXdRT1hBVHoxVUQyOGkybERu?=
 =?utf-8?B?RWVCZGxKM05BZUV6UnRMaWZ3L3VjWXZkSkpNcjYwMjY5OVMyOXNzYzhmaHY0?=
 =?utf-8?B?TGU3WXhUV3NiOFdaZWtrb25VK3YyRFcxRGNHeit2bUJ1Zm5FNHcwb3hWTC9T?=
 =?utf-8?B?ZmZZalRJSm9PdjQzVkRKeEdoL2FkNTV0L29GTlF3a2ZuUzE3ODFQVE9USFVl?=
 =?utf-8?B?V2tHd0twdFFxM3VyK3ZuUXF5U1lURDY3QUp4TjRHeEVxR3J6REp2VkhRNm1U?=
 =?utf-8?B?c0hIZzlrNDhJS1JVajg5eHZXYWFSejFnakFYN2ZOTVpYOWZvbzFpNHpHRkNS?=
 =?utf-8?B?WGFZOVVCak5UQWxUN2hlcDljSmNKclJjZU1TUm5BRnoxYStKUGRIbXJXdVlE?=
 =?utf-8?B?bnRlZ1dCYkIzalZTSnFyWHdKNEt6TVdTSzhkaVo0dW1hbzV1cml3cWsydlZV?=
 =?utf-8?B?UFRRKzRMY0RjbUwrNDdCektXQzRaVzRjdnBQUEhCZWU1VjdWR0l5N24yVWda?=
 =?utf-8?B?S1lsbmhoNmdUZlhYY0JkK0laMHFNVXlpNTE3UGhHV0k1QkRiMnlreGVXdnVT?=
 =?utf-8?B?QWF1bmF6anczNTJqc2xCVFpubTJBdVVsZnpFNWpOemIxOXYraFFCYUozWVlG?=
 =?utf-8?B?YlIvSmtlUWNIaGpObGdmUSswNFhxOGVtWUM1c1FydnczRVl5NnU0NWsxNlFm?=
 =?utf-8?B?TXdaN1NtUVZxcllLRHo3K3pid1FKQWI3R0kxbytIa2N0Z3dIOW1EbkpTYWdn?=
 =?utf-8?B?VDU1U0RDREVra2lFRHcvMGFKVWhtZktzakVQb2Y5Qk14bnkva2RxdDJ4QVJV?=
 =?utf-8?B?RkhDbEVScWx2Y3BtZjFucExKS3Ayb3dLZGM3Z3l0OFhOOG05TGxZZEl1WUhw?=
 =?utf-8?B?WkMveFlPQ1NiN3RPSVlmenpKMk51cm5TUVpMZ05laTg4K3hNcU8rM21aQUta?=
 =?utf-8?B?SVozaGRqMUFsRHNZK0h4M0hmZm9mUFk5c3k1cHlYTjZZVXV4NTdOT2VFNkUr?=
 =?utf-8?B?Q09RMDBxQWdhS0tDWXVRMmhtOEhxK2R6RGFFamQvZCtrZ3lwendyWWpjYjZu?=
 =?utf-8?B?dmVYWk1SYXR5RDJPTVprOHY2V2dXaEhvMmNjaU55RXY4SXpIQnpRUTh1NHZa?=
 =?utf-8?B?dmRGWjZrcUFFOU9xcS9Tc1QxV1RjZnNwdFNxTExWUFRsd2VGRERUMU14dzh0?=
 =?utf-8?B?ZVkzWjV0WTB3b2N3UW5KSHR0Qk1Sa2I4WDVTU2RJcnpHNXFzUGpuVVBUZ3FM?=
 =?utf-8?B?dWhtMUpZZXA4cFVGWE1IcmdkMkM1Q0o1bm9YRThIY3o1dE9wTDNOOEp0am5o?=
 =?utf-8?B?aHgyM2VPVjJwaHhyMkJmWVVNbGdwK0NzN0dXZ3ZCd3Z2VUgwbDJkaUZOUVBO?=
 =?utf-8?B?R3IyVnQrQ0xQUVhuYjVXZXFoRDNhWHMvMCswc1F5Q1QxM0taMG5aWWVVZk80?=
 =?utf-8?B?NU5lb2VXOERndDJQMXBqVTlmbGtrT3c5Ynd5VlFtTjBaMDNlV3NiaStXTWhC?=
 =?utf-8?B?ZlJ0amRnbDRCRS9rUm1LbzJVVDdnQU5zVnpPUXkxcHg0ZFo3am43YWVrZENJ?=
 =?utf-8?B?VkZ2OTRIODZFZndMRk5neG9QbHh3Sk1nR2hXaG95Z2IxT0h5TUdwUVZFSndo?=
 =?utf-8?B?UmVqVUlPc085eXVsOS9zMTl5cmprMDZFNDhrdTJCMkV6aEViVndLcFRPRGJT?=
 =?utf-8?Q?uJVaxxGVHUcPzpd10cCxDIF3g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0283fa57-6074-40ef-5be1-08dbd136cd35
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:35:50.5423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r35O4T5dOmJClkeuG7qzmxEPVM87buRUt/5XXcjgxgB6JwLR32miOszrYfDl4TZg9XRTYe7GWkThmVpA3KUbQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

On 19.10.2023 18:26, Stefano Stabellini wrote:
> On Thu, 19 Oct 2023, Jan Beulich wrote:
>> On 19.10.2023 00:43, Stefano Stabellini wrote:
>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>> On 03.10.2023 17:24, Federico Serafini wrote:
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>>   * a problem.
>>>>>   */
>>>>>  void init_or_livepatch modify_xen_mappings_lite(
>>>>> -    unsigned long s, unsigned long e, unsigned int _nf)
>>>>> +    unsigned long s, unsigned long e, unsigned int nf)
>>>>>  {
>>>>> -    unsigned long v = s, fm, nf;
>>>>> +    unsigned long v = s, fm, flags;
>>>>
>>>> While it looks correct, I consider this an unacceptably dangerous
>>>> change: What if by the time this is to be committed some new use of
>>>> the local "nf" appears, without resulting in fuzz while applying the
>>>> patch? Imo this needs doing in two steps: First nf -> flags, then
>>>> _nf -> nf.
>>>
>>> Wouldn't it be sufficient for the committer to pay special attention
>>> when committing this patch? We are in code freeze anyway, the rate of
>>> changes affecting staging is low.
>>
>> Any kind of risk excludes a patch from being a 4.18 candidate, imo.
> 
> I agree on that. I think it is best to commit it for 4.19 when the tree
> opens.
> 
> 
>> That was the case in early RCs already, and is even more so now. Paying
>> special attention is generally a possibility, yet may I remind you that
>> committing in general is intended to be a purely mechanical operation?
> 
> Sure, and I am not asking for a general process change. I am only
> suggesting that this specific concern on this patch is best solved in
> the simplest way: by a committer making sure the patch is correct on
> commit. It is meant to save time for everyone.
> 
> Jan, if you are OK with it, we could just trust you to commit it the
> right away as the earliest opportunity.

If you can get Andrew or Roger to ack this patch in its present shape,
I won't stand in the way. I'm not going to ack the change without the
indicated split.

Jan

