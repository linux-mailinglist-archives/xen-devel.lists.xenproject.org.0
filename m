Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9076A64B475
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460595.718535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53nV-00085G-LQ; Tue, 13 Dec 2022 11:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460595.718535; Tue, 13 Dec 2022 11:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53nV-000829-I1; Tue, 13 Dec 2022 11:50:09 +0000
Received: by outflank-mailman (input) for mailman id 460595;
 Tue, 13 Dec 2022 11:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53nT-000822-N9
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:50:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1662825-7adb-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:45:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 11:50:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:50:04 +0000
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
X-Inumbo-ID: a1662825-7adb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfGI0spFGbDr/w8nO6dfQtv6PTSZp7iF2JTVi1fDckBcCxKtLtym6lXR0I89VGz7Fv1Oes6mp7OaPj+y75VN+0/uxu/G+qNe2N8VGT/CckufFvgFUhaqZkPi4AaRDBUqjXXDiWc0ugBy0NQydNL4VSjMyo5J4R0rhDmh2IKlD45HLBiihCJ08DNbn6ChL7BN0ay2P5jXeC5fNJIgpEVQkmtnzUBI4AgdA8Bkj9XIaOR1hReAnSlXHbDMibmRP/jigbMoHiO0VpWsUVE8Kp6+F5BizjG6+te6V6RvZwsStd87CdyvkWls5SIYSYocMB6EVdQum4npidL9AOZnKw5jHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssesvDldU0t7qmLV4JTp66rx59p48v+0v6QU8SFGCX8=;
 b=dkkk1zCCWOyNcT6v9OojVNokqm7RVOfJhhvARJvQvexzcX+xZsb7nlvRxHRgnOkuEvxzkwTf2oq4Bfv06SHix2jJVACjiUNipQ+ItXH/aGxhrtzCoWne/LGkQC5ahE4/nJNkKugrhMlasmqkvkZY4mOyh660u3ddGDeDKpHwIVe7lphUU1OXgzNTJW/4Oi7PKNDwXdWrC9pw2xOQNBibWLm/3MnnwLVVoMFd6bNXxYaKYdAIKPJeWXMHh31uTfS3pRjlFyprVC1nc4WEa/0zrnOoxMvC9XzCbPsAktraO0kukJzJx6x6d9VfrVCIYPL1Du+XwKJx8tt4/oSHROVp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssesvDldU0t7qmLV4JTp66rx59p48v+0v6QU8SFGCX8=;
 b=X9rfuGmMD0dyiCR217YEOgqCb8QpL3sVH+PNKAJxwywg6+ue73KjHAQT/JVAFYV4LAuChs2aA4LuRH1zvy3zte3bPHzH/G4s54BIJe59UihV7L1BmlHYEUFm3tA4z866BSCo23UfOTu4gRyz1Z3ICiO6MRj+ePkSjXGgVhvUadZ3STxhLUcnQgX31eZ4pmFkqsggx0SQCi0dSIcbOtnMEH1MrQF6uiz3mK1SvRTtDyUBUVWV7gOTl+eSv3J6WSonIRnK6QRINChORf5p8Sqif/1xIW5q1bmrUN+tXFH4dDkCqGz2J0VsCHagZLHkFuet3lbEW9GS0hNC/KqQbHDkyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87eb39b5-ee6f-7324-0add-bd4755719a08@suse.com>
Date: Tue, 13 Dec 2022 12:50:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/3] x86/pci: Fix racy accesses to MSI-X Control register
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-4-dvrabel@amazon.co.uk>
 <641a5905-3a1a-e128-788d-e907297aa213@suse.com>
 <e0c05cb6-32be-bfea-9a4f-4567272042b4@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0c05cb6-32be-bfea-9a4f-4567272042b4@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ea3676-ae2e-4147-5e84-08dadd002c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+4TRi72OLcyaTWc5xShcc3EJBm4W8G0UhR0bIqZC4/as3RpuPNSDTKOb8L/pOGrO/IA8t4YDzlsFV8Ps1CfslmP3v7h/UfKag/GzHlRdZm6nx9aPWI/Zft82g63HEWH1FMBxtTu+7JUp/a6Ic0UD+FllDq7kFI/CyWJsb7xwbnYLL6munVe3YNpRBeYx9UP6MoAcfW8DVrSLcsbKCRUQGoVVIQLmDeZNS6oXyVCRznll2eIFgCpjr0JYHn8gyCsfrgX08uipDWNHzJ7PoWihKlRQFKChsOk2QH54azAl45DFXsyY8+BtikzmP8bKwIeZpaqaXnvVjLKe5lxYT3CYeCsRmogAOjDYY0BpRuHTVFXHvYpLyteJ85IEJ3TXnUmqZr/QiBUVg7QyHXINz1oHkfgHvJM3/Oeff1PrRl7Zzdfoe3yIKj05J3h6E9me6kHfIzkwJvJrN0KSMNhG0g95I+eRvsFENVLZpqvR+0XuDMGPzvnYvyNtGy1FYOD5ZgqxzpMpZyEsW5RoWMo8uIjrnKbKqNW4n4iRU3yECa1moSyhDsQi1HqafO/ILkdgObP2zacqQJheV3CpA6jIbmss4r5F3IWzQHBy+ETZKETt9xDKldPVaR0FKjY7iyv9W+6KAIVCyEADxlPKh2RGYYJ8/e8KKZ/un+sh6D6Vfzyq3PlWKUtoWdOM1BWYNtfFObapYk9m20Q8BTD1wvc3AmjNj3q1zQ/DwHQZZFN01bOwWWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(478600001)(53546011)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(66476007)(31696002)(8676002)(4326008)(86362001)(2906002)(41300700001)(66946007)(54906003)(83380400001)(316002)(6916009)(66556008)(5660300002)(31686004)(8936002)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFUyMkVEcVRWR0NxQitnRnFzYVc0V3gyYlBHNGZaOXdrMHE3bmQwbzNBMjRJ?=
 =?utf-8?B?aHF0S0NRQVdBcTl3YjZzd1FtT1l3QThST2d4aHF0MWVQdE1leGRMOHl2dEp6?=
 =?utf-8?B?SnZNTnV4SE54bUxRcWNpY0Y1Rjd4NmNuTU54K2J1Y2pNTmxhWVhPeEhxaVN6?=
 =?utf-8?B?cE9iMG42YnJHQi9UblpYdUpJQ3U2Z2djL1JWc0xwNzBOdWtQeGhuMDlsYXkw?=
 =?utf-8?B?cFpxc2NOd1c0cWxSSVJDU0xoVnhHTUlPWWhTaXRJc0l5d0RSK2V3Njlwbytn?=
 =?utf-8?B?NDRySFNLWnRaZm0xcHhRMkpGSU1aUlhNamRQcCtXdWZvOG9rZVpOSmdtTEo1?=
 =?utf-8?B?dmlCR0JpbjZOT0JZUDFLR3RoU0c3UGNYU2lDR2VPY1R0N01qM0twQkl6d0Fi?=
 =?utf-8?B?eW5qUXhZZXRic3RsZC9QVnVEaWpjcHNjR2xzbmhwaHd4U0w4cTRSSXZpa2ZQ?=
 =?utf-8?B?WWNjQkdKU21FMTFHdGkrcGJlcjUxdUQxbEc2eCt1RGRGbGVESFl1V2UxenRW?=
 =?utf-8?B?Zis2Y0dreW1wU1N3eVdPazJGS1VZWEVpVE9rQnFJS0Nsblp4MnBxRGxxQVNM?=
 =?utf-8?B?VTJUMnVOVWdTRDhZbHJoOGpIQTJrS1NTZ1oyL29Pd0JuRzJmK040aEhYY2k2?=
 =?utf-8?B?NTZ5L1pSSXhQRUVFcG5yRjRyeGJldjFxZ2Nzbkc5blAzbW9meVlPUUFCNnVJ?=
 =?utf-8?B?ZDZ1Uk5iLzZ1NnkwZE5EWTdTYXNQQUZpd21OTjJkWnBaL2Z3eW9zYlpPTys0?=
 =?utf-8?B?ZHV1b2h0Z21Wc0FxUk1CRVczL2N1bHBlZVk4VE9YRXJNbHNOS1ovOEU1dldJ?=
 =?utf-8?B?bi82RWN1aGtDaFNpZ2xXc1ppRm5Bc1pwL0N3K0NnRER3c04rL1N1MmNWY21k?=
 =?utf-8?B?QTZHQnpPTXR4QWlhOC9kamxqYzlBOHRGM3NsWDA0Q0RielAzSHZwWjJCZ2lz?=
 =?utf-8?B?dllDSWVZUkwyL3NYRUhsWFdmSmJJa2N6K1hjUHI4NWZlL0ZyUTluQTBiYSsx?=
 =?utf-8?B?dUI1QXc2cnBtYWxubVZRc0JMbGxCT2dWSlQ0U1Z3Qnk4S0N5cDgvNTdTN24v?=
 =?utf-8?B?d2hNSjJPS0VTMFNIKzVxeExTVXZzYmVIKzB4WW5scExuRUpYMWE0WDVUVllW?=
 =?utf-8?B?ck9uOTJnUk1Mb2Y2dUkwU3E0SUxyMmNVYXMyUngySUtiZEU0ZlIvSktEdUVM?=
 =?utf-8?B?ZHNpV2o2R1haY1ViRmpEdC8zZ2ZNNDIyYzFmanJrNC9FN05sYndSYnRsRnBn?=
 =?utf-8?B?RW1SN1ZwWnVld0k5dTUrMXN6K3pTclhMMmlialpmdXZ6YkU3TnpKblNteFpa?=
 =?utf-8?B?VUwwb05nSmVPdHdXVGFsV1U5RDVDMXBZZ0ZGT2Z3QlVtSFI4NTZLcmVRYWxn?=
 =?utf-8?B?SGh0c2xsbWJibzNENDZpa085Y2JKRUtZL2dyK1cvTTJpcHh5dmE4R0Z3TkRP?=
 =?utf-8?B?NEp2bDhQRTFRNUxDZTN6eEl5ZEJrUE90ODBZT3ZMd1ZGMDVZNXp5ay9GZGoy?=
 =?utf-8?B?cENIYWNsTFNzeGcvUUdOZE85OUFWM1oxaGs5dkw2NlIvWGhtY3RnZzNOOEtH?=
 =?utf-8?B?bHpQZjVmbUJmTlovcDhmNWsvdDVQTTBrbmZtSkRNMGpYSit5L1ZkNjQ4MFRL?=
 =?utf-8?B?SzRBV0c5S2ZLQTVUZkpGeWtZSGdmMktjVzZSOGVOWTc0S25hK3NjWXhGeno4?=
 =?utf-8?B?KzNtTXNFdUFZNlF1cTBXZ09CU1NLUllEM1JsUlpFR3Q1R0orWXIrQ1NwRUhv?=
 =?utf-8?B?TU5KaVBlRTJIb3dBM3pwR0VGV0tleXdOYWFaK2h0WFBPV2h6bkU3NWR5amtn?=
 =?utf-8?B?c2dvbXNGdFV3R0VuV0dvcVRqQlNjcVFoVlZSMHA0SFZmMnFGcGhNQVNBRmVE?=
 =?utf-8?B?V21yNk40WDNHRTBTNEhHcmc2V1ZIYVRzYlY2TUV5K0pQbEt3dGNEZnNzS2NQ?=
 =?utf-8?B?QzFGUUtxZmN0MWhlcWIwMGMvbnVvU25oaUxwb1VDTWd5U0Z0T2FpT0RwMEZY?=
 =?utf-8?B?dUViYXNZVXQ4QXh1MzVEZ1VxN1dSckFnWjB5ZDR0RS9KSGd1Z1dqWER4ZWlO?=
 =?utf-8?B?eHpya0lTbVo1b0tya0pTVkY1aU9xSmJqdXJUa2VXS1BVOCtEelBXN3N4OHhI?=
 =?utf-8?Q?QJf0kAQLJqjc5FgqwU5NUfcQ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ea3676-ae2e-4147-5e84-08dadd002c83
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:50:04.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an3GsnSLiWY6kJU3ir8GvyHRFWCtIhMTT1j9yXwvS/5bgb2xNhtjiCr2as21h8FJRbgTJbeJC1HSmB4Kod7YAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951

On 13.12.2022 12:34, David Vrabel wrote:
> On 12/12/2022 17:04, Jan Beulich wrote:
>> On 10.11.2022 17:59, David Vrabel wrote:
>>>
>>> --- a/xen/arch/x86/include/asm/msi.h
>>> +++ b/xen/arch/x86/include/asm/msi.h
>>> @@ -237,7 +237,10 @@ struct arch_msix {
>>>       int table_refcnt[MAX_MSIX_TABLE_PAGES];
>>>       int table_idx[MAX_MSIX_TABLE_PAGES];
>>>       spinlock_t table_lock;
>>> +    spinlock_t control_lock;
>>>       bool host_maskall, guest_maskall;
>>> +    uint16_t host_enable;
>>
>> If you want to keep this more narrow than "unsigned int", then please
>> add a BUILD_BUG_ON() against NR_CPUS, so the need to update the field
>> can be easily noticed (in some perhaps distant future).
> 
> This is only incremented:
> 
> - while holding the pci_devs lock, or
> - while holding a lock for one of the associated IRQs.

How do the locks held matter here, especially given that - as iirc you say
in the description - neither lock is held uniformly?

> Since there are at most 4096 MSI-X vectors (and thus at most 4096 IRQs), 
> the highest value this can be (even with >> 4096 PCPUs) is 4097, thus a 
> uint16_t is fine.

Where's the 4096 coming from as a limit for MSI-X vectors? DYM 2048, which
is the per-device limit (because the qsize field is 11 bits wide)? If so,
yes, I think that's indeed restricting how large the number can get.

>>> +static void msix_update_unlock(struct pci_dev *dev, unsigned int pos, uint16_t control)
>>> +{
>>> +    uint16_t new_control;
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&dev->msix->control_lock, flags);
>>> +
>>> +    dev->msix->host_enable--;
>>> +
>>> +    new_control = control & ~(PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
>>> +
>>> +    if ( dev->msix->host_enable || dev->msix->guest_enable )
>>> +        new_control |= PCI_MSIX_FLAGS_ENABLE;
>>> +    if ( dev->msix->host_maskall || dev->msix->guest_maskall || dev->msix->host_enable )
>>> +        new_control |= PCI_MSIX_FLAGS_MASKALL;
>>
>> In particular this use of "host_enable" suggests the field wants to be
>> named differently: It makes no sense to derive MASKALL from ENABLE
>> without it being clear (from the name) that the field is an init-time
>> override only.
> 
> I think the name as-is makes sense. It is analogous to the host_maskall 
> and complements guest_enable. I can't think of a better name, so what 
> name do you suggest.

I could only think of less neat ones like host_enable_override or
forced_enable or some such. If I had any good name in mind, I would
certainly have said so.

Jan

