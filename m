Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26255975F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 12:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355429.583083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gFP-0000jJ-Hv; Fri, 24 Jun 2022 10:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355429.583083; Fri, 24 Jun 2022 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gFP-0000gh-Ez; Fri, 24 Jun 2022 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 355429;
 Fri, 24 Jun 2022 10:09:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tt/v=W7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4gFN-0000gY-Gz
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 10:09:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a99bf51-f3a5-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 12:08:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 10:09:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 10:09:02 +0000
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
X-Inumbo-ID: 9a99bf51-f3a5-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzMyFY0otyiFzXNvTLOGyXu/MeFAlQ4I9xxt9JvxFM6f6qustmlc2cvgPGilXDZaB+aNlDooLq68mAWGmR2KNYzbwZx0dvZrWx0eDygsa4Xk8oSubyjPWj656RHhB2bukPLub18IdIRpbEynLdQG+iKOI20Y80NtjATUSAB6rZJA9RI6T2A1IwXP87kDPjg322yDJMGKSKIm2OsYpW8rEllR8mxNabSFdjTbYjhYOSZDsCMiYwLBe81tq6vwuhiYjON9owdCRUcw7kLElIZlfXFD37GwByyztsKqNaC70lCq8o95dwZkB5vW2yfIirPkmJMjT9sZ3N9y2WAaJ1DXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FVL1IyaHxLDG9o583v7c1UgzM/LSnVxzxLhqmMmE6k=;
 b=a58EIMRILKGpSeJ9/n3iWqlrFNKT2sYb8uRcU0OVbCx6vX5SfudtUWi5Xf0wQ/if6+C0UgyqUhKJ1omRosWWndmRn4K64pI+9d6/RJVVNcRUE6hjvVksX0SuuOuAaXXbLDvZR6MoXC/38GkizTLiQNgRqLtHebBtckLJX73uQYa67Y4y/Ick3scAvu0rLnFZHbBNwBIhz/1PQp/LswsPpQmGcIjeqpqFUiYOcA/EJWU1jKBe5uCBeBR4EI5jo8JkjDAfYnFhgJemQuXeVddT0vuOGlx89ay8NvVdT3Gpo4EZj9wT1waPdEkxAndcNlbC0I8Snq7+aWSpqDLilm2Y0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FVL1IyaHxLDG9o583v7c1UgzM/LSnVxzxLhqmMmE6k=;
 b=NudIDyqWFkyOjHn9iEeZgjKW0ydkqJ2u5TDtL/Mz0VhSgI+VUzFL/kyziVMVQ6yfU1lxGnOxtP7cXkufglZrGKPZZ3+mwshKAq+cslirxYcMYRE5LLESmYv4/plkdvn6DBG5h0i3pQY0Vz3RBYId3e59ykb7dek9ER3G7FsbsPwIOzwcktJaxp5Ko2bbTcA0UWQ6ftFXMKeR6Rt/rERUN8Q1esPqTESumZPFfL156p204ZyxHttvKIYI1d0HEuapAxsxfGC0on9D1NeHqJ2sSUuOlG1Q6O/ylMa52eHqJi7LIgo1DCn4vGHlTgMLoP7ec7ORlPZEulckP4hTs3PZog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
Date: Fri, 24 Jun 2022 12:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
In-Reply-To: <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a53b006-8b7b-4542-8d19-08da55c99055
X-MS-TrafficTypeDiagnostic: DU2PR04MB8551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v+PlL6d532NXoi5VEVfYxZk0srkVGVb0cNrvU5biyzW5hjOpXZsBfGmmn0F2sXDrJPtO6eeHSDi4bh/fx91UNzND7scaaSEqpzNUs6s0KUIvbonWxRCGDD0ZQuS0yr4t3PRQcwTrzdvCaLWBrAymWRzCtpR+ZI4iMRTc2wtaymT7JxTlKAUbUZqTsNddRCdER/rDbc4nqAPAN9BU4GyNR9kA56D9VMlQfElF1omDklhalQeG++xqtG1OZz7ruIdcZDppWUxCgx+hg1/E78jxXytpUsusfX9FADkvTa8XuSgNxhpwvwvEu6dVpNdY7cg9ACeQVDhw6LimA960gNiGPh2/Sc3GGW8ijvllx/iLDdDi3/cULMsAJrYt1GYHaFxCDlZLV4JQQYz58bGYlNyfYZbJ8zOkE8UdH2HxC7vgi2lV4Dk+7kiC1+ehvEuvkcEvdmdzVuzp7Eyj7Keyp17ATY8K2OY4O9lmvuzFVOXmZUlciZyXU046sNUQs+rjp8HK5Z6wjcX6wi4zuDy0TGRPI4Kr8so0UYaf/rNox2uw3isX2yyEi6TyibtQf8Ulg4WvoDfYSsCJIwl+4HRQjL0kWksjOL1sNNFQ3GDlskiv7gIJKlYI48mP8NnNzGIdLKlHFGDKgRrsTaCHJdgHbwRrQ4PPIORMLcgN7uAsai8OwlR/uoqwL/8YplkHTmZcZuDkZzqk9je/433rVG80uuqD8enzwotiX6RZPStOPGCdHMkgBAcp+t2h9GNq7iYASQOkmNb1rSmVyEjBgjWK5bS9ykMo6Fxs2LfhcXxPGgSoOt0OiU4avYRCfCRMarpvVrQFFM5MZyX4eKuYzg6aq/Ra0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(346002)(396003)(376002)(7416002)(8936002)(2906002)(4326008)(31696002)(54906003)(86362001)(316002)(5660300002)(38100700002)(6916009)(66556008)(26005)(8676002)(66476007)(41300700001)(83380400001)(186003)(36756003)(2616005)(66946007)(6506007)(478600001)(31686004)(53546011)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVdDM0gzdi9FZjhFUWxtOTBFbGROdXYrT0dlSVJDd1g3U0hnclRIaWk5TmJU?=
 =?utf-8?B?RXFEb25HejAxMys0aDVIWnRTVXRONFEvdlNaUlVVSUZybWFNNWMyVTlIdFZG?=
 =?utf-8?B?RGp1VUVqci9HNzM1N1BrdjJyVUdOS1l1S2R6T0F3dHhMbk44Z1E1S0NnUmZi?=
 =?utf-8?B?M1VLS1lPWHBuS3ZMdzlGUVVlRm9nZHNlUlY4Y0x6TEF0QVZTakUvN2tnazBU?=
 =?utf-8?B?QTlWTXpNV0U2dlR5QUg1Y2cvRHZINldydjVCTkdJakN6UzJsYmhzcWx4N205?=
 =?utf-8?B?QUcwZE10anIyZHRlWFV3L3MvU1ZXWkEvc00xSlRMOEl0V2czUDdCQkNERGt6?=
 =?utf-8?B?V1VSaEpRc2VVSW9wVVkwZ0d6WEdxa1Q2MGlWeEovaUpUVVlWMTlEd3hYWU5L?=
 =?utf-8?B?SmdVblJlRzFNTHkrRU5QUGwrMm9MQVRwQ3FVRHBoMFhpZC9WMm93VDRIYkU1?=
 =?utf-8?B?c2MxYll5c2hrbmV5ZVl6S0xzL1ZjWVFKczVCY1p2c1RTWDJ2WEFnZEZ2Vm5H?=
 =?utf-8?B?RSt6bmo1czM3eXoyMGl6dUY1N2hsemJWU1NLb2twci9OVHNKdnRqUHI1K3VY?=
 =?utf-8?B?enZhWjROTEFycWxReTRTS2FjdHVzcnZmVVBUYUFFcS9ycjBRUTNLUCtWbmEx?=
 =?utf-8?B?cEgwZWZpSXJEbFZKMkNLRjlId2hMVjhvMmhIYW9vU1pnL0kyMzlHSFBXQ1U5?=
 =?utf-8?B?NklGdFQzVUgvUGxVRU1KUEdzeWE4OER2enZXdFh1d1J5TVI3WFQ3UUxMREhN?=
 =?utf-8?B?cEExWExmNURrczlJVkdmVFpXVEtnYmk5NzJFcFppMWlObkZ3WDdFck00aXBp?=
 =?utf-8?B?cmQwNklMOWhYbEJjUVZhZS9HSlhweXp6UnNlWEJWaUpmbzdWQzIxeVdLcjZp?=
 =?utf-8?B?eTZuUmtGY3R3bFp4MnlzVjdBelB0dmNLdHVzaTRxdWZOM2FXRDNNRHJtODRS?=
 =?utf-8?B?cHkvUWREeE1NM29BbFhNVnIyQndqT0xGMm00cXVUUzdtOExoZ1R0TG4wWDJs?=
 =?utf-8?B?QzhIVlNvZms3blJLK2Z6bGdsTWF2TDBOd0c2aC9NMlRPQk9HQWdyekE2Tkcy?=
 =?utf-8?B?NXFsek1XVy9BbXIxT0g2Q3ExbXlNRkdEd1hqQW9qUmVJUnlvY2VrZndXWWpC?=
 =?utf-8?B?Y0RjTythcTF4SXNlOUczdEdadVduMG1CY29qZXBoWlZmczc1MmNlM1Y5alBO?=
 =?utf-8?B?c1g3ZjZ2RVZWMDd3Q2xHRHJjQXMxbkNHNFpIMnVVUzlaNlduWkdMZTIvaUtJ?=
 =?utf-8?B?ajk0Yk0yTCtUY21FTjJNVzM2d3BNblVtVCtSV0N3eW0rd1VNTWFCa2RGcE8w?=
 =?utf-8?B?UzlLc0pHRFdyRjVZcmx5bm94MlZLa3BxWlNQZ3VBOHZkczVLRmk4WmRLTG5B?=
 =?utf-8?B?VVl1WjRSS1lMUENMWllBSnZ1bUxIYXRsK0hka0NwRVhmbVA0Wmo5UHE0cXYv?=
 =?utf-8?B?WUxtcVQxSkE5dGhrU1djcHNEOTgrbmt6YW5TalVuNG5XZUlXSE1xZmpUSEdv?=
 =?utf-8?B?K09VRGdjMU40UzB6T1I5SGFmVXpudjJoK2FNOGlnOVpNaGpNNXAyWFQ3MDRx?=
 =?utf-8?B?VnNYN1N2RVJMUFpxMFJEK1psakMwUnBQRTlxOVhITllQWlpHY1pwUkF0Mjg5?=
 =?utf-8?B?dXNJckJ0SFFwOXdoSEtNQ2tXcTFMNExPYXQrM2xYZ2tya2hXMjlMNmhZcS94?=
 =?utf-8?B?WE5lbGFaTG5oS0dDdzRrc3pwbzZFOWNwWkRBYWxmbEdCbWJqUzlIdUxlaFVJ?=
 =?utf-8?B?aCs1cXdHTVZlUUlDZUd0Z3ZtZzlJd21xQ256Ni9hcWJRSzJpZFdFQjY5YUV6?=
 =?utf-8?B?QVlGN1RHcnMxakkxQks2d0VRcmUzZGYzQWRVN0JUOEt3UlkzTzdpN09SM0Rr?=
 =?utf-8?B?RmFSdWppZU9LT3M0UklIV25VRWwvMGl1R2R6ZTR1NmVEQ3VBYjVaTkVaeFI4?=
 =?utf-8?B?akZqUWprZllxSjNvT0ZqUGRVV2NSQnpQN1VTMEZ3clcxbUZsSmp3T090Y0RJ?=
 =?utf-8?B?eWNCdjV0eVNKOTMzVkJXdmVOV1puWGVRTDlJcDJXQ3VTWXdUMEI3TU8vN2w0?=
 =?utf-8?B?TTFIUSt6aGdYdmpBZ1lnVmRzdE91czBxYXlTeVNiUDM2cmpPeEdNVHhyVEZn?=
 =?utf-8?Q?SqhzE8G0BoQLQFvE//UUuozyD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a53b006-8b7b-4542-8d19-08da55c99055
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 10:09:02.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qV2iTtlz+/SehI0w6zZcuLPRrOX3xaW/3ixR7bNupIWY1auFEGVoE11g99WxNyw+zLlzlqx/kTzAaR4Jzz9pdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

On 24.06.2022 12:05, Jan Beulich wrote:
> On 24.06.2022 11:49, Julien Grall wrote:
>> Hi Jan,
>>
>> On 24/06/2022 10:33, Jan Beulich wrote:
>>> On 24.06.2022 10:35, Julien Grall wrote:
>>>> On 24/06/2022 08:18, Wei Chen wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 2022年6月23日 20:54
>>>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>>>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>>>>>> Grall <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>>>>>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>>>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei
>>>>>> Liu <wl@xen.org>; Jiamei Xie <Jiamei.Xie@arm.com>; xen-
>>>>>> devel@lists.xenproject.org
>>>>>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>>>>>
>>>>>> On 10.06.2022 07:53, Wei Chen wrote:
>>>>>>> --- a/xen/arch/arm/Makefile
>>>>>>> +++ b/xen/arch/arm/Makefile
>>>>>>> @@ -1,6 +1,5 @@
>>>>>>>    obj-$(CONFIG_ARM_32) += arm32/
>>>>>>>    obj-$(CONFIG_ARM_64) += arm64/
>>>>>>> -obj-$(CONFIG_ARM_64) += efi/
>>>>>>>    obj-$(CONFIG_ACPI) += acpi/
>>>>>>>    obj-$(CONFIG_HAS_PCI) += pci/
>>>>>>>    ifneq ($(CONFIG_NO_PLAT),y)
>>>>>>> @@ -20,6 +19,7 @@ obj-y += domain.o
>>>>>>>    obj-y += domain_build.init.o
>>>>>>>    obj-y += domctl.o
>>>>>>>    obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>>>>> +obj-y += efi/
>>>>>>>    obj-y += gic.o
>>>>>>>    obj-y += gic-v2.o
>>>>>>>    obj-$(CONFIG_GICV3) += gic-v3.o
>>>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>>>> @@ -1,4 +1,12 @@
>>>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>>>
>>>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>>>    obj-y += $(EFIOBJ-y)
>>>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>>> +else
>>>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>>>> +# will not be cleaned in "make clean".
>>>>>>> +EFIOBJ-y += stub.o
>>>>>>> +obj-y += stub.o
>>>>>>> +endif
>>>>>>
>>>>>> This has caused
>>>>>>
>>>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the output is
>>>>>> to use 4-byte wchar_t; use of wchar_t values across objects may fail
>>>>>>
>>>>>> for the 32-bit Arm build that I keep doing every once in a while, with
>>>>>> (if it matters) GNU ld 2.38. I guess you will want to consider building
>>>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with that
>>>>>> option.
>>>>>>
>>>>>
>>>>> Thanks for pointing this out. I will try to use -fshort-wchar for Arm32,
>>>>> if Arm maintainers agree.
>>>>
>>>> Looking at the code we don't seem to build Xen arm64 with -fshort-wchar
>>>> (aside the EFI files). So it is not entirely clear why we would want to
>>>> use -fshort-wchar for arm32.
>>>
>>> We don't use wchar_t outside of EFI code afaict. Hence to all other code
>>> it should be benign whether -fshort-wchar is in use. So the suggestion
>>> to use the flag unilaterally on Arm32 is really just to silence the ld
>>> warning;
>>
>> Ok. This is odd. Why would ld warn on arm32 but not other arch?
> 
> Arm32 embeds ABI information in a note section in each object file.

Or a note-like one (just to avoid possible confusion); I think it's
".ARM.attributes".

Jan

> The mismatch of the wchar_t part of this information is what causes
> ld to emit the warning.
> 
>>> off the top of my head I can't see anything wrong with using
>>> the option also for Arm64 or even globally. Yet otoh we typically try to
>>> not make changes for environments where they aren't really needed.
>>
>> I agree. If we need a workaround, then my preference would be to not 
>> build stub.c with -fshort-wchar.
> 
> This would need to be an Arm-special then, as on x86 it needs to be built
> this way.
> 
> Jan
> 


