Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341A74CCB9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 08:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560907.877067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkFt-0005d6-Kz; Mon, 10 Jul 2023 06:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560907.877067; Mon, 10 Jul 2023 06:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkFt-0005aB-HB; Mon, 10 Jul 2023 06:20:17 +0000
Received: by outflank-mailman (input) for mailman id 560907;
 Mon, 10 Jul 2023 06:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIkFr-0005a3-9k
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 06:20:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2fe04c7-1ee9-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 08:20:12 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 06:20:09 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 06:20:09 +0000
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
X-Inumbo-ID: d2fe04c7-1ee9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObGjFPmS1yPE28LRMECfuqOHnX2J4Ousxx1q0Ya+pljHGE9au2QKvh+MBh4yquOc0qEzdKeHYAxquYsuwOaAfexwNXFSLjGDQBBRbhpjx9PIEbjVGrguGWJVOg1Zc3ij/84vKrPzo6K314l4d331X76YAV5kUExrzzJ5n0XpYgFc8+fm6TNu1S6VaNRhKY33cdq/Ynccq5SF6+osuDUeTrLsl6z7IEd2wc1Yilua5Pc54cOuS+OnQUavqrrm0R1lyUzdoj5jVepOrlKX9i2lLu2DPGFGAy0UshZ/9cLN0pDPgqIPhLEMqTWOu34urNt8NGu5GHAlEPBAO7RJok4F0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPH02SSkTDOpBwnH7L7MImm6UfRFH1sdvzqPO8HquIk=;
 b=H9H17r/+nmDpjNixwG671ZON6HHlag7Jle9i/m33NZJNJew9+Qp1CF6PazjNPHuZ05c67tzWHIeKp6TF32WsCn9623jGlYJ5LDzrFc/s0PPGcdwH0lRggTYclFMuhwnMyzROVeSnUoDkuy44zli9QJZPbtHntmLEKBSUeLfIBkiUazmU5cRtdwLdzFyeSSThbslrr8vecjIGgM2aXweGomd7ufP5Y4DnH8z4b/iloJmBnqaUiIT0cAp1wP9IfO/OriiM+SL9w7v9j7iR0Bf5g9E+HgsUo6R077r5qT+K+nr8XkClWcD5ZwNLVU67CPmeTKQwVbmC9rNzQzE0OLZBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPH02SSkTDOpBwnH7L7MImm6UfRFH1sdvzqPO8HquIk=;
 b=hxMWHRCywZMZ/v2A84H9ZkWgEaDTupBg9t6x9MTyUF+lT320ttpc6ESgH1lbAF72+k8HcQo5Yp7JHR8qX1wuUAz79T2seCvyVrY5JQpbH7p9BbxEtgQBPZUAndv1afoVjXpCmszhxNy5GF/2Co05BCKaOOHmcmtaybl32qDZLUqBBSkR76qe4tSYHLRhHHv2we8D2C3l1dGkAkEvRBMdXJ2BprE9EsfxeRV09OOIw8BBTeamAy1dOT6XOrnW3YiCTObzng//H0XrQlhwO6PP8ccyvDnN3g+B1mEfamRdwRC/vbR15cxvBZ0HAyLGAGw/hl7oaDD03shTplLOw/bqUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04738efb-d74c-8151-9b75-8c30335f2b30@suse.com>
Date: Mon, 10 Jul 2023 08:20:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com> <87h6qchfn4.fsf@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87h6qchfn4.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: fd89f318-b3e3-4697-b2ac-08db810db5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WUtYBu3AHXJlhsd6DwBhZHK+b7EpVPAMrRRExCvAeoKbKS+ZcwJO6IBuc2N8C2TK5+BPpenGB/2cfSGmLhIm7tu7sHDzovYQeSM3I+j2obgQ3mkX3vi0g5eeiBKvNCNUPenJie6qMdZ2K6hgcKgwxfPFVu7eoQFZf/g2KmEx/odUr2TVLumg4gkyJmcSFwsM5aitpzwlZ/Qv0n1JMrEWOkSxW6PkQCBO466O6nTsxNPc6ZeMVy1g+xn/x5ya2Mr2O9iI8KeZJVpPDbU/iV+0y4yX16JyFD62kcr6MRFJ5pdTK3J+mT6h+mP+zvRJn253xmeYvMOOyqqVkSRVHuBataPDC/L8sIRtKgixhIOYBcPbutlJsiHU742URo5J8ubzah42u9qjVRt5h4sMgTxoRaCyFD4i+pyYO9gegJkvHZuEuosOKlIoZ+FjuUWchQCq+wdAjhwYNQAYESyyzd/DJunYzpty9pB1IU9Oyuc3y8b3N2RuTPSCOZHJVOokbSyquqKxv7Pg57ziFC2Uvj0IJD70GMCLBFJAtoyl5Viezto1eb8V63BIhOoGGLNJ5UWYQp+ob5sTpkBX+B0D+wrymR4oskfJin+ZgWGKxfAwn2LtXmsaKTRek4iKVASwTFV+fh6uNyD/7vF3k7SI/S6WxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199021)(41300700001)(2906002)(5660300002)(8936002)(7416002)(8676002)(36756003)(478600001)(2616005)(31686004)(26005)(6506007)(6512007)(186003)(6486002)(86362001)(6916009)(66556008)(4326008)(66946007)(66476007)(54906003)(83380400001)(38100700002)(31696002)(316002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmY1dTFhQ3l6cms2YXZodWNXK0RWeW5RS2ZxMVdCUERPenNVVjZ1T0EyRm9Q?=
 =?utf-8?B?QlhPSHBnT0R6YzdhZk45MVZOMm11QkphMlFTbElTLzlPemVsLzFMM1hqN04z?=
 =?utf-8?B?L3R1VzdqMW5qTFBkTEM5Q0lzUFRWWkUvU2YzMzdFSzN5UFZPa3MzZlNGUjJ6?=
 =?utf-8?B?Y0dkSmpFTzBnejZ0dDJtcEJ0M1FhaWVmenZtWXkxUVRQMURDTjJUYWhBT282?=
 =?utf-8?B?bG9GQlZ4amt3Wk05SHkrQkYwRkxrenB0MDUzdFZjZmZ5OVNpdW5NV1BFSlJx?=
 =?utf-8?B?ZWVnNmtXM2RBcHpuZUVFVUtzK0c3ZGU4eWxmbWJuOUZ6OGtPSVd5Um1ORzNU?=
 =?utf-8?B?Z1RxbGlxRFNvb0czbGgzRitkZzIxQWVSRjJEeHV0WWd0VGJLWjdQNE1TRCti?=
 =?utf-8?B?SDczbW00dHM5dzJqYlZYaGNiT1V4OUF5NU44c0VOdHowL0JWMk1tWm1XYVE0?=
 =?utf-8?B?blg5ZHRRdC9GcmhyK2lnMEoxQ2QyeVBQcExTTGdleHZWekpPbXNEajFMY3Yy?=
 =?utf-8?B?V1BabUVDb2NUUG1DbWRBdEFpUUdWOVBoYVI3aXdtcWZPS09wM1Fubzc4TEZs?=
 =?utf-8?B?OC9keUMyc2swVW92SWpUQXUwU01SZUVHWTEvOERYZDRRZEdrSkNGd3ZHS1Vi?=
 =?utf-8?B?bUk4eUVVcWlKZjh4cTJSLzdwdyttM2ZtaG9xVVQ2QW5jcjl5RFpGbnM1N1pi?=
 =?utf-8?B?eVpoR3lUWVNKRGdMdlpxYUxLTCtDL09lNWF2c25id1lPYitEL0tYMWJ2ekh0?=
 =?utf-8?B?RjBCb2g0elFQZ1JrM0I1aWllcFI3WVhBbllzUWZOQXl5SXd4RGVSbTcxemUx?=
 =?utf-8?B?QlY5WDVZVWQ4TUxmWVNQVGF6b09idE1oUUJMSk42bUlRSlFlZzFPdEgra0M2?=
 =?utf-8?B?TDJLYUhSTWowM0REWCtpRkVHVXRPU3FHQTFCWnpha2tORFpIQllzVlpYenNE?=
 =?utf-8?B?K3U5bU5NR3g3SzJpbzZ6RENwQnBTS0dVY25aR0F3RUlTOUJUcUYyQi9BKzh0?=
 =?utf-8?B?enBDZ3AzcVhCUU55S0tFK00yM3dsTURTT2Q0QVV5bVhIKy9BT1FGQTZ6YmpJ?=
 =?utf-8?B?alRzakJsUHZPTjIxUkdrZmQ1VFFQd1hRSzhSNXFtVEVIcEZQZTAwVE16Ris5?=
 =?utf-8?B?cGFZVDlraHBEazF2K3JpblZJMVpjb1pGNlVSREFFUXJSWWFmZDM2bEo1Vjhr?=
 =?utf-8?B?bVJxNDFJUEhtd1MxVC9Tc1B1M0xLVkR3K1VJS1NicEgzWVMrUWUvT1FpTVd2?=
 =?utf-8?B?dS9vamdTTEdSWVNxMUdwRFJoME5lVVo2ZnF6eTBPU1dNL28rU3BWYnZDdXpM?=
 =?utf-8?B?MVBjcTJWNU1lcW94UUppU2FHNnB3V0xXZkdYNExVeFVWWEVEYlFvZjZhQnhv?=
 =?utf-8?B?MG5tT3pMRi9aMmltVkRLWk8va1d1STNKbjQ3NnNEb2src0picGFQc1M3MnRY?=
 =?utf-8?B?SFNXTUlXMm9yWFJMSTFCSmR5KzI1TjVJdVlvQnJIMlY1ZEpEeUlGdFJHeTJi?=
 =?utf-8?B?dXJmVHI5RG84VXAvWm80QjdjY0pUNk41a2F2MGF4QTE0YTVDV2Iyb2xCbkhZ?=
 =?utf-8?B?dnpFS2ZpMEM2RjBNckI2eDJ3MTh1TEdkK01JYm9IVTIvU3JSRU5IVCthdWFT?=
 =?utf-8?B?eWoyeGVFbnJmbFA4N3VEWkpiQ3kzYk5XUVFQOVRjZStEL3UwbUgrTzlaVVNK?=
 =?utf-8?B?T0c3Z28yVTBmZFZvWEVNenhzMUY4eWVxMlBscGRnYUZmejNvbEpRYy9zN3BV?=
 =?utf-8?B?SjdPbzNKNHFIZU9CclgxVklEQWdvQ0kvQ1NsSjNYWWUvYnB5dDdFVzJ6MkJk?=
 =?utf-8?B?cEkxaXF4dGJPcnNaSnB6TDhTNlFBZ1JDdnpUWjRjVGdDdlZxSitNbzh1cnNF?=
 =?utf-8?B?Q0JhamNhRkU1WTVhdTNXejVIRlFMN3FWZS9QZ1VRTmxHRWNna3ZRRzBQMlpI?=
 =?utf-8?B?bmUxVDhCVVVBU095QkVGd1I3ZFdLbUp6TDY0QzEyUms2UEt6bmNlcUtpcGI3?=
 =?utf-8?B?c3hDdlBzalNlSDF3RW1JRTNlSkZ6bnowYmFqa3VyVUxCRStJMG5XdCt6MFFF?=
 =?utf-8?B?VndaZnR5NHM0VC91Y04yQy9BWklOVDBVYnhlTytobXlSUVg2dmJHZVBRcnZE?=
 =?utf-8?Q?Ew+ZxwTjhPVllLZBVPY2HyFGc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd89f318-b3e3-4697-b2ac-08db810db5cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:20:09.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoFSahnjWofqn5+cNqH+psosSd6FCBfR7tig80erAgGwv3mrjX/bsEfs2ZzGHt8lJKSMgSxIhhxZnJb56Lch+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8563

On 10.07.2023 00:41, Volodymyr Babchuk wrote:
> 
> Hi Jan,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
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
>>         ret = deassign_device(d, seg, bus, devfn) ?: ret;
>>         write_lock(&d->pci_lock);
>>     }
>>
>> One caveat though: The original list_for_each_entry_safe() guarantees
>> the loop to complete; your use of list_del() would guarantee that too,
>> but then the device wouldn't be on the list anymore if deassign_device()
>> failed. Therefore I guess you will need another local list where you
>> (temporarily) put all the devices which deassign_device() left on the
>> list, and which you would then move back to d->pdev_list after the loop
>> has finished.
> 
> Okay, taking into the account all that you wrote, I came with this
> implementation:

Looks plausible at the first glance, but will of course need looking at
in more detail in the context of the full patch. Just one (largely)
cosmetic remark right away:

> int pci_release_devices(struct domain *d)
> {
>     int combined_ret;
>     LIST_HEAD(failed_pdevs);
> 
>     pcidevs_lock();
>     write_lock(&d->pci_lock);
>     combined_ret = arch_pci_clean_pirqs(d);
>     if ( combined_ret )
>     {
>         pcidevs_unlock();
>         write_unlock(&d->pci_lock);
>         return combined_ret;
>     }
> 
>     while ( !list_empty(&d->pdev_list) )
>     {
>         struct pci_dev *pdev = list_first_entry(&d->pdev_list,
>                                                 struct pci_dev,
>                                                 domain_list);
>         uint16_t seg = pdev->seg;
>         uint8_t bus = pdev->bus;
>         uint8_t devfn = pdev->devfn;
>         int ret;
> 
>         write_unlock(&d->pci_lock);
>         ret = deassign_device(d, seg, bus, devfn);
>         write_lock(&d->pci_lock);
>         if ( ret )
>         {
>             bool still_present = false;
>             const struct pci_dev *tmp;
> 
>             for_each_pdev ( d, tmp )
>             {
>                 if ( tmp == (const struct pci_dev*)pdev )

As I'm sure I expressed earlier, casts should be avoided whenever
possible. I see no reason for one here: Comparing pointer-to-
const-<type> with pointer-to-<type> is permitted by the language.

>                 {
>                     still_present = true;
>                     break;
>                 }
>             }
>             if ( still_present )
>                 list_move(&pdev->domain_list, &failed_pdevs);
>             combined_ret = ret;
>         }
>     }
> 
>     list_splice(&failed_pdevs, &d->pdev_list);
>     write_unlock(&d->pci_lock);
>     pcidevs_unlock();
> 
>     return combined_ret;
> }
> 
> 
>> (Whether it is sufficient to inspect the list head to
>> determine whether the pdev is still on the list needs careful checking.)
> 
> I am not sure that this is enough. We dropped d->pci_lock so we can
> expect that the list was permutated in a random way.

Right, if that cannot be excluded for sure, then better stay on the safe
side for now. A code comment would be nice though ahead of the
for_each_pdev().

Jan

