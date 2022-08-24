Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCDD59FA15
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392528.630941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpcB-0003hM-VO; Wed, 24 Aug 2022 12:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392528.630941; Wed, 24 Aug 2022 12:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpcB-0003eK-Sc; Wed, 24 Aug 2022 12:36:11 +0000
Received: by outflank-mailman (input) for mailman id 392528;
 Wed, 24 Aug 2022 12:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQpcA-0003eE-Hi
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:36:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150081.outbound.protection.outlook.com [40.107.15.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51eccc4c-23a9-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 14:36:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Wed, 24 Aug
 2022 12:36:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 12:36:03 +0000
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
X-Inumbo-ID: 51eccc4c-23a9-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM65PopIy3fjoTxYYJ/Gvba3T/KzN5fL7b/uLDRtKNxmvggXT4kmySd6d7gf96QGQwr/f1uZwqHW2DcEnUDI6/T2k2DA1bIa1/IetylcD8TZgK5DtfoLze1/xVRkCZGIKIitQyc8xplPaVIoFjW04qiZP+K0201zN7aINoCTr4qDgjB+VwzV3GNpXu58Mvd8IyiezBAmkh0Kch8oMBwnz/KcCCFwH6muv3rhpWETYNvYVGUUKlgA1RLk8GsjmXHKJ8TOTOBraYHYl64QFFKJgT97hO8olRa235DaL1HPkgzgT7hj+7RDtWE4DCi/CqiWeETlmGdsdMAD5DTcnNIyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SBi/QAeVC+RyyzPvwa4UwQ9YIK4Ue1QN8J+f3w0pQs=;
 b=EHdzc/Pn6SBoIKklw8FIwTiiVt35u8VQxqCUqTPQ0Gmq3VbkEMOxgfWAxG8kLOfyRXk866JGT8jVM5sKQaUz7s4wwVplWeMTmj9x7d0FCeoGwEU/KzxPk0nc1gyIH91BAamIi6e3dDTvViQjnNYGO887qYGail1EMcv6QZaXSUncbPRWP1P/blij5szTOfu2nS6xY5DhH0Oe+VksztDftfI5kLFLDc4LXNki1M6F33coegTlOABnrHCl564oaiuehVRlfRGJUgTVVlF3CAW/AkNVuBMOEbQTNRpmDTw46lSdQIGCIe0aLc/4cu1YMAaNiy+8nOEQHFxP3LqGQO1y9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SBi/QAeVC+RyyzPvwa4UwQ9YIK4Ue1QN8J+f3w0pQs=;
 b=h128c6bAdkWw5JIqz3ZQKDnfW1zMXK/0Z81pjwUyv4/6P84Iz/tXaqSAkecIe8vm+4BxjaYbrRc3O3QeqlAAKitUdrIwJp6RRIRhdHAXgn1lnrZIfqLP+cH4+AhLFkpjkXqBDmugUCYojvXc/yxGvjvv7XC7jS6f6SvULgwHIB9A5h9lkCzj/mvuFR6zJ5TztnyLkxdNQj0intkLeVUtpKBfNK1Dib2A/jt4HRZ0gigG+VCv/Zh8yZi+AfEsGEY/+lyn38cipf3pOAGw5uMTO39IfWlxh3mQ5qSKbrjdXsi8rvLxQF6T1b3EwFt6xlmB7Xt29bgg4nMbWRfiP//L9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <945542c5-539c-c3fa-6be7-efa1af5cd2ae@suse.com>
Date: Wed, 24 Aug 2022 14:36:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
 <0e846638-c23c-0ec7-54b8-e318527ffac5@suse.com>
 <fa15c1a4-8f28-d2f6-6582-e49af6ebf74e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa15c1a4-8f28-d2f6-6582-e49af6ebf74e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba1ddbc-8e4f-4b1d-6766-08da85cd354e
X-MS-TrafficTypeDiagnostic: DU0PR04MB9297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDp5UUKfiTmI+JooEl1P9cGWdGrysIiAy20ExUXBfOmJQWJ4i/HC0eeZ0ccsQAE9vXRs0t+XtmuzJPPuv/drty0W/RQlOgBj5+x+xHz62lOfd84KZIGFF0aVH5LWDILfw1q+88m1eVqHnpwGaLo2OrxNpZfJBylx5+nBU5RXH3p7kujsNElANyhteMPbziWZSyQUXZWuDYpGaYyM/QxMcefcui8yfPvOO/uOxkyxzPR/2mu1/K8hBVMwYMncIjdnA7m5zhGKN8/HKrnPH7+ZaUzOjQqMqi9TvYvzxXrszjwzULwrCwEpiqqq9Ykdjt+Q5aNfyZWwiBilCWxuWkW93UaMlAiI24Ks/wZgPpkuPigJ/idGWLrfDPKgcwOpEQQ/W5OwHexiQkLH1ISwvKZe+RaVwplxAhrFoxr9jfB7JEC2sEZCJqHvCNc8kXBA0I5eyETCM9QrZ5tDghLI2CLkNQAVbgtY6xsfcdWq6vYMO7N4rbwWB0EWfWg3rgB3sgv42Gujw1fdet2L3gJcBADpfftNTbIYiS870bAxK+QJL/hMKYL91zV04vBR2it5r17UhAUG+rsl+pdQcdj/0ozi5lu3Yv8AuYn/WARxRAzQbIScI0Zf9p9Rj3RhaD3M7DuIY1Y2uQngecLu9UwovFWjnEShnluGRx5cOEZvu4weyBYVVBPORv0CJr2NAKAtjGvi2UJllFar5Ruiuryjt4SYxKeI0lfabf5EBP7Q0ZX8ZKLwzwu0ETwm1VVd54MQK+q5eyVNAJpE+gKIACCCu9JQdMjXPpiiNmuLmsLaTTiuuOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(346002)(39860400002)(136003)(316002)(8676002)(2906002)(8936002)(5660300002)(6916009)(36756003)(54906003)(6486002)(478600001)(6512007)(4326008)(6506007)(66946007)(66476007)(41300700001)(26005)(53546011)(66556008)(86362001)(31696002)(2616005)(186003)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9sTUlZbWRTMDdwVVF2K2V1OXowWmd1MnA2VC9TUy9yczVLTFFnR3FKb28x?=
 =?utf-8?B?SWlDZDkyTTZJS3FTMVV4RkcrVThrdUhDWXdVMEFyU01pNmYyOWpYYWNia3Bi?=
 =?utf-8?B?VkRXYStONzVoSVdDcktxYU5XMlArM0VWNkxhcCs3MUd4VFhwem1ZT081L1h4?=
 =?utf-8?B?SlVKTjNaZWZuVjl5Y2ZVQjEya09pY3k1bWZZd1h6ME40ckQ1dzdHbFBuTWFC?=
 =?utf-8?B?dk1OOGtsOEp0c2p6NEZJaTZRNTJKekVxN21ZT3ZUelBwSVc2ckhZT1pUNElG?=
 =?utf-8?B?WGFTK2doMExxQ1Frd0dXaFV4ZXc4SnlCK09oeXNyWFByYlBaOThmYk9SK1dS?=
 =?utf-8?B?UW5xT1lvbnA3bTZEYkFNU1RpOXk4VmdaRTFPVDEvUVpzOHhLQU9LbGtNYzQ3?=
 =?utf-8?B?VGZxTTREMmdETDdIOVQ0TWlLUW9iemNNMmRGWGhFSmNVbG9XdkNGM1dOZGM1?=
 =?utf-8?B?YUdwRDZVOWUzWEdUUGpKNFhraHVqMkh4SGlUZ0lISVZjQ1lZZGg4VVpNZmls?=
 =?utf-8?B?ZnF1SGdxQzVhVWNuaExHQ280ai96TlRiT3d2VTNNRHpTVTZuYVlUSFNCaVdK?=
 =?utf-8?B?b1EyanIzdlQ0bzE5eVAyUFZPVldvWFA5VElRSlRoTG1FcTRFN3FnalNKZ0ps?=
 =?utf-8?B?b1dmSWJINzdreU9ZbEVmd3RBeFVBUVdMcTU3anhBT2s0bS9IQ09xWVRjejJu?=
 =?utf-8?B?a0wwa21Md3JzSUtGWDJuTTdpVm9TOEtQaGFXYkZqakRZWnJURzFxeFd0elFo?=
 =?utf-8?B?TFRMMHQ2a3B6UUFMNkNyRm9uRm1QU0VTZEVScGFSRzQ2VFM3Q1RITGlKNHBm?=
 =?utf-8?B?Mmx6T1NWWm4xVWlnWlNqdmVaLytHN0hFTTRRbHEvTlQxaEowTldZL3JrVlBO?=
 =?utf-8?B?OEpNNWJnc1lZZ0tJSkFoR3hYMmtEaEt2enQ1RnBtV1BNckJ1ZjFOY083WU9F?=
 =?utf-8?B?eTRzRmNtd3RGd1Y2VTYyN2hoVGJ1L2dQT0plRjN2bUVQRG9YSVdVSGpmcFhq?=
 =?utf-8?B?U3FMaVB5Y3djN245YVFlWjBPdElrOGpIaW1JcXZCMnFYanpiWjU1OWlHRSsx?=
 =?utf-8?B?L1ZGSjRJbTg1Qy82enhoTmZjeERHY3hrdWM1ZG80aDZrUDNNNWxkMDR6TU1U?=
 =?utf-8?B?TG5tZ0dxUGQ3TngwK0huOUo0c2dpbjZTbHNxVy95czJSd0o4YlFlajdSZG82?=
 =?utf-8?B?T1pvVjk1dDVyWm9LL3VkRVh6SEZNTXlzbnJWVVY5SDRzKzdzM09OTEdFS1Jr?=
 =?utf-8?B?eXM5V1I5T0pyWGJCeXJRbEZyb3JaRmNTUno0bm0weU55NmR5N2UvSEVObmor?=
 =?utf-8?B?cUU1TGFXODlzSlZOZEtEWWQwVzdMR0RGbFZaTWNiL0hSSFQ4eG1pWS83UXVw?=
 =?utf-8?B?UXF1Wko0eHB5enptazI1TmpydUpuZGhreVErOE96ZXFBdW5vMXVGVDRnbG1O?=
 =?utf-8?B?SE5rRlk5YzBEU080Rk15anN2K1V3c3hIOU1KR0F2L3UwZ25WN0RUZFpBdCt4?=
 =?utf-8?B?Q0o0RGZrakphZHJVQ2MvVGhoUlJWOHFxSHRuRnlEb3Q2bmxyc00xUnVaUHdX?=
 =?utf-8?B?MmJHM09lbXo4NyttNkF3UzVCNUxVN1piT1FtSWd4TFZSS1pLRzhMbjZVMVR2?=
 =?utf-8?B?NWRhc1QrVmQ2ZzU2Q0ZYTHVpYlR2R2lLT2lFMDlhOUZuY3h3cXQ1N1ZXTFd0?=
 =?utf-8?B?eVZ6Sm9iQThJNUlqaWlHNjVpYkQ0b2p6TDJ3cCtvQVNBZ3NycnVwck56Z1FG?=
 =?utf-8?B?V25ONW1iVFdlNWNkZWZMQXl3QjBTZ09xMzVKdlQ2K1l3a3Z2c0VoODBDMzZp?=
 =?utf-8?B?azRaZ2VLZlJSU3VrNTc3UkIwaDRSSi9Vd2tLbnlYR2NpUGFUaXpFTVFhckRs?=
 =?utf-8?B?amgvUGdYa29FNXJZNkdPVHpjM3ozTHR0Z1c0V2xEZDJxOFYzTkZJR2ZTVE96?=
 =?utf-8?B?dDQ3MGZ5TDRYNngybkdqcEtiSUd0YnFnS1NLYUNKUHBoeTFtZ0t1UGpqU3R4?=
 =?utf-8?B?RkxBMFF2KzE3MExtK1pXNmdGODFNNEpyVGdJUlBiTjgyTmhROUwxQzZ2U2tJ?=
 =?utf-8?B?UnRqQ2JGTXBzaGkwSjFEU0Rlb3BEVC9mM1F0eEJNd0VCeEMrcUxVZ0p2ZWww?=
 =?utf-8?Q?53cd0iRbHkGCiT40Q6Bpoa/9u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba1ddbc-8e4f-4b1d-6766-08da85cd354e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:36:03.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWMprpWcOFfuD6NKNxzHTcwhIUGajzBrgx+Wy1Sbo2boTU9Ip59BPEvKsUTAopcFXTCYEn/wdHRDzO5WCW60kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297

On 24.08.2022 14:19, Andrew Cooper wrote:
> On 24/08/2022 07:00, Jan Beulich wrote:
>> On 23.08.2022 12:48, Andrew Cooper wrote:
>>> On 23/08/2022 10:27, Jan Beulich wrote:
>>>> On 23.08.2022 10:59, Andrew Cooper wrote:
>>>>> But this is going to further complicate my several-year-old series
>>>>> trying to get Xen's XSTATE handling into a position where we can start
>>>>> to offer supervisor states.
>>>> Where do you see further complication? The necessary fiddling with XSS
>>>> here would of course be dependent upon p->xstate.xsaves alone (or,
>>>> maybe better, on the set of enabled features in XSS being non-empty),
>>>> but that's simply another (inner) if().
>>>>
>>>> As an aside, I actually wonder what use the supplied size is to user
>>>> mode code when any XSS-controlled feature is enabled: They'd allocate
>>>> a needlessly large block of memory, as they would only be able to use
>>>> XSAVEC.
>>> This field is an already known kernel=>user infoleak.  There are threads
>>> about it on LKML.
>>>
>>> But it does highlight another problem.  This change does not fix Linux
>>> on AMD Zen3 hardware, where the kernel will find the CPUID value larger
>>> than it can calculate the size to be, because Xen's use of CET-SS will
>>> show up in the CPUID value.
>> Why would that be? We don't even have CET related defines for XCR0, so
>> we don't enable the states in XSS. And I don't see why we would. Even
>> for other XSTATE-managed but not XSTATE-enabled features we could
>> clear the respective bits around the CPUID invocation (just like we
>> may need to set some in XSS). We'd be in trouble only for any XSTATE-
>> enabled feature that we make use of ourselves.
> 
> It's not Xen's CPUID invocation which is relevant.  It's the guest
> kernels, which goes straight to hardware because AMD still doesn't have
> CPUID faulting.
> 
> And yes, right now none of Xen's CET state shows up in XSTATE, but that
> needs to change in order to support CET in HVM guests if we don't want
> an enormous extra overhead in the general context switch path.

Right. HVM guests, though, aren't affected by the CPUID limitation you
name for AMD. And PV guests could continue to be run with the bits off
in XSS (we need to context switch XSS and XCR0 anyway).

Jan

