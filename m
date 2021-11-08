Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358D447E8C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223258.385896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2Y8-0005go-Ee; Mon, 08 Nov 2021 11:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223258.385896; Mon, 08 Nov 2021 11:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2Y8-0005dg-AO; Mon, 08 Nov 2021 11:10:52 +0000
Received: by outflank-mailman (input) for mailman id 223258;
 Mon, 08 Nov 2021 11:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk2Y6-0005dG-5T
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:10:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86d64526-4084-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 12:10:48 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-5cFkEhHWOY6H5HSiY8Q6Yw-1; Mon, 08 Nov 2021 12:10:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 11:10:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:10:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0011.eurprd05.prod.outlook.com (2603:10a6:203:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 11:10:42 +0000
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
X-Inumbo-ID: 86d64526-4084-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636369848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvAGoe391StPaIngK1M3IcM1yPYh80+GCkggRfZspwo=;
	b=BxFjMjf0cVcQETu02dU7RQ9QrOuxFCTh1/bZZBIfd4+D0RIxjzg3mM2ge1bgxAoTx+gE8p
	/xrS5aph0kPo93pCknQqtHkp+xKS6PdQrpmkrPJeFl1TjLJIJ7W+3KepELZJQUrggtfyI9
	c96kPiXvQeUa4obKmnCjEJPAxxtdBCQ=
X-MC-Unique: 5cFkEhHWOY6H5HSiY8Q6Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n74x934Qf9YyCl2P1lfTc7JDpWuPjlbTgyzSE2DX55jwXTMkPwYm8c/5YKJoTzOJ8S1g7ugKAlIeH8LzcICJUiKM1l5ostKHnZ/N40iicTGwlBPhb4QrPRQwGq1T8EOMrWcJnqa0zGx2PaWoNs0uNMLXJwB7txHQyOOUNphPRvDUbvEuwByXsHFE5CdpLAZIeMnerFl5n57L5+aZ03XLP8nTxreaOFu4GylStg7w6BWRXG8F6rzrS6da0ENWkyGXom2V8XewaQ5jhstfDhoZPLSLvLPZVS7TyPyE+hA1Izuog9Se1wOoUuqSkbavc1eabjnjIjDqGu/9l8wg7iLg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvAGoe391StPaIngK1M3IcM1yPYh80+GCkggRfZspwo=;
 b=fyiJEuu6BL+1ZLWXRGXxrXusW+ISOtgficsv2pZ2h+AmsYWqXITHDKQ0nmMf4AAG3A1aGM2MdW/+dfx+Y7dpA7Dxp+PkOVnBfOA70VdiiUB0+QNPCB95RXUms9zSFg+S+koLnxIP6Ygv4ariAEghvP1OfImd0J2FBlD43zXedu8WadT6umdLOMaO9HnCLMqfM/RWCbbKAt+E5FlMBikKPj01ANLupLwQzNyY5m/xgUuNhi7HaR1T6iQPOQmD83Pm3IaIdGiCpQ45kfpWlgW68g1bqXDXDDzNiLCuAm7cJPbcd9CcR2S7CD5lVRc+qzHbxFxi2FwdExfqfA7mwRTOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
Date: Mon, 8 Nov 2021 12:10:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-12-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:203:91::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d9218d-cd03-488d-2932-08d9a2a8684c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64774B9BDE0CCB7272E5713DB3919@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RgWkaJdKLczcIQbI64jtqUBgjHjMAzZLFl/aIRTUy8qys0OKa0St5fuyKV71i5XsAq3PmD6MW6c7qyg4VU75CoM2T/KBp1jGqXMfx9nYRiDLXq3bp9itALJ9NCpPLW98+ZjBdCXDZeqjHqP9e4GM5xpxUKezAyDvQdefvdpV7FaU+6ZoMggL9y6WyeS/0T+dQrIDItB19ZsDpXLEd4Kqb6a285L2EK35UDh2K1fqqXdio8szYIhq+pA+k5Zb7Y2ovAXxHmqALD0uh+mMVvOnWdlKf7ZEdoVYjOzl3Ct1mGi8xEYyI1foDid/te2RiOK56bB9Rimm4vONbG/jQ4wlM2Tbe5azOMIvu6cIo0Sr5I0XqWkCiHoAPM1qFRTFEFiZbFPbs25ByVJaB3uXx4ng7m9oiUJ2wvdvpQqn1BiXUJGblMMWCcryNrCqkco9KM6Z+FeODJjKuj+AC4EBe+49TPWy4I4kctF9+ds+swQ/5U0aMqFNKLNpbZCnUtdZ06SvhhvefwYvaQg3kEe3nQDN2E7du/IAUCovBD4uEKqUY7R48NZyyoqI9Mx1TbbTWL/P29dbLALz1Uj9RmTHwiF4/ENnq9CDjAoQ+EILMG8TzrIfEWOju8SAz3gnAmY6kKRU8tx2K0wevOUbHk4BPhSgoK6a2xeLLyZh45Fed9XiME9h1K6WIdK4sx/sab7vmPxWbd/GJa7oWF+CuoJhn5zG8jERaXRBMz2nPuiqefqe8XjSZxXyifvyt1KU7qU1TYQr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(66556008)(83380400001)(956004)(16576012)(316002)(4326008)(31686004)(186003)(26005)(86362001)(53546011)(6916009)(8936002)(8676002)(36756003)(7416002)(5660300002)(38100700002)(508600001)(2906002)(2616005)(6486002)(31696002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhMdDc5TlJqOVQ1RGJVL3FvU3Bqb3F0RElyUWtESHpLNjUwZjBNRGtTVlBo?=
 =?utf-8?B?VHlHenR1N3FtOTdIYS9YMFVZMm5Ic0g1T085T2tESXFmZFVCdzdVRC9STkNU?=
 =?utf-8?B?UmdmSk9UbWhFR1B4cCs0bFRDMFF2eFRCUVVXQjAzd0xjU2QvYUlxSXh4aUxS?=
 =?utf-8?B?WmVkRml6MEl0b2RZVXNZNnJSTGo5blVUNnZrcENzYU5vMmdBVk40SmI5bVQv?=
 =?utf-8?B?L0ZXblBCcDIxamwzSkdRLzZocXhHclZ4dTV0UStjRjZ1VitwU0RFZVRzL25l?=
 =?utf-8?B?eWdUSm9EelhiWG1RMUtib0dJbGwxV2tGVnE1ck9lUTAxTXhWREJCZ3FtOXpx?=
 =?utf-8?B?c3lTV3REaENZVlZQbVdyM2wrUkE5SDU0UVFCcFFxeFpzVm9RMXJXZHlnejkz?=
 =?utf-8?B?OHAvRnMzRk9YMnpsV2ZXVmp2VXdSSldoMVJPRXJSM0V4UjViK3BYcHNHY056?=
 =?utf-8?B?QnhDSTNPN2JqOURNNHh0emJ4Z2RXblJXanpCRFdhL2xIbGhqRWZRZDcvU2My?=
 =?utf-8?B?R3pmamZ5Uis1TUpaY3FKaWFYRkJzQWM4M0o2Y2JrTXIzVTNGaUNoVlJNNEdU?=
 =?utf-8?B?Qy9ocUsxLzBFQmZXQ0ZQWTZiOHRkb2ZQaW9hS1IvUjE3Q0FqVG1zR2dQTDQ5?=
 =?utf-8?B?YmFycEd3cEdsajZ5cE9JZ0JYQ2J3Z0s1ejBzZkpsblgvSWR1M0xLTzlIRHpn?=
 =?utf-8?B?QjhEbkVpZkJCRmZOL2RaNHM0V0xJOEsyTDd0TlFteW4xKytnRjZZLzlKd2ha?=
 =?utf-8?B?NUpEK2VBSnpjQnhaWmdibFp3WUtOSVFRUFdJVGpEZ3Z6QjgyMXo5NXJHRGlt?=
 =?utf-8?B?TkVZNS96MkY3eE1tT09WMnJKSGJBZFg3OXA1ZlJHV2U0b1hWTVdXSktkZnRS?=
 =?utf-8?B?SHJ4M0EvaE11MDlpdWdKR1dDT1NtMnJFTm1XZDF0U0hmeGgyZHltU2c0Q25t?=
 =?utf-8?B?dUFGLzV6T3dwUDNCSUdNbmdUSmNyUU85Ykl1UjRzblNCRTIwNC9uUEpEOTJ6?=
 =?utf-8?B?L0NvWmU2MEUrd1ZFdENZNHk2ais1REJMSTVZSW9XcjVPaml6REJ4b2F4Q1M4?=
 =?utf-8?B?dGt6Q1lrTFJZakZVNFRRU0JycHpzSkFlTWRLeUJJNVM3S284NFZRei9ROThO?=
 =?utf-8?B?Yy9ia21DZ3A4WHc0SW1Fd2ZDVFBxV0VVRllhR3VwR3RZY1Z3NURtK0g0NUhI?=
 =?utf-8?B?SUIxVjN1SHpKSjFleHVMMVFJSm94bmJqek9kN3lCd3AwNkRmMUExSXl6RndY?=
 =?utf-8?B?TGxpcklUNVhsRE9CWUlnNFBtMDR3eDN4ZElINlNieWIwbkQrdHhuK013NDND?=
 =?utf-8?B?MmNudlE4eHJOQUFmejBmbTVCcmUydVY0Q0RHRHg2MEJYR3FHWnNmTVNXTHdq?=
 =?utf-8?B?eEc2NldYcVE5VVUrbVJFeWZXMXM3NEFBTnluTFlTdlZMZjZnZ0VGMk9vaHZv?=
 =?utf-8?B?bXdxajhPUEZta0RaVVc3emd5WEtibUpjbWgwRnpCbmpxdFBwMVplSGZEYk9k?=
 =?utf-8?B?SzVKL29NSkxTdWEybkUvT3ovVlR1bVhEcGZYVWt0VkRaV2tWNTBpUHhjd0Jn?=
 =?utf-8?B?Z1ZlRTMzWHlhOVViTDJJdVNUKzlGd0Z6aWtvR1pGVDNCYnpBakdaT1RTdzJz?=
 =?utf-8?B?RUlMaGtzaGtLai85R3VZblovdHc1a2ZOeHFzdzdvY2tFUkI2TXRVTVdCS2VZ?=
 =?utf-8?B?Z2J1c3RpUnd2YlNVSU9vUjlFL3IydHdIVnpjSWwwVlFhcVBOOWkyUDFoaGlR?=
 =?utf-8?B?VVkrWmhGL0krMmxlSEdTSGZtZkFkMDc4OHVBM2p2SkoxQ1VjWkNwNUNGWUM2?=
 =?utf-8?B?U1RncTY3MHozUTBtcUVyMlJjL2Z4NW9nTEFiTmNzWnpBRVpZWnd3Vit0Zlcr?=
 =?utf-8?B?bjVZSStCa2RON00yc2Z6WWRHekRabldYdHV4dml2c2x2MFFCNTNENE5vNWs4?=
 =?utf-8?B?by9NM1RrMjZicFZGcjBoSVlGOHBmbmlqMlVjWHNsbWFJVTRUYVlPeXBRaE4x?=
 =?utf-8?B?OHRUNTJ4MjRzSEx4VEozNG05QVYyQXZoT3BEWnR2NndRckpIcDBKTzYrb2VV?=
 =?utf-8?B?SEJyTDR4dHh2U0NoeWZUbk1oWmRHOXZGTDgxc0lua3o3UlI2OTRMaFNJVVF6?=
 =?utf-8?B?cWI3NEd2emlqUnpHbXVFL1hLc0sxNG13SmNVdnVoTFROaDR1WjNodnpQQ2Ft?=
 =?utf-8?Q?X0OqM/E3f3VmwLh4a4kOb4s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9218d-cd03-488d-2932-08d9a2a8684c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:10:43.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3hP04mYLNZetNY2ghTq4vZ9zpZCy6DrQbR7NvY1o/t6lH4pYEsyA6mRKRujgRNvqONaFFNGxqtx+Y8eEAkJzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -41,6 +41,15 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;

Nit: Indentation.

> @@ -59,6 +68,15 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      struct pci_host_bridge *bridge = p;
>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;

Again.

> @@ -172,10 +175,37 @@ REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);
>  static void vpci_remove_virtual_device(struct domain *d,
>                                         const struct pci_dev *pdev)
>  {
> +    ASSERT(pcidevs_locked());
> +
>      clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
>      pdev->vpci->guest_sbdf.sbdf = ~0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)

const struct domain *d ?

> +{
> +    const struct pci_dev *pdev;
> +    bool found = false;
> +
> +    pcidevs_lock();
> +    for_each_pdev( d, pdev )
> +    {
> +        if ( pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf )
> +        {
> +            /* Replace virtual SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            found = true;
> +            break;
> +        }
> +    }
> +    pcidevs_unlock();

I think the description wants to at least mention that in principle
this is too coarse grained a lock, providing justification for why
it is deemed good enough nevertheless. (Personally, as expressed
before, I don't think the lock should be used here, but as long as
Roger agrees with you, you're fine.)

Jan


