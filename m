Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5475A6EF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566369.885100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNV9-0004QA-8y; Thu, 20 Jul 2023 06:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566369.885100; Thu, 20 Jul 2023 06:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNV9-0004Mu-60; Thu, 20 Jul 2023 06:51:03 +0000
Received: by outflank-mailman (input) for mailman id 566369;
 Thu, 20 Jul 2023 06:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMNV7-0004Ma-9Y
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 06:51:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8336724-26c9-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 08:50:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 06:50:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 06:50:56 +0000
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
X-Inumbo-ID: c8336724-26c9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auBNnELcrwK514pEalxTVhNwaf0pwymzwhjUnkaK7fTQbSGYz6EIH5UJzPxdQ/ppgbL+4tBO76t3RAzmf8rFHcvLHDppqF6P1tJ+mXs8cw9scrQeB8vmRpAagglW17l46RB4B4y723FuwepTWewFO+7apMaZ4tlOX6N/iy+4LNWYNpdz1OfEV+IFC5chThSi8s8orcV+2KukU7nNaJ7Uh5radxlXkullkU8hRhJge0ma0WghoeXfeuooMWVGaulGCMLSJNVGW6fRe1Qcvn8WE/ws9SRva5xoqCrlwJi5AoHJ5Q9+tNfekKZsmbK/EJZOkZA+AzdlDjVnntskhRLNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzPCDQ1G5kYuVruJltocpsHaYbMhVh5OnzVCm18QlOA=;
 b=oc9A6UJ+qJVztLb3QQyWVRCpwSnYeYDT/itVgHJErnxjlaEKh9f4gGsJ+MGpprf6q10J9L/a7KvpkKyMKoh540lQ9r1TfEh4pAApeLKDRyelDxlYICUfoXZuanaKHIpKkG8VM2G0Z62R278hNrodv6ILHSUqV4+vXQxziv8esm0DEqi6fZhCC8UOUFRUDUFfti5wD8fC8BcSrAz2gV8bpos9ytpvEMLV9A1l9i0xE2hS89L2xibyC+HWWzwlxVd59KlXp/F53pBKt0QR9Yx8ZSjpowul5GnskYOBEvWkySUr9+KhnPEMTPYIr6k+T6yteIMZSAuNWEgsIHXmhO1bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzPCDQ1G5kYuVruJltocpsHaYbMhVh5OnzVCm18QlOA=;
 b=VeQngbPU6ydAJnbUoZcqueJuYbrjlE7YKZRkbpTlyzAkeReKF8mggZwg72q4DufppH6Dp/JwpRzXjmsplKN3DUC0WPzZaANNGvffvBH/fV3fuaySBzxRevDJ7+vxJOdShdzC3q8dRkRI+nFHvkds3O8PPNnni9YtnQOoeSbKY5d60xyfPwgIr2P3Oio26b0q+5UX/Ut5h8f1MpPslxPLz99Achf2WDBGkqZ32D1JN1gBft6OB0Ajry+lGjb0GRYBwVwf6h9H8REmqnOEDS+LLx4ERSVlX4Ti9m8V+E/soxM2sj4wgUZg7e7tMVzwG3aobOW9RLkBoymKZWlPPI9H5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <414b65eb-1c28-7303-f9fe-cfe5713b9056@suse.com>
Date: Thu, 20 Jul 2023 08:50:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e31d00-3789-44c0-5c86-08db88edaaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tzKiHRZCSRof8CV6DgRXaRq6Vb9hLPL1unfOQOZKOLhbWkdobb/6ooZNHY5xxGTkc12NdfONPuXor/EHut8MdCZLhNKrH+YE4kKfyMA3aCI4vvpn9Xj1bPFHEWGIUpOHkTlRd7a+LBJWBVhbjgP5byEtOYJFkPk4DP5anKTTWKUPFlFNLeVZCqSWmj4sjxrOnAwVEDDR7IhfNWQIP3LOaIf/gjKZyUkPJMPr7w1mj55CUWoJPGZTIbEhjmYcYKtsIY9RjL0k8aAW8HeaAup+mkU0baGB9rOZImfqeX7M55gMO0MEExG9ZGCpdujQCFx9sB0/evaCvOW1AyztlQMA8MJjZ39XH64QkUJyinPJLq+KJLxR+1GlqFPTTtxkdEe/PydTnUI6OBfhkCueqP/E/9R79pAyuRXfHOUROvjvLLgK8nurODph1aiMU+DzmcvdQYxZ5JCF75iRlOJlL4hSLBH/ZYuCJyB9xDyDlteHmdMe/iVvFmknLiVxrBoDDnaC6mkWnkPD06Mtb5cyudQ8zSqv5Os3RtN0wCz0SGgXfYiUt+YxWtdpPrpxyOKqvC5mxB49olSmXmfmGBgExFTPQe2s5wa6iuGrgPQ7lK3XknqMcgFv366ABOSWQxA6W2Xf82+FUB+bxk11wksroYLJrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(31686004)(186003)(316002)(2616005)(36756003)(5660300002)(8676002)(8936002)(54906003)(6486002)(26005)(6916009)(4326008)(6506007)(53546011)(41300700001)(83380400001)(66946007)(478600001)(38100700002)(2906002)(86362001)(31696002)(6512007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDhHaWJKaFlLTy9ZdTh5OVFxK3hWSmFHbFZRNjZxdlhHV05RMys3RG5LMXZo?=
 =?utf-8?B?NTFFdmlaTHhET29lMTlkR2NtUVk3MlNmL0FWV2pOZmNLdUVlakVhQkhlWnFl?=
 =?utf-8?B?NXZTMnc0M0NTWGJQUjBvSi9IZFd3M2RBbWxtNDF0cG14NE80enpLbWo1K010?=
 =?utf-8?B?eFVvL1NnSnU5dm5jSHkraWhDWkhkSllGMG5rd1BjNHI5dTM3SFR6dW5PN1Yz?=
 =?utf-8?B?SzEwTlBrN0djT2MvTldOSzV6bHprQ2hjYk5TcTQ2V2tobGxGM2F2VXdnZXU3?=
 =?utf-8?B?MFhXYWRhM2tRZmRoUDUwZDUvaGJwajVYSGduUHJkR0FRSE1TMVI2OTQ5eGVM?=
 =?utf-8?B?WHE2Ym5iaVc0bnVYVFpFZmZ1WkF1NWwrdHdzQ1FnWU1Wd0NzblA5b0VrUk0w?=
 =?utf-8?B?bmdoOXQ2MWV3dVM0NnZRa3YwK24ra1J4MHFSN3RQYVdHclBGRE02cjkwU2VY?=
 =?utf-8?B?dStIOXNudjUrOWN1cDlnYmp2azJUNnRXanloK2FjeHFDbHJESGdWSnhENjdI?=
 =?utf-8?B?RiswTDA4UFk0NDVDT0FJcXpPTmpJcDhtSzZ2V1U5b2NsUEM1M3UrOHlYd3d2?=
 =?utf-8?B?NzZWNlc1WEJhaHVucVJtRFlvSjE3ZE9uc0xQWlNDNVFvd2xQNzZ6ZGJ4bkRC?=
 =?utf-8?B?U3FpWVdINkVHc1FTYy9RU0ZpSDRIcVN6MFIzSDVaZDlzK2VjYzZSaFFZVm5I?=
 =?utf-8?B?dmEveGY3WkdtMzVyK0d1L1dKbVBKOEJZQVlWQ3ZrSDdHREpwMW5EWHdycFhO?=
 =?utf-8?B?Q1h1dnAxTWZ6NUhGaGExUHppUDhDL09QYUt5RW9lOVNJWThCMDA1UXNXalE1?=
 =?utf-8?B?Mkg3V3UxSHcvbXV6Z2oyV29ONzk3M2YzOGVGc3F3MWtPVGgrVlJkZkJlNVJj?=
 =?utf-8?B?QkluSnNaWkJXdGdyN0tCNHhtbUh5cHB5eC9nWFNUTzlQc3FqcitKdVZTRm5Z?=
 =?utf-8?B?MGllMTdTNkEwTnBHZ3BXMXR1b01rM0pRcnA0eVNXcWVPUWxWUkhOSk5JaTR6?=
 =?utf-8?B?UHNQaTlzZFFFRmFqa3BLc21XN3FVSDh0NjY3NU5FYng2eUJLQVZlMkFocllh?=
 =?utf-8?B?RS8wcVFwdmtkc05GWEU0cFNGTU1KZUhmM2owV3R5QjV2T3hnYTg3ZTJQN2tz?=
 =?utf-8?B?RXFKWjZFaHNsNW5XYkFwOS95VDYybnJtTEF3dzRLU3E1NWhsZy9zemRoa09K?=
 =?utf-8?B?QVFlZDBOVjRIeXJnZ01Cd21PV2pkaHNDRS9rYWE1UEl5S1J0TXdrSHhmSnhv?=
 =?utf-8?B?YnUvdXRkNTBPUGVMZ0piZ2NWU0l3Ynp0MmdURUJ5eE1odXlXNnM1ZXZPdGxS?=
 =?utf-8?B?N1Y5QklvZlV5VnM4c1ZHSjkzTkl3SWxmc0kvc0Y2T0tORFVNVjdicDUvaEE5?=
 =?utf-8?B?QnhROGJRc2NOUnpVNW42bW9BZ1VHRkREZkxtSGU1Nkx5WlA5M0loSEtMT081?=
 =?utf-8?B?ZGtZaVIxZjJEWEprN0N1dFBCMTNkeDgwRGlOTS81VzRaQUtNY1NlWUtuWVFN?=
 =?utf-8?B?M1Z4anBhOUJTUENHSTlxNXkzaUducGdjdmZZTjZZTCsraHhtaXV4ZmZHMEZu?=
 =?utf-8?B?MUJwNm1NcTRKUHRZdDVmN0UxWFNJa0ZNWGZKOTNqOFdRSStXMklKVEJLTTk2?=
 =?utf-8?B?TlM0Q1hLRjE4NlBsWkMyOXptUmxGOGkrSGpDNWVBSXB5SWNvSlhtOTN2NUs3?=
 =?utf-8?B?T3duSVJVdE1FV2kzOVZKZGdlbWRJVGRsMWFYd05vWlQvbERxRmJ3YnRGZEdW?=
 =?utf-8?B?enAwTFFwaVBrY0tqSURra2t6bVdXL0l1MDhDZVQ5a3pnWm05cWlNUVhVUFFr?=
 =?utf-8?B?SUFHcngrelVXZ2o1Y1BMZ3RYYkFrOThoOHAwT2h0VWdxSmQrdXB3RnFFaWdH?=
 =?utf-8?B?SDAya3hTckw3WDN0aXYvUWdhTlVOb3J6U2RFMGhEa2dwanZwWmdzUWFpeHVp?=
 =?utf-8?B?enJLZDdkNW0wZzJBcVlMdTVydTF1SUZxeElmaGUvRDk3VzhpOGxMSFgzd3J5?=
 =?utf-8?B?emxoQnFSRGFQKy9QMGc2cE1mTG0vZXUvZkJOOHBmLys1Q3Nvc24yUGs3Y3hL?=
 =?utf-8?B?STJsb3g4V0FpMStNSkJkZ2ZSM1hBTEg5WFBGTEFxTnVXWS8rdEdON2ZmdHFw?=
 =?utf-8?Q?MoE/DTewcnyYXY/yHGl1y2C2Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e31d00-3789-44c0-5c86-08db88edaaf0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 06:50:56.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6UEg/3B/IBc8Aozu/m7PBM9nRlqsYifQtq2e5Cwa3kblX5acBIBIAtVTkJlziz3iMYWO5i+6XmWVlBACp/shQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -46,6 +46,16 @@ void vpci_remove_device(struct pci_dev *pdev)
>          return;
>  
>      spin_lock(&pdev->vpci->lock);
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
> +    {
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +        pdev->vpci->guest_sbdf.sbdf = ~0;
> +    }
> +#endif

The lock acquired above is not ...

> @@ -115,6 +129,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(pcidevs_locked());
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    write_lock(&pdev->domain->pci_lock);
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +    {
> +        write_unlock(&pdev->domain->pci_lock);
> +        return -ENOSPC;
> +    }
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);

... the same as the one held here, so the bitmap still isn't properly
protected afaics, unless the intention is to continue to rely on
the global PCI lock (assuming that one's held in both cases, which I
didn't check it is). Conversely it looks like the vPCI lock isn't
held here. Both aspects may be intentional, but the locks being
acquired differing requires suitable code comments imo.

I've also briefly looked at patch 1, and I'm afraid that still lacks
commentary about intended lock nesting. That might be relevant here
in case locking visible from patch / patch context isn't providing
the full picture.

> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;
> +    write_unlock(&pdev->domain->pci_lock);

With the above I also wonder whether this lock can't (and hence
should) be dropped a little earlier (right after fiddling with the
bitmap).

Jan

