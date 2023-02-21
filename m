Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C312569DD41
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 10:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498689.769563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPIH-00058v-6k; Tue, 21 Feb 2023 09:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498689.769563; Tue, 21 Feb 2023 09:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPIH-00055r-3p; Tue, 21 Feb 2023 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 498689;
 Tue, 21 Feb 2023 09:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUPIF-00055l-Bl
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 09:50:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31bf7d5d-b1cd-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 10:50:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8819.eurprd04.prod.outlook.com (2603:10a6:20b:42e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 09:50:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 09:50:34 +0000
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
X-Inumbo-ID: 31bf7d5d-b1cd-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWqMZoFDczvzwYRNvZRXmb635uv+5NQvrgmbAOknveB4l4WKTkJXBXGfUCUkqKcm91td3diLqAULF+FLI/5j/wyGS0XLhhsIvyH6WEZ80B2FfQ7h+smTPArkAvbPrhEUNxzFgyIsmVO0Rt3q9y7kHBKuYPZ27CYW8qMYTlabJ3A4QfOxvFMJOwn0ajAsAHXmkkSCjDlYPQDSJRg35hOTCzZJNTS2zIMOr+N2khItazRCKKS3wvJTxBbd1+y3GZO8wVAXcgSk3qDyv/jxls8uIfBzBZDUZeMBKQJ8U+WA6y6lkB4oBo1NSWNR3WI67hRlqAH/l1O29jguZ1juTiG3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg9JZTbZxVv7hSuO3g4tt46XZ2qFvoAKhZUvz3x4I+I=;
 b=B3kfz1rmwoUjdQEaMJNHagRYQsBb7gk0ctyNELUZTps4G4SgF/M0b19yZOAVU7SvPHi+hwkSCQq2Kk73FBoxnY0x58Ov7NueoQH03zlnZaG0xg9UE1gtaVedjDijJ9YYceq63KvZLfsD8nBcYUUSDoldL8eNtDsY5a7c80VC6YGK1NXXu86MHxigprKi49X7OlX+7dtbhoYzCVULKUAGOxlUY2UUFLmZMEy1D0QS+UEogDiPWU4WkDkT4ghXB36aFF7EOEsjK0xaLkCSRibPn/dxOCnquO626C4yhF4BguUeljUej/aUptE5BopXomWTvn6yfVz6S2jam0KOADP+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg9JZTbZxVv7hSuO3g4tt46XZ2qFvoAKhZUvz3x4I+I=;
 b=lzrRvTdBAx+LX4wQhtwb9tb0lgyF2YQdo9H48jgAOa9WoQyeYAq/XOGsI8tzscV/R3f1YlzprkWrLvKSXgDsEwlQvrdik7CZOBkszhNLHZYczf6G5QZFFdUkmk0mOK8Ev4DWOKxgDaYNVin7y4pf9yiJrlWbNXcPyFxfwvgr8Z2VmgLKUdWMITK+w1lyCVhyFQg/p/b4VsP3TiBWxFaqiPpdyJhqirWvAjB97aG43GDSAgGxwungS5VxENh8Aqej4fZVoDYCYlmQrhesVRcoNloxaUFCTauGDKgm4hHAljOltP6uZ6fqi+CxODUxwsk26Qr4ZaGxFVSLmQlPXZkA3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67330fed-560d-0078-2c5e-0a71974f3dcc@suse.com>
Date: Tue, 21 Feb 2023 10:50:36 +0100
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
 <875ybwylp6.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <875ybwylp6.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: bf02f619-0f97-4843-d7e6-08db13f113bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1GnTjiqwqTxzpgf8stPgGMMlDeqymWFLEicMEAearX0NTXISbQoRXnx8a4vbwbnQgh1IhQOyO12XgpiiwJ6eZbQy/dRrVb/L137wPqTkRmqFcnSMWu6toPDDXtHxOXYrRRTZZ6gflnj5fUkSPmhThl0KUXGI83a4bJTp/LKbI0gbksXXamyEZqzdtCAJhkFm9drPdTS54XlHrN3LvjTclyPTsB6RFBaIBsAS3kDTobzFcSpYfpROxmXPrd09g9wt/suRqEmaM5YkXykIw9znA677GTkU6Y6iPWw7a33uowlN4XkKEkw9Ft/LrkgYAE+0fXsJACvGYApoZMxpdk3Uj4lMrnIgOkdgzHrUZ8H00BkkDnJvhloTNLfOS0EyRZWWArG8T3XqWIBwry4E06jwi2JUvAN5I1c18DFLF/nGyl2T9LMZI7yMIdcFLvU4dggmnRRdW/Ocoi9SBvj3CYouoOrBqzsEmb23nX257pN6kAgBTMc1pOJTg46O6QTl/zwqPmcQIylc7/0RrPmOS2r8SFUqYwiZx5E1uMHiloFRKfguIn4kPIA4vsF/df7bZOHcnF7+FZj9lR96vCbU+1RNgtQG4IRP0NxPxa5j/1+1399ZJMOm8AN8agujdu95ZbqUfnkBvKeePgD3WrAdtCgBTWNuM6aKQ1yvYauGQALcznQShQFStZKQns1LQIYRi8vdppx07cTZfsOtJKKzR+3KEyFHEf4DQJiV5DHom6E0JAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(66899018)(31686004)(36756003)(31696002)(86362001)(5660300002)(7416002)(41300700001)(2906002)(8936002)(38100700002)(83380400001)(478600001)(6916009)(66556008)(54906003)(66946007)(66476007)(8676002)(6486002)(6512007)(53546011)(186003)(26005)(4326008)(316002)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09vaHBjN08wYWNMcjhhU3pESTZTME92eDlMLzRjZkRzajlpRmFaNlBtQXJi?=
 =?utf-8?B?ODNJL3kwdjRBVlgxM2tveGdBYzh1M0x4SVlQMnNxZ2dtMjg4UURpVURWWWE0?=
 =?utf-8?B?NUhPUmdJc2JTN3I1Y1N3cGF3TXJ6MHo0V2dHb1V2ZGpkUzh5ZXVHbFJpTzZq?=
 =?utf-8?B?ZlRUQytQcTBZbENFUGc5WjlOWG92VnpuZm1ZZmV3SktDUkNMeHBwa094T2x5?=
 =?utf-8?B?clc4ZEdZRm5nUjlpaUpmVklKR1JxeHU0UlNpb1c3azVtMXZsUm1sSDNVdXhK?=
 =?utf-8?B?eFpNTDExUG9hVXd1L2NrL0VlR09vclh2SDdmdE5zQ1d1aG9MS2pQYjdxSnly?=
 =?utf-8?B?SEdVR2Y1L3pKcTNIZUJLQmRYQnNoNGw2bEJLWFNDUTZHUFBaOGcwbkNBZFJO?=
 =?utf-8?B?ZlJvWW01R2NKcWZFYkxYOGpTM1loQzJrMnJNR29LYUwrSFlaNkJXVXk0Yi9m?=
 =?utf-8?B?SXQzMlhGTElzcDJ6WWRLeWNRWUtVSFU2emVqSkloZmpuVUR4V2dBWHVPMXlq?=
 =?utf-8?B?RVpLb3Vla1hzNGVmK0JEd0tJc1ZPdUtGcVkxNVFJMTFQWStML2dYVHNYWkZD?=
 =?utf-8?B?UDBOcTBvSXNLWlJLWkFrYS9RMlRWMzVSdFQrZHdlOTVOOTRqTC9CYUNxYXEx?=
 =?utf-8?B?eFQ4Umxta0pXUldWVkZkVCtyVjdTL1FUdWkwYkh5eWd2MzlDdWNRaGF1aE1F?=
 =?utf-8?B?S0FtT2NSVm5rRGROVWpnTnBaSFZ4ZGt1aWw0aEIrRE9pTU5KVllZV2hoNDBY?=
 =?utf-8?B?YzdhK0dRVmRDNDRhRjgvR2ppQ2JZZTRnRUx4U0lsQUU4d2VpVVQrQ1NQaFBK?=
 =?utf-8?B?eXVHOSt6UzZjN1FnRnExOUxqSlgrN09LYVlGenlYSHVncXNqSmp2Z2ZlcGhq?=
 =?utf-8?B?c2QrY3BEMFR6K2RYdUFCcm00Q042YkZFcVh2OHR4akJPUDJOTXEramNNRTdn?=
 =?utf-8?B?ZTdERlNYdndNVWtCT000WEQ4K2M0MU1Pa2RLMVdrb29UTWJnZTJrOGpGbE9k?=
 =?utf-8?B?MWNvZE45WUxpbkJObGZZdFZLemNnOTBxTGdPc3NmY3dzemZFeWRJT0tYR3pi?=
 =?utf-8?B?blNXazFZNFRQY3VEcFB3ZytNN1hCdFlVb1BqS0RBVGdYTTNidTdsbGFrNjFr?=
 =?utf-8?B?L2hEaThBMVFUZmcwZzVHYUFkZlRFZG9WeFVFaExiN01naXpSd2J1a3NseTQ2?=
 =?utf-8?B?R0VUNzVsVTBjRGdHalhidFRPWjNxZWlWV1RGVWhZVUE5NmZ1ZDN1eXppZ3Rt?=
 =?utf-8?B?T3V0SlRCUXVUTkQxaTNmTjAzOTBQbEZKZXAzbmZHb1RpTlJDR0xPT1hSemJU?=
 =?utf-8?B?amtsbjNZOWZYUTR0QjBZSWlhekhFRjFYYmlFRnJ4aW5BbjJJVmE0aWdza1k2?=
 =?utf-8?B?OTNHd1AwTmNrSnpwb0ZjOTcvN3dsdElmMVpuOTRJNW8zZEdaLzNEbGprMUxT?=
 =?utf-8?B?SG5SQnBLeTdEMGszanZmRVNZNU01TTBJTlFsblh2bWlEd09DWEdQeDdjM1Jz?=
 =?utf-8?B?L3doNzN6UGdvZld6UjVRVTlmVFp5YTJzalY0c0lYamtITTVTMVhIaGY0KzM1?=
 =?utf-8?B?bWVMNjQ5dVhLMTM5Tk5hdTR6WFI3L2pRYXhjNWhMcGlUOG4vbHcyM3lyUzNn?=
 =?utf-8?B?U0x0RWdaT0FvS0J6OFdaWmNwczB6VHU4UWpXVTZEaitmak02ZjZFdjliZWNM?=
 =?utf-8?B?Qkl6eEpDN2lzMlV0ald0azJtRHZuVmJiQ0pnODNtcDJHeG0wMXFackhCYkpa?=
 =?utf-8?B?UVhNdXAwSVhuOVFzcldmZFZySnJLdXpxSzFrWDZRVHJhdnc4RUl6c1ZVYjFv?=
 =?utf-8?B?Wmw5WnNBUzNWdzJicGdxd2JzWmt6UWw2SlRRTlFSYW9KZS9PdWxTSU5jZnNQ?=
 =?utf-8?B?cUx5L216QkRKN2dqTmxoYXltVjVQUHQrZ0JrdnVrSWdKYTNaaG1ndzJ6elVB?=
 =?utf-8?B?WDVtVGUxTWhvSTVVRzZha2U0TTdxNnBKVjFheGJ6MmpGWEZGWWVHNWlEeU96?=
 =?utf-8?B?enJ1UHQ3WXhLQnRUOGtuVzZCVEhZR0FNR2dhWmhlYUpEZlRGcjlFTTg2S3Ez?=
 =?utf-8?B?aTQxclN1MHBVWkhUc09wRHFGbGpVdkpwRTVLOUI4Q3R4QUp2SVcrQ1JvZU9P?=
 =?utf-8?Q?dfPFbJ+gdk9KrwTViuxwjdyzn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf02f619-0f97-4843-d7e6-08db13f113bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 09:50:34.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nV4A08RP51uTLkZJnziodEIBBNHcJfxt1bpZNvJhuOgpd/ZhzhCThnIJTDV+UQDuKQfHgEpOOdU+Px9SXjtjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8819

On 21.02.2023 00:13, Volodymyr Babchuk wrote:
> Stefano Stabellini <sstabellini@kernel.org> writes:
>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>>> As pci devices are refcounted now and all list that store them are
>>> protected by separate locks, we can safely drop global pcidevs_lock.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>
>> Up until this patch this patch series introduces:
>> - d->pdevs_lock to protect d->pdev_list
>> - pci_seg->alldevs_lock to protect pci_seg->alldevs_list
>> - iommu->ats_list_lock to protect iommu->ats_devices
>> - pdev refcounting to detect a pdev in-use and when to free it
>> - pdev->lock to protect pdev->msi_list
>>
>> They cover a lot of ground.  Are they collectively covering everything
>> pcidevs_lock() was protecting?
> 
> Well, that is the question. Those patch are in RFC stage because I can't
> fully answer your question. I tried my best to introduce proper locking,
> but apparently missed couple of places, like
> 
>> deassign_device is not protected by pcidevs_lock anymore.
>> deassign_device accesses a number of pdev fields, including quarantine,
>> phantom_stride and fault.count.
>>
>> deassign_device could run at the same time as assign_device who sets
>> quarantine and other fields.
>>
> 
> I hope this is all, but problem is that PCI subsystem is old, large and
> complex. Fo example, as I wrote earlier, there are places that are
> protected with pcidevs_lock(), but do nothing with PCI. I just don't
> know what to do with such places. I have a hope that x86 maintainers
> would review my changes and give feedback on missed spots.

At the risk of it sounding unfair, at least initially: While review may
spot issues, you will want to keep in mind that none of the people who
originally wrote that code are around anymore. And even if they were,
it would be uncertain - just like for the x86 maintainers - that they
would recall (if they were aware at some time in the first place) all
the corner cases. Therefore I'm afraid that proving correctness and
safety of the proposed transformations can only be done by properly
auditing all involved code paths. Yet that's something that imo wants
to already have been done by the time patches are submitted for review.
Reviewers would then "merely" (hard enough perhaps) check the results
of that audit.

I might guess that this locking situation is one of the reasons why
Andrew in particular thinks (afaik) that the IOMMU code we have would
better be re-written almost from scratch. I assume it's clear to him
(it certainly is to me) that this is something that could only be
expected to happen in an ideal work: I see no-one taking on such an
exercise. We already have too little bandwidth.

Jan

