Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D141D5C0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199622.353796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrnE-0001rQ-Gu; Thu, 30 Sep 2021 08:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199622.353796; Thu, 30 Sep 2021 08:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrnE-0001pd-DW; Thu, 30 Sep 2021 08:51:52 +0000
Received: by outflank-mailman (input) for mailman id 199622;
 Thu, 30 Sep 2021 08:51:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVrnD-0001pX-Bp
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:51:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a587f124-21cb-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 08:51:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-Nv0kNwjDPjCv_DZIVZ0xTw-1; Thu, 30 Sep 2021 10:51:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 08:51:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 08:51:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 08:51:43 +0000
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
X-Inumbo-ID: a587f124-21cb-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632991907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anyY2T1rcTg5NsX7B+m+J3daanHfu0TPvhigms+KrTQ=;
	b=A1UZIOLOAb9wpCGGCPnVtC68aSVw+cZcKfdeqC+kyr6ACEbeuiL+b0Zc1/XzyCMPfvtwvS
	IZxkbTVvYQGKTNszpaG2+mZo+susKRDYZXWR6aPpDAAwD+P65JJwNn2J6TWuUlOlltkf07
	VtuMtHEh4W2ldVjNXm8Z1C0VX6rLKRs=
X-MC-Unique: Nv0kNwjDPjCv_DZIVZ0xTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/BTrIay8XC1fXcRA+mFyrbuXu2wgGiDGkle4KOU9ZVQCE0xeJ2Fp+c2geCKsuNW4kny+XKa3flHOo+4A/ZmwA5v2NeSY1V9tyl+p0ZjRHdqwnfLvGdSy2vf25FlpCH79uq/77/i6OR1s2dShaJpd20GNaC5Vtyu5ImgUdJAATh+n7p8YSJdgNnRuxuRTOA1oLHTxSIS7/zfGa26l2REW6qewp3aU01wRdEwdU18utFm6FcioAGhL89a2LdmnkojVuWTrm4RB2J1hXQj623JmAxHWxkQwDhAE54A+p1KgimU6TPVj7Rzi7QShTzmXVQfzsLUqVybjJqk12NfkgDLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=anyY2T1rcTg5NsX7B+m+J3daanHfu0TPvhigms+KrTQ=;
 b=VQkR5GgWRhGaWjgrCJEdNteY6eAPaeLwF5el4/zlIrcjw/KEuUtKVgo/c6VI/Sy84hG18+d2ZswuVNLi7AUjSKuC3bNMOk/7PclGtxu7Im9nLU9NeO7Tg6Yp2lrU/LbGRzWmBhPjygf851PzjusRmBqqgA4pX588GAG4XdJfTOArsiBTk/o9rjQjmvK7dczQZJkY8jzxC6WYsleegHEv5SOS+WzbGcQ45zQ6TcKBKgZ+4fDX0PpwT6EKKSlAKptT1Ss+XFplwHtElWG+Mi1O7AsvlkN79wtEL2x/3fXzQApg2D700zMj7eyw6r/jcsvJe4dFJYCQ62FmC0XlLPCUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef2c008f-7682-1549-8d27-712b04fbd84f@suse.com>
Date: Thu, 30 Sep 2021 10:51:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-11-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a6e0f46-c023-4d8a-45c9-08d983ef8750
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381C5EB325F0226EF637365B3AA9@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wku6kni5IrHHd+LGd/lOc6CegPEL6yeb/bRc3KwSQ9xSe/mESmPOwSdyA9ZorYieQqcbA7ru8dFHQzwfRrkSaWa41D4KRiy6xFz1jkcU0zlsdrTNKmQmwKMZsgAQs1pAkAm5C/P+o/TvnAxgsQ+rnBapDMnuP4QFEbXqhC2zsKBf55GDgps0xAh2DlWBS278S5I9qWakhRLUDEN7rnyq80XkXQFp29rPxKLazZNYdtMMNqUl96hZx4myVIsA/D1Ipn/vGxEhKdCkjlPjXkLfZ50WT/cwV8mrKjZmPCdII07boaVcgjMnteORb72lVuXgcYfdpcfseETIxSH2m/U0BtEcWdLaiqs+RgPfZU9SVdCDD13fhz/G0WzLdEh2JSiavdu2Xa494Fp9PpbslJ0BfcWYPiVsrK6oXyZ1fG1VcgyOLamuA1EanFdSL0ji+Y7fQJFiqvATWWEcQrj1dOeh3+nlG9ngimEWpcNOCDYHXzGlOKHSCbAH5vT0t3iT3k/dT9rq/TFyMEv4fe+X6b9fv7X7/n36jgvii1iF2Mlh5IVhG4tMt7YCU0f0SPMaagI0p9MWvBAFrCcc3CSzBcnUuiN+weg5kiZAjJH0oG37O3bDnmTF56xG+tf0Od63nFs1S+ZGKQlFv3T0550Lbm20JkL54lqyqNawNrK0r91/XXMjOpoTYXYzlYvuwbgHRxotTpDX1T13PKeDoTH/IWccStsvHlR0s6dBN2a93+8gnACYLA8MAo1JuUxHTtFcEX9x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(7416002)(4326008)(956004)(83380400001)(2616005)(2906002)(86362001)(5660300002)(36756003)(186003)(316002)(31686004)(6916009)(6486002)(8936002)(66556008)(66476007)(66946007)(16576012)(31696002)(8676002)(26005)(53546011)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZExYR0JsTVFjVW9mNVNQZDZGZ0NpMEttTkp0dENGVXFmUVBXTlEwUHZDYVFF?=
 =?utf-8?B?dVFjUUZjc2h0Sy9FaE1PTERNbldDS2JIZDBHaVYvYS8rbjlEUGt1V2NPSWpy?=
 =?utf-8?B?L0FTZkFhMUIzdlJuaGxZSGwyaFcreCtIaVhqbjVhOWtPVnM5UTZwQ1hSdG1E?=
 =?utf-8?B?TXo4NHArZjcvQzJOZlNpcTFySk5OR0x5WUtKUC9EL3RIaXRtWmlEYzZ4YVc2?=
 =?utf-8?B?SVN6ZzNURHYrdmpjVW1tR0NwbDhqcUkrMWh5NGVxbUlZSzk4eXJoWVZPYzhR?=
 =?utf-8?B?a0wvT2hsUHVIUTRnaXEweGJHb3RBbFR6VTl0NkU0aUVDMEtPZHUrZHU3NmJx?=
 =?utf-8?B?eWZmVUduNHFOMGxCUzhVUDc3aVJlWDkzdXFPV2RCVnpqTEQ0Y2pOdEdUTkJI?=
 =?utf-8?B?emRnZlBRQjBZUkY2d0pJNytHQUdrV2FMMjhFeEVYWGt4UnJsdW12VHdHU1NH?=
 =?utf-8?B?L1p2cDdBVUU3Z3BSTGdYRkV3bzVNb1NsNjg1N0lxbEpZSWRlWm9QRVZJZGFZ?=
 =?utf-8?B?ckFBU2szS3FnMFVmeTZOV2dYSFlDek0rbFVpMytPcDY0YWQ5TlR3Z3IxWVpO?=
 =?utf-8?B?ditZUTFZakN6WDNWVWNBZkhzMzBoa3RqOTZ4M0o1azE2ei82ZHlwMkxmWDh2?=
 =?utf-8?B?ZEtMSkpiSllBbm5aeGIvelkwRUNVWHg2REFMVGlvYlIwMlViRWczR3l5STVG?=
 =?utf-8?B?Y3Vrekw0UDZ2Zzg3Q01rUXpUaGdTUzBYOEw1TWlZSVFvR2ZPSGhpV090MGVy?=
 =?utf-8?B?YjlhZDlsRUo5VCtjUkkyOSsyS1huYjJlVURtUGdtYjk4MmloMWdIbW5BTU5a?=
 =?utf-8?B?U0RualUvblUzNmx1bVRXdEp5b0NON2FaWTI5ZE5tbnRybjB3MGk2L2x2N3VK?=
 =?utf-8?B?QlQyaVBYdzdIbG9yOXB5bmJ4MktEbS8zUzRGL1h5eE5sVnhLcVlZTWZpb3RB?=
 =?utf-8?B?UlNySEFXTHhVeHp5V2ZIclNaYkpzVUo4akwzM1owQXlHUzFMa1lGOEI5a3RC?=
 =?utf-8?B?cHRhQ2NzQ1pWYVY5TGY0eUtlaXg4SUI0eWVjVmx0VlpSL3VTcE9mV3U0RTQ4?=
 =?utf-8?B?UEtDSm1DVUJOWEl0SDNELzRKN1c2NktwbElTYW1KTm1WOFhxZXlUMlMvMmdU?=
 =?utf-8?B?eWNLaEw2dEE0ZFhka3RxMXYzTVZ2RFNJbWFUcVNTaW56cDRvY3NOVy9nVjBr?=
 =?utf-8?B?NjUvUklqbzlNay9CS1hJUzNqaFJ2elN2TCt5SC9xa2RKbjM4Z2llSTJ1MXF0?=
 =?utf-8?B?cWhQWTQ4WTFDekp0VVVkMW83NEx2YmpzWDRKUlhsSEtHM2ZxNXluOEIvWjNZ?=
 =?utf-8?B?bTIrVjhYVnJlOWExNEZNVDlEeWRFTXFMQURUUlVFTUJPaWUreDRFZ2FWd0dw?=
 =?utf-8?B?d0FGdytzMzVobGYyVEI2TlBSaTlwWnM2VGgwMFBjTTM1WFBqTzlib3htbXFr?=
 =?utf-8?B?YXBxNUt0WUJKUWYwSFBzOHVsMmcwODFGWURmT0hCRnZKN0YxaWlUV2FwSFdC?=
 =?utf-8?B?N0o5VW9FRjdNVFl0SU9Ka0F6Q3dycW5QdzRyamFxeDN3WWpPT2h2Nmczc0NO?=
 =?utf-8?B?OFpCVnpScjE1SGxneHZqVE04RlNqMnNDZWxobHZQdCtUM1k1SThKaE81WEdG?=
 =?utf-8?B?V3dRSkhIZFZxSVNyTmR4L3dRN2FQV3MzeVdhZkpCNWt4WkdRRGdEMXhrOWpR?=
 =?utf-8?B?d1BSSmFwci9GVGdUQU85bkRyWUQ3dVFkWGtIVkRzNTAwTGN5Y0NOaWRuVm5K?=
 =?utf-8?Q?ETuJMNylBaowW/2LB5r/uGjZwyPJcKljGtrP6aD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6e0f46-c023-4d8a-45c9-08d983ef8750
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:51:44.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcHPz3gaShV22XGrG849wfVkiRQNS6cAeTD1zNddf0QP5ODEDl0Eb7DXPG8G8tmTc1t562GmD/FKEOPPKZdtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.

This reads a little odd: If bus is already known (and I think you imply
segment to also be known), it's only DF which get assigned.

> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.

Or up to 256 when there are multi-function ones. Imo you at least want
to spell out how that case is intended to be handled (even if maybe
the code doesn't cover that case yet, in which case a respective code
comment would also want leaving).

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -831,6 +831,66 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT

May I ask why the code enclosed by this conditional has been put here
rather than under drivers/vpci/?

> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
> +                                                const struct pci_dev *pdev)
> +{
> +    struct vpci_dev *vdev;
> +
> +    list_for_each_entry ( vdev, &d->vdev_list, list )
> +        if ( vdev->pdev == pdev )
> +            return vdev;
> +    return NULL;
> +}

No locking here or ...

> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
> +{
> +    struct vpci_dev *vdev;
> +
> +    ASSERT(!pci_find_virtual_device(d, pdev));

... in this first caller that I've managed to spot? See also below as
to up the call tree the pcidevs-lock being held (which at the very
least you would then want to ASSERT() for here).

> +    /* Each PCI bus supports 32 devices/slots at max. */
> +    if ( d->vpci_dev_next > 31 )
> +        return -ENOSPC;

Please avoid open-coding literals when they can be suitably expressed.

> +    vdev = xzalloc(struct vpci_dev);
> +    if ( !vdev )
> +        return -ENOMEM;
> +
> +    /* We emulate a single host bridge for the guest, so segment is always 0. */
> +    vdev->seg = 0;
> +
> +    /*
> +     * The bus number is set to 0, so virtual devices are seen
> +     * as embedded endpoints behind the root complex.
> +     */
> +    vdev->bus = 0;

Strictly speaking both of these assignments are redundant with you
using xzalloc(). I'd prefer if there was just a comment, as the compiler
has no way recognizing this in order to eliminate these stores.

> +    vdev->devfn = PCI_DEVFN(d->vpci_dev_next++, 0);
> +
> +    vdev->pdev = pdev;
> +    vdev->domain = d;
> +
> +    pcidevs_lock();
> +    list_add_tail(&vdev->list, &d->vdev_list);
> +    pcidevs_unlock();

I don't support a global lock getting (ab)used for per-domain list
management.

Apart from that I don't understand why you acquire the lock here. Does
that mean the functions further were truly left without any locking,
by you not having noticed that this lock is already being held by the
sole caller?

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -91,20 +91,32 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>  /* Notify vPCI that device is assigned to guest. */
>  int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>  {
> +    int rc;
> +
>      /* It only makes sense to assign for hwdom or guest domain. */
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> -    return vpci_bar_add_handlers(d, dev);
> +    rc = vpci_bar_add_handlers(d, dev);
> +    if ( rc )
> +        return rc;
> +
> +    return pci_add_virtual_device(d, dev);
>  }

I've peeked at the earlier patch, and both there and here I'm struggling to
see how undoing partially completed steps or fully completed earlier steps
is intended to work. I'm not convinced it is legitimate to leave handlers
in place until the tool stack manages to roll back the failed device
assignment.

>  /* Notify vPCI that device is de-assigned from guest. */
>  int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>  {
> +    int rc;
> +
>      /* It only makes sense to de-assign from hwdom or guest domain. */
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> +    rc = pci_remove_virtual_device(d, dev);
> +    if ( rc )
> +        return rc;
> +
>      return vpci_bar_remove_handlers(d, dev);
>  }

So what's the ultimate effect of a partially de-assigned device, where
one of the later steps failed? In a number of places we do best-effort
full cleanup, by recording errors but nevertheless continuing with
subsequent cleanup steps. I wonder whether that's a model to use here
as well.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -137,6 +137,24 @@ struct pci_dev {
>      struct vpci *vpci;
>  };
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +struct vpci_dev {
> +    struct list_head list;
> +    /* Physical PCI device this virtual device is connected to. */
> +    const struct pci_dev *pdev;
> +    /* Virtual SBDF of the device. */
> +    union {
> +        struct {
> +            uint8_t devfn;
> +            uint8_t bus;
> +            uint16_t seg;
> +        };
> +        pci_sbdf_t sbdf;

Could you explain to me why pci_sbdf_t (a typedef of a union) isn't
providing all you need? By putting it in a union with a custom
struct you set yourself up for things going out of sync if anyone
chose to alter pci_sbdf_t's layout.

> @@ -167,6 +185,10 @@ const unsigned long *pci_get_ro_map(u16 seg);
>  int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                     const struct pci_dev_info *, nodeid_t node);
>  int pci_remove_device(u16 seg, u8 bus, u8 devfn);
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev);
> +int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev);
> +#endif

Like for their definitions I question the placement of these
declarations.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -444,6 +444,14 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    struct list_head vdev_list;
> +    /*
> +     * Current device number used by the virtual PCI bus topology
> +     * to assign a unique SBDF to a passed through virtual PCI device.
> +     */
> +    int vpci_dev_next;

In how far can the number stored here be negative? If it can't be,
please use unsigned int.

As to the comment - "current" is ambiguous: Is it the number that
was used last, or the next one to be used?

Jan


