Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA4765298
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571041.893912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzJN-0001vA-A1; Thu, 27 Jul 2023 11:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571041.893912; Thu, 27 Jul 2023 11:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzJN-0001tE-7G; Thu, 27 Jul 2023 11:37:41 +0000
Received: by outflank-mailman (input) for mailman id 571041;
 Thu, 27 Jul 2023 11:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOzJM-0001t6-6y
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:37:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc502d90-2c71-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 13:37:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9641.eurprd04.prod.outlook.com (2603:10a6:102:23f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:37:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:37:35 +0000
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
X-Inumbo-ID: fc502d90-2c71-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/B0EmtJ+UxNJ/Q6qP1mrd2JMnqcRlzNwq4Gzwl4HHW6/c+eGa8VoRRbFk2qN5vQaACeZf1cMyIYkqu7wvM3N6AZkPsVP5nRzDJ5KXBDKR1PtCBNk66SzGAYrq6edHi2FSeKh5IT8W2q1cs9r5Zn9rJ05kWq0LUYmAeqxYCelXTQK0i/7QTSGINVQJjtChfz1dmPVANXem3inHyd+3Iy0ceKf5FX8ai8XrDO4LAIn70fjnlZ4aVce9Xu05YjDQbb1lR9LUN0z7PY/0AeZSEgBPrEQ2TONNuH8nvSm+BNvoHUe3lf59SYGjZRVRcNxWfS5pjMq+zKYFzOgXNZ0C6A4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AV0qgEI5SmJZrQHVynjin2zn7w148wWi6i+SzLlsGQ=;
 b=OegfAUtI5KfHelYnkmFWBAn5OwP//EdkPoWKZrg+EGdeHR5al7ONVwyvtRGtKBwMCqz8bsdC3ABHJlyrwVdO1GVxpdexTpZUNcW3k26JEflVofkb5v5lttnXxxHcc7zRkLNsyY/XIoU+8xDYjSv1adxY377IXJZWmf29aL88L9zi52eNCFRHc6Yo5BnUXf2G/SmwaDRj/pLJOVESDPMGFpkTFl4CFMbmMNUuG/KJYF5nOojV+NPIVJ3AutQx8QKMQRfj8cuDBpUNOosiVjC9I0Li/If6Xv8Yu7SfK3UBm3jMxcCXEOr4LSpBkniktKLc3gYPRSovZA6nFgq8nL5GvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AV0qgEI5SmJZrQHVynjin2zn7w148wWi6i+SzLlsGQ=;
 b=MbPxx75HVbuaEl5la8xw9RiO/ClIWLT0k49tnXiDC/pIjq4je1CuNqO7PTNOXcG5iU3qg+Q4ES6te+FfvUVk3UH5kmiYKsclIPDG3TdNgZwtn7AO8cvM0rWnwUTNjv5AZuDVKOmlErFN+7E/aJQ3OegJQtvpwSj6nEOq8pNTD+ovQWT6OXvXXxqKn5DsRQM4WPKCTkMoX2BdOkstJCxUVZcrE6+35XS0hJ1tObyhndOhgDTByRq8r2OKcywzBXKZJZjAXyp7nYH4mF4A0lhwdE1w+qdMgi7h3xODG7/4/73prCOS7dY7vHKmUY3tSH3Lew3VSPqjXVl5Dc107niqkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d5c6adf-321d-5bbc-c5b5-4ea3d255bf42@suse.com>
Date: Thu, 27 Jul 2023 13:37:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
 <999aae1d-fb85-6550-9798-64cf88d7faf3@suse.com> <87r0otbq78.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87r0otbq78.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 8299a801-d6a1-49fa-c9ee-08db8e95df8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M0pw2uAxOBVsO+Of4stJSFI693RPLFMPVxmc3RbEnWpodrh0zCh8n6G6VJOBmihi9xld6I46d8pWZXXdYRcge1JeK5Vr9S3drCdtLDJbzNG/L0NsNXIEdKViOlKHirbOE274kzz992yPKc3rzYuNb0E/EX+vouafpn8TV6Qu0HLWKqhhG6Q+A0dCUg/NIW0AIE0BDaHSbkKkAFT/3Fy76DBaaEybmv5H+tX+AsZAKQuqc/w/TueWo2e3cyLmmzkol7ErizNt1AbD5X3ic52rNvB7c2bncB6G8oUeCH15H+5ws8WLSo7acdcBL9rW16NRmTFrG1afzYXcLsVAqfBt2PkzT1Bd7gCnzSx/j8uWB7Yf8vin5aOsed53hbBYDHaHTOaGFyrY7quBGC9m2CNS7gp7LWDp2YveUXdqmXEDW4FshhsdPH5iOyBgOgTx9IKl0CTJJnH7Ogc4IACKJNkEPfUnCIYbA3DnZTNlhXlUczfpv2CALy4dAPHhy9YpGYc9e7LZ4Jd9XZ+QvHwJGrQxJ9dDDeVaL5cNSiUbvPf1PX+2G61iG6phdkPjsnRQBXKeTAxuxuKSv73plRqtroH6yMTabR+OYTPizF/jCKzOLiIH24j9EPnkGBi01k3oC/YAf3qMtcaBxqslke73yoDYbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(31686004)(2906002)(83380400001)(2616005)(6506007)(26005)(186003)(53546011)(6512007)(6486002)(478600001)(54906003)(86362001)(66946007)(38100700002)(31696002)(41300700001)(4326008)(66476007)(66556008)(8676002)(6916009)(316002)(8936002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlQwYnY1SlpqSzhvaDJoWThuK29JYnEwSnhNWk4vRE1rYzVLS1owS3h3TlM2?=
 =?utf-8?B?WGRHZ0pTd254MFoyL3BUZWEyVDJwUXRyMWFOT0FBYUdITU1mZDZ6R1ZQQ1l1?=
 =?utf-8?B?alc1Sm8zSW53YXk1NmN2TTViZVBseTB3MlZ3MFJPUE9rVXh5eEFLTE9rYnR2?=
 =?utf-8?B?TVc3YkcrRG94UjlpVlpwZ3FUTmZVbjUzVXFNdXFHb1RnWlRRQWRJT1FyV2J4?=
 =?utf-8?B?Q3pTY0N6d0hTN1lLM2l6OEJFcUVwV1NpTlc3SkxHZ3BHOStqUlk3ZGVpNDJt?=
 =?utf-8?B?SG9ha0xaUzBoYjErUnFkMTZVbk55VjVISjg3Q2VwZ3JIZjEyWGpia3l3bTda?=
 =?utf-8?B?M3VKQVN3TzhHMzc5QkhySlRjWnh4SGlKZ2J4d1phRXhrdUZyMWFYTFpacFFW?=
 =?utf-8?B?cmd2aVNQQ3VPOTg0b0lDcnB3K2xjSU00TVEyd1JHL3V0cFJlZTd3c3hOaEFp?=
 =?utf-8?B?dld1S1RVV3I0Z1FLV05ZWWtwbGVkTVk5YUh1c3FmZVcrYzVDNndCOXZoWWlm?=
 =?utf-8?B?TStXcXNKVEptQ0loaitVa3I0ajFLV1VmZGh6dGJnRXVDNG92OExKU2RnRVM5?=
 =?utf-8?B?M00zdjV0WDRKWG1TdEtrcDhBYUZxLzJWeVkyOTR0NGtxanJ6RWxBdEp5Wmlt?=
 =?utf-8?B?M2tBY2d4aTlPTlBaQXEva1R1VlMxbnRRcG91dkZTdkJHNWpZVHdqNWdaTnAy?=
 =?utf-8?B?TWd6ZlZOM0JyekI5RDBEd05tWC8rVXE1Z3pkajJBcFVlMmdkWFc1eFZ2b1R6?=
 =?utf-8?B?dmU4MXBic2haamZleDA4RXh3aE1qUW1kcERVbTFMMHFuSjhhOVl5TGlITHFD?=
 =?utf-8?B?NkxoZ3g5T2F1UDJmRzhTb205T25VL1ZjVVRBNUpCMW5Zakw1ajZzaDJUQXFQ?=
 =?utf-8?B?cjVSa0VLMCtOZ3NBbEJpcit3WlJKeVREVTg1V2QzVTBpRkNlVysxNUkvemw2?=
 =?utf-8?B?Y29jMUNEWkRhWDg3OVcxRnpNRFBYb2Z5ZzZIS1kwbzhUN2ZrdDdoQURsWWhZ?=
 =?utf-8?B?S0QxUnF1Wk13N3g4YlZrV1FjazB0VlIwbEh2WWMzajJVK3pkR3FTSGxsY28v?=
 =?utf-8?B?OU1ZZ1EvcTVVVE5FWEtOMHR0MlJuSG1EUUJnY1lhVjA4V2YvYldKWUgwbFds?=
 =?utf-8?B?MUVoZklqU1lBSWIyWmJCUDZzVzR3eFQ0d3FKcjh1RURUUmhaVnFyRmtmZ1JD?=
 =?utf-8?B?SmlaKzZjM1l1UzhkeXZzYWFoWkN2cEpoUTAzaEZFREl6L0Zlb3BmOXQ1TER6?=
 =?utf-8?B?M2JFTG8xR3lsOWUrZlYwMWlTNG5HT1hmNThzY0huTENYZEdhdjJnT25CdUZl?=
 =?utf-8?B?aVB1VS8wM2JISkVEa0ZqVml3Nkczb0xCRWxQVk9iVXBuMGxqelgrZkFWb3dX?=
 =?utf-8?B?T1VSMHBacVpzSWRGZFpHais2TTN5c1VkdlMxSndrbnM3TE00SkppMG1hNWY4?=
 =?utf-8?B?TmtxTUdoSnU4YkFLZSsrYVkyc3IwUHBGRUtCdStFN0ZqM3FGeXdVVThVV2pn?=
 =?utf-8?B?SW5pa0I1bE1DN1Qvai9iSlpEdzZWai9Qa3FtZ2xrZGMxQnE5L2Y4eHhzRjhS?=
 =?utf-8?B?K01ETGlsOEYwdjNvZktIVEgwUWNSZE9VbW4zVDB6SDBvQnJGdlQwVHZvYks5?=
 =?utf-8?B?YkRLTWFZTEwyQ2RVa1dpS0R0ZFpUdWZJVlVTNzRCT09oVEtXQjlYdmRWa0gw?=
 =?utf-8?B?bmFkdS9sSWszQWlkcXV1cUVsRHRkVEtnRVdFZFRFL1dhTTU1WXJ4d0RUUkdp?=
 =?utf-8?B?ZEVkQ3VlUXJveFZXZVJVWUJOYlFMTWZaWG55QkFreTFOQ2VzWkw1WjBHcG1J?=
 =?utf-8?B?N0FKQ0g5bjZ0UXY4OVlybFh5ZzZVdHBiTkMvN3hrbm5PWUZLSjhQazJ1NXZl?=
 =?utf-8?B?M0VjaXZvMUJWRFVNNHVXdHpIUEJCSWdtSnZ2RzhOUmJuNEhpcy91VEZTQk9Z?=
 =?utf-8?B?b2xVL1dNRFp6K0QrOStkRDJpK1NLeFNXaG9KcHpVampCNHJxVTRFM0M5TkZB?=
 =?utf-8?B?SFNCQTdRelo5TXNaK3FSSWpNbnIrbG0vUlQ3MWUzZEJMTzBMMDdRMm5menBl?=
 =?utf-8?B?ajQvU2kzdlJ5bWpNek1EcDdJU1dvYnFJd0thRVdIZklQQ2k4RXRIZHZkZGtp?=
 =?utf-8?Q?wC8bqbAsBH6oh34jIBi/6aQCb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8299a801-d6a1-49fa-c9ee-08db8e95df8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:37:35.5917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ELx31/TcTrJZWq7e37IngpAU3H9Chb0KiwZUiHjjjAMk9ma8CKIKjyHXqh5H1iSsCz//whzGn61D3mxXywFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9641

On 27.07.2023 12:31, Volodymyr Babchuk wrote:
> 
> Hi Jan
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 27.07.2023 02:56, Volodymyr Babchuk wrote:
>>> Hi Roger,
>>>
>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>
>>>> On Wed, Jul 26, 2023 at 01:17:58AM +0000, Volodymyr Babchuk wrote:
>>>>>
>>>>> Hi Roger,
>>>>>
>>>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>>>
>>>>>> On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>>>>>>          ASSERT(data_offset < size);
>>>>>>>      }
>>>>>>>      spin_unlock(&pdev->vpci->lock);
>>>>>>> +    unlock_locks(d);
>>>>>>
>>>>>> There's one issue here, some handlers will cal pcidevs_lock(), which
>>>>>> will result in a lock over inversion, as in the previous patch we
>>>>>> agreed that the locking order was pcidevs_lock first, d->pci_lock
>>>>>> after.
>>>>>>
>>>>>> For example the MSI control_write() handler will call
>>>>>> vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
>>>>>> have to look into using a dedicated lock for MSI related handling, as
>>>>>> that's the only place where I think we have this pattern of taking the
>>>>>> pcidevs_lock after the d->pci_lock.
>>>>>
>>>>> I'll mention this in the commit message. Is there something else that I
>>>>> should do right now?
>>>>
>>>> Well, I don't think we want to commit this as-is with a known lock
>>>> inversion.
>>>>
>>>> The functions that require the pcidevs lock are:
>>>>
>>>> pt_irq_{create,destroy}_bind()
>>>> unmap_domain_pirq()
>>>>
>>>> AFAICT those functions require the lock in order to assert that the
>>>> underlying device doesn't go away, as they do also use d->event_lock
>>>> in order to get exclusive access to the data fields.  Please double
>>>> check that I'm not mistaken.
>>>
>>> You are right, all three function does not access any of PCI state
>>> directly. However...
>>>
>>>> If that's accurate you will have to check the call tree that spawns
>>>> from those functions in order to modify the asserts to check for
>>>> either the pcidevs or the per-domain pci_list lock being taken.
>>>
>>> ... I checked calls for PT_IRQ_TYPE_MSI case, there is only call that
>>> bothers me: hvm_pi_update_irte(), which calls IO-MMU code via
>>> vmx_pi_update_irte():
>>>
>>> amd_iommu_msi_msg_update_ire() or msi_msg_write_remap_rte().
>>>
>>> Both functions read basic pdev fields like sbfd or type. I see no
>>> problem there, as values of those fields are not supposed to be changed.
>>
>> But whether fields are basic or will never change doesn't matter when
>> the pdev struct itself suddenly disappears.
> 
> This is not a problem, as it is expected that d->pci_lock is being held,
> so pdev structure will not disappear. I am trying to answer another
> question: is d->pci_lock enough or pcidevs_lock is also should required?

To answer such questions, may I ask that you first firmly write down
(and submit) what each of the locks guards?

Jan

