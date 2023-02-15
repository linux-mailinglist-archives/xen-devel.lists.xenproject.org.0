Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1A6978A3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 10:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495774.766201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDkh-00081I-KI; Wed, 15 Feb 2023 09:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495774.766201; Wed, 15 Feb 2023 09:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDkh-0007zb-Fb; Wed, 15 Feb 2023 09:06:59 +0000
Received: by outflank-mailman (input) for mailman id 495774;
 Wed, 15 Feb 2023 09:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSDkg-0007zV-Jj
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 09:06:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18eb7269-ad10-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 10:06:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8688.eurprd04.prod.outlook.com (2603:10a6:102:21f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:06:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 09:06:54 +0000
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
X-Inumbo-ID: 18eb7269-ad10-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8urDbEM7dghsVBUxUYrsI1G19o6qoe8qZj9Er/2LChMLMc8be8Ir3/UMrKsMsKK8/m//e31XKnYt+AsFuOBxr9DmTuCPtHxM9c2HHhKa4IoGYORc7Qu2HtXhVAnoGVSDkB/g08meS9rUUBGLUTYarpHBIKldpAHT1Y7lKtVpteIugThf5jBFexI3Vt7Q0+EsR9GUL9IZSW/Jj3vk9nRf6U5WCob10IXPRmhyAQfoJxVOCs7kWqzHw/HoXgydm+LFrdISorE9uYN8iksh9iBwDZ6c30c2qGwGEhKLX2CpI/j/nUB3GxGHaoEWqQJw701VMw/XwbpbZ0N6Efso+evEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAMQHtUU+jC5CWIjD7TLCZeWF3JSpL7vegAHmsKnp38=;
 b=FjA3TKlrVuEvJ+vOGipnjw9tAkj4cZGkIjZfbMU08fWbnfcqNpwuWnQuHS5kO5oBpLkQ+QKCcnzaD+ilRUTwIDMRb7I928FZZlDAZsM6rYiyEtCBIXAeVb2ujU60N2t7K/1i4YGbOIUG5VXbnx17PUlJ6duIpVj8fY+MFvdqvNFf/+ODN/p0miWCK6EplzDYRYZMtB9i3RpvnVdvIBCOJwfcALUYJWeEJlQUdPvvVRvzj6djtSPWfEz33zwS+Pzt4r7swBicC/PoJ4vynuDOXF5NCZjc9UuGVig+SN8TYt78pzYBRY02fiIGDtEBtha8oAcuvuhv9eyKvQNggAWRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAMQHtUU+jC5CWIjD7TLCZeWF3JSpL7vegAHmsKnp38=;
 b=YyXJYLtS2+hVTa2vTeJU6+JFOBr7wZS9lTcU3MiCFTaQuTnnK19TqNuiNlIO35gW6CP3hub2CpFlZ703AzAxM0e0J2qCC9DcoAIsiSgQHdFCm5iBHm5ik2u9AkGjAhu8Rf3Zudt/LqI0nhdoQBJdpRj4wjHv0x9ux5iDt8T/xrbSuzKHW1jPbY4T0ROyDuMAUq5jrXU95Cdb642i3lOVUiFFbQ90A/+DZvgK6Cl6WO3Pyczko3L18aIDrAgtAD5y6DgeF953Qqxfv7QsESZaJQlS8/jKBBRBw/o7j+b8jrO7kSupG73LWeYpcFKdlOzFHv0+bb2t9+acNZE620alNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <601d0ee8-3522-74b9-a6a3-9a5ac00c8093@suse.com>
Date: Wed, 15 Feb 2023 10:06:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>,
 "Stewart.Hildebrand@amd.com" <Stewart.Hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-2-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
 <87cz6b3ji7.fsf@hp.mail-host-address-is-not-set>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87cz6b3ji7.fsf@hp.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: bbedd4a7-34da-4aa8-7c2b-08db0f33fb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3lqrT/BHU6oDr1NZlZEmyErABJemSo+/xVYQoKMQFzGJ137puNw8KFA9t+ohnwvqTJDF29o5Syft4SdDGIyUijpc0bJZNX3E98Ltb0DhwsIouzhVM333+7c/tQCNWzmqeGM7kGTcJmACP5HxTztxR3+arVL45fwJK2WazAaoyRwuqW5R1YYYL9Dbn3BM5dP8fwrLNhDOzfwj/LClgDGsvlNjFZZTsSz1JHURXVBBdbRRE7nb9yZnDneKe1rH2h8rsfkErV1bdFAPG90c26AqqN5COnZnCEC5miIdazGgRKU+isuDkO8uEuBofjwL7DWu7+3xCK+T33WPOTODqsQ2vtSWWWSWuL4dzp+1SUzRZmdO05t8KE+R7ZQL3g7bU+PmuX5CYft3xQcvQ+iDhvdRMG5+5ryJ7u4NPGcu/gIc/7w7XO+UiV7isTOw1AgzL9iSlmwjvnCtHZeXqS9sQEnAXpPLbO8L6i3goCGTLERUQIJKhwak7o61tpDXiAX23o1ALXT0YstjauN6MnDC9UgHX2eVeqByWBVgX6oSccGGF2Uwrn8p5JMvt317m/mtOEmEEa70B7GhFn/8EpM1OmqKRMI3/8sJ9vUU/nVrjTF6CnLUC0EQfnU1N+99q/l4anluAUtfYeovvyZqqcPt/x6d4hOjqCYHw+kMuUlpEVU2Ig6Jjb2xaUj1a4Y26vaIyIkDGEb1fNs+mqzlU2O6LzSnxEqKPiuAmn4GMQnsFtLG3PI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(31686004)(36756003)(86362001)(38100700002)(83380400001)(6486002)(2616005)(6512007)(53546011)(31696002)(6506007)(478600001)(26005)(186003)(66476007)(4326008)(8676002)(6916009)(41300700001)(66946007)(5660300002)(7416002)(54906003)(316002)(2906002)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFdZS2huZWM0S204WVd3RjcvYjMwbUZRSHpaYVdPenFXMWdnMk9uMTRwaU5q?=
 =?utf-8?B?Rm0vbkt2WGU5alkrcXNTc0dYMG5IYU44WU9QRmszU3RJN3kxRUp0OUVPQThl?=
 =?utf-8?B?Mi9IQjlLckxIOUN1VFY1aWxwSnFVNWtOdTROOE90RmlJSGlWTVRxWjJYNWNa?=
 =?utf-8?B?R0JOclFLMG5admRodlJuRkxtWlBDbW91N1ZJUURwdjJQMy9OcmFmdUYyaTM3?=
 =?utf-8?B?YXF0bTk2N1Qxdis1NVhOeGN3RmxLYkhaVzZ4a0Q3LytYbzgrcWVPVVkwa2Ry?=
 =?utf-8?B?MktNOFJNL09IVDJsWTFtVUMyc1duVHd5bWRlSGRXa2d5ajBIZzRDdDczRWEw?=
 =?utf-8?B?cHJXbVVncTFmSjBVRXJERDliaFJYejduNnh4NXc3Q3AzcVRNK245ODEyTisv?=
 =?utf-8?B?eDlvL1Z3YmdIV0JMclJ4MndwLytMcHloNGp3c2FmYmRtWVVFUVFQR3lHRnhy?=
 =?utf-8?B?VmsrL2FBTFRjRlZvTDhDVXMwSUFEQ2YrZDlQbk02Rkl1eHNNc0E2ckpmZ0Qr?=
 =?utf-8?B?dCs1MS9keE9OVndKbnNoN3lRRlVNUzRzU2JhMlFZN0h3eTBsSmwycGREbHo4?=
 =?utf-8?B?MlQvMTloaEVCWWt6VGpURzVHUTQ4WGk4aGdZTlNNTHR1QUFCdlFxU3FBYmtW?=
 =?utf-8?B?R1BUcXZlSlltZHlZMlBtdmw4OWc1a0hVaVdWWVUxYzhYVmovaDJDMHhSMEF2?=
 =?utf-8?B?ekt2aE9ydzJXZFUvK3djOFN0UTB3K012T0krNitpaXArZnR1Y0t2dU1UUUww?=
 =?utf-8?B?cGp6K1dpdXozVlpCL1AvZXJIMVBJUVB0aktZbDVMSzVKbHJSUEZYWFlMMTFN?=
 =?utf-8?B?Q2t5TnNRUnBDYVhCTjJoSGlrd1o1OE5mZk9zakNuVTcycVNvNS9MNTJZa2Rv?=
 =?utf-8?B?VDhTTTRrSERNbDBaU3FKUGdiemxndmNkbjVmOW91Y0duZkRkZW9VRGlaeVds?=
 =?utf-8?B?bm5LMml5ZDhaU2RWYjZRMVBlYVIvRDBXdUY2eHB2VWpraWoyT3k3TkREd2lq?=
 =?utf-8?B?bnZvb3RrV1RJbVV3TVl4ZGYwa3J4WTJKd1lNNVNxeG5DVzh6TE42SzM4MUNq?=
 =?utf-8?B?RkpseEs4NFd5bDdENzlRR3V4WlFyaWhURmN0YzdqYlNzd3ZEc014cEZuU1lz?=
 =?utf-8?B?MmVHNHpwTCtua1pWWCtvRGpDZS8ydDdDNktkN2g2L0VJQ0FScndCalE1NHpV?=
 =?utf-8?B?OTBNZFV6VVprTjREMHhDallRdWtvL2Z1NXJZbXordWFTRFdNWDBuMEJiVk1q?=
 =?utf-8?B?aUIvRFdTN2o1RWNoOGgwK1Ezeit2TjFiNUcyMWwrNWtvU3dLcDZSSGp1cG12?=
 =?utf-8?B?VE1hZ3FmWnZ0QVlyUGhvUko0S0hZeWIzQVdDQ3NxVlpsRkJDUFVDVzZnWFND?=
 =?utf-8?B?MTRWd29wa0x3d250Nlpla3g1WWNVcTVkeEh2RVJsZnFVcnBqNGI1QXhhNklG?=
 =?utf-8?B?YTJXc3JNNm9vYlBFYndReFJpa2Z1c0d6Y2NWWExVeTJYYlRjb25ZZFRWNGxF?=
 =?utf-8?B?dlBIUWhMdHdPTDVyWkdJZHphc2hveUgvK2ZNRUh3WFJPekNGZUkrUjJBQWEz?=
 =?utf-8?B?SEhoYnhiakRBWEZMRUtvWjArSDBjaTlMc0REY0FyZlRwNXV0dWtSeGc3NFF3?=
 =?utf-8?B?dHh2ZDhJZ2Zod2c3Vm10NU4zY2NJTzJ5bnkrNEw2UTVFUmgvWFVLRVh6bVkz?=
 =?utf-8?B?WWhyVFAzelhNWStWUlpVYlNzTCtxYnVUZzl0WE1wUzA3VHRmbkJxU0Q1SmV5?=
 =?utf-8?B?VW5jSlN4Y1ZNQVlFTE9SY3k4WDlkYk9xZExLVlB0R1oxTUhTQXdOcGFjU25P?=
 =?utf-8?B?dFZ4YzlvUGpIWGdJSWVIMTQ3K3hHdU9qOEtuZXEvZFBOKzRlUnk0NmNzRXpu?=
 =?utf-8?B?L1dHaDEzWHhpaVFqVTFOUGdhYmFHVWxzWEl3RTB4dE9SbmxGUnVKK2tDWHZq?=
 =?utf-8?B?Y05PTEFhVEZVSFZzY3N4K1JxWUFPc3dXdFZqdStKaFRmUWZyR3YvcTc1ektT?=
 =?utf-8?B?ZEFZSFFZQSt3NGY1RFBva2Q0L05Jd3VKajBpcG9CM1oybFg3MmVqNnFtbHox?=
 =?utf-8?B?eVhWajRKSHNsdmdVWmFCdFQ1dUdoK2lXcVV1Q1Q0dW9uZzlrSTlqUVV3K296?=
 =?utf-8?Q?RM/jUh9yZ2hF2oxDG9wmRyHUP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbedd4a7-34da-4aa8-7c2b-08db0f33fb8e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 09:06:54.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLjMJW+NyUR2G0nBsj9ocidjH/Qt6lp1PP1hbHeXqzAj89wuHk8blADb8JqJB/HRW5z2UgdKBXAo9aA7kqSMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8688

On 15.02.2023 00:38, Volodymyr Babchuk wrote:
> Stefano Stabellini <sstabellini@kernel.org> writes:
>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> 1) iommu.c:reassign_device_ownership and pci_amd_iommu.c:reassign_device
>> Both functions without any pdevs_lock locking do:
>> list_move(&pdev->domain_list, &target->pdev_list);
>>
>> It seems to be it would need pdevs_lock. Maybe we need to change
>> list_move into list_del (protected by the pdevs_lock of the old domain)
>> and list_add (protected by the pdev_lock of the new domain).
> 
> Yes, I did as you suggested. But this leads to another potential
> issue. I'll describe it below, in deassign_device() part.
> 
> [...]
> 
>>> +    spin_lock(&d->pdevs_lock);
>>>      list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>>>      {
>>>          bus = pdev->bus;
>>>          devfn = pdev->devfn;
>>>          ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>>
>> This causes pdevs_lock to be taken twice. deassign_device also takes a
>> pdevs_lock.  Probably we need to change all the
>> spin_lock(&d->pdevs_lock) into spin_lock_recursive.
> 
> You are right, I missed that deassign_device() causes
> iommu*_reassign_device() call. But there lies the issue: with recursive
> locks, reassign_device() will not be able to unlock source->pdevs_lock,
> but will try to take target->pdevs_lock also. This potentially might
> lead to deadlock, if another call to reassign_device() moves some other
> pdev in the opposite way at the same time. This is why I want to avoid
> recursive spinlocks if possible.
> 
> So, I am thinking: why does IOMMU code move a pdev across domains in the
> first place? We are making IOMMU driver responsible of managing domain's
> pdevs, which does not look right, as this is the responsibility of pci.c

The boundary between what is PCI and what is IOMMU is pretty fuzzy, I'm
afraid. After all pass-through (with IOMMU) is all about PCI devices (on
x86 at least). Despite the filename being pci.c, much what's there is
actually IOMMU code. Specifically deassign_device() is the vendor-
independent IOMMU part of the operation; moving that ...

> I want to propose another approach: implement deassign_device() function
> in IOMMU drivers.

... into vendor-specific code would mean code duplication, which ought
to be avoided as much as possible.

> Then, instead of calling to reassign_device() we might
> do the following:
> 
> 1. deassign_device()
> 2. remove pdev from source->pdev_list
> 3. add pdef to target->pdev_list
> 4. assign_device()

I'm not sure such ordering would end up correct. It may need to be

1. remove pdev from source->pdev_list
2. deassign_device()
3. assign_device()
4. add pdev to target->pdev_list (or back to source upon failure)

which still may be troublesome: The present placement of the moving is, in
particular, ensuring that ownership (expressed by pdev->domain) changes at
the same time as list membership. With things properly locked it _may_ be
okay to separate (in time) these two steps, but that'll require quite a bit
of care (read: justification that it's correct/safe).

And of course you could then also ask why it's low level driver code
changing pdev->domain. I don't see how you would move that to generic code,
as the field shouldn't be left stale for an extended period of time, nor
can it sensibly be transiently set to e.g. NULL.

Additionally deassign_device() is misnamed - it's really re-assigning
the device (as you can see from it invoking
hd->platform_ops->reassign_device()). You cannot split de-assign from
assign: The device always should be assigned _somewhere_ (DOM_IO if
nothing else; see XSA-400), except late enough during hot-unplug. But that
would be taken care of by the alternative ordering above (combining 2 and
3 into a single step).

Jan

