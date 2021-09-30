Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3A41D55B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 10:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199600.353760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrK3-0005Sj-Gz; Thu, 30 Sep 2021 08:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199600.353760; Thu, 30 Sep 2021 08:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVrK3-0005QS-DY; Thu, 30 Sep 2021 08:21:43 +0000
Received: by outflank-mailman (input) for mailman id 199600;
 Thu, 30 Sep 2021 08:21:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVrK1-0005QM-LJ
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 08:21:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fa925f5-21c7-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 08:21:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-HRyeKV5vMCKyNBtJ0cSiqA-1; Thu, 30 Sep 2021 10:21:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 08:21:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 08:21:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:20b:313::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 08:21:35 +0000
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
X-Inumbo-ID: 6fa925f5-21c7-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632990099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMUnRCvzD2pwGQ80VOLu5qbV6OaD3jNYdij6ak0Egf0=;
	b=FiMtZYO8dHkaD11qYVZajFEDkroJX6Xh0EYV+WgIqCAwlgBbmVzFyorWVirRfWTgKQLL11
	+sBiyZ3pW0RnJ3qfleX2EQyENq3aR+B3w2Tr354FGjk81q682ryxoYpn80Lk6OsWOJMYjX
	02YoCAFtr3pVoAVeXQUV4uAcjR3hI7A=
X-MC-Unique: HRyeKV5vMCKyNBtJ0cSiqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z70nkyE8g8ZVYEvfx42U8bjbazRoTUSA7o6PrG0cq9g+m1lAzkOn7OPkWZ1vvjTJjrxotKrTGNygWYKWWQuweF8kklm3ECPH+jO138+o2qfxLs1Vldx6LpW5yxhhKbEWzHIRtn/OXlnO/cJlNn+J4inZpoXl3wINfzaDTm/XpbA5+n/PuCMKhVk54RLiQvhDPly33OWufTkcRJ3Rz1XAAB8IiDK8KNYHbRkgYjDFDshzxZCsDEPs/wdDhNNdjvsVvFHB1Jj3TSto9lsZY2QIIbujSmOFkPAAKEktA2PzTdQTUY2lR2WfICMVDqUN3DH6V4B21+vv2Fxm9iXLywk7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JMUnRCvzD2pwGQ80VOLu5qbV6OaD3jNYdij6ak0Egf0=;
 b=jglEKsWRqJHMoJ8w+6d/Q6f7l71cuzTvLaRHgTqtDXTRKZiNn4bhmuVagrTzsSnPjUmSrs1YnfnV1zXy0oS5Ew6eRURUHHt9d7+lsIMFQpSEL3XoEMgR/Vr4F/ggKaHfli7yNkP9AY2LU4g+0ZgKzsNgYFJOenQp2Og/BBeHO/ClE1IMe8Bb7KOQcsRYKKWAI4Lhn+i3fOI3U9A28SVvQIcY/oEAlUR38fqDabxaPoDgGgJ0zz/jcPJiMQLMEtjtxSDa/Z03ZnVpr1zKD6LdVAMk5hGEe/ZW0DDJvu23TCBvRL8W5gcyqSiN5vlVhIFxVg3k2wgY7r3IttfdGPmmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
Date: Thu, 30 Sep 2021 10:21:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc0fe0f-a1d7-4d3f-3ffc-08d983eb51ee
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5326A8A5C34879206BF758C1B3AA9@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wjhjvsqVwxgIoUtGMdGdqA/8Q6kuWJX1PKARUB312mFgXRXcSd1erLpww9IC3whEPS66eMsT5zko56JA4YSgyEVwAd2VayOPZCeY43awkryRzhjnoFFADVtVWiAA+4xl0+2t0FX4XE3nMZioMc0i6gsMDCgVC6NYK3xdoHZD/SzCddeYDpsbf8mlWSwwDQ4ahnNwmwhC9QFuEw7DJkgjayzEA6kkbkRx4Mm4V5nY1HPC1QmKmWXsd5Epktubi7Dvt48EMuEpDbpNrhNHwDjKsbkK92cDNLJp0jhYRS6QCU7SMlemyp/qsRlfBTWI8coQCs89P7cMBGXOZBosXPCs04+KReInnUBckYQfRON9Qwa08ucDuCaDWkVwHj0NZLhPxTOgMwPYq+TCqj5GWqosaGQ1KalIwytFU/AYcMGvRkcfLkI6NsXn7AMomivQozztBiZ3uxhUSFDRLcMAF5mZcIG3+FvFUebBj6MeY5iuBaJ59+ucy/tZ7QatTh8uFa8xUFU/6IIPgFdVqfw1UJT3e/xzoWd/htVzKkCHo1CqMLCOYouge+GJ7UGEHzreGugUIplrf+yyzP9hkmUd946FowzBnU7faXgENxhnph1QOiaf3k1I6xC34sLPUg9mu8RlOi/NTPALSSKKXlDp/QX/vEE85TpS8acZ6QFFZTHge4HxGUg09tTYeXKLJP2szrR0Ieu2DGal1zflWCISRRm1a5FsGy+zpFTg/7aGXqM511c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(8676002)(26005)(5660300002)(186003)(8936002)(53546011)(36756003)(2906002)(83380400001)(7416002)(31696002)(316002)(31686004)(66946007)(6486002)(66556008)(16576012)(66476007)(2616005)(6916009)(508600001)(956004)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVKcFVjN2RmMWtBNHhhZ21RL01KZjZoOEtBOXkxM2dLT24yWmVkQ2NaZzhI?=
 =?utf-8?B?dnl0clYwK3hkZVdhckNFTFJ2VjJhYnJJeGVJWS9tcmE4OEhmNW9LOGhWOUtD?=
 =?utf-8?B?SVgyb3VraUgvMWtWVCtCem9TYWlxSWxzQldhZzVaN1VTSzB1STdrMi9WalE0?=
 =?utf-8?B?SVg5ZDl3YWpxN2xFUUYycW92YmFtRE9uWUxKclJPZFMvQ25uQ2Izd2FIY2hM?=
 =?utf-8?B?eDNaZjY2Ty9IczQzZGN5REQyMGZHWXI2M0M0eXBiUkRrRXU3bXFNU1JZa2Vq?=
 =?utf-8?B?K2hQUEdoUE9RMks4VjUrc1RWdTFJTS9oeU42VVFVSXBLS2x0Ull0Rzh3RGxF?=
 =?utf-8?B?MXlrdWVXT3FwT3VGbTJGa3k3RnpjdE8ya1FGcnBBbTR4YnRhTjM4RjVWcHZl?=
 =?utf-8?B?WXdkQTZ2c0pTMENvM0JMdWNha3N6ckFqTnBraGxUemdzeXQrRzhpKzJzYlE5?=
 =?utf-8?B?OURRT1dwdmhuVUZEZFM4SWtOREZuT0Ryd0ZEN1ZBNExUejkwZlBDVkZZa29L?=
 =?utf-8?B?VXVlT3JhV2p2U1NiSzVmU0dOUG93Ujg4NmFmcFA3YU0zVmFmaVJUY0dad0J1?=
 =?utf-8?B?WGZqOVI4bjE4ZmlXN2JOMnI2N3JWUGtrRjU2VzhiNXRZMGl6ZEIxL2hra09C?=
 =?utf-8?B?RDQ1UmVoZGJCaEhqdFh1WSs1eURZRHVDUFJoQURIMzV2S29ycHBzSDNIUGRS?=
 =?utf-8?B?M1pjdnR3SW9OWlUreXBpYXcxZnFkWm44a2Rrb0VoUEhpWnI3SVdLbm52QVJw?=
 =?utf-8?B?eUZDays1NlB2SExST3YraFpsVjBmaWE4cHJROVFzQjIzMlR0dDJDeUtvT2cx?=
 =?utf-8?B?RXVVVy9QaEZlWFZqMDNTaEJNTW9EeFNsbGNxYzVWSnF2aGlkQ0VZWW9kbUl4?=
 =?utf-8?B?OHpOOFcwamVZMlFMak9WZnhjTGtpMWJSaEFxZFBqbXZwcFc3LzlQcHgvWGtW?=
 =?utf-8?B?SDU2cENoZ1J3UHZEcEdORGtYVzdQZW1NN1E4OVQ5Snh0QTI0TncwazIyb2hr?=
 =?utf-8?B?MUNLcVdKZWJURjU1dGlqcytWS3NvTkxjZHJ4Um50MW9GQlF3RTBFRjJOMG9Y?=
 =?utf-8?B?ZFVBd2RRdVA4eitxZ2Z6bTJnSFJXR1JMVXY5eDZSNW12M2xBOHhWODJlWndD?=
 =?utf-8?B?REFaVGtPZHNGdlVZRExXUzhoZEhsU1E1THFsd3RmY0ZCc2U5TzVMOERydDJP?=
 =?utf-8?B?ZTZzQUxsaUI3a2piaDJOVXpwWCtzWU5RUGZjd203Z0ROLzJWWFJsOVJnNDEr?=
 =?utf-8?B?eDRnOTRuSkZVaHUrWlJlNW9yV3I0Y0ZBbUFEcDNPVXlaTVMrTnUzeVdWSFI1?=
 =?utf-8?B?YlIvQWdIYjA5SjlTTkQvQmVFVjdndzJvMzJBNlVONG1ZWm1QUEVhays5eVZL?=
 =?utf-8?B?M3FyMzlFOGRvZENZL0pIbEd3dGxlS0QwZUE4OVIvaHlJaENPQURRL3NEczZy?=
 =?utf-8?B?dnJLR1dSQnRHbUdSdlk5WUJwK3F5MlpaMk8vNFFQbTliQ1dNdGk0QXZ5dC9m?=
 =?utf-8?B?RVltMmdjQ2xMUGkwTjdlZGlNKytVNmxDcjkxOEs1bzgyN0FFZWljYUdoOStE?=
 =?utf-8?B?SStNZ1NKMy8vWUlGQ1ZXQ2JFenZvME9QTDJyb0d4WmlTTU5HaDdkUjZ4ZHVW?=
 =?utf-8?B?WUNvQkxYekUwWnYydHNwOVZ0T1lieTFrZCt0QjV4RHByMUk0ZHZWc2sybVg0?=
 =?utf-8?B?VGNiUUUxZHhBOFlFSVpUanNhVktFc0dsMFprTVcvRnVncVBFTGkvQXdrWHkx?=
 =?utf-8?Q?e6yUa34FM82k+t2LcUjYYvebjbIw1igQOJplanv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc0fe0f-a1d7-4d3f-3ffc-08d983eb51ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:21:36.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbyo1GoHCVpEXco9OQaKubgiiIVf1ONK24v44R7/uqrn4px69YHMJ/9VdDk5Z8fU1u8qLSMuML/txCReRDRdOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Please note, that in the current design the error path is handled by
> the toolstack via XEN_DOMCTL_assign_device/XEN_DOMCTL_deassign_device,
> so this is why it is acceptable not to de-assign devices if vPCI's
> assign fails, e.g. the roll back will be handled on deassign_device when
> it is called by the toolstack.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 ++++
>  xen/drivers/passthrough/pci.c |  9 +++++++++

The Cc list does not match these files getting modified. Please make
sure you Cc maintainers, so they have a chance of noticing that
changes are being made which they may have an opinion on.

> @@ -1429,6 +1433,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>      }
>  
> +    if ( rc )
> +        goto done;

From all I can tell this is dead code.

> +    rc = vpci_assign_device(d, pdev);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -86,6 +86,29 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Notify vPCI that device is assigned to guest. */
> +int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
> +{
> +    /* It only makes sense to assign for hwdom or guest domain. */

Could you clarify for me in how far this code path is indeed intended
to be taken by hwdom? Because if it is, I'd like to further understand
the interaction with setup_hwdom_pci_devices().

> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    return 0;
> +}
> +
> +/* Notify vPCI that device is de-assigned from guest. */
> +int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
> +{
> +    /* It only makes sense to de-assign from hwdom or guest domain. */
> +    if ( is_system_domain(d) || !has_vpci(d) )
> +        return 0;
> +
> +    return 0;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

At this point of the series #ifdef is the less preferable variant of
arranging for dead code to get compiled out. I expect later patches
will change that?

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -242,6 +242,26 @@ static inline bool vpci_process_pending(struct vcpu *v)
>  }
>  #endif
>  
> +#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_HAS_VPCI_GUEST_SUPPORT)
> +/* Notify vPCI that device is assigned/de-assigned to/from guest. */
> +int __must_check vpci_assign_device(struct domain *d,
> +                                    const struct pci_dev *dev);
> +int __must_check vpci_deassign_device(struct domain *d,
> +                                      const struct pci_dev *dev);
> +#else
> +static inline int vpci_assign_device(struct domain *d,
> +                                     const struct pci_dev *dev)
> +{
> +    return 0;
> +};
> +
> +static inline int vpci_deassign_device(struct domain *d,
> +                                       const struct pci_dev *dev)
> +{
> +    return 0;
> +};
> +#endif

Please put the __must_check also on the stubs, or else people only
build-testing x86 may not notice that they might be introducing
build failures on Arm. Then again I'm not sure whether in this case
the attributes are necessary in the first place.

Jan


