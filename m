Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0F6B1F56
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508200.782602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCEq-0002TC-8m; Thu, 09 Mar 2023 09:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508200.782602; Thu, 09 Mar 2023 09:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCEq-0002Pn-5K; Thu, 09 Mar 2023 09:07:04 +0000
Received: by outflank-mailman (input) for mailman id 508200;
 Thu, 09 Mar 2023 09:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paCEo-0002Pf-Jn
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:07:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe16::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0b9588c-be59-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 10:07:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:06:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:06:59 +0000
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
X-Inumbo-ID: c0b9588c-be59-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2aE6BkkdBRTLID2M1XShni3MF8AaSazpjtn2ODAYfUL6j7/HBnNaRhjQ1uqA/ONwTVWP8SzcGY3kU/QhYBvfm2dVacSaasLZhQFmoDFC9VcDH0OukGyZIhW2Kikx3ow0Rrt2f6KXJ/rKDhiF7XlenKrNWBBsncGqkGSgNfTkUrOM9x2Khn2TtW+xYHXDfTwjjHL+RwXLiwzJj4flpDo5vGHUG2/HkvWzt/TnK33OES2dOlph162X7bGoO28PEoAFgMkHrhySLU3CCBTo0ZhmMRafPGX0Jd3798m2UYpvxyRyUYSWSD/6qaUroVgMbA0qLMh27KKvrge7L4OdI6TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Na5gfOybv0ooiVBmvFj8I5KTk+rUm+1fQOJF2LqKAhg=;
 b=Z6/P/ETj3sHAfYeTpgPixicAL795EbkSVzxtlnRR2nHEqoce0/bttTZ5JTa8MyJJJq+pyXWxcLv2O28VrubCnsN4LRtNdUgrTjL8a+zBdydxTWQ5dIz56W8bIhvOx0HLycdIw9gmNJakx0dyv9mPk/2b8DOazm1CV1w1qqdGQqAq80SnZ5E0ihfC5Iu9o+F0OmK2PgCsByt8xP4vyOFDOAe1d7Uf1lGHM75jJQnzROFsBffHGHJkEVjPG5H1wip40jNiVlE92D89KhsVxDo9aZgsYqwJo3Vqe4l2fznW/tunwBGiMP3r1f2SGjwAnLA/I9y0on2PyF5dX9TTkgmPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na5gfOybv0ooiVBmvFj8I5KTk+rUm+1fQOJF2LqKAhg=;
 b=FlgLN9O/dQ/DwIEQ2ImemyXkzWebG9Lg9ythp7+0aLgAJ+UNNkkBASV881zymCd9rFbzYvcPon+on6hILKl/ul4BGYS3a8LWY24rlv30Kuvp/XIIPeKBj4SdKj78Ho7Sv6YNLBcJ1n/AXYbeU0jYE1v9hROOElnRS5efdOG86usBoywrcj5pF7kO+OYk70cbT9TxV/Oq3TJ5FFLGeJ15f0LRQ3Mx1N4EXk47LxDPZGcoVgfW45AhZBIZFBxgDpWFJqLTp9D8piWQgDHpZCzUZjme26GsQhsXUFQXz7wr87D+ZK09iUNtKLK1wkfQ2FPs5dMardUETuChlKnjI8Gbbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5820592-6675-6c96-3162-a46856ebcf92@suse.com>
Date: Thu, 9 Mar 2023 10:06:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-9-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
 <875ybwylp6.fsf@epam.com> <67330fed-560d-0078-2c5e-0a71974f3dcc@suse.com>
 <87o7p2yb0p.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87o7p2yb0p.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8f8690-103f-4b0e-5221-08db207da38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ddMDgPASLn9QcYYKwn94o43G3EmLrgkAsFVb5vQGIWtzeF+ZYNalOzq3lfS2siNgVYQ66MdBDdO7QZo+XBAxnWQ+X4GcJ49laso5s8P4zjh/CMaiAJO2dygdY0Ydx/8BINHTEybJ6U8pYoqAFj4EePapv63VNI5SE6gH4FC4wqMwLE9A8AP+KjvjLpk4+hnfgvo5z4gSKtGEtX+1/XkJO2y44jGzERCO/JsABdS4/Lyn234Kf+FyJiQ/MD/GRw+EsxuclvgQOaN10bqODzifz24oOGAd6bC2gEWeIv/Gs8ONpXrHmOVbAkodYV3PZ/0utWQofof31LzIGpqMHzKtJA3dFfjXRtGoQ2fdaP8PcREzOeIg6qqMTKf4AWmbUyJO/6NsabkxTLmPxVLc8aF9z6itYTyN6yv1ZgHnAU3aoGc5X1o+0JogdWDV1wsN5Y9QEnj/X8Z+saG5bOyxD22w05KlvKBEygT1rR/I+BvGBinhFMZOqymtv7k3rCS6ar83VYWSeVKiEuacJxjaNlmHrNPADu8tvbAIINzbaHy+KZulP1+QpRuW5pn+pgMBVu3NsLe4+diTN23mKj/SmNw/0Vwvam5Flxlbo1KXw34gDB3y96kcomTSQaEGh1lY2gZgAEBlv2AjA3tOsSk0DvVp1G3FbucD7bKm9xM/ZOcmZVVw2MXveX93fXeiFJ0fq/njLHI9IiUUR9ek/GAEdI6Hwsq54KdfcnPYy9tVtJcwB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199018)(8936002)(36756003)(5660300002)(7416002)(26005)(53546011)(6506007)(38100700002)(6666004)(83380400001)(186003)(2616005)(54906003)(86362001)(66476007)(41300700001)(6916009)(31696002)(316002)(4326008)(66556008)(66946007)(6486002)(6512007)(478600001)(66899018)(31686004)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFFqRnpmUm5TY2pveXZtZ3VFRHFUL1VrTmhXWFRZeGlsY1RyZmMyUURjeThh?=
 =?utf-8?B?WkZseXhReWhLdmQwOGZRR3IweDVOdjgvOU83d2s3cW1KQWFNV1BheVFoU0ti?=
 =?utf-8?B?bzdOc0VzRTZSYTVWWTNsQ1ZZVWUzT0VsaG9WWmRxNE1iWjNtcDdRMWtXRWNt?=
 =?utf-8?B?UVRDSnNuNE9iWUpBVXhsQ0NnMHF0VmIzV2xXaXkwQVBldFhpUVYzRmtUQko3?=
 =?utf-8?B?dnd4UmhYcklGVjd0S0FybGJJcUc4eHhtdGpYWXU0UlVjRlJoUkxxOGZUUnIy?=
 =?utf-8?B?QURNNUt1NmhnUUdUZ1VNNmZUZ3AxeGZiY2VmZ21PcWFOdUZwWG1VRmV0UENs?=
 =?utf-8?B?STVVZlVveG5aWTBjZEhYN3ZMM0JDNGFKeUdPdms1K215NmxrY1NJdzlTdEdo?=
 =?utf-8?B?NmRqRHl5Mk94ZkN0WGZMdEd0ZzAza1NhQ1czQmo0RWVUT1l6NHVzdDVuRVZ0?=
 =?utf-8?B?ZEgwTk1jV2JDV1d5NGdsbm9lbm04S3hjMElncVRqUkxpZzFUWFh2aTkwRUVv?=
 =?utf-8?B?SzhLQ1k0MWxiek5qUFFvcnJyYkd6MzRIZzk5blRiODNYQ2NNZkxMY2pBeHJm?=
 =?utf-8?B?eTh3T2hOczc5ei81cnFTaG0vcldVMUJnN1BmVGVodXA3OHhkaUppZGNpc3JK?=
 =?utf-8?B?S3Q0V2NzOW1tK2NJcytOUzJiMU1MZDZZQ2xmYnV6OVYwV1ZzUXhpTkJucDFq?=
 =?utf-8?B?Q3p0MDR6dUhRTDhjUitkS1Q0MWROY0lMT3BkN3pBcFdWaWZXbmdWUmtRQWtT?=
 =?utf-8?B?NytsZ3Y3Y1N0bWQxOEN4OFZXR0srOWU0azdZb1FhMmk3allGc2Zma1Vvc0lz?=
 =?utf-8?B?RXh1amx5Q0Q3SUdQWDJWaXlvYU1mYUI5cGdkYURSb3ZsMnN0QUNkVnhIcXhI?=
 =?utf-8?B?VUxvdnlVMjQwcWpYS01YT0F1ZzF6RldPN0o2SGhtdG1SSFlHMWs1RktJWlJU?=
 =?utf-8?B?RWZtWlNTMGlLTmExeHZ5RTVaWGFueUplRjdxMTI3ZTNlUkNDMDhZWWgzbEJO?=
 =?utf-8?B?UEUyR3lpbVBqVkorR1ppNmtRTnNTL2x0bW5qRS9rMFgydTJKNllyOWttU1lp?=
 =?utf-8?B?Uk9xWDh5YUhKVE1CcEhRdVZwbStHenJVd3pTUngxbEEvRTRadnp3czU4SFRJ?=
 =?utf-8?B?Tko1dkRJTXlZeUtoMk1DMm45WldibVAzUUsxbUZVcWlnVFlYQko5ZUJvRC9C?=
 =?utf-8?B?eWFqNW5aekpTTzRBT0RjWGx0ZmpxU1ZEM0RXUGFPWTRSL01KNHBzYzY5WmJh?=
 =?utf-8?B?YkdrZGpjSFJpalRCODdsZDZQL3ZIRGxycEErcEE4cUROTnY2aWlsaExHdDVD?=
 =?utf-8?B?UDZRbzJMdWdHZmdSUGw4Z3N3NTNQcjhKNUVaKzA5MmVnQ1lMa3JGOU1kVXZL?=
 =?utf-8?B?K3p5OCs4OFhTS0t4V05BYlFZeW9NaG9lQTlheFF3bEoxT1lzQW1FYVpZMHdu?=
 =?utf-8?B?Ym5xVExtdTNlbVR4MVEyT21aNFdPSE96eHdheUllVlpPMWl3RE9sM3VSSVVL?=
 =?utf-8?B?bUtzdzZtYitXUjhpRG5vcFRFWUdCSXNLSzdlWkRLRk0zVk9tQU1JREp0MWo2?=
 =?utf-8?B?eTFCN05TTS9JUmNid0hBZXZLbjhkYlNLK1oxOFRBQ1JKdlE0emZMTG0wdDI0?=
 =?utf-8?B?V0hERTlMejBaeWoya3duaUt2MldCTVVBWnUwWWVuOG81bTRCd1FtUExtTWk2?=
 =?utf-8?B?RFdlQWN2SUx0RWZyU3MyYlRZNStudDgrakREci83MVlxSUhQSTRGeitYZU1M?=
 =?utf-8?B?dVFPeXh4dTlUVEhGQWtKTzZlaDNmNkZTbUw4WlJPNEY1Vmdsa2hKcnVLOFhr?=
 =?utf-8?B?cENqY2xUYkZNYVhpbnZzVkxucXRXeVJWSmFiRE9GV0NnR01sczBhTnVpOGVs?=
 =?utf-8?B?anczTWp5SVNrUWVTVFF2RXA1cElCK205TWxOdHVidDdIcUt2bktEZnNEb2g3?=
 =?utf-8?B?aDR3c0RXa2ZxeExJdmw4N0R4M1RwQjNjSllYVGV3b3d1c0xPbEtFRStYUlk3?=
 =?utf-8?B?SWUrT1pwQ2YwK091VTVVNmwzZ2huWk1xSFQrMjdtZDl3RDBCRHZoM2N0cE03?=
 =?utf-8?B?MEo4L2tyRStxbWZZN1lMYy91T3lSSk1xcFdKUXdRRFVNMnBZVERNc1JZZmpz?=
 =?utf-8?Q?ZXmVa0yYaLS+LstePG5ipfNc8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8f8690-103f-4b0e-5221-08db207da38d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:06:59.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNhDJLNEx/Gfty7MlLXLmWcNf1wnRf9XtPiFOee8ntF66MJJ5FWw52pbEK3036Gn1Yclr/GY8LC9ZQkPHSo4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603

On 09.03.2023 02:22, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 21.02.2023 00:13, Volodymyr Babchuk wrote:
>>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>>>>> As pci devices are refcounted now and all list that store them are
>>>>> protected by separate locks, we can safely drop global pcidevs_lock.
>>>>>
>>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>>
>>>> Up until this patch this patch series introduces:
>>>> - d->pdevs_lock to protect d->pdev_list
>>>> - pci_seg->alldevs_lock to protect pci_seg->alldevs_list
>>>> - iommu->ats_list_lock to protect iommu->ats_devices
>>>> - pdev refcounting to detect a pdev in-use and when to free it
>>>> - pdev->lock to protect pdev->msi_list
>>>>
>>>> They cover a lot of ground.  Are they collectively covering everything
>>>> pcidevs_lock() was protecting?
>>>
>>> Well, that is the question. Those patch are in RFC stage because I can't
>>> fully answer your question. I tried my best to introduce proper locking,
>>> but apparently missed couple of places, like
>>>
>>>> deassign_device is not protected by pcidevs_lock anymore.
>>>> deassign_device accesses a number of pdev fields, including quarantine,
>>>> phantom_stride and fault.count.
>>>>
>>>> deassign_device could run at the same time as assign_device who sets
>>>> quarantine and other fields.
>>>>
>>>
>>> I hope this is all, but problem is that PCI subsystem is old, large and
>>> complex. Fo example, as I wrote earlier, there are places that are
>>> protected with pcidevs_lock(), but do nothing with PCI. I just don't
>>> know what to do with such places. I have a hope that x86 maintainers
>>> would review my changes and give feedback on missed spots.
>>
>> At the risk of it sounding unfair, at least initially: While review may
>> spot issues, you will want to keep in mind that none of the people who
>> originally wrote that code are around anymore. And even if they were,
>> it would be uncertain - just like for the x86 maintainers - that they
>> would recall (if they were aware at some time in the first place) all
>> the corner cases. Therefore I'm afraid that proving correctness and
>> safety of the proposed transformations can only be done by properly
>> auditing all involved code paths. Yet that's something that imo wants
>> to already have been done by the time patches are submitted for review.
>> Reviewers would then "merely" (hard enough perhaps) check the results
>> of that audit.
>>
>> I might guess that this locking situation is one of the reasons why
>> Andrew in particular thinks (afaik) that the IOMMU code we have would
>> better be re-written almost from scratch. I assume it's clear to him
>> (it certainly is to me) that this is something that could only be
>> expected to happen in an ideal work: I see no-one taking on such an
>> exercise. We already have too little bandwidth.
> 
> The more I dig into IOMMU code, the more I agree with Andrew. I can't
> see how current PCI locking can be untangled in the IOMMU code. There
> are just too many moving parts. I tried to play with static code
> analysis tools, but I haven't find anything that can reliably analyze
> locking in Xen. I even tried to write own tool tailored specifically for
> PCI locking analysis. While it works on some synthetic tests, there is
> too much work to support actual Xen code.
> 
> I am not able to rework x86 IOMMU code. So, I am inclined to drop this
> patch series at all. My current plan is to take minimal refcounting from
> this series to satisfy your comments for "vpci: use pcidevs locking to
> protect MMIO handlers".

I guess this may indeed be the "best" approach for now - introduce
refcounting to use where relevant for new work, and then slowly see about
replacing (dropping) locking where a refcount suffices when one is held.

Jan

