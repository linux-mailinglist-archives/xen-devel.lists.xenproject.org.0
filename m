Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8574808A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558864.873328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyZu-0001yJ-8o; Wed, 05 Jul 2023 09:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558864.873328; Wed, 05 Jul 2023 09:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyZu-0001vu-5C; Wed, 05 Jul 2023 09:13:38 +0000
Received: by outflank-mailman (input) for mailman id 558864;
 Wed, 05 Jul 2023 09:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGyZs-0001vo-SB
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:13:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37bb9380-1b14-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:13:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 09:13:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 09:13:05 +0000
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
X-Inumbo-ID: 37bb9380-1b14-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrHmlSK/zm0oG6NGBSpgVwSAVumzhhDefHD0n6SHm669mhalEMDI7ehNSVMb3XwB9dVM0nOtKozzLdhHqFsqKdz2ZQJJLfz5xLru6eTCdUsxIjqVNFQbwJm5SGTtiAyXOkU6Pr1eilPkbRYk1cHfBJOa9bkpaMsiwxpWBxyLXzBnUODXutLlZK5drf0f1GeIjjEV65LKNCALnoJWm6LZxP3Cp7oE+/6NAcDGIf5zJga6BttHfOjop3S/XyGHPNsDSPTQz8pChO29AucLVMdMeO12dJ91dSqIiRChhY/cIzOiZDTXchPTOdz/X8+RsB4Vsq2+aMTFD9rmDHxTlYanxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBxPdtL2k+f4qliEAI+mXmeIC4RVSonltR3JhEIQmbE=;
 b=IvALZep3JIw/jAkR0Qz3BuWo5RLYyfB2j1he4Lpk/CLE2Efs9Ce+aFhJ5dZ5mdhf+LHcoiL3OcB2x7mOU1fYdWTHAiPMuVeflYHrS05c6f2ok6gHCfRVOMtYotfR0opugJoJqE/gyfzUrnH+PG97WDaiV9phHVPcez+qMPhEs/6ojNn8YUPNoQipOAPxkcbVkCWPEWzfNMQk1knm4+3bYROnIZYPZdY9kY3M2NXVkN9zq2MkVY0FWoi8ViH9mzuiHE+cV1JpKvd6u/A3C69xAJxs+O0KNze5y29+IZwHneDFWCDXmyvrz3gxGjCRtptcSH3xK722e73y6nWMymTcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBxPdtL2k+f4qliEAI+mXmeIC4RVSonltR3JhEIQmbE=;
 b=QGd5jHpDVi74WaZckM58tjHfF7CaFB240WQNbnfjgyktP4DPWuXoDcpEXdz25xJ8Vqb8ftulXl6By9oG0yzgag3UKdAYayxtbGsXdVg0iW6RbZxdnb/gXXtptvXDKExTY/DPbyktCc7iQYKutbrJso1cjiwra18k7lgQwzFo8kxRJyyMOWElkmbvRxgY8yuab+PABUD5x/96damGVV56gg7MGvuiUpQvA6W+4haHjMwUGMBEmFoySfEI9+NmsOyfnFcaDQt8Pdn2RBOeAlsMfsEDAHVzsYrKfn3E1oszuristvnZVDa4tsazrKksp5sqwgdyZGqZPE/YhSrgQ57hyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a964cffa-fb42-b0e0-e60a-1044d8794193@suse.com>
Date: Wed, 5 Jul 2023 11:13:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
 <ZKUw2MPBhOSgG-Eg@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKUw2MPBhOSgG-Eg@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0e63a4-a52b-49f5-95b7-08db7d380a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4svr/RmGRc9jLzxDOnN6Sv597cLV0eGCI+qohoP03YDsgh83bGGl9CfUcXlwI9gHrkCoBo4hNEH5mkNXr+/b3HjOynj+x2t++wwz+qM/OJiJneYNCHI1pMx1PG85TYWTznI9ZjYImdiepukMK+QiCVsLsZFlhZGNmMuH8jvrUje25ySvyTTsTsUu+lDp8+e6Kn4Kf0oylfc+SqFa62MLRdL24So9x3p3scVmunPlmxzyDC6VfC1hFMCetpdsBr9/kU4c/KFr1ZFO+NEvK6b6SPTcqw6puqOR3H5goYasVlaZkLDJZYRuzfG5nNJOX4Z7mdFMSymJGnN4OQgJ8vye8FEDB03b6ZbsURJXRltCpoMpU64oXL/XNBMLJsgbgwUCdtj6Gdalc1JrlnYd0VDrwBUmFS38lkxyEmtqTXKryV7/xjchu2ZgakLU672GIyuupovJB8ov9+P89rCw+Y9sTBBmz2P8mdZF9Qds8iqkwuFOsjbhY45Sc4gZtZ156MjNrKiuVObJYK7DiY1QZZcz7HOFULQ0eeuAi8cgoX2jpbNHOBqH/qxW8eacd+SOuSQE0mVaLb0WTLNkwlsjFzG58gWYfGCnhkXycSdrR3NIy3jNKCNFtlNdwuvPIxhOAAd0PzVGCbtCC0RIAmafqBiOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(316002)(8936002)(83380400001)(8676002)(54906003)(38100700002)(41300700001)(66556008)(4326008)(6916009)(66476007)(66946007)(36756003)(186003)(26005)(6512007)(6486002)(86362001)(31696002)(7416002)(5660300002)(478600001)(6506007)(2906002)(31686004)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDFUbUl1V0J2Y0NBeWlnTktMWk5tM2EvTXVub1NuRzRYQTNSaUdmalNsVW4x?=
 =?utf-8?B?SmhycmNsU1V1Y0NmY3pFNHg4b3FLaCtjN2w4QUF1WXdxRHhUTVMrVkdYVzlI?=
 =?utf-8?B?R21oaUlwZDI4ZVE1djZQMndLVkJ3Si9sK0FBelJGa21YL3BCOVZYOXdGbG5i?=
 =?utf-8?B?aUsyVjJTdEsvZzZWdUJ2T2wzUHFwT0g1bjNCZFlaek0wTEczZEYxbnpON0Yw?=
 =?utf-8?B?Qm9GRmNOL0poTU1veDVCMDhNVnYrdk4rRVk2ZVJCMHZ0SlpmQ2JzWkNUckVB?=
 =?utf-8?B?TCtOUGFLVEIvM2M3YjhhZmpPaVo3VVZHckxIeGZvR0l0VmJVdkhkMmcyVXVY?=
 =?utf-8?B?QWhOell0YzVrSDEyd1hJTjg2WGN1QXlQV3hkbUdrN29FaHNmclNRRUF5Q0tl?=
 =?utf-8?B?aUxNbmRhVWNxUzkwaGgyZFFWRlVxbm5Bc3pLY3BQUlpKTGNLd0ltRlM2OWxX?=
 =?utf-8?B?b3NMTTJmRzRYRDNsNlJkK2pKM1pJM2NTYk9jb25XS1RvUVpuL3FydGxuMmJw?=
 =?utf-8?B?WmwzMHdsKzZBbHpEaElwdlplV2M5QkNFTVV3eCtvTUZlR2hUUGFQZExCa05w?=
 =?utf-8?B?aUxaZ2cwSFlhODF5WWNrM3o0TDhsY3VBRDFKN3lIb3AwRzRLc0hjUFNWSi91?=
 =?utf-8?B?R1ZwZEZnMVBGcGx0U0JFK2dXcXlHbHU0bVovNGRtdmdLaEgvL0g1N0FtNnpy?=
 =?utf-8?B?MWpRcnhmbm10UjlPWDI5aExqQUp4RDhRUGlOTVZxVHhGUDFadnhBcU52Lys2?=
 =?utf-8?B?bkJlQlFhcFdnZmV3TFhXQXZ2cE1CU2tkMWxvSDE4dlB4UkpNeUl3VytrWGND?=
 =?utf-8?B?ZDJ4RC9ZbWdRcHlGTnp3YXNVNmV2YUJQaUJPRy85NzRXeWptYmxNaTRoRHo2?=
 =?utf-8?B?VUdONDZDSnRXLzhGSldNZERpRlg4aDZSa1FrSHdhZXVsYVpXWlRrQmxTdHg4?=
 =?utf-8?B?WjV4RW8rTHgrZHhDQ3JNTHI5Q2tEQ0hYdWZsMEh1cEtzYmxwci9sN09YcGdh?=
 =?utf-8?B?M1Uxa2tPYVpzV2FKNVBRb2hEMFZyY2xDUmdPVGZEOEJkb0JUUnpZU0d3cGhK?=
 =?utf-8?B?WXU2Y2x5ZVVnNVBuT2kwekZvdjFNTXlVUldhemhyVW5BMmNPTmZJSERVeVQ5?=
 =?utf-8?B?MlVad3BEWGYxa3o2SXR6QUR1RXJsSFFlbXd3UHB1cVlkMkhSOHNpUkorcnM5?=
 =?utf-8?B?SzBTS21EYW9lNVpDclc1ZDVpeS8rWFMvVVFlR0ZTcXRhNWtiMjhHR3lSbXg5?=
 =?utf-8?B?UVdjS3lEZDVHR1RTYTBSYkQwZEJ0ZDhZd2tmWE9xTnRTbVdueXBoT0RsMGlY?=
 =?utf-8?B?UzJ3N3BFMmY2ekV2SzJnTU5SeW9ZKzJ6THkvZERWb2FUNGdRWUY0YXBtVGNS?=
 =?utf-8?B?cjhuQ1I3UFh5enlVVGd6T3dvSWtjdElJczhBdkVmRGZXejhjSHUxUUVCSHJN?=
 =?utf-8?B?N3gvaGo1eWZIb3lMM3VrVjQ2T01YNVRoL2FjdGtwazhWdTNiYTF2U3hSR0Uw?=
 =?utf-8?B?WEg3bW9LRXZJWUtvTForVGQzTXRYc1c3N0hJcUd5VVZPaU5JYXpFRVZhM3BB?=
 =?utf-8?B?RWtnQ3UxWEljRVRLSzU2R1c3Y0pXRnNOTHVyNkNteTZvVFdNV0FMMi80cUdh?=
 =?utf-8?B?bmI0dVYzZS9lYXc5dU54cDdudUVaS0x4RjVxS1p0ajM3YjFGV1orTnV1RUtC?=
 =?utf-8?B?czV1ekNHZ0NTNm9vYjQwS1pZYlJ6SzlHZ0txR3RvNVFON1U0YXp5OTYxaTdw?=
 =?utf-8?B?cXdZMkRwaXBLYVllbmRYZEp3TGdEWmdOVDlUM1JxbVQ5OHE0bVRtS1pYUlND?=
 =?utf-8?B?Q1VnSzd5QzNvenEwYXVkelp3cjlxNGp4dStQdmFnK2tHWUpzWDAzdW16Snp4?=
 =?utf-8?B?VTlkQTRtZ1N0MUp6MU1KWEVVVnByVUlCa0c4Z2t4aHRSNFdVK2hFRU4wWnc0?=
 =?utf-8?B?ZVNZbzJMNHp6bGJkOGdZV2p2SFFJakg2RnlvRmdXdnlIQXN6eEhxWUxzUTdx?=
 =?utf-8?B?VWpHUUpOSzZhVEtiUE5hRDhZZ2FPSGZ2MnVjZXg3czRMY1ZSSWlYMFNJdVdT?=
 =?utf-8?B?UTNRb2pDQW5PaTc1dUNBK01kKzRhNUh1UVZ6YUtUQmpxQlMwZW9qcEdrc1JQ?=
 =?utf-8?Q?TW2lBFV2puQoEF4xaDvITQmAp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0e63a4-a52b-49f5-95b7-08db7d380a6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 09:13:05.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr23Ccx7ixmFS/NvrvCdEwVnICoHvtQihNi3JsHNH1LQFZMPIzQAAMpuZyq6NSrnYmlBH4C4rIXghDNQCMTw8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508

On 05.07.2023 10:59, Roger Pau Monné wrote:
> On Wed, Jul 05, 2023 at 09:11:10AM +0200, Jan Beulich wrote:
>> On 04.07.2023 23:03, Volodymyr Babchuk wrote:
>>> I am currently implementing your proposal (along with Jan's
>>> suggestions), but I am facing ABBA deadlock with IOMMU's
>>> reassign_device() call, which has this piece of code:
>>>
>>>         list_move(&pdev->domain_list, &target->pdev_list);
>>>
>>> My immediate change was:
>>>
>>>         write_lock(&pdev->domain->pci_lock);
>>>         list_del(&pdev->domain_list);
>>>         write_unlock(&pdev->domain->pci_lock);
>>>
>>>         write_lock(&target->pci_lock);
>>>         list_add(&pdev->domain_list, &target->pdev_list);
>>>         write_unlock(&target->pci_lock);
>>>
>>> But this will not work because reassign_device is called from
>>> pci_release_devices() which iterates over d->pdev_list, so we need to
>>> take a d->pci_lock early.
>>>
>>> Any suggestions on how to fix this? My idea is to remove a device from a
>>> list one at time:
>>>
>>> int pci_release_devices(struct domain *d)
>>> {
>>>     struct pci_dev *pdev;
>>>     u8 bus, devfn;
>>>     int ret;
>>>
>>>     pcidevs_lock();
>>>     write_lock(&d->pci_lock);
>>>     ret = arch_pci_clean_pirqs(d);
>>>     if ( ret )
>>>     {
>>>         pcidevs_unlock();
>>>         write_unlock(&d->pci_lock);
>>>         return ret;
>>>     }
>>>
>>>     while ( !list_empty(&d->pdev_list) )
>>>     {
>>>         pdev = list_entry(&d->pdev_list, struct pci_dev, domain_list);
>>>         bus = pdev->bus;
>>>         devfn = pdev->devfn;
>>>         list_del(&pdev->domain_list);
>>>         write_unlock(&d->pci_lock);
>>>         ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>>>         write_lock(&d->pci_lock);
>>
>> I think it needs doing almost like this, but with two more tweaks and
>> no list_del() right here (first and foremost to avoid needing to
>> figure whether removing early isn't going to subtly break anything;
>> see below for an error case that would end up with changed behavior):
>>
>>     while ( !list_empty(&d->pdev_list) )
>>     {
>>         const struct pci_dev *pdev = list_first_entry(&d->pdev_list, struct pci_dev, domain_list);
>>         uint16_t seg = pdev->seg;
>>         uint8_t bus = pdev->bus;
>>         uint8_t devfn = pdev->devfn;
>>
>>         write_unlock(&d->pci_lock);
> 
> I think you need to remove the device from the pdev_list before
> dropping the lock, or else release could race with other operations.
> 
> That's unlikely, but still if the lock is dropped and the routine
> needs to operate on the device it is better remove such device from
> the domain so other operations cannot get a reference to it.
> 
> Otherwise you could modify reassign_device() implementations so they
> require the caller to hold the source->pci_lock when calling the
> routine, but that's ugly because the lock would need to be dropped in
> order to reassign the device from source to target domains.
> 
> Another option would be to move the whole d->pdev_list to a local
> variable (so that d->pdev_list would be empty) and then iterate over
> it without the d->pci_lock.  On failure you would take the lock and
> add the failing device back into d->pdev_list.

Conceptually I like this last variant, but like the individual list_del()
it requires auditing code for no dependency on the device still being on
that list. In fact deassign_device()'s use of pci_get_pdev() does. The
function would then need changing to have struct pci_dev * passed in.
Yet who knows where else there are uses of pci_get_pdev() lurking.

Jan

