Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DF7564FE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564547.882033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOHM-0007yY-Ev; Mon, 17 Jul 2023 13:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564547.882033; Mon, 17 Jul 2023 13:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOHM-0007wC-B9; Mon, 17 Jul 2023 13:28:44 +0000
Received: by outflank-mailman (input) for mailman id 564547;
 Mon, 17 Jul 2023 13:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLOHK-0007w6-76
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:28:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7bf63ba-24a5-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 15:28:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8437.eurprd04.prod.outlook.com (2603:10a6:20b:3dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 13:28:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:28:37 +0000
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
X-Inumbo-ID: d7bf63ba-24a5-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXID7mp+5l1mKDQcxBTWKQPNouQPnHanWLKx1Y34j8aFSgJutcVgNeC1II+tmMBFxXICP+NuqkEdlOSX3VMgqYHpEnrSVBVGVvjpUC6ldSziPtLxTH/gzElGFGCytzI/owyI/TCkmNxRcVlaj9U6zkwH9BrRpdkp3xy8zBfhGvOuXr00COmfFbv1cWRKjK0aQV5+Ns3JGD/Grti128Ba5pJwodA+EIVpxw9/LnhhBiI8SHy9b1krsV82q/PV9XcLqWCuJek0hLfaz6RbgiWSnsXZJ7Xuw2IhmCr9cSUNQyJqIE+FBXIIwp6zEOSjrUKXNqJTRiu7orOMnp0EvGdT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/HE45oGB3HWWTTSd4kpzuJKOLzZoQZxXNOEKT/VmU4=;
 b=Y5fxWJTUSsFdJ3aC92SwUTuY2+dap5AWwNAyqnvZe3/PgKnZWxVyfD5vNKJSxXQh/aw/zj73Wi/jiJlcDvHEjF8xG1JjrNcorkj0Rafg0eeTHcgmhJ840Ysyz0ANLS3i+/r0wJuZCKaYcB97zg77oybyJ1dIjZP+2DonUKG38Dj202AdRNCaWSbGJcRHCPohQFrq4wESBtDpdWKKhND2v9bIyZonbKKdGgc1dv3W/CQcvJvu5rlWlzmEkEeYxeUxHcTXm0Z0ovEtYKjY0biCi5OnNzo4wenRcxZjHvDL3B6KXY+BqdhfXwifl9EhixTkbrJ3cHq8kdvW/F92029RSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/HE45oGB3HWWTTSd4kpzuJKOLzZoQZxXNOEKT/VmU4=;
 b=LsE+n7NGQCATgqzMeqvQEZq/v2H0HoEf8PQISj8bobp9281VYY795SK8Za9WF0L8qFpjRnh/5ds39vZVVqMfHDtfUPB+7mMq1KQuRWynQEEc7u+FnaPFypFgWt5c27RNaUCohLDaYYnbzMwllyag6COiJvAah53iqt5PVgVu8S3tC6SAxqD6HmXSl6oSspVIMJCrv5gbiQeMXUADZc7iQONUOfhzHplmbetDg5R7SOg1IGDx4KqkUT+HB+itf1CFwlyL91AW4Iq+Gy3nreSxg5D9UTism2tcibD4EIxdsoh7l2lt/J4Dg7wJ46jWWFVYotOqidOE/raF2nQHO8HxYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76bf2955-7aed-dc6a-a5ea-4dd68064ce0c@suse.com>
Date: Mon, 17 Jul 2023 15:28:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/HVM: adjust pIRQ calculation in hvm_inject_msi()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
 <ZLUdTB_gZjRzhpJe@MacBook-Air-de-Roger.local>
 <f254729d-1b6c-8aaf-98d5-c1b739519081@suse.com>
 <ZLU4deYP4lwVYpFs@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLU4deYP4lwVYpFs@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fceaaaf-926e-406b-0ec6-08db86c9ba5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d6mP4UDaIuAQJDAmb4kzr23gwRl7DMrMUhu2jx0nAsPbMx6xQBcFH6f/5Qwv7x0iAh17it6qbTFrweqDhMUkOc+IPQgr8a07Sf8xgHua4RlovIZLh9S8c2x+QmuimMNvpdphSxnZPOjzzT/UT1QVNVxJe8bYIGOpJYwCv4aViZxYPssFyb3Zt2yNnQZTL7pW1HLCbo3d11tEQCnuAjNeC3/+qQ8VgdW682+6AOulFb4ceDrp213hO+G7i5vmWv53vkjR6uvG5vMYOHGAt7sf80NQzjgzMDed9c/+hcR4k8aX5Jy29qFEVwhXnL+ueD2KSZTl9R8ZPVEULJeKbF+2H5OtEreB1bcxUTbBkuh/hghyvkRP44EKHntCW4e8VyRK1LRyVrn8ykPE861SmYpPxpAAuJZxM53r2DdXFWJfQhnxK6sidFmmIOE1AIAkmuoul3eLTSzbaGHlJu6/b2EPjFY+1hq76phShXNg/cWveSuhYG3WkQGr9F2lIU0fTkeO1Yo4hLcPKH5yu+69r5vAIqDlDFTcb4NElBwaO8N0a+RpmA0FHhZ4m5qT+6zI7p3UIHorQ0IMRa07pcMgjJWoNiWtUwwu1wECHoToH+FkEGZ4hpY0FoKkdUcXlPF7UWjx34+KZIAnrr7OAmvmPNkOfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(36756003)(31696002)(38100700002)(2906002)(478600001)(6486002)(41300700001)(53546011)(6506007)(26005)(54906003)(6512007)(8676002)(8936002)(316002)(86362001)(66946007)(31686004)(66556008)(5660300002)(4326008)(66476007)(6916009)(2616005)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2J6V1Zsc1hpZG8yZFFSZHMva0wwSmxYa1g2cDg3QUxBSFR2QW9wN2FGVnRi?=
 =?utf-8?B?UmJsT0thUXk1bXQvLzNsK3RwbjJCbDFUQUR1VnVSNyt3NlNaM1pDRnVyc1NF?=
 =?utf-8?B?ZWgramRON0tHL0xzS2FDL3I3dHdPeTFPbmlaZTVOV0Z4QmVldjNnYUFpTHVu?=
 =?utf-8?B?SnlXN1BIVG1MWUxLNVMwTkVWYmpQQTd2L3oxUWdsYUpwVXJtK1Q0Syt5ODBD?=
 =?utf-8?B?NlRjOUR1QitFKzRwaEF2bmNmYkNiSW05ZVJCcDNrdkxmc0FEeXV4blNIVllX?=
 =?utf-8?B?VXJ2dHorK2JKY1o5WVE5WUFSY0padHMyaUpIeDRqcjVTMnMzVWN2SkM1MURa?=
 =?utf-8?B?bGltUnExUmhVZE15cTJIbzZ1dkhQT1JtTTVCSWJWQXB2SS9DNXB6TWhqYTJz?=
 =?utf-8?B?b29PZUw5OVc1b2FKVnFEaTJHQzJmNFVKWTFNdzBLY0JQRjFLQlNGR2MvVEQ5?=
 =?utf-8?B?UUV2d0RoTm5zYUFuZEQ3RVFqdG9oOUxST1dKb2ErUFBReis4cVFPUXAvYUh4?=
 =?utf-8?B?dG45ajc3Tk1jZWRZNEI4QWd5UFQ1cWJLRFZtbEFnMnIrMzB4VEtONHdEUHdy?=
 =?utf-8?B?NzdCWVc2T1VZc0VWVjlranp1Tlp0ZllpRlMzUkYvTFJ0YjRCcjg2YlNBMTJI?=
 =?utf-8?B?NDVjM3FwbC9HcXV6cEVsVnBYMDFIQjZRa0N2NnJONkhQKy96WjJNSm9yOENr?=
 =?utf-8?B?SDdsUnE0SVpXczJSVnR2VU1kdFg5THM5WG5ld2w3dHlEa1NpcDU5dmVoMnhl?=
 =?utf-8?B?cTJqR3pwZVQ0cE1aSW51d25EZFhubnR0QnBSb0VXNmIvaFdnTUJXR0dVWjB3?=
 =?utf-8?B?MFh0cjhxcThkY0pUci8rOE5DTW1hL2NSQ3g2aVN2aXNNMlFPSDRIWmdnNHhG?=
 =?utf-8?B?dzIyRHR0RUdsNDFkaC9uNFI3VlZmcFhKYXFoeUFoaE5GamRETEh5Z0lGK0NQ?=
 =?utf-8?B?MmI5aFNIWHROZmNrZTAwS2ZWWWg0RjQ2TGJUWG4zWnRuZk1OWmRuTTVVY3hD?=
 =?utf-8?B?bmV1L25hTjRjRzBDMmpNR1c1dVpoelFmQmZyLzhUeTV6eUNUaWpPVUlJQmhR?=
 =?utf-8?B?bCtjRkRiUXJMVkczeDVyL2ZHd0g4Y3B2bzFrdzNveUtlZWlYT3Q5Z1pqTmZu?=
 =?utf-8?B?ZVA2MzVuTnZjaDE0MHJ4SXp0WHF3R3NtS0RYeGtNaU9kelVvdGFpVG5iNWdG?=
 =?utf-8?B?RWhPZU9YTzRhZ1pQTHBIMEZ2UnFnamwzbFpNNTNSeFU1VzBlbVJaU1ZNZFV6?=
 =?utf-8?B?aVRyZEJ6dUZwOUhkNVpTa2tyQ0J3V3JNeURSSFk2dXA4dnNPWHRQc1ZLdkpE?=
 =?utf-8?B?RmhobzFneUt4dmJBdzdTdUNpTm0veEdwdFVnNWxnQ0tNU2JPY3hwcEpLOVVW?=
 =?utf-8?B?LzdDWVR6ZjQzSmQ1bU5wZlNoRnMvTnlmblRlcGVJeURpTVUwRDZzbERzc3l5?=
 =?utf-8?B?ZlMwY0M0UzV3QkVkNG1KdjF6QU91MHF0N2RFd2l5SjlsUEgyczRwKzh6Ni9K?=
 =?utf-8?B?SkFuWHEzb3Q5ajdpcS9VUW1nOGkwUU9XMVRRNFBnRDVxOTYra1d3VmpraWUy?=
 =?utf-8?B?VzQvTndJUVp4OGpDTlFQWXZhMXYzSGJYMytDajBuVmQ4SjhCVGJuMTU5N3ZO?=
 =?utf-8?B?ZGRDUHVaRGhFOGNUMnNmamtkM3JpcnVxT2pnUmFWeGVqbGJkdmpQN0xaTG1U?=
 =?utf-8?B?SmRlWGJpcXhIdzZ6bDNkbS9zN3RER1k2QkJnam43WlB2QW5YK29nRVI3c3oz?=
 =?utf-8?B?TmNVaE52bXFQQXJMdUR4UHcvVmcwaXZJa1JCOWFsUDcwWU5oYnZvSzErazJj?=
 =?utf-8?B?QkdubzBtTWZRdXNJVHBUVnA1SkZIOUtHRGwvVXZGanlrc1BNMjNMTTUrL2sy?=
 =?utf-8?B?WHBYNWM1YXhtUzFRVE9OU0Z1SzNWV1FxcjZjU09DZlE3U2dVdm9tUURRYWQ3?=
 =?utf-8?B?cENCc2xpN1d4RllIUnV2TkI1SHg1RzJTc0Zoc1dsVDQ2Y1h4eWU2VzMyNWVu?=
 =?utf-8?B?M0Y4c2J2NXN3ejZNblFWL2o0Zjh4enh5YkwyMlBwSU1Jb24yMGtVYVYyZ1BE?=
 =?utf-8?B?c2RhdzQwTlBNM3djSWF3bERLYnU5MzE2TWZIZDFzZ1VDR3dZeE1WSDZXK2Fx?=
 =?utf-8?Q?E64CvVpiTg5L4zyHL645LI3AH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fceaaaf-926e-406b-0ec6-08db86c9ba5f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:28:37.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+73r/qIK40FWiZF8qr/q0W1Gvf+u84DkZYv/MYgJIOs1fRyMzkg1I37lyicEDLoVh9nqrLmecM+Wlds4me0VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8437

On 17.07.2023 14:47, Roger Pau Monné wrote:
> On Mon, Jul 17, 2023 at 01:49:43PM +0200, Jan Beulich wrote:
>> On 17.07.2023 12:51, Roger Pau Monné wrote:
>>> On Mon, Jul 17, 2023 at 11:31:57AM +0200, Jan Beulich wrote:
>>>> While the referenced commit came without any update to the public header
>>>> (which doesn't clarify how the upper address bits are used), the
>>>> intention looks to have been that bits 12..19 and 40..63 form the pIRQ.
>>>> Negative values simply make no sense, and pirq_info() also generally
>>>> wants invoking with an unsigned (and not just positive) value.
>>>>
>>>> Since the line was pointed out by Eclair, address Misra rule 7.2 at the
>>>> same time, by adding the missing U suffix.
>>>>
>>>> Fixes: 88fccdd11ca0 ("xen: event channel remapping for emulated MSIs")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> I have a question below, but not related to the change here.
>>>
>>>>
>>>> --- a/xen/arch/x86/hvm/irq.c
>>>> +++ b/xen/arch/x86/hvm/irq.c
>>>> @@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uin
>>>>  
>>>>      if ( !vector )
>>>>      {
>>>> -        int pirq = ((addr >> 32) & 0xffffff00) | dest;
>>>> +        unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
>>>>  
>>>>          if ( pirq > 0 )
>>>
>>> I do wonder whether this check is also accurate, as pIRQ 0 could be a
>>> valid value.  Should it instead use INVALID_PIRQ?
>>
>> I think 0 is okay to use here, as the low IRQs (at least the 16 ISA
>> ones) are all 1:1 mapped to their "machine" (i.e. Xen's) IRQ numbers.
>> And IRQ0 is always the timer, never given to guests (not even to
>> Dom0).
> 
> I'm kind of confused by this not being dom0, but rather an
> HVM guest, so pIRQ 0 of that HVM guest should be available to the
> guest itself?

pIRQ is a Xen concept; Xen assigns them, for the guest to use them in
(e.g.) hypercalls. As long as Xen hands out 0 only ever for (guest)
GSI 0, all should be fine. That said, ...

> IOW: the possible values here should be the full pIRQ range, as there
> are never Xen owned pIRQs in the context of an HVM guest.  One further
> limitation is that even in that case pIRQs for (guest) GSIs would
> still be identity mapped, so GSI 0 won't be a suitable pIRQ for an MSI
> source.
> 
> The usage of pIRQs here even for emulated devices makes me very
> confused.

... I'm with you here; I'm not convinced this logic is sound.

Jan

